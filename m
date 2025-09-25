Return-Path: <linux-media+bounces-43205-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E084BA07D8
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 17:56:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB6CF1BC612E
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 15:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37DF33074BC;
	Thu, 25 Sep 2025 15:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LJDTh92d"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6BA302CA3;
	Thu, 25 Sep 2025 15:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758815736; cv=none; b=tJyzRPujCf1LCzFkuz8US88w3rRNuhJ9mfViEhDL5FLvzeJcRkOqmaBUuHrCqSRo/oPeetmJOCpeFFjmuscZE2FkmxHoq1sQj9z9ZI3SGkaQYrM1lgO0XRPzsNCgavxNcZm53URfUSibLJ3XLJ9jo5VEUoulU0SiMiho9qtbVY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758815736; c=relaxed/simple;
	bh=id013NlFyzuJMf+mdvtdKKj31ZyAXitg+Te/hkly/4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=crByNtSN17ZqPBRkfvVYcd0dUVpbaNC3FlgnfsI4nh2twrgCU8GJZLt7g2XmBJIiZ8R5b8qDDs3DWGReQi1fj1sINHShmy78y+K4GX/i3h5rCLVN2XyOGMBXuc1gf7y+KFKzB4J63MY2HFEtab8ViOhvB7lJ/wZx2Sh432gN4a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LJDTh92d; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CFC861E3C;
	Thu, 25 Sep 2025 17:54:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758815643;
	bh=id013NlFyzuJMf+mdvtdKKj31ZyAXitg+Te/hkly/4o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LJDTh92dkIfWw5AwKRlog+j+7eoH1q4eIYu5fw8Y7uG0zP/uxJ5yqr5gGdS9tATZk
	 lTj23G0bblsByB51GiZ2hxv2xryYVWnmO0qpSnH5+55ehsuCj/sCSCHeRCqCK3yGPe
	 auneg2BY4ItMk2QLpoLud6riamaMEQQYxXdA/DYg=
From: Isaac Scott <isaac.scott@ideasonboard.com>
Date: Thu, 25 Sep 2025 16:54:28 +0100
Subject: [PATCH v4 3/4] media: imx-mipi-csis: Store the number of
 data_lanes configured in dt
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-active-data-lanes-v4-3-8b54e3d5af6c@ideasonboard.com>
References: <20250925-active-data-lanes-v4-0-8b54e3d5af6c@ideasonboard.com>
In-Reply-To: <20250925-active-data-lanes-v4-0-8b54e3d5af6c@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Isaac Scott <isaac.scott@ideasonboard.com>
X-Mailer: b4 0.13.0

The number of active data lanes in use on a MIPI CSI2 bus is not
necessarily always the maximum. To allow us to configure the number of
data lanes actively in use, store the maximum to ensure we can configure
a number of data lanes that is supported.

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


