Return-Path: <linux-media+bounces-38394-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4A3B10CE3
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 16:13:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 008D27B292B
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 14:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F1262E7650;
	Thu, 24 Jul 2025 14:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SbE1oFdU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF6D2E6D15;
	Thu, 24 Jul 2025 14:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753366250; cv=none; b=nt5zMEj/AUcr79MuY39xyA97JGAhWzaK/Mf82EDnH66y9xZS+61mE62Jm47iT7EATwPq5xgGtrMXqWt0bKpWPCfs0n4681hmyE6OH5i4MZidqOh2dD/rIqRaD0CpgI+hESiXrc++I7VOCHJikqutd8xBmQhd2ToDmBbEa9M8JkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753366250; c=relaxed/simple;
	bh=mLUIKlRtGcg7V5Vy0wqmsYRGL64MqtvU55q1oBc3ZZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pa0hxkNrHpi/bJeFQQm5bVDjGiXV8ku5hNQa41BMf4CIIgZtX6b/2yR/oGapsHdVOdXKU1H7HRbIfcM7IzXsiqaYzTwrQ+rttsTqtx5I6Yx3cSOoyauY0WI+sb9SmbvQQ22ekRDcXBzSzOrn2UqEMU2LMuVpz1wdcM1wdRdCYF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SbE1oFdU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.76] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E020D19E7;
	Thu, 24 Jul 2025 16:09:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753366199;
	bh=mLUIKlRtGcg7V5Vy0wqmsYRGL64MqtvU55q1oBc3ZZs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SbE1oFdU/9H7Yu3GahmaFUqLyaAui8STmt0HJnCtwimhy+oGAPunQC/FQrQ7DK0Ag
	 Hk1mYaumrjMNeWRqA1UmElJKnORD20lporB9xxFuKTLWKvy+ZxPMM0EL4w7LLlySDa
	 3jdpxVhF5/G8x9zZZIID0HEK1SxYRA2uv+kTlFPM=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 24 Jul 2025 16:10:17 +0200
Subject: [PATCH v2 10/27] media: v4l2-dev: Add
 video_device_context_from_queue()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-multicontext-mainline-2025-v2-10-c9b316773486@ideasonboard.com>
References: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
In-Reply-To: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3081;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=mLUIKlRtGcg7V5Vy0wqmsYRGL64MqtvU55q1oBc3ZZs=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBogj7P1lFdRKpeT4WwbjOonQa/xpkPdT4p0PKa2
 Xi8BELxuYSJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaII+zwAKCRByNAaPFqFW
 PK02D/sFpbStQiARNqc+O3WRoH+zz2HEs8iJBJmfbY53V1wZTRx3C3Mf1tPR6RhhSLrvYWvD/WQ
 /ogIA3hUZpE6/i/ZQbfOmyz3s7jWnbkOXI2XsTy3/2v7I8I4ObSjudBEGz8frjiE6q8Jtt+IzLU
 AXxjRzDRij9+ttBPtVM7ZpzSux7lGzFg4Ouec/d14H0RgpxEq++WvHBSXUj6m2gTeJc4Ls4ZZ1/
 AKjJO4xSG1z8xNRJuQQcMgc+qEpgvDjzBQLOXh9oBOjgazvY7ufCiH/01XUwyojS/9LB5DZJ7hB
 wLXjctGBl5M8I/jO/PHQB+21XeJ/xIbcN5XSONqigchqlzh6HtSothepHU27Yf48O9tPRWp/YuM
 ZYEQbWSPNzoxjvV1RfbHt9tUJko5+bkCJlt81CuzTdfckyf7CY9RUiGR8SGK/bMdb+qmtlU/j2/
 xhCglKVHD/559xTS8QSRGyalVugUHWBPrn12gECLXTROfkZUQw1XYeDvqZcWlxm3m+868PJZP/D
 5Vs14E8+ugBYLOv2D1l/zluq190d5zkWObZhcd5AivkkO6E/kA9igGkDhbD4Lamlve8EWv/aJtm
 EDVaRd+PqQpSDCQ4EAn7DExd4x9xSwLLM2bipJtXE4jPcIp+vj+eJndeIWLa8HG9mQohTjvZaGs
 sG5370v6UbI38+w==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

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
index a41afb81663bc9cb3bfc06dcf9b11ceeaf7c3415..bab4b13b109362bec84d8d16440b6ea895206b60 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -819,6 +819,42 @@ void video_device_cleanup_context(struct video_device_context *ctx);
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
2.49.0


