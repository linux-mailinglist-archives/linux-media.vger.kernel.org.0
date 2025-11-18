Return-Path: <linux-media+bounces-47278-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 24922C69479
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 13:10:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 00C843664DE
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 12:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B964831280D;
	Tue, 18 Nov 2025 12:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="p6/2wEwe"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5363563EB;
	Tue, 18 Nov 2025 12:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763467440; cv=none; b=rrA7wUcA31uaudsvjkQyLRwcv/VkE6kxYYYCwy9Qw6pbEloxITQmlweZAMuzol9OFuxstH4fZTRPQhjmYOJdmicnZridXcdHVzxzLwkQtBgdgqSprzzhZ1Bad3lF89fP/iRcLq9EWPRqdsmYCQWShQ+117q323a1x5xeAR8Kpdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763467440; c=relaxed/simple;
	bh=BbYnf+lZQKtPcDsbMtt5Y0Jkyyr/gp91qMKAv+n6olc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t0nhemDs/gPbomirKzWVbwwx4DRoFAemcik59mNCE3BqkDiNEKAsYqZTfiq4OH+Vhhni8+k16J5DqnM/OAzlWk7wZw6L1203GkcuDct+wmpOzZX42FKG7oAV21OqFIur5LpOyX5zEtaOHAJMSMjZTSaRcle9xJhcDZT98AqsQFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=p6/2wEwe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:4b0d:7040:4d69:4c7c:d231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0545120FF;
	Tue, 18 Nov 2025 13:01:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763467313;
	bh=BbYnf+lZQKtPcDsbMtt5Y0Jkyyr/gp91qMKAv+n6olc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=p6/2wEwen1KiVX0gQpnq4d4rMk/EJKRlSlDUOrKFQU5UAzeX+/nVF7DwX8X9lbrTE
	 WUA0jhl2vxyURvTIXCQhSQFKy0ybZcpHcoANIXczGy2ODLYiTMqiOSkcXOcyJubCsn
	 oXglo3oXvcslbvJj7M1XHkaCeniGqtqiXoqCDYww=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 18 Nov 2025 17:32:59 +0530
Subject: [PATCH v2 06/16] media: i2c: ov5647: Add support for regulator
 control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-b4-rpi-ov5647-v2-6-5e78e7cb7f9b@ideasonboard.com>
References: <20251118-b4-rpi-ov5647-v2-0-5e78e7cb7f9b@ideasonboard.com>
In-Reply-To: <20251118-b4-rpi-ov5647-v2-0-5e78e7cb7f9b@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Naushir Patuck <naush@raspberrypi.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, 
 "Ivan T. Ivanov" <iivanov@suse.de>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3622;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=pN7HijDRVxQuU0cEhXwHce7FLXdp1+/5EWj5OBY67sk=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpHGB/bbhW8NCa+ulRYE7DQRF2O00XjWejTilnl
 NIlYEmq8qaJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaRxgfwAKCRBD3pH5JJpx
 RV2nEACJgTmWtgs5PyDtZsVYccWnJRMxZDgNkrMTtEbXy0c0nlcuTCKEDjLPzpzFWW3g3mveDHw
 GPcSF/nQ68sYx3cUcxJAR9eyRnpuv9/vck43m7NkyCHZlNAdRrndq2P0NzzuttKla4OJQ9Or0oS
 YiBvxLpf2VmHWpoQnnvf7kAnwiFmfp/Gx8n/V1lYUclYYi/8SzLDagtjyIiprX9gr4ZmYb/4KRW
 /srd4DCK5DTdlVhbN39i3fMCxvTZCd9eclJNBDfja77VAbxqOQmsaUWLLWbzK7FaozEJJz7eMM0
 k0yHdWlAjoPkLQNwFp0vN7zXGbwz4xaDReris6LvnPIM3LRG7jVe8KwqXFI815NnYh+jDGVmvcU
 tI5NfJDxIUG6RvYXAvmy9jYme37LZBkpNLbA2yleIgQUHpKMhdy1vxkIbQy4jmAIuxWaH6opL1r
 m08eupMRbGeKSp7SqBOMF5VaWrIFQoTFN9Ylq3vaVFpznMlg6cjH6Ijxmzcin7Zi2xSA2vVYU8D
 rGt9CTOw5QiSYEdD54J57ZJPL5kXHaufdbOf9F3ndtOv+uYnbjHt4G2Y/Zyc25QsmUF7U4kIFnb
 7J6mi6omYf5QjZZekm1BQdgBicGfxaGV/7gcXmYraXaP/R6Kywc7dBXul3aPVAXPfGnszl/nJwz
 V1H9RAH/dYwbF5Q==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The driver supported using GPIOs to control the shutdown line,
