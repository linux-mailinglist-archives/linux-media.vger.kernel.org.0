Return-Path: <linux-media+bounces-5573-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FFB85E20E
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 16:55:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DA072869D5
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 15:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967CD81AAD;
	Wed, 21 Feb 2024 15:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="uTWPvWxY"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730A98002B;
	Wed, 21 Feb 2024 15:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708530886; cv=none; b=J4J3Itv6mc5m3AG9wfPQ6DYiizdR0+y2n093IKurUF3FMpoqTbUr7mWCHL0IqWC1ZxTfsuzjN5bDAOsPDL9s0Tb7VIcUuZXoiWQ4Eflq8PNE4pPC7+UN5W4P84CKgTj3Tp+gfOAWoeKL9ZDHIXm6lb+5EXq9gGg49DVlkvooXMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708530886; c=relaxed/simple;
	bh=5ckXgkvWFGC5NNON9KbJM0pNpOmn7g6OdSSL28pZpt4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CvyDl4zwBvJSToOrU1jKcRgHq+NgWGBSCX7RcJ/yk/Sk/ubGloQauGhD4bbwb3yTpvX9Lbp4+L4HKiOdbzB6gPKHBEXIJ2kM6vTkaNrJK0VcGG1NglMSvKXKdXQYgcAvnRLq2U6mVBfovdrUP5ewtuUMST5jKWim/GtTcQSVUx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=uTWPvWxY; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708530882;
	bh=5ckXgkvWFGC5NNON9KbJM0pNpOmn7g6OdSSL28pZpt4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uTWPvWxYB8aVG/Jmtt/SUn5NTob7J1BmlHCtcdzMsWgTT9WZo0TTHgr4kIlbgGlku
	 DZKNh1V+54ivHckBGQlXY6jEzyjH/ndW81IcImNUNa9OpGArULe1lAYtUS10vNSqEO
	 NBSJkpoK/g7Fn+bSy6C1UFMwZ0pqVT7CwttuvW6Pieb1weagKokdfVieay2ob9VYUK
	 NdN3R465hTJ/zDY1ohkUdDS+IK7fgfShzyPHPgeYtgnXgDQiWtadW9IusaJcpwMVvp
	 d8CjrldwRyBsTU36BsbpnnTALH2ZZn0+cCFqsvvbAZgllG3yWD6/taawXLktXpbGMK
	 x9alJ9bYdyAJQ==
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 309033780C13;
	Wed, 21 Feb 2024 15:54:42 +0000 (UTC)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	tfiga@chromium.org,
	m.szyprowski@samsung.com,
	ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de,
	hverkuil-cisco@xs4all.nl,
	nicolas@ndufresne.ca
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v20 1/9] media: videobuf2: Update vb2_is_busy() logic
Date: Wed, 21 Feb 2024 16:54:27 +0100
Message-Id: <20240221155435.100093-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240221155435.100093-1-benjamin.gaignard@collabora.com>
References: <20240221155435.100093-1-benjamin.gaignard@collabora.com>
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
This is needed because remove buffers feature will be able to remove
all the buffers from a queue while streaming so relying on the number
of allocated buffers in the queue won't be possible.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
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
index d9c6b5d4e990..6ad36da91f8d 100644
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


