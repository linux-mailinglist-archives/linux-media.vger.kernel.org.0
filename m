Return-Path: <linux-media+bounces-34090-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC81DACEAA1
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 09:06:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9836A16D5D8
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 07:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9B131FBC92;
	Thu,  5 Jun 2025 07:05:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E422C3242
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 07:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749107149; cv=none; b=Yq8J6CzWBsZqMi9luD2Icz5ALl0AA2OvgEcCQZEaemNZEsTFWuxwrlJOphKMClTn7tCQOxBB/aaC1cKC+wWH8V+v7SO+DcUP8Bce0mS2ZNcLaa+IYlu+b2gxEWroyCvjOlGit+Ydx98U9kl0li6+5cRPymMCCEBsr6pjupnhuEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749107149; c=relaxed/simple;
	bh=jkC/D8Endlg1um3xAdGze0ThIkLvebFclT19aTclBGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V869632he/8hOozXDMD8+6Oj9+MrCh9BEDPYfdjIfjpNsxDlWbxXmuuV+HwQWRhiD5sFZbXphXt0VP88LsHwe4Q5qH8w3rrsh28wLdLCCDpy3gVk9c8viUHSldQtykeX3yBXx4utxTILPmATf6EBEzm2hj2RvzLC2vXJoxrIEi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7115DC4CEEB;
	Thu,  5 Jun 2025 07:05:48 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 4/5] media: vb2: remove vb2_ops_wait_prepare/finish helpers
Date: Thu,  5 Jun 2025 08:57:38 +0200
Message-ID: <3da514ec5172f643d40e7aa0b3d8560bfd7f6b63.1749106659.git.hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1749106659.git.hverkuil@xs4all.nl>
References: <cover.1749106659.git.hverkuil@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since vb2 now relies on the presence of the vb2_queue lock
field and there are no more drivers that use these helpers, it is safe
to drop them.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 Documentation/driver-api/media/v4l2-dev.rst    |  8 ++++----
 .../media/common/videobuf2/videobuf2-v4l2.c    | 14 --------------
 include/media/videobuf2-v4l2.h                 | 18 ------------------
 3 files changed, 4 insertions(+), 36 deletions(-)

diff --git a/Documentation/driver-api/media/v4l2-dev.rst b/Documentation/driver-api/media/v4l2-dev.rst
index d5cb19b21a9f..dd239ad42051 100644
--- a/Documentation/driver-api/media/v4l2-dev.rst
+++ b/Documentation/driver-api/media/v4l2-dev.rst
@@ -157,10 +157,10 @@ changing the e.g. exposure of the webcam.
 Of course, you can always do all the locking yourself by leaving both lock
 pointers at ``NULL``.
 
-In the case of :ref:`videobuf2 <vb2_framework>` you will need to implement the
-``wait_prepare()`` and ``wait_finish()`` callbacks to unlock/lock if applicable.
-If you use the ``queue->lock`` pointer, then you can use the helper functions
-:c:func:`vb2_ops_wait_prepare` and :c:func:`vb2_ops_wait_finish`.
+In the case of :ref:`videobuf2 <vb2_framework>` you must set the ``queue->lock``
+pointer to the lock you use to serialize the queuing ioctls. This ensures that
+that lock is released while waiting in ``VIDIOC_DQBUF`` for a buffer to arrive,
+and it is retaken afterwards.
 
 The implementation of a hotplug disconnect should also take the lock from
 :c:type:`video_device` before calling v4l2_device_disconnect. If you are also
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 1cd26faee503..c16e920b752b 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -1301,20 +1301,6 @@ void vb2_video_unregister_device(struct video_device *vdev)
 }
 EXPORT_SYMBOL_GPL(vb2_video_unregister_device);
 
-/* vb2_ops helpers. Only use if vq->lock is non-NULL. */
-
-void vb2_ops_wait_prepare(struct vb2_queue *vq)
-{
-	mutex_unlock(vq->lock);
-}
-EXPORT_SYMBOL_GPL(vb2_ops_wait_prepare);
-
-void vb2_ops_wait_finish(struct vb2_queue *vq)
-{
-	mutex_lock(vq->lock);
-}
-EXPORT_SYMBOL_GPL(vb2_ops_wait_finish);
-
 /*
  * Note that this function is called during validation time and
  * thus the req_queue_mutex is held to ensure no request objects
diff --git a/include/media/videobuf2-v4l2.h b/include/media/videobuf2-v4l2.h
index 77ce8238ab30..71d2864fb235 100644
--- a/include/media/videobuf2-v4l2.h
+++ b/include/media/videobuf2-v4l2.h
@@ -367,24 +367,6 @@ unsigned long vb2_fop_get_unmapped_area(struct file *file, unsigned long addr,
  */
 void vb2_video_unregister_device(struct video_device *vdev);
 
-/**
- * vb2_ops_wait_prepare - helper function to lock a struct &vb2_queue
- *
- * @vq: pointer to &struct vb2_queue
- *
- * ..note:: only use if vq->lock is non-NULL.
- */
-void vb2_ops_wait_prepare(struct vb2_queue *vq);
-
-/**
- * vb2_ops_wait_finish - helper function to unlock a struct &vb2_queue
- *
- * @vq: pointer to &struct vb2_queue
- *
- * ..note:: only use if vq->lock is non-NULL.
- */
-void vb2_ops_wait_finish(struct vb2_queue *vq);
-
 struct media_request;
 int vb2_request_validate(struct media_request *req);
 void vb2_request_queue(struct media_request *req);
-- 
2.47.2