but no regulator control.

Add regulator hooks.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 43 ++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index c0f1121b025e5592d6fd4d5fd23e4262dde2d84c..dbc134af06a26e0e31b12a6360d794afa8bad5dd 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -20,6 +20,7 @@
 #include <linux/module.h>
 #include <linux/of_graph.h>
 #include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/videodev2.h>
 #include <media/v4l2-ctrls.h>
@@ -81,6 +82,15 @@
 #define OV5647_EXPOSURE_DEFAULT		1000
 #define OV5647_EXPOSURE_MAX		65535
 
+/* regulator supplies */
+static const char * const ov5647_supply_names[] = {
+	"avdd",		/* Analog power */
+	"dovdd",	/* Digital I/O power */
+	"dvdd",		/* Digital core power */
+};
+
+#define OV5647_NUM_SUPPLIES ARRAY_SIZE(ov5647_supply_names)
+
 struct regval_list {
 	u16 addr;
 	u8 data;
@@ -102,6 +112,7 @@ struct ov5647 {
 	struct mutex			lock;
 	struct clk			*xclk;
 	struct gpio_desc		*pwdn;
+	struct regulator_bulk_data	supplies[OV5647_NUM_SUPPLIES];
 	bool				clock_ncont;
 	struct v4l2_ctrl_handler	ctrls;
 	const struct ov5647_mode	*mode;
@@ -777,11 +788,20 @@ static int ov5647_power_on(struct device *dev)
 
 	dev_dbg(dev, "OV5647 power on\n");
 
-	if (sensor->pwdn) {
-		gpiod_set_value_cansleep(sensor->pwdn, 0);
-		msleep(PWDN_ACTIVE_DELAY_MS);
+	ret = regulator_bulk_enable(OV5647_NUM_SUPPLIES, sensor->supplies);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable regulators: %d\n", ret);
+		return ret;
+	}
+
+	ret = gpiod_set_value_cansleep(sensor->pwdn, 0);
+	if (ret < 0) {
+		dev_err(dev, "pwdn gpio set value failed: %d\n", ret);
+		goto error_reg_disable;
 	}
 
+	msleep(PWDN_ACTIVE_DELAY_MS);
+
 	ret = clk_prepare_enable(sensor->xclk);
 	if (ret < 0) {
 		dev_err(dev, "clk prepare enable failed\n");
@@ -808,6 +828,8 @@ static int ov5647_power_on(struct device *dev)
 	clk_disable_unprepare(sensor->xclk);
 error_pwdn:
 	gpiod_set_value_cansleep(sensor->pwdn, 1);
+error_reg_disable:
+	regulator_bulk_disable(OV5647_NUM_SUPPLIES, sensor->supplies);
 
 	return ret;
 }
@@ -837,6 +859,7 @@ static int ov5647_power_off(struct device *dev)
 
 	clk_disable_unprepare(sensor->xclk);
 	gpiod_set_value_cansleep(sensor->pwdn, 1);
+	regulator_bulk_disable(OV5647_NUM_SUPPLIES, sensor->supplies);
 
 	return 0;
 }
@@ -1284,6 +1307,16 @@ static const struct v4l2_ctrl_ops ov5647_ctrl_ops = {
 	.s_ctrl = ov5647_s_ctrl,
 };
 
+static int ov5647_configure_regulators(struct device *dev,
+				       struct ov5647 *sensor)
+{
+	for (unsigned int i = 0; i < OV5647_NUM_SUPPLIES; i++)
+		sensor->supplies[i].supply = ov5647_supply_names[i];
+
+	return devm_regulator_bulk_get(dev, OV5647_NUM_SUPPLIES,
+				       sensor->supplies);
+}
+
 static int ov5647_init_controls(struct ov5647 *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
@@ -1416,6 +1449,10 @@ static int ov5647_probe(struct i2c_client *client)
 		return -EINVAL;
 	}
 
+	ret = ov5647_configure_regulators(dev, sensor);
+	if (ret)
+		dev_err_probe(dev, ret, "Failed to get power regulators\n");
+
 	mutex_init(&sensor->lock);
 
 	sensor->mode = OV5647_DEFAULT_MODE;

-- 
2.51.1


