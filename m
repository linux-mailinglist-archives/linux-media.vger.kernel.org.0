Return-Path: <linux-media+bounces-49046-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A04D8CCA791
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 07:31:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72E413089E5D
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 06:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3BC53242C2;
	Thu, 18 Dec 2025 06:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N1/jOrdj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7A61DDA24
	for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 06:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766039345; cv=none; b=HuUOu2xXSgfne4QLtr/sX9nvSWptFCMYbJwHtLdvPGDkcGU0glEeWztPsmd67a/2v65g+Igc3cxBeOCy7mxAJiw92br9+6TIRLk6e3IFx6Fe+cd8exDkfJVxN4vC7NNtU0l5YvAXXjgBuVfTKJjj2HQJ1fnsrYhSuuQaTQp4TT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766039345; c=relaxed/simple;
	bh=fPng5ZUvz+0tNW3LaZLEKF9BeRtl6pux2h7RiYtCX9I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uNCH0dvN23n0gv7XHCeTYInh+DgUdV4dcYMJ9TnPp6LhmPnOcRNeMz4wrnBFQCJ1ljtsF5etZ2pfLqUeCFD9TLl9L8Jq5S2cHZ+vTAxZd/vA0N9EGNw+5V2yE6qZA+RN1v5dVffO1Xp6fu8rXdpQIfOOWdlBC+HKX02SBy39/PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N1/jOrdj; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-29f1bc40b35so5700105ad.2
        for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 22:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766039343; x=1766644143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hjVQD1IMxRH0umBlmaZVMLvoLBONPloeFCT82Lq3Wpk=;
        b=N1/jOrdjFwT49rbOjI9LcxfqJ+Zrk5FPMg5eFLzqO8erAe8Gf0/7EqBCAb+XL+UHeX
         7p03Y3d+X+bOkyc7lKMB9XJXxe9k9KspTWLH8Nw8E0XJk+JZhJUnYWNn75Q+xEKzupwN
         H8GhEgxi/7Pfc2HFnVmv/98Jd3y7TtLG7Fj47KHnHyKV/nyJKhIMBWkcrr0vHbDLQAGM
         ztd2u6H5o5PalcsNk3U6oIWJX+KeEqdBt9+GejU3swx8zKrVvbqg7yRgsn8aOCRB/Mps
         81pymKFJ6ImNCk+pc8Rm7KsjTjOYZHJnftPVRx94gJiEudSTfoaBbPtnU7CPfYD5MHol
         TMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766039343; x=1766644143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hjVQD1IMxRH0umBlmaZVMLvoLBONPloeFCT82Lq3Wpk=;
        b=JmISDs5Nj1B2R0leXUXfUJShLlwuasUVSK4hSFAIzSuxmBeH2sZKA9qDvDgHzmCBVK
         emxAYkUCq/mDQWNig2BLc9rT4p9ou4AEaKiHz7K2Lt3otUHHd8agjrw3c1xLeKUNXIuK
         HbeN1X6OlzLuiGrVhRKk9ucDoIjPzxBaMb8OiQ6lZbIRHTULROAcBG5Gqed+1gFtx7nK
         AGvgocNuK4eFFcNdKiNjIthWEq0TCh58/RykxTanwxQzTJl5sFGJ4Tp7M767ltElr2Kw
         F4KHzDatmYVB6eIjWoFmx091V/LuGrCoI3iuTRqy0u9f/B5U7aJmIj6VBuDvcZ7wPpkx
         I6RA==
X-Gm-Message-State: AOJu0YzJtf49bpg3qbWUTR2nGLQgUUFryClae8X+ZRdTtaWV3N793/gc
	vOzWnzWt0kkc8VKLLhQHacJJ2TpqM9KgJ2/KMgQWxOLZmCRLAg1AvP3L
X-Gm-Gg: AY/fxX412zx4D/1szXrVIgJVsjyAvlBRY8JXMiD+PtUrkKd4HrbtnuDwsId0avKzLy/
	RjBJbP8WXHuSU5dWDeVNTfp9FR6Wa3oRlWXeuU6rq45muGAXQErb0FyqSBdFfESVkx7YDS0qidS
	0HbKva5/Ls4hqQTP7hpLOuINBGDz9FYp98By/ukx4qn1vMnERbPDW60knHA8kEMtFHYgAQB/BJ0
	Tqa6kh/8MxMTP5bpdVe65lvJ4BXM2mx6BeQ49v3saMvi6U6ELrviwUNgg1zL/z4qurj5kJ0xv8H
	9MqQiUKmTakYh/gq6/BjQ4q0LdroY7IADfGfk5udmxwnuCBR/nSJ1CslzJv228mTwTjlLxZJ7HB
	vY52oWkTgiYhaSMd2OWoKlrRiGr8oKAGl/xrMfsOxxEMm6smse+WXn2EvXjpvJYplVTNolAWOg7
	wdir24IwyconGUXWA5m9jo
