Return-Path: <linux-media+bounces-27362-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 724CDA4C611
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:05:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 531231666DA
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4BC22153C4;
	Mon,  3 Mar 2025 16:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wKvE30fh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C991C218AA5;
	Mon,  3 Mar 2025 16:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741017762; cv=none; b=gfeIN5frUhbcsmCz+TprwdAkfPDpXavsuXOwTq7BxskRU+iHkRCoiLtLSERb/Au+asZuzF4Pi6C0J/49nO+nQR17nhRGqUv3Qg7Ny4IU89LvCExFyVZtvd+WIxcIXF7rfV9y7iC9bTSvJmDSG9lXKUScusI8bgJjShyAm/HJVls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741017762; c=relaxed/simple;
	bh=L2eaW6/kuQzzNKHthgmp5q53rQNb7ZOZcOYv9gBsNSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C7dFH439W18g5ap7wYRLAayK5Lgn/g9okdVzkRaJXrU1nd7EpmNT+1EEcZu5KnvoBAQEVVhMFVExmkwzusMXPpVygH7FAoJTHdkBznqdRJphkZY/dQRmFtuEo3r3uqb+Izap4f886ZQc2xJ30kd4ff3SO8LkGeKOpdR8OJJQsas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wKvE30fh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:8872:6fe4:6987:313:70cc])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9BAF41189;
	Mon,  3 Mar 2025 17:01:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1741017666;
	bh=L2eaW6/kuQzzNKHthgmp5q53rQNb7ZOZcOYv9gBsNSg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=wKvE30fhh829hrACDe3gjmr+t1ulAk9lkJqtuS7E7FsypRQTyG4FfMPFriZ/Jnonx
	 EYaZ5F4oD9wN4ckCLu5WUR/5vj9o/SC4PEFthur+AsJw9RPVUH0qpKASnG65gdCxNe
	 1CUx9azDYFq+8r8tTjxr6Cyd9hG0IbNTItpXnMkE=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 03 Mar 2025 21:32:07 +0530
Subject: [PATCH v3 04/19] media: i2c: ds90ub9xx: Add err parameter to
 read/write funcs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-b4-ub9xx-err-handling-v3-4-7d178796a2b9@ideasonboard.com>
References: <20250303-b4-ub9xx-err-handling-v3-0-7d178796a2b9@ideasonboard.com>
In-Reply-To: <20250303-b4-ub9xx-err-handling-v3-0-7d178796a2b9@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Devarsh Thakkar <devarsht@ti.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=55814;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=15RccD1KjOv1/+7/zNR7rRgNQTubVcznT6sepqdSa2Q=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnxdJ+TQTb4jrcqExyG3a5wjfJM9gIEPR+cjof/
 M+FGqnLz8CJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ8XSfgAKCRBD3pH5JJpx
 RRrwD/4vmSaBQ3ysUeRBWAO8udsrMyNK5bKxvip/p94HseGqjUt0OuiqFpZ6vLdMBDxYF8+YXiI
 x3YA1w5WDrXIJC8an4jnXK2TJ6yzlbvGYqQOoT/QWSm6GzANHug2oIGJhLYs0d9Q03X1us8PiRO
 uQ2Ab4Tc5fjXkozjgvwAS4ApJf2jiGyYpZV9tfxDdxCJS1Z6pP2MqlujXmgKZi6P5GV6KFQpRtI
 cH0tBGxZry78xQVtRaPl5Dp4VUVxT9TrU17SddcKWmcUoCQDk0dvPd8hbhCUmsH4rQSNss3Paao
 hsh+ge0VSZfuGmMiH/pw+r563N8EddZEYotZ+rHfU9X722wq3J9KufuBnx0eWnpr/NS2K2aFJu1
 Vqoa9npM0Bu9ZEmQ+b696BP89rpweGBgef/xjr8rSXse++Av8/VFzq25A6lqattlRCqiKPCS15S
 jTJiwCKcp44l+oGYyzrDmAqe/TeSoDw++v8rhGBXaqNo2WhrdQH6Yv/M/Ao1LsDWpkNYvdXtaix
 hoBC4oq51CmQxPm9ydAY2/AlL8pPV/gYZavOwyK25ELrrLEh9HghhmrshQQeKZ+zVhZ97EEButN
 yIL8/nSB0hvTf64U1qnJGcQNc3GdlUPpP8KR+VJ3ph2BvHeP4E5Hi8gWEXGDv/U0suCZhI8nh6t
 60WScdnxuUn+Ong==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

To make future error handling in the drivers easier, add "int *err"
parameter to all the i2c register access functions. It functions the
same was as with e.g. CCI reg write/read helpers.

This was accomplished with the following semantic patch:

  @@
  identifier FUNC =~ "^ub9.._(rxport_|txport_|ind_)?(read|write|update_bits)(16|_ind)?$";
  @@
   	FUNC(...
  +	, int *err
   	) {
   		...
   		int ret;
  +
  +		if (err && *err)
  +			return *err;

   		...

  +		if (ret && err)
  +			*err = ret;
  +
   		return ret;
   	}

  @@
  identifier FUNC =~ "^ub9.._(rxport_|txport_|ind_)?(read|write|update_bits)(16|_ind)?$";
  @@
  	FUNC(...
  +		, NULL
  	)

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ds90ub913.c |  52 +++--
 drivers/media/i2c/ds90ub953.c |  94 +++++----
 drivers/media/i2c/ds90ub960.c | 441 ++++++++++++++++++++++++++++--------------
 3 files changed, 390 insertions(+), 197 deletions(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index facbee79164eec1fbccaea2c1d4d62cf439e49b6..f38421d34d204fa9ab898d10c6b69942858bced2 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -119,11 +119,15 @@ static const struct ub913_format_info *ub913_find_format(u32 incode)
 	return NULL;
 }
 
-static int ub913_read(const struct ub913_data *priv, u8 reg, u8 *val)
+static int ub913_read(const struct ub913_data *priv, u8 reg, u8 *val,
+		      int *err)
 {
 	unsigned int v;
 	int ret;
 
+	if (err && *err)
+		return *err;
+
 	ret = regmap_read(priv->regmap, reg, &v);
 	if (ret) {
 		dev_err(&priv->client->dev,
@@ -134,31 +138,47 @@ static int ub913_read(const struct ub913_data *priv, u8 reg, u8 *val)
 	*val = v;
 
 out:
+	if (ret && err)
+		*err = ret;
+
 	return ret;
 }
 
-static int ub913_write(const struct ub913_data *priv, u8 reg, u8 val)
+static int ub913_write(const struct ub913_data *priv, u8 reg, u8 val,
+		       int *err)
 {
 	int ret;
 
+	if (err && *err)
+		return *err;
+
 	ret = regmap_write(priv->regmap, reg, val);
 	if (ret < 0)
 		dev_err(&priv->client->dev,
 			"Cannot write register 0x%02x: %d!\n", reg, ret);
 
+	if (ret && err)
+		*err = ret;
+
 	return ret;
 }
 
 static int ub913_update_bits(const struct ub913_data *priv, u8 reg, u8 mask,
-			     u8 val)
+			     u8 val, int *err)
 {
 	int ret;
 
+	if (err && *err)
+		return *err;
+
 	ret = regmap_update_bits(priv->regmap, reg, mask, val);
 	if (ret < 0)
 		dev_err(&priv->client->dev,
 			"Cannot update register 0x%02x %d!\n", reg, ret);
 
+	if (ret && err)
+		*err = ret;
+
 	return ret;
 }
 
@@ -206,7 +226,7 @@ static int ub913_gpiochip_probe(struct ub913_data *priv)
 	int ret;
 
 	/* Initialize GPIOs 0 and 1 to local control, tri-state */
-	ub913_write(priv, UB913_REG_GPIO_CFG(0), 0);
+	ub913_write(priv, UB913_REG_GPIO_CFG(0), 0, NULL);
 
 	gc->label = dev_name(dev);
 	gc->parent = dev;
@@ -486,23 +506,23 @@ static int ub913_log_status(struct v4l2_subdev *sd)
 	struct device *dev = &priv->client->dev;
 	u8 v = 0, v1 = 0, v2 = 0;
 
-	ub913_read(priv, UB913_REG_MODE_SEL, &v);
+	ub913_read(priv, UB913_REG_MODE_SEL, &v, NULL);
 	dev_info(dev, "MODE_SEL %#02x\n", v);
 
-	ub913_read(priv, UB913_REG_CRC_ERRORS_LSB, &v1);
-	ub913_read(priv, UB913_REG_CRC_ERRORS_MSB, &v2);
+	ub913_read(priv, UB913_REG_CRC_ERRORS_LSB, &v1, NULL);
+	ub913_read(priv, UB913_REG_CRC_ERRORS_MSB, &v2, NULL);
 	dev_info(dev, "CRC errors %u\n", v1 | (v2 << 8));
 
 	/* clear CRC errors */
-	ub913_read(priv, UB913_REG_GENERAL_CFG, &v);
+	ub913_read(priv, UB913_REG_GENERAL_CFG, &v, NULL);
 	ub913_write(priv, UB913_REG_GENERAL_CFG,
-		    v | UB913_REG_GENERAL_CFG_CRC_ERR_RESET);
-	ub913_write(priv, UB913_REG_GENERAL_CFG, v);
+		    v | UB913_REG_GENERAL_CFG_CRC_ERR_RESET, NULL);
+	ub913_write(priv, UB913_REG_GENERAL_CFG, v, NULL);
 
-	ub913_read(priv, UB913_REG_GENERAL_STATUS, &v);
+	ub913_read(priv, UB913_REG_GENERAL_STATUS, &v, NULL);
 	dev_info(dev, "GENERAL_STATUS %#02x\n", v);
 
