Return-Path: <linux-media+bounces-18941-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD7098BF48
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 16:12:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70850B25A75
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 14:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FFBC1CB33D;
	Tue,  1 Oct 2024 14:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FAO4TUG3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D791CB300;
	Tue,  1 Oct 2024 14:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727791795; cv=none; b=cCItbsO5AbTzthG/CGoNE0sAPooS56lj+jpcRN5EA8wBS3ps98c87HQ2RaZzNbxKNHLLQPsCXt0IjbPQO9pdcHEpBdlhtLe/AezW9zJJM8bnHEOyqyMiUlUYaDNyp5nr/277ppEqN0TaUzTQblnAlUR5nWf34cbSr1P0l3sSvjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727791795; c=relaxed/simple;
	bh=XoOVZDO7znVruwyD03vDwesLbcSXHzVPwLK7idCjKmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lut9wOZ6iyNfim+qdEcmX8pJld6I+7Ap7DTNJCnmfvSWuvDN/AvnZaSVZLu1uy9AiJhgshBpovgCaYEJQlmeX0HdJt7shWeU9R6y3aBMLq2zD9CONfq2bRPeh8wLpJbp5HFCpiheIXN9UATmJsgLNl5pS342wxsMZKZy3qo9Dw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FAO4TUG3; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a8d60e23b33so829891166b.0;
        Tue, 01 Oct 2024 07:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727791792; x=1728396592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFYIxN4CxKm/Cp2pLpSx+moRo34CdiHzwbCQCWScWnc=;
        b=FAO4TUG3wkMqhTmfx/NEVc8HzaZVNhRZe4CkNjC9GHYumXh22/D/vKrUJYx2EkRyu8
         cpv7AgzQGM+fsOnAVazEbte5bS3DASvptHkr+DG6bZAogDUjsbsSTNjAN+5HNNJ7Zw4x
         6zzNnJEn/WuEm7ECgGHeqFwIBa/HGM8fRq4NdQGvSYVl5X7A47FgVQRft7HYha+jQJNy
         5PwqP/XEHRLdcLKayC/I4oqT+ghNdGDZw2zOum0UZI7qMFlFuVMT4jOznLLohTOkVqpi
         +FwwtPcL9MG+kuY3p3w8uEVPt+2Ei0lQc4quiJbxz3AqeYhILk1/hPOc8RYkxXioKKtD
         k59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727791792; x=1728396592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sFYIxN4CxKm/Cp2pLpSx+moRo34CdiHzwbCQCWScWnc=;
        b=hjMCdb4wOMKDNLzdmtbQI+LFA7xTGHbFZ3gO/Wzl7jZjT1RwZ/nJ8dSSp+Q5Lmeont
         L+GI4ipd3+aRvIVC7JF+/9GcrZTj60EO+vh1qYFs30Jx3fBGTnY3ssOuoDLlLoRnv4sq
         4ITt6604hgzi78Hbysb9oW2RNr+N/m6DrNkc7SkjG0jxKWuck8GhDxgeuzqitFSMXa6E
         5dbhmHVCfnxfYW0Gp45fBoedjg1dvwe5k1T/J44kKw+c01/0FvSzixP8PAT1JsLmavGk
         hRyHzmvlpWlOZibpM+52pzhrh9HO2CUiD/y666Awr2YsQ4sdCQWHHkgFYGiiQ/EfUqAX
         gxfw==
X-Forwarded-Encrypted: i=1; AJvYcCUwFSRw1CpRcyEFUK5sPIk1HI3BcpUa2CgRVTzdXAXuk9rbBuqAW7x3hNpQnXaDnXR8VujL/BRYUBFPI99fUQKty0E=@vger.kernel.org, AJvYcCX+2opGxqbVw//eC0X/YBIoz4KlCOcK07tL0sL0yIkybaawmIS1jubYW1znPJOEiE2SmtcVCKxqvwfczEw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9QEELySdnj5yeKoMmQyiFGwZAwPC9CBzrUJyr9lz/szf9s9g/
	CBHdCdL+3XWjB5UgBwJdyFwyW8enjhcfMPcywheldYSjDfpDvPhS
X-Google-Smtp-Source: AGHT+IHaBjCiI4qrEkOT4hdu2rBQfaNg26yNAHf+wt3raC5GYtvCm2gGlSCu45/fvFK16P3a5fDQ2Q==
X-Received: by 2002:a17:906:dc92:b0:a8a:926a:d02a with SMTP id a640c23a62f3a-a93c4adebfcmr1456576766b.49.1727791791788;
        Tue, 01 Oct 2024 07:09:51 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2776de0sm723532966b.2.2024.10.01.07.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 07:09:51 -0700 (PDT)
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
Subject: [PATCH v3 13/17] media: rzg2l-cru: video: Implement .link_validate() callback
Date: Tue,  1 Oct 2024 15:09:15 +0100
Message-ID: <20241001140919.206139-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241001140919.206139-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241001140919.206139-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v2->v3
- New patch
---
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 99 ++++++++++---------
 1 file changed, 55 insertions(+), 44 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index ceb9012c9d70..c6c82b9b130a 100644
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
@@ -995,6 +951,60 @@ static const struct v4l2_file_operations rzg2l_cru_fops = {
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
+	struct v4l2_subdev *subdev;
+	struct media_entity *entity;
+	struct rzg2l_cru_dev *cru;
+	struct media_pad *remote;
+	int ret;
+
+	entity = link->sink->entity;
+	remote = link->source;
+
+	subdev = media_entity_to_v4l2_subdev(remote->entity);
+	fmt.pad = remote->index;
+	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
+	if (ret < 0)
+		return ret == -ENOIOCTLCMD ? -EINVAL : ret;
+
+	if (!rzg2l_cru_ip_code_to_fmt(fmt.format.code))
+		return -EPIPE;
+
+	switch (fmt.format.field) {
+	case V4L2_FIELD_TOP:
+	case V4L2_FIELD_BOTTOM:
+	case V4L2_FIELD_NONE:
+	case V4L2_FIELD_INTERLACED_TB:
+	case V4L2_FIELD_INTERLACED_BT:
+	case V4L2_FIELD_INTERLACED:
+	case V4L2_FIELD_SEQ_TB:
+	case V4L2_FIELD_SEQ_BT:
+		break;
+	default:
+		return -EPIPE;
+	}
+
+	cru = container_of(media_entity_to_video_device(entity),
+			   struct rzg2l_cru_dev, vdev);
+	if (fmt.format.width != cru->format.width ||
+	    fmt.format.height != cru->format.height)
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
@@ -1006,6 +1016,7 @@ static void rzg2l_cru_v4l2_init(struct rzg2l_cru_dev *cru)
 	vdev->lock = &cru->lock;
 	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
 	vdev->device_caps |= V4L2_CAP_IO_MC;
+	vdev->entity.ops = &rzg2l_cru_video_media_ops;
 	vdev->fops = &rzg2l_cru_fops;
 	vdev->ioctl_ops = &rzg2l_cru_ioctl_ops;
 
-- 
2.43.0


