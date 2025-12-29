Return-Path: <linux-media+bounces-49620-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 794C5CE5CF1
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 04:16:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1EB68300A341
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 03:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3A4C2253A1;
	Mon, 29 Dec 2025 03:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lp/4jH3i"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DC81DF73A
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 03:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766978157; cv=none; b=jlmQaImW8SfQ5YPAMt+ADPpifteJOceuZGv2P5Zsj3QsKwUGvxCvlF/M2o2ROxqVPQlggKF73E6LVLwlE7EZiABFdNvnW91+FbZPWU4tXFFpGjxEkPcmP//Lb/j0X8+/e/FxOiNSL/0yy9CtROTYPG9DBOVlM3bDM0P36irD09Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766978157; c=relaxed/simple;
	bh=tjLDeYcpl/vpg2S6X8j0JtmfiEoYZ1rjjdk8EACqhpo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=u/1lPW5+A/OykhWgQvGH54Psw9YTbWyvTcAUCapTiAJr64RlIEGcPqRj+R1pDtyZm73xcpaqPSZkZSOvASO+yVatTDpBjQ2zims7nziQa3ta6HdK9F+q1jnduVd2Ft5kDRDAxzX1+gz9t81nJAOjrtq1uJZotdTxc2rTWhpbTM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lp/4jH3i; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7f651586be1so4109501b3a.1
        for <linux-media@vger.kernel.org>; Sun, 28 Dec 2025 19:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766978155; x=1767582955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6kLoZB5QMQc+K/aIrEr+4NYhtJKe9kWjjOywPC1m2Es=;
        b=Lp/4jH3iVLt3MNri1oYdsiyobKqTsAHENFM1ku+fsTeV17TwYhjjjHvBytg35LGVp4
         hmzZaBcDxFXz207z90KEOtRmeKRRdpUINBepl+bFMx1Aynz3DLCHVIeUDY2sRtpc91Lj
         7/Eym6aS617DsD4l02cWlg+dDfuTo2c1rVhHcsleBlMuFJWJ43iE4DcyYcm71uUC8dKb
         UHrIg2Jp/ptpNgvxZGLsc8xRFOMS3Scjr+ORzj76vRAuiymmawd5EvwXG9NzoCsWjGix
         020cCQdRVz9vnU0Qs0qzzST7omjGbsEzCziYrNxOh7+2aTDJzSYBj74JuOXI7KLk0M7B
         d4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766978155; x=1767582955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6kLoZB5QMQc+K/aIrEr+4NYhtJKe9kWjjOywPC1m2Es=;
        b=P/SzyVYvKAmniGN/yni3Kbw7I1s+3BgSXMLxDsIKG/J2CYNmkE3A3t/mPVQzdisxRB
         Jf7V47Ykb1g0b6sL8Ed+R8C1ivNn4JdHcB+qoO9zAJq7CO6+xnXg+Yue2wv7hjENjqEk
         o6dg4LN3EMAXjXiy1xM8yL2uv+eQN924JBafdSSE/57hKju7S9dJZt3w2U5T8Y2I1jgj
         3NaTi7Y+Jo7VnxHAh4rFBtiXyZVOp/PDDeOk1EDPApouOvWELNbKHWPJkueQKOsYOiWs
         k2UaFS0l9YQz2J2egKwNs69zDOcYxJKZawCerOB1+WY24NF/6uDQmyGKpYlr8PHxS0jh
         M/5A==
X-Gm-Message-State: AOJu0Yy+I47S1Hnkt0qpiRR7mXfiv/CeLSVGGEO8P63Y+IGAQn76pzrs
	eg+XYbVns4VJOmIJs7rO9JuVtiF34jScRNAeMIEJ45VQqs86Yglf74fO
X-Gm-Gg: AY/fxX4mbGQ7ZPaFzrEUZfoAGQUJpLnoCaUrByBYTG+Ja/YLxKsBYM02N8A15IN7Ijs
	pjcQoYjZTfhOe3cRqEYb+CMlPpdrTVZ5wHbeCVlZ/bFC+U+DthNhQW0SpjPqkvjjS82B6KYOGol
	tDB1/T9+D0UZ8vtQzQrY8NQsuYNOgYbMF93Rh/i+VDD3BkOYkCJBt4TIFwai6iSBVMOvmJml+ZJ
	vcoZzIVjj/BYngx7qaQnG4M4Piix3Toq9VQZt50C8qWciTARK8n7sbKTM/YCpvvuOAeKZP8XRqo
	IVnVqk0uSuhlfXVXO+JtmvDVW1t+5dVkrEPWrUuJ9T0WIz/BFkmgF7nDNgYzaahLR5OC2b2Ptfq
	W6V6rxFwDKaNhWVuz5g5VIps0R2HyJAlF3exaxxQh1uJXExlVumbFyG6RnIcZLnDlVvtY1Bz7eh
	70d9Zw9Qbz1rTw9CyUuOFvaoYUweKtxYQ=