X-Google-Smtp-Source: AGHT+IEkJR6e67q6TXoTlLRSLxdUZKbPYbKKJ8tztKLYDaWuDH6Gch/XODP95EpB/ke25E6NUlAMzw==
X-Received: by 2002:a17:903:1a87:b0:297:e59c:63cc with SMTP id d9443c01a7336-29f23c73363mr222873065ad.35.1766039342643;
        Wed, 17 Dec 2025 22:29:02 -0800 (PST)
Received: from xiao.mioffice.cn ([43.224.245.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d087c64esm13308265ad.17.2025.12.17.22.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 22:29:00 -0800 (PST)
From: Xiang Gao <gxxa03070307@gmail.com>
To: sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	mathieu.desnoyers@efficios.com,
	dhowells@redhat.com,
	kuba@kernel.org,
	brauner@kernel.org,
	akpm@linux-foundation.org,
	linux-trace-kernel@vger.kernel.org,
	gaoxiang17 <gaoxiang17@xiaomi.com>
Subject: [PATCH v8] dma-buf: add some tracepoints to debug.
Date: Thu, 18 Dec 2025 14:28:53 +0800
Message-Id: <20251218062853.819744-1-gxxa03070307@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: gaoxiang17 <gaoxiang17@xiaomi.com>

Since we can only inspect dmabuf by iterating over process FDs or the
dmabuf_list, we need to add our own tracepoints to track its status in
real time in production.

For example:
   binder:3016_1-3102    [006] ...1.   255.126521: dma_buf_export: exp_name=qcom,system size=12685312 ino=2738
   binder:3016_1-3102    [006] ...1.   255.126528: dma_buf_fd: exp_name=qcom,system size=12685312 ino=2738 fd=8
   binder:3016_1-3102    [006] ...1.   255.126642: dma_buf_mmap_internal: exp_name=qcom,system size=28672 ino=2739
     kworker/6:1-86      [006] ...1.   255.127194: dma_buf_put: exp_name=qcom,system size=12685312 ino=2738
    RenderThread-9293    [006] ...1.   316.618179: dma_buf_get: exp_name=qcom,system size=12771328 ino=2762 fd=176
    RenderThread-9293    [006] ...1.   316.618195: dma_buf_dynamic_attach: exp_name=qcom,system size=12771328 ino=2762 attachment:ffffff880a18dd00 is_dynamic=0 dev_name=kgsl-3d0
    RenderThread-9293    [006] ...1.   318.878220: dma_buf_detach: exp_name=qcom,system size=12771328 ino=2762 attachment:ffffff880a18dd00 is_dynamic=0 dev_name=kgsl-3d0

Signed-off-by: Xiang Gao <gaoxiang17@xiaomi.com>
---
 drivers/dma-buf/dma-buf.c      |  51 ++++++++++-
 include/trace/events/dma_buf.h | 157 +++++++++++++++++++++++++++++++++
 2 files changed, 206 insertions(+), 2 deletions(-)
 create mode 100644 include/trace/events/dma_buf.h

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index edaa9e4ee4ae..59a5261cb26b 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -35,6 +35,28 @@
 
 #include "dma-buf-sysfs-stats.h"
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/dma_buf.h>
+
+/*
+ * dmabuf->name must be accessed with holding dmabuf->name_lock.
+ * we need to take the lock around the tracepoint call itself where
+ * it is called in the code.
+ *
+ * Note: FUNC##_enabled() is a static branch that will only
+ *       be set when the trace event is enabled.
+ */
+#define DMA_BUF_TRACE(FUNC, ...)					\
+	do {											\
+		if (FUNC##_enabled()) {						\
+			guard(spinlock)(&dmabuf->name_lock);	\
+			FUNC(__VA_ARGS__);						\
+		} else if (IS_ENABLED(CONFIG_LOCKDEP)) {	\
+			/* Expose this lock when lockdep is enabled */	\
+			guard(spinlock)(&dmabuf->name_lock);	\
+		}											\
+	} while (0)
+
 static inline int is_dma_buf_file(struct file *);
 
 static DEFINE_MUTEX(dmabuf_list_mutex);
@@ -220,6 +242,8 @@ static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
 	    dmabuf->size >> PAGE_SHIFT)
 		return -EINVAL;
 
+	DMA_BUF_TRACE(trace_dma_buf_mmap_internal, dmabuf);
+
 	return dmabuf->ops->mmap(dmabuf, vma);
 }
 
