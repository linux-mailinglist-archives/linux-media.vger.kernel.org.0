Return-Path: <linux-media+bounces-37414-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEE6B00AB9
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:52:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C59C5C2EC5
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA3042F50AD;
	Thu, 10 Jul 2025 17:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="me1kxZGY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54042F509F
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169836; cv=none; b=PHe2EkwMdDouM8a43U6kIkfAUyakRPWfYUc0tThng+X5/FQw49wO3gXDJvDvjEpiaFY4D+Zj7bYLUQbS4AsgfIqUyj4na0uwSWnt8xbzh+qIVq5JRG9/nS9tuX74H0T245jaCLaiZJlQ+dQIBc8vSISaQ7ingi5pVsmi2cdF6jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169836; c=relaxed/simple;
	bh=FT1cqGEBIOjDWNesDKD2wtiSsnvNTtrcE/9qga/tqq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=je8X/3yxXUapR9zD/Se5L7zYKtHVEQk1fJ69nBGv9YGhT3ymnovz+wvGU5C7d/1crg9RwXxi7dcYg6vF8KO1AX0kpXq2af4107DM+G5dNdt7OwG4vg2XX2OaUUEyuUgprhgzhzDq/+B8JwTuQHv22OwoqWawXVdOlAg6pQKnyF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=me1kxZGY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8BF3C1BAF;
	Thu, 10 Jul 2025 19:50:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169804;
	bh=FT1cqGEBIOjDWNesDKD2wtiSsnvNTtrcE/9qga/tqq0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=me1kxZGY2b0sUi3YbgWLJ/piw6rzHwu4RPtNNE36aGnYRaq9If78RVOzPJfsBcZN5
	 Wf1rZLRoa+mjNMXmNOdvD6bso6XrtEoJ0FxjOkDlDyFlwuu5RdEXHh48zqx4jmUV2K
	 5ZDTUW4pk/GywUgp8TqpDyILdkiNP4th8dh7ZlIE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH 71/72] media: i2c: s5k5baf: Use V4L2 legacy sensor clock helper
Date: Thu, 10 Jul 2025 20:48:07 +0300
Message-ID: <20250710174808.5361-72-laurent.pinchart@ideasonboard.com>
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

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/s5k5baf.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/s5k5baf.c b/drivers/media/i2c/s5k5baf.c
index 01d37f49e5ad..89bd951075f4 100644
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
@@ -1967,7 +1954,9 @@ static int s5k5baf_probe(struct i2c_client *c)
 	if (ret < 0)
 		goto err_me;
 
-	state->clock = devm_v4l2_sensor_clk_get(state->sd.dev, S5K5BAF_CLK_NAME);
+	state->clock = devm_v4l2_sensor_clk_get_legacy(state->sd.dev,
+						       S5K5BAF_CLK_NAME, false,
+						       S5K5BAF_DEFAULT_MCLK_FREQ);
 	if (IS_ERR(state->clock)) {
 		ret = -EPROBE_DEFER;
 		goto err_me;
-- 
Regards,

Laurent Pinchart


