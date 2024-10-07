Return-Path: <linux-media+bounces-19182-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE4F9936BE
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 20:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CDFF282055
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 18:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B2AC1DF967;
	Mon,  7 Oct 2024 18:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zcx/iFOM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AE11DF72D;
	Mon,  7 Oct 2024 18:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728326950; cv=none; b=NeNjWKFLNM6IHRtoikU/XZkhK9ys0mtL2/XTXXvpshZwJb06pHBeBUKyZ1kce5lxWeaGw8pPFvrJcFdTjSKRjjAjh4N4Igwa+mQ+LP5JJIGAF1smmAjPYFw/mwX3QZEAUpyomkrvuGCgtKXVsGjHB4mZ3CnJnkrM134RV3F7ZtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728326950; c=relaxed/simple;
	bh=1nACJmXss4rs2ggvNM3w/QOnFvfKel8r7eag4gbUW6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cT+ZkZtCb70drCa7tqY/SSr3qzTeR/M8xeN+nziEyPcP1CXbvvjUHkMcpE+HyvXl3ECfAEV6VQ8xPeBoYHaOriZB1MqbwsYABmz/V3HQj4Z0z0Pyt5YckC+6IqHmkPGHcbIJquyUSqkn8H2/yCIn5vQceqiJmoj2mBAkzmlm8jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zcx/iFOM; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539908f238fso5345705e87.2;
        Mon, 07 Oct 2024 11:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728326947; x=1728931747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9JEATOmL2K7hfOJu0mTaa+l9QgeR1FwIUzr8jZgEsCU=;
        b=Zcx/iFOMVDpW9WYn8gowNlHHD9/yOwbGeF+Nbc4FGECjlOqMJMRtk4P7GplX8PxLZJ
         SlVl0g+3ShFGkYs0QN1C9HIGYeINBYGS/22Ec/WmXvMIv5okCXMlBlulaqx5DspdZozC
         mCeEOAkCH260+xLI2GHowJh6e+/vaX885ZGEF93ChwRxdid4kII+dfxh9ImsooQW//Va
         XnU1naulesuqaWj9TQJfOHZjnRdt9efTh0rK+/bMLP34YgO0PnDORdzNjGiJZU9x3MQq
         TH/oZnNcDjWUENGOBYwPNqYfaq0OALIUVPkmend1/DdFvPmnlCbI65U2C6zesAXA12kQ
         M3GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728326947; x=1728931747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9JEATOmL2K7hfOJu0mTaa+l9QgeR1FwIUzr8jZgEsCU=;
        b=CEUbKZX/bj7K2tLE0ljjebpVsyd/a7J9HOtn2sbv18SihdQCu71pULGQdq8l7tWIbt
         s+B4kzjz2658tR5yrsfW3GhF5EA4zboGDcCy/e9GLomPneRFId3Jodlly1elcFI0Ruzh
         7YbqtupQ48YsPLJzQcaKuWI5YE7FUUNuvklWqhQ4vyjSywASIqkF2UYLLlIQhJ1eugKT
         1KsLNi1qVKw+nlpbWsPlaqa2We/Z2J8WXUoB9hTpHx2fte5IgKWFm6sqSMnXUYXPcY+S
         ZI7j/uQZq2hrSD/ZFDLcqRXGdr3kIXEh2nLs3mEti1a3mpYp2j83Vc8G9kPJ9aV0r7dv
         tpKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVA9evzn1fflsBWo81dJL0Wv4R7+kUJFlreGURIyo+q1QoYAektMr5uL0kt8aShXM4GP0E2LJh1DdtxA+PhSc0sfwk=@vger.kernel.org, AJvYcCXpW7nNms6NLXBBL5Sunh+w+ao8VUlmJ0KFd3RG4mfIYCX/whHMo1+bDG58poN98oCwF9V8PnSjfoJgGfk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtRMWD9rHHV3NBzw3/8gb/9asS3iwDmqUR341hOjzoSj33s/NC
	kUL2txWOWxwv4imPuf2OcxK+dz3i7PUXnteBQUMvU+ZNQ2HqCCNI
X-Google-Smtp-Source: AGHT+IED3qM5Jvka2QYFA2RXc27lbtAKoostEzGULQQHVPXA9cKYbRziMYgHlK+XNQiXPel5yGN2eA==
X-Received: by 2002:a05:6512:3089:b0:539:918c:5124 with SMTP id 2adb3069b0e04-539ab88d663mr6035723e87.31.1728326946771;
        Mon, 07 Oct 2024 11:49:06 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:f429:642d:d66a:1085])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9953d48594sm180102766b.176.2024.10.07.11.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 11:49:06 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 13/17] media: rzg2l-cru: video: Implement .link_validate() callback
