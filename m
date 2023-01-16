Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A29CF66C588
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 17:07:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232359AbjAPQHM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 11:07:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232353AbjAPQG2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 11:06:28 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24A7225E2C
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 08:04:56 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 88689802;
        Mon, 16 Jan 2023 17:04:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673885094;
        bh=HKbT8h83LKWlkveH1vWFe66Mqg7GinvdzTFxVVoaDxg=;
        h=From:To:Cc:Subject:Date:From;
        b=gCGk00y+tj01e2laFYkXkfxv1YmJFj9azPIjqptqJ4z/2KkFkFANj7dQ4dtdSynhY
         ydtx737dqMKY1JnPnMRQBmXphPn+rU7xQiEM+phYCj1Po5y9NhUuZ5rRF+xoxVQQwT
         IbkUSTJnvtnGXmR/bmgvDXwJSGXtfCIoWQN9qSZQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Giuliano Lotta <giuliano.lotta@gmail.com>,
        Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2] media: uvcvideo: Work around too little video controls size
Date:   Mon, 16 Jan 2023 18:04:55 +0200
Message-Id: <20230116160455.27723-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.38.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The size of the video probe & commit controls depends on the UVC
protocol version. Some devices, namely the Quanta ACER HD User Facing
(0408:4033 and 0408:4035), claim to support the UVC 1.5 protocol, but
return only 26 bytes of data when queried with GET_CUR for those
controls. This causes probing of the device to fail.

Work around this non-compliance by lowering the size of the control when
the device returns less data than expected, but still a valid size for
one of the existing UVC versions. The size is cached and used for
subsequent queries of the probe and commit controls.

Reported-by: Giuliano Lotta <giuliano.lotta@gmail.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_video.c | 48 +++++++++++++++++++------------
 drivers/media/usb/uvc/uvcvideo.h  |  1 +
 include/uapi/linux/usb/video.h    |  4 +++
 3 files changed, 35 insertions(+), 18 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 9634596f3dc7..23f3179a013f 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -272,24 +272,10 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
 	}
 }
 
-static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
-{
-	/*
-	 * Return the size of the video probe and commit controls, which depends
-	 * on the protocol version.
-	 */
-	if (stream->dev->uvc_version < 0x0110)
-		return 26;
-	else if (stream->dev->uvc_version < 0x0150)
-		return 34;
-	else
-		return 48;
-}
-
 static int uvc_get_video_ctrl(struct uvc_streaming *stream,
 	struct uvc_streaming_control *ctrl, int probe, u8 query)
 {
-	u16 size = uvc_video_ctrl_size(stream);
+	u16 size = stream->ctrl_size;
 	u8 *data;
 	int ret;
 
@@ -329,6 +315,20 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
 			"Enabling workaround.\n");
 		ret = -EIO;
 		goto out;
+	} else if (ret < size &&
+		   (ret == UVC_STREAMING_CONTROL_SIZE_V1_0 ||
+		    ret == UVC_STREAMING_CONTROL_SIZE_V1_1)) {
+		/*
+		 * Some Quanta cameras (for instance 0408:4033 and 0408:4035)
+		 * advertise UVC 1.5 compliance but only returns 26 bytes of
+		 * data for the video probe and commit controls.
+		 */
+		dev_warn(&stream->intf->dev,
+			 "UVC non compliance: video control size %u < %u as required by UVC v%u.%02x. Enabling workaround.\n",
+			 ret, size, stream->dev->uvc_version >> 8,
+			 stream->dev->uvc_version & 0xff);
+		stream->ctrl_size = ret;
+		size = ret;
 	} else if (ret != size) {
 		dev_err(&stream->intf->dev,
 			"Failed to query (%u) UVC %s control : %d (exp. %u).\n",
@@ -349,7 +349,7 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
 	ctrl->dwMaxVideoFrameSize = get_unaligned_le32(&data[18]);
 	ctrl->dwMaxPayloadTransferSize = get_unaligned_le32(&data[22]);
 
-	if (size >= 34) {
+	if (size >= UVC_STREAMING_CONTROL_SIZE_V1_1) {
 		ctrl->dwClockFrequency = get_unaligned_le32(&data[26]);
 		ctrl->bmFramingInfo = data[30];
 		ctrl->bPreferedVersion = data[31];
@@ -379,7 +379,7 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
 static int uvc_set_video_ctrl(struct uvc_streaming *stream,
 	struct uvc_streaming_control *ctrl, int probe)
 {
-	u16 size = uvc_video_ctrl_size(stream);
+	u16 size = stream->ctrl_size;
 	u8 *data;
 	int ret;
 
@@ -399,7 +399,7 @@ static int uvc_set_video_ctrl(struct uvc_streaming *stream,
 	put_unaligned_le32(ctrl->dwMaxVideoFrameSize, &data[18]);
 	put_unaligned_le32(ctrl->dwMaxPayloadTransferSize, &data[22]);
 
-	if (size >= 34) {
+	if (size >= UVC_STREAMING_CONTROL_SIZE_V1_1) {
 		put_unaligned_le32(ctrl->dwClockFrequency, &data[26]);
 		data[30] = ctrl->bmFramingInfo;
 		data[31] = ctrl->bPreferedVersion;
@@ -2148,6 +2148,18 @@ int uvc_video_init(struct uvc_streaming *stream)
 
 	atomic_set(&stream->active, 0);
 
+	/*
+	 * Set the probe & commit control size based on the UVC protocol
+	 * version. It may be overridden by uvc_get_video_ctrl() for devices
+	 * that don't comply with the UVC version they report.
+	 */
+	if (stream->dev->uvc_version < 0x0110)
+		stream->ctrl_size = UVC_STREAMING_CONTROL_SIZE_V1_0;
+	else if (stream->dev->uvc_version < 0x0150)
+		stream->ctrl_size = UVC_STREAMING_CONTROL_SIZE_V1_1;
+	else
+		stream->ctrl_size = UVC_STREAMING_CONTROL_SIZE_V1_5;
+
 	/*
 	 * Alternate setting 0 should be the default, yet the XBox Live Vision
 	 * Cam (and possibly other devices) crash or otherwise misbehave if
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 72189249719e..151d8d27cbbc 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -441,6 +441,7 @@ struct uvc_streaming {
 	struct uvc_format *format;
 
 	struct uvc_streaming_control ctrl;
+	unsigned int ctrl_size;
 	struct uvc_format *def_format;
 	struct uvc_format *cur_format;
 	struct uvc_frame *cur_frame;
diff --git a/include/uapi/linux/usb/video.h b/include/uapi/linux/usb/video.h
index 6e8e572c2980..7cb7713db757 100644
--- a/include/uapi/linux/usb/video.h
+++ b/include/uapi/linux/usb/video.h
@@ -454,6 +454,10 @@ struct uvc_streaming_control {
 	__u8  bMaxVersion;
 } __attribute__((__packed__));
 
+#define UVC_STREAMING_CONTROL_SIZE_V1_0			26
+#define UVC_STREAMING_CONTROL_SIZE_V1_1			34
+#define UVC_STREAMING_CONTROL_SIZE_V1_5			48
+
 /* Uncompressed Payload - 3.1.1. Uncompressed Video Format Descriptor */
 struct uvc_format_uncompressed {
 	__u8  bLength;
-- 
Regards,

Laurent Pinchart

