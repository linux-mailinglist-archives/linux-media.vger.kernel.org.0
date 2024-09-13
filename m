Return-Path: <linux-media+bounces-18276-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D9D978AD7
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 23:47:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 861E6B22320
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 21:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B8E1714AA;
	Fri, 13 Sep 2024 21:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RyKLiwd3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3DB1494DC
	for <linux-media@vger.kernel.org>; Fri, 13 Sep 2024 21:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726264047; cv=none; b=XvDTaacdK2H1lZRzJ104qrQc8odXcy6+Y/LIgB0wlQ87BNxMT/xAdaIpbqdHrQ5J/Qt46XmOpkj1jLKRT3rafIlBIU8e311mfAB2EClpipklfHZyMh6rGbx1ket3vf25U7p+KsPoNU3hFQvzkLwonMcleUs731m7dxTYM4G1kgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726264047; c=relaxed/simple;
	bh=xxUPyC7ZR+OTUVsrPaK7+U/zRU0HEWUUqm07wIEEjSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fv3Omovj6i1Sj1G3ylpE6NB6FrEZICGgzSEZys5/HHS44tFnofqJJ/OiK3qT0Dfi9oyb2IfPJeKcka9NPf2VFwgowdX5WtVRJISKMlanBzuVXYyyYPKH81vMLKHz5CJqF08b9ArtCORBA9+V0iZirdhSnAsRh7tO8pxTmE6y7nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RyKLiwd3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 770221BC7;
	Fri, 13 Sep 2024 23:45:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726263950;
	bh=xxUPyC7ZR+OTUVsrPaK7+U/zRU0HEWUUqm07wIEEjSo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RyKLiwd3Qplthlnz9Gqc3QcrJsk2BFKSUQ9WIQvqWzIMFqqASVupUkhDdhE8OMG6t
	 ReQaafKK8LNSyCl6YqE/DSp1UQZPhQuyIKGY7eiwtOjGq6gCd71NzX/OlFW5TEKhig
	 rMbA7I558dPpkiUcV8DairPSqlNaElATtOAvWG68=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 07/10] media: v4l2-dev: Add video_device_context_from_queue()
Date: Fri, 13 Sep 2024 23:46:52 +0200
Message-ID: <20240913214657.1502838-8-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240913214657.1502838-1-jacopo.mondi@ideasonboard.com>
References: <20240913214657.1502838-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce an helper function to get a video_device_context from
a videobuf2 queue.

Device drivers that support multi-context operations will receive in
their vb2_ops callbacks implementation a vb2_queue argument that is
embedded in a video device context, either a context created by binding
the video device to a media device context or the video device default
context. This helper allows those drivers to retrieve the context
the vb2_queue is embedded with.

As the intended callers of this helpers are vb2_ops callbacks
implementation, called by the videobuf2 core in response to an operation
on a file handle, the returned context is guaranteed to be valid for
the whole duration of the callback.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 include/media/v4l2-dev.h | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index 32e61f9f9cb5..2ef49d0aaf09 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -796,6 +796,42 @@ void video_device_cleanup_context(struct video_device_context *ctx);
 struct video_device_context *
 video_device_context_from_file(struct file *filp, struct video_device *vdev);
 
+/**
+ * video_device_context_from_queue - Get a video device context associated with
+ *				     a vb2 queue
+ *
+ * @q: the videobuf2 queue
+ *
+ * Return the video device context this videobuf2 queue belongs to.
+ *
+ * Device drivers that support multi-context operations will always be provided
+ * with a device context to work with, either a context created by userspace
+ * by binding the video device to a media device context or the video device
+ * default context. The videobuf2 queue that context-aware drivers operates will
+ * always be contained in either one of those contexts.
+ *
+ * This function should be used by driver-specific callbacks implementation of
+ * the vb2_ops which receive a videobuf2 as argument. Being the vb2_ops callback
+ * called by the videobuf2 core in response to a userspace operation on an open
+ * file handle, callers of this function are guaranteed to always receive a
+ * valid context reference by this function. The reference will remain valid for
+ * the whole function scope of the vb2_ops callback that has received the
+ * videobuf2 queue as argument. Likewise, accessing the media device context
+ * from the video device context returned by this function is always safe within
+ * the same function scope.
+ *
+ * Drivers that do not support multi-context operations shall never use
+ * this function.
+ *
+ * This function does not increase the reference count of the returned video
+ * device context.
+ */
+static inline struct video_device_context *
+video_device_context_from_queue(struct vb2_queue *q)
+{
+	return container_of(q, struct video_device_context, queue);
+}
+
 #endif /* CONFIG_MEDIA_CONTROLLER */
 
 #endif /* _V4L2_DEV_H */
-- 
2.46.0


