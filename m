Return-Path: <linux-media+bounces-47791-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6CFC8C742
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 01:45:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9435D4E4968
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 00:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 131F126F289;
	Thu, 27 Nov 2025 00:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KWu+Qk9U"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC43526D4EB
	for <linux-media@vger.kernel.org>; Thu, 27 Nov 2025 00:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764204244; cv=none; b=GoA6LgTRYABS7l8L4KZG+KYP523Fz6rb1vxNBg5gWf+PTFyfjUiVe58AWKErfOtNge+rM18Sd8q//SS+lB98ooCPGsBsG8ujuPdA6A4u6zA3gv0mYtGr8uYfPiGkIi+dki8LcIo8emMLAwisAGSgR8r6aPmB1mGEDpG7oJyB1sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764204244; c=relaxed/simple;
	bh=eMiyhn3JMaYAOqCZKUspFQk4lh9+l6IBgnbP0xzSt+4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AwwB9hxeZ+6PXCRtvba7fMganDyV0T+JQwd0WkofFGXv7sVwwg2RDjDFgHdHece1V31WU66bSB4hAWMhxux+PgjgrENa/etZXvjoeI3cXkpCRu6kO+xcmP3qXTzKXaTTdHhGos3q8QFUhGoO4us3lzYnLMMYfK9f9bSfzvzf4SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KWu+Qk9U; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7b6dd81e2d4so280820b3a.0
        for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 16:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764204241; x=1764809041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X7D/SOi2ecN39BhKBlvFMFvS97PTD1c0CHuxKvuCC8A=;
        b=KWu+Qk9UQfxBH4T40/AoaTNeuUBlBLbhwduuyp2X2G0tFzB7P7ELadd6ug1afyK7yE
         Xr6YkPWDRrj6j47hj+XTR5mWvr52B+qlEf56l/IxSIA/eNRY8YtVrcOAQhFXs+LMuOFW
         P3zJgRSFckH4612HR1St1xW82tyMDcBL+qVlyQnyRs3A90UE8ok1AbyR7cY1F5Zrkf3r
         MFM8BNEBOTVeZpZtfFjxXssmkYIHcImLwnOe1zjQ8p1ug/n4V1Th8GDnySIeaAFRI8qq
         eJr2r0/XTKPvQSd/PjCSjpT0NMODNgP04Tju5Vo17a0ecGkyxmu/Qrgi9wAWp94JPLYF
         0HXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764204241; x=1764809041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X7D/SOi2ecN39BhKBlvFMFvS97PTD1c0CHuxKvuCC8A=;
        b=oDppFt6b8oWU4Snl8BdKs2gVxR/BGG6aRxlVYc2f41wj0W1s4Ckqhfja8REVidxS4X
         ddNczjgXb2K/UI2p18SPbB/7KUsYjKkpI0UxenN23GAhbPoDYgf+gqN68TTYKz2p4Ovu
         yIlfyLOXEr9bt39PXO2202kheOygmbvay6Te9b/sKeGdCVQdZ5Rq50zvHZXGVk8T3IT9
         Y4tzpIOu4cjCPkI3dHaYncCokLOsnKdHM1zu+66xFvk7/8qsThTzfuPwlNFyjAuq1hBH
         rtyPNOyYPjHHbxvpGri6/M1FIJLapPq+ZNsEXgwxFl9+qVKDuVBpnhKxS2fQug3emS07
         vwow==
X-Gm-Message-State: AOJu0Yxgr8axWz0PZbMMjGAUqwLf9wqAOS4+J8dSeYciSX1B6T4sUfYl
	U1Oy23p5PJ432hQV9mqwUvlODWptGnXjMmZkM2wokPX3HDhx5djhiVf/
