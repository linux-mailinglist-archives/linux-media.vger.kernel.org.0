Return-Path: <linux-media+bounces-42723-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00842B84CD6
	for <lists+linux-media@lfdr.de>; Thu, 18 Sep 2025 15:28:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFF891B283C1
	for <lists+linux-media@lfdr.de>; Thu, 18 Sep 2025 13:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B90130C10E;
	Thu, 18 Sep 2025 13:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Rp/yGahY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E835830BBB7;
	Thu, 18 Sep 2025 13:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758202086; cv=none; b=i2Ig4jHv/9880BFoHfODCi1j+GZbQ/VUQCCTTFkQ+yMcYrTSPdS/aodipffAuYcsPbSXzVquXAMXF/JInk+iMo0ftMOOpxsng3T+UOylPUZKNYegEZDj4BXRYWs8qMkzNPLLO/Fd3jyXaOp/TMw1N0CQY3Qo41nM4lWvB2UXvs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758202086; c=relaxed/simple;
	bh=DoBsDaGqEJNKTdRe0Qu1ZI7WBIJo5cmvQqFN0orYVr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CDiaNM0Nr2/lQ2tDCpa4HYMCaHg5/8B31VlOqzEhRYcpeSfhLZm9UGL3bweR6YoSJVf2xdANTwPFmpF2fuzqPno0rFT0vuwp1xD47HQNdkudOCMB+Cm8pr8ckCFDdoCl2ibFRWpNzbh1DoA2wrRkh4fgChhHrGfIxGAnOBJFpSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Rp/yGahY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from Monstersaurus.lan (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4752B11A0;
	Thu, 18 Sep 2025 15:26:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758201999;
	bh=DoBsDaGqEJNKTdRe0Qu1ZI7WBIJo5cmvQqFN0orYVr4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rp/yGahYl16198iT4eijsg6AN++fxiJH0nWwwoyuNG9OUFcEQFs/wV1CR7aLmzCkn
	 iGxPHODoao8WrtbIFpsdHEubng9o6+xFezfKItHxtsONC/jco/Qj6YNwsOkt2aYIB6
	 C6WrCvbH4SLw9V10vmR/TVtM5vmbPuT4ornXatMo=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/3] media: i2c: imx283: Fix handling of unsupported mbus codes
Date: Thu, 18 Sep 2025 14:27:53 +0100
Message-ID: <20250918132753.3154059-4-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250918132753.3154059-1-kieran.bingham@ideasonboard.com>
References: <20250918132753.3154059-1-kieran.bingham@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Klug <stefan.klug@ideasonboard.com>

When the code requested by imx283_set_pad_format() is not supported, a
kernel exception occurs due to dereferencing the mode variable which is
null. Fix that by correcting the code to a valid value before getting
the mode table.

While at it, remove the cases for the other unsupported codes in
get_mode_table.

Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/imx283.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
index 582975ac849f..48a92bc8e6f1 100644
--- a/drivers/media/i2c/imx283.c
+++ b/drivers/media/i2c/imx283.c
@@ -576,23 +576,31 @@ static inline struct imx283 *to_imx283(struct v4l2_subdev *sd)
 	return container_of_const(sd, struct imx283, sd);
 }
 
+static inline int get_format_code(unsigned int code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(imx283_mbus_codes); i++)
+		if (imx283_mbus_codes[i] == code)
+			break;
+
+	if (i >= ARRAY_SIZE(imx283_mbus_codes))
+		i = 0;
+
+	return imx283_mbus_codes[i];
+}
+
 static inline void get_mode_table(unsigned int code,
 				  const struct imx283_mode **mode_list,
 				  unsigned int *num_modes)
 {
 	switch (code) {
 	case MEDIA_BUS_FMT_SRGGB12_1X12:
-	case MEDIA_BUS_FMT_SGRBG12_1X12:
-	case MEDIA_BUS_FMT_SGBRG12_1X12:
-	case MEDIA_BUS_FMT_SBGGR12_1X12:
 		*mode_list = supported_modes_12bit;
 		*num_modes = ARRAY_SIZE(supported_modes_12bit);
 		break;
 
 	case MEDIA_BUS_FMT_SRGGB10_1X10:
-	case MEDIA_BUS_FMT_SGRBG10_1X10:
-	case MEDIA_BUS_FMT_SGBRG10_1X10:
-	case MEDIA_BUS_FMT_SBGGR10_1X10:
 		*mode_list = supported_modes_10bit;
 		*num_modes = ARRAY_SIZE(supported_modes_10bit);
 		break;
@@ -973,6 +981,8 @@ static int imx283_set_pad_format(struct v4l2_subdev *sd,
 	const struct imx283_mode *mode_list;
 	unsigned int num_modes;
 
+	fmt->format.code = get_format_code(fmt->format.code);
+
 	get_mode_table(fmt->format.code, &mode_list, &num_modes);
 
 	mode = v4l2_find_nearest_size(mode_list, num_modes, width, height,
@@ -1371,8 +1381,6 @@ static int imx283_init_controls(struct imx283 *imx283)
 
 	imx283->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx283_ctrl_ops, V4L2_CID_VFLIP,
 					  0, 1, 1, 0);
-	if (imx283->vflip)
-		imx283->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 
 	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &imx283_ctrl_ops,
 				     V4L2_CID_TEST_PATTERN,
-- 
2.50.1