X-Google-Smtp-Source: AGHT+IFaS92fvg7qIdSkG8OVXret7v/N5DAvufFQ6j12Iv44PrQ8ceHxTlqDy0oxGWdWmtlvryWrgQ==
X-Received: by 2002:a05:6a00:451c:b0:7e8:3fcb:bc46 with SMTP id d2e1a72fcca58-7ff54c01878mr28259482b3a.27.1766978154707;
        Sun, 28 Dec 2025 19:15:54 -0800 (PST)
Received: from xiao.mioffice.cn ([43.224.245.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7af2b537sm27529677b3a.20.2025.12.28.19.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 19:15:54 -0800 (PST)
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
Subject: [PATCH v12] dma-buf: add some tracepoints to debug.
Date: Mon, 29 Dec 2025 11:15:47 +0800
Message-Id: <20251229031547.59272-1-gxxa03070307@gmail.com>
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

Changes since v11: https://lore.kernel.org/all/20251225121119.2194228-1-gxxa03070307@gmail.com/
- Lined up the backslashes nicely for the macro DMA_BUF_TRACE.
- Used DEFINE_EVENT_CONDITION() to move the condition branch into the tracepoint.

Changes since v10: https://lore.kernel.org/all/20251224013455.1649879-1-gxxa03070307@gmail.com/
- Always expose dmabuf->name_lock if lockdep is enabled.

Changes since v9: https://lore.kernel.org/all/20251223032749.1371913-1-gxxa03070307@gmail.com/
- Fixed some whitespace issues with the macro DMA_BUF_TRACE again.

Changes since v8: https://lore.kernel.org/all/20251218062853.819744-1-gxxa03070307@gmail.com/
- Expose dmabuf->name_lock when lockdep is enabled but trace event is not.

Changes since v7: https://lore.kernel.org/all/20251217105132.643300-1-gxxa03070307@gmail.com/
- Fixed some whitespace issues with the macro DMA_BUF_TRACE.

Changes since v6: https://lore.kernel.org/all/20251216063952.516364-1-gxxa03070307@gmail.com/
- Add a comment for the macro DMA_BUF_TRACE.

Changes since v5: https://lore.kernel.org/all/20251201112148.843572-1-gxxa03070307@gmail.com/
- Add the macro DMA_BUF_TRACE.
- Modify the commit message.

Changes since v4: https://lore.kernel.org/all/20251128085215.550100-1-gxxa03070307@gmail.com/
- Remove the tracepoints exporting.
- Remove the file refcount for the trace.
- Print the dev_name last.
- Add the parameter of whether dma_buf attachment is dynamic.

Changes since v3: https://lore.kernel.org/all/20251127004352.376307-1-gxxa03070307@gmail.com/
- Take the dmabuf->name_lock around the tracepoint call itself.
- Used DECLARE_EVENT_CLASS() and a DEFINE_EVENT().

Changes since v2: https://lore.kernel.org/all/20251125162949.220488-1-gxxa03070307@gmail.com/
- Add more explanation to the commit message.

 drivers/dma-buf/dma-buf.c      |  48 +++++++++-
 include/trace/events/dma_buf.h | 159 +++++++++++++++++++++++++++++++++
 2 files changed, 205 insertions(+), 2 deletions(-)
 create mode 100644 include/trace/events/dma_buf.h

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index edaa9e4ee4ae..dee59d4c0b12 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -35,6 +35,26 @@
 
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
+	do {								\
+		/* Always expose lock if lockdep is enabled */		\
+		if (IS_ENABLED(CONFIG_LOCKDEP) || FUNC##_enabled()) {	\
+			guard(spinlock)(&dmabuf->name_lock);		\
+			FUNC(__VA_ARGS__);				\
+		}							\
+	} while (0)
+
 static inline int is_dma_buf_file(struct file *);
 
 static DEFINE_MUTEX(dmabuf_list_mutex);
@@ -220,6 +240,8 @@ static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
 	    dmabuf->size >> PAGE_SHIFT)
 		return -EINVAL;
 
+	DMA_BUF_TRACE(trace_dma_buf_mmap_internal, dmabuf);
+
 	return dmabuf->ops->mmap(dmabuf, vma);
 }
 
