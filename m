Return-Path: <linux-media+bounces-42560-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD3AB57CAC
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 15:20:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C47427A60AE
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 13:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A6331355A;
	Mon, 15 Sep 2025 13:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PBaAEPKk"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AD43128BE;
	Mon, 15 Sep 2025 13:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757942329; cv=none; b=F1X9pCfPrKHwt6HQV50VNTvz+HxUIY0SRCIzq4gtUE0XruOgJCZ3Rd2IY7ELzNCuswvAdF8ZDIq5cE850oeOn/MKfNZ9Ez26aERr/bfO5EQzL+WAuVtMe4mtGfKbPcewxbMPcGZQ4MopZ5EcWWwdwEShddqxYLy67dmXFlDP3uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757942329; c=relaxed/simple;
	bh=BvTEpzL9SUVye7iesiVo3cTIXqu7j+cxMq93i5pmJ2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qUrRQ8fkHgSwpB869I3RHtTy0hEgIRGz902eoohj2oBqsSV39RupItmA3r9JYlrw22StclxEJ13lLDlzK3ISF6iwpglW50j038rjQOEHFUHMot1ZNsEMKZXseyUC6RgIregfa6BK1vtZIJwmLQE9xNrX/PvqTvxd1CdMAKTXxuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PBaAEPKk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 710CE32CA;
	Mon, 15 Sep 2025 15:17:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757942241;
	bh=BvTEpzL9SUVye7iesiVo3cTIXqu7j+cxMq93i5pmJ2Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PBaAEPKk1NkgkedL5dGs3bnQjrCBAV6EFGFLvb07I+ZtHJ5HxIBij7UwqdJLJZ5FU
	 pUXVdjAgBXUlYLWO+Pq56CnXhqhLpkf2jzUVg+MKmn1rYj0cr0vsbfK6XJgLp5H1Mz
	 QZjA2uSVckT/1Ctcv66BDlnfpNPnhFaYBWn/da7w=
From: Isaac Scott <isaac.scott@ideasonboard.com>
Date: Mon, 15 Sep 2025 14:18:34 +0100
Subject: [PATCH v3 2/3] media: imx-mipi-csis: Store the number of
 data_lanes configured in dt
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-mbus-config-active-lanes-v3-2-97a1282a410b@ideasonboard.com>
References: <20250915-mbus-config-active-lanes-v3-0-97a1282a410b@ideasonboard.com>
In-Reply-To: <20250915-mbus-config-active-lanes-v3-0-97a1282a410b@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Isaac Scott <isaac.scott@ideasonboard.com>
X-Mailer: b4 0.13.0

The number of lanes actively used by a MIPI CSI transmitter may differ
from that which is defined in device tree. To allow us to be able to set
the number of configured lanes without changing the maximum lane count,
store the number of lanes configured in device tree, and adjust the
debug print to reflect the device tree value.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 2beb5f43c2c0..6afbedfe131e 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -313,6 +313,8 @@ struct mipi_csis_device {
 	u32 hs_settle;
 	u32 clk_settle;
 
+	unsigned int num_data_lanes;
+
 	spinlock_t slock;	/* Protect events */
 	struct mipi_csis_event events[MIPI_CSIS_NUM_EVENTS];
 	struct dentry *debugfs_root;
@@ -535,7 +537,7 @@ static void mipi_csis_system_enable(struct mipi_csis_device *csis, int on)
 	val = mipi_csis_read(csis, MIPI_CSIS_DPHY_CMN_CTRL);
 	val &= ~MIPI_CSIS_DPHY_CMN_CTRL_ENABLE;
 	if (on) {
-		mask = (1 << (csis->bus.num_data_lanes + 1)) - 1;
+		mask = (1 << (csis->num_data_lanes + 1)) - 1;
 		val |= (mask & MIPI_CSIS_DPHY_CMN_CTRL_ENABLE);
 	}
 	mipi_csis_write(csis, MIPI_CSIS_DPHY_CMN_CTRL, val);
@@ -586,7 +588,7 @@ static int mipi_csis_calculate_params(struct mipi_csis_device *csis,
 
 	/* Calculate the line rate from the pixel rate. */
 	link_freq = v4l2_get_link_freq(src_pad, csis_fmt->width,
-				       csis->bus.num_data_lanes * 2);
+				       csis->num_data_lanes * 2);
 	if (link_freq < 0) {
 		dev_err(csis->dev, "Unable to obtain link frequency: %d\n",
 			(int)link_freq);
@@ -631,7 +633,7 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
 				 const struct v4l2_mbus_framefmt *format,
 				 const struct csis_pix_format *csis_fmt)
 {
-	int lanes = csis->bus.num_data_lanes;
+	int lanes = csis->num_data_lanes;
 	u32 val;
 
 	val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
@@ -1299,8 +1301,10 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
 	}
 
 	csis->bus = vep.bus.mipi_csi2;
+	csis->bus.num_data_lanes = vep.bus.mipi_csi2.num_data_lanes;
+	csis->num_data_lanes = csis->bus.num_data_lanes;
 
-	dev_dbg(csis->dev, "data lanes: %d\n", csis->bus.num_data_lanes);
+	dev_dbg(csis->dev, "data lanes: %d\n", csis->num_data_lanes);
 	dev_dbg(csis->dev, "flags: 0x%08x\n", csis->bus.flags);
 
 	asd = v4l2_async_nf_add_fwnode_remote(&csis->notifier, ep,
@@ -1498,7 +1502,7 @@ static int mipi_csis_probe(struct platform_device *pdev)
 	}
 
 	dev_info(dev, "lanes: %d, freq: %u\n",
-		 csis->bus.num_data_lanes, csis->clk_frequency);
+		 csis->num_data_lanes, csis->clk_frequency);
 
 	return 0;
 

-- 
2.43.0


