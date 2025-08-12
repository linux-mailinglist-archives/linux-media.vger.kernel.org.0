Return-Path: <linux-media+bounces-39697-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF16B23B26
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:51:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 283141B616AE
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B11202E763F;
	Tue, 12 Aug 2025 21:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SLh+ti4P"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A672E2DD2
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 21:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035304; cv=none; b=XDZRidmg6BuP5LpIdL7nSj4o8jbRNDT5eVjxJAlNBN/LX1uN/jNbLn7m5BRPmc9Jl/+NDuQ2R+jpaJe6dzLSWoknhQkcfpqOsSXxFDcHvpexHsTXo/crw+fN2QkXiGMDOh/I2rU7EkfpbOrPYQWrwYUQtTLu/FyTxvlleazAV5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035304; c=relaxed/simple;
	bh=l/THJedt/tppVdi3PvG6t2+MDiRVzDUhuRRDHQuOz+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MQzylS3P8Vl/uQS446+bfak1dhcp8ISGvjsGrkPOcon1Jhw1r1LhJKmFS2Qr12wh2Pk4AspFGTV5bf0HdRRS42oGsjH7nDnlggDgXJkt6+pEsjzQmqrLWew5xR3im43D3PwLB5SpUGFeVrWCcwHmOd4zO3wYB+bOwkdFwSlvfz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SLh+ti4P; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 6DB964A4;
	Tue, 12 Aug 2025 23:47:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035248;
	bh=l/THJedt/tppVdi3PvG6t2+MDiRVzDUhuRRDHQuOz+8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SLh+ti4PhnGQup9mpG6bdss+fUMxwxwms7f4jwsjTDbDnJl3QbRFE8R4Aif1P/2rI
	 QqUaaZ6jDMKk7bW6V/ye2SkHPvNtvb/1JgrdkXCsYkTemU5n8cRWgtNnWJAIeawKQ+
	 jU25Qlq7Nn1MEn5HEMAOj2lzQ1IL981HZ2+S3txw=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v2 61/72] media: i2c: s5k5baf: Use V4L2 legacy sensor clock helper
Date: Wed, 13 Aug 2025 00:46:09 +0300
Message-ID: <20250812214620.30425-62-laurent.pinchart@ideasonboard.com>
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
of the external clock programmatically. Both behaviours are valid on a
subset of ACPI platforms, but are considered deprecated on OF platforms,
and do not support ACPI platforms that implement MIPI DisCo for Imaging.
Implementing them manually in drivers is deprecated, as that can
encourage copying deprecated behaviour for OF platforms in new drivers,
and lead to differences in behaviour between drivers. Instead, drivers
that need to preserve the deprecated OF behaviour should use the
devm_v4l2_sensor_clk_get_legacy() helper.

This driver supports OF platforms only. The "clocks" property has always
been specified as mandatory in the DT bindings and the "clock-frequency"
property has always been optional. Both properties were initially set in
the upstream DT sources. The driver retrieves the clock, retrieves the
clock rate from the "clock-frequency" property if available or uses a
fixed default otherwise, and sets the clock rate. This is deprecated
behaviour for OF.

Switch to using the devm_v4l2_sensor_clk_get_legacy() helper. This
preserves setting the clock rate on OF platforms. Should support for OF
platforms that set the clock rate through clock-frequency be considered
unneeded in the future, the driver will only need to switch to
devm_v4l2_sensor_clk_get() without any other change.

For all meaningful purposes, devm_v4l2_sensor_clk_get_legacy() returns
-EPROBE_DEFER in situations when the driver would want to defer probing.
Replace the hardcoded -EPROBE_DEFER error with propagating the error
code from devm_v4l2_sensor_clk_get_legacy().

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Propagate error code from devm_v4l2_sensor_clk_get_legacy()
---
 drivers/media/i2c/s5k5baf.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/s5k5baf.c b/drivers/media/i2c/s5k5baf.c
index 01d37f49e5ad..d1d00eca8708 100644
--- a/drivers/media/i2c/s5k5baf.c
+++ b/drivers/media/i2c/s5k5baf.c
@@ -284,7 +284,6 @@ struct s5k5baf {
 	struct regulator_bulk_data supplies[S5K5BAF_NUM_SUPPLIES];
 
 	struct clk *clock;
-	u32 mclk_frequency;
 
 	struct s5k5baf_fw *fw;
 
@@ -576,7 +575,7 @@ static void s5k5baf_hw_patch(struct s5k5baf *state)
 
 static void s5k5baf_hw_set_clocks(struct s5k5baf *state)
 {
-	unsigned long mclk = state->mclk_frequency / 1000;
+	unsigned long mclk = clk_get_rate(state->clock) / 1000;
 	u16 status;
 	static const u16 nseq_clk_cfg[] = {
 		NSEQ(REG_I_USE_NPVI_CLOCKS,
@@ -946,10 +945,6 @@ static int s5k5baf_power_on(struct s5k5baf *state)
 	if (ret < 0)
 		goto err;
 
-	ret = clk_set_rate(state->clock, state->mclk_frequency);
-	if (ret < 0)
-		goto err_reg_dis;
-
 	ret = clk_prepare_enable(state->clock);
 	if (ret < 0)
 		goto err_reg_dis;
@@ -1841,14 +1836,6 @@ static int s5k5baf_parse_device_node(struct s5k5baf *state, struct device *dev)
 		return -EINVAL;
 	}
 
-	ret = of_property_read_u32(node, "clock-frequency",
-				   &state->mclk_frequency);
-	if (ret < 0) {
-		state->mclk_frequency = S5K5BAF_DEFAULT_MCLK_FREQ;
-		dev_info(dev, "using default %u Hz clock frequency\n",
-			 state->mclk_frequency);
-	}
-
 	node_ep = of_graph_get_endpoint_by_regs(node, 0, -1);
 	if (!node_ep) {
 		dev_err(dev, "no endpoint defined at node %pOF\n", node);
@@ -1967,9 +1954,11 @@ static int s5k5baf_probe(struct i2c_client *c)
 	if (ret < 0)
 		goto err_me;
 
-	state->clock = devm_v4l2_sensor_clk_get(state->sd.dev, S5K5BAF_CLK_NAME);
+	state->clock = devm_v4l2_sensor_clk_get_legacy(state->sd.dev,
+						       S5K5BAF_CLK_NAME, false,
+						       S5K5BAF_DEFAULT_MCLK_FREQ);
 	if (IS_ERR(state->clock)) {
-		ret = -EPROBE_DEFER;
+		ret = PTR_ERR(state->clock);
 		goto err_me;
 	}
 
-- 
Regards,

Laurent Pinchart


