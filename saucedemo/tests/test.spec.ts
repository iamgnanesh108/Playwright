import { test, expect } from '@playwright/test';
import { chromium } from 'playwright';
import { parse } from 'path/win32';

test('test', async () => {
    const browser = await chromium.launch({ headless: false });
    const page = await browser.newPage();
    await page.goto('https://www.saucedemo.com/');
    await page.waitForTimeout(3000);
    await page.locator('[data-test="username"]').click();
    await page.locator('[data-test="username"]').fill('standard_user');
    await page.locator('[data-test="password"]').click();
    await page.waitForTimeout(3000);
    await page.locator('[data-test="password"]').fill('secret_sauce');
    await page.locator('[data-test="login-button"]').click();
    await page.waitForTimeout(3000);
    await page.waitForURL('**/inventory.html');
    await page.waitForTimeout(3000);

    //await page.locator('[data-test="inventory-item-price"]');
    //const prices = await page.$$eval('.inventory_item_price', els => els.map(el => els.map(el => parseFloat(el.textContent.replace('$', '')))));
    const prices = await page.$$eval('.inventory_item_price', els =>
        els.map(el => parseFloat(el.textContent.replace('$', '')))
    );
    const max = Math.max(...prices);
    console.log('All product prices', prices);
    console.log('Maximum price of the product is ', max);

});