X-Gm-Gg: ASbGncvd/143mbGJ0yiwJ941/iSKMSB1XQUo1O82YVenOd5i+Er2d+lxYOsv8bu5GlK
	kuQuPIlwOLYylegTGbS3gt/majchGUzV5or+QHsMgqdoxs59D1GDk3TzSQjJ6n7zmP6L9QBKtLw
	/QDuo58xbCQRSX9/dLHIEUpSgg02zOFbnkTA2GNcqu7CPfN5Rj7Qr+QeYxe055MWzl+KZAH0Efh
	hxp8w8kQjfD25CvmpjCRJzCZ4bg0zFA29Um4+3o6eQ94vOgIpW/hPUfSa9yz3wWHB1AsSwQE6+B
	dmehQAkTC+QYKDvfYBbmCBj/4+9CCBDZKV4u5tL3Edc1Ykdqzv4SzLcjGRT9jSXyRcV+P5B2vvB
	QFjm1W+YeFUdzsAZ7SvqYVTJ/eEq3KBtGVHje+kU0j6EDkrPz6OjHcgkomm9j8EnUPnBUfc3hJv
	EavrtXi3BQAno89FKfbjVLrbJAdI5MHZw=
X-Google-Smtp-Source: AGHT+IF5sxqeF7/QZTdBnTq4C94IH3X+/gRFD/p3Uasr8vrMeNSwp8x1kirv9w3cIWg+fZmvWcZx3g==
X-Received: by 2002:a05:6a21:3392:b0:35d:8881:e6ba with SMTP id adf61e73a8af0-3614ee3889dmr25218508637.49.1764204240986;
        Wed, 26 Nov 2025 16:44:00 -0800 (PST)
Received: from xiao.mioffice.cn ([43.224.245.230])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be508bfd8ffsm23902a12.17.2025.11.26.16.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 16:44:00 -0800 (PST)
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
Subject: [PATCH v3] dma-buf: add some tracepoints to debug.
Date: Thu, 27 Nov 2025 08:43:52 +0800
Message-Id: <20251127004352.376307-1-gxxa03070307@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: gaoxiang17 <gaoxiang17@xiaomi.com>

I want to track the status of dmabuf in real time in the production environment.
But now we can only check it by traversing the fd in the process or dmabuf_list.

For example:
   binder:2962_2-2962    [005] ...1.   208.453940: dma_buf_export: exp_name=qcom,system name=(null) size=28672 ino=2580 f_refcnt=2
   binder:2962_2-2962    [005] ...1.   208.453943: dma_buf_fd: exp_name=qcom,system name=(null) size=28672 ino=2580 fd=9 f_refcnt=2
   binder:2962_2-2962    [005] ...1.   208.453977: dma_buf_mmap_internal: exp_name=qcom,system name=qcom,system size=28672 ino=2580 f_refcnt=4
     kworker/5:2-194     [005] ...1.   208.460580: dma_buf_put: exp_name=qcom,system name=ab pid [8176] size=28672 ino=2580 f_refcnt=3
    RenderThread-11305   [007] ...1.   208.599094: dma_buf_get: exp_name=qcom,system name=ab pid [8176] size=217088 ino=2579 fd=1114 f_refcnt=7
    RenderThread-11305   [007] ...1.   208.599098: dma_buf_attach: dev_name=kgsl-3d0 exp_name=qcom,system name=ab pid [8176] size=217088 ino=2579 f_refcnt=7
           <...>-14      [001] ...1.   208.726359: dma_buf_detach: dev_name=kgsl-3d0 exp_name=qcom,system name=ab pid [3317] size=217088 ino=2581 f_refcnt=3

