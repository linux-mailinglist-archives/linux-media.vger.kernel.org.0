Return-Path: <linux-media+bounces-59488-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLcRJbAa62lTIgAAu9opvQ
	(envelope-from <linux-media+bounces-59488-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 09:24:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B27145AAC2
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 09:24:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 668E63025A75
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 07:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C5337BE7C;
	Fri, 24 Apr 2026 07:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BAmVxJ2u"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF07373BEE
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 07:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777015376; cv=none; b=iYyybwz6Cf45bXYLUNa6irlp0YXvDiVcuU4r7vZ8JOep+6ugaJJ691vg+QpOy9rTqAYYMuO+iinn+G20SKybWB0N06jcwuiIYtsHttGYOo3QCXtjn/6VmO3I+lbXwAbvS9Y6q8fJafjG1+KDuUTKoe84QmW5SeWjNJ4YvEfe6hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777015376; c=relaxed/simple;
	bh=AaqElH9zuTNCv1HJ0+GB1hU2qCY3xf1+6Kn/cjf0+eU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lK4D2RpKtcYenWBTyb5Y0Ah9ZlAvekQM3atTafTHdkJLP4GIgT2L81vJBpKuceBZfHz1nrdfLNuMR4IA1126YYgA5IffoUF7PEmmr8L6ve3Hs6/T02mC7h6i/pQ7fzt5YhMCyUZdyIyciRJ2hpjH6qfbjd6a64SGiFqYNm8mfAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BAmVxJ2u; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38e68e4389cso79309391fa.3
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 00:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777015373; x=1777620173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eaoyCyrMENabXEPbF12o+TCRZ1+bwFFYGgCjy5VoZDY=;
        b=BAmVxJ2u6VRiC+a2xjjmjaD1Sd1Kst9H66acWDyG6V6plceg5aBDIjELYjlvbmPLY0
         NiHf8GcVSBPw/H942QTyXnPQ+Zy0xxhNn2B7zRqv2HpDrmcDrZDHBocBE5UV1D+9Ja2c
         kq2wkWGBEJQz2pdayZV9v5SkrSiXsVw9Llfxoz7QtuRFUOUBxOcJAH48XHomWMoPxk2D
         0Q/Mz1djLE6kLIQEarPYWU2fZcTw29Lso8RAkOqOqGMSBgIMPFuEDakZMqPGUIsGAR7I
         5p4lKErLaR4PJLxyU3pPrAGrVwBR4ODBmmdlLfxZIbrYMwj7yGdwLnaXXbF96bZK8ZcI
         QMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777015373; x=1777620173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eaoyCyrMENabXEPbF12o+TCRZ1+bwFFYGgCjy5VoZDY=;
        b=eCwJQQOx+OxUU25ZpAyjuJvhBk/wWr+N2ant8G9RhWAQfmj4aXihtus0+73mUD08hF
         ws8W3QBe8hNdpWduIW94JOUKgtpxZ+zsNoeB+rp2aeXN+lc+8KQLsHFLx/tWxgQ5Cwcn
         v7b/Q/9nLjsbZPSKbWGyAbCnEaaN0eojlA8Zp1sS+Xj+Pn3JOuZTjE1xLJinajDFSCOp
         7qYIQlxUe0qMAzvTtBIJN+6WQWviOVCG6RFgUlh6WfRPlW9j0nkMYJDwXs6299T9IAj/
         AT6ndei6yqFyv6RkXoXv0CuoMuR7sRjc+jQSqaPeyfGSo1WRsaiXBSmCNrWmIF93uChl
         JRyA==
X-Forwarded-Encrypted: i=1; AFNElJ/50/OApuNzqqmvoyU1phNay5IGRaSOBQ+sLBVikz6ybmaFIpQaH9fTOEWyqpH5Z44s3te2/Ru0MFC8pg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLvtI8EBrnkhenu6+IxeFSr3KrshQvG/pqr7h1BZ6K+KHK1QqM
	E48P2zvBE7tF4IUimuJJJxh90ufs2fUOcgpZe1FKvWYTn1zCOHZT+oWZ
X-Gm-Gg: AeBDievgg2xIJQ4Yfo0a7EjNNAwF5h2/EvsKmXn1rt47GUIh4CvBBOb94+xOAyLL/iR
	xQcUBaLal4yXSX80EyLp//cWqk7icBrCrOyZSTc98wrJwyCIXVBXDU+5e59GMhq8BkGUzwhllMZ
	TMJKer83ZHjdsY8p7jlarxNRdbSDh3SKc9B1IHicA4XkiMq5tq10HEZKAA87xeMA/TZQsENgeR5
	mEQtK5WFZk8dPsUxBs4Gw8J4lQrwt6K3crFSgTa7kJ3I6SR/w2BQrd6/FWviXg4SCO8EgFPnrGJ
	BkZzzmrccS/QYG1/7to3LgTjWmnRhxazDPDm2t9e8tq64UnfS8FX0NghNA2NufOVn5op+Wtycdo
	dYs+60ti1pMclUcPZxJEZVTKDvzKct6mmeCigCFk+snsvekufto/uDRJgvPD7mTljxH9JW7L3ZR
	beOfmoot9KEYInZwKkfDTdljQ=
X-Received: by 2002:a05:6512:b99:b0:5a3:cc81:efdb with SMTP id 2adb3069b0e04-5a4172de867mr9444067e87.21.1777015372443;
        Fri, 24 Apr 2026 00:22:52 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a41a238563sm5612550e87.55.2026.04.24.00.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 00:22:52 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v3 4/5] media: i2c: lm3560: Convert to use OF bindings
