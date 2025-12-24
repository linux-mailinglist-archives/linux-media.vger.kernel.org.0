Return-Path: <linux-media+bounces-49432-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E400CDB149
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 02:35:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DEF853027D88
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 01:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CB3427B4FB;
	Wed, 24 Dec 2025 01:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ho5Df/GZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B903C26B2D3
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 01:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766540105; cv=none; b=UjOLgsOUEjFjL8tgtCf5Cy5GGuCBB/DRjKiZLXdli2TR85/Ex9BXOdwoyaH7xjlf0a/6PEWJpHc7kVCncCF4pHjQ+0gkrF2Z4u9rubEZp+9f7go8cZ1own/VPhH+TVCshrFQp2hnFlDUCZEPRPNyKP16pcTNdretIDffGncO3o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766540105; c=relaxed/simple;
	bh=Tv4vtw7Tbr+wgMrHd9/3cbmNcKI2RBnt+0OwiSlgBuU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H1+rzoziJW66xAzNh1e3YniOtbTNfnnANsQ5kzcQVyKTjmr9hrgh8nKfKslpMvGpYLxa5uPATpD8ZJDNuaxNLJOEGm/P5G6M6iI4hfZtgsYkJEa+q2UBnpXt+NNin0S0r16bT7ZtWh5wzcHSJDPkOJl/12taG5Y8YtUu/TrRjxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ho5Df/GZ; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7f0db5700b2so4960471b3a.0
        for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 17:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766540103; x=1767144903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eLgDSVcqpjH9P0lPmmEO0GCItc6WAA5nc00aszWHtzk=;
        b=Ho5Df/GZZUCIZOrlM8/PQRX3Q0cZM3cUAcClf1msdbC5TWpwagfNaH/TtOsszo77mO
         BkS0Gfn3jRd8CpwHO70z3EBC3faoZvnf+CResrUQZzJnefZHwT1DooIXp0EyrqpY8lAz
         081g4VguqQjrWh32HeyWFCO1OHbfKHFxHAwg76Q/06La/qcwoeuu9HpmKhPYhFUzFnq/
         5+ZGp5ipQKGyTCilTCkkFL651nQTY+15UT+zQWl2qq0+SH7lvOHmuMJZpLeZRUX0mlli
         imC81vEkwKhsjxHgEoJGwjNamJ1rEWITjovKUqtbl/9hkWavC+p6t1OWU2Hj6o8Vcbyz
         1Hpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766540103; x=1767144903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLgDSVcqpjH9P0lPmmEO0GCItc6WAA5nc00aszWHtzk=;
        b=YBlJcbCGZeFOYQormzWJfx8IRZLTBmbz64wyNW8AYjiJqWBgeEGrsuJf8npVxU3OXx
         9tNvkhYp9oDz2bKPJmvG6cSyoN7xhcjt5wRcRS3tqN4yVvrtocdAMT2OX7AWH5ww7Icz
         cEB77LmMgeIfWzG76xKpIrYxb9hU5Yh5QhC0NjO+81ZT2dHyC/3mKWpzNdTTqKTF9stz
         2DFNv6xjjBlL8/DLKkggH6ePzbyFI8Frxb2eM9lzeZ/Mf/qfYG1qwqz/TU2VyRMMN2vl
         2wyzaPnn8q9O6r+Gkp5hp9Q06rAmbuCHZr8Oeb62xthob3f4B2xebR7cGFwbyfqeMeUR
         LD4A==
X-Gm-Message-State: AOJu0YzYA44X4Etzx+PDCRjcGnBphQrlW1UM8TDlXGWm82UvcEu3TvC5
	Yd97akkQnZQFhh0C3Czti5dud3M+9ULriH6Ge6usIKp/wb+OjOsKxqIY
