Return-Path: <linux-media+bounces-39684-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE3FB23B33
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:51:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBE45720774
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 929BE2E610E;
	Tue, 12 Aug 2025 21:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jXJPSiFf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925532E2640
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 21:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035283; cv=none; b=kHC1J3K+CUxlO2xWJ3GcbJA9UD83gbAmP2WI861vPZ0Ojb37FLGWCwCKfgY783M1jWW0dWcB2MNPC5RmiPLEi7eNBOZ9JN6rjue/88acU9PAM1pKiM1vfnOHubOcsn/xkdOdgVmEO2KcFqZ8fE2UhA+XQ+mYACxm4obwJRMUnIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035283; c=relaxed/simple;
	bh=enPy3nOpbJnqIlwJYkdoHvfbVXzCtykILoeh2j+eGxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nyq1KeiL8T8nwrzZkAS65VLnh4yJidOl5LdPum/iQkb1PdBm3kaxn6eZoVfE7BRNDY3oo9/oGyMUfODcbQgXFk7LL85+wtWfRKFrUncyapJArw6ognPMvuv4wOou0z8pQbN6ES0YApkA8j9uFDn9n18puRm5ahhVFmLlmPk80nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jXJPSiFf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 6C3631738;
	Tue, 12 Aug 2025 23:47:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035227;
	bh=enPy3nOpbJnqIlwJYkdoHvfbVXzCtykILoeh2j+eGxw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jXJPSiFflQlnWaSyRY5Gwatt4MQWa0XaR6uyKvOxGxupBSnfESsfr9Pbe5hZi1HnZ
	 /Zbh/Z7UOHWxJkbBU2wtaGKhSHOhqq+mjbAbhn9MJW5tphKz5IEKeVOT9/wsxCLx99
	 qzrEZxvsAXwa8YGaMSpEpAF5yIj2KFuNFPs/KpmE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Zhi Mao <zhi.mao@mediatek.com>
Subject: [PATCH v2 48/72] media: i2c: gc05a2: Use V4L2 legacy sensor clock helper
Date: Wed, 13 Aug 2025 00:45:56 +0300
Message-ID: <20250812214620.30425-49-laurent.pinchart@ideasonboard.com>
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

This driver supports OF platforms only. The "clocks" and
"clock-frequency" properties were initially mandatory in the DT bindings
and were both set in the upstream DT sources. The driver retrieves the
clock, retrieves and ignores the clock rate from the clock-frequency
property, and sets the clock rate to a fixed value. This is deprecated
behaviour for OF.

Switch to using the devm_v4l2_sensor_clk_get_legacy() helper. This
preserves setting the clock rate on OF platforms. Should support for OF
platforms that set the clock rate through clock-frequency be considered
unneeded in the future, the driver will only need to switch to
devm_v4l2_sensor_clk_get() without any other change.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/gc05a2.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/gc05a2.c b/drivers/media/i2c/gc05a2.c
index 4dadd25e6c90..8ba17f80fffe 100644
--- a/drivers/media/i2c/gc05a2.c
+++ b/drivers/media/i2c/gc05a2.c
@@ -1235,16 +1235,12 @@ static int gc05a2_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(gc05a2->regmap),
 				     "failed to init CCI\n");
 
-	gc05a2->xclk = devm_v4l2_sensor_clk_get(dev, NULL);
+	gc05a2->xclk = devm_v4l2_sensor_clk_get_legacy(dev, NULL, true,
+						       GC05A2_DEFAULT_CLK_FREQ);
 	if (IS_ERR(gc05a2->xclk))
 		return dev_err_probe(dev, PTR_ERR(gc05a2->xclk),
 				     "failed to get xclk\n");
 
-	ret = clk_set_rate(gc05a2->xclk, GC05A2_DEFAULT_CLK_FREQ);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "failed to set xclk frequency\n");
-
 	ret = gc05a2_get_regulators(dev, gc05a2);
 	if (ret < 0)
 		return dev_err_probe(dev, ret,
-- 
Regards,

Laurent Pinchart


