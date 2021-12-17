Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCCDB478DCE
	for <lists+linux-media@lfdr.de>; Fri, 17 Dec 2021 15:29:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234925AbhLQO3f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Dec 2021 09:29:35 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:45381 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234682AbhLQO3e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Dec 2021 09:29:34 -0500
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id DB0C8E0014;
        Fri, 17 Dec 2021 14:29:29 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [v8.1 3/7] media: i2c: max9286: Use "maxim,gpio-poc" property
Date:   Fri, 17 Dec 2021 15:30:18 +0100
Message-Id: <20211217143018.41653-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211216163439.139579-1-jacopo+renesas@jmondi.org>
References: <20211216163439.139579-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The 'maxim,gpio-poc' property is used when the remote camera
power-over-coax is controlled by one of the MAX9286 gpio lines,
to instruct the driver about which line to use and what the line
polarity is.

Add to the max9286 driver support for parsing the newly introduced
property and use it if available in place of the usual supply, as it is
not possible to establish one as consumer of the max9286 gpio
controller.

If the new property is present, no gpio controller is registered and
'poc-supply' is ignored.

In order to maximize code re-use, break out the max9286 gpio handling
function so that they can be used by the gpio controller through the
gpio-consumer API, or directly by the driver code.

Wrap the power up and power down routines to their own function to
be able to use either the gpio line directly or the supply. This will
make it easier to control the remote camera power at run time.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---

Changes from v8:
- Use dev_err_probe() instead of open coding it

---
 drivers/media/i2c/max9286.c | 122 ++++++++++++++++++++++++++----------
 1 file changed, 90 insertions(+), 32 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 18d38db9864c..f06ec0b0a8a8 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -15,6 +15,7 @@
 #include <linux/fwnode.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/machine.h>
 #include <linux/i2c.h>
 #include <linux/i2c-mux.h>
 #include <linux/module.h>
@@ -168,6 +169,8 @@ struct max9286_priv {
 	u32 init_rev_chan_mv;
 	u32 rev_chan_mv;

+	u32 gpio_poc[2];
+
 	struct v4l2_ctrl_handler ctrls;
 	struct v4l2_ctrl *pixelrate;

@@ -1041,20 +1044,27 @@ static int max9286_setup(struct max9286_priv *priv)
 	return 0;
 }

-static void max9286_gpio_set(struct gpio_chip *chip,
-			     unsigned int offset, int value)
+static int max9286_gpio_set(struct max9286_priv *priv, unsigned int offset,
+			    int value)
 {
-	struct max9286_priv *priv = gpiochip_get_data(chip);
-
 	if (value)
 		priv->gpio_state |= BIT(offset);
 	else
 		priv->gpio_state &= ~BIT(offset);

-	max9286_write(priv, 0x0f, MAX9286_0X0F_RESERVED | priv->gpio_state);
+	return max9286_write(priv, 0x0f,
+			     MAX9286_0X0F_RESERVED | priv->gpio_state);
 }

-static int max9286_gpio_get(struct gpio_chip *chip, unsigned int offset)
+static void max9286_gpiochip_set(struct gpio_chip *chip,
+				 unsigned int offset, int value)
+{
+	struct max9286_priv *priv = gpiochip_get_data(chip);
+
+	max9286_gpio_set(priv, offset, value);
+}
+
+static int max9286_gpiochip_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct max9286_priv *priv = gpiochip_get_data(chip);

@@ -1074,13 +1084,10 @@ static int max9286_register_gpio(struct max9286_priv *priv)
 	gpio->of_node = dev->of_node;
 	gpio->ngpio = 2;
 	gpio->base = -1;
-	gpio->set = max9286_gpio_set;
-	gpio->get = max9286_gpio_get;
+	gpio->set = max9286_gpiochip_set;
+	gpio->get = max9286_gpiochip_get;
 	gpio->can_sleep = true;

-	/* GPIO values default to high */
-	priv->gpio_state = BIT(0) | BIT(1);
-
 	ret = devm_gpiochip_add_data(dev, gpio, priv);
 	if (ret)
 		dev_err(dev, "Unable to create gpio_chip\n");
@@ -1088,6 +1095,70 @@ static int max9286_register_gpio(struct max9286_priv *priv)
 	return ret;
 }

