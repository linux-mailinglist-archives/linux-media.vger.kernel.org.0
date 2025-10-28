Return-Path: <linux-media+bounces-45745-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 255DFC134D2
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 08:31:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 759341899906
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 07:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503B82D660E;
	Tue, 28 Oct 2025 07:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RIlDdkm4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8222D543E;
	Tue, 28 Oct 2025 07:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761636516; cv=none; b=uXvePCM4UMwDu2gCkS/bOSYsOELdEfdAZgknNtDkOAZ8CPqsHXhkcmeCDWsyjygJH/QmbG28YE+0niMDHBU0Ws1ou7GYqMUwVbhetbnXiWy5eyNFmMck1mhFBazOQIup6jE9hQamoArTh1ghT3bKXV8MKhhUMhnHuY6+ty034MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761636516; c=relaxed/simple;
	bh=q+StBYTzmejv/5l/RiGMUXSrJLwqE/dTzzi+5/MoYY4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BSBPijRCwJQdYd9B/C4BtiKnswpf6bddcuI4ge3BzrreQdm5DbekzNtsocRqhSRqGTDswUUNpdd22mJPPE9dx4LsyiMiz2yaUK9YW8OT4huDmBQGxYV5xd5HUbo7QAX/2RSHqpMt828tv1ffADDVDQq6JRgGJ59P8x/kL3tJfDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RIlDdkm4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2344816CD;
	Tue, 28 Oct 2025 08:26:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761636405;
	bh=q+StBYTzmejv/5l/RiGMUXSrJLwqE/dTzzi+5/MoYY4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RIlDdkm47a8oRu7Z2r01nJopJ9Cl2/++aaMCWFBp17CnuaSKUMjelVnR8vIIsVbzu
	 HfR0uD/i3GWUlsaav8wtwvQLqbm5RpmTpF8W3oGN9JJGCGSaeZuT8TmGqURnsgtBQ7
	 VVemHTSld1NC+1ltQ3+RCdbhhQzqKBgmWe6NGyqY=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 28 Oct 2025 12:57:18 +0530
Subject: [PATCH 07/13] media: i2c: ov5647: Add support for regulator
 control.
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-b4-rpi-ov5647-v1-7-098413454f5e@ideasonboard.com>
References: <20251028-b4-rpi-ov5647-v1-0-098413454f5e@ideasonboard.com>
In-Reply-To: <20251028-b4-rpi-ov5647-v1-0-098413454f5e@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, 
 "Ivan T. Ivanov" <iivanov@suse.de>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3299;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=mWcpcpF6s2jr/LpS7qwHjUxpm3VuRWyeuyBAMhYHvTs=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpAHBwLU6weLK1hXNoS4ohKmzLElXLBLJCgtlsD
 wvvMRjytfmJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaQBwcAAKCRBD3pH5JJpx
 RZGdD/4/W+XTFslGF6zX0HGwviFdZUoo8Ylg/wAERX/hQC8J/A/LPvXqgpFKv7GIU7//9/BZdXt
 2P67m2/JGHMH0bifCMawaAF/bMQ+IBlL5mQYy8yj7lc9NLHHGPje1kj9nI4v9VXJRxHA433ocXy
 EieGrZKdi9EmfrhXtkwVqu9sNVdIR+4Mk2AbBmm8dnrIA8JfTa/hgt/+D4WMfKy1hGdDcbBeY+5
 FSaXcj3MB2Kv+TZFCijO8smjj10Kn/bhxmyO/4p6s1SfXjRp6IbYD18cZc5OPkQdCG+NMuSqe0v
 jmnThGvXKaUz6bZKnJIzyVJgPPaJQI6C/t3gaqLFS6YfvvQ3QGBOXdlXXfrWZAU11e8xD0E2RZh
 /rWy8rQhGmcMQKD/qcSw7s+HmAiKb1Ht4bD7rMis7DGSiwYRtd+kHS3L7nxayHfn3dT2R0au1W3
 /UbztBxbV+7v+W9A6TPuFhwf1fgPa6VFapj/Pgy9MlaF4Z7zQbupcYNTYnkqMDx/Mffaj63teCq
 RT77Qxg1GJRhWPmu6z7dtYCF0c6MAF3DABFG+O7tPPZKf1xdAuT7um8hu+zSdms/uNvIfu+ShpM
 g6aP9ZPlT8h31FZYA0R4Xyeo4ATO3F7r1IT4H3QcmSgEcte7XOxwnTgLPik3R9HbT+gIMKnqwjW
 mCfgq9KyUYcvw3Q==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The driver supported using GPIOs to control the shutdown line,
but no regulator control.

Add regulator hooks.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index a33e2d8edc114d302e830639cb7cb161f16a6208..598764638d518a28c8ac61ea590b996f09ecd45c 100644
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
@@ -83,6 +84,15 @@
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
@@ -104,6 +114,7 @@ struct ov5647 {
 	struct mutex			lock;
 	struct clk			*xclk;
 	struct gpio_desc		*pwdn;
+	struct regulator_bulk_data supplies[OV5647_NUM_SUPPLIES];
 	bool				clock_ncont;
 	struct v4l2_ctrl_handler	ctrls;
 	const struct ov5647_mode	*mode;
@@ -781,6 +792,12 @@ static int ov5647_power_on(struct device *dev)
 
 	dev_dbg(dev, "OV5647 power on\n");
 
+	ret = regulator_bulk_enable(OV5647_NUM_SUPPLIES, sensor->supplies);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable regulators\n");
+		return ret;
+	}
+
 	if (sensor->pwdn) {
 		gpiod_set_value_cansleep(sensor->pwdn, 0);
 		msleep(PWDN_ACTIVE_DELAY_MS);
@@ -812,6 +829,7 @@ static int ov5647_power_on(struct device *dev)
 	clk_disable_unprepare(sensor->xclk);
 error_pwdn:
 	gpiod_set_value_cansleep(sensor->pwdn, 1);
+	regulator_bulk_disable(OV5647_NUM_SUPPLIES, sensor->supplies);
 
 	return ret;
 }
@@ -841,6 +859,7 @@ static int ov5647_power_off(struct device *dev)
 
 	clk_disable_unprepare(sensor->xclk);
 	gpiod_set_value_cansleep(sensor->pwdn, 1);
+	regulator_bulk_disable(OV5647_NUM_SUPPLIES, sensor->supplies);
 
 	return 0;
 }
@@ -1341,6 +1360,18 @@ static const struct v4l2_ctrl_ops ov5647_ctrl_ops = {
 	.s_ctrl = ov5647_s_ctrl,
 };
 
+static int ov5647_configure_regulators(struct device *dev,
+				       struct ov5647 *sensor)
+{
+	unsigned int i;
+
+	for (i = 0; i < OV5647_NUM_SUPPLIES; i++)
+		sensor->supplies[i].supply = ov5647_supply_names[i];
+
+	return devm_regulator_bulk_get(dev, OV5647_NUM_SUPPLIES,
+				       sensor->supplies);
+}
+
 static int ov5647_init_controls(struct ov5647 *sensor, struct device *dev)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
@@ -1489,6 +1520,12 @@ static int ov5647_probe(struct i2c_client *client)
 		return -EINVAL;
 	}
 
+	ret = ov5647_configure_regulators(dev, sensor);
+	if (ret) {
+		dev_err(dev, "Failed to get power regulators\n");
+		return ret;
+	}
+
 	mutex_init(&sensor->lock);
 
 	sensor->mode = OV5647_DEFAULT_MODE;

-- 
2.51.0


