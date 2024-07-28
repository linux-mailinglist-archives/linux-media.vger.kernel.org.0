Return-Path: <linux-media+bounces-15403-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1021593E759
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2024 18:08:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84DF81F2712A
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2024 16:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7976187329;
	Sun, 28 Jul 2024 15:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e5UWE2Vr"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A33958ABC;
	Sun, 28 Jul 2024 15:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722181867; cv=none; b=aZ+Ja7UPy9LTh1tn5RounxW2oyRR8mzQw7KPrKvpIUHUxfeyCLIrFKMU8bSI3Z7t/t9Bj3SMgmZ1dtaucFk1EnOBnL8kStsBaxeX2p8OnA11NIr7Np6IXbKA7WQmYzVCG1lqjGWnOaaIHKa28eWsNHpHroFIGBFYL+fo+5sh99w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722181867; c=relaxed/simple;
	bh=Ae3xKWdVfHk3/6oXJfEi5ivORaAmro0kagRHeGZ73Y4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AI9hi9RwI8Ia3CseTN9s7L71EwpNLP1sZ0o+vWQUZmRhQ1bBLX9lNScxCVnOTrsM+aJofXdv52PYXsCgW56JpUFDu6RG+Dr3GfEGxOXA2GCkn2MSZLzEj6w9C9AqwcNQ/tYnxNr+qHilkeX5nRK7CLPIyQGINN8zJcMC4NsqaU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e5UWE2Vr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 868A8C32782;
	Sun, 28 Jul 2024 15:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722181867;
	bh=Ae3xKWdVfHk3/6oXJfEi5ivORaAmro0kagRHeGZ73Y4=;
	h=From:To:Cc:Subject:Date:From;
	b=e5UWE2Vr/QPmnBAFGRohWVFNqFuX2E5NG02N28pdewbjZ8zYgtOr2fhi4qtGFjIMW
	 /qdcxlHZuTRh/mtGdAVqnjW+PV1RgYOkzbPwgpga3EjxHpKCtCLM2SpqTO4PqPSl5l
	 1w4r2EavL3SmoOAK87qPWZcx5faIv5Wrj79uM8M5ZVcW33qqd+B4+MLmklBPvDPyko
	 zZStR3DdscfOpoqXDYahHUwdRXYqb53gz4m3hqg/B54wnzL/iMJaFf+lotfrYvvpU7
	 eg7CsQOn+jKaHe4Vkf0Snwb2jLvCKNP/ufAuTwaXXMzEy1aVNlDWolnbscUT1aQe72
	 ysGSxTrCUMrGQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	HungNien Chen <hn.chen@sunplusit.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 1/5] media: uvcvideo: Ignore empty TS packets
Date: Sun, 28 Jul 2024 11:50:56 -0400
Message-ID: <20240728155103.2050728-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.319
Content-Transfer-Encoding: 8bit

From: Ricardo Ribalda <ribalda@chromium.org>

[ Upstream commit 5cd7c25f6f0576073b3d03bc4cfb1e8ca63a1195 ]

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
Reviewed-by: Tomasz Figa <tfiga@chromium.org>
Link: https://lore.kernel.org/r/20240323-resend-hwtimestamp-v10-2-b08e590d97c7@chromium.org
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/usb/uvc/uvc_video.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index c57bc62251bb8..e2c1b98fb4a25 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -473,6 +473,7 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
 	ktime_t time;
 	u16 host_sof;
 	u16 dev_sof;
+	u32 dev_stc;
 
 	switch (data[1] & (UVC_STREAM_PTS | UVC_STREAM_SCR)) {
 	case UVC_STREAM_PTS | UVC_STREAM_SCR:
@@ -517,6 +518,34 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
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
@@ -554,7 +583,7 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
 	spin_lock_irqsave(&stream->clock.lock, flags);
 
 	sample = &stream->clock.samples[stream->clock.head];
-	sample->dev_stc = get_unaligned_le32(&data[header_size - 6]);
+	sample->dev_stc = dev_stc;
 	sample->dev_sof = dev_sof;
 	sample->host_sof = host_sof;
 	sample->host_time = time;
-- 
2.43.0


