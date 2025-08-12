Return-Path: <linux-media+bounces-39696-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95599B23B37
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:51:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C8925A1170
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 205922E7627;
	Tue, 12 Aug 2025 21:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lYt/c0Ih"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1C92E7187
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 21:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035302; cv=none; b=shSeA7jEsg+PsYrn88Ywdkoi78LfzXWQf/o3jcXBF1X1vbCPVrwW4mzHHju9CDagQV2pinnnRZBgYaVY52VM5mjYRfMpnj2cssjPmgiV8tKaCRzJfQ15YHqikou40sUpw9mCLei7TzF+iu40iXB8BFvPrce+73EB5sBFI1+GNRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035302; c=relaxed/simple;
	bh=8cE1p2VMOPLJQhwTWqK5L+wayT9wtdL9EpVw+0zj7ww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JREmXKLNPNN3q+nAv0Dj0ivzRV9dzEr99B+SlwTxzAP6yPQGUOkc7ZMWnmvg2osIw46NJmfE66p/nskZsSwttBZr8l6aymtKge1MeHHJ5yTkJXDl3eejRZ4bVKlNCkBy/bi/UEHiP9YoIYo2AJ8DmlCax6svLO9HnMYgTqq+yDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lYt/c0Ih; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id DECA510D4;
	Tue, 12 Aug 2025 23:47:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035247;
	bh=8cE1p2VMOPLJQhwTWqK5L+wayT9wtdL9EpVw+0zj7ww=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lYt/c0Ih3xRKmWQqYVhE7Y46smcFNtq6mpPPssNmf/XlRfc/8yEiuUiH2Vc9JU6jS
	 hAWOp0m5YiadnSYAY4kCYewOKpSa2A9WrU/SnzSORS9qnFhJbRcSAwkuxxgUfAKfOF
	 uU4jbzuRnSXqAetgnssxUyeFbsqiw2SpiH9ZorLU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v2 60/72] media: i2c: s5c73m3: Use V4L2 legacy sensor clock helper
Date: Wed, 13 Aug 2025 00:46:08 +0300
Message-ID: <20250812214620.30425-61-laurent.pinchart@ideasonboard.com>
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


