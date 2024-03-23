Return-Path: <linux-media+bounces-7672-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2270887818
	for <lists+linux-media@lfdr.de>; Sat, 23 Mar 2024 11:48:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8DF3282597
	for <lists+linux-media@lfdr.de>; Sat, 23 Mar 2024 10:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C90B1B7FC;
	Sat, 23 Mar 2024 10:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FBrSYmsP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA78810A1E
	for <linux-media@vger.kernel.org>; Sat, 23 Mar 2024 10:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711190888; cv=none; b=JLM3RHRbdhDaPlw6sUO6rHdJlySi/t83Vrip6CETQY0aQQjgz+jjzpqUTPApBpYECth/4FG4bFjBStdFaOjBVbLWmaaDIBzYxPbqTa30362BhKV7FP9BrMaotsLmDaipQSCv6mmwdmf85LW0uuXlfjzI1ZUmMba+LPxG6kFnFzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711190888; c=relaxed/simple;
	bh=jUhzlNFhX6VLg2eJT4mZMHsU4vH2Y2Iy4BIiWHu1avE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dq47ntkaLI3buRj68fXyqcDM0l6wFGn0RjFIw3D1y11EdvWPh3YJfgizR+AmwMPzeaBD+BE4i6sY/gSi2BS4b+9EZRHk+oHUPc+omBNM6FKMXSvUohmJhjeG4b0sCLjXIKIYs1jDrpsZfAWGKcpNCA8Tk2TisJMLlP/c9yiLXys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FBrSYmsP; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5a46ebc0f49so1228645eaf.0
        for <linux-media@vger.kernel.org>; Sat, 23 Mar 2024 03:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711190886; x=1711795686; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wd3E1TwsBVxXxjO5X+TlbHTEyF4pOTTTZIUznbdkT5Y=;
        b=FBrSYmsPKFmEaUMdwoAn1zPjuQNmCyG6FmDCXnT4tSOClufmPX622Si3+vVq5vI/P6
         pFR9nHw5IqwLxmYMolOqFDfIlc5Kwq6WS5hr4nHMWJJbZuVJnCsmOQPWRo31Z/Lkz+yt
         0qawcX4I8AoIzJSz5BSOsdHX8SiypvJPBhGA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711190886; x=1711795686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wd3E1TwsBVxXxjO5X+TlbHTEyF4pOTTTZIUznbdkT5Y=;
        b=UcrVOPAr83ZPApoUix54UHvprbrH0IZmRVLwdJjMId/INrCwQDU7nP6lFjQfATUV77
         WAS/Gg1rOQ68/vvb5kxBYija1P0VsyO8YxBv24wAI/GTKYV9WbCf2hJu4JO9JYUb1jQN
         PCGz0dJ0UxRzlmCL2O0zneGQKFq/JyEttmGgwXncX8m9Bo0rezD1TMNYe+pBYeUg2N1V
         XZ6KZvsVEKPwfdsrQF1AOxW2UqMNrzAeOmKQn28NJTy9uQ+N+y5fM04V8aUhkBXzpuoZ
         EQXl7nOhCTjw3tkAZbwGq3OsjWEx1YWTHrdHYRw1hBmk2N1slm7g6K7RitWjwezUgeTq
         F2vQ==
X-Gm-Message-State: AOJu0Yy96Nr1COQRIagxAYkC4Fpbe8wnJ3PlHfPSMdjKBD7myCNo7aIy
	cnnyHzSkHnYZ7vq0f5/OnSlPdO4C1kFEbf2+aAenu/IEi49mtI2hygczIwm3eA==
X-Google-Smtp-Source: AGHT+IE/o2hvXUPG4jOgt3kiOW9zRFWN2whssbAEDbSI3G8HYZA+X6Qli1YQ4VNC2miKtLECj4BvyQ==
X-Received: by 2002:a05:6820:2714:b0:5a5:2105:f209 with SMTP id db20-20020a056820271400b005a52105f209mr2317138oob.6.1711190885837;
        Sat, 23 Mar 2024 03:48:05 -0700 (PDT)
Received: from denia.c.googlers.com (188.173.86.34.bc.googleusercontent.com. [34.86.173.188])
        by smtp.gmail.com with ESMTPSA id gd14-20020a05622a5c0e00b0042f21fe66f7sm697213qtb.73.2024.03.23.03.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 03:48:05 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sat, 23 Mar 2024 10:48:03 +0000
Subject: [PATCH v10 2/6] media: uvcvideo: Ignore empty TS packets
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240323-resend-hwtimestamp-v10-2-b08e590d97c7@chromium.org>
References: <20240323-resend-hwtimestamp-v10-0-b08e590d97c7@chromium.org>
In-Reply-To: <20240323-resend-hwtimestamp-v10-0-b08e590d97c7@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "hn.chen" <hn.chen@sunplusit.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
X-Mailer: b4 0.12.4

Some SunplusIT cameras took a borderline interpretation of the UVC 1.5
standard, and fill the PTS and SCR fields with invalid data if the
package does not contain data.

"STC must be captured when the first video data of a video frame is put
on the USB bus."

Some SunplusIT devices send, e.g.,

buffer: 0xa7755c00 len 000012 header:0x8c stc 00000000 sof 0000 pts 00000000
buffer: 0xa7755c00 len 000012 header:0x8c stc 00000000 sof 0000 pts 00000000
buffer: 0xa7755c00 len 000668 header:0x8c stc 73779dba sof 070c pts 7376d37a

While the UVC specification meant that the first two packets shouldn't
have had the SCR bit set in the header.

This borderline/buggy interpretation has been implemented in a variety
of devices, from directly SunplusIT and from other OEMs that rebrand
SunplusIT products. So quirking based on VID:PID will be problematic.

All the affected modules have the following extension unit:
VideoControl Interface Descriptor:
  guidExtensionCode         {82066163-7050-ab49-b8cc-b3855e8d221d}

But the vendor plans to use that GUID in the future and fix the bug,
this means that we should use heuristic to figure out the broken
packets.

This patch takes care of this.

lsusb of one of the affected cameras:

Bus 001 Device 003: ID 1bcf:2a01 Sunplus Innovation Technology Inc.
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.01
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 ?
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x1bcf Sunplus Innovation Technology Inc.
  idProduct          0x2a01
  bcdDevice            0.02
  iManufacturer           1 SunplusIT Inc
  iProduct                2 HanChen Wise Camera
  iSerial                 3 01.00.00
  bNumConfigurations      1

Tested-by: HungNien Chen <hn.chen@sunplusit.com>
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 659c9e9880a99..b2e70fcf4eb4c 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -478,6 +478,7 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
 	ktime_t time;
 	u16 host_sof;
 	u16 dev_sof;
+	u32 dev_stc;
 
 	switch (data[1] & (UVC_STREAM_PTS | UVC_STREAM_SCR)) {
 	case UVC_STREAM_PTS | UVC_STREAM_SCR:
@@ -526,6 +527,34 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
 	if (dev_sof == stream->clock.last_sof)
 		return;
 
+	dev_stc = get_unaligned_le32(&data[header_size - 6]);
+
+	/*
+	 * STC (Source Time Clock) is the clock used by the camera. The UVC 1.5
+	 * standard states that it "must be captured when the first video data
+	 * of a video frame is put on the USB bus". This is generally understood
+	 * as requiring devices to clear the payload header's SCR bit before
+	 * the first packet containing video data.
+	 *
+	 * Most vendors follow that interpretation, but some (namely SunplusIT
+	 * on some devices) always set the `UVC_STREAM_SCR` bit, fill the SCR
+	 * field with 0's,and expect that the driver only processes the SCR if
+	 * there is data in the packet.
+	 *
+	 * Ignore all the hardware timestamp information if we haven't received
+	 * any data for this frame yet, the packet contains no data, and both
+	 * STC and SOF are zero. This heuristics should be safe on compliant
+	 * devices. This should be safe with compliant devices, as in the very
+	 * unlikely case where a UVC 1.1 device would send timing information
+	 * only before the first packet containing data, and both STC and SOF
+	 * happen to be zero for a particular frame, we would only miss one
+	 * clock sample from many and the clock recovery algorithm wouldn't
+	 * suffer from this condition.
+	 */
+	if (buf && buf->bytesused == 0 && len == header_size &&
+	    dev_stc == 0 && dev_sof == 0)
+		return;
+
 	stream->clock.last_sof = dev_sof;
 
 	host_sof = usb_get_current_frame_number(stream->dev->udev);
@@ -564,7 +593,7 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
 	spin_lock_irqsave(&stream->clock.lock, flags);
 
 	sample = &stream->clock.samples[stream->clock.head];
-	sample->dev_stc = get_unaligned_le32(&data[header_size - 6]);
+	sample->dev_stc = dev_stc;
 	sample->dev_sof = dev_sof;
 	sample->host_sof = host_sof;
 	sample->host_time = time;

-- 
2.44.0.396.g6e790dbe36-goog


