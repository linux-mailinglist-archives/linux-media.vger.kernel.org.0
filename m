Return-Path: <linux-media+bounces-47847-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED758C9150C
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 09:53:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C6D43A98F6
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 08:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF6AC2FD668;
	Fri, 28 Nov 2025 08:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jgHiR29Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939E42DF151
	for <linux-media@vger.kernel.org>; Fri, 28 Nov 2025 08:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764319993; cv=none; b=uYUW+ytfWbrN+Tf9q8q2hXR3i8Ep4EaCF+SJxNlUEK/KUnwEhrufnZ6E6VNKShl8Ba7h+oLt0KI3AlGnza9UMmUIMu7mwfEcrRBjTSUyYfDiaYSoZGPsUkzcBc9s16VxiON5muqXE6AeKkyyKuTyUOsZPPyOO6uYQJX6Gg/+cC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764319993; c=relaxed/simple;
	bh=yf/N3q8A0ZS1jptQxIjufR78F3K9pXD3/Vrasv6ztBM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Hnq/Lem2Z0ShdJNFIZSxg6IrgQamDBE+9RSb1x5EaOZjPwW3Qe4a5T4l4it+V1EXlHQvpW+4QJJf+vgvlAqGB44YONbTsBF+aQ/+5E0dFg1EMkkUXioZ+KUe/3gEMFZmdlFCs0B6wYonbMELIhMcjVjxj5Oi0gKfxpl5LE6q0Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jgHiR29Q; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-341988c720aso1385508a91.3
        for <linux-media@vger.kernel.org>; Fri, 28 Nov 2025 00:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764319991; x=1764924791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eL0U7zmB1gT10wwBCtl159d+vX25hEIj58mzemed9/Q=;
        b=jgHiR29QK9nT9M/EDrTB7aUDjWj4eZS2JmgFsNfIWQrOACj08N5Ww/DfeSIIf+UlfW
         +kTK2xdW/Yk17CVyTwluDIA4EzCgho1L7A0qneyv+PkXfR5TSNm2KZ5Hhxa9CbzGSHa1
         JxLwMdeXE3qmZlTxpA2bL58JRm9nyfKosI4tWJm5JICWjD8DujHX56CSug9qKAbzfWTl
         4YuBPNbtLn//GONsFZVjAGqEpIm2KtSVaMHoX2xybykSJqnmvbc+06v25Kyg82bhAUAi
         5MOUCcZYl95m8zaoodHgS+pymyhdGACPU43ZEPoqM64VIp2k3r92I6YicZpIw2b1Yh5w
         Ftiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764319991; x=1764924791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eL0U7zmB1gT10wwBCtl159d+vX25hEIj58mzemed9/Q=;
        b=e26lqGOGUZNGSk1785eVXQKV0DAbCYmpaMWp9hgc7B/rxJVY+JT1JeZpAGYuDMBE9a
         6qtrs3UjkKcnyPWU4+hZ4GmgQMxlhvnTRiyhPjT3HSXi6tZ8PH4YOvIUhpPuSKSnamN3
         Mw/vGrr1/g1TiqEoDf5fuks7q3Edt0DioTf4PgwbZXrKBaE+XArcFfeXJoXNy5ZevUnj
         ZN/RidfBsFNLh360lOSVIPWW9ISoig4pgImx0I8R3JxEeO/V2PAO7q9CnxgrK8Agb1ni
         LzkLHOVfi7Ft//Q0Fae9AsMghwZJ6Anv+iNIHSv2hp0qniY1pBde3ZnQL2qAK7axJHSK
         /JIA==
X-Gm-Message-State: AOJu0Yyuyxieth1TpKnmLBsDUv7wDjW6PnMvm5M/7+nnC6gBp5mpxvgr
	A0uzytcJSeGOgpqNwDVYCzW4dzlD7tabxKZhNHXzG+AyPDr6J4pEWTwK
X-Gm-Gg: ASbGnctpUQPvwjPNsRQxSIoxqvFoguOS8W1XTJWNeQuf2O23d9YVPepoJ7p/TNjXoi4
	AH4ag1dY7Ds8ckiBYB6g2Fu3Q7gSQb6AUaHwcC3iE1Cn9hWbR7efe9UBkby7rYSHEtf1hnYkzuH
	0sSJKlOjRIasvXXL5wpmlMdlC8s9HrHgaEDr3e8RrRgPXrpyAjrBMT+eIje1RLHIoF3sDkKjZzt
	dVX3Rr0KKVGTfSCkWjYOTRiZHTleDQPU+DhpE4f0Y/klJMPkDKoqHYLvu78tp2KwdpDFWnVEit7
	knhaqfWnhJN5/3DEB88VhitJ8ustPnP46EzB9mBqoHvq/EnGoMN+LVBaxAp/WvYj6F6l7/zl1TV
	3e8xXTg98qnKUnf+JAA6rBrv3CWuhBrZQ0wufMMd72Ls6c1xo3TyYbChrpS5Uq8TRITjDMYmbqz
	CtWTg/4ESGvrPmOe1ys9f3
X-Google-Smtp-Source: AGHT+IGhvbpVFcjEpLATAzAUhW5W40T3P1QD6+AfVb9g4d1Wfoo3l+g8ulGKiN+/KZRkWEKYmuoAzw==
X-Received: by 2002:a17:90a:d00c:b0:340:e529:5572 with SMTP id 98e67ed59e1d1-34733e6cac7mr23773546a91.8.1764319990845;
        Fri, 28 Nov 2025 00:53:10 -0800 (PST)
Received: from xiao.mioffice.cn ([43.224.245.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b74b8f1sm4081125a91.14.2025.11.28.00.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 00:53:10 -0800 (PST)
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
Subject: [PATCH v4] dma-buf: add some tracepoints to debug.
Date: Fri, 28 Nov 2025 16:52:15 +0800
Message-Id: <20251128085215.550100-1-gxxa03070307@gmail.com>
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
   binder:3031_4-18348   [005] ...1.   545.568275: dma_buf_export: exp_name=qcom,system name=(null) size=217088 ino=2750
   binder:3031_4-18348   [005] ...1.   545.568284: dma_buf_fd: exp_name=qcom,system name=(null) size=217088 ino=2750 fd=8
   binder:3031_4-18348   [005] ...1.   545.568399: dma_buf_mmap_internal: exp_name=qcom,system name=qcom,system size=28672 ino=2751
     kworker/5:1-130     [005] ...1.   545.570193: dma_buf_put: exp_name=qcom,system name=ab size=28672 ino=2751
    RenderThread-18891   [005] ...1.   545.602994: dma_buf_get: exp_name=qcom,system name=ab size=217088 ino=2750 fd=1087
    RenderThread-9409    [000] .n.1.   545.745004: dma_buf_dynamic_attach: exp_name=qcom,system name=ab size=217088 ino=2750 is_dynamic=0 dev_name=kgsl-3d0
    RenderThread-9409    [005] ...1.   545.747802: dma_buf_detach: exp_name=qcom,system name=bq size=12771328 ino=2764 is_dynamic=0 dev_name=kgsl-3d0

Signed-off-by: Xiang Gao <gaoxiang17@xiaomi.com>
---
 drivers/dma-buf/dma-buf.c      |  48 +++++++++-
 include/trace/events/dma_buf.h | 160 +++++++++++++++++++++++++++++++++
 2 files changed, 207 insertions(+), 1 deletion(-)
 create mode 100644 include/trace/events/dma_buf.h

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 2bcf9ceca997..6e04e12f149e 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -35,6 +35,9 @@
 
 #include "dma-buf-sysfs-stats.h"
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/dma_buf.h>
+
 static inline int is_dma_buf_file(struct file *);
 
 static DEFINE_MUTEX(dmabuf_list_mutex);
@@ -220,6 +223,11 @@ static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
 	    dmabuf->size >> PAGE_SHIFT)
 		return -EINVAL;
 
+	if (trace_dma_buf_mmap_internal_enabled()) {
+		guard(spinlock)(&dmabuf->name_lock);
+		trace_dma_buf_mmap_internal(dmabuf);
+	}
+
 	return dmabuf->ops->mmap(dmabuf, vma);
 }
 
@@ -745,6 +753,11 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 
 	__dma_buf_list_add(dmabuf);
 
+	if (trace_dma_buf_export_enabled()) {
+		guard(spinlock)(&dmabuf->name_lock);
+		trace_dma_buf_export(dmabuf);
+	}
+
 	return dmabuf;
 
 err_dmabuf:
@@ -779,6 +792,11 @@ int dma_buf_fd(struct dma_buf *dmabuf, int flags)
 
 	fd_install(fd, dmabuf->file);
 
+	if (trace_dma_buf_fd_enabled()) {
+		guard(spinlock)(&dmabuf->name_lock);
+		trace_dma_buf_fd(dmabuf, fd);
+	}
+
 	return fd;
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_fd, "DMA_BUF");
@@ -794,6 +812,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_fd, "DMA_BUF");
 struct dma_buf *dma_buf_get(int fd)
 {
 	struct file *file;
+	struct dma_buf *dmabuf;
 
 	file = fget(fd);
 
@@ -805,7 +824,14 @@ struct dma_buf *dma_buf_get(int fd)
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
 
@@ -825,6 +851,11 @@ void dma_buf_put(struct dma_buf *dmabuf)
 		return;
 
 	fput(dmabuf->file);
+
+	if (trace_dma_buf_put_enabled()) {
+		guard(spinlock)(&dmabuf->name_lock);
+		trace_dma_buf_put(dmabuf);
+	}
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_put, "DMA_BUF");
 
@@ -979,6 +1010,11 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 	list_add(&attach->node, &dmabuf->attachments);
 	dma_resv_unlock(dmabuf->resv);
 
+	if (trace_dma_buf_dynamic_attach_enabled()) {
+		guard(spinlock)(&dmabuf->name_lock);
+		trace_dma_buf_dynamic_attach(dmabuf, dma_buf_attachment_is_dynamic(attach), dev);
+	}
+
 	return attach;
 
 err_attach:
@@ -1023,6 +1059,11 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
 	if (dmabuf->ops->detach)
 		dmabuf->ops->detach(dmabuf, attach);
 
+	if (trace_dma_buf_detach_enabled()) {
+		guard(spinlock)(&dmabuf->name_lock);
+		trace_dma_buf_detach(dmabuf, dma_buf_attachment_is_dynamic(attach), attach->dev);
+	}
+
 	kfree(attach);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_detach, "DMA_BUF");
@@ -1488,6 +1529,11 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
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
index 000000000000..f4b6ba5241fa
--- /dev/null
+++ b/include/trace/events/dma_buf.h
@@ -0,0 +1,160 @@
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
+	),
+
+	TP_fast_assign(
+		__assign_str(exp_name);
+		__assign_str(name);
+		__entry->size = dmabuf->size;
+		__entry->ino = dmabuf->file->f_inode->i_ino;
+	),
+
+	TP_printk("exp_name=%s name=%s size=%zu ino=%lu",
+		  __get_str(exp_name),
+		  __get_str(name),
+		  __entry->size,
+		  __entry->ino)
+);
+
+DECLARE_EVENT_CLASS(dma_buf_attach_dev,
+
+	TP_PROTO(struct dma_buf *dmabuf, bool is_dynamic, struct device *dev),
+
+	TP_ARGS(dmabuf, is_dynamic, dev),
+
+	TP_STRUCT__entry(
+		__string(dev_name, dev_name(dev))
+		__string(exp_name, dmabuf->exp_name)
+		__string(name, dmabuf->name)
+		__field(size_t, size)
+		__field(ino_t, ino)
+		__field(bool, is_dynamic)
+	),
+
+	TP_fast_assign(
+		__assign_str(dev_name);
+		__assign_str(exp_name);
+		__assign_str(name);
+		__entry->size = dmabuf->size;
+		__entry->ino = dmabuf->file->f_inode->i_ino;
+		__entry->is_dynamic = is_dynamic;
+	),
+
+	TP_printk("exp_name=%s name=%s size=%zu ino=%lu is_dynamic=%d dev_name=%s",
+		  __get_str(exp_name),
+		  __get_str(name),
+		  __entry->size,
+		  __entry->ino,
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
+		__string(name, dmabuf->name)
+		__field(size_t, size)
+		__field(ino_t, ino)
+		__field(int, fd)
+	),
+
+	TP_fast_assign(
+		__assign_str(exp_name);
+		__assign_str(name);
+		__entry->size = dmabuf->size;
+		__entry->ino = dmabuf->file->f_inode->i_ino;
+		__entry->fd = fd;
+	),
+
+	TP_printk("exp_name=%s name=%s size=%zu ino=%lu fd=%d",
+		  __get_str(exp_name),
+		  __get_str(name),
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
+	TP_PROTO(struct dma_buf *dmabuf, bool is_dynamic, struct device *dev),
+
+	TP_ARGS(dmabuf, is_dynamic, dev)
+);
+
+DEFINE_EVENT(dma_buf_attach_dev, dma_buf_detach,
+
+	TP_PROTO(struct dma_buf *dmabuf, bool is_dynamic, struct device *dev),
+
+	TP_ARGS(dmabuf, is_dynamic, dev)
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


