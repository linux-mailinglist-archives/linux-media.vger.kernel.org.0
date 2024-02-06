Return-Path: <linux-media+bounces-4756-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE3084B06C
	for <lists+linux-media@lfdr.de>; Tue,  6 Feb 2024 09:54:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9171A1F26B2F
	for <lists+linux-media@lfdr.de>; Tue,  6 Feb 2024 08:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84B2F12D144;
	Tue,  6 Feb 2024 08:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="J+mZpeRZ"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC2F12D148;
	Tue,  6 Feb 2024 08:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707209650; cv=none; b=sLjD1gdmLiV8vmbxByaHdGzFKw6tjMyfaKYdVqsB7AcizV1PH6pw1rq6kvTdGy8FWCK9QdOHMOksjJkoYn6aFhAhY7j6WGWzp4B2Dwit2o1gpDmw0zbdGHREhAdUQF9bByCZFMmiTUX4bahCnEg6W6Btyyh3TkY/XzX1uz3iJYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707209650; c=relaxed/simple;
	bh=mA46pEqExH9qPI2VkoyDfgxKpACMEhbjzanFkijR/2M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AVCuvpbG6HrBT4vLOiYqY+CPmb8TkecS+Ct7NxIdnCqVf1lhIaS6BHnVmKW/TGeNuMbsRvwXKhkMJtnDkpOMOC2Q1MXTgYujZi5BsXb4IuBPj559YI4QpJ8S9kZLCfwxJEQEj+K2DRc7y2oB8Ns2pENbu65cIGZAS/5PQJvz8yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=J+mZpeRZ; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707209647;
	bh=mA46pEqExH9qPI2VkoyDfgxKpACMEhbjzanFkijR/2M=;
	h=From:To:Cc:Subject:Date:From;
	b=J+mZpeRZVWGguPLqT6eaMJmRjZCdaKc0S1mrIWO2GQN7qApaXpqF8msZPzt149SWW
	 TPmIAXtlE/ySEaVjPcqgVqsvZZsNDaaoDgoUgWcKhmYGifFq3eaWhR9hzSzVfVOOuX
	 SkokDHRC31o5zMZMTlwKz0bPJxuvv0GhrAPcA3FVE+ppFYLj08gXjhf+k3rIVp7YXi
	 5dMtVRthX+QGzUx2yVcQkVOi9Q4iemrp7Mlk5MC0mbTLqAZm/0Yf3Hm2fSe6hcGXlT
	 EBQEl1e9zAi+kRpsTxm34ZtZ6tELJ1t+BK3wAh/8hbFu37JoPZt1QJUudeOj9npI9S
	 o7Fu17kKQVUng==
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 42B7F378000E;
	Tue,  6 Feb 2024 08:54:07 +0000 (UTC)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v19.1 1/9] media: videobuf2: Update vb2_is_busy() logic
Date: Tue,  6 Feb 2024 09:54:00 +0100
Message-Id: <20240206085400.14507-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not rely on the number of allocated buffers to know if the
queue is busy but on a flag set when at least one buffer has been allocated
by REQBUFS or CREATE_BUFS ioctl.
The flag is reset when REQBUFS is called with count = 0 or the file
handle is closed.
This is needed because delete buffers feature will be able to remove
all the buffers from a queue while streaming so relying on the number
of allocated buffers in the queue won't be possible.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
version 19.1:
- Add q->is_busy = 0 in vb2_core_queue_release()
- Fix q->is_busy usage in vb2_core_reqbufs()
- Reword commit message.
- Fix typo in commit message

 drivers/media/common/videobuf2/videobuf2-core.c | 4 ++++
 include/media/videobuf2-core.h                  | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index b6bf8f232f48..d8b3c04cb3b5 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -854,6 +854,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 		__vb2_queue_free(q, q_num_bufs);
 		mutex_unlock(&q->mmap_lock);
 
+		q->is_busy = 0;
 		/*
 		 * In case of REQBUFS(0) return immediately without calling
 		 * driver's queue_setup() callback and allocating resources.
@@ -966,6 +967,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 	 */
 	*count = allocated_buffers;
 	q->waiting_for_buffers = !q->is_output;
+	q->is_busy = 1;
 
 	return 0;
 
@@ -1091,6 +1093,7 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 	 * to the userspace.
 	 */
 	*count = allocated_buffers;
+	q->is_busy = 1;
 
 	return 0;
 
@@ -2555,6 +2558,7 @@ void vb2_core_queue_release(struct vb2_queue *q)
 	__vb2_queue_free(q, vb2_get_num_buffers(q));
 	kfree(q->bufs);
 	q->bufs = NULL;
+	q->is_busy = 0;
 	mutex_unlock(&q->mmap_lock);
 }
 EXPORT_SYMBOL_GPL(vb2_core_queue_release);
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 56719a26a46c..b317286a7b08 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -579,6 +579,7 @@ struct vb2_buf_ops {
  *		called since poll() needs to return %EPOLLERR in that situation.
  * @is_multiplanar: set if buffer type is multiplanar
  * @is_output:	set if buffer type is output
+ * @is_busy:	set if at least one buffer has been allocated at some time.
  * @copy_timestamp: set if vb2-core should set timestamps
  * @last_buffer_dequeued: used in poll() and DQBUF to immediately return if the
  *		last decoded buffer was already dequeued. Set for capture queues
@@ -644,6 +645,7 @@ struct vb2_queue {
 	unsigned int			waiting_in_dqbuf:1;
 	unsigned int			is_multiplanar:1;
 	unsigned int			is_output:1;
+	unsigned int			is_busy:1;
 	unsigned int			copy_timestamp:1;
 	unsigned int			last_buffer_dequeued:1;
 
@@ -1163,7 +1165,7 @@ static inline unsigned int vb2_get_num_buffers(struct vb2_queue *q)
  */
 static inline bool vb2_is_busy(struct vb2_queue *q)
 {
-	return vb2_get_num_buffers(q) > 0;
+	return !!q->is_busy;
 }
 
 /**
-- 
2.40.1


