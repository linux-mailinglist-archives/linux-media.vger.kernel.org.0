Return-Path: <linux-media+bounces-698-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2627F3CCF
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 05:30:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD14C280D4B
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 04:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 888B011C96;
	Wed, 22 Nov 2023 04:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dghfjNqr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E59DB1A4;
	Tue, 21 Nov 2023 20:30:19 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 44FCB128D;
	Wed, 22 Nov 2023 05:29:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700627380;
	bh=yS/Oux+pXiXLp0wWEGoSxpw7w1avThLNA2g6ZYdZ3Gs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dghfjNqroIn+oB5DlnwtZb5kOjhSacTXpRm8Sab4lIPDynde+VYCVwfL9SqjhbuGd
	 ANhEWg9YYXS9DmyxdoZnYu4Hoa/2CVj2TGwSxXu6p6Ud9eLlvvOurak4x7SinGf6rM
	 R9i9zFFo83hUo2XKCP1WxBMdzl4xdgFky35VtACM=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [RFC PATCH v1 05/19] media: renesas: vsp1: Drop custom .get_fmt() handler for histogram
Date: Wed, 22 Nov 2023 06:29:55 +0200
Message-ID: <20231122043009.2741-6-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231122043009.2741-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20231122043009.2741-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The histogram module is the only one that has a custom .get_fmt()
handler, to handle the special case of the output format being fixed.
This can equally well be handled in the .set_fmt() handler instead.
Beside avoiding special cases and using the same .get_fmt() handler in
all modules, it ensures that the correct format is stored in the active
state for the source pad, including when .set_fmt() is called from
vsp1_entity_init_state(). Both are needed to later switch to the V4L2
subdev active state API.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_histo.c  | 29 +++++++------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_histo.c b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
index 576270cb3e63..a4076d82651e 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_histo.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
@@ -356,30 +356,21 @@ static int histo_set_selection(struct v4l2_subdev *subdev,
 	return ret;
 }
 
-static int histo_get_format(struct v4l2_subdev *subdev,
-			    struct v4l2_subdev_state *sd_state,
-			    struct v4l2_subdev_format *fmt)
-{
-	if (fmt->pad == HISTO_PAD_SOURCE) {
-		fmt->format.code = MEDIA_BUS_FMT_FIXED;
-		fmt->format.width = 0;
-		fmt->format.height = 0;
-		fmt->format.field = V4L2_FIELD_NONE;
-		fmt->format.colorspace = V4L2_COLORSPACE_RAW;
-		return 0;
-	}
-
-	return vsp1_subdev_get_pad_format(subdev, sd_state, fmt);
-}
-
 static int histo_set_format(struct v4l2_subdev *subdev,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *fmt)
 {
 	struct vsp1_histogram *histo = subdev_to_histo(subdev);
 
-	if (fmt->pad != HISTO_PAD_SINK)
-		return histo_get_format(subdev, sd_state, fmt);
+	if (fmt->pad == HISTO_PAD_SOURCE) {
+		fmt->format.code = MEDIA_BUS_FMT_FIXED;
+		fmt->format.width = 0;
+		fmt->format.height = 0;
+		fmt->format.field = V4L2_FIELD_NONE;
+		fmt->format.colorspace = V4L2_COLORSPACE_RAW;
+
+		return 0;
+	}
 
 	return vsp1_subdev_set_pad_format(subdev, sd_state, fmt,
 					  histo->formats, histo->num_formats,
@@ -390,7 +381,7 @@ static int histo_set_format(struct v4l2_subdev *subdev,
 static const struct v4l2_subdev_pad_ops histo_pad_ops = {
 	.enum_mbus_code = histo_enum_mbus_code,
 	.enum_frame_size = histo_enum_frame_size,
-	.get_fmt = histo_get_format,
+	.get_fmt = vsp1_subdev_get_pad_format,
 	.set_fmt = histo_set_format,
 	.get_selection = histo_get_selection,
 	.set_selection = histo_set_selection,
-- 
Regards,

Laurent Pinchart