@@ -745,6 +769,8 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 
 	__dma_buf_list_add(dmabuf);
 
+	DMA_BUF_TRACE(trace_dma_buf_export, dmabuf);
+
 	return dmabuf;
 
 err_dmabuf:
@@ -768,10 +794,16 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_export, "DMA_BUF");
  */
 int dma_buf_fd(struct dma_buf *dmabuf, int flags)
 {
+	int fd;
+
 	if (!dmabuf || !dmabuf->file)
 		return -EINVAL;
 
-	return FD_ADD(flags, dmabuf->file);
+	fd = FD_ADD(flags, dmabuf->file);
+	if (fd >= 0)
+		DMA_BUF_TRACE(trace_dma_buf_fd, dmabuf, fd);
+
+	return fd;
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_fd, "DMA_BUF");
 
@@ -786,6 +818,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_fd, "DMA_BUF");
 struct dma_buf *dma_buf_get(int fd)
 {
 	struct file *file;
+	struct dma_buf *dmabuf;
 
 	file = fget(fd);
 
@@ -797,7 +830,11 @@ struct dma_buf *dma_buf_get(int fd)
 		return ERR_PTR(-EINVAL);
 	}
 
-	return file->private_data;
+	dmabuf = file->private_data;
+
+	DMA_BUF_TRACE(trace_dma_buf_get, dmabuf, fd);
+
+	return dmabuf;
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_get, "DMA_BUF");
 
@@ -817,6 +854,8 @@ void dma_buf_put(struct dma_buf *dmabuf)
 		return;
 
 	fput(dmabuf->file);
+
+	DMA_BUF_TRACE(trace_dma_buf_put, dmabuf);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_put, "DMA_BUF");
 
@@ -971,6 +1010,9 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 	list_add(&attach->node, &dmabuf->attachments);
 	dma_resv_unlock(dmabuf->resv);
 
+	DMA_BUF_TRACE(trace_dma_buf_dynamic_attach, dmabuf, attach,
+		dma_buf_attachment_is_dynamic(attach), dev);
+
 	return attach;
 
 err_attach:
@@ -1015,6 +1057,9 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
 	if (dmabuf->ops->detach)
 		dmabuf->ops->detach(dmabuf, attach);
 
+	DMA_BUF_TRACE(trace_dma_buf_detach, dmabuf, attach,
+		dma_buf_attachment_is_dynamic(attach), attach->dev);
+
 	kfree(attach);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_detach, "DMA_BUF");
@@ -1480,6 +1525,8 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
 	vma_set_file(vma, dmabuf->file);
 	vma->vm_pgoff = pgoff;
 
+	DMA_BUF_TRACE(trace_dma_buf_mmap, dmabuf);
+
 	return dmabuf->ops->mmap(dmabuf, vma);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, "DMA_BUF");