-	ub913_read(priv, UB913_REG_PLL_OVR, &v);
+	ub913_read(priv, UB913_REG_PLL_OVR, &v, NULL);
 	dev_info(dev, "PLL_OVR %#02x\n", v);
 
 	return 0;
@@ -658,11 +678,11 @@ static int ub913_i2c_master_init(struct ub913_data *priv)
 	scl_high = div64_u64((u64)scl_high * ref, 1000000000);
 	scl_low = div64_u64((u64)scl_low * ref, 1000000000);
 
-	ret = ub913_write(priv, UB913_REG_SCL_HIGH_TIME, scl_high);
+	ret = ub913_write(priv, UB913_REG_SCL_HIGH_TIME, scl_high, NULL);
 	if (ret)
 		return ret;
 
-	ret = ub913_write(priv, UB913_REG_SCL_LOW_TIME, scl_low);
+	ret = ub913_write(priv, UB913_REG_SCL_LOW_TIME, scl_low, NULL);
 	if (ret)
 		return ret;
 
@@ -731,7 +751,7 @@ static int ub913_hw_init(struct ub913_data *priv)
 	int ret;
 	u8 v;
 
-	ret = ub913_read(priv, UB913_REG_MODE_SEL, &v);
+	ret = ub913_read(priv, UB913_REG_MODE_SEL, &v, NULL);
 	if (ret)
 		return ret;
 
@@ -752,7 +772,7 @@ static int ub913_hw_init(struct ub913_data *priv)
 	ret = ub913_update_bits(priv, UB913_REG_GENERAL_CFG,
 				UB913_REG_GENERAL_CFG_PCLK_RISING,
 				FIELD_PREP(UB913_REG_GENERAL_CFG_PCLK_RISING,
-					   priv->pclk_polarity_rising));
+					   priv->pclk_polarity_rising), NULL);
 
 	if (ret)
 		return ret;
diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 7b33b8cc83c17fce7d3ce6bf73c2ec8bc13a0bfd..fbd977760c6b1ccdec90b90bced4dc29932f3893 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -185,11 +185,14 @@ static inline struct ub953_data *sd_to_ub953(struct v4l2_subdev *sd)
  * HW Access
  */
 
-static int ub953_read(struct ub953_data *priv, u8 reg, u8 *val)
+static int ub953_read(struct ub953_data *priv, u8 reg, u8 *val, int *err)
 {
 	unsigned int v;
 	int ret;
 
+	if (err && *err)
+		return *err;
+
 	mutex_lock(&priv->reg_lock);
 
 	ret = regmap_read(priv->regmap, reg, &v);
@@ -204,13 +207,19 @@ static int ub953_read(struct ub953_data *priv, u8 reg, u8 *val)
 out_unlock:
 	mutex_unlock(&priv->reg_lock);
 
+	if (ret && err)
+		*err = ret;
+
 	return ret;
 }
 
-static int ub953_write(struct ub953_data *priv, u8 reg, u8 val)
+static int ub953_write(struct ub953_data *priv, u8 reg, u8 val, int *err)
 {
 	int ret;
 
+	if (err && *err)
+		return *err;
+
 	mutex_lock(&priv->reg_lock);
 
 	ret = regmap_write(priv->regmap, reg, val);
@@ -220,6 +229,9 @@ static int ub953_write(struct ub953_data *priv, u8 reg, u8 val)
 
 	mutex_unlock(&priv->reg_lock);
 
+	if (ret && err)
+		*err = ret;
+
 	return ret;
 }
 
@@ -244,11 +256,15 @@ static int ub953_select_ind_reg_block(struct ub953_data *priv, u8 block)
 }
 
 __maybe_unused
-static int ub953_read_ind(struct ub953_data *priv, u8 block, u8 reg, u8 *val)
+static int ub953_read_ind(struct ub953_data *priv, u8 block, u8 reg, u8 *val,
+			  int *err)
 {
 	unsigned int v;
 	int ret;
 
+	if (err && *err)
+		return *err;
+
 	mutex_lock(&priv->reg_lock);
 
 	ret = ub953_select_ind_reg_block(priv, block);
@@ -276,14 +292,21 @@ static int ub953_read_ind(struct ub953_data *priv, u8 block, u8 reg, u8 *val)
 out_unlock:
 	mutex_unlock(&priv->reg_lock);
 
+	if (ret && err)
+		*err = ret;
+
 	return ret;
 }
 
 __maybe_unused
-static int ub953_write_ind(struct ub953_data *priv, u8 block, u8 reg, u8 val)
+static int ub953_write_ind(struct ub953_data *priv, u8 block, u8 reg, u8 val,
+			   int *err)
 {
 	int ret;
 
+	if (err && *err)
+		return *err;
+
 	mutex_lock(&priv->reg_lock);
 
 	ret = ub953_select_ind_reg_block(priv, block);
@@ -308,6 +331,9 @@ static int ub953_write_ind(struct ub953_data *priv, u8 block, u8 reg, u8 val)
 out_unlock:
 	mutex_unlock(&priv->reg_lock);
 
+	if (ret && err)
+		*err = ret;
+
 	return ret;
 }
 
@@ -320,7 +346,7 @@ static int ub953_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 	int ret;
 	u8 v;
 
-	ret = ub953_read(priv, UB953_REG_GPIO_INPUT_CTRL, &v);
+	ret = ub953_read(priv, UB953_REG_GPIO_INPUT_CTRL, &v, NULL);
 	if (ret)
 		return ret;
 
@@ -366,7 +392,7 @@ static int ub953_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	int ret;
 	u8 v;
 
-	ret = ub953_read(priv, UB953_REG_GPIO_PIN_STS, &v);
+	ret = ub953_read(priv, UB953_REG_GPIO_PIN_STS, &v, NULL);
 	if (ret)
 		return ret;
 
@@ -400,11 +426,11 @@ static int ub953_gpiochip_probe(struct ub953_data *priv)
 	int ret;
 
 	/* Set all GPIOs to local input mode */
-	ret = ub953_write(priv, UB953_REG_LOCAL_GPIO_DATA, 0);
+	ret = ub953_write(priv, UB953_REG_LOCAL_GPIO_DATA, 0, NULL);
 	if (ret)
 		return ret;
 
-	ret = ub953_write(priv, UB953_REG_GPIO_INPUT_CTRL, 0xf);
+	ret = ub953_write(priv, UB953_REG_GPIO_INPUT_CTRL, 0xf, NULL);
 	if (ret)
 		return ret;
 
@@ -615,15 +641,15 @@ static int ub953_log_status(struct v4l2_subdev *sd)
 	u8 gpio_pin_sts = 0;
 
 	for (i = 0; i < sizeof(id); i++)
-		ub953_read(priv, UB953_REG_FPD3_RX_ID(i), &id[i]);
+		ub953_read(priv, UB953_REG_FPD3_RX_ID(i), &id[i], NULL);
 
 	dev_info(dev, "ID '%.*s'\n", (int)sizeof(id), id);
 
-	ub953_read(priv, UB953_REG_GENERAL_STATUS, &v);
+	ub953_read(priv, UB953_REG_GENERAL_STATUS, &v, NULL);
 	dev_info(dev, "GENERAL_STATUS %#02x\n", v);
 
-	ub953_read(priv, UB953_REG_CRC_ERR_CNT1, &v1);
-	ub953_read(priv, UB953_REG_CRC_ERR_CNT2, &v2);
+	ub953_read(priv, UB953_REG_CRC_ERR_CNT1, &v1, NULL);
+	ub953_read(priv, UB953_REG_CRC_ERR_CNT2, &v2, NULL);
 	dev_info(dev, "CRC error count %u\n", v1 | (v2 << 8));
 
 	/* Clear CRC error counter */
@@ -632,34 +658,34 @@ static int ub953_log_status(struct v4l2_subdev *sd)
 				   UB953_REG_BC_CTRL_CRC_ERR_CLR,
 				   UB953_REG_BC_CTRL_CRC_ERR_CLR);
 
-	ub953_read(priv, UB953_REG_CSI_ERR_CNT, &v);
+	ub953_read(priv, UB953_REG_CSI_ERR_CNT, &v, NULL);
 	dev_info(dev, "CSI error count %u\n", v);
 
-	ub953_read(priv, UB953_REG_CSI_ERR_STATUS, &v);
+	ub953_read(priv, UB953_REG_CSI_ERR_STATUS, &v, NULL);
 	dev_info(dev, "CSI_ERR_STATUS %#02x\n", v);
 
-	ub953_read(priv, UB953_REG_CSI_ERR_DLANE01, &v);
+	ub953_read(priv, UB953_REG_CSI_ERR_DLANE01, &v, NULL);
 	dev_info(dev, "CSI_ERR_DLANE01 %#02x\n", v);
 
-	ub953_read(priv, UB953_REG_CSI_ERR_DLANE23, &v);
+	ub953_read(priv, UB953_REG_CSI_ERR_DLANE23, &v, NULL);
 	dev_info(dev, "CSI_ERR_DLANE23 %#02x\n", v);
 
-	ub953_read(priv, UB953_REG_CSI_ERR_CLK_LANE, &v);
+	ub953_read(priv, UB953_REG_CSI_ERR_CLK_LANE, &v, NULL);
 	dev_info(dev, "CSI_ERR_CLK_LANE %#02x\n", v);
 
-	ub953_read(priv, UB953_REG_CSI_PKT_HDR_VC_ID, &v);
+	ub953_read(priv, UB953_REG_CSI_PKT_HDR_VC_ID, &v, NULL);
 	dev_info(dev, "CSI packet header VC %u ID %u\n", v >> 6, v & 0x3f);
 
