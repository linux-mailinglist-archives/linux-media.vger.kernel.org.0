Return-Path: <linux-media+bounces-37372-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85537B00A9D
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:51:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7AC07BC7AA
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46F92F1FDB;
	Thu, 10 Jul 2025 17:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bll+owme"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975642F0C72
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169769; cv=none; b=Lwy7mlxqml7tad/MgKGmI0G3l6foRakHJdcMzZQ1H3JN/zKwriGqzVMWs/RF8YbVj2NNDnCm9WHYq6IpqKHuXs6UQVUs0oWhD5zvLS6OXVRcSJtxKbZfd27ILSQkXIODAB/dOMsFr+3BWQydC8PVjhXabbMbszM9WDPisC0OiZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169769; c=relaxed/simple;
	bh=+h9u9mGpxO1TTKi+XjI//MC6zJYbtGnjieGhJ5snc1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZznY8a1ToD70a55zTMmSffHsJQ5qGz8po38vzeD2ou01AD2K1U9sM3ZtqOS/9dhLkO/xK1k1V440IR1KLXhaJsPinWJdo9CIscadCWgLZG9RVbHXbWBFCdR8eCsFbfxeuMOQz/gJZZJyuNERql3HYQEHFRavqIFbyIJ37yKDCUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bll+owme; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 05AF41AD5;
	Thu, 10 Jul 2025 19:48:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169737;
	bh=+h9u9mGpxO1TTKi+XjI//MC6zJYbtGnjieGhJ5snc1g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bll+owmeHMzKW1CNkjg8WTZt1bOmX2/u81iNJW2+Z6BG/gM5evg+VdU8eQ4yxmrLM
	 KW2WkI0HrM0JfG8iL8cwgRRrl4woh/B9KwcQXYUpnHcs4J2BGsxn/O5Ikf6PE1DIE2
	 ZpYL4nYw+VJF8SSWoLbahubHfFimOUJnpeY8AJ9A=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>
Subject: [PATCH 29/72] media: i2c: imx335: Use V4L2 sensor clock helper
Date: Thu, 10 Jul 2025 20:47:25 +0300
Message-ID: <20250710174808.5361-30-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several camera sensor drivers access the "clock-frequency" property
directly to retrieve the external clock rate, or modify the clock rate
of the external clock programmatically. Both behaviours are valid on
a subset of ACPI platforms, but are considered deprecated on OF
platforms, and do not support ACPI platforms that implement MIPI DisCo
for Imaging. Implementing them manually in drivers is deprecated, as
that can encourage cargo-cult and lead to differences in behaviour
between drivers. Instead, drivers should use the
devm_v4l2_sensor_clk_get() helper.

This driver supports ACPI platforms only. It retrieves the clock rate
from the "clock-frequency" property. If the rate does not match the
expected rate, the driver fails probing. This is correct behaviour for
ACPI.

Switch to using the devm_v4l2_sensor_clk_get() helper. This does not
change the behaviour on ACPI platforms that specify a clock-frequency
property and don't provide a clock. On ACPI platforms that provide a
clock, the clock rate will be set to the value of the clock-frequency
property. This should not change the behaviour either as this driver
expects the clock to be set to that rate, and wouldn't operate correctly
otherwise.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx355.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 2315393f32e7..776107efe386 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -2,6 +2,7 @@
 // Copyright (C) 2018 Intel Corporation
 
 #include <linux/acpi.h>
+#include <linux/clk.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
@@ -93,12 +94,12 @@ struct imx355_mode {
 };
 
 struct imx355_hwcfg {
-	u32 ext_clk;			/* sensor external clk */
 	unsigned long link_freq_bitmap;
 };
 
 struct imx355 {
 	struct device *dev;
+	struct clk *clk;
 
 	struct v4l2_subdev sd;
 	struct media_pad pad;
@@ -1645,20 +1646,6 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
 	if (!cfg)
 		goto out_err;
 
-	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
-				       &cfg->ext_clk);
-	if (ret) {
-		dev_err(dev, "can't get clock frequency");
-		goto out_err;
-	}
-
-	dev_dbg(dev, "ext clk: %d", cfg->ext_clk);
-	if (cfg->ext_clk != IMX355_EXT_CLK) {
-		dev_err(dev, "external clock %d is not supported",
-			cfg->ext_clk);
-		goto out_err;
-	}
-
 	ret = v4l2_link_freq_to_bitmap(dev, bus_cfg.link_frequencies,
 				       bus_cfg.nr_of_link_frequencies,
 				       link_freq_menu_items,
@@ -1680,6 +1667,7 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
 static int imx355_probe(struct i2c_client *client)
 {
 	struct imx355 *imx355;
+	unsigned long freq;
 	int ret;
 
 	imx355 = devm_kzalloc(&client->dev, sizeof(*imx355), GFP_KERNEL);
@@ -1690,6 +1678,17 @@ static int imx355_probe(struct i2c_client *client)
 
 	mutex_init(&imx355->mutex);
 
+	imx355->clk = devm_v4l2_sensor_clk_get(imx355->dev, NULL);
+	if (IS_ERR(imx355->clk))
+		return dev_err_probe(imx355->dev, PTR_ERR(imx355->clk),
+				     "failed to get clock\n");
+
+	freq = clk_get_rate(imx355->clk);
+	if (freq != IMX355_EXT_CLK)
+		return dev_err_probe(imx355->dev, -EINVAL,
+				     "external clock %lu is not supported\n",
+				     freq);
+
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&imx355->sd, client, &imx355_subdev_ops);
 
-- 
Regards,

Laurent Pinchart


