from PIL import Image

# Open the original 8x8 image
original_image = Image.open("blue_image_compressed.png")

# Upscale the image to 80x80 using nearest-neighbor interpolation
upscaled_image = original_image.resize((800, 800), Image.NEAREST)

# Save or display the upscaled image
upscaled_image.save("Big_blue_image_compressed.png")
upscaled_image.show()
