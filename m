Return-Path: <linux-media+bounces-37413-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 679EEB00ABC
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:52:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 324874E762E
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F50E2F3624;
	Thu, 10 Jul 2025 17:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WrhJjpK1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368C82F19BE
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169834; cv=none; b=TRAtPMy7+Maw8mEBbjLfCkABbiV/zPUtjUW0Lxrcsi5VeZwKMKnKs4WhYH5IT5gubJo/tM908dEsdMon3EkbxSdzwZnYexqKumDi+Qu6Eg97aOEUap52UDcOAQaC8Xu5vmws/hga0KdbHfYTB0rl1gdtEdwZI6r4Lv1WR2Syv08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169834; c=relaxed/simple;
	bh=8cE1p2VMOPLJQhwTWqK5L+wayT9wtdL9EpVw+0zj7ww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fnCIpX/vUbLzc7Th566QBgYRKiiX9Jd+eaKj85N5N3kj16rAzy8bK0XdVIaUd1Pw3zRhljIwWTHrEjEHL+LfVRbtFvVafV36HEW2nQ9t53GtsZqMZt8ItvWwyc4oDdOrfOri6yqraIVhZBbFieXG1IieWucTy6JveLgxbFEMon0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WrhJjpK1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id F1E4B3DC;
	Thu, 10 Jul 2025 19:50:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169803;
	bh=8cE1p2VMOPLJQhwTWqK5L+wayT9wtdL9EpVw+0zj7ww=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WrhJjpK1AnyTscyeE6d2N7dl7dVYzt9pwXN/S817TFzOoadah7u2r58HLTHvaVVIA
	 lGpvB0McXqP4VOESqrFxyjNYWdQDyCoIJO1BKBQpbaD5xBwEtoLyt4S6cgzbhYzwIl
	 gQaeLBVPAqF4UE9nzscnBVHGZJLdNZzBhGDnZuAA=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH 70/72] media: i2c: s5c73m3: Use V4L2 legacy sensor clock helper
Date: Thu, 10 Jul 2025 20:48:06 +0300
Message-ID: <20250710174808.5361-71-laurent.pinchart@ideasonboard.com>
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

This driver supports OF platforms only. No DT bindings are available.
The "clocks" and "clock-frequency" properties were initially both set in
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
 drivers/media/i2c/s5c73m3/s5c73m3-core.c | 15 +++------------
 drivers/media/i2c/s5c73m3/s5c73m3.h      |  2 --
 2 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/s5c73m3/s5c73m3-core.c b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
index 088184da5dea..ab31ee2b596b 100644
--- a/drivers/media/i2c/s5c73m3/s5c73m3-core.c
+++ b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
@@ -1368,10 +1368,6 @@ static int __s5c73m3_power_on(struct s5c73m3 *state)
 			goto err_reg_dis;
 	}
 
-	ret = clk_set_rate(state->clock, state->mclk_frequency);
-	if (ret < 0)
-		goto err_reg_dis;
-
 	ret = clk_prepare_enable(state->clock);
 	if (ret < 0)
 		goto err_reg_dis;
@@ -1556,19 +1552,14 @@ static int s5c73m3_get_dt_data(struct s5c73m3 *state)
 	if (!node)
 		return -EINVAL;
 
-	state->clock = devm_v4l2_sensor_clk_get(dev, S5C73M3_CLK_NAME);
+	state->clock = devm_v4l2_sensor_clk_get_legacy(dev, S5C73M3_CLK_NAME,
+						       false,
+						       S5C73M3_DEFAULT_MCLK_FREQ);
 	if (IS_ERR(state->clock))
 		return dev_err_probe(dev, PTR_ERR(state->clock),
 				     "Failed to get the clock %s\n",
 				     S5C73M3_CLK_NAME);
 
-	if (of_property_read_u32(node, "clock-frequency",
-				 &state->mclk_frequency)) {
-		state->mclk_frequency = S5C73M3_DEFAULT_MCLK_FREQ;
-		dev_info(dev, "using default %u Hz clock frequency\n",
-					state->mclk_frequency);
-	}
-
 	/* Request GPIO lines asserted */
 	state->stby = devm_gpiod_get(dev, "standby", GPIOD_OUT_HIGH);
 	if (IS_ERR(state->stby))
diff --git a/drivers/media/i2c/s5c73m3/s5c73m3.h b/drivers/media/i2c/s5c73m3/s5c73m3.h
index 627e80cf5b72..68a19c2c8db8 100644
--- a/drivers/media/i2c/s5c73m3/s5c73m3.h
+++ b/drivers/media/i2c/s5c73m3/s5c73m3.h
@@ -382,8 +382,6 @@ struct s5c73m3 {
 
 	struct clk *clock;
 
-	/* External master clock frequency */
-	u32 mclk_frequency;
 	/* Video bus type - MIPI-CSI2/parallel */
 	enum v4l2_mbus_type bus_type;
 
-- 
Regards,

Laurent Pinchart


