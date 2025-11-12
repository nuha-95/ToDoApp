const { test, expect } = require('@playwright/test');

test('create and verify task in UI', async ({ page }) => {
  // Create task via API
  const response = await page.request.post('http://localhost:8000/api/tasks/', {
    data: {
      title: 'Playwright Test Task',
      complete: false
    },
    headers: {
      'Content-Type': 'application/json'
    }
  });
  expect(response.status()).toBe(201);
  const task = await response.json();
  
  // Visit UI and verify task appears
  await page.goto('http://localhost:8000/');
  await expect(page.locator('text=Playwright Test Task')).toBeVisible();
  
  // Clean up via API
  await page.request.delete(`http://localhost:8000/api/tasks/${task.id}/`);
});