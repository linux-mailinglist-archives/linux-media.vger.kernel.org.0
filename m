Return-Path: <linux-media+bounces-37404-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE9AB00AAE
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:52:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFB83189A465
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31AA92F49F9;
	Thu, 10 Jul 2025 17:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="m52UIIiH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E1E2F19A6
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169820; cv=none; b=ibYL1EB2iADYdch+cgJMprPAOVbozZthSGOi5/b1ztamTL7xVVZjVe+EW8GV18fwh6+jnTYoEeUiNSUVE4T+lAiE9uFbqAGQFtJ6gNV/6t4T/XB8WPm005Gp23Q1YLqCZ67rEufH7oC3vsT5ESn7H2OgpjzHlT+ER8gi21myWqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169820; c=relaxed/simple;
	bh=geTL4U3gzn7iwseATuF047JHA7eMCtfltNCUs/D4PNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pLmEDzUnR2MClusrZlwtGWRL8Oxsq57annjupUVwGGF2Zs+7T49EUCOtdQDDzTgukkiMOmm9hX/fxVTug/bzfeulNmvgrBEB4GNLQn3vXZkK7WSGSdUrLVO0rBkIdVeXjzrNtb1kgcUpCRc80xeSvcvR0ymN394P0SpvLMNGd80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=m52UIIiH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id DF476B2B;
	Thu, 10 Jul 2025 19:49:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169789;
	bh=geTL4U3gzn7iwseATuF047JHA7eMCtfltNCUs/D4PNQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m52UIIiHyAUfcr4YMxzlHFPWOC6kpc4P3jOw9u3xdKTb+3VVSn9dTXQFhkcQITB5d
	 Jg3xRNePdmf2Bh9F2f2msINQ1HcZg5g6Jfd4lwl9QuvHN1eEnsj5s3f6vRfBiw/TDw
	 352xIPXDpAd8LP1X06TDvymhM2FTqflsA3nXAqMw=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH 61/72] media: i2c: imx258: Use V4L2 legacy sensor clock helper
Date: Thu, 10 Jul 2025 20:47:57 +0300
Message-ID: <20250710174808.5361-62-laurent.pinchart@ideasonboard.com>
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

This driver supports ACPI and OF platforms. The "clocks" property was
not initially specified as mandatory in the DT bindings, and the
"clock-frequency" property has never been  allowed. The driver retrieves
the clock and its rate if present, and falls back to retrieving the rate
from the "clock-frequency" property otherwise. If the rate does not
match the expected rate, the driver fails probing. This is correct
behaviour for ACPI, and deprecated behaviour for OF.

Switch to using the devm_v4l2_sensor_clk_get_legacy() helper. This
preserves setting the clock rate on OF platforms. Should support for OF
platforms that set the clock rate through clock-frequency be considered
unneeded in the future, the driver will only need to switch to
devm_v4l2_sensor_clk_get() without any other change.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx258.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 88d0d7f9d4be..e50dcfd830f5 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -1375,18 +1375,13 @@ static int imx258_probe(struct i2c_client *client)
 		return dev_err_probe(imx258->dev, ret,
 				     "failed to get regulators\n");
 
-	imx258->clk = devm_clk_get_optional(imx258->dev, NULL);
+	imx258->clk = devm_v4l2_sensor_clk_get_legacy(imx258->dev, NULL, false,
+						      0);
 	if (IS_ERR(imx258->clk))
 		return dev_err_probe(imx258->dev, PTR_ERR(imx258->clk),
 				     "error getting clock\n");
-	if (!imx258->clk) {
-		dev_dbg(imx258->dev,
-			"no clock provided, using clock-frequency property\n");
 
-		device_property_read_u32(imx258->dev, "clock-frequency", &val);
-	} else {
-		val = clk_get_rate(imx258->clk);
-	}
+	val = clk_get_rate(imx258->clk);
 
 	switch (val) {
 	case 19200000:
-- 
Regards,

Laurent Pinchart


