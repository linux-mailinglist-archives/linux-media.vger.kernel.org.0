Return-Path: <linux-media+bounces-48754-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A618ACBCE33
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 09:00:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E697B3046ED3
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 07:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FBDF32BF38;
	Mon, 15 Dec 2025 07:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HmXP39gs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4A232B9B9;
	Mon, 15 Dec 2025 07:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765783888; cv=none; b=b7ks108RtWCo3YqJiPMrIGwKwcsSkEdlOuTUhmhxy4aHiGkgqWQFNkxM9xeq4LYIFgdrdBp3SbXFw365KqGc59Z+vczJjUW+x5Mn1SsVlvWhcSc2/FJ9POH7g96rodLm51QWWkrhDvxx+InQDvdCbcisScbHCmL5Qx8JY2eYEKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765783888; c=relaxed/simple;
	bh=zPZgRLwVjnlgCuKqeRvcMrA4dlvPujhby4eouLW4PTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K9KcIrndG9XBg9YfwEfnO+yd73etaNH6mfKQtkOTcKD38xzh/2BNAvM4JVJDiouTVV69oreL/SImGj/urgew3sV4ni5Cfeg5L1tuLFazs5rJ1NgcJKY9AgIN0bT89W+LF8xZ0ywL9F8iWIARZLq/SalfD2oyi6iL1Eo5pxCVaIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HmXP39gs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.82.135])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1CF1DC6F;
	Mon, 15 Dec 2025 08:31:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765783880;
	bh=zPZgRLwVjnlgCuKqeRvcMrA4dlvPujhby4eouLW4PTg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HmXP39gsmpirztVjd8KuhE5oESyE08BEAfs3mGsGfMczGWwLT9lujQHwGhDDrg4Ty
	 OrfVRyuTHz0TfKZ1t1EVgRnKcICtZbE/UNjiGzx1NTvQVtz3mPVTitH3T/r1FuvTWa
	 6eI3ISrWngUcRqXKtQ8QJAk90vTuYBH/7SZNMirU=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 15 Dec 2025 12:58:02 +0530
Subject: [PATCH v3 06/16] media: i2c: ov5647: Add support for regulator
 control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-b4-rpi-ov5647-v3-6-4c25e3c883b2@ideasonboard.com>
References: <20251215-b4-rpi-ov5647-v3-0-4c25e3c883b2@ideasonboard.com>
In-Reply-To: <20251215-b4-rpi-ov5647-v3-0-4c25e3c883b2@ideasonboard.com>
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
 bh=1h7ZxbMy6ynz3DbAHx9qnsw1Awuwkhi+WXWbjzUa3/4=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpP7jcMoL8ZqsuoUSJj0NNF/Ji8nC7+H2xkT5lq
 8mrg9eHqG+JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaT+43AAKCRBD3pH5JJpx
 RaYLD/48yGXxVVS1nsu6LCDbf68pblnM7+HpLXVcL07rN4Cr2JnAepHeSmet6lUAo/ows9hd+Qw
 IieAtge/CsuOkS+PevruNjv/rh3VxMfKCc1fLcQNplPovwwVsCpEJCywCHUp3v+vWCH74JtxU8Z
 hhyj/k/z93Q2Y5ptgmqyK7uit48ssE18xvnzfaYCnh04j5XEiDKJMDF3jgd40oOqEDylqhGhCBK
 IlYuDrsfDhGSdFSiY10ealAly8GidMdIp33sp0db9LRFpuyUG0EXoOn5li+VOA/4pf/3wSLEzzb
 GDubYNf8YwwfgfEO+mv80+s096j7Zjghy5LR2a9zGb0N2+FwILYhogDRTg1eTbT7Afbdj58mY3b
 gNba6tcaVtWfh3BmCRNuvSiRKDyz9FouVmq4iKRVI4MJkzPJjIOS0Veqx5qd2r4t94oDxG9cNKg
 CBiPZ7Iq4BCUHhGcxf6427P45WYbuMVkApHhTCQamLkHXUXNG9fJfoxsrFkCb0fGhbH5aY/7a3q
 ch/Tao64lk0cNF5TPvvJ/G/3RtnB+1TI1XB2xBAUzHJW/oPQmxWgAnp1KQPzIiGGNKR6TIknI+W
 mp2lVi6Js5eAXV+fvbEaws5aoD9ne8NbeR+/7CJporfeyy1YumACWSIJ+hesZdANqFLU3jTg5Pe
 eO+Yk/P15YNt6uQ==
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
2.52.0


