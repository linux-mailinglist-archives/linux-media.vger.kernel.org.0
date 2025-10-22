Return-Path: <linux-media+bounces-45222-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F069BFB63A
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 12:23:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EC6819C5E0B
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 10:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8967F328B56;
	Wed, 22 Oct 2025 10:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RcJclDkd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E9D320A14;
	Wed, 22 Oct 2025 10:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761128562; cv=none; b=Ke13PLSL7l2dJvcCg3dHk2I+CElUIeS26h05zv7cSRja7ih7RfWmU2DsE1HERbzzEK+loZVds4D4GpxcrblS89TVWvA2Et8bLYBC1JU9uPilrNzUueb8Xj0neCs2zl+wdrobrPUM+YddbOcenUxRKYGUIxVQITRFDtfhdxJBvxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761128562; c=relaxed/simple;
	bh=eU7+9lvn1wXXDAWFpo385VYn8UrQoBf/4gTT0jovtdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iaJUDIztKL+63W1vpEBBWYPo/YjgiJxTLsKGI6bJc9sYXKiwXt5RREpQrkuI9wCXjYbtFbRdNsYWSBZOUVsovG9+3WtXqBlmHZT0OE3DvrMaC/6Y2AEgqhUKlf80z6MT2uHrxM/9QjyH6Cch5uLs5sEjryQqwWwhAtEo8XhHhgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RcJclDkd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from isaac-ThinkPad-T16-Gen-2.infra.iob (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C9FC1772;
	Wed, 22 Oct 2025 12:20:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761128455;
	bh=eU7+9lvn1wXXDAWFpo385VYn8UrQoBf/4gTT0jovtdY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RcJclDkdnzACQGsF7LeKPtXLbSdVZQfyJnWuqryb/9rCTg97RN+Hk4ARIc2D/JL8q
	 jvsDPRFnciW2HR+ifbFJbRYYVVUV/BjC+CxTD9NqBudlK5F4FH85088L/lDHqIt6ck
	 KaGlnQuDNNs/0fXrNiNUYlQoZkEHIEEFdWmVXKCI=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: mchehab@kernel.org
Cc: rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com,
	martink@posteo.de,
	kernel@puri.sm,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Frank.Li@nxp.com,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH v5 3/4] media: imx-mipi-csis: Add num_data_lanes to mipi_csis_device
Date: Wed, 22 Oct 2025 11:22:27 +0100
Message-ID: <20251022102228.275627-4-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022102228.275627-1-isaac.scott@ideasonboard.com>
References: <20251022102228.275627-1-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the num_data_lanes field to the mipi_csis_device struct, and set it
equal to csis->bus.num_data_lanes. This is in preparation to support
cases when the data lanes actively used differs from the maximum
supported data lanes.

No functional changes intended by this commit.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 7c2a679dca2e..838a1ad123b5 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -351,6 +351,8 @@ struct mipi_csis_device {
 	u32 hs_settle;
 	u32 clk_settle;
 
+	unsigned int num_data_lanes;
+
 	spinlock_t slock;	/* Protect events */
 	struct mipi_csis_event events[MIPI_CSIS_NUM_EVENTS];
 	struct dentry *debugfs_root;
@@ -573,7 +575,7 @@ static void mipi_csis_system_enable(struct mipi_csis_device *csis, int on)
 	val = mipi_csis_read(csis, MIPI_CSIS_DPHY_CMN_CTRL);
 	val &= ~MIPI_CSIS_DPHY_CMN_CTRL_ENABLE;
 	if (on) {
-		mask = (1 << (csis->bus.num_data_lanes + 1)) - 1;
+		mask = (1 << (csis->num_data_lanes + 1)) - 1;
 		val |= (mask & MIPI_CSIS_DPHY_CMN_CTRL_ENABLE);
 	}
 	mipi_csis_write(csis, MIPI_CSIS_DPHY_CMN_CTRL, val);
@@ -623,7 +625,7 @@ static int mipi_csis_calculate_params(struct mipi_csis_device *csis,
 
 	/* Calculate the line rate from the pixel rate. */
 	link_freq = v4l2_get_link_freq(csis->source.pad, csis_fmt->width,
-				       csis->bus.num_data_lanes * 2);
+				       csis->num_data_lanes * 2);
 	if (link_freq < 0) {
 		dev_err(csis->dev, "Unable to obtain link frequency: %d\n",
 			(int)link_freq);
@@ -668,7 +670,7 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
 				 const struct v4l2_mbus_framefmt *format,
 				 const struct csis_pix_format *csis_fmt)
 {
-	int lanes = csis->bus.num_data_lanes;
+	int lanes = csis->num_data_lanes;
 	u32 val;
 
 	val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
@@ -1366,8 +1368,9 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
 	}
 
 	csis->bus = vep.bus.mipi_csi2;
+	csis->num_data_lanes = csis->bus.num_data_lanes;
 
-	dev_dbg(csis->dev, "data lanes: %d\n", csis->bus.num_data_lanes);
+	dev_dbg(csis->dev, "max data lanes: %d\n", csis->bus.num_data_lanes);
 	dev_dbg(csis->dev, "flags: 0x%08x\n", csis->bus.flags);
 
 	asd = v4l2_async_nf_add_fwnode_remote(&csis->notifier, ep,
-- 
2.43.0