X-Gm-Gg: AY/fxX4FzHgo2yuulPSWoJc6I4UTqCZACmpG6U0fk+J8jFNoeJeVafelKFB0Mw7ZkvJ
	ji6r/wMA6OwOf826wL5BGIvm0qD8Y5CqWtYDdnAFOV5jx67rRZd/Yn5e2e6kX2Aks+F8P+cpuOv
	+aNAkIPZBGOs9vYdcXBcPGSYF8iPUUG5QXGH12pEF+Iu0S/eCOJbnsnoZN0Mkct3Fro1b4nv5Fk
	QXIezsijl70HiUeZWJzJXVy2fDYQVLnM+PKjn2ojjailTJy50GgkXfcfE444YF5+AEE0Q2Kmb6a
	M7VVP5l9kSOSPTDMD8zaRKhkzaRkZ8Kvfwezkptlch6fqflhBO24T6Q3tZon+kF7BLVAodapqwv
	u5pzZ9ctciHZmiv52Vavx9ud5mofRgTkKz7D6XBG0XmFcC5CYMyb6iQVMpRddWWvIv9ltqTwQt3
	fExJPyHDo4/Xxg5BKpmRzj
X-Google-Smtp-Source: AGHT+IFTBuM3TfizJm1mOjlbks6r4SS68r/TDo9u052WC6bOg2K+nOmrc49Dnw3fRCDvPURsdk9ABQ==
X-Received: by 2002:a05:6a20:9392:b0:366:14af:9bc2 with SMTP id adf61e73a8af0-376ab2e7a5dmr14766328637.76.1766540102836;
        Tue, 23 Dec 2025 17:35:02 -0800 (PST)
Received: from xiao.mioffice.cn ([43.224.245.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e682870sm14956614b3a.57.2025.12.23.17.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 17:35:02 -0800 (PST)
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
Subject: [PATCH v10] dma-buf: add some tracepoints to debug.
Date: Wed, 24 Dec 2025 09:34:55 +0800
Message-Id: <20251224013455.1649879-1-gxxa03070307@gmail.com>
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
 drivers/dma-buf/dma-buf.c      |  49 +++++++++-
 include/trace/events/dma_buf.h | 157 +++++++++++++++++++++++++++++++++
 2 files changed, 204 insertions(+), 2 deletions(-)
 create mode 100644 include/trace/events/dma_buf.h

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index edaa9e4ee4ae..5e6f65cd0306 100644
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
+	do {											\
+		/* Always expose lock if lockdep is enabled */ 	\
+		if (IS_ENABLED(CONFIG_LOCKDEP) || FUNC##_enabled()) {						\
+			guard(spinlock)(&dmabuf->name_lock);	\
+			FUNC(__VA_ARGS__);						\
+		}											\
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
@@ -768,10 +792,16 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_export, "DMA_BUF");
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
 
@@ -786,6 +816,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_fd, "DMA_BUF");
 struct dma_buf *dma_buf_get(int fd)
 {
 	struct file *file;
+	struct dma_buf *dmabuf;
 
 	file = fget(fd);
 
@@ -797,7 +828,11 @@ struct dma_buf *dma_buf_get(int fd)
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
 
@@ -817,6 +852,8 @@ void dma_buf_put(struct dma_buf *dmabuf)
 		return;
 
 	fput(dmabuf->file);
+
+	DMA_BUF_TRACE(trace_dma_buf_put, dmabuf);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_put, "DMA_BUF");
 
@@ -971,6 +1008,9 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 	list_add(&attach->node, &dmabuf->attachments);
 	dma_resv_unlock(dmabuf->resv);
 
+	DMA_BUF_TRACE(trace_dma_buf_dynamic_attach, dmabuf, attach,
+		dma_buf_attachment_is_dynamic(attach), dev);
+
 	return attach;
 
 err_attach:
@@ -1015,6 +1055,9 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
 	if (dmabuf->ops->detach)
 		dmabuf->ops->detach(dmabuf, attach);
 
+	DMA_BUF_TRACE(trace_dma_buf_detach, dmabuf, attach,
+		dma_buf_attachment_is_dynamic(attach), attach->dev);
+
 	kfree(attach);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_detach, "DMA_BUF");
@@ -1480,6 +1523,8 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
 	vma_set_file(vma, dmabuf->file);
 	vma->vm_pgoff = pgoff;
 
+	DMA_BUF_TRACE(trace_dma_buf_mmap, dmabuf);
+
 	return dmabuf->ops->mmap(dmabuf, vma);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, "DMA_BUF");
diff --git a/include/trace/events/dma_buf.h b/include/trace/events/dma_buf.h
new file mode 100644
index 000000000000..2c9ba8533467
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


