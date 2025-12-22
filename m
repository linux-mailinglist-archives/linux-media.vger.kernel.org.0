Return-Path: <linux-media+bounces-49293-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AA6CD4F4B
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 09:17:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5140E3008552
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 08:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C51C130BF6C;
	Mon, 22 Dec 2025 08:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n+ypKPdk"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136A62FFDFA;
	Mon, 22 Dec 2025 08:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391399; cv=none; b=q5Ng5uMwjNKZcPtyZOOBLfJc2opMrDmO+CaCyEqI9LDyEBPS+ltRrzYiAMVMAE8Wme3rGscDUOU3flZkoFhFT2ZSfFpuBrjFuMLHppaRmkbQsMXDCzxb4M2hP7DZ2kjt1/9ZAM+MbwiPYo8htr4H1RWNjAhay79+qLKAeZa8grw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391399; c=relaxed/simple;
	bh=kefQE8mReVrABt7LqfOZKMWwYSonjFGtLMSpRBQkcmY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O4kK60JiJW8PXdL6ltoTnDAB2hF1Un3RcBhADiwwfKPgSgQwBlvFCFnmre66zgjs+xsrtgB9yeeTdlz8tZqg7SS9tU3UZ32kEP3jni+OkvbIshpQeye+FCOLy6/UeKtI3eVnhKDmTCMonwwoMHOAvOi4yxrlpRuKbkrqBACQ/HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=n+ypKPdk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:aa51:d08b:9316:9524:9005])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F75B10BE;
	Mon, 22 Dec 2025 09:16:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766391385;
	bh=kefQE8mReVrABt7LqfOZKMWwYSonjFGtLMSpRBQkcmY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=n+ypKPdkU7W3VfWLAi61/p8pg6qVE45v+hHPc+LS9vl2gWOQrOP2SIX7oEpJfTlnQ
	 9O0Bok6+uJ7X78z+9osfd7LPi6r1ShW++CyTgklk5EwTKPku1REL1YBOSXKLQTPYFN
	 7rgZdqYGjjaK7PFr4DgKCWtYZxuLN1CF7bgAETDs=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 22 Dec 2025 13:45:31 +0530
Subject: [PATCH v4 07/17] media: i2c: ov5647: Add support for regulator
 control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-b4-rpi-ov5647-v4-7-b949c7309280@ideasonboard.com>
References: <20251222-b4-rpi-ov5647-v4-0-b949c7309280@ideasonboard.com>
In-Reply-To: <20251222-b4-rpi-ov5647-v4-0-b949c7309280@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3681;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=lvVYHwVmsKV9spZ76QPPef2+GBZvninJTagnHyY5ZPc=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpSP4nLXexlVfYNzo20hIX5bOP+IeSTJLxkpf5A
 8pHCXAUj/mJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaUj+JwAKCRBD3pH5JJpx
 RQ+YEACPBXkU/Tpxo+h8svTsCxCsLYsIf9xUM1xcdrXUi+okGqnC9tb8soFHge5Qstrp9zbnCWN
 teIW38JLwGw9jFns/2sXbSImr9WEwIV9sJYfda8Ikz6xW2hUui5yrHM4eV2+S+CV/5FuR7eG9A6
 GlkIwM/V68AxwfuQLnGLaziAAIkebQmWSHHLVnhF4n1EkgZIRPHhub9fldGQab4xX/kGeAS8J5g
 nFrG3rE/zOg2ZtpYBLbDUbOpM6wilIyrRuEtlHoDIw1EJdyTc9ZIZarzW9P837wmO4JNPGw6Kps
 FBQRWAUcYxLC+2zB5AO0zu1K2oquixVKmI7rLurvdTMC+2Eohjwjz100dtYLzu0/y0dxpdll4BI
 UkR1Y65nps91eyedCrhwMmOLppolWABiOAjcBQvzjnJpLKpU0nj+8YVPp+gMzq0mgqd7oR09iBu
 JqPHOqyYO9Oo9z7VnfwRByy56yNqCLFlPpvJco1Ja3+t0T3307IkuXv0HOwSCrofI9afspjfZpQ
 KwQJdmb7fonNIEYWEFxdFz1R01OoXlVegm/YizqKg8kEzD/6YoFH6J9XYUApEelOQO57BOl+Qhs
 Z+TqS4iUaYBEyLIm7ISo7rCc+zB3wap0NIYve/I99XYXqdXjb2dhm35U2+4zi5N0UeMal3lDBOD
 bRwe7raG2S9UWLQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The driver supported using GPIOs to control the shutdown line,
but no regulator control.

Add regulator hooks.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 43 ++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index bf5b0bd8d6acbe246e54b566c3d8f8044e688110..774d16335ebf4bdd0076cd4fdd2d8ef4a7c34906 100644
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
2.52.0


