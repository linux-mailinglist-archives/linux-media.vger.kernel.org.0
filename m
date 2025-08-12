Return-Path: <linux-media+bounces-39659-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA47B23B10
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:49:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F409F568A61
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB1202E1C78;
	Tue, 12 Aug 2025 21:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jJtlJ1Yz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E272E1C7C
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 21:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035241; cv=none; b=IASn/V19SyTGL4HlRgl/MjA9OG/nCcZJkgikVu6bwSpAzzZe9TqetgOTLKELWDrC4RQ47iDmLqUWWtLcjs0ocx4yVvOT5UgQOlU1zNZ4/A0XOpZ+rFXgLQHy16FU9rkdxnlfSSti15TgUZXj2A9KAGkroIXgqdtG6AuPHJdFmVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035241; c=relaxed/simple;
	bh=SSnK71hcZNUx9uT3CJyamiusO4PuOO9G/8gAEKgnwMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZaQdXtCRlv6yu0Lfyw3t+Xib8sIBpYr/JBFVRtNyN3CP4ZZMIOI/Kwa6D6BOncTctyZps6DVyCrV9hPvb7kg6+1IL3l0foJ5DOcz3Ta9j41ozVDhTNUa1YKXK5eulbGzNlqkWDIpEL/MRVwE6bnCluOjwZj2BYZjymGojSFxIoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jJtlJ1Yz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7B2681123;
	Tue, 12 Aug 2025 23:46:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035184;
	bh=SSnK71hcZNUx9uT3CJyamiusO4PuOO9G/8gAEKgnwMc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jJtlJ1YzPS88wc6LMKor+rQTwGMMcuJtKyZ0U1Vh+LMNfYLfLayAzpAoFBl3h9dZ+
	 1YWdwUU/Tpop1aLzOEHpgh3rxCSDfRTEIPRDkCHLM2hR8IQU8etObMCCUUMj5xQb6T
	 RDRX48icKm82OY1fPGQuwujJW4oW2DDDNPFA/HU0=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	"Bryan O'Donoghue" <bod@kernel.org>
Subject: [PATCH v2 23/72] media: i2c: ov02c10: Use V4L2 sensor clock helper
Date: Wed, 13 Aug 2025 00:45:31 +0300
Message-ID: <20250812214620.30425-24-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
References: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
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

This driver supports ACPI and OF platforms. The "clocks" property is
specified as mandatory in the DT bindings and the "clock-frequency"
property is not allowed. The driver retrieves the clock and its rate if
present, and falls back to retrieving the rate from the
"clock-frequency" property otherwise. If the rate does not match the
expected rate, the driver fails probing. This is correct behaviour for
ACPI, and for OF platforms that comply with the documented DT bindings.

Switch to using the devm_v4l2_sensor_clk_get() helper. This does not
change the behaviour on ACPI platforms that specify a clock-frequency
property and don't provide a clock. On ACPI platforms that provide a
clock, the clock rate will be set to the value of the clock-frequency
property. This should not change the behaviour either as this driver
expects the clock to be set to that rate, and wouldn't operate correctly
otherwise.

The behaviour is also unchanged on OF platforms that comply with the DT
bindings. Non-compliant platforms are not expected, but any regression
could easily be handled by switching to the
devm_v4l2_sensor_clk_get_legacy() helper designed to preserve
non-compliant behaviour.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov02c10.c | 38 ++++++++++++-------------------------
 1 file changed, 12 insertions(+), 26 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index 88ddfaaa1dea..f2b056854b1a 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -800,7 +800,6 @@ static int ov02c10_check_hwcfg(struct ov02c10 *ov02c10)
 	struct device *dev = ov02c10->dev;
 	struct fwnode_handle *ep, *fwnode = dev_fwnode(dev);
 	unsigned long link_freq_bitmap;
-	u32 mclk;
 	int ret;
 
 	/*
@@ -812,31 +811,6 @@ static int ov02c10_check_hwcfg(struct ov02c10 *ov02c10)
 		return dev_err_probe(dev, -EPROBE_DEFER,
 				     "waiting for fwnode graph endpoint\n");
 
-	ov02c10->img_clk = devm_clk_get_optional(dev, NULL);
-	if (IS_ERR(ov02c10->img_clk)) {
-		fwnode_handle_put(ep);
-		return dev_err_probe(dev, PTR_ERR(ov02c10->img_clk),
-				     "failed to get imaging clock\n");
-	}
-
-	if (ov02c10->img_clk) {
-		mclk = clk_get_rate(ov02c10->img_clk);
-	} else {
-		ret = fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
-		if (ret) {
-			fwnode_handle_put(ep);
-			return dev_err_probe(dev, ret,
-					     "reading clock-frequency property\n");
-		}
-	}
-
-	if (mclk != OV02C10_MCLK) {
-		fwnode_handle_put(ep);
-		return dev_err_probe(dev, -EINVAL,
-				     "external clock %u is not supported\n",
-				     mclk);
-	}
-
 	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret)
@@ -887,6 +861,7 @@ static void ov02c10_remove(struct i2c_client *client)
 static int ov02c10_probe(struct i2c_client *client)
 {
 	struct ov02c10 *ov02c10;
+	unsigned long freq;
 	int ret;
 
 	ov02c10 = devm_kzalloc(&client->dev, sizeof(*ov02c10), GFP_KERNEL);
@@ -895,6 +870,17 @@ static int ov02c10_probe(struct i2c_client *client)
 
 	ov02c10->dev = &client->dev;
 
+	ov02c10->img_clk = devm_v4l2_sensor_clk_get(ov02c10->dev, NULL);
+	if (IS_ERR(ov02c10->img_clk))
+		return dev_err_probe(ov02c10->dev, PTR_ERR(ov02c10->img_clk),
+				     "failed to get imaging clock\n");
+
+	freq = clk_get_rate(ov02c10->img_clk);
+	if (freq != OV02C10_MCLK)
+		return dev_err_probe(ov02c10->dev, -EINVAL,
+				     "external clock %lu is not supported",
+				     freq);
+
 	v4l2_i2c_subdev_init(&ov02c10->sd, client, &ov02c10_subdev_ops);
 
 	/* Check HW config */
-- 
Regards,

Laurent Pinchart


