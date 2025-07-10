Return-Path: <linux-media+bounces-37389-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F7FB00A9F
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:51:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3C605C2BFB
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D802F2374;
	Thu, 10 Jul 2025 17:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BX/4VhVn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B705C2F0E4A
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169797; cv=none; b=S8+dj4iIKDvkLaieoHjyr17yqzw1jyI5n3rwD56s78cVna6oaG0E902kFy13uzzBr5cCj540P7u8JtBLjzf4AY7hfb/cb0butanXmhcH57XZfvnwWyBsefF+zwlLSFwHFcpRvG3LMR4QsZCwkR47ZMGa78sYODpXLQdbbLFq5DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169797; c=relaxed/simple;
	bh=YTLaojWtcZCKHGQtTnXsyB53XmL7tFeJO3WuGQLDDps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uSP4h5OSRiKJ1kGAXZllXkwksrBnOTTbV8s+hpnCMcIBSH7CrYWvXDFONf4UC7vc7RWBJ7LjBLpTFskd0x+H7UFqz/8rlpgRORWDbkmoQ+IQYdRFHwuuvQJOdjcPQgw2d2Y+y1V6r2vGZMWg9Zv/Sm46MQ1QaXc8aEnXszf9qf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BX/4VhVn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9250AB2B;
	Thu, 10 Jul 2025 19:49:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169764;
	bh=YTLaojWtcZCKHGQtTnXsyB53XmL7tFeJO3WuGQLDDps=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BX/4VhVnmWSDGMcABavB8of7C7Y0KePllL0vqOWm67aKcvQcTbZ9LdOgSfpOFJWhg
	 7OSVDdXLWY9Nd8ax6VNekaeUk1qcshIwIuFTB3PqaVFKxTlYDJX4/js+7HBn5KHbUV
	 nzxMQq9w2eeUkI5PlMfdkZW4Dm+SeUpQ6DBZskg8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>
Subject: [PATCH 46/72] media: i2c: ov4689: Use V4L2 sensor clock helper
Date: Thu, 10 Jul 2025 20:47:42 +0300
Message-ID: <20250710174808.5361-47-laurent.pinchart@ideasonboard.com>
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

This driver supports OF platforms only. The "clocks" property has always
been specified as mandatory in the DT bindings and the "clock-frequency"
property has never been allowed. The driver retrieves the clock and its
rate if present, and falls back to retrieving the rate from the
"clock-frequency" property otherwise. If the rate does not match the
expected rate, the driver fails probing. This is deprecated on OF
platforms, but behaves correctly on platforms that comply with the DT
bindings.

Switch to using the devm_v4l2_sensor_clk_get() helper. This does not
change the behaviour on OF platforms that comply with the DT bindings.
Non-compliant platforms are not expected, but any regression could
easily be handled by switching to the devm_v4l2_sensor_clk_get_legacy()
helper designed to preserve non-compliant behaviour.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov4689.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/ov4689.c b/drivers/media/i2c/ov4689.c
index 1c3a449f9354..4e68f8c3d3de 100644
--- a/drivers/media/i2c/ov4689.c
+++ b/drivers/media/i2c/ov4689.c
@@ -909,20 +909,12 @@ static int ov4689_probe(struct i2c_client *client)
 
 	ov4689->cur_mode = &supported_modes[OV4689_MODE_2688_1520];
 
-	ov4689->xvclk = devm_clk_get_optional(dev, NULL);
+	ov4689->xvclk = devm_v4l2_sensor_clk_get(dev, NULL);
 	if (IS_ERR(ov4689->xvclk))
 		return dev_err_probe(dev, PTR_ERR(ov4689->xvclk),
 				     "Failed to get external clock\n");
 
-	if (!ov4689->xvclk) {
-		dev_dbg(dev,
-			"No clock provided, using clock-frequency property\n");
-		device_property_read_u32(dev, "clock-frequency",
-					 &ov4689->clock_rate);
-	} else {
-		ov4689->clock_rate = clk_get_rate(ov4689->xvclk);
-	}
-
+	ov4689->clock_rate = clk_get_rate(ov4689->xvclk);
 	if (ov4689->clock_rate != OV4689_XVCLK_FREQ) {
 		dev_err(dev,
 			"External clock rate mismatch: got %d Hz, expected %d Hz\n",
-- 
Regards,

Laurent Pinchart


