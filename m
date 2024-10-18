Return-Path: <linux-media+bounces-19879-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FBE9A4005
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84A0E284F27
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 13:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE867204F8A;
	Fri, 18 Oct 2024 13:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDeKnAKJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3700D20493D;
	Fri, 18 Oct 2024 13:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729258522; cv=none; b=kcgV7dE2VUkKt4hSLtzXRs8/fVpDj3JKrNy77QEwIUOEVv7gq8svpH9hHvx7SfVusbFwAAtBxlwtFdlIP2rq5ZPjm+wj4erNcH7Tk4V1kxXwS9z0bmjHqLg6Ph95sEWVP1uJRi2fv+aTi+VuPhAPafznFNj55Rri9UwN9seJons=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729258522; c=relaxed/simple;
	bh=dObkFoQMfxWpnzmFLXeLG9Ub7x7dLl4erSWlskl+/0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S7UjkwpRBuzlCB5A2w7guSPP1flEg/rxhvoI4HjOP6Mzx1q3G2JOWuEt03MKMJP8+96s2Pzs199D2nqRbuEHG96kJLkAe1mmgFVxFgKTQE08BmDX+oFyZMS0wCPCqfmCH83HDEVxfTifEiirpFNLbc0ecKAs0VVG1dP9lh30xUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDeKnAKJ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43158625112so19960635e9.3;
        Fri, 18 Oct 2024 06:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729258517; x=1729863317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNd9OmmvhKypM/yaRV3iO9rQyA+b1IGapkHtHr4lWe0=;
        b=XDeKnAKJfJzdYpnNTaHUUkEpP4iqaiTtKNdEuOqZYabBF3KbhpiRc0wzAyWVBZEKob
         fwAM1pEXPkHbG3IgTNS6VxOjs5GtOx881TThCwsGAihr0PqR5Vj8qmjYUk151KI+eRO6
         ZxpOecyN7KM9coJFqVf6+ayTE9QkJNaxrssyyLIRMMHSwlRIKCeU475EJg034IGUA2zT
         9i2XGCWkIJNCxn5NuoGxs03waI5IX4VZMdIa3s5pWfxjznFUg22+X6X/quBzYjctSKnq
         WAPlJ0HoJcrHMWMs512BTUwkWBHMfWoCgo1udRPQocfYYk0asbvPSgZT60NnA51XQotw
         Mr6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729258517; x=1729863317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KNd9OmmvhKypM/yaRV3iO9rQyA+b1IGapkHtHr4lWe0=;
        b=grCWj4T8TOFvQcrjbhV6KmgzVSxGw1pq3ZxZsA4l4aT+dDXEptIpacLsLxmZfHXttc
         UBJpYafWwSeC3RDPC+J7JvnXsbiUOsZcMxMBrylmOLLVB+siSsenh3z+x1qhTA96hjLV
         M6QD2aN1X006/3wHmB/RaVSr6j5Kv2pqdtLRUmWnV8K2GTImNL/NI7Ao/sG5j4YY5XxK
         LzEXGnCuolFpqgVrxAmRmzQxCvPYSfoykNY+sII0jg212rl+1Z0vmoT4hc4nfi7M/H3D
         wn34QO7KNTQ9VY99y+zq3fL7ttFI38/UrvLgOrRsFoebkTG7gHjsyzGPTkt8GL0yTCFp
         qmiw==
X-Forwarded-Encrypted: i=1; AJvYcCUAy4XIV48bzmH66B98dUn+ZcovbPYvD8yeI7RTw8qFBNCnGI5slUUG20ik6pyyV0wQrOqUnU3G023LjkE=@vger.kernel.org, AJvYcCUfWbGH/1FqHHzjV7tYAWpG4v3VoMnvKTn4g5omwKkhuiDoDhM7P3bY2IUvooHjoOPmGuH6Tn9ZsUuQDHRFw80+F78=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzvKP1xy+6phX9EeStHelWpydoqK52G1SbS9iLftxfJ19x8jgz
	YK5pxryloaSeMau7K3S9/I3qkYX+aNxKl5Wipyx6igfddp954iQj
X-Google-Smtp-Source: AGHT+IGDra0I5QNOVRlXXtYMG4+qRmi7l7aBsDf/8ur0p+vY3TxhgyHbl0QJCaUJkDdbPQWRDSt4fQ==
X-Received: by 2002:a05:600c:4f42:b0:431:44fe:fd9f with SMTP id 5b1f17b1804b1-431616a3ac4mr18375745e9.23.1729258517317;
        Fri, 18 Oct 2024 06:35:17 -0700 (PDT)
Received: from localhost.localdomain ([2a06:5906:61b:2d00:d416:f456:3869:adaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160e0a7acsm24320475e9.22.2024.10.18.06.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 06:35:16 -0700 (PDT)
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
Subject: [PATCH v6 18/23] media: rzg2l-cru: video: Implement .link_validate() callback
Date: Fri, 18 Oct 2024 14:34:41 +0100
Message-ID: <20241018133446.223516-19-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018133446.223516-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241018133446.223516-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Note, the fmt.format.code and fmt.format.field checks have be dropped as
the subdev .set_fmt() handler ensures that those fields always hold valid
values.

Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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


