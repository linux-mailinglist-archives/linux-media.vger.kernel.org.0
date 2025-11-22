Return-Path: <linux-media+bounces-47607-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA0AC7C965
	for <lists+linux-media@lfdr.de>; Sat, 22 Nov 2025 08:26:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D4E434E32C8
	for <lists+linux-media@lfdr.de>; Sat, 22 Nov 2025 07:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD9472F28EC;
	Sat, 22 Nov 2025 07:26:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D71A1DF755;
	Sat, 22 Nov 2025 07:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763796390; cv=none; b=Mz4IqgHkBu9vMKEFYQve7Pn/DFv8W5Dlp6jR4m5QiOROhk2iVTJc7xhWlEW7yihS5X3x2cML6OCs5x1aNHO978PddD0572OwZrb1PffBWEjKBnbOm5u97KScELmlgUzuwcd6FBmOf2d6VDDB3yKx9Xtga60a1TI1UnUn1XTjb3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763796390; c=relaxed/simple;
	bh=eoQPxV0bqpB6nxGpd8YPMIDxctKmS3pjBtnDyzgxaFw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ALqOqh450gErUpUJHi6RFH5ojtvUXJJmajFmNDBsP2eho1jg3HHdJreHxBFYSlYpVk3RJA+mAciatZxS8nSx0s3OZDHDQXQ+4akP6wPwQYk2RJKAh5AqV/9laKZEO1VmCI0yuX48UnvWCe2OavMUB/GjIz3CqOfk/+Ad3wfRizQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 86b67f56c77411f0a38c85956e01ac42-20251122
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:daaaa0b1-d8fb-4641-a5f4-12eec753ac8f,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:93fe3913ca7f5a8ae7e63d78a71e3828,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|50,EDM:-
	3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 86b67f56c77411f0a38c85956e01ac42-20251122
X-User: dengjie03@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <dengjie03@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1089239997; Sat, 22 Nov 2025 15:26:13 +0800
From: Jie Deng <dengjie03@kylinos.cn>
To: laurent.pinchart@ideasonboard.com
Cc: hansg@kernel.org,
	mchehab@kernel.org,
	kieran.bingham@ideasonboard.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jie Deng <dengjie03@kylinos.cn>
Subject: [PATCH v2] media: usb: uvc: Fix NULL pointer dereference during USB device hot-unplug
Date: Sat, 22 Nov 2025 15:25:58 +0800
Message-Id: <20251122072558.2604753-1-dengjie03@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add safety checks to prevent kernel panic during the race window in
USB device disconnection.

The issue occurs in a specific timing window during hot-unplug:
- usb_disconnect() calls usb_disable_device() which sets
  dev->actconfig->interface[i] to NULL
- But dev->actconfig is not yet set to NULL
- During this window, uvc_video_stop_streaming() calls usb_set_interface()
- This eventually calls usb_ifnum_to_if() which accesses the already
  NULL interface[i]->altsetting, causing a kernel panic
logs:
[ 9518.891254] Call trace:
[ 9518.894817]  usb_ifnum_to_if+0x34/0x50
[ 9518.899681]  usb_set_interface+0x108/0x3c8
[ 9518.904898]  uvc_video_stop_streaming+0x3c/0x90 [uvcvideo]
[ 9518.911500]  uvc_stop_streaming+0x24/0x90 [uvcvideo]
[ 9518.917583]  __vb2_queue_cancel+0x44/0x458 [videobuf2_common]
[ 9518.924444]  vb2_core_streamoff+0x20/0xb8 [videobuf2_common]
[ 9518.931221]  vb2_streamoff+0x18/0x60 [videobuf2_v4l2]
[ 9518.937390]  uvc_queue_streamoff+0x30/0x50 [uvcvideo]
[ 9518.943557]  uvc_ioctl_streamoff+0x40/0x68 [uvcvideo]
[ 9518.949724]  v4l_streamoff+0x20/0x28
[ 9518.954415]  __video_do_ioctl+0x17c/0x3e0
[ 9518.959540]  video_usercopy+0x1d8/0x558
[ 9518.964490]  video_ioctl2+0x14/0x1c
[ 9518.969094]  v4l2_ioctl+0x3c/0x58
[ 9518.973526]  do_vfs_ioctl+0x374/0x7b0
[ 9518.978304]  ksys_ioctl+0x78/0xa8
[ 9518.982734]  sys_ioctl+0xc/0x18
[ 9518.986991]  __sys_trace_return+0x0/0x4
[ 9518.991943] Code: eb04005f 54000100 f9400040 91002042 (f9400003)
[ 9518.999153] ---[ end trace f7c7d3236806d9a4 ]---

The fix adds comprehensive NULL pointer validation:
- Check stream, stream->dev, stream->dev->udev, and stream->intf early
- Safely iterate through interfaces with proper NULL checks.
- Ensure config->interface[i] and its altsetting are valid before
  access.
This prevents the crash by ensuring we don't access partially freed
USB interface structures during device removal.

Fixes: 571e70dbd421 ("media: uvcvideo: Split uvc_video_enable into two")
Signed-off-by: Jie Deng <dengjie03@kylinos.cn>
---
v2:
	* Before the uvc driver calls usb_set_interface(), it first
	  checks whether the interface exists and is valid.
v1:
	* Add a null pointer check in the usb_ifnum_to_if() function.
	  This plan cannot eliminate the root cause.
	  Link：https://lore.kernel.org/all/20251113114411.1410343-1-dengjie03@kylinos.cn/
---
 drivers/media/usb/uvc/uvc_video.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 2094e059d7d3..30dd8ea8980e 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -2317,10 +2317,25 @@ int uvc_video_start_streaming(struct uvc_streaming *stream)
 
 void uvc_video_stop_streaming(struct uvc_streaming *stream)
 {
+	struct usb_host_config *config;
+	int i;
+
+	if (!stream || !stream->dev || !stream->dev->udev || !stream->intf)
+		goto cleanup_clock;
+
 	uvc_video_stop_transfer(stream, 1);
 
-	if (stream->intf->num_altsetting > 1) {
-		usb_set_interface(stream->dev->udev, stream->intfnum, 0);
+	config = stream->dev->udev->actconfig;
+	if (stream->intf->num_altsetting > 1 && config) {
+		/* Security Check: Check if the interface exists and is valid */
+		for (i = 0; i < config->desc.bNumInterfaces; i++) {
+			if (config->interface[i] &&
+			    config->interface[i]->altsetting[0]
+				.desc.bInterfaceNumber == stream->intfnum) {
+				usb_set_interface(stream->dev->udev, stream->intfnum, 0);
+				break;
+			}
+		}
 	} else {
 		/*
 		 * UVC doesn't specify how to inform a bulk-based device
@@ -2338,5 +2353,6 @@ void uvc_video_stop_streaming(struct uvc_streaming *stream)
 		usb_clear_halt(stream->dev->udev, pipe);
 	}
 
+cleanup_clock:
 	uvc_video_clock_cleanup(&stream->clock);
 }
-- 
2.25.1