Signed-off-by: Xiang Gao <gaoxiang17@xiaomi.com>
---
 drivers/dma-buf/dma-buf.c      |  57 ++++++++++-
 include/trace/events/dma_buf.h | 166 +++++++++++++++++++++++++++++++++
 2 files changed, 222 insertions(+), 1 deletion(-)
 create mode 100644 include/trace/events/dma_buf.h

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 2bcf9ceca997..7cef816ddcac 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -35,6 +35,18 @@
 
 #include "dma-buf-sysfs-stats.h"
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/dma_buf.h>
+
+EXPORT_TRACEPOINT_SYMBOL(dma_buf_export);
+EXPORT_TRACEPOINT_SYMBOL(dma_buf_mmap_internal);
+EXPORT_TRACEPOINT_SYMBOL(dma_buf_mmap);
+EXPORT_TRACEPOINT_SYMBOL(dma_buf_put);
+EXPORT_TRACEPOINT_SYMBOL(dma_buf_attach);
+EXPORT_TRACEPOINT_SYMBOL(dma_buf_detach);
+EXPORT_TRACEPOINT_SYMBOL(dma_buf_fd);
+EXPORT_TRACEPOINT_SYMBOL(dma_buf_get);
+
 static inline int is_dma_buf_file(struct file *);
 
 static DEFINE_MUTEX(dmabuf_list_mutex);
@@ -220,6 +232,11 @@ static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
 	    dmabuf->size >> PAGE_SHIFT)
 		return -EINVAL;
 
+	if (trace_dma_buf_mmap_internal_enabled()) {
+		guard(spinlock)(&dmabuf->name_lock);
+		trace_dma_buf_mmap_internal(dmabuf);
+	}
+
 	return dmabuf->ops->mmap(dmabuf, vma);
 }
 
@@ -745,6 +762,11 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 
 	__dma_buf_list_add(dmabuf);
 
+	if (trace_dma_buf_export_enabled()) {
+		guard(spinlock)(&dmabuf->name_lock);
+		trace_dma_buf_export(dmabuf);
+	}
+
 	return dmabuf;
 
 err_dmabuf:
@@ -779,6 +801,11 @@ int dma_buf_fd(struct dma_buf *dmabuf, int flags)
 
 	fd_install(fd, dmabuf->file);
 
+	if (trace_dma_buf_fd_enabled()) {
+		guard(spinlock)(&dmabuf->name_lock);
+		trace_dma_buf_fd(dmabuf, fd);
+	}
+
 	return fd;
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_fd, "DMA_BUF");
@@ -794,6 +821,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_fd, "DMA_BUF");
 struct dma_buf *dma_buf_get(int fd)
 {
 	struct file *file;
+	struct dma_buf *dmabuf;
 
 	file = fget(fd);
 
@@ -805,7 +833,14 @@ struct dma_buf *dma_buf_get(int fd)
 		return ERR_PTR(-EINVAL);
 	}
 
-	return file->private_data;
+	dmabuf = file->private_data;
+
+	if (trace_dma_buf_get_enabled()) {
+		guard(spinlock)(&dmabuf->name_lock);
+		trace_dma_buf_get(dmabuf, fd);
+	}
+
+	return dmabuf;
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_get, "DMA_BUF");
 
@@ -825,6 +860,11 @@ void dma_buf_put(struct dma_buf *dmabuf)
 		return;
 
 	fput(dmabuf->file);
+
+	if (trace_dma_buf_put_enabled()) {
+		guard(spinlock)(&dmabuf->name_lock);
+		trace_dma_buf_put(dmabuf);
+	}
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_put, "DMA_BUF");
 
@@ -998,6 +1038,11 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_dynamic_attach, "DMA_BUF");
 struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
 					  struct device *dev)
 {
+	if (trace_dma_buf_attach_enabled()) {
+		guard(spinlock)(&dmabuf->name_lock);
+		trace_dma_buf_attach(dmabuf, dev);
+	}
+
 	return dma_buf_dynamic_attach(dmabuf, dev, NULL, NULL);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_attach, "DMA_BUF");
@@ -1023,6 +1068,11 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
 	if (dmabuf->ops->detach)
 		dmabuf->ops->detach(dmabuf, attach);
 
+	if (trace_dma_buf_detach_enabled()) {
+		guard(spinlock)(&dmabuf->name_lock);
+		trace_dma_buf_detach(dmabuf, attach->dev);
+	}
+
 	kfree(attach);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_detach, "DMA_BUF");
