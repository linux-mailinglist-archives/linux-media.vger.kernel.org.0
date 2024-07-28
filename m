Return-Path: <linux-media+bounces-15393-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AD40993E6F1
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2024 17:59:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07FA4B224B8
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2024 15:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD8A12D1E0;
	Sun, 28 Jul 2024 15:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f0CH2UDV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D760A145FFB;
	Sun, 28 Jul 2024 15:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722181734; cv=none; b=PFfCqCHXeVB3rW9up1hyv99cooKLIYg8bjNONakUcYEH6vtfx0dq3pqd1kgyRmKFnRMvLzpH35lJeKQAj4Ilp0Le/ni10el9RUiTqoEQXOynI7ukjtKLog/3CnmMI3kYwYLpHFQdqn1zz1Ti5QAF+IGc83zi9BSeBOnVMlr1+1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722181734; c=relaxed/simple;
	bh=kYmg426gODI6nFvpiznX6CDHgWc24P16qpgwJ0AN9c8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nEPQqM2lxfRP1u7h76nfekWRECO9EqwCxadVbanMktzN/fkvQgl7eps9Hq1Q+PgSSvHjZeKjtlQGbJLNEnduRUV1omkPfTT6t3evP/IiZj+ycn5i+SQN17W+1+ecfellU8v4V35VR8SrhkGEL6pF32ixZGvtqL9eL58vkhmAJ1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f0CH2UDV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B0EC4AF0A;
	Sun, 28 Jul 2024 15:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722181734;
	bh=kYmg426gODI6nFvpiznX6CDHgWc24P16qpgwJ0AN9c8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f0CH2UDVwthUgrZnilp4Rie0SCYI1xhWQGlID2eTzrCztuOe5iC2K7yRcGPbio3zP
	 5Bn1JI2lyft8F4zThmSsE2/zDBis/dIrDdv1bPJUpWq/xxquvuupB0i7Pa9xZ6MDld
	 W7y0AD/S+/HNU5TCGcuty3Wre7RkpPR85GrxA3lo7POcMPjSSH+JTaHK0IrwVb5Drj
	 8Qh+qsZvumDX+7JkpxZ12WdbUz7RlfeuN3+5R4VIMvWFZyq2vHdp+8FOMCp9FnuEkL
	 0j3/uwyWbtKirev6zXvgBwRLoSAa+F9D3Zj1I1sSQBl2op/+iHmp8UOtEYsrPzAVut
	 lBeSohSLHSr0w==
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
Subject: [PATCH AUTOSEL 6.1 10/17] media: uvcvideo: Ignore empty TS packets
Date: Sun, 28 Jul 2024 11:47:20 -0400
Message-ID: <20240728154805.2049226-10-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728154805.2049226-1-sashal@kernel.org>
References: <20240728154805.2049226-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.102
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
index 0d3a3b697b2d8..011e09d5e426a 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -476,6 +476,7 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
 	ktime_t time;
 	u16 host_sof;
 	u16 dev_sof;
+	u32 dev_stc;
 
 	switch (data[1] & (UVC_STREAM_PTS | UVC_STREAM_SCR)) {
 	case UVC_STREAM_PTS | UVC_STREAM_SCR:
@@ -522,6 +523,34 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
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
@@ -560,7 +589,7 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
 	spin_lock_irqsave(&stream->clock.lock, flags);
 
 	sample = &stream->clock.samples[stream->clock.head];
-	sample->dev_stc = get_unaligned_le32(&data[header_size - 6]);
+	sample->dev_stc = dev_stc;
 	sample->dev_sof = dev_sof;
 	sample->host_sof = host_sof;
 	sample->host_time = time;
-- 
2.43.0


