Return-Path: <linux-media+bounces-37975-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27314B08B3C
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 12:54:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C594B7B7F9A
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 10:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A78432BDC23;
	Thu, 17 Jul 2025 10:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YYiuPOep"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9800F2BD5B3;
	Thu, 17 Jul 2025 10:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752749163; cv=none; b=ZGTI5Vsay7LY40t5X+05xIrQd75219MM+YwjogZzVayceLa0F01dP2grqsjgl90M+7G8Gf2JMlpoTx+Q49npzuGH6EAHIUZc+jL7glmXxUAlSVLKR6xLc6YmvUPR/Fm3IjgPkfGTGRHrxj/92XC5EmdHuJvL313SVLtMQEi03P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752749163; c=relaxed/simple;
	bh=mLUIKlRtGcg7V5Vy0wqmsYRGL64MqtvU55q1oBc3ZZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bzxz8pLQFUQ0HhVZfH+EdgjDWTkuzqYDO2Rw8yHlvxEHyKn7IgkyK98g/LULBgFnW/MrHUgmzaEdbpeIYNwcOBrgW1FfrnAhJ9h9KGjv74Anz8HuT4cZVg44FxSJRnEAzvlPGgN7J8YjrM2aS3Hwsun7AYl9aAUU4UxaBY0ba0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YYiuPOep; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-140-254.net.vodafone.it [5.90.140.254])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E872245A;
	Thu, 17 Jul 2025 12:45:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752749121;
	bh=mLUIKlRtGcg7V5Vy0wqmsYRGL64MqtvU55q1oBc3ZZs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YYiuPOeprmFLaNJmzOXHBcYHGT8fBlsFW4+sj1s+N64Tw+55Rw/PTCnB94yCebWYN
	 VEZOlOSWEcgJJ2pJG5nm3fPkBnUUYETbkiemAh9Qkj9CAOwlk8dwwbsLCuqBjo/484
	 R9u+juYMLuvIoUHww25r+AOojgmci9b8bpoHw2+k=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 17 Jul 2025 12:45:36 +0200
Subject: [PATCH 10/26] media: v4l2-dev: Add
 video_device_context_from_queue()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-multicontext-mainline-2025-v1-10-81ac18979c03@ideasonboard.com>
References: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
In-Reply-To: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoeNRPd2EOVo7NzC+9Tgxe4bjIIOEosUfZWrH3d
 jZq5MccBbCJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaHjUTwAKCRByNAaPFqFW
 PPLwD/9GLnCoGIVQv4Jy8/8f0VN/n8yLhbkFFqZOcYTdZThOGrK5bXosdH7Ef9dwIY9kNLXxth8
 3/OR92mYXXtLciXPDGfd4GfPBWFO0XT1Af6bbIbT8fJCnntcJiiaPZhDPa6MKa4nCRi37F7579D
 IXJCAWZABJ9eeUdkaXtOTRcNt4s4qfB1erA/O/fveLJhp4P2NAVkFG9RE2Bc3Q/H35w7lM70H2f
 ckFJlH3LsiclEi+alz9FcT+wjCoXuIDB+fewxdTCD7HXun9nQExxapYiSmz7ZqZVVb/lZ8FP9L9
 PY1gagHJfGbGFv7iF/huAHRF7UMC8TSWUQAjOno6ZZOswchTKH0Z4OASVrQkMW0DJgWTVx7V+rx
 Yw42g2rTfYzPRLkq/Os0aZl8dss1ma6j2lhh0gC9l7Ths/nsgblQhylZfHOcapKiQXCeiFsDZYr
 Ds+9dFlLoxrG5+rFS9EIqr5lE7gTAX8irvmUhB43r8I5ayc7kr7RGZ/CpwPg/bWxh4aECyLNwqQ
 kdFR8PLFg6+nrIamxPHqKhR2If85q6GvPDyjoV7Dy14HLGQVmtmCUrTGIXfFcmY98rw8j751K+G
 TmpjgzkS/f8oP6STb+jqmhRfuQ8MNU39QkPDqC+Nqa+/KzhqoqfrAu0uM1VfFjHT7ElY9MoA7Ms
 Tr2NADj0jvjubow==
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


