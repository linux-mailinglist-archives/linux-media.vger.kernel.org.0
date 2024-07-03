Return-Path: <linux-media+bounces-14580-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B756925841
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 12:20:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D3281C2222C
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 10:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D231158853;
	Wed,  3 Jul 2024 10:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YpAwmRfM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A65514D42C
	for <linux-media@vger.kernel.org>; Wed,  3 Jul 2024 10:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720002027; cv=none; b=eGivYFOtvH1LtLu0D9bKJ3W+jZt3zeYBCcZ423X6W9fKflY9qCQ9Ep7C9brtJ71ZGYnqkIssDS8WoD7K7aysK1F4mIxZJPt9UAf9k7M3Cz8Jak7v9jyClcSpbsql6pzLRekotgHGOd6bPPtpmAELbgfkF9C9KHRED0e6CQdth/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720002027; c=relaxed/simple;
	bh=VokrLNrs9gNHkCC1WCvxyjaqv8wMnfkYoJ1Th2Yg45s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t4EHaI83OI0vllAZICvLgB9S0e8F5053ygwBXsf7eghnb0grVT/lLAyp13JWwDE1JdHfMa7SEwPAXTasakWR+arIKJoPbF3hMC556V0Weqb/BS/lFXwZ7GXcOyHcEENOEW9n+RglGCHtZdTsKxtDOGaKxkHIQD2uvX0sP2oQojw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YpAwmRfM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (unknown [IPv6:2001:b07:5d2e:52c9:cc1e:e404:491f:e6ea])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A0E4D49;
	Wed,  3 Jul 2024 12:19:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720001988;
	bh=VokrLNrs9gNHkCC1WCvxyjaqv8wMnfkYoJ1Th2Yg45s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YpAwmRfM5a/TruuOLdK0B7k7hHYZRApauitn+AWmzwpyBoIn+Rjtb/ZO5iW/EfuqO
	 RoB2Wkjb44YeHTkCXOhEilBS+W49kUavkOuFU+i+elx3TMPNI7iSPxDHFHO+R5eMu9
	 k/hONgQuoK/a/acofGKIwbM0VuGlMFUXxHfEBpB4=
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
Subject: [PATCH v4 7/7] media: rkisp1: Implement s_fmt/try_fmt
Date: Wed,  3 Jul 2024 12:19:50 +0200
Message-ID: <20240703101951.77785-8-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703101951.77785-1-jacopo.mondi@ideasonboard.com>
References: <20240703101951.77785-1-jacopo.mondi@ideasonboard.com>
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
index 125093d16adb..d1d4ccf6510b 100644
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
@@ -2233,12 +2244,12 @@ static int rkisp1_params_enum_fmt_meta_out(struct file *file, void *priv,
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
@@ -2253,9 +2264,40 @@ static int rkisp1_params_g_fmt_meta_out(struct file *file, void *fh,
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
@@ -2285,8 +2327,8 @@ static const struct v4l2_ioctl_ops rkisp1_params_ioctl = {
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


