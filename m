Return-Path: <linux-media+bounces-19789-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B2B9A1E39
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 11:25:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D7E2B24DBA
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 09:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F66A1D89FE;
	Thu, 17 Oct 2024 09:25:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAACB1D6DB6
	for <linux-media@vger.kernel.org>; Thu, 17 Oct 2024 09:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729157110; cv=none; b=k6rDikP8XUREjSiFNwFEHikaeE0lbGEcF5jB4SxAJrsh3a+hrHZAuYc+QpIN1Qmwuo4Q4SUuBII/GaodMVpPW4dyMxF2ogN4LPzCmQF2LutihUTSQycvfO8PpIgFOLEQIwIfP8QEZCleHAfidoLOnUS2KJQYfnyoAf6HUYOvr44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729157110; c=relaxed/simple;
	bh=uDNIKAsVb/+2cA1V2M0xLYaK2BBi39+w5O2jxw2r+Qc=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=kSUFjv62dxCL+VAhwgiq1/pJnEreHhUTHpUzxenTnytw9pwK0I35m8TFj2LH18UP35XwuurjuToTQFMgKZyJnnaxf1MNVc1ZWGu5NE/HUpJhLH8YwIMfKbPyucgY5hfz1eNixINTCCdZkhEzxiTj0L52P4O1Go0AN1fYNSUAluQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C144DC4CEC3;
	Thu, 17 Oct 2024 09:25:09 +0000 (UTC)
Message-ID: <69d2363e-49bb-4c7f-9c91-6a22b0c6e9e3@xs4all.nl>
Date: Thu, 17 Oct 2024 11:25:08 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [RFC PATCH] media: uvc: ensure video device entities have a unique
 name
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The video device names (also used as entity names) are identical
for the video capture and metadata capture devices.

This series ensures that the video device names are unique.

It also fixes a bug where a metadata device would be created
for video output devices, but that's for video capture devices
only.

This fixes a compliance failure when running
'v4l2-compliance -M /dev/mediaX'.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
RFC for now.

Based on the code I assume one UVC device can have multiple
capture and/or output devices, so I added an instance index.

But I may be wrong about that.

I also assume that there is no metadata for UVC video outputs.

It might also be safer to drop the 'Cap0 ' prefix if inst == 0,
just in case someone relies on the name.
---
 drivers/media/usb/uvc/uvc_driver.c   | 34 +++++++++++++++++++---------
 drivers/media/usb/uvc/uvc_metadata.c |  4 ++--
 drivers/media/usb/uvc/uvcvideo.h     |  3 ++-
 3 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index ab9cdb50e74e..59e5769166f2 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1956,6 +1956,7 @@ static void uvc_unregister_video(struct uvc_device *dev)

 int uvc_register_video_device(struct uvc_device *dev,
 			      struct uvc_streaming *stream,
+			      unsigned int inst,
 			      struct video_device *vdev,
 			      struct uvc_video_queue *queue,
 			      enum v4l2_buf_type type,
@@ -1990,17 +1991,18 @@ int uvc_register_video_device(struct uvc_device *dev,
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
 	default:
 		vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+		snprintf(vdev->name, sizeof(vdev->name), "Cap%u %s", inst, dev->name);
 		break;
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
 		vdev->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
+		snprintf(vdev->name, sizeof(vdev->name), "Out%u %s", inst, dev->name);
 		break;
 	case V4L2_BUF_TYPE_META_CAPTURE:
 		vdev->device_caps = V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING;
+		snprintf(vdev->name, sizeof(vdev->name), "Meta%u %s", inst, dev->name);
 		break;
 	}

-	strscpy(vdev->name, dev->name, sizeof(vdev->name));
-
 	/*
 	 * Set the driver data before calling video_register_device, otherwise
 	 * the file open() handler might race us.
@@ -2020,7 +2022,7 @@ int uvc_register_video_device(struct uvc_device *dev,
 }

 static int uvc_register_video(struct uvc_device *dev,
-		struct uvc_streaming *stream)
+		struct uvc_streaming *stream, unsigned int inst)
 {
 	int ret;

@@ -2041,7 +2043,7 @@ static int uvc_register_video(struct uvc_device *dev,
 	uvc_debugfs_init_stream(stream);

 	/* Register the device with V4L. */
-	return uvc_register_video_device(dev, stream, &stream->vdev,
+	return uvc_register_video_device(dev, stream, inst, &stream->vdev,
 					 &stream->queue, stream->type,
 					 &uvc_fops, &uvc_ioctl_ops);
 }
@@ -2054,9 +2056,13 @@ static int uvc_register_terms(struct uvc_device *dev,
 {
 	struct uvc_streaming *stream;
 	struct uvc_entity *term;
+	unsigned int inst_cap = 0;
+	unsigned int inst_out = 0;
 	int ret;

 	list_for_each_entry(term, &chain->entities, chain) {
+		bool is_capture;
+
 		if (UVC_ENTITY_TYPE(term) != UVC_TT_STREAMING)
 			continue;

@@ -2069,16 +2075,22 @@ static int uvc_register_terms(struct uvc_device *dev,
 		}

 		stream->chain = chain;
-		ret = uvc_register_video(dev, stream);
+		is_capture = stream->type == V4L2_BUF_TYPE_VIDEO_CAPTURE;
+		ret = uvc_register_video(dev, stream,
+					 is_capture ? inst_cap : inst_out);
 		if (ret < 0)
 			return ret;

-		/*
-		 * Register a metadata node, but ignore a possible failure,
-		 * complete registration of video nodes anyway.
-		 */
-		uvc_meta_register(stream);
-
+		if (is_capture) {
+			/*
+			 * Register a metadata node, but ignore a possible failure,
+			 * complete registration of video nodes anyway.
+			 */
+			uvc_meta_register(stream, inst_cap);
+			inst_cap++;
+		} else {
+			inst_out++;
+		}
 		term->vdev = &stream->vdev;
 	}

diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
index 82de7781f5b6..685182302602 100644
--- a/drivers/media/usb/uvc/uvc_metadata.c
+++ b/drivers/media/usb/uvc/uvc_metadata.c
@@ -156,7 +156,7 @@ static const struct v4l2_file_operations uvc_meta_fops = {
 	.mmap = vb2_fop_mmap,
 };

-int uvc_meta_register(struct uvc_streaming *stream)
+int uvc_meta_register(struct uvc_streaming *stream, unsigned int inst)
 {
 	struct uvc_device *dev = stream->dev;
 	struct video_device *vdev = &stream->meta.vdev;
@@ -170,7 +170,7 @@ int uvc_meta_register(struct uvc_streaming *stream)
 	 */
 	vdev->queue = &queue->queue;

-	return uvc_register_video_device(dev, stream, vdev, queue,
+	return uvc_register_video_device(dev, stream, inst, vdev, queue,
 					 V4L2_BUF_TYPE_META_CAPTURE,
 					 &uvc_meta_fops, &uvc_meta_ioctl_ops);
 }
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 07f9921d83f2..92c72ef6ea49 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -738,10 +738,11 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 void uvc_video_clock_update(struct uvc_streaming *stream,
 			    struct vb2_v4l2_buffer *vbuf,
 			    struct uvc_buffer *buf);
-int uvc_meta_register(struct uvc_streaming *stream);
+int uvc_meta_register(struct uvc_streaming *stream, unsigned int inst);

 int uvc_register_video_device(struct uvc_device *dev,
 			      struct uvc_streaming *stream,
+			      unsigned int inst,
 			      struct video_device *vdev,
 			      struct uvc_video_queue *queue,
 			      enum v4l2_buf_type type,
-- 
2.43.0


