Return-Path: <linux-media+bounces-21069-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E33A9C08CA
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 15:22:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 322BB1C23677
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 14:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7767C212646;
	Thu,  7 Nov 2024 14:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="moBR2x4l"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD79212164
	for <linux-media@vger.kernel.org>; Thu,  7 Nov 2024 14:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730989343; cv=none; b=OgnRCg/U/OB4zWFrvCovffLYgntgwivKos7Uquo6DqrlOOzik5GQ8ltVF1ywy28ArnS3vK9t9cy+QU1Rn81/RykkYw/skAbQ7Ie/aWkbi4Bsv0lWhuYBL3j+UqqHrJER5KaPxiLifGi0Q0As43ytA0+GuOrAoXECr6VM9/dCIaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730989343; c=relaxed/simple;
	bh=T8IG7FW37hZJdv29xdQguceGrerJcujbZg6Eb2Miv/Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fw9l2Bn0slFsrheZYrCombOd66Wx6PzFfF9jHk+GQUP4HJL+na0punVtcR+LtB17r13y74SxxhwtHTrUQk8fHGY45NzM5n+VU9AT9OLSE4cGUZmsaOfKWX4Eorh8LnJ9eUplPm6emZyJdo3ZCpvJNfKugVh4Sw6b1rbQcmmmB6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--bsevens.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=moBR2x4l; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--bsevens.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-37d4854fa0eso506438f8f.2
        for <linux-media@vger.kernel.org>; Thu, 07 Nov 2024 06:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730989340; x=1731594140; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YwrygCa3j+Bl9zLCg0poJra/q/PHtl8Ix8tJq8Z0Q+Q=;
        b=moBR2x4lbBk/e95wWg6n5AoIyvWp/KNONt6ZmLmtgPuwuJpfPzgt9uj2OwtQ+mhnwH
         ffVLFXXaPjZDZts6gzUZuMk66deUDh72dF/vd6QhKl6PdVYAneAgA4NHBLYLUzUQticK
         O3vWnsBvusgnV2V42fROlYOYzJA5yc+e+i3bH1UM/0qSiH6/s5+uZ1yRU/E38o+DNUUm
         b4LvDgwDS/lC8vEscY94fhEOonucv9oghpyj3+QQP/TvUKUX/E0F/7f/Mh53ELhatYOV
         6hWS00+t1Y5nzDX1DeZAJP3EJI6mZG09Fsw1Vu5wnVjIVmC1K3QpoZdod9HTj5QOxC2V
         wddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730989340; x=1731594140;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YwrygCa3j+Bl9zLCg0poJra/q/PHtl8Ix8tJq8Z0Q+Q=;
        b=XQpnZeWwp9+PpmpsXhBMC+pcqKsQiP496np9+WWfMMoUSiWJiX4oHq0PonbAIJSPwD
         5+ELpmFlulBYidjxbYVQdfM4NpnQnAEbhYarEndPHxezaTjYtrHYeMwr5jctJQZi8gP/
         Sy5kBiXFdxIodRO8udh34A7O1hMMeJBmH25ETThZtnGPj1D2jBC5vMwRiFjMREk9jBpm
         wd92eLhNMvxi4W+2BVKzQ9d6rNtbY+Phe2BJqceJrbl3sk2KQhbdPaAdyBiPmySOU7d0
         bmnqO41bkyAT1a1L13fvfF9zHhKL+tg/ESgp4duTAXMkMV3nJvTT4C1v9MSSQIjjpuD3
         VFsw==
X-Gm-Message-State: AOJu0YyQsWTjn412WSZjP19HYZmDg/Y/TTQmPlytd4zB6lJr8IAdYItJ
	vfatH6lrYTb7dZivQYHX0SF7rrU1+CM/sItCaW/EqDdLiUWhVvWvBX/P2KE2TkF7GU6z1hqUKEn
	pcuokEw==
