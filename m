Return-Path: <linux-media+bounces-8033-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 524F588F317
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 00:25:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AD842A43F0
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 23:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F07156870;
	Wed, 27 Mar 2024 23:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="hTxbudJR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-108-mta249.mxroute.com (mail-108-mta249.mxroute.com [136.175.108.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6197156671
	for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 23:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711581807; cv=none; b=YS2A/f5wF8bKX9tGKdJIq1+/spzXa8eMIRSgwan8IitX6Siztt1vcvvqDcWvhDrRwNdHDJQWrU66kOAheo/738zJX429PzHnVggaLcnCAGhV8Gj29RQZ5tYdk5dCmoIt5nmil1iGcXIH9c0ba9dwQj9dhyFStAdSoSME79u1PEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711581807; c=relaxed/simple;
	bh=3LJ/xx4vsrKiCRk97kvpCp6ago1CACySem7BQV4Xz5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pnNy3xWgdmQlEBav37s+Y5z5nA4/hHOQg/xmP5qfGg+GtM9NCsiUo5oQAcjxK4vEgKBE08049BMNM8BH0Byyr/SegxQzOPDQGzHw3c85rIeLWMwi+846UFMjHdAJ+RKb6uQDBZOSCIaSgeEMHeSntIrh+gJpciYreU5gGqWiDRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=hTxbudJR; arc=none smtp.client-ip=136.175.108.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta249.mxroute.com (ZoneMTA) with ESMTPSA id 18e8234967b0003bea.010
 for <linux-media@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 27 Mar 2024 23:17:48 +0000
X-Zone-Loop: fa07100207299345821392fdb74bce5a130091d5aa16
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NKk0T+d3dsRrMPw1XZzJJ8j4Y7WxSYSZmFULC91tvv0=; b=hTxbudJRSiFPMc+ihEv8FupVz3
	k8LehyTrGLjdIxqWCNs6So6isud70oR3Q0ThwGcNRdqOX/Ou1r6/yfBKPCvXd9Ksp/+LbvIF0NYxM
	htbsIktfGtMI6pqsuH+EMib1iTiaSjaj+Nih63nFOGB9Tl+YCYfOOBI5P3yEQefSbzUnGuHsgD4Mz
	7rNDnYpwBcjd50kw1hriv3WMo107A09lWSE1bmfdOcyjV6VaP8bnuTP00goRptSb4yGdHMhUUNfJe
	UgFuTJdhzdooQcAwd9IFDe8DbwPqEj5Dw4l+Wl2tNDs0JCEWW0tRjaJshDdQRX2u/h2zEGYtKApRb
	EMWqO8iQ==;
From: git@luigi311.com
To: linux-media@vger.kernel.org
Cc: dave.stevenson@raspberrypi.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	sakari.ailus@linux.intel.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Luigi311 <git@luigi311.com>
Subject: [PATCH 15/23] media: i2c: imx258: Set pixel_rate range to the same as the value
Date: Wed, 27 Mar 2024 17:17:01 -0600
Message-ID: <20240327231710.53188-16-git@luigi311.com>
In-Reply-To: <20240327231710.53188-1-git@luigi311.com>
References: <20240327231710.53188-1-git@luigi311.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: personal@luigi311.com

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

With a read only control there is limited point in advertising
a minimum and maximum for the control, so change to set the
value, min, and max all to the selected pixel rate.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Luigi311 <git@luigi311.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/imx258.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index a62ed8c26663..66022088e4da 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -978,7 +978,8 @@ static int imx258_set_pad_format(struct v4l2_subdev *sd,
 
 		link_freq = imx258->link_freq_menu_items[mode->link_freq_index];
 		pixel_rate = link_freq_to_pixel_rate(link_freq, imx258->nlanes);
-		__v4l2_ctrl_s_ctrl_int64(imx258->pixel_rate, pixel_rate);
+		__v4l2_ctrl_modify_range(imx258->pixel_rate, pixel_rate,
+					 pixel_rate, 1, pixel_rate);
 		/* Update limits and set FPS to default */
 		vblank_def = imx258->cur_mode->vts_def -
 			     imx258->cur_mode->height;
@@ -1269,8 +1270,7 @@ static int imx258_init_controls(struct imx258 *imx258)
 	struct v4l2_ctrl *vflip, *hflip;
 	s64 vblank_def;
 	s64 vblank_min;
-	s64 pixel_rate_min;
-	s64 pixel_rate_max;
+	s64 pixel_rate;
 	int ret;
 
 	ctrl_hdlr = &imx258->ctrl_handler;
@@ -1301,18 +1301,13 @@ static int imx258_init_controls(struct imx258 *imx258)
 	if (vflip)
 		vflip->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-	pixel_rate_max =
-		link_freq_to_pixel_rate(imx258->link_freq_menu_items[0],
-					imx258->nlanes);
-	pixel_rate_min =
-		link_freq_to_pixel_rate(imx258->link_freq_menu_items[1],
-					imx258->nlanes);
+	pixel_rate = link_freq_to_pixel_rate(imx258->link_freq_menu_items[0],
+					     imx258->nlanes);
 	/* By default, PIXEL_RATE is read only */
 	imx258->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &imx258_ctrl_ops,
 				V4L2_CID_PIXEL_RATE,
-				pixel_rate_min, pixel_rate_max,
-				1, pixel_rate_max);
-
+				pixel_rate, pixel_rate,
+				1, pixel_rate);
 
 	vblank_def = imx258->cur_mode->vts_def - imx258->cur_mode->height;
 	vblank_min = imx258->cur_mode->vts_min - imx258->cur_mode->height;
-- 
2.42.0


