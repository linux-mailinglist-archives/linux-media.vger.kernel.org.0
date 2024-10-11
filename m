Return-Path: <linux-media+bounces-19466-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE2C99AA4D
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 19:36:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCB6C28B2D4
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 17:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12F681D2718;
	Fri, 11 Oct 2024 17:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4ySrPXX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAF11D1720;
	Fri, 11 Oct 2024 17:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728667883; cv=none; b=cP0RGSqC/tG/GBc1CnRgiHKNJ28r2dtmi/6D+K0JvBucimdQYB3yQ+Pn7dOgbZVynqMMlkA8c6X8tSLSXRRtFwu7pHCbXAwVX3fWfUvVfZYr2h8+GSGiVn5ROTmHsI4LI7ERRT4bMhK1+f2t9Po4Owr/TceRB7T6Z2E0vN1IgkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728667883; c=relaxed/simple;
	bh=0+gFmlB4DNsucu+x+eYtavQ45hrttAe5qwlf52qdboo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GJaFiw4UwMesI0n/crlVbfNY5eVK5iDgq5m+8XENF509nifmzcCWyHQCoIGKbLRgbW4+Yv0snJfLm3Hodj8lbJmk0knMJBy95qxd6B2MxwpGFkRVnvUYgqkFoWY41F4NXaFfc1GMqVm75zt86HI9G7nN7gVF8kBO0J97BH92kks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4ySrPXX; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-431195c3538so14086635e9.3;
        Fri, 11 Oct 2024 10:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728667880; x=1729272680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ooCU0k683F64MUyLXar1nJROGv5on2+s8CeEiSJY7pw=;
        b=N4ySrPXXMel/mMtMbBWd0tMWLqCQ+vJpVhc8TushIsgzzmJ9hY3BZSjBYk1TPCpGrp
         kLNe4hElXGidyjjSO+hfHEDaAwi1sEksnGh1exU5hpNsQeSVcy26EgTzNMqkRyMnZWd8
         Kye9E4GdmvT7cCsF1EfvZy//Hyok0w35ieXBvaeXP96Cc73bueDMUIi20IG1LGqMJf+b
         TAko2aNPP3T+gW6wTnY/QBwAoalbwWFtJFqao8OoFIlEec3NvYLN1TUFKw4jwdfRPG1y
         GR4Nq3gtO0qZ6f7ddSVZFYHp06EuA2+dqGkV9WcrFtlFfXgEiwqrEyG9MuLtHyKd/BFd
         sA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728667880; x=1729272680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ooCU0k683F64MUyLXar1nJROGv5on2+s8CeEiSJY7pw=;
        b=oHwJPx716QRm/7CyAK7AabE3UWXb9MhoWCZSXXH5hx4bUkcUGlUrQF3t1VXEaiumUJ
         kiLO5kgZlQprrJUlPaUbtjAlhoiek0yiiBhorMf0DLWjwXTzALbqD/9xb9c3gE59CVUW
         S527oi8SrE0lu+93fk0+KgrM/6A+/WvzoZlex0GqMJSVRMLbpfjz0m5xt2MTHpoHfm7z
         8XNQO4UqKcXtC+G8dYIHZZhktEXQhhei2SofX/yRELuUJ3QnxQhH+Xda+2FqLQuOqTXW
         jr88J42sCs9rjqUpzaIb3BvqBphAG32U02pY3uVPoPzz028pAkekeDZVUkHUPUEKvGRH
         w2RA==
X-Forwarded-Encrypted: i=1; AJvYcCVx4oFkd+2mftpOW4gOwc8A1WGbvwnqn6oDW1qSrdM6tdpCJjM/X+Fg6Z+UXQnY6YQfPmaAaAsvfUnYugcsNM8YVTg=@vger.kernel.org, AJvYcCWUXHQdrko7gM/OxJIHEErfLr+QEQgGJWUvr6rMXIBt2ceOH2/SR0bNmDqjmIhcLh52WoLQu7UrbaGzO80=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwCW7aCuNPOcsynXqyetDJ92d8Lxtb1BGf27J/dDxnWASCjujl
	H7Z16aok9Z7tNsfpaA+CUcR5o3Ngra+FNIIyDNw9ThVjSkHTUVkQ
X-Google-Smtp-Source: AGHT+IGE5ulRsw/Sdmmpuv0daohzxFgdMDrRE0Nf1Ba1RWcNnP7PYvpfyNTl0ydG0kA9jp2JENdzNQ==
X-Received: by 2002:a05:600c:c0d:b0:42f:7e87:3438 with SMTP id 5b1f17b1804b1-4311de0041fmr25994355e9.0.1728667879673;
        Fri, 11 Oct 2024 10:31:19 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b79fa0asm4396516f8f.83.2024.10.11.10.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 10:31:19 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 18/22] media: rzg2l-cru: video: Implement .link_validate() callback
Date: Fri, 11 Oct 2024 18:30:48 +0100
Message-ID: <20241011173052.1088341-19-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 82 +++++++++----------
 1 file changed, 38 insertions(+), 44 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 0cc69a7440bf..df6114cbe5c7 100644
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
@@ -532,10 +492,6 @@ static int rzg2l_cru_set_stream(struct rzg2l_cru_dev *cru, int on)
 		return stream_off_ret;
 	}
 
-	ret = rzg2l_cru_mc_validate_format(cru, sd, pad);
-	if (ret)
-		return ret;
-
 	pipe = media_entity_pipeline(&sd->entity) ? : &cru->vdev.pipe;
 	ret = video_device_pipeline_start(&cru->vdev, pipe);
 	if (ret)
@@ -986,6 +942,43 @@ static const struct v4l2_file_operations rzg2l_cru_fops = {
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
+	struct v4l2_subdev *subdev;
+	struct rzg2l_cru_dev *cru;
+	int ret;
+
+	subdev = media_entity_to_v4l2_subdev(link->source->entity);
+	fmt.pad = link->source->index;
+	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
+	if (ret < 0)
+		return ret == -ENOIOCTLCMD ? -EINVAL : ret;
+
+	cru = container_of(media_entity_to_video_device(link->sink->entity),
+			   struct rzg2l_cru_dev, vdev);
+	video_fmt = rzg2l_cru_ip_format_to_fmt(cru->format.pixelformat);
+
+	if (fmt.format.width != cru->format.width ||
+	    fmt.format.height != cru->format.height ||
+	    fmt.format.field != cru->format.field ||
+	    video_fmt->code != fmt.format.code)
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
@@ -997,6 +990,7 @@ static void rzg2l_cru_v4l2_init(struct rzg2l_cru_dev *cru)
 	vdev->lock = &cru->lock;
 	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
 	vdev->device_caps |= V4L2_CAP_IO_MC;
+	vdev->entity.ops = &rzg2l_cru_video_media_ops;
 	vdev->fops = &rzg2l_cru_fops;
 	vdev->ioctl_ops = &rzg2l_cru_ioctl_ops;
 
-- 
2.43.0


