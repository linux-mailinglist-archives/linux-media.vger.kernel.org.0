Return-Path: <linux-media+bounces-24292-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBD9A02785
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 15:09:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17CD63A2854
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 14:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3177D1DE3A6;
	Mon,  6 Jan 2025 14:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J2HLmd+O"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C30762D0
	for <linux-media@vger.kernel.org>; Mon,  6 Jan 2025 14:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736172574; cv=none; b=hkkljV6EsJQ5OWM39VozuNIHxWpSvcKjEDzETlebqOqgRVx+2dbjY3/1vBYoNKQK2JnbNxHUYAweJfGsxCPjlDN/Wmst3QXunV8nNvgbQjpjXJ3NXmMPxEKvUcsaJCrsGCuvMWW7F2FlAvGQ0OdxvSXf1PjX1HfkRgICza1mUuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736172574; c=relaxed/simple;
	bh=jDUXMYY+QCvHnZciH58UjOS4vzZNUU6Xh6r4PvosQbA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cUb1uXSzxX1dQwoUzcAW12Jt16hPFg4B2hpZPPz1p9JUzoxo2B71JP6aHX0EG37Knw1jXPN+P3lqInxbOcKDsTdfN5THoKEpdz0z7VcnExMcBn5QvGRJ3bePqTBHjHiTptB2C81Mz/XqQoX/biBFDfncHmzHp4M3amZYCtzef8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J2HLmd+O; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736172572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DhT/k2RAFZFQRuwnlhzEYGYfeL6vhZZAxsEx/Jea/6k=;
	b=J2HLmd+OXR8S3VTFbifghKRoDSDljaUaaquyJk7Piv0D4H+dmqp2MdHhCCdqiYVdj+X3fY
	0OlCdIyy8VjDgnntfIk9JAjTeOYHkIjn3XbghkLO8eGki9JTR3GQUkQzr50759RHbsrhz+
	gl6xpvcoU81uJ0jUTnGDqRyPbvM+O9Q=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-63-yCnAQ4OZPiGASKq2TNNnBg-1; Mon,
 06 Jan 2025 09:09:30 -0500
X-MC-Unique: yCnAQ4OZPiGASKq2TNNnBg-1
X-Mimecast-MFC-AGG-ID: yCnAQ4OZPiGASKq2TNNnBg
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B38371956096;
	Mon,  6 Jan 2025 14:09:29 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.104])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 682F819560A2;
	Mon,  6 Jan 2025 14:09:27 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 1/2] media: uvcvideo: Add a UVC_FIVAL_DENOM define
Date: Mon,  6 Jan 2025 15:09:22 +0100
Message-ID: <20250106140923.56896-2-hdegoede@redhat.com>
In-Reply-To: <20250106140923.56896-1-hdegoede@redhat.com>
References: <20250106140923.56896-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Add a define for the UVC frame interval denominator of 10000000
instead of hardcoding 10000000 everywhere.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/usb/uvc/uvc_driver.c |  4 ++--
 drivers/media/usb/uvc/uvc_v4l2.c   | 16 ++++++++--------
 drivers/media/usb/uvc/uvc_video.c  |  4 ++--
 drivers/media/usb/uvc/uvcvideo.h   |  2 ++
 4 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index c3ccd9be0a47..f754640fddf5 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -320,8 +320,8 @@ static int uvc_parse_frame(struct uvc_device *dev,
 
 	uvc_dbg(dev, DESCR, "- %ux%u (%u.%u fps)\n",
 		frame->wWidth, frame->wHeight,
-		10000000 / frame->dwDefaultFrameInterval,
-		(100000000 / frame->dwDefaultFrameInterval) % 10);
+		UVC_FIVAL_DENOM / frame->dwDefaultFrameInterval,
+		((UVC_FIVAL_DENOM * 10) / frame->dwDefaultFrameInterval) % 10);
 
 	*intervals += n;
 
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 93c6cdb23881..301999e94759 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -282,8 +282,8 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
 	interval = frame->dwDefaultFrameInterval;
 	uvc_dbg(stream->dev, FORMAT,
 		"Using default frame interval %u.%u us (%u.%u fps)\n",
-		interval / 10, interval % 10, 10000000 / interval,
-		(100000000 / interval) % 10);
+		interval / 10, interval % 10, UVC_FIVAL_DENOM / interval,
+		((UVC_FIVAL_DENOM * 10) / interval) % 10);
 
 	/* Set the format index, frame index and frame interval. */
 	memset(probe, 0, sizeof(*probe));