diff --git a/include/trace/events/dma_buf.h b/include/trace/events/dma_buf.h
new file mode 100644
index 000000000000..35f8140095f4
--- /dev/null
+++ b/include/trace/events/dma_buf.h
@@ -0,0 +1,157 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM dma_buf
+
+#if !defined(_TRACE_DMA_BUF_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_DMA_BUF_H
+
+#include <linux/dma-buf.h>
+#include <linux/tracepoint.h>
+
+DECLARE_EVENT_CLASS(dma_buf,
+
+	TP_PROTO(struct dma_buf *dmabuf),
+
+	TP_ARGS(dmabuf),
+
+	TP_STRUCT__entry(
+		__string(exp_name, dmabuf->exp_name)
+		__field(size_t, size)
+		__field(ino_t, ino)
+	),
+
+	TP_fast_assign(
+		__assign_str(exp_name);
+		__entry->size = dmabuf->size;
+		__entry->ino = dmabuf->file->f_inode->i_ino;
+	),
+
+	TP_printk("exp_name=%s size=%zu ino=%lu",
+		  __get_str(exp_name),
+		  __entry->size,
+		  __entry->ino)
+);
+
+DECLARE_EVENT_CLASS(dma_buf_attach_dev,
+
+	TP_PROTO(struct dma_buf *dmabuf, struct dma_buf_attachment *attach,
+		bool is_dynamic, struct device *dev),
+
+	TP_ARGS(dmabuf, attach, is_dynamic, dev),
+
+	TP_STRUCT__entry(
+		__string(dev_name, dev_name(dev))
+		__string(exp_name, dmabuf->exp_name)
+		__field(size_t, size)
+		__field(ino_t, ino)
+		__field(struct dma_buf_attachment *, attach)
+		__field(bool, is_dynamic)
+	),
+
+	TP_fast_assign(
+		__assign_str(dev_name);
+		__assign_str(exp_name);
+		__entry->size = dmabuf->size;
+		__entry->ino = dmabuf->file->f_inode->i_ino;
+		__entry->is_dynamic = is_dynamic;
+		__entry->attach = attach;
+	),
+
+	TP_printk("exp_name=%s size=%zu ino=%lu attachment:%p is_dynamic=%d dev_name=%s",
+		  __get_str(exp_name),
+		  __entry->size,
+		  __entry->ino,
+		  __entry->attach,
+		  __entry->is_dynamic,
+		  __get_str(dev_name))
+);
+
+DECLARE_EVENT_CLASS(dma_buf_fd,
+
+	TP_PROTO(struct dma_buf *dmabuf, int fd),
+
+	TP_ARGS(dmabuf, fd),
+
+	TP_STRUCT__entry(
+		__string(exp_name, dmabuf->exp_name)
+		__field(size_t, size)
+		__field(ino_t, ino)
+		__field(int, fd)
+	),
+
+	TP_fast_assign(
+		__assign_str(exp_name);
+		__entry->size = dmabuf->size;
+		__entry->ino = dmabuf->file->f_inode->i_ino;
+		__entry->fd = fd;
+	),
+
+	TP_printk("exp_name=%s size=%zu ino=%lu fd=%d",
+		  __get_str(exp_name),
+		  __entry->size,
+		  __entry->ino,
+		  __entry->fd)
+);
+
+DEFINE_EVENT(dma_buf, dma_buf_export,
+
+	TP_PROTO(struct dma_buf *dmabuf),
+
+	TP_ARGS(dmabuf)
+);
+
+DEFINE_EVENT(dma_buf, dma_buf_mmap_internal,
+
+	TP_PROTO(struct dma_buf *dmabuf),
+
+	TP_ARGS(dmabuf)
+);
+
+DEFINE_EVENT(dma_buf, dma_buf_mmap,
+
+	TP_PROTO(struct dma_buf *dmabuf),
+
+	TP_ARGS(dmabuf)
+);
+
+DEFINE_EVENT(dma_buf, dma_buf_put,
+
+	TP_PROTO(struct dma_buf *dmabuf),
+
+	TP_ARGS(dmabuf)
+);
+
+DEFINE_EVENT(dma_buf_attach_dev, dma_buf_dynamic_attach,
+
+	TP_PROTO(struct dma_buf *dmabuf, struct dma_buf_attachment *attach,
+		bool is_dynamic, struct device *dev),
+
+	TP_ARGS(dmabuf, attach, is_dynamic, dev)
+);
+
+DEFINE_EVENT(dma_buf_attach_dev, dma_buf_detach,
+
+	TP_PROTO(struct dma_buf *dmabuf, struct dma_buf_attachment *attach,
+		bool is_dynamic, struct device *dev),
+
+	TP_ARGS(dmabuf, attach, is_dynamic, dev)
+);
+
+DEFINE_EVENT(dma_buf_fd, dma_buf_fd,
+
+	TP_PROTO(struct dma_buf *dmabuf, int fd),
+
+	TP_ARGS(dmabuf, fd)
+);
+
+DEFINE_EVENT(dma_buf_fd, dma_buf_get,
+
+	TP_PROTO(struct dma_buf *dmabuf, int fd),
+
+	TP_ARGS(dmabuf, fd)
+);
+
+#endif /* _TRACE_DMA_BUF_H */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
-- 
2.34.1


