Return-Path: <linux-media+bounces-16012-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D88394C5DD
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 22:41:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 592FE2832F5
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 20:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E3AC15AD86;
	Thu,  8 Aug 2024 20:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="W0cLwalI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C691591ED
	for <linux-media@vger.kernel.org>; Thu,  8 Aug 2024 20:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723149700; cv=none; b=N9um9iHmILvQsO7fky8mJxVexhImoFoc1kvtLbUDlmUU6GtUwXe8PiXSNpWFcyCcvIToZK0ga7R/HiH0JT2u6F3kEq1pW/84wq1I9Ea3QVEFNNbRPinxys2860B1KyV0Wa7aQavSKB/tvb4DYUKmek//iQindnPW6fJHEWJhwig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723149700; c=relaxed/simple;
	bh=hJcRkLnkeynPftZQmiCGH3ayrAPgzN//UkRnrjLcclI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hawHm//HgJOucyz5lWpWjknL57OCiepUGev+7ggDVzRicp3nn6HH3kfL3o+IWbehWLjc7sj/nCPC6998mB2ig3xGXzR/QOSE5WSboiR5wu+9ZBOs9S1XblzOu7WSOiKr/5PDcih6/VSxrA5KRhM8t8NEhgKJp4kLpsCKjoqd1XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=W0cLwalI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-52-118.net.vodafone.it [5.90.52.118])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E0CE916CD;
	Thu,  8 Aug 2024 22:40:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1723149634;
	bh=hJcRkLnkeynPftZQmiCGH3ayrAPgzN//UkRnrjLcclI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W0cLwalIfhA4Zc92suK1yh8rjiBigJjhUf7tMKEZ+96cNR44tU12mAfsTsZdSsdSg
	 2EK+mF9jjpwUtDKkcWra8w2WBx5qRNHv1qL4//2L5DtKF+gKQnujHPqurWwAE4WyD3
	 LsAzAAHFabW3SYzB23GZtsdiAcZCwVfjkkdogy78=
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
Subject: [PATCH v10 07/12] media: rkisp1: Implement s_fmt/try_fmt
Date: Thu,  8 Aug 2024 22:41:00 +0200
Message-ID: <20240808204106.2461316-8-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240808204106.2461316-1-jacopo.mondi@ideasonboard.com>
References: <20240808204106.2461316-1-jacopo.mondi@ideasonboard.com>
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
index 51d2de0f4b48..98a14b6dc4b5 100644
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