Date: Fri, 24 Apr 2026 10:22:29 +0300
Message-ID: <20260424072230.90354-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260424072230.90354-1-clamor95@gmail.com>
References: <20260424072230.90354-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1B27145AAC2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-59488-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Since there are no users of this driver via platform data, remove platform
data and switch to using device tree bindings.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/lm3560.c | 112 ++++++++++++++++++++++++++-----------
 include/media/i2c/lm3560.h |  15 -----
 2 files changed, 79 insertions(+), 48 deletions(-)

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index 5cd22c2fbb64..022a6a76befb 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -13,7 +13,9 @@
 #include <linux/module.h>
 #include <linux/i2c.h>
 #include <linux/slab.h>
+#include <linux/mod_devicetable.h>
 #include <linux/mutex.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/videodev2.h>
 #include <media/i2c/lm3560.h>
@@ -43,22 +45,30 @@ enum led_enable {
  * struct lm3560_flash
  *
  * @dev: pointer to &struct device
- * @pdata: platform data
  * @regmap: reg. map for i2c
  * @lock: muxtex for serial access.
  * @led_mode: V4L2 LED mode
  * @ctrls_led: V4L2 controls
  * @subdev_led: V4L2 subdev
+ * @peak: peak current
+ * @max_flash_timeout: flash timeout
+ * @max_flash_brt: flash mode led brightness
+ * @max_torch_brt: torch mode led brightness
  */
 struct lm3560_flash {
 	struct device *dev;
-	struct lm3560_platform_data *pdata;
 	struct regmap *regmap;
 	struct mutex lock;
 
 	enum v4l2_flash_led_mode led_mode;
 	struct v4l2_ctrl_handler ctrls_led[LM3560_LED_MAX];
 	struct v4l2_subdev subdev_led[LM3560_LED_MAX];
+
+	enum lm3560_peak_current peak;
+	u32 max_flash_timeout;
+
+	u32 max_flash_brt[LM3560_LED_MAX];
+	u32 max_torch_brt[LM3560_LED_MAX];
 };
 
 #define to_lm3560_flash(_ctrl, _no)	\
@@ -269,8 +279,8 @@ static int lm3560_init_controls(struct lm3560_flash *flash,
 				enum lm3560_led_id led_no)
 {
 	struct v4l2_ctrl *fault;
-	u32 max_flash_brt = flash->pdata->max_flash_brt[led_no];
-	u32 max_torch_brt = flash->pdata->max_torch_brt[led_no];
+	u32 max_flash_brt = flash->max_flash_brt[led_no];
+	u32 max_torch_brt = flash->max_torch_brt[led_no];
 	struct v4l2_ctrl_handler *hdl = &flash->ctrls_led[led_no];
 	const struct v4l2_ctrl_ops *ops = &lm3560_led_ctrl_ops[led_no];
 
@@ -295,9 +305,9 @@ static int lm3560_init_controls(struct lm3560_flash *flash,
 	/* flash strobe timeout */
 	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_FLASH_TIMEOUT,
 			  LM3560_FLASH_TOUT_MIN,
-			  flash->pdata->max_flash_timeout,
+			  flash->max_flash_timeout,
 			  LM3560_FLASH_TOUT_STEP,
-			  flash->pdata->max_flash_timeout);
+			  flash->max_flash_timeout);
 
 	/* flash brt */
 	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_FLASH_INTENSITY,
@@ -339,15 +349,18 @@ static const struct regmap_config lm3560_regmap = {
 };
 
 static int lm3560_subdev_init(struct lm3560_flash *flash,
-			      enum lm3560_led_id led_no, char *led_name)
+			      enum lm3560_led_id led_no,
+			      struct fwnode_handle *fwnode)
 {
 	struct i2c_client *client = to_i2c_client(flash->dev);
 	int rval;
 
 	v4l2_i2c_subdev_init(&flash->subdev_led[led_no], client, &lm3560_ops);
 	flash->subdev_led[led_no].flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
-	strscpy(flash->subdev_led[led_no].name, led_name,
-		sizeof(flash->subdev_led[led_no].name));
+	snprintf(flash->subdev_led[led_no].name,
+		 sizeof(flash->subdev_led[led_no].name),
+		 "lm3560-led%d", led_no);
+	flash->subdev_led[led_no].fwnode = fwnode;
 	rval = lm3560_init_controls(flash, led_no);
 	if (rval)
 		goto err_out;
@@ -377,7 +390,7 @@ static int lm3560_init_device(struct lm3560_flash *flash)
 
 	/* set peak current */
 	rval = regmap_update_bits(flash->regmap,
-				  REG_FLASH_TOUT, 0x60, flash->pdata->peak);
+				  REG_FLASH_TOUT, 0x60, flash->peak);
 	if (rval < 0)
 		return rval;
 	/* output disable */
