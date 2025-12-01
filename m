Return-Path: <linux-media+bounces-47944-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 18891C96DE2
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 12:22:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8F25F342F49
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 11:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D54F42561AB;
	Mon,  1 Dec 2025 11:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NliXAGQu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47DF248898
	for <linux-media@vger.kernel.org>; Mon,  1 Dec 2025 11:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764588118; cv=none; b=JeC7UulDoUuFS77gu8ISgAp/L/qf0BcAw6okft16JTrdw5zvO+PLds8YWZraOX7lS80eEDwQO7hLW8U+R5lllN1Xu0tQNaueR4Q4+wY+a5PS4vB8M7qw+/yKckgJP1Ti3TvlbqRJDFMcbjbgP2nFXdQfQH2CBBE6tzuKqYuAYoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764588118; c=relaxed/simple;
	bh=VPMcWZXlPTKSjZXc32gmCjWBiBsJ4i0jSQ1HiFRWSVw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WyuLysXC3sA0npTQ1t0NXXLpy+6zNpLT5zFzX9htBCp2Zaj1hgmi8fgfGlfvhq6Gd9O2pkwyymQzcKZ7C0Dg8YBPFyP+fgayinKxDS/cVirOkbrn1Mu8r6FOuZDHvBdhuQ7FV6jbvxnx2MvqFcOidqeVDR3rcHZrUssqSqMQQfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NliXAGQu; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7d26a7e5639so4184469b3a.1
        for <linux-media@vger.kernel.org>; Mon, 01 Dec 2025 03:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764588116; x=1765192916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FLEoVh5V6KL4DPldRLgtrXwzYkYlClTOMyNoGl8minI=;
        b=NliXAGQuMdYIcu+Zl0Egk2GWw4XrYTTO1KAfWgSO0PrkBJTLMcTSzXy2mAWUL97CbU
         RzU/8TSUhlIf2bdro7R8uuynZ2AsPHyGl/lZSOGY39O6Qp19Fucdh7yJjQKFWTG5aZe+
         mcry3bfkI1LTJiO0lI7YmYFj63jdhqJ4VJ0dJd66r8ZQNK+qoj+Y7aeCaJvFV/w/UHyo
         lbofutTbtw54JsFfMO1jw9dpwxORzUP/ztI22/otR3jx/1an428SIChxjjPKwcXlH7wC
         UhbOZn/iSxi7eMP6AV+c0sqhlZbbIsRcJmbFgrK+SaKAwt3eu58Yuy+x82yGhT9r9EDy
         Z23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764588116; x=1765192916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FLEoVh5V6KL4DPldRLgtrXwzYkYlClTOMyNoGl8minI=;
        b=UnWZv+jA7MVy2E7N1CekdqGpw1fNHsg8252QZVGRImRMSAWfPRsaFeLWqV14jon9Q7
         R1PoQUr3qCRFjTQ5wzNHPfomGAG6wMlUmPfguKuD7kjGlpqW+8ML/9OXcKXm+3bdyO0Z
         PmPeSLnQKovLBetDKOs3074guFQE8uJ22BNH0t17TZcvVhbI2COzwjRWpCY2UGH7Qh+q
         6HZldjpmzMXxhNA1haWToAY7yruBFIZA4eNu5ZNh1ysWH58NTwvnFj2U1jXI8p2ZRh+1
         k/K+Y6epTCvEqz12qXIY6HzGYA8Hyn4giRem94J/LLkB+ZR0vBia82aPhvBayH7sGKaV
         8B1A==
X-Gm-Message-State: AOJu0YxeL7X6ocn9DiujOd3EfXA4mLevR8vMQ4l/RNc1Mh+SOB7Q7nPx
	1IcsC+SZ657GJTnMouJrQ4rv6rNvAAsefy16tMXuFCDgwrwgLW2UI4nV
X-Gm-Gg: ASbGncsfTpH2mh3Xx1fbYleomrYb7mGppM8KTEiAo/GXNu0QmaJoRWUEbDHUw5yWxyq
	JvU9E8nHOCEuirdC66aUhN1syaU30mTPuos4NgQrrtHO4Vl0C0Ni0r2sHN9M2qUqQmbfeWJdiz3
	PSpXv/NgF/2l5OHmXIkLzldN73Vj8ZA2BmWBq6rPkqkSn7wqW4+kfCe1Jsgx9E7FR9karGZTSBr
	Sf5Kewg7cQYUrFM3MWPJ7+uboKO79VMPVZl9xfqVpCW9Yp16Laos4Ba1CybbZS9PTMiqJOSrQMZ
	/bCmkeFujapJaXePdUcY0LKtcn+l5LE1C+nPBKSWoI5rdRSV7tqHtNUPvQL2M6vMPZuFezytOTE
	Ka7aEr72X8dqbo6qWYRj6RvHzSCNgF/8CsimBtdy4v9MsQj8ed24tvlb7y/ORen/sTDwnNXOzxO
	4mQyP3X7xxZ1f71lwSKpfLcNkQLNQu2Lg=
X-Google-Smtp-Source: AGHT+IG8yzad/QJdYWQN8COSv2tXagPdX30bTvEdOFoh8MH8FuOVBDhI+7MvQ4WDkTSTqw06Vd9UnA==
X-Received: by 2002:a05:6a00:9a4:b0:7b1:79be:1273 with SMTP id d2e1a72fcca58-7c58e608b0fmr40271597b3a.26.1764588115849;
        Mon, 01 Dec 2025 03:21:55 -0800 (PST)
Received: from xiao.mioffice.cn ([43.224.245.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15fb1486asm13213642b3a.61.2025.12.01.03.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 03:21:55 -0800 (PST)
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
Subject: [PATCH v5] dma-buf: add some tracepoints to debug.
Date: Mon,  1 Dec 2025 19:21:48 +0800
Message-Id: <20251201112148.843572-1-gxxa03070307@gmail.com>
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
 drivers/dma-buf/dma-buf.c      |  34 +++++++-
 include/trace/events/dma_buf.h | 154 +++++++++++++++++++++++++++++++++
 2 files changed, 187 insertions(+), 1 deletion(-)
 create mode 100644 include/trace/events/dma_buf.h

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 2bcf9ceca997..fc05e2114922 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -35,6 +35,17 @@
 
 #include "dma-buf-sysfs-stats.h"
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/dma_buf.h>
+
+#define DMA_BUF_TRACE(FUNC, ...)                  \
+    do {                                          \
+        if (FUNC##_enabled()) {                   \
+            guard(spinlock)(&dmabuf->name_lock); \
+            FUNC(__VA_ARGS__);                    \
+        }                                         \
+    } while (0)
+
 static inline int is_dma_buf_file(struct file *);
 
 static DEFINE_MUTEX(dmabuf_list_mutex);
@@ -220,6 +231,8 @@ static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
 	    dmabuf->size >> PAGE_SHIFT)
 		return -EINVAL;
 
+	DMA_BUF_TRACE(trace_dma_buf_mmap_internal, dmabuf);
+
 	return dmabuf->ops->mmap(dmabuf, vma);
 }
 
@@ -745,6 +758,8 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 
 	__dma_buf_list_add(dmabuf);
 
+	DMA_BUF_TRACE(trace_dma_buf_export, dmabuf);
+
 	return dmabuf;
 
 err_dmabuf:
@@ -779,6 +794,8 @@ int dma_buf_fd(struct dma_buf *dmabuf, int flags)
 
 	fd_install(fd, dmabuf->file);
 
+	DMA_BUF_TRACE(trace_dma_buf_fd, dmabuf, fd);
+
 	return fd;
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_fd, "DMA_BUF");
@@ -794,6 +811,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_fd, "DMA_BUF");
 struct dma_buf *dma_buf_get(int fd)
 {
 	struct file *file;
+	struct dma_buf *dmabuf;
 
 	file = fget(fd);
 
@@ -805,7 +823,11 @@ struct dma_buf *dma_buf_get(int fd)
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
 
@@ -825,6 +847,8 @@ void dma_buf_put(struct dma_buf *dmabuf)
 		return;
 
 	fput(dmabuf->file);
+
+	DMA_BUF_TRACE(trace_dma_buf_put, dmabuf);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_put, "DMA_BUF");
 
@@ -979,6 +1003,9 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 	list_add(&attach->node, &dmabuf->attachments);
 	dma_resv_unlock(dmabuf->resv);
 
+	DMA_BUF_TRACE(trace_dma_buf_dynamic_attach, dmabuf, attach,
+		dma_buf_attachment_is_dynamic(attach), dev);
+
 	return attach;
 
 err_attach:
@@ -1023,6 +1050,9 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
 	if (dmabuf->ops->detach)
 		dmabuf->ops->detach(dmabuf, attach);
 
+	DMA_BUF_TRACE(trace_dma_buf_detach, dmabuf, attach,
+		dma_buf_attachment_is_dynamic(attach), attach->dev);
+
 	kfree(attach);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_detach, "DMA_BUF");
@@ -1488,6 +1518,8 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
 	vma_set_file(vma, dmabuf->file);
 	vma->vm_pgoff = pgoff;
 
+	DMA_BUF_TRACE(trace_dma_buf_mmap, dmabuf);
+
 	return dmabuf->ops->mmap(dmabuf, vma);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, "DMA_BUF");
diff --git a/include/trace/events/dma_buf.h b/include/trace/events/dma_buf.h
new file mode 100644
index 000000000000..81ee4d05979c
--- /dev/null
+++ b/include/trace/events/dma_buf.h
@@ -0,0 +1,154 @@
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
+	TP_PROTO(struct dma_buf *dmabuf, struct dma_buf_attachment *attach, bool is_dynamic, struct device *dev),
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
+	TP_PROTO(struct dma_buf *dmabuf, struct dma_buf_attachment *attach, bool is_dynamic, struct device *dev),
+
+	TP_ARGS(dmabuf, attach, is_dynamic, dev)
+);
+
+DEFINE_EVENT(dma_buf_attach_dev, dma_buf_detach,
+
+	TP_PROTO(struct dma_buf *dmabuf, struct dma_buf_attachment *attach, bool is_dynamic, struct device *dev),
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


