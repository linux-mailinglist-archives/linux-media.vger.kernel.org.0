Return-Path: <linux-media+bounces-24293-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 936C8A02786
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 15:09:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CD323A266F
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 14:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 452301DE4E3;
	Mon,  6 Jan 2025 14:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QiOSww2A"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21A11DE3C5
	for <linux-media@vger.kernel.org>; Mon,  6 Jan 2025 14:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736172579; cv=none; b=kQm32PZ58MxrTKpLmigPiKzikcDuKbZI2zouUi0AJsSyQbriXOQgjgrgtenHrFIkclrjCEdWwcxcUvQH+nZ8VF8SmU4xCajQ+8WHq69LMXLvSHS7MxJI8YYPjEBu2JkgxB8hQPAaEY4B3FyLipou17oRAqjRJu84DNhlv6Vxe5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736172579; c=relaxed/simple;
	bh=fGHXcZAIxawVbLAo6xhV2GQp+m5XRDs6kgugSQHqVIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ggWxhZ/0f9YH07c+mxHglBQhSQuBNteYUM3ZBOyqf9ozQj18KRaeNDm8XJlx4TiQ0FXtE875xTwYNXT029ipPz224VQI94jsmoCD4RUFVbonpeVRyMI02UoO6Z2FGKw33i5egAGLfXqHMaM4RhQ4/xUX2KNSlr8LdVbxQpi5dgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QiOSww2A; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736172576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k0owrHo3f4IoG4UhPzCHnvLANHWZDr3qZW5XaxLRUWg=;
	b=QiOSww2AnYT/VsbHVss9oaCR/P0p9qvB86s+BJo/WemFwpiN/gL0cd/03BNjNjogWEpvt5
	BPuvp8AYrhFjAAnCMnW67QD15xkeMi2vyDd0eNkkWtZhDC66B3vRiX65lSkMmdboBK5Pjt
	e9wYlU7IzCOoFrW/2WDvmEl91GT6Cd8=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-526-AQRBAEZRNW-4oogVefA1Qw-1; Mon,
 06 Jan 2025 09:09:33 -0500
X-MC-Unique: AQRBAEZRNW-4oogVefA1Qw-1
X-Mimecast-MFC-AGG-ID: AQRBAEZRNW-4oogVefA1Qw
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 50B011956070;
	Mon,  6 Jan 2025 14:09:32 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.104])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 27C0319560A2;
	Mon,  6 Jan 2025 14:09:29 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v2 2/2] media: uvc: limit max bandwidth for HDMI capture
Date: Mon,  6 Jan 2025 15:09:23 +0100
Message-ID: <20250106140923.56896-3-hdegoede@redhat.com>
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

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

This device:
        534d:2109 MacroSilicon

Announces that it supports several frame intervals for
their resolutions for MJPEG compression:

        VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                   768000
        dwMaxBitRate                196608000
        dwMaxVideoFrameBufferSize     4147200
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  5
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            400000
        dwFrameInterval( 3)            500000
        dwFrameInterval( 4)           1000000

However, the highest frame interval (166666), which means 60 fps
is not supported. If set to it, URB packages will be dropped,
causing JPEG decoding errors and part of the video frames will
be missed.

Also, as specified at the device's documentation, for such
resolution, the maximum interval is 30 fps (interval == 333333).

The last format that supports such frame interval is 1280x720.

Add a quirk to estimate a raw bandwidth, by doing:
        width * height * framerate
E. g.:
        1920 * 1080 * 30 = 62208000

if the bandwidth is greater than such threshold, get
the next value from the dwFrameInterval.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Link: https://lore.kernel.org/r/bca0634691cea503c2c5df62b98ba66f0c85bf85.1624350539.git.mchehab+huawei@kernel.org
[hdegoede@redhat.com add "pixels per second" comment, use UVC_FIVAL_DENOM]
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 14 ++++++++++++++
 drivers/media/usb/uvc/uvc_video.c  | 29 ++++++++++++++++++++++++++---
 drivers/media/usb/uvc/uvcvideo.h   |  1 +
 3 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index f754640fddf5..6d001d4f0902 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2491,6 +2491,11 @@ static const struct uvc_device_info uvc_quirk_fix_bandwidth = {
 	.quirks = UVC_QUIRK_FIX_BANDWIDTH,
 };
 
+static const struct uvc_device_info uvc_quirk_fix_bw_622 = {
+	.quirks = UVC_QUIRK_FIX_BANDWIDTH,
+	.max_bandwidth = 62208000,
+};
+
 static const struct uvc_device_info uvc_quirk_probe_def = {
 	.quirks = UVC_QUIRK_PROBE_DEF,
 };
@@ -2794,6 +2799,15 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_fix_bandwidth },
+	/* MacroSilicon HDMI capture */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x534d,
+	  .idProduct		= 0x2109,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= (kernel_ulong_t)&uvc_quirk_fix_bw_622 },
 	/* Genesys Logic USB 2.0 PC Camera */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 41cb1b45fa23..af5233ab667e 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -225,9 +225,32 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
 	if ((ctrl->dwMaxPayloadTransferSize & 0xffff0000) == 0xffff0000)
 		ctrl->dwMaxPayloadTransferSize &= ~0xffff0000;
 
-	if (!(format->flags & UVC_FMT_FLAG_COMPRESSED) &&
-	    stream->dev->quirks & UVC_QUIRK_FIX_BANDWIDTH &&
-	    stream->intf->num_altsetting > 1) {
+	if (!(stream->dev->quirks & UVC_QUIRK_FIX_BANDWIDTH))
+		return;
+
+	/* Handle UVC_QUIRK_FIX_BANDWIDTH */
+
+	if (format->flags & UVC_FMT_FLAG_COMPRESSED) {
+		u32 bandwidth;
+
+		if (!stream->dev->info->max_bandwidth || !frame->bFrameIntervalType)
+			return;
+
+		for (i = 0; i < frame->bFrameIntervalType; ++i) {
+			bandwidth = frame->wWidth * frame->wHeight;
+			bandwidth *= UVC_FIVAL_DENOM / frame->dwFrameInterval[i];
+
+			if (bandwidth <= stream->dev->info->max_bandwidth)
+				break;
+		}
+
+		if (ctrl->dwFrameInterval < frame->dwFrameInterval[i])
+			ctrl->dwFrameInterval = frame->dwFrameInterval[i];
+
+		return;
+	}
+
+	if (stream->intf->num_altsetting > 1) {
 		u32 interval;
 		u32 bandwidth;
 
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 966ff82c2ba8..6b702219173f 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -535,6 +535,7 @@ static inline u32 uvc_urb_index(const struct uvc_urb *uvc_urb)
 
 struct uvc_device_info {
 	u32	quirks;
+	u32	max_bandwidth; /* In pixels per second */
 	u32	meta_format;
 	u16	uvc_version;
 };
-- 
2.47.1