@@ -393,8 +406,9 @@ static int lm3560_init_device(struct lm3560_flash *flash)
 static int lm3560_probe(struct i2c_client *client)
 {
 	struct lm3560_flash *flash;
-	struct lm3560_platform_data *pdata = dev_get_platdata(&client->dev);
-	int rval;
+	struct fwnode_handle *node;
+	u32 peak_ua;
+	int rval, reg;
 
 	flash = devm_kzalloc(&client->dev, sizeof(*flash), GFP_KERNEL);
 	if (flash == NULL)
@@ -406,36 +420,60 @@ static int lm3560_probe(struct i2c_client *client)
 		return rval;
 	}
 
-	/* if there is no platform data, use chip default value */
-	if (pdata == NULL) {
-		pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
-		if (pdata == NULL)
-			return -ENODEV;
-		pdata->peak = LM3560_PEAK_3600mA;
-		pdata->max_flash_timeout = LM3560_FLASH_TOUT_MAX;
-		/* led 1 */
-		pdata->max_flash_brt[LM3560_LED0] = LM3560_FLASH_BRT_MAX;
-		pdata->max_torch_brt[LM3560_LED0] = LM3560_TORCH_BRT_MAX;
-		/* led 2 */
-		pdata->max_flash_brt[LM3560_LED1] = LM3560_FLASH_BRT_MAX;
-		pdata->max_torch_brt[LM3560_LED1] = LM3560_TORCH_BRT_MAX;
-	}
-	flash->pdata = pdata;
 	flash->dev = &client->dev;
 	mutex_init(&flash->lock);
 