-	ub953_read(priv, UB953_REG_PKT_HDR_WC_LSB, &v1);
-	ub953_read(priv, UB953_REG_PKT_HDR_WC_MSB, &v2);
+	ub953_read(priv, UB953_REG_PKT_HDR_WC_LSB, &v1, NULL);
+	ub953_read(priv, UB953_REG_PKT_HDR_WC_MSB, &v2, NULL);
 	dev_info(dev, "CSI packet header WC %u\n", (v2 << 8) | v1);
 
-	ub953_read(priv, UB953_REG_CSI_ECC, &v);
+	ub953_read(priv, UB953_REG_CSI_ECC, &v, NULL);
 	dev_info(dev, "CSI ECC %#02x\n", v);
 
-	ub953_read(priv, UB953_REG_LOCAL_GPIO_DATA, &gpio_local_data);
-	ub953_read(priv, UB953_REG_GPIO_INPUT_CTRL, &gpio_input_ctrl);
-	ub953_read(priv, UB953_REG_GPIO_PIN_STS, &gpio_pin_sts);
+	ub953_read(priv, UB953_REG_LOCAL_GPIO_DATA, &gpio_local_data, NULL);
+	ub953_read(priv, UB953_REG_GPIO_INPUT_CTRL, &gpio_input_ctrl, NULL);
+	ub953_read(priv, UB953_REG_GPIO_PIN_STS, &gpio_pin_sts, NULL);
 
 	for (i = 0; i < UB953_NUM_GPIOS; i++) {
 		dev_info(dev,
@@ -843,11 +869,11 @@ static int ub953_i2c_master_init(struct ub953_data *priv)
 	scl_high = div64_u64((u64)scl_high * ref, 1000000000) - 5;
 	scl_low = div64_u64((u64)scl_low * ref, 1000000000) - 5;
 
-	ret = ub953_write(priv, UB953_REG_SCL_HIGH_TIME, scl_high);
+	ret = ub953_write(priv, UB953_REG_SCL_HIGH_TIME, scl_high, NULL);
 	if (ret)
 		return ret;
 
-	ret = ub953_write(priv, UB953_REG_SCL_LOW_TIME, scl_low);
+	ret = ub953_write(priv, UB953_REG_SCL_LOW_TIME, scl_low, NULL);
 	if (ret)
 		return ret;
 
@@ -986,11 +1012,11 @@ static int ub953_write_clkout_regs(struct ub953_data *priv,
 
 	clkout_ctrl1 = clkout_data->n;
 
-	ret = ub953_write(priv, UB953_REG_CLKOUT_CTRL0, clkout_ctrl0);
+	ret = ub953_write(priv, UB953_REG_CLKOUT_CTRL0, clkout_ctrl0, NULL);
 	if (ret)
 		return ret;
 
-	ret = ub953_write(priv, UB953_REG_CLKOUT_CTRL1, clkout_ctrl1);
+	ret = ub953_write(priv, UB953_REG_CLKOUT_CTRL1, clkout_ctrl1, NULL);
 	if (ret)
 		return ret;
 
@@ -1009,13 +1035,13 @@ static unsigned long ub953_clkout_recalc_rate(struct clk_hw *hw,
 	u64 rate;
 	int ret;
 
-	ret = ub953_read(priv, UB953_REG_CLKOUT_CTRL0, &ctrl0);
+	ret = ub953_read(priv, UB953_REG_CLKOUT_CTRL0, &ctrl0, NULL);
 	if (ret) {
 		dev_err(dev, "Failed to read CLKOUT_CTRL0: %d\n", ret);
 		return 0;
 	}
 
-	ret = ub953_read(priv, UB953_REG_CLKOUT_CTRL1, &ctrl1);
+	ret = ub953_read(priv, UB953_REG_CLKOUT_CTRL1, &ctrl1, NULL);
 	if (ret) {
 		dev_err(dev, "Failed to read CLKOUT_CTRL1: %d\n", ret);
 		return 0;
@@ -1191,7 +1217,7 @@ static int ub953_hw_init(struct ub953_data *priv)
 	int ret;
 	u8 v;
 
-	ret = ub953_read(priv, UB953_REG_MODE_SEL, &v);
+	ret = ub953_read(priv, UB953_REG_MODE_SEL, &v, NULL);
 	if (ret)
 		return ret;
 
@@ -1231,13 +1257,13 @@ static int ub953_hw_init(struct ub953_data *priv)
 		return dev_err_probe(dev, -EINVAL,
 				     "clkin required for non-sync ext mode\n");
 
-	ret = ub953_read(priv, UB953_REG_REV_MASK_ID, &v);
+	ret = ub953_read(priv, UB953_REG_REV_MASK_ID, &v, NULL);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to read revision");
 
 	dev_info(dev, "Found %s rev/mask %#04x\n", priv->hw_data->model, v);
 
-	ret = ub953_read(priv, UB953_REG_GENERAL_CFG, &v);
+	ret = ub953_read(priv, UB953_REG_GENERAL_CFG, &v, NULL);
 	if (ret)
 		return ret;
 
@@ -1254,7 +1280,7 @@ static int ub953_hw_init(struct ub953_data *priv)
 		UB953_REG_GENERAL_CFG_CSI_LANE_SEL_SHIFT;
 	v |= UB953_REG_GENERAL_CFG_CRC_TX_GEN_ENABLE;
 
-	ret = ub953_write(priv, UB953_REG_GENERAL_CFG, v);
+	ret = ub953_write(priv, UB953_REG_GENERAL_CFG, v, NULL);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 5dde8452739b64dd5b847a7bc1dac556ea43ca6c..09e6d820edc193f4db9c0ebf02bc89b384d75f5b 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -618,12 +618,15 @@ static const struct ub960_format_info *ub960_find_format(u32 code)
  * Basic device access
  */
 
-static int ub960_read(struct ub960_data *priv, u8 reg, u8 *val)
+static int ub960_read(struct ub960_data *priv, u8 reg, u8 *val, int *err)
 {
 	struct device *dev = &priv->client->dev;
 	unsigned int v;
 	int ret;
 
+	if (err && *err)
+		return *err;
+
 	mutex_lock(&priv->reg_lock);
 
 	ret = regmap_read(priv->regmap, reg, &v);
@@ -638,14 +641,20 @@ static int ub960_read(struct ub960_data *priv, u8 reg, u8 *val)
 out_unlock:
 	mutex_unlock(&priv->reg_lock);
 
+	if (ret && err)
+		*err = ret;
+
 	return ret;
 }
 
-static int ub960_write(struct ub960_data *priv, u8 reg, u8 val)
+static int ub960_write(struct ub960_data *priv, u8 reg, u8 val, int *err)
 {
 	struct device *dev = &priv->client->dev;
 	int ret;
 
+	if (err && *err)
+		return *err;
+
 	mutex_lock(&priv->reg_lock);
 
 	ret = regmap_write(priv->regmap, reg, val);
@@ -655,14 +664,21 @@ static int ub960_write(struct ub960_data *priv, u8 reg, u8 val)
 
 	mutex_unlock(&priv->reg_lock);
 
+	if (ret && err)
+		*err = ret;
+
 	return ret;
 }
 
-static int ub960_update_bits(struct ub960_data *priv, u8 reg, u8 mask, u8 val)
+static int ub960_update_bits(struct ub960_data *priv, u8 reg, u8 mask, u8 val,
+			     int *err)
 {
 	struct device *dev = &priv->client->dev;
 	int ret;
 
+	if (err && *err)
+		return *err;
+
 	mutex_lock(&priv->reg_lock);
 
 	ret = regmap_update_bits(priv->regmap, reg, mask, val);
@@ -672,15 +688,21 @@ static int ub960_update_bits(struct ub960_data *priv, u8 reg, u8 mask, u8 val)
 
 	mutex_unlock(&priv->reg_lock);
 
+	if (ret && err)
+		*err = ret;
+
 	return ret;
 }
 
-static int ub960_read16(struct ub960_data *priv, u8 reg, u16 *val)
+static int ub960_read16(struct ub960_data *priv, u8 reg, u16 *val, int *err)
 {
 	struct device *dev = &priv->client->dev;
 	__be16 __v;
 	int ret;
 
+	if (err && *err)
+		return *err;
+
 	mutex_lock(&priv->reg_lock);
 
 	ret = regmap_bulk_read(priv->regmap, reg, &__v, sizeof(__v));
@@ -695,6 +717,9 @@ static int ub960_read16(struct ub960_data *priv, u8 reg, u16 *val)
 out_unlock:
 	mutex_unlock(&priv->reg_lock);
 
+	if (ret && err)
+		*err = ret;
+
 	return ret;
 }
 
@@ -721,12 +746,16 @@ static int ub960_rxport_select(struct ub960_data *priv, u8 nport)
 	return 0;
 }
 
-static int ub960_rxport_read(struct ub960_data *priv, u8 nport, u8 reg, u8 *val)
+static int ub960_rxport_read(struct ub960_data *priv, u8 nport, u8 reg,
+			     u8 *val, int *err)
 {
 	struct device *dev = &priv->client->dev;
 	unsigned int v;
 	int ret;
 
+	if (err && *err)
+		return *err;
+
 	mutex_lock(&priv->reg_lock);
 
 	ret = ub960_rxport_select(priv, nport);
@@ -745,14 +774,21 @@ static int ub960_rxport_read(struct ub960_data *priv, u8 nport, u8 reg, u8 *val)
 out_unlock:
 	mutex_unlock(&priv->reg_lock);
 
+	if (ret && err)
+		*err = ret;
+
 	return ret;
 }
 
-static int ub960_rxport_write(struct ub960_data *priv, u8 nport, u8 reg, u8 val)
+static int ub960_rxport_write(struct ub960_data *priv, u8 nport, u8 reg,
+			      u8 val, int *err)
 {
 	struct device *dev = &priv->client->dev;
 	int ret;
 
+	if (err && *err)
+		return *err;
+
 	mutex_lock(&priv->reg_lock);
 
 	ret = ub960_rxport_select(priv, nport);
@@ -767,15 +803,21 @@ static int ub960_rxport_write(struct ub960_data *priv, u8 nport, u8 reg, u8 val)
 out_unlock:
 	mutex_unlock(&priv->reg_lock);
 
+	if (ret && err)
+		*err = ret;
+
 	return ret;
 }
 
 static int ub960_rxport_update_bits(struct ub960_data *priv, u8 nport, u8 reg,
-				    u8 mask, u8 val)
+				    u8 mask, u8 val, int *err)
 {
 	struct device *dev = &priv->client->dev;
 	int ret;
 
+	if (err && *err)
+		return *err;
+
 	mutex_lock(&priv->reg_lock);
 
 	ret = ub960_rxport_select(priv, nport);
@@ -790,16 +832,22 @@ static int ub960_rxport_update_bits(struct ub960_data *priv, u8 nport, u8 reg,
 out_unlock:
 	mutex_unlock(&priv->reg_lock);
 
+	if (ret && err)
+		*err = ret;
+
 	return ret;
 }
 
 static int ub960_rxport_read16(struct ub960_data *priv, u8 nport, u8 reg,
-			       u16 *val)
+			       u16 *val, int *err)
 {
 	struct device *dev = &priv->client->dev;
 	__be16 __v;
 	int ret;
 
+	if (err && *err)
+		return *err;
+
 	mutex_lock(&priv->reg_lock);
 
 	ret = ub960_rxport_select(priv, nport);
@@ -818,6 +866,9 @@ static int ub960_rxport_read16(struct ub960_data *priv, u8 nport, u8 reg,
 out_unlock:
 	mutex_unlock(&priv->reg_lock);
 
+	if (ret && err)
+		*err = ret;
+
 	return ret;
 }
 
@@ -844,12 +895,16 @@ static int ub960_txport_select(struct ub960_data *priv, u8 nport)
 	return 0;
 }
 
-static int ub960_txport_read(struct ub960_data *priv, u8 nport, u8 reg, u8 *val)
+static int ub960_txport_read(struct ub960_data *priv, u8 nport, u8 reg,
+			     u8 *val, int *err)
 {
 	struct device *dev = &priv->client->dev;
 	unsigned int v;
 	int ret;
 
+	if (err && *err)
+		return *err;
+
 	mutex_lock(&priv->reg_lock);
 
 	ret = ub960_txport_select(priv, nport);
@@ -868,14 +923,21 @@ static int ub960_txport_read(struct ub960_data *priv, u8 nport, u8 reg, u8 *val)
 out_unlock:
 	mutex_unlock(&priv->reg_lock);
 
+	if (ret && err)
+		*err = ret;
+
 	return ret;
 }
 
-static int ub960_txport_write(struct ub960_data *priv, u8 nport, u8 reg, u8 val)
+static int ub960_txport_write(struct ub960_data *priv, u8 nport, u8 reg,
+			      u8 val, int *err)
 {
 	struct device *dev = &priv->client->dev;
 	int ret;
 
+	if (err && *err)
+		return *err;
+
 	mutex_lock(&priv->reg_lock);
 
 	ret = ub960_txport_select(priv, nport);
@@ -890,15 +952,21 @@ static int ub960_txport_write(struct ub960_data *priv, u8 nport, u8 reg, u8 val)
 out_unlock:
 	mutex_unlock(&priv->reg_lock);
 
+	if (ret && err)
+		*err = ret;
+
 	return ret;
 }
 
 static int ub960_txport_update_bits(struct ub960_data *priv, u8 nport, u8 reg,
-				    u8 mask, u8 val)
+				    u8 mask, u8 val, int *err)
 {
 	struct device *dev = &priv->client->dev;
 	int ret;
 
+	if (err && *err)
+		return *err;
+
 	mutex_lock(&priv->reg_lock);
 
 	ret = ub960_txport_select(priv, nport);
@@ -913,6 +981,9 @@ static int ub960_txport_update_bits(struct ub960_data *priv, u8 nport, u8 reg,
 out_unlock:
 	mutex_unlock(&priv->reg_lock);
 
+	if (ret && err)
+		*err = ret;
+
 	return ret;
 }
 
@@ -938,12 +1009,16 @@ static int ub960_select_ind_reg_block(struct ub960_data *priv, u8 block)
 	return 0;
 }
 
-static int ub960_read_ind(struct ub960_data *priv, u8 block, u8 reg, u8 *val)
+static int ub960_read_ind(struct ub960_data *priv, u8 block, u8 reg, u8 *val,
+			  int *err)
 {
 	struct device *dev = &priv->client->dev;
 	unsigned int v;
 	int ret;
 
+	if (err && *err)
+		return *err;
+
 	mutex_lock(&priv->reg_lock);
 
 	ret = ub960_select_ind_reg_block(priv, block);
@@ -971,14 +1046,21 @@ static int ub960_read_ind(struct ub960_data *priv, u8 block, u8 reg, u8 *val)
 out_unlock:
 	mutex_unlock(&priv->reg_lock);
 
+	if (ret && err)
+		*err = ret;
+
 	return ret;
 }
 
-static int ub960_write_ind(struct ub960_data *priv, u8 block, u8 reg, u8 val)
+static int ub960_write_ind(struct ub960_data *priv, u8 block, u8 reg, u8 val,
+			   int *err)
 {
 	struct device *dev = &priv->client->dev;
 	int ret;
 
+	if (err && *err)
+		return *err;
+
 	mutex_lock(&priv->reg_lock);
 
 	ret = ub960_select_ind_reg_block(priv, block);
@@ -1004,15 +1086,21 @@ static int ub960_write_ind(struct ub960_data *priv, u8 block, u8 reg, u8 val)
 out_unlock:
 	mutex_unlock(&priv->reg_lock);
 
+	if (ret && err)
+		*err = ret;
+
 	return ret;
 }
 
 static int ub960_ind_update_bits(struct ub960_data *priv, u8 block, u8 reg,
-				 u8 mask, u8 val)
+				 u8 mask, u8 val, int *err)
 {
 	struct device *dev = &priv->client->dev;
 	int ret;
 
+	if (err && *err)
+		return *err;
+
 	mutex_lock(&priv->reg_lock);
 
 	ret = ub960_select_ind_reg_block(priv, block);
@@ -1039,6 +1127,9 @@ static int ub960_ind_update_bits(struct ub960_data *priv, u8 block, u8 reg,
 out_unlock:
 	mutex_unlock(&priv->reg_lock);
 
+	if (ret && err)
+		*err = ret;
+
 	return ret;
 }
 
@@ -1067,9 +1158,9 @@ static int ub960_atr_attach_client(struct i2c_atr *atr, u32 chan_id,
 	rxport->aliased_clients[reg_idx] = client;
 
 	ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ID(reg_idx),
-			   client->addr << 1);
+			   client->addr << 1, NULL);
 	ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ALIAS(reg_idx),
-			   alias << 1);
+			   alias << 1, NULL);
 
 	dev_dbg(dev, "rx%u: client 0x%02x assigned alias 0x%02x at slot %u\n",
 		rxport->nport, client->addr, alias, reg_idx);