Date: Mon,  7 Oct 2024 19:48:35 +0100
Message-ID: <20241007184839.190519-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241007184839.190519-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241007184839.190519-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Implement the `.link_validate()` callback for the video node and move the
format checking into this function. This change allows the removal of
`rzg2l_cru_mc_validate_format()`.

Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 91 ++++++++++---------
 1 file changed, 47 insertions(+), 44 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index ceb9012c9d70..385b4242db2f 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -189,46 +189,6 @@ static void rzg2l_cru_buffer_queue(struct vb2_buffer *vb)
 	spin_unlock_irqrestore(&cru->qlock, flags);
 }
 
-static int rzg2l_cru_mc_validate_format(struct rzg2l_cru_dev *cru,
-					struct v4l2_subdev *sd,
-					struct media_pad *pad)
-{
-	struct v4l2_subdev_format fmt = {
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-	};
-
-	fmt.pad = pad->index;
-	if (v4l2_subdev_call_state_active(sd, pad, get_fmt, &fmt))
-		return -EPIPE;
-
-	switch (fmt.format.code) {
-	case MEDIA_BUS_FMT_UYVY8_1X16:
-		break;
-	default:
-		return -EPIPE;
-	}
-
-	switch (fmt.format.field) {
-	case V4L2_FIELD_TOP:
-	case V4L2_FIELD_BOTTOM:
-	case V4L2_FIELD_NONE:
-	case V4L2_FIELD_INTERLACED_TB:
-	case V4L2_FIELD_INTERLACED_BT:
-	case V4L2_FIELD_INTERLACED:
-	case V4L2_FIELD_SEQ_TB:
-	case V4L2_FIELD_SEQ_BT:
-		break;
-	default:
-		return -EPIPE;
-	}
-
-	if (fmt.format.width != cru->format.width ||
-	    fmt.format.height != cru->format.height)
-		return -EPIPE;
-
-	return 0;
-}
-
 static void rzg2l_cru_set_slot_addr(struct rzg2l_cru_dev *cru,
 				    int slot, dma_addr_t addr)
 {
@@ -531,10 +491,6 @@ static int rzg2l_cru_set_stream(struct rzg2l_cru_dev *cru, int on)
 		return stream_off_ret;
 	}
 
-	ret = rzg2l_cru_mc_validate_format(cru, sd, pad);
-	if (ret)
-		return ret;
-
 	pipe = media_entity_pipeline(&sd->entity) ? : &cru->vdev.pipe;
 	ret = video_device_pipeline_start(&cru->vdev, pipe);
 	if (ret)
@@ -995,6 +951,52 @@ static const struct v4l2_file_operations rzg2l_cru_fops = {
 	.read		= vb2_fop_read,
 };
 
+/* -----------------------------------------------------------------------------
+ * Media entity operations
+ */
+
+static int rzg2l_cru_video_link_validate(struct media_link *link)
+{
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+	const struct rzg2l_cru_ip_format *video_fmt;
+	const struct rzg2l_cru_ip_format *ip_fmt;
+	struct v4l2_subdev *subdev;
+	struct rzg2l_cru_dev *cru;
+	struct media_pad *remote;
+	int ret;
+
+	remote = link->source;
+	subdev = media_entity_to_v4l2_subdev(remote->entity);
+	fmt.pad = remote->index;
+	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
+	if (ret < 0)
+		return ret == -ENOIOCTLCMD ? -EINVAL : ret;
+
+	cru = container_of(media_entity_to_video_device(link->sink->entity),
+			   struct rzg2l_cru_dev, vdev);
+	video_fmt = rzg2l_cru_ip_format_to_fmt(cru->format.pixelformat);
+	if (!video_fmt)
+		return -EPIPE;
+	ip_fmt = rzg2l_cru_ip_code_to_fmt(fmt.format.code);
+	if (!ip_fmt)
+		return -EPIPE;
+
+	if (fmt.format.width != cru->format.width ||
+	    fmt.format.height != cru->format.height ||
+	    fmt.format.field != cru->format.field ||
+	    video_fmt->code != fmt.format.code ||
+	    ip_fmt->format != cru->format.pixelformat)
+		return -EPIPE;
+
+	return 0;
+}
+
+static const struct media_entity_operations rzg2l_cru_video_media_ops = {
+	.link_validate = rzg2l_cru_video_link_validate,
+};
+
 static void rzg2l_cru_v4l2_init(struct rzg2l_cru_dev *cru)
 {
 	struct video_device *vdev = &cru->vdev;
@@ -1006,6 +1008,7 @@ static void rzg2l_cru_v4l2_init(struct rzg2l_cru_dev *cru)
 	vdev->lock = &cru->lock;
 	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
 	vdev->device_caps |= V4L2_CAP_IO_MC;
+	vdev->entity.ops = &rzg2l_cru_video_media_ops;
 	vdev->fops = &rzg2l_cru_fops;
 	vdev->ioctl_ops = &rzg2l_cru_ioctl_ops;
 
-- 
2.43.0