@@ -1488,6 +1538,11 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
 	vma_set_file(vma, dmabuf->file);
 	vma->vm_pgoff = pgoff;
 
+	if (trace_dma_buf_mmap_enabled()) {
+		guard(spinlock)(&dmabuf->name_lock);
+		trace_dma_buf_mmap(dmabuf);
+	}
+
 	return dmabuf->ops->mmap(dmabuf, vma);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, "DMA_BUF");
diff --git a/include/trace/events/dma_buf.h b/include/trace/events/dma_buf.h
new file mode 100644
index 000000000000..fe9da89bacd0
--- /dev/null
+++ b/include/trace/events/dma_buf.h
@@ -0,0 +1,166 @@
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
+		__string(name, dmabuf->name)
+		__field(size_t, size)
+		__field(ino_t, ino)
+		__field(long, f_refcnt)
+	),
+
+	TP_fast_assign(
+		__assign_str(exp_name);
+		__assign_str(name);
+		__entry->size = dmabuf->size;
+		__entry->ino = dmabuf->file->f_inode->i_ino;
+		__entry->f_refcnt = file_count(dmabuf->file);
+	),
+
+	TP_printk("exp_name=%s name=%s size=%zu ino=%lu f_refcnt=%ld",
+		  __get_str(exp_name),
+		  __get_str(name),
+		  __entry->size,
+		  __entry->ino,
+		  __entry->f_refcnt)
+);
+
+DECLARE_EVENT_CLASS(dma_buf_attach_dev,
+
+	TP_PROTO(struct dma_buf *dmabuf, struct device *dev),
+
+	TP_ARGS(dmabuf, dev),
+
+	TP_STRUCT__entry(
+		__string(dname, dev_name(dev))
+		__string(exp_name, dmabuf->exp_name)
+		__string(name, dmabuf->name)
+		__field(size_t, size)
+		__field(ino_t, ino)
+		__field(long, f_refcnt)
+	),
+
+	TP_fast_assign(
+		__assign_str(dname);
+		__assign_str(exp_name);
+		__assign_str(name);
+		__entry->size = dmabuf->size;
+		__entry->ino = dmabuf->file->f_inode->i_ino;
+		__entry->f_refcnt = file_count(dmabuf->file);
+	),
+
+	TP_printk("dev_name=%s exp_name=%s name=%s size=%zu ino=%lu f_refcnt=%ld",
+		  __get_str(dname),
+		  __get_str(exp_name),
+		  __get_str(name),
+		  __entry->size,
+		  __entry->ino,
+		  __entry->f_refcnt)
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
+		__string(name, dmabuf->name)
+		__field(size_t, size)
+		__field(ino_t, ino)
+		__field(int, fd)
+		__field(long, f_refcnt)
+	),
+
+	TP_fast_assign(
+		__assign_str(exp_name);
+		__assign_str(name);
+		__entry->size = dmabuf->size;
+		__entry->ino = dmabuf->file->f_inode->i_ino;
+		__entry->fd = fd;
+		__entry->f_refcnt = file_count(dmabuf->file);
+	),
+
+	TP_printk("exp_name=%s name=%s size=%zu ino=%lu fd=%d f_refcnt=%ld",
+		  __get_str(exp_name),
+		  __get_str(name),
+		  __entry->size,
+		  __entry->ino,
+		  __entry->fd,
+		  __entry->f_refcnt)
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
+DEFINE_EVENT(dma_buf_attach_dev, dma_buf_attach,
+
+	TP_PROTO(struct dma_buf *dmabuf, struct device *dev),
+
+	TP_ARGS(dmabuf, dev)
+);
+
+DEFINE_EVENT(dma_buf_attach_dev, dma_buf_detach,
+
+	TP_PROTO(struct dma_buf *dmabuf, struct device *dev),
+
+	TP_ARGS(dmabuf, dev)
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