@@ -1098,7 +1189,8 @@ static void ub960_atr_detach_client(struct i2c_atr *atr, u32 chan_id,
 
 	rxport->aliased_clients[reg_idx] = NULL;
 
-	ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ALIAS(reg_idx), 0);
+	ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ALIAS(reg_idx), 0,
+			   NULL);
 
 	dev_dbg(dev, "rx%u: client 0x%02x released at slot %u\n", rxport->nport,
 		client->addr, reg_idx);
@@ -1199,7 +1291,8 @@ static void ub960_csi_handle_events(struct ub960_data *priv, u8 nport)
 	u8 csi_tx_isr;
 	int ret;
 
-	ret = ub960_txport_read(priv, nport, UB960_TR_CSI_TX_ISR, &csi_tx_isr);
+	ret = ub960_txport_read(priv, nport, UB960_TR_CSI_TX_ISR, &csi_tx_isr,
+				NULL);
 	if (ret)
 		return;
 
@@ -1264,15 +1357,15 @@ static void ub960_rxport_clear_errors(struct ub960_data *priv,
 {
 	u8 v;
 
-	ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS1, &v);
-	ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS2, &v);
-	ub960_rxport_read(priv, nport, UB960_RR_CSI_RX_STS, &v);
-	ub960_rxport_read(priv, nport, UB960_RR_BCC_STATUS, &v);
+	ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS1, &v, NULL);
+	ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS2, &v, NULL);
+	ub960_rxport_read(priv, nport, UB960_RR_CSI_RX_STS, &v, NULL);
+	ub960_rxport_read(priv, nport, UB960_RR_BCC_STATUS, &v, NULL);
 
-	ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_HI, &v);
-	ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_LO, &v);
+	ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_HI, &v, NULL);
+	ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_LO, &v, NULL);
 
-	ub960_rxport_read(priv, nport, UB960_RR_CSI_ERR_COUNTER, &v);
+	ub960_rxport_read(priv, nport, UB960_RR_CSI_ERR_COUNTER, &v, NULL);
 }
 
 static void ub960_clear_rx_errors(struct ub960_data *priv)
