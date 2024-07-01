Return-Path: <linux-media+bounces-14484-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 495D991E5ED
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 18:53:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04EE3284210
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 16:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 618EF16DEA8;
	Mon,  1 Jul 2024 16:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Am9lqe9P"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9C816DEDB
	for <linux-media@vger.kernel.org>; Mon,  1 Jul 2024 16:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719852774; cv=none; b=pnbT9y+dlTe/XVbAWyRpMYy855rmMf/q3r0sg6pnH2VsiTVM6PbBJBRKlEk9fC7NfdTHmgH5/q4dGv5wdRR1FVAw4IW5fVL39G0s6mcOiThO33SKvdpST9xi7SYCJfdi5iHXi0p0jjfNePsFIkefoXcUPLdEz6vUnEb8ehZSBaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719852774; c=relaxed/simple;
	bh=Ip/OJy0wI3HQUgt5KEBBdx7B2ncYmREmqXxuR6vtWJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aI/RsNGHfFtdKFWRHt49oYM07uTgrXNWvsdtZ+29nFHz8PBimL6f+VI8p8urIi4Y3CcBaYgeJcT8hSYsSgW3ChqGiIl1WlPdZnjy9mtBCfjgHpQMZFNlfIapBtXauYJQSuEQpFnBRMpK5dvQCFaZnqGuWIdhla5nyrLvZhuPrZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Am9lqe9P; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5A0B1BBE;
	Mon,  1 Jul 2024 18:52:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719852738;
	bh=Ip/OJy0wI3HQUgt5KEBBdx7B2ncYmREmqXxuR6vtWJY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Am9lqe9PGKYfPXcSK5W2PzC7Eur36hN2pM59rXGhQ2XaPon5n96hZABTYAgdX5H6D
	 MmT4LAj++qhxtkusLy6Mjyct4yGoyMJLHr7oXuJ0hVUlSh38loVsx67oCS7Hkn7BhH
	 O0yTWgroRoygEe2Jyd4hprF69btyCAJqXoEGZ+Sw=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v3 7/7] media: rkisp1: Implement s_fmt/try_fmt
Date: Mon,  1 Jul 2024 18:52:21 +0200
Message-ID: <20240701165222.205510-8-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240701165222.205510-1-jacopo.mondi@ideasonboard.com>
References: <20240701165222.205510-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement in the rkisp1 driver support for the s_fmt and try_fmt
operation to allow userspace to select between the extensible
and the fixed parameters formats.

Implement enum_mbus_code to enumerate the fixed and the extensible
formats and disallow changing the data format while the queue is busy.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-params.c  | 58 ++++++++++++++++---
 1 file changed, 50 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index d3752be7506d..e9df86943a28 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -54,6 +54,17 @@ static const struct v4l2_meta_format rkisp1_params_formats[] = {
 	},
 };
 
+static const struct v4l2_meta_format *
+rkisp1_params_get_format_info(u32 dataformat)
+{
+	for (unsigned int i = 0; i < ARRAY_SIZE(rkisp1_params_formats); i++) {
+		if (rkisp1_params_formats[i].dataformat == dataformat)
+			return &rkisp1_params_formats[i];
+	}
+
+	return &rkisp1_params_formats[RKISP1_PARAMS_FIXED];
+}
+
 static inline void
 rkisp1_param_set_bits(struct rkisp1_params *params, u32 reg, u32 bit_mask)
 {
@@ -2232,12 +2243,12 @@ static int rkisp1_params_enum_fmt_meta_out(struct file *file, void *priv,
 					   struct v4l2_fmtdesc *f)
 {
 	struct video_device *video = video_devdata(file);
-	struct rkisp1_params *params = video_get_drvdata(video);
 
-	if (f->index > 0 || f->type != video->queue->type)
+	if (f->index >= ARRAY_SIZE(rkisp1_params_formats) ||
+	    f->type != video->queue->type)
 		return -EINVAL;
 
-	f->pixelformat = params->metafmt->dataformat;
+	f->pixelformat = rkisp1_params_formats[f->index].dataformat;
 
 	return 0;
 }
@@ -2252,9 +2263,40 @@ static int rkisp1_params_g_fmt_meta_out(struct file *file, void *fh,
 	if (f->type != video->queue->type)
 		return -EINVAL;
 
-	memset(meta, 0, sizeof(*meta));
-	meta->dataformat = params->metafmt->dataformat;
-	meta->buffersize = params->metafmt->buffersize;
+	*meta = *params->metafmt;
+
+	return 0;
+}
+
+static int rkisp1_params_try_fmt_meta_out(struct file *file, void *fh,
+					  struct v4l2_format *f)
+{
+	struct video_device *video = video_devdata(file);
+	struct v4l2_meta_format *meta = &f->fmt.meta;
+
+	if (f->type != video->queue->type)
+		return -EINVAL;
+
+	*meta = *rkisp1_params_get_format_info(meta->dataformat);
+
+	return 0;
+}
+
+static int rkisp1_params_s_fmt_meta_out(struct file *file, void *fh,
+					struct v4l2_format *f)
+{
+	struct video_device *video = video_devdata(file);
+	struct rkisp1_params *params = video_get_drvdata(video);
+	struct v4l2_meta_format *meta = &f->fmt.meta;
+
+	if (f->type != video->queue->type)
+		return -EINVAL;
+
+	if (vb2_is_busy(video->queue))
+		return -EBUSY;
+
+	params->metafmt = rkisp1_params_get_format_info(meta->dataformat);
+	*meta = *params->metafmt;
 
 	return 0;
 }
@@ -2284,8 +2326,8 @@ static const struct v4l2_ioctl_ops rkisp1_params_ioctl = {
 	.vidioc_streamoff = vb2_ioctl_streamoff,
 	.vidioc_enum_fmt_meta_out = rkisp1_params_enum_fmt_meta_out,
 	.vidioc_g_fmt_meta_out = rkisp1_params_g_fmt_meta_out,
-	.vidioc_s_fmt_meta_out = rkisp1_params_g_fmt_meta_out,
-	.vidioc_try_fmt_meta_out = rkisp1_params_g_fmt_meta_out,
+	.vidioc_s_fmt_meta_out = rkisp1_params_s_fmt_meta_out,
+	.vidioc_try_fmt_meta_out = rkisp1_params_try_fmt_meta_out,
 	.vidioc_querycap = rkisp1_params_querycap,
 	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
 	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
-- 
2.45.2