-	rval = lm3560_subdev_init(flash, LM3560_LED0, "lm3560-led0");
-	if (rval < 0)
-		return rval;
+	flash->peak = LM3560_PEAK_1600mA;
+	rval = device_property_read_u32(flash->dev,
+					"ti,peak-current-microamp", &peak_ua);
+	if (!rval) {
+		switch (peak_ua) {
+		case 16000000:
+			flash->peak = LM3560_PEAK_1600mA;
+			break;
+		case 23000000:
+			flash->peak = LM3560_PEAK_2300mA;
+			break;
+		case 30000000:
+			flash->peak = LM3560_PEAK_3000mA;
+			break;
+		case 36000000:
+			flash->peak = LM3560_PEAK_3600mA;
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
 
-	rval = lm3560_subdev_init(flash, LM3560_LED1, "lm3560-led1");
-	if (rval < 0)
-		return rval;
+	flash->max_flash_timeout = LM3560_FLASH_TOUT_MIN * 1000;
+	device_property_read_u32(flash->dev, "flash-max-timeout-us",
+				 &flash->max_flash_timeout);
+	flash->max_flash_timeout /= 1000;
 
 	rval = lm3560_init_device(flash);
 	if (rval < 0)
 		return rval;
 
+	device_for_each_child_node(flash->dev, node) {
+		fwnode_property_read_u32(node, "reg", &reg);
+
+		if (reg == LM3560_LED0 || reg == LM3560_LED1) {
+			flash->max_flash_brt[reg] = LM3560_FLASH_BRT_MIN;
+			fwnode_property_read_u32(node, "flash-max-microamp",
+						 &flash->max_flash_brt[reg]);
+
+			flash->max_torch_brt[reg] = LM3560_TORCH_BRT_MIN;
+			fwnode_property_read_u32(node, "led-max-microamp",
+						 &flash->max_torch_brt[reg]);
+
+			rval = lm3560_subdev_init(flash, reg, node);
+			if (rval < 0)
+				return dev_err_probe(flash->dev, rval,
+						    "failed to register led%d\n",
+						    reg);
+		}
+	}
+
 	i2c_set_clientdata(client, flash);
 
 	return 0;
@@ -453,6 +491,13 @@ static void lm3560_remove(struct i2c_client *client)
 	}
 }
 
+static const struct of_device_id lm3560_of_match[] = {
+	{ .compatible = "ti,lm3559" },
+	{ .compatible = "ti,lm3560" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lm3560_of_match);
+
 static const struct i2c_device_id lm3560_id_table[] = {
 	{ LM3559_NAME },
 	{ LM3560_NAME },
@@ -465,6 +510,7 @@ static struct i2c_driver lm3560_i2c_driver = {
 	.driver = {
 		   .name = LM3560_NAME,
 		   .pm = NULL,
+		   .of_match_table = lm3560_of_match,
 		   },
 	.probe = lm3560_probe,
 	.remove = lm3560_remove,
diff --git a/include/media/i2c/lm3560.h b/include/media/i2c/lm3560.h
index 770d8c72c94a..b56c1ff8fd49 100644
--- a/include/media/i2c/lm3560.h
+++ b/include/media/i2c/lm3560.h
@@ -66,19 +66,4 @@ enum lm3560_peak_current {
 	LM3560_PEAK_3600mA = 0x60
 };
 
-/* struct lm3560_platform_data
- *
- * @peak :  peak current
- * @max_flash_timeout: flash timeout
- * @max_flash_brt: flash mode led brightness
- * @max_torch_brt: torch mode led brightness
- */
-struct lm3560_platform_data {
-	enum lm3560_peak_current peak;
-
-	u32 max_flash_timeout;
-	u32 max_flash_brt[LM3560_LED_MAX];
-	u32 max_torch_brt[LM3560_LED_MAX];
-};
-
 #endif /* __LM3560_H__ */
-- 
2.51.0