@@ -1291,24 +1384,24 @@ static int ub960_rxport_get_strobe_pos(struct ub960_data *priv,
 	int ret;
 
 	ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
-		       UB960_IR_RX_ANA_STROBE_SET_CLK, &v);
+		       UB960_IR_RX_ANA_STROBE_SET_CLK, &v, NULL);
 
 	clk_delay = (v & UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY) ?
 			    0 : UB960_MANUAL_STROBE_EXTRA_DELAY;
 
 	ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
-		       UB960_IR_RX_ANA_STROBE_SET_DATA, &v);
+		       UB960_IR_RX_ANA_STROBE_SET_DATA, &v, NULL);
 
 	data_delay = (v & UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY) ?
 			     0 : UB960_MANUAL_STROBE_EXTRA_DELAY;
 
-	ret = ub960_rxport_read(priv, nport, UB960_RR_SFILTER_STS_0, &v);
+	ret = ub960_rxport_read(priv, nport, UB960_RR_SFILTER_STS_0, &v, NULL);
 	if (ret)
 		return ret;
 
 	clk_delay += v & UB960_IR_RX_ANA_STROBE_SET_CLK_DELAY_MASK;
 
-	ret = ub960_rxport_read(priv, nport, UB960_RR_SFILTER_STS_1, &v);
+	ret = ub960_rxport_read(priv, nport, UB960_RR_SFILTER_STS_1, &v, NULL);
 	if (ret)
 		return ret;
 
@@ -1337,10 +1430,10 @@ static void ub960_rxport_set_strobe_pos(struct ub960_data *priv,
 		data_delay = strobe_pos | UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY;
 
 	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
-			UB960_IR_RX_ANA_STROBE_SET_CLK, clk_delay);
+			UB960_IR_RX_ANA_STROBE_SET_CLK, clk_delay, NULL);
 
 	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
-			UB960_IR_RX_ANA_STROBE_SET_DATA, data_delay);
+			UB960_IR_RX_ANA_STROBE_SET_DATA, data_delay, NULL);
 }
 
 static void ub960_rxport_set_strobe_range(struct ub960_data *priv,
@@ -1352,7 +1445,8 @@ static void ub960_rxport_set_strobe_range(struct ub960_data *priv,
 
 	ub960_write(priv, UB960_XR_SFILTER_CFG,
 		    ((u8)strobe_min << UB960_XR_SFILTER_CFG_SFILTER_MIN_SHIFT) |
-		    ((u8)strobe_max << UB960_XR_SFILTER_CFG_SFILTER_MAX_SHIFT));
+		    ((u8)strobe_max << UB960_XR_SFILTER_CFG_SFILTER_MAX_SHIFT),
+		    NULL);
 }
 
 static int ub960_rxport_get_eq_level(struct ub960_data *priv,
@@ -1361,7 +1455,7 @@ static int ub960_rxport_get_eq_level(struct ub960_data *priv,
 	int ret;
 	u8 v;
 
-	ret = ub960_rxport_read(priv, nport, UB960_RR_AEQ_STATUS, &v);
+	ret = ub960_rxport_read(priv, nport, UB960_RR_AEQ_STATUS, &v, NULL);
 	if (ret)
 		return ret;
 
@@ -1386,7 +1480,7 @@ static void ub960_rxport_set_eq_level(struct ub960_data *priv,
 		eq_stage_2_select_value = eq_level - eq_stage_max;
 	}
 
-	ub960_rxport_read(priv, nport, UB960_RR_AEQ_BYPASS, &v);
+	ub960_rxport_read(priv, nport, UB960_RR_AEQ_BYPASS, &v, NULL);
 
 	v &= ~(UB960_RR_AEQ_BYPASS_EQ_STAGE1_VALUE_MASK |
 	       UB960_RR_AEQ_BYPASS_EQ_STAGE2_VALUE_MASK);
@@ -1394,7 +1488,7 @@ static void ub960_rxport_set_eq_level(struct ub960_data *priv,
 	v |= eq_stage_2_select_value << UB960_RR_AEQ_BYPASS_EQ_STAGE2_VALUE_SHIFT;
 	v |= UB960_RR_AEQ_BYPASS_ENABLE;
 
-	ub960_rxport_write(priv, nport, UB960_RR_AEQ_BYPASS, v);
+	ub960_rxport_write(priv, nport, UB960_RR_AEQ_BYPASS, v, NULL);
 }
 
 static void ub960_rxport_set_eq_range(struct ub960_data *priv,
@@ -1402,12 +1496,13 @@ static void ub960_rxport_set_eq_range(struct ub960_data *priv,
 {
 	ub960_rxport_write(priv, nport, UB960_RR_AEQ_MIN_MAX,
 			   (eq_min << UB960_RR_AEQ_MIN_MAX_AEQ_FLOOR_SHIFT) |
-			   (eq_max << UB960_RR_AEQ_MIN_MAX_AEQ_MAX_SHIFT));
+			   (eq_max << UB960_RR_AEQ_MIN_MAX_AEQ_MAX_SHIFT),
+			   NULL);
 
 	/* Enable AEQ min setting */
 	ub960_rxport_update_bits(priv, nport, UB960_RR_AEQ_CTL2,
 				 UB960_RR_AEQ_CTL2_SET_AEQ_FLOOR,
-				 UB960_RR_AEQ_CTL2_SET_AEQ_FLOOR);
+				 UB960_RR_AEQ_CTL2_SET_AEQ_FLOOR, NULL);
 }
 
 static void ub960_rxport_config_eq(struct ub960_data *priv, unsigned int nport)
@@ -1419,12 +1514,12 @@ static void ub960_rxport_config_eq(struct ub960_data *priv, unsigned int nport)
 	if (priv->strobe.manual) {
 		/* Disable AEQ_SFILTER_EN */
 		ub960_update_bits(priv, UB960_XR_AEQ_CTL1,
-				  UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN, 0);
+				  UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN, 0, NULL);
 	} else {
 		/* Enable SFILTER and error control */
 		ub960_write(priv, UB960_XR_AEQ_CTL1,
 			    UB960_XR_AEQ_CTL1_AEQ_ERR_CTL_MASK |
-				    UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN);
+				    UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN, NULL);
 
 		/* Set AEQ strobe range */
 		ub960_rxport_set_strobe_range(priv, priv->strobe.min,
@@ -1445,7 +1540,7 @@ static void ub960_rxport_config_eq(struct ub960_data *priv, unsigned int nport)
 		/* Enable AEQ Bypass */
 		ub960_rxport_update_bits(priv, nport, UB960_RR_AEQ_BYPASS,
 					 UB960_RR_AEQ_BYPASS_ENABLE,
-					 UB960_RR_AEQ_BYPASS_ENABLE);
+					 UB960_RR_AEQ_BYPASS_ENABLE, NULL);
 	} else {
 		ub960_rxport_set_eq_range(priv, nport,
 					  rxport->eq.aeq.eq_level_min,
@@ -1453,7 +1548,7 @@ static void ub960_rxport_config_eq(struct ub960_data *priv, unsigned int nport)
 
 		/* Disable AEQ Bypass */
 		ub960_rxport_update_bits(priv, nport, UB960_RR_AEQ_BYPASS,
-					 UB960_RR_AEQ_BYPASS_ENABLE, 0);
+					 UB960_RR_AEQ_BYPASS_ENABLE, 0, NULL);
 	}
 }
 
@@ -1469,7 +1564,7 @@ static int ub960_rxport_link_ok(struct ub960_data *priv, unsigned int nport,
 	bool errors;
 
 	ret = ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS1,
-				&rx_port_sts1);
+				&rx_port_sts1, NULL);
 	if (ret)
 		return ret;
 
@@ -1479,25 +1574,27 @@ static int ub960_rxport_link_ok(struct ub960_data *priv, unsigned int nport,
 	}
 
 	ret = ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS2,
-				&rx_port_sts2);
+				&rx_port_sts2, NULL);
 	if (ret)
 		return ret;
 
-	ret = ub960_rxport_read(priv, nport, UB960_RR_CSI_RX_STS, &csi_rx_sts);
+	ret = ub960_rxport_read(priv, nport, UB960_RR_CSI_RX_STS, &csi_rx_sts,
+				NULL);
 	if (ret)
 		return ret;
 
 	ret = ub960_rxport_read(priv, nport, UB960_RR_CSI_ERR_COUNTER,
-				&csi_err_cnt);
+				&csi_err_cnt, NULL);
 	if (ret)
 		return ret;
 
-	ret = ub960_rxport_read(priv, nport, UB960_RR_BCC_STATUS, &bcc_sts);
+	ret = ub960_rxport_read(priv, nport, UB960_RR_BCC_STATUS, &bcc_sts,
+				NULL);
 	if (ret)
 		return ret;
 
 	ret = ub960_rxport_read16(priv, nport, UB960_RR_RX_PAR_ERR_HI,
-				  &parity_errors);
+				  &parity_errors, NULL);
 	if (ret)
 		return ret;
 
@@ -1600,7 +1697,8 @@ static int ub960_rxport_wait_locks(struct ub960_data *priv,
 			continue;
 		}
 