+static int max9286_parse_gpios(struct max9286_priv *priv)
+{
+	struct device *dev = &priv->client->dev;
+	int ret;
+
+	/* GPIO values default to high */
+	priv->gpio_state = BIT(0) | BIT(1);
+
+	/*
+	 * Parse the "gpio-poc" vendor property. If the property is not
+	 * specified the camera power is controlled by a regulator.
+	 */
+	ret = of_property_read_u32_array(dev->of_node, "maxim,gpio-poc",
+					 priv->gpio_poc, 2);
+	if (ret == -EINVAL) {
+		/*
+		 * If gpio lines are not used for the camera power, register
+		 * a gpio controller for consumers.
+		 */
+		ret = max9286_register_gpio(priv);
+		if (ret)
+			return ret;
+
+		priv->regulator = devm_regulator_get(dev, "poc");
+		if (IS_ERR(priv->regulator)) {
+			return dev_err_probe(dev, PTR_ERR(priv->regulator),
+					     "Unable to get PoC regulator (%ld)\n",
+					     PTR_ERR(priv->regulator));
+		}
+
+		return 0;
+	}
+
+	/* If the property is specified make sure it is well formed. */
+	if (ret || priv->gpio_poc[0] > 1 ||
+	    (priv->gpio_poc[1] != GPIO_ACTIVE_HIGH &&
+	     priv->gpio_poc[1] != GPIO_ACTIVE_LOW)) {
+		dev_err(dev, "Invalid 'gpio-poc' property\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int max9286_poc_enable(struct max9286_priv *priv, bool enable)
+{
+	int ret;
+
+	/* If the regulator is not available, use gpio to control power. */
+	if (!priv->regulator)
+		ret = max9286_gpio_set(priv, priv->gpio_poc[0],
+				       enable ^ priv->gpio_poc[1]);
+	else if (enable)
+		ret = regulator_enable(priv->regulator);
+	else
+		ret = regulator_disable(priv->regulator);
+
+	if (ret < 0)
+		dev_err(&priv->client->dev, "Unable to turn power %s\n",
+			enable ? "on" : "off");
+
+	return ret;
+}
+
 static int max9286_init(struct device *dev)
 {
 	struct max9286_priv *priv;
@@ -1097,17 +1168,14 @@ static int max9286_init(struct device *dev)
 	client = to_i2c_client(dev);
 	priv = i2c_get_clientdata(client);

-	/* Enable the bus power. */
-	ret = regulator_enable(priv->regulator);
-	if (ret < 0) {
-		dev_err(&client->dev, "Unable to turn PoC on\n");
+	ret = max9286_poc_enable(priv, true);
+	if (ret)
 		return ret;
-	}

 	ret = max9286_setup(priv);
 	if (ret) {
 		dev_err(dev, "Unable to setup max9286\n");
-		goto err_regulator;
+		goto err_poc_disable;
 	}

 	/*
@@ -1117,7 +1185,7 @@ static int max9286_init(struct device *dev)
 	ret = max9286_v4l2_register(priv);
 	if (ret) {
 		dev_err(dev, "Failed to register with V4L2\n");
-		goto err_regulator;
+		goto err_poc_disable;
 	}

 	ret = max9286_i2c_mux_init(priv);
@@ -1133,8 +1201,8 @@ static int max9286_init(struct device *dev)

 err_v4l2_register:
 	max9286_v4l2_unregister(priv);
-err_regulator:
-	regulator_disable(priv->regulator);
+err_poc_disable:
+	max9286_poc_enable(priv, false);

 	return ret;
 }
@@ -1305,20 +1373,10 @@ static int max9286_probe(struct i2c_client *client)
 	 */
 	max9286_configure_i2c(priv, false);

-	ret = max9286_register_gpio(priv);
+	ret = max9286_parse_gpios(priv);
 	if (ret)
 		goto err_powerdown;

-	priv->regulator = devm_regulator_get(&client->dev, "poc");
-	if (IS_ERR(priv->regulator)) {
-		if (PTR_ERR(priv->regulator) != -EPROBE_DEFER)
-			dev_err(&client->dev,
-				"Unable to get PoC regulator (%ld)\n",
-				PTR_ERR(priv->regulator));
-		ret = PTR_ERR(priv->regulator);
-		goto err_powerdown;
-	}
-
 	ret = max9286_parse_dt(priv);
 	if (ret)
 		goto err_powerdown;
@@ -1345,7 +1403,7 @@ static int max9286_remove(struct i2c_client *client)

 	max9286_v4l2_unregister(priv);

-	regulator_disable(priv->regulator);
+	max9286_poc_enable(priv, false);

 	gpiod_set_value_cansleep(priv->gpiod_pwdn, 0);

--
2.33.1

