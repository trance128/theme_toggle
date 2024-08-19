document.addEventListener('DOMContentLoaded', (event) => {
    // Function to set the theme
    const setTheme = (theme) => {
      if (theme === 'system') {
        const systemTheme = window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
        document.documentElement.classList.remove('light', 'dark');
        document.documentElement.classList.add(systemTheme);
      } else {
        document.documentElement.classList.remove('light', 'dark');
        document.documentElement.classList.add(theme);
      }
      localStorage.setItem('theme', theme);
    };
  
    // Initialize theme
    const savedTheme = localStorage.getItem('theme') || 'system';
    setTheme(savedTheme);
  
    // Listen for theme change events
    window.addEventListener("set_theme", (e) => {
      setTheme(e.detail.theme);
    });
  
    // Optional: Check for system preference changes
    window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', e => {
      if (localStorage.getItem('theme') === 'system') {
        setTheme('system');
      }
    });
  });