@@ -745,6 +767,8 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 
 	__dma_buf_list_add(dmabuf);
 
+	DMA_BUF_TRACE(trace_dma_buf_export, dmabuf);
+
 	return dmabuf;
 
 err_dmabuf:
@@ -768,10 +792,15 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_export, "DMA_BUF");
  */
 int dma_buf_fd(struct dma_buf *dmabuf, int flags)
 {
+	int fd;
+
 	if (!dmabuf || !dmabuf->file)
 		return -EINVAL;
 
-	return FD_ADD(flags, dmabuf->file);
+	fd = FD_ADD(flags, dmabuf->file);
+	DMA_BUF_TRACE(trace_dma_buf_fd, dmabuf, fd);
+
+	return fd;
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_fd, "DMA_BUF");
 
@@ -786,6 +815,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_fd, "DMA_BUF");
 struct dma_buf *dma_buf_get(int fd)
 {
 	struct file *file;
+	struct dma_buf *dmabuf;
 
 	file = fget(fd);
 
@@ -797,7 +827,11 @@ struct dma_buf *dma_buf_get(int fd)
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
 
@@ -817,6 +851,8 @@ void dma_buf_put(struct dma_buf *dmabuf)
 		return;
 
 	fput(dmabuf->file);
+
+	DMA_BUF_TRACE(trace_dma_buf_put, dmabuf);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_put, "DMA_BUF");
 
@@ -971,6 +1007,9 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 	list_add(&attach->node, &dmabuf->attachments);
 	dma_resv_unlock(dmabuf->resv);
 
+	DMA_BUF_TRACE(trace_dma_buf_dynamic_attach, dmabuf, attach,
+		dma_buf_attachment_is_dynamic(attach), dev);
+
 	return attach;
 
 err_attach:
@@ -1015,6 +1054,9 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
 	if (dmabuf->ops->detach)
 		dmabuf->ops->detach(dmabuf, attach);
 
+	DMA_BUF_TRACE(trace_dma_buf_detach, dmabuf, attach,
+		dma_buf_attachment_is_dynamic(attach), attach->dev);
+
 	kfree(attach);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_detach, "DMA_BUF");
@@ -1480,6 +1522,8 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
 	vma_set_file(vma, dmabuf->file);
 	vma->vm_pgoff = pgoff;
 
+	DMA_BUF_TRACE(trace_dma_buf_mmap, dmabuf);
+
 	return dmabuf->ops->mmap(dmabuf, vma);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, "DMA_BUF");
diff --git a/include/trace/events/dma_buf.h b/include/trace/events/dma_buf.h
new file mode 100644
index 000000000000..3bb88d05bcc8
--- /dev/null
+++ b/include/trace/events/dma_buf.h
@@ -0,0 +1,159 @@
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
+		__string(	exp_name,		dmabuf->exp_name)
+		__field(	size_t,			size)
+		__field(	ino_t,			ino)
+	),
+
+	TP_fast_assign(
+		__assign_str(exp_name);
+		__entry->size	= dmabuf->size;
+		__entry->ino	= dmabuf->file->f_inode->i_ino;
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
+		__string(	dev_name,			dev_name(dev))
+		__string(	exp_name,			dmabuf->exp_name)
+		__field(	size_t,				size)
+		__field(	ino_t,				ino)
+		__field(	struct dma_buf_attachment *,	attach)
+		__field(	bool,				is_dynamic)
+	),
+
+	TP_fast_assign(
+		__assign_str(dev_name);
+		__assign_str(exp_name);
+		__entry->size		= dmabuf->size;
+		__entry->ino		= dmabuf->file->f_inode->i_ino;
+		__entry->is_dynamic	= is_dynamic;
+		__entry->attach		= attach;
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
+		__string(	exp_name,		dmabuf->exp_name)
+		__field(	size_t,			size)
+		__field(	ino_t,			ino)
+		__field(	int,			fd)
+	),
+
+	TP_fast_assign(
+		__assign_str(exp_name);
+		__entry->size	= dmabuf->size;
+		__entry->ino	= dmabuf->file->f_inode->i_ino;
+		__entry->fd	= fd;
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
+DEFINE_EVENT_CONDITION(dma_buf_fd, dma_buf_fd,
+
+	TP_PROTO(struct dma_buf *dmabuf, int fd),
+
+	TP_ARGS(dmabuf, fd),
+
+	TP_CONDITION(fd >= 0)
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