@@ -450,7 +450,7 @@ static int uvc_ioctl_g_parm(struct file *file, void *fh,
 	numerator = stream->ctrl.dwFrameInterval;
 	mutex_unlock(&stream->mutex);
 
-	denominator = 10000000;
+	denominator = UVC_FIVAL_DENOM;
 	v4l2_simplify_fraction(&numerator, &denominator, 8, 333);
 
 	memset(parm, 0, sizeof(*parm));
@@ -551,7 +551,7 @@ static int uvc_ioctl_s_parm(struct file *file, void *fh,
 
 	/* Return the actual frame period. */
 	timeperframe.numerator = probe.dwFrameInterval;
-	timeperframe.denominator = 10000000;
+	timeperframe.denominator = UVC_FIVAL_DENOM;
 	v4l2_simplify_fraction(&timeperframe.numerator,
 		&timeperframe.denominator, 8, 333);
 
@@ -1240,17 +1240,17 @@ static int uvc_ioctl_enum_frameintervals(struct file *file, void *fh,
 		fival->type = V4L2_FRMIVAL_TYPE_DISCRETE;
 		fival->discrete.numerator =
 			frame->dwFrameInterval[index];
-		fival->discrete.denominator = 10000000;
+		fival->discrete.denominator = UVC_FIVAL_DENOM;
 		v4l2_simplify_fraction(&fival->discrete.numerator,
 			&fival->discrete.denominator, 8, 333);
 	} else {
 		fival->type = V4L2_FRMIVAL_TYPE_STEPWISE;
 		fival->stepwise.min.numerator = frame->dwFrameInterval[0];
-		fival->stepwise.min.denominator = 10000000;
+		fival->stepwise.min.denominator = UVC_FIVAL_DENOM;
 		fival->stepwise.max.numerator = frame->dwFrameInterval[1];
-		fival->stepwise.max.denominator = 10000000;
+		fival->stepwise.max.denominator = UVC_FIVAL_DENOM;
 		fival->stepwise.step.numerator = frame->dwFrameInterval[2];
-		fival->stepwise.step.denominator = 10000000;
+		fival->stepwise.step.denominator = UVC_FIVAL_DENOM;
 		v4l2_simplify_fraction(&fival->stepwise.min.numerator,
 			&fival->stepwise.min.denominator, 8, 333);
 		v4l2_simplify_fraction(&fival->stepwise.max.numerator,
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 7efed64b81a2..41cb1b45fa23 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -231,7 +231,7 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
 		u32 interval;
 		u32 bandwidth;
 
-		interval = (ctrl->dwFrameInterval > 100000)
+		interval = (ctrl->dwFrameInterval > (UVC_FIVAL_DENOM / 100))
 			 ? ctrl->dwFrameInterval
 			 : frame->dwFrameInterval[0];
 
@@ -243,7 +243,7 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
 		 * header size (assumed to be 12 bytes long).
 		 */
 		bandwidth = frame->wWidth * frame->wHeight / 8 * format->bpp;
-		bandwidth *= 10000000 / interval + 1;
+		bandwidth *= UVC_FIVAL_DENOM / interval + 1;
 		bandwidth /= 1000;
 		if (stream->dev->udev->speed >= USB_SPEED_HIGH)
 			bandwidth /= 8;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 3d196a696f46..966ff82c2ba8 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -41,6 +41,8 @@
 #define UVC_EXT_GPIO_UNIT		0x7ffe
 #define UVC_EXT_GPIO_UNIT_ID		0x100
 
+#define UVC_FIVAL_DENOM			10000000
+
 /* ------------------------------------------------------------------------
  * Driver specific constants.
  */
-- 
2.47.1