X-Google-Smtp-Source: AGHT+IH4bXLOWLkahQScpkYLVRnYYT56Pm6PwRjwa6ZcdgF1zITgVJxqbl1GFkNhy/0Mlxn3f9e1LOBeSMaG
X-Received: from bsevens.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:22a4])
 (user=bsevens job=sendgmr) by 2002:a5d:52d2:0:b0:37d:3705:84df with SMTP id
 ffacd0b85a97d-3806113df4bmr34008f8f.5.1730989340493; Thu, 07 Nov 2024
 06:22:20 -0800 (PST)
Date: Thu,  7 Nov 2024 14:22:03 +0000
In-Reply-To: <20241107142204.1182969-1-bsevens@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241107142204.1182969-1-bsevens@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241107142204.1182969-3-bsevens@google.com>
Subject: [PATCH v1 2/2] media: uvcvideo: Refactor frame parsing code into a
 uvc_parse_frame function
From: Benoit Sevens <bsevens@google.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, gregkh@linuxfoundation.org, 
	Benoit Sevens <bsevens@google.com>, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

The ftype value does not change in the while loop so we can check it
before entering the while loop. Refactoring the frame parsing code into
a dedicated uvc_parse_frame function makes this more readable.

Signed-off-by: Benoit Sevens <bsevens@google.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 228 ++++++++++++++++-------------
 1 file changed, 123 insertions(+), 105 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 13db0026dc1a..99f811ace5d6 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -220,6 +220,117 @@ static struct uvc_streaming *uvc_stream_new(struct uvc_device *dev,
  * Descriptors parsing
  */
 
+static int uvc_parse_frame(struct uvc_device *dev, struct uvc_streaming *streaming,
+		struct uvc_format *format, struct uvc_frame *frame, u32 **intervals,
+		u8 ftype, int width_multiplier, const unsigned char *buffer, int buflen)
+{
+	struct usb_interface *intf = streaming->intf;
+	struct usb_host_interface *alts = intf->cur_altsetting;
+	unsigned int i, n;
+	unsigned int interval;
+	unsigned int maxIntervalIndex;
+
+	if (ftype != UVC_VS_FRAME_FRAME_BASED)
+		n = buflen > 25 ? buffer[25] : 0;
+	else
+		n = buflen > 21 ? buffer[21] : 0;
+
+	n = n ? n : 3;
+
+	if (buflen < 26 + 4*n) {
+		uvc_dbg(dev, DESCR,
+			"device %d videostreaming interface %d FRAME error\n",
+			dev->udev->devnum,
+			alts->desc.bInterfaceNumber);
+		return -EINVAL;
+	}
+
+	frame->bFrameIndex = buffer[3];
+	frame->bmCapabilities = buffer[4];
+	frame->wWidth = get_unaligned_le16(&buffer[5])
+		      * width_multiplier;
+	frame->wHeight = get_unaligned_le16(&buffer[7]);
+	frame->dwMinBitRate = get_unaligned_le32(&buffer[9]);
+	frame->dwMaxBitRate = get_unaligned_le32(&buffer[13]);
+	if (ftype != UVC_VS_FRAME_FRAME_BASED) {
+		frame->dwMaxVideoFrameBufferSize =
+			get_unaligned_le32(&buffer[17]);
+		frame->dwDefaultFrameInterval =
+			get_unaligned_le32(&buffer[21]);
+		frame->bFrameIntervalType = buffer[25];
+	} else {
+		frame->dwMaxVideoFrameBufferSize = 0;
+		frame->dwDefaultFrameInterval =
+			get_unaligned_le32(&buffer[17]);
+		frame->bFrameIntervalType = buffer[21];
+	}
+
+	/*
+	 * Copy the frame intervals.
+	 *
+	 * Some bogus devices report dwMinFrameInterval equal to
+	 * dwMaxFrameInterval and have dwFrameIntervalStep set to
+	 * zero. Setting all null intervals to 1 fixes the problem and
+	 * some other divisions by zero that could happen.
+	 */
+	frame->dwFrameInterval = *intervals;
+
+	for (i = 0; i < n; ++i) {
+		interval = get_unaligned_le32(&buffer[26+4*i]);
+		(*intervals)[i] = interval ? interval : 1;
+	}
+
+	/*
+	 * Apply more fixes, quirks and workarounds to handle incorrect
+	 * or broken descriptors.
+	 */
+
+	/*
+	 * Several UVC chipsets screw up dwMaxVideoFrameBufferSize
+	 * completely. Observed behaviours range from setting the
+	 * value to 1.1x the actual frame size to hardwiring the
+	 * 16 low bits to 0. This results in a higher than necessary
+	 * memory usage as well as a wrong image size information. For
+	 * uncompressed formats this can be fixed by computing the
+	 * value from the frame size.
+	 */
+	if (!(format->flags & UVC_FMT_FLAG_COMPRESSED))
+		frame->dwMaxVideoFrameBufferSize = format->bpp
+			* frame->wWidth * frame->wHeight / 8;
+
+	/*
+	 * Clamp the default frame interval to the boundaries. A zero
+	 * bFrameIntervalType value indicates a continuous frame
+	 * interval range, with dwFrameInterval[0] storing the minimum
+	 * value and dwFrameInterval[1] storing the maximum value.
+	 */
+	maxIntervalIndex = frame->bFrameIntervalType ? n - 1 : 1;
+	frame->dwDefaultFrameInterval =
+		clamp(frame->dwDefaultFrameInterval,
+		      frame->dwFrameInterval[0],
+		      frame->dwFrameInterval[maxIntervalIndex]);
+
+	/*
+	 * Some devices report frame intervals that are not functional.
+	 * If the corresponding quirk is set, restrict operation to the
+	 * first interval only.
+	 */
+	if (dev->quirks & UVC_QUIRK_RESTRICT_FRAME_RATE) {
+		frame->bFrameIntervalType = 1;
+		(*intervals)[0] = frame->dwDefaultFrameInterval;
+	}
+
+	uvc_dbg(dev, DESCR, "- %ux%u (%u.%u fps)\n",
+		frame->wWidth, frame->wHeight,
+		10000000 / frame->dwDefaultFrameInterval,
+		(100000000 / frame->dwDefaultFrameInterval) % 10);
+
+	*intervals += n;
+
+	return buffer[0];
+}
+
+
 static int uvc_parse_format(struct uvc_device *dev,
 	struct uvc_streaming *streaming, struct uvc_format *format,
 	struct uvc_frame *frames, u32 **intervals, const unsigned char *buffer,
@@ -231,9 +342,9 @@ static int uvc_parse_format(struct uvc_device *dev,
 	struct uvc_frame *frame;
 	const unsigned char *start = buffer;
 	unsigned int width_multiplier = 1;
-	unsigned int interval;
 	unsigned int i, n;
 	u8 ftype;
+	int ret;
 
 	format->type = buffer[2];
 	format->index = buffer[3];
@@ -371,111 +482,18 @@ static int uvc_parse_format(struct uvc_device *dev,
 	 * Parse the frame descriptors. Only uncompressed, MJPEG and frame
 	 * based formats have frame descriptors.
 	 */
-	while (ftype && buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE &&
-	       buffer[2] == ftype) {
-		unsigned int maxIntervalIndex;
-
-		frame = &frames[format->nframes];
-		if (ftype != UVC_VS_FRAME_FRAME_BASED)
-			n = buflen > 25 ? buffer[25] : 0;
-		else
-			n = buflen > 21 ? buffer[21] : 0;
-
-		n = n ? n : 3;
-
-		if (buflen < 26 + 4*n) {
-			uvc_dbg(dev, DESCR,
-				"device %d videostreaming interface %d FRAME error\n",
-				dev->udev->devnum,
-				alts->desc.bInterfaceNumber);
-			return -EINVAL;
-		}
-
-		frame->bFrameIndex = buffer[3];
-		frame->bmCapabilities = buffer[4];
-		frame->wWidth = get_unaligned_le16(&buffer[5])
-			      * width_multiplier;
-		frame->wHeight = get_unaligned_le16(&buffer[7]);
-		frame->dwMinBitRate = get_unaligned_le32(&buffer[9]);
-		frame->dwMaxBitRate = get_unaligned_le32(&buffer[13]);
-		if (ftype != UVC_VS_FRAME_FRAME_BASED) {
-			frame->dwMaxVideoFrameBufferSize =
-				get_unaligned_le32(&buffer[17]);
-			frame->dwDefaultFrameInterval =
-				get_unaligned_le32(&buffer[21]);
-			frame->bFrameIntervalType = buffer[25];
-		} else {
-			frame->dwMaxVideoFrameBufferSize = 0;
-			frame->dwDefaultFrameInterval =
-				get_unaligned_le32(&buffer[17]);
-			frame->bFrameIntervalType = buffer[21];
-		}
-
-		/*
-		 * Copy the frame intervals.
-		 *
-		 * Some bogus devices report dwMinFrameInterval equal to
-		 * dwMaxFrameInterval and have dwFrameIntervalStep set to
-		 * zero. Setting all null intervals to 1 fixes the problem and
-		 * some other divisions by zero that could happen.
-		 */
-		frame->dwFrameInterval = *intervals;
-
-		for (i = 0; i < n; ++i) {
-			interval = get_unaligned_le32(&buffer[26+4*i]);
-			(*intervals)[i] = interval ? interval : 1;
-		}
-
-		/*
-		 * Apply more fixes, quirks and workarounds to handle incorrect
-		 * or broken descriptors.
-		 */
-
-		/*
-		 * Several UVC chipsets screw up dwMaxVideoFrameBufferSize
-		 * completely. Observed behaviours range from setting the
-		 * value to 1.1x the actual frame size to hardwiring the
-		 * 16 low bits to 0. This results in a higher than necessary
-		 * memory usage as well as a wrong image size information. For
-		 * uncompressed formats this can be fixed by computing the
-		 * value from the frame size.
-		 */
-		if (!(format->flags & UVC_FMT_FLAG_COMPRESSED))
-			frame->dwMaxVideoFrameBufferSize = format->bpp
-				* frame->wWidth * frame->wHeight / 8;
-
-		/*
-		 * Clamp the default frame interval to the boundaries. A zero
-		 * bFrameIntervalType value indicates a continuous frame
-		 * interval range, with dwFrameInterval[0] storing the minimum
-		 * value and dwFrameInterval[1] storing the maximum value.
-		 */
-		maxIntervalIndex = frame->bFrameIntervalType ? n - 1 : 1;
-		frame->dwDefaultFrameInterval =
-			clamp(frame->dwDefaultFrameInterval,
-			      frame->dwFrameInterval[0],
-			      frame->dwFrameInterval[maxIntervalIndex]);
-
-		/*
-		 * Some devices report frame intervals that are not functional.
-		 * If the corresponding quirk is set, restrict operation to the
-		 * first interval only.
-		 */
-		if (dev->quirks & UVC_QUIRK_RESTRICT_FRAME_RATE) {
-			frame->bFrameIntervalType = 1;
-			(*intervals)[0] = frame->dwDefaultFrameInterval;
+	if (ftype) {
+		while (buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE &&
+		       buffer[2] == ftype) {
+			frame = &frames[format->nframes];
+			ret = uvc_parse_frame(dev, streaming, format, frame, intervals, ftype,
+					width_multiplier, buffer, buflen);
+			if (ret < 0)
+				return ret;
+			format->nframes++;
+			buflen -= ret;
+			buffer += ret;
 		}
-
-		uvc_dbg(dev, DESCR, "- %ux%u (%u.%u fps)\n",
-			frame->wWidth, frame->wHeight,
-			10000000 / frame->dwDefaultFrameInterval,
-			(100000000 / frame->dwDefaultFrameInterval) % 10);
-
-		format->nframes++;
-		*intervals += n;
-
-		buflen -= buffer[0];
-		buffer += buffer[0];
 	}
 
 	if (buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE &&
-- 
2.47.0.277.g8800431eea-goog


