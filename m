Return-Path: <linux-media+bounces-15855-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8A09493CC
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 16:53:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFB9B1C21159
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 14:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3120B20FAAB;
	Tue,  6 Aug 2024 14:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tB/8xZhN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25409205E15
	for <linux-media@vger.kernel.org>; Tue,  6 Aug 2024 14:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722955903; cv=none; b=upBo9hiv/MRQHLQlctPYIb+6GYO5Vcs5dSF/rKMZxqPJpmy6+ujp3yRj5Wiwm1PiPX1et/duStekaCnZX6SZcgHTTtklHFsQyYRR+75l8n/ABRbdpzmCr7iRNIKYCetrkGOqShSBtHtLmOJBfqK3Cwpun3KmUGiYJIT1fGyQ7so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722955903; c=relaxed/simple;
	bh=j97clWftgNa/YAXMQ81S5TmDgnY0rzeJwjaShFp3ShQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dpIG+RQJz4HMx11JpzGuWnz/4YXnv6quaeqwa/PRPW2PuoBowl2QKGq4iSzpJtwAJh+wLgDDdzoPFrZzStxln+aizNoyGwotvB0MQUBj0D0a3zSjrLkvbVyquChl2cd8yVZ2D0gptpzac2OnVcOJ8yEuhJVZuUjB6w9xrhuhARg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tB/8xZhN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-91-24-0.net.vodafone.it [5.91.24.0])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E598922;
	Tue,  6 Aug 2024 16:50:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722955845;
	bh=j97clWftgNa/YAXMQ81S5TmDgnY0rzeJwjaShFp3ShQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tB/8xZhNB5GvJWr2Q0wK3oBGEU5p+SUoU/4yfWZrVohj0b8FpiIfqlLFo6O5PNTVb
	 ifg6A7Mr5A//DlCG7nYpVy7vS+8YCkMBtFeqGVSmRLSu3u+bVLXvCcycADf2gwSpth
	 M77G6sWfFBcDOL8qGIWruOqqNq0YkP2P8xr3adGo=
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
	Heiko Stuebner <heiko@sntech.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v8 07/12] media: rkisp1: Implement s_fmt/try_fmt
Date: Tue,  6 Aug 2024 16:51:03 +0200
Message-ID: <20240806145110.918843-8-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240806145110.918843-1-jacopo.mondi@ideasonboard.com>
References: <20240806145110.918843-1-jacopo.mondi@ideasonboard.com>
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
Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
Tested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../platform/rockchip/rkisp1/rkisp1-params.c  | 58 ++++++++++++++++---
 1 file changed, 50 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index aeadee1f6145..559ba77a37d2 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -75,6 +75,17 @@ static const struct v4l2_meta_format rkisp1_params_formats[] = {
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
@@ -2244,12 +2255,12 @@ static int rkisp1_params_enum_fmt_meta_out(struct file *file, void *priv,
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
@@ -2264,9 +2275,40 @@ static int rkisp1_params_g_fmt_meta_out(struct file *file, void *fh,
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
@@ -2296,8 +2338,8 @@ static const struct v4l2_ioctl_ops rkisp1_params_ioctl = {
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