-		ub960_rxport_read16(priv, nport, UB960_RR_RX_FREQ_HIGH, &v);
+		ub960_rxport_read16(priv, nport, UB960_RR_RX_FREQ_HIGH, &v,
+				    NULL);
 
 		if (priv->hw_data->is_ub9702) {
 			dev_dbg(dev, "\trx%u: locked, freq %llu Hz\n",
@@ -1787,7 +1885,7 @@ static void ub960_init_tx_port(struct ub960_data *priv,
 	if (!txport->non_continous_clk)
 		csi_ctl |= UB960_TR_CSI_CTL_CSI_CONTS_CLOCK;
 
-	ub960_txport_write(priv, nport, UB960_TR_CSI_CTL, csi_ctl);
+	ub960_txport_write(priv, nport, UB960_TR_CSI_CTL, csi_ctl, NULL);
 }
 
 static int ub960_init_tx_ports(struct ub960_data *priv)
@@ -1818,24 +1916,30 @@ static int ub960_init_tx_ports(struct ub960_data *priv)
 		break;
 	}
 
-	ub960_write(priv, UB960_SR_CSI_PLL_CTL, speed_select);
+	ub960_write(priv, UB960_SR_CSI_PLL_CTL, speed_select, NULL);
 
 	if (priv->hw_data->is_ub9702) {
-		ub960_write(priv, UB960_SR_CSI_PLL_DIV, pll_div);
+		ub960_write(priv, UB960_SR_CSI_PLL_DIV, pll_div, NULL);
 
 		switch (priv->tx_data_rate) {
 		case MHZ(1600):
 		default:
-			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92, 0x80);
-			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4b, 0x2a);
+			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92,
+					0x80, NULL);
+			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4b,
+					0x2a, NULL);
 			break;
 		case MHZ(800):
-			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92, 0x90);
-			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4f, 0x2a);
-			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4b, 0x2a);
+			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92,
+					0x90, NULL);
+			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4f,
+					0x2a, NULL);
+			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4b,
+					0x2a, NULL);
 			break;
 		case MHZ(400):
-			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92, 0xa0);
+			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92,
+					0xa0, NULL);
 			break;
 		}
 	}
@@ -1890,21 +1994,22 @@ static void ub960_init_rx_port_ub960(struct ub960_data *priv,
 
 	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG,
 				 UB960_RR_BCC_CONFIG_BC_FREQ_SEL_MASK,
-				 bc_freq_val);
+				 bc_freq_val, NULL);
 
 	switch (rxport->rx_mode) {
 	case RXPORT_MODE_RAW10:
 		/* FPD3_MODE = RAW10 Mode (DS90UB913A-Q1 / DS90UB933-Q1 compatible) */
 		ub960_rxport_update_bits(priv, nport, UB960_RR_PORT_CONFIG,
 					 UB960_RR_PORT_CONFIG_FPD3_MODE_MASK,
-					 0x3);
+					 0x3, NULL);
 
 		/*
 		 * RAW10_8BIT_CTL = 0b10 : 8-bit processing using upper 8 bits
 		 */
 		ub960_rxport_update_bits(priv, nport, UB960_RR_PORT_CONFIG2,
 			UB960_RR_PORT_CONFIG2_RAW10_8BIT_CTL_MASK,
-			0x2 << UB960_RR_PORT_CONFIG2_RAW10_8BIT_CTL_SHIFT);
+			0x2 << UB960_RR_PORT_CONFIG2_RAW10_8BIT_CTL_SHIFT,
+			NULL);
 
 		break;
 
@@ -1917,33 +2022,34 @@ static void ub960_init_rx_port_ub960(struct ub960_data *priv,
 	case RXPORT_MODE_CSI2_NONSYNC:
 		/* CSI-2 Mode (DS90UB953-Q1 compatible) */
 		ub960_rxport_update_bits(priv, nport, UB960_RR_PORT_CONFIG, 0x3,
-					 0x0);
+					 0x0, NULL);
 
 		break;
 	}
 
 	/* LV_POLARITY & FV_POLARITY */
 	ub960_rxport_update_bits(priv, nport, UB960_RR_PORT_CONFIG2, 0x3,
-				 rxport->lv_fv_pol);
+				 rxport->lv_fv_pol, NULL);
 
 	/* Enable all interrupt sources from this port */
-	ub960_rxport_write(priv, nport, UB960_RR_PORT_ICR_HI, 0x07);
-	ub960_rxport_write(priv, nport, UB960_RR_PORT_ICR_LO, 0x7f);
+	ub960_rxport_write(priv, nport, UB960_RR_PORT_ICR_HI, 0x07, NULL);
+	ub960_rxport_write(priv, nport, UB960_RR_PORT_ICR_LO, 0x7f, NULL);
 
 	/* Enable I2C_PASS_THROUGH */
 	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG,
 				 UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH,
-				 UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH);
+				 UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH, NULL);
 
 	/* Enable I2C communication to the serializer via the alias addr */
 	ub960_rxport_write(priv, nport, UB960_RR_SER_ALIAS_ID,
-			   rxport->ser.alias << 1);
+			   rxport->ser.alias << 1, NULL);
 
 	/* Configure EQ related settings */
 	ub960_rxport_config_eq(priv, nport);
 
 	/* Enable RX port */
-	ub960_update_bits(priv, UB960_SR_RX_PORT_CTL, BIT(nport), BIT(nport));
+	ub960_update_bits(priv, UB960_SR_RX_PORT_CTL, BIT(nport), BIT(nport),
+			  NULL);
 }
 
 static void ub960_init_rx_port_ub9702_fpd3(struct ub960_data *priv,
@@ -1984,31 +2090,36 @@ static void ub960_init_rx_port_ub9702_fpd3(struct ub960_data *priv,
 	}
 
 	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG, 0x7,
-				 bc_freq_val);
-	ub960_rxport_write(priv, nport, UB960_RR_CHANNEL_MODE, fpd_func_mode);
+				 bc_freq_val, NULL);
+	ub960_rxport_write(priv, nport, UB960_RR_CHANNEL_MODE, fpd_func_mode,
+			   NULL);
 
 	/* set serdes_eq_mode = 1 */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0xa8, 0x80);
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0xa8, 0x80,
+			NULL);
 
 	/* enable serdes driver */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x0d, 0x7f);
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x0d, 0x7f,
+			NULL);
 
 	/* set serdes_eq_offset=4 */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2b, 0x04);
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2b, 0x04,
+			NULL);
 
 	/* init default serdes_eq_max in 0xa9 */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0xa9, 0x23);
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0xa9, 0x23,
+			NULL);
 
 	/* init serdes_eq_min in 0xaa */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0xaa, 0);
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0xaa, 0, NULL);
 
 	/* serdes_driver_ctl2 control: DS90UB953-Q1/DS90UB933-Q1/DS90UB913A-Q1 */
 	ub960_ind_update_bits(priv, UB960_IND_TARGET_RX_ANA(nport), 0x1b,
-			      BIT(3), BIT(3));
+			      BIT(3), BIT(3), NULL);
 
 	/* RX port to half-rate */
 	ub960_update_bits(priv, UB960_SR_FPD_RATE_CFG, 0x3 << (nport * 2),
-			  BIT(nport * 2));
+			  BIT(nport * 2), NULL);
 }
 
 static void ub960_init_rx_port_ub9702_fpd4_aeq(struct ub960_data *priv,
@@ -2021,28 +2132,37 @@ static void ub960_init_rx_port_ub9702_fpd4_aeq(struct ub960_data *priv,
 		u8 v;
 
 		/* AEQ init */
-		ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2c, &v);
+		ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2c, &v,
+			       NULL);
 
-		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x27, v);
-		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x28, v + 1);
+		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x27, v,
+				NULL);
+		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x28,
+				v + 1, NULL);
 
-		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2b, 0x00);
+		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2b,
+				0x00, NULL);
 	}
 
 	/* enable serdes_eq_ctl2 */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x9e, 0x00);
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x9e, 0x00,
+			NULL);
 
 	/* enable serdes_eq_ctl1 */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x90, 0x40);
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x90, 0x40,
+			NULL);
 
 	/* enable serdes_eq_en */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2e, 0x40);
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2e, 0x40,
+			NULL);
 
 	/* disable serdes_eq_override */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0xf0, 0x00);
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0xf0, 0x00,
+			NULL);
 
 	/* disable serdes_gain_override */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x71, 0x00);
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x71, 0x00,
+			NULL);
 }
 
 static void ub960_init_rx_port_ub9702_fpd4(struct ub960_data *priv,
@@ -2077,32 +2197,38 @@ static void ub960_init_rx_port_ub9702_fpd4(struct ub960_data *priv,
 	}
 
 	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG, 0x7,
-				 bc_freq_val);
+				 bc_freq_val, NULL);
 
 	/* FPD4 Sync Mode */
-	ub960_rxport_write(priv, nport, UB960_RR_CHANNEL_MODE, 0);
+	ub960_rxport_write(priv, nport, UB960_RR_CHANNEL_MODE, 0, NULL);
 
 	/* add serdes_eq_offset of 4 */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2b, 0x04);
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2b, 0x04,
+			NULL);
 
 	/* FPD4 serdes_start_eq in 0x27: assign default */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x27, 0x0);
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x27, 0x0, NULL);
 	/* FPD4 serdes_end_eq in 0x28: assign default */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x28, 0x23);
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x28, 0x23,
+			NULL);
 
 	/* set serdes_driver_mode into FPD IV mode */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x04, 0x00);
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x04, 0x00,
+			NULL);
 	/* set FPD PBC drv into FPD IV mode */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x1b, 0x00);
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x1b, 0x00,
+			NULL);
 
 	/* set serdes_system_init to 0x2f */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x21, 0x2f);
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x21, 0x2f,
+			NULL);
 	/* set serdes_system_rst in reset mode */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x25, 0xc1);
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x25, 0xc1,
+			NULL);
 
 	/* RX port to 7.55G mode */
 	ub960_update_bits(priv, UB960_SR_FPD_RATE_CFG, 0x3 << (nport * 2),
-			  0 << (nport * 2));
+			  0 << (nport * 2), NULL);
 
 	ub960_init_rx_port_ub9702_fpd4_aeq(priv, rxport);
 }
