Return-Path: <linux-media+bounces-38393-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 557C6B10CEC
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 16:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 260133A7CD7
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 14:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F05A2DE6EF;
	Thu, 24 Jul 2025 14:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Nz6s0cpM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0812E54DB;
	Thu, 24 Jul 2025 14:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753366247; cv=none; b=rCT6hppC9+63IvGgHMKQLhQr8A8bC+RFIhsetCfatw5AeX5AdHwomd8USFXqgMsMQJNw+l02R3pOF4rNwsS3S8LOa4Hq0BZY52ZbY2B2J1kEPG23GR5zHZL8RQCLAAmc+XSdmYEOMXjHWinfpk1rcpwgkJb0jPLAalgqyR6HR2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753366247; c=relaxed/simple;
	bh=7vOckOlOxZhw2fbL9SA65DEYxitygggpkHW/wn4/+ec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tRckgvknDo8qA/t8Dt7buZFnYiwi50kOU50TjcJHN0/zH47nh4OyTAuu8DiaQYgkR/DL9ysorzk34ei9/uIAIGehDDdFC9cizztu6dM10/doErzB7brNMtgv2PUlDdoAsjO0Tm8yESlTfJUIaFulvMeQ+FgwlKE6IV2gTcUs2EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Nz6s0cpM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.76] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B42C11A37;
	Thu, 24 Jul 2025 16:09:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753366198;
	bh=7vOckOlOxZhw2fbL9SA65DEYxitygggpkHW/wn4/+ec=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Nz6s0cpM9/owWJkU8pyOHVjwVQjPh0byz4D193b8Po+R3FJYUKasDdPI99zkVnWaB
	 kmj28EHDAPTMV2DrzPC+kcF+abMhnpivuTycy0mIrpIjTGr3GmOZ7D3j40fql4c2VV
	 sQLxaukkKtPE5pGKe3hGW6LJ4fNVJ/ZKnA+9kZ3U=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 24 Jul 2025 16:10:16 +0200
Subject: [PATCH v2 09/27] media: v4l2-dev: Add
 video_device_context_from_file()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-multicontext-mainline-2025-v2-9-c9b316773486@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3662;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=7vOckOlOxZhw2fbL9SA65DEYxitygggpkHW/wn4/+ec=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBogj7PkjaY/ZSj7vHkANoqvzVbGnB7c0FYtuyIL
 cMLSnSwBamJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaII+zwAKCRByNAaPFqFW
 PDfrD/9RfoA8wg5LkT2LdivtZ5m0NdRIiPj4RwTBL6/pslI7Ll7rDQjbzGLU7acWDOXTBkuNwfn
 7Gqay0BSwp0TrsjdKjGsrtfN7TNEFyEIyYfrTui+QxxOV1HpWQBcqjKKNytoxQwNvy2wxL53vSB
 7z/xn2xR22OGQZGCJXuzfljWG1S6d7aZqPnPMwIpnS8tXGHgNntryf+kWX/lQUvQCXRMl21qqL8
 82EMJ2Pfi0kJl6PWpplbm6llPl6GRQbzoDKcHSPFCwgD+F6GrXm73sKQ6DBv+XcsD2AkljP0zXb
 0512SNrU3YwOHDk/uWsCAggM8jR+3tQodn0KZuh2Gkw94NzMiQ2b0tUy6DWnGSVtKJxSaf8mUMj
 sb5wh8HNBDIVFDNtXQ5OEeDEIZf6WIWii/YwD78BKdLnfWGA9LhRJRFqYLSMwom0E+EvIP61A3j
 FGEuc2IyaVqn1KKPskVJ/pLtrXFvcsAau90vhWFy5csPf0cyz8ELPaARNXWzkP6udOx3qB0+7qp
 Lrp7WsdApMEJmRE1j4HzgAIHcnRm64rs2ggnlDmlVLkPpFGRJ2sRUpFPksY+AgI/aiAQSY0wwF5
 M1rYaIvCCN0e893e99zX133miFLLHSydgckK3ASbP/mOHS2SuJjtN6XcdFuBcCMz1TlGBqqewdd
 tNonoFUvhDkDc1Q==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Introduce an helper function to get a video_device_context from file.
If no context has been bound to the file, return the video device
default context.

As a video device context lifetime is bound to the one of the file
handle it is associated with, and the intended user of this helper are
the v4l2_ioctl_ops handlers that operates on an open file handle, the
context returned by this function is guaranteed to be valid for the
whole function scope of the caller.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-dev.c | 15 +++++++++++++++
 include/media/v4l2-dev.h           | 30 ++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 2d78096931efd88215bc847b105e198a54035546..fafd4209e2cab320a6e164d33e9a0f73784d22db 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -1182,6 +1182,21 @@ EXPORT_SYMBOL_GPL(v4l2_debugfs_root);
 
 #if defined(CONFIG_MEDIA_CONTROLLER)
 
+struct video_device_context *
+video_device_context_from_file(struct file *filp, struct video_device *vfd)
+{
+	struct v4l2_fh *vfh =
+		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? filp->private_data
+							    : NULL;
+
+	/* If the file handle has been bound to a context return it. */
+	if (vfh && vfh->context)
+		return vfh->context;
+
+	return vfd->default_context;
+}
+EXPORT_SYMBOL_GPL(video_device_context_from_file);
+
 __must_check int video_device_pipeline_start(struct video_device *vdev,
 					     struct media_pipeline *pipe)
 {
diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index 9e1cf58623acc4ab5f503a9663fd999b38130226..a41afb81663bc9cb3bfc06dcf9b11ceeaf7c3415 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -789,6 +789,36 @@ int video_device_init_context(struct video_device *vdev,
  */
 void video_device_cleanup_context(struct video_device_context *ctx);
 
+/**
+ * video_device_context_from_file - Get the video device context associated with
+ *				    an open file handle
+ * @filp: The file handle
+ * @vdev: The video device
+ *
+ * If a video device context has been bound to an open file handle by a call
+ * to the VIDIOC_BIND_CONTEXT ioctl this function returns it, otherwise returns
+ * the default video device context.
+ *
+ * The intended callers of this helper are the driver-specific v4l2_ioctl_ops
+ * handlers, which receive as first argument a file pointer. By using this
+ * helper drivers can get the context associated with such file, if any.
+ * Otherwise, if the video device  has not been bound to any media device
+ * context, the default video device context is returned.
+ *
+ * As video device contexts are reference counted and their lifetime is
+ * guaranteed to be at least the one of the file handle they are associated
+ * with, callers of this function are guaranteed to always receive a valid
+ * context reference by this function. The reference will remain valid for the
+ * whole function scope of the caller that has received the open file handle as
+ * argument. Likewise, accessing the media context from the video device context
+ * returned by this function is always safe within the same function scope.
+ *
+ * This function does not increase the reference count of the returned video
+ * device context.
+ */
+struct video_device_context *
+video_device_context_from_file(struct file *filp, struct video_device *vdev);
+
 #endif /* CONFIG_MEDIA_CONTROLLER */
 
 #endif /* _V4L2_DEV_H */

-- 
2.49.0