@@ -2124,7 +2250,7 @@ static void ub960_init_rx_port_ub9702(struct ub960_data *priv,
 		 * 0b10 : 8-bit processing using upper 8 bits
 		 */
 		ub960_rxport_update_bits(priv, nport, UB960_RR_PORT_CONFIG2,
-					 0x3 << 6, 0x2 << 6);
+					 0x3 << 6, 0x2 << 6, NULL);
 
 		break;
 
@@ -2141,27 +2267,29 @@ static void ub960_init_rx_port_ub9702(struct ub960_data *priv,
 
 	/* LV_POLARITY & FV_POLARITY */
 	ub960_rxport_update_bits(priv, nport, UB960_RR_PORT_CONFIG2, 0x3,
-				 rxport->lv_fv_pol);
+				 rxport->lv_fv_pol, NULL);
 
 	/* Enable all interrupt sources from this port */
-	ub960_rxport_write(priv, nport, UB960_RR_PORT_ICR_HI, 0x07);
-	ub960_rxport_write(priv, nport, UB960_RR_PORT_ICR_LO, 0x7f);
+	ub960_rxport_write(priv, nport, UB960_RR_PORT_ICR_HI, 0x07, NULL);
+	ub960_rxport_write(priv, nport, UB960_RR_PORT_ICR_LO, 0x7f, NULL);
 
 	/* Enable I2C_PASS_THROUGH */
 	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG,
 				 UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH,
-				 UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH);
+				 UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH, NULL);
 
 	/* Enable I2C communication to the serializer via the alias addr */
 	ub960_rxport_write(priv, nport, UB960_RR_SER_ALIAS_ID,
-			   rxport->ser.alias << 1);
+			   rxport->ser.alias << 1, NULL);
 
 	/* Enable RX port */
-	ub960_update_bits(priv, UB960_SR_RX_PORT_CTL, BIT(nport), BIT(nport));
+	ub960_update_bits(priv, UB960_SR_RX_PORT_CTL, BIT(nport), BIT(nport),
+			  NULL);
 
 	if (rxport->cdr_mode == RXPORT_CDR_FPD4) {
 		/* unreset 960 AEQ */
-		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x25, 0x41);
+		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x25,
+				0x41, NULL);
 	}
 }
 
@@ -2196,16 +2324,16 @@ static void ub960_rxport_handle_events(struct ub960_data *priv, u8 nport)
 	/* Read interrupts (also clears most of them) */
 	if (!ret)
 		ret = ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS1,
-					&rx_port_sts1);
+					&rx_port_sts1, NULL);
 	if (!ret)
 		ret = ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS2,
-					&rx_port_sts2);
+					&rx_port_sts2, NULL);
 	if (!ret)
 		ret = ub960_rxport_read(priv, nport, UB960_RR_CSI_RX_STS,
-					&csi_rx_sts);
+					&csi_rx_sts, NULL);
 	if (!ret)
 		ret = ub960_rxport_read(priv, nport, UB960_RR_BCC_STATUS,
-					&bcc_sts);
+					&bcc_sts, NULL);
 
 	if (ret)
 		return;
@@ -2214,7 +2342,7 @@ static void ub960_rxport_handle_events(struct ub960_data *priv, u8 nport)
 		u16 v;
 
 		ret = ub960_rxport_read16(priv, nport, UB960_RR_RX_PAR_ERR_HI,
-					  &v);
+					  &v, NULL);
 		if (!ret)
 			dev_err(dev, "rx%u parity errors: %u\n", nport, v);
 	}
@@ -2273,7 +2401,8 @@ static void ub960_rxport_handle_events(struct ub960_data *priv, u8 nport)
 	if (rx_port_sts2 & UB960_RR_RX_PORT_STS2_LINE_LEN_CHG) {
 		u16 v;
 
-		ret = ub960_rxport_read16(priv, nport, UB960_RR_LINE_LEN_1, &v);
+		ret = ub960_rxport_read16(priv, nport, UB960_RR_LINE_LEN_1,
+					  &v, NULL);
 		if (!ret)
 			dev_dbg(dev, "rx%u line len changed: %u\n", nport, v);
 	}
@@ -2282,7 +2411,7 @@ static void ub960_rxport_handle_events(struct ub960_data *priv, u8 nport)
 		u16 v;
 
 		ret = ub960_rxport_read16(priv, nport, UB960_RR_LINE_COUNT_HI,
-					  &v);
+					  &v, NULL);
 		if (!ret)
 			dev_dbg(dev, "rx%u line count changed: %u\n", nport, v);
 	}
@@ -2354,7 +2483,7 @@ static int ub960_enable_tx_port(struct ub960_data *priv, unsigned int nport)
 
 	return ub960_txport_update_bits(priv, nport, UB960_TR_CSI_CTL,
 					UB960_TR_CSI_CTL_CSI_ENABLE,
-					UB960_TR_CSI_CTL_CSI_ENABLE);
+					UB960_TR_CSI_CTL_CSI_ENABLE, NULL);
 }
 
 static void ub960_disable_tx_port(struct ub960_data *priv, unsigned int nport)
@@ -2364,7 +2493,7 @@ static void ub960_disable_tx_port(struct ub960_data *priv, unsigned int nport)
 	dev_dbg(dev, "disable TX port %u\n", nport);
 
 	ub960_txport_update_bits(priv, nport, UB960_TR_CSI_CTL,
-				 UB960_TR_CSI_CTL_CSI_ENABLE, 0);
+				 UB960_TR_CSI_CTL_CSI_ENABLE, 0, NULL);
 }
 
 static int ub960_enable_rx_port(struct ub960_data *priv, unsigned int nport)
@@ -2375,7 +2504,7 @@ static int ub960_enable_rx_port(struct ub960_data *priv, unsigned int nport)
 
 	/* Enable forwarding */
 	return ub960_update_bits(priv, UB960_SR_FWD_CTL1,
-				 UB960_SR_FWD_CTL1_PORT_DIS(nport), 0);
+				 UB960_SR_FWD_CTL1_PORT_DIS(nport), 0, NULL);
 }
 
 static void ub960_disable_rx_port(struct ub960_data *priv, unsigned int nport)
@@ -2387,7 +2516,7 @@ static void ub960_disable_rx_port(struct ub960_data *priv, unsigned int nport)
 	/* Disable forwarding */
 	ub960_update_bits(priv, UB960_SR_FWD_CTL1,
 			  UB960_SR_FWD_CTL1_PORT_DIS(nport),
-			  UB960_SR_FWD_CTL1_PORT_DIS(nport));
+			  UB960_SR_FWD_CTL1_PORT_DIS(nport), NULL);
 }
 
 /*
@@ -2528,12 +2657,13 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 		switch (rxport->rx_mode) {
 		case RXPORT_MODE_RAW10:
 			ub960_rxport_write(priv, nport, UB960_RR_RAW10_ID,
-				rx_data[nport].pixel_dt | (vc << UB960_RR_RAW10_ID_VC_SHIFT));
+				rx_data[nport].pixel_dt | (vc << UB960_RR_RAW10_ID_VC_SHIFT),
+				NULL);
 
 			ub960_rxport_write(priv, rxport->nport,
 				UB960_RR_RAW_EMBED_DTYPE,
 				(rx_data[nport].meta_lines << UB960_RR_RAW_EMBED_DTYPE_LINES_SHIFT) |
-					rx_data[nport].meta_dt);
+					rx_data[nport].meta_dt, NULL);
 
 			break;
 
@@ -2550,7 +2680,8 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(3)) |
 						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(2)) |
 						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(1)) |
-						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(0)));
+						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(0)),
+						   NULL);
 			} else {
 				unsigned int i;
 
@@ -2558,7 +2689,8 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 				for (i = 0; i < 8; i++)
 					ub960_rxport_write(priv, nport,
 							   UB960_RR_VC_ID_MAP(i),
-							   (nport << 4) | nport);
+							   (nport << 4) | nport,
+							   NULL);
 			}
 
 			break;
@@ -2570,7 +2702,7 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 			fwd_ctl &= ~BIT(nport); /* forward to TX0 */
 	}
 
-	ub960_write(priv, UB960_SR_FWD_CTL1, fwd_ctl);
+	ub960_write(priv, UB960_SR_FWD_CTL1, fwd_ctl, NULL);
 
 	return 0;
 }
@@ -2986,7 +3118,7 @@ static void ub960_log_status_ub960_sp_eq(struct ub960_data *priv,
 
 	/* Strobe */
 
-	ret = ub960_read(priv, UB960_XR_AEQ_CTL1, &v);
+	ret = ub960_read(priv, UB960_XR_AEQ_CTL1, &v, NULL);
 	if (ret)
 		return;
 
@@ -2995,7 +3127,7 @@ static void ub960_log_status_ub960_sp_eq(struct ub960_data *priv,
 							  "Manual");
 
 	if (v & UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN) {
-		ret = ub960_read(priv, UB960_XR_SFILTER_CFG, &v);
+		ret = ub960_read(priv, UB960_XR_SFILTER_CFG, &v, NULL);
 		if (ret)
 			return;
 
@@ -3012,7 +3144,7 @@ static void ub960_log_status_ub960_sp_eq(struct ub960_data *priv,
 
 	/* EQ */
 
-	ret = ub960_rxport_read(priv, nport, UB960_RR_AEQ_BYPASS, &v);
+	ret = ub960_rxport_read(priv, nport, UB960_RR_AEQ_BYPASS, &v, NULL);
 	if (ret)
 		return;
 
@@ -3021,7 +3153,8 @@ static void ub960_log_status_ub960_sp_eq(struct ub960_data *priv,
 						    "Adaptive");
 
 	if (!(v & UB960_RR_AEQ_BYPASS_ENABLE)) {
-		ret = ub960_rxport_read(priv, nport, UB960_RR_AEQ_MIN_MAX, &v);
+		ret = ub960_rxport_read(priv, nport, UB960_RR_AEQ_MIN_MAX, &v,
+					NULL);
 		if (ret)
 			return;
 
@@ -3047,7 +3180,7 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 	state = v4l2_subdev_lock_and_get_active_state(sd);
 
 	for (unsigned int i = 0; i < sizeof(id); i++)
-		ub960_read(priv, UB960_SR_FPD3_RX_ID(i), &id[i]);
+		ub960_read(priv, UB960_SR_FPD3_RX_ID(i), &id[i], NULL);
 
 	dev_info(dev, "ID '%.*s'\n", (int)sizeof(id), id);
 
@@ -3061,20 +3194,24 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 			continue;
 		}
 
-		ub960_txport_read(priv, nport, UB960_TR_CSI_STS, &v);
+		ub960_txport_read(priv, nport, UB960_TR_CSI_STS, &v, NULL);
 		dev_info(dev, "\tsync %u, pass %u\n", v & (u8)BIT(1),
 			 v & (u8)BIT(0));
 
-		ub960_read16(priv, UB960_SR_CSI_FRAME_COUNT_HI(nport), &v16);
+		ub960_read16(priv, UB960_SR_CSI_FRAME_COUNT_HI(nport), &v16,
+			     NULL);
 		dev_info(dev, "\tframe counter %u\n", v16);
 
-		ub960_read16(priv, UB960_SR_CSI_FRAME_ERR_COUNT_HI(nport), &v16);
+		ub960_read16(priv, UB960_SR_CSI_FRAME_ERR_COUNT_HI(nport),
+			     &v16, NULL);
 		dev_info(dev, "\tframe error counter %u\n", v16);
 
-		ub960_read16(priv, UB960_SR_CSI_LINE_COUNT_HI(nport), &v16);
+		ub960_read16(priv, UB960_SR_CSI_LINE_COUNT_HI(nport), &v16,
+			     NULL);
 		dev_info(dev, "\tline counter %u\n", v16);
 
-		ub960_read16(priv, UB960_SR_CSI_LINE_ERR_COUNT_HI(nport), &v16);
+		ub960_read16(priv, UB960_SR_CSI_LINE_ERR_COUNT_HI(nport),
+			     &v16, NULL);
 		dev_info(dev, "\tline error counter %u\n", v16);
 	}
 
@@ -3088,7 +3225,8 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 			continue;
 		}
 
-		ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS1, &v);
+		ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS1, &v,
+				  NULL);
 
 		if (v & UB960_RR_RX_PORT_STS1_LOCK_STS)
 			dev_info(dev, "\tLocked\n");
@@ -3096,22 +3234,28 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 			dev_info(dev, "\tNot locked\n");
 
 		dev_info(dev, "\trx_port_sts1 %#02x\n", v);
-		ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS2, &v);
+		ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS2, &v,
+				  NULL);
 		dev_info(dev, "\trx_port_sts2 %#02x\n", v);
 
-		ub960_rxport_read16(priv, nport, UB960_RR_RX_FREQ_HIGH, &v16);
+		ub960_rxport_read16(priv, nport, UB960_RR_RX_FREQ_HIGH, &v16,
+				    NULL);
 		dev_info(dev, "\tlink freq %llu Hz\n", ((u64)v16 * HZ_PER_MHZ) >> 8);
 
-		ub960_rxport_read16(priv, nport, UB960_RR_RX_PAR_ERR_HI, &v16);
+		ub960_rxport_read16(priv, nport, UB960_RR_RX_PAR_ERR_HI, &v16,
+				    NULL);
 		dev_info(dev, "\tparity errors %u\n", v16);
 
-		ub960_rxport_read16(priv, nport, UB960_RR_LINE_COUNT_HI, &v16);
+		ub960_rxport_read16(priv, nport, UB960_RR_LINE_COUNT_HI, &v16,
+				    NULL);
 		dev_info(dev, "\tlines per frame %u\n", v16);
 
-		ub960_rxport_read16(priv, nport, UB960_RR_LINE_LEN_1, &v16);
+		ub960_rxport_read16(priv, nport, UB960_RR_LINE_LEN_1, &v16,
+				    NULL);
 		dev_info(dev, "\tbytes per line %u\n", v16);
 
-		ub960_rxport_read(priv, nport, UB960_RR_CSI_ERR_COUNTER, &v);
+		ub960_rxport_read(priv, nport, UB960_RR_CSI_ERR_COUNTER, &v,
+				  NULL);
 		dev_info(dev, "\tcsi_err_counter %u\n", v);
 
 		if (!priv->hw_data->is_ub9702)
@@ -3125,7 +3269,7 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 			ctl_reg = UB960_RR_BC_GPIO_CTL(i / 2);
 			ctl_shift = (i % 2) * 4;
 
-			ub960_rxport_read(priv, nport, ctl_reg, &v);
+			ub960_rxport_read(priv, nport, ctl_reg, &v, NULL);
 
 			dev_info(dev, "\tGPIO%u: mode %u\n", i,
 				 (v >> ctl_shift) & 0xf);
@@ -3168,13 +3312,13 @@ static irqreturn_t ub960_handle_events(int irq, void *arg)
 	u8 fwd_sts;
 	int ret;
 
-	ret = ub960_read(priv, UB960_SR_INTERRUPT_STS, &int_sts);
+	ret = ub960_read(priv, UB960_SR_INTERRUPT_STS, &int_sts, NULL);
 	if (ret || !int_sts)
 		return IRQ_NONE;
 
 	dev_dbg(&priv->client->dev, "INTERRUPT_STS %x\n", int_sts);
 
-	ret = ub960_read(priv, UB960_SR_FWD_STS, &fwd_sts);
+	ret = ub960_read(priv, UB960_SR_FWD_STS, &fwd_sts, NULL);
 	if (ret)
 		return IRQ_NONE;
 
@@ -3804,7 +3948,7 @@ static void ub960_reset(struct ub960_data *priv, bool reset_regs)
 	bit = reset_regs ? UB960_SR_RESET_DIGITAL_RESET1 :
 			   UB960_SR_RESET_DIGITAL_RESET0;
 
-	ub960_write(priv, UB960_SR_RESET, bit);
+	ub960_write(priv, UB960_SR_RESET, bit, NULL);
 
 	mutex_lock(&priv->reg_lock);
 
@@ -3876,7 +4020,7 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
 	ub960_reset(priv, true);
 
 	/* Runtime check register accessibility */
-	ret = ub960_read(priv, UB960_SR_REV_MASK, &rev_mask);
+	ret = ub960_read(priv, UB960_SR_REV_MASK, &rev_mask, NULL);
 	if (ret) {
 		dev_err_probe(dev, ret, "Cannot read first register, abort\n");
 		goto err_pd_gpio;
@@ -3885,14 +4029,16 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
 	dev_dbg(dev, "Found %s (rev/mask %#04x)\n", priv->hw_data->model,
 		rev_mask);
 
-	ret = ub960_read(priv, UB960_SR_DEVICE_STS, &dev_sts);
+	ret = ub960_read(priv, UB960_SR_DEVICE_STS, &dev_sts, NULL);
 	if (ret)
 		goto err_pd_gpio;
 
 	if (priv->hw_data->is_ub9702)
-		ret = ub960_read(priv, UB9702_SR_REFCLK_FREQ, &refclk_freq);
+		ret = ub960_read(priv, UB9702_SR_REFCLK_FREQ, &refclk_freq,
+				 NULL);
 	else
-		ret = ub960_read(priv, UB960_XR_REFCLK_FREQ, &refclk_freq);
+		ret = ub960_read(priv, UB960_XR_REFCLK_FREQ, &refclk_freq,
+				 NULL);
 	if (ret)
 		goto err_pd_gpio;
 
@@ -3901,7 +4047,7 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
 		clk_get_rate(priv->refclk) / HZ_PER_MHZ);
 
 	/* Disable all RX ports by default */
-	ret = ub960_write(priv, UB960_SR_RX_PORT_CTL, 0);
+	ret = ub960_write(priv, UB960_SR_RX_PORT_CTL, 0, NULL);
 	if (ret)
 		goto err_pd_gpio;
 
@@ -3909,7 +4055,8 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
 	if (priv->hw_data->is_ub9702) {
 		ret = ub960_update_bits(priv, UB960_SR_RESET,
 					UB960_SR_RESET_GPIO_LOCK_RELEASE,
-					UB960_SR_RESET_GPIO_LOCK_RELEASE);
+					UB960_SR_RESET_GPIO_LOCK_RELEASE,
+					NULL);
 		if (ret)
 			goto err_pd_gpio;
 	}
@@ -4035,7 +4182,7 @@ static int ub960_probe(struct i2c_client *client)
 #ifdef UB960_DEBUG_I2C_RX_ID
 	for (unsigned int i = 0; i < priv->hw_data->num_rxports; i++)
 		ub960_write(priv, UB960_SR_I2C_RX_ID(i),
-			    (UB960_DEBUG_I2C_RX_ID + i) << 1);
+			    (UB960_DEBUG_I2C_RX_ID + i) << 1, NULL);
 #endif
 
 	return 0;

-- 
2.48.1


