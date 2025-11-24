Return-Path: <linux-media+bounces-47660-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCD7C80CCF
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 14:37:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A8E454E5F8D
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 13:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7107306D3D;
	Mon, 24 Nov 2025 13:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VCM7zPG3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A590306495
	for <linux-media@vger.kernel.org>; Mon, 24 Nov 2025 13:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763991418; cv=none; b=iWSWabVWuCm/AHLclUsFqXI1oQDZLPkzyhnuYVpKPDxqavB861xGUEvS8tlDiWBCzlRFld1+HdsFkGwT46IQUaJBCzKA8MHUBk4o24SLWlHyiZxknnF+HLrfFE7zfN1XuXPNowgA1T8wXj+V7VqVOusn/r6br/cHPQcKy171+O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763991418; c=relaxed/simple;
	bh=R2TNEdLeCr+WebDGIdwE1ouAUwHeWoeWNAusMtOP8Ec=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SxDCYpPwhdliT8M5O5AdmhEnOWaH8+Bo+X+efpiic0FtxGY87MlQqpOg+ftduEMi3tN5OdVXh/9KosOWRU/9YqGqZN8YmmfGr2wptALW7sKzzNozPIto3OXhzuoM33U9f6li/usJtSSS68oBbdgfdTcaGaSvlCcSAWJTPY5OZVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VCM7zPG3; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-340ba29d518so2602864a91.3
        for <linux-media@vger.kernel.org>; Mon, 24 Nov 2025 05:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763991416; x=1764596216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=69heBc7lxItVc7wNt1exM2CAHwdvZiFMjd3lDNLudqQ=;
        b=VCM7zPG3AeAo9EpHIpjefC6NdGXYinTCImtZZZ7Hll7bYQXBIqtMCNaro1XFFoOMGG
         RssA2DaxuQSeNhPKGwlX+fDfaGLia6FPZzzjsm6KLhCRIMVyFxITa1k/mPiywADBJn5I
         j3UUmCsrfdKeO39u0bx3d5pA3+xil0xrGN2O6culIAvNKdEjfHliy8wxRx8XyyZu8XGH
         W2hdo8Y43AEKexw9Ho8cb5WN3wmxhlZIdtOygYlt190vQIn8WoUDlRVf1GKdkoJS6cai
         M3VzoBAEtZqqthuh+oHTkntPN785qgaSPGqwsiDINkrjpIUk1KUwppCjSaTTatPEqIYZ
         QJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763991416; x=1764596216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=69heBc7lxItVc7wNt1exM2CAHwdvZiFMjd3lDNLudqQ=;
        b=PQ4PClCVc+QcZTe57mnXmitGk3ti+pLxCsQqjw7nWHvms5sSXTuCuhNF9Uy2eH+JdA
         4gQHfHVEGgD1fOFA1waO6YULhSrvvc11hbbTPj+/QbveKa89PdJ165KIJzxO/ju4eYhX
         ui9LiHJhbNC8vtiJXUFUW3d6AN0TlyqtEm19xJlr+1Ij5dDtIvbBq5E/vXDjwXnhgLi+
         aHKgaSlbh+b+TvOnWRObSd7D/efrDXAt+75ZqhPbw0dAG1Ig+xCBOzsYNRbxfKq/Qsd3
         UPbnTQv0j15wbKs5p3jxeMfWuxaQAzlVzwmxhkSiZv/LH0e+jeo+/6ElhN3iNxkdK6X5
         pvIw==
X-Gm-Message-State: AOJu0YzkH32TYDQz+5NJOWcB/U8+/NUhs5n8KCFgWVDRUHeuSoGU3/M7
	1onCwxRpbDli2Izadx4UMoJt8b2gHU9+1lR+CQVyrhMLS04znUzaCPe1xP7Z6A==
X-Gm-Gg: ASbGncuB3lRL/HiMAL/NCS7LfGzwYp0EGBnpdLHOTdhfDraV4JEXvYAFrILzLWKqM0d
	35/jS7Jm7ldm3SJnnxt4ACvOY6ytZ8L+yTTPKjXnwROJ3nE5q1XlY84Yeuu1dKU6LWA5a4h0emP
	DZNniEvPErRQTdwID5weq5ZW8m/J6Yn0J383x+fcNEmK6ErFXAn2KLIiXZWiTHD/AolSjj/KKxC
	YbeeCeImdJJJYLjHcHfuvKNSewt1YujuoKoxWWWh1BqW3npq/utiq7gwupg4tsDMT8KOTjbg99o
	fMEOYKHFzQjzH2R3gld0wyzysHoUcSnYBzSNDjk93gh+n26Sjc/m0JirNnFz00eG0SXAQwklLAE
	r9FYx6wNriJ/jVRBU/vV6LHW43MyakTGOrm2W6xVnaZdGSxNKa3NLoQYFMdYocjnA/B4aPv8NKN
	heIQOuuPwXQrXljAxCOEjj
X-Google-Smtp-Source: AGHT+IG8VQwWoauvzDFbRHO/aVA7+5Mp7waCEC1xvbAJGyrpIlW5gSd8E1x6DOClV9RsbiV2xW4jVQ==
X-Received: by 2002:a17:90b:2f85:b0:340:be4d:a718 with SMTP id 98e67ed59e1d1-34733e4a4eemr14390507a91.7.1763991415673;
        Mon, 24 Nov 2025 05:36:55 -0800 (PST)
Received: from xiao.mioffice.cn ([43.224.245.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345b04771e6sm8091573a91.8.2025.11.24.05.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 05:36:55 -0800 (PST)
From: Xiang Gao <gxxa03070307@gmail.com>
To: sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	mathieu.desnoyers@efficios.com,
	dhowells@redhat.com,
	kuba@kernel.org,
	brauner@kernel.org,
	akpm@linux-foundation.org,
	linux-trace-kernel@vger.kernel.org,
	gaoxiang17 <gaoxiang17@xiaomi.com>
Subject: [PATCH] dma-buf: add some tracepoints to debug.
Date: Mon, 24 Nov 2025 21:36:48 +0800
Message-Id: <20251124133648.72668-1-gxxa03070307@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: gaoxiang17 <gaoxiang17@xiaomi.com>

With these tracepoints, we can track dmabuf in real time.

For example:
   binder:3025_3-10524   [000] .....   553.310313: dma_buf_export: exp_name=qcom,system name=(null) size=12771328 ino=2799
   binder:3025_3-10524   [000] .....   553.310318: dma_buf_fd: exp_name=qcom,system name=(null) size=12771328 ino=2799 fd=8
    RenderThread-9307    [000] .....   553.310869: dma_buf_get: exp_name=qcom,system name=blastBufferQueue for scaleUpDow size=12771328 ino=2799 fd=673 f_ref=4
    RenderThread-9307    [000] .....   553.310871: dma_buf_attach: dev_name=kgsl-3d0 exp_name=qcom,system name=blastBufferQueue for scaleUpDow size=12771328 ino=2799
    RenderThread-9307    [000] .....   553.310946: dma_buf_mmap_internal: exp_name=qcom,system name=blastBufferQueue for scaleUpDow size=12771328 ino=2799
    RenderThread-9307    [004] .....   553.315084: dma_buf_detach: exp_name=qcom,system name=blastBufferQueue for scaleUpDow size=12771328 ino=2799
    RenderThread-9307    [004] .....   553.315084: dma_buf_put: exp_name=qcom,system name=blastBufferQueue for scaleUpDow size=12771328 ino=2799 f_ref=5

Signed-off-by: gaoxiang17 <gaoxiang17@xiaomi.com>
---
 drivers/dma-buf/dma-buf.c      |  19 +++
 include/trace/events/dma_buf.h | 245 +++++++++++++++++++++++++++++++++
 2 files changed, 264 insertions(+)
 create mode 100644 include/trace/events/dma_buf.h

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 2bcf9ceca997..8b5af73f0218 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -35,6 +35,9 @@
 
 #include "dma-buf-sysfs-stats.h"
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/dma_buf.h>
+
 static inline int is_dma_buf_file(struct file *);
 
 static DEFINE_MUTEX(dmabuf_list_mutex);
@@ -220,6 +223,8 @@ static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
 	    dmabuf->size >> PAGE_SHIFT)
 		return -EINVAL;
 
+	trace_dma_buf_mmap_internal(dmabuf);
+
 	return dmabuf->ops->mmap(dmabuf, vma);
 }
 
@@ -745,6 +750,8 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 
 	__dma_buf_list_add(dmabuf);
 
+	trace_dma_buf_export(dmabuf);
+
 	return dmabuf;
 
 err_dmabuf:
@@ -779,6 +786,8 @@ int dma_buf_fd(struct dma_buf *dmabuf, int flags)
 
 	fd_install(fd, dmabuf->file);
 
+	trace_dma_buf_fd(dmabuf, fd);
+
 	return fd;
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_fd, "DMA_BUF");
@@ -805,6 +814,8 @@ struct dma_buf *dma_buf_get(int fd)
 		return ERR_PTR(-EINVAL);
 	}
 
+	trace_dma_buf_get(fd, file);
+
 	return file->private_data;
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_get, "DMA_BUF");
@@ -825,6 +836,8 @@ void dma_buf_put(struct dma_buf *dmabuf)
 		return;
 
 	fput(dmabuf->file);
+
+	trace_dma_buf_put(dmabuf);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_put, "DMA_BUF");
 
@@ -998,6 +1011,8 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_dynamic_attach, "DMA_BUF");
 struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
 					  struct device *dev)
 {
+	trace_dma_buf_attach(dmabuf, dev);
+
 	return dma_buf_dynamic_attach(dmabuf, dev, NULL, NULL);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_attach, "DMA_BUF");
@@ -1024,6 +1039,8 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
 		dmabuf->ops->detach(dmabuf, attach);
 
 	kfree(attach);
+
+	trace_dma_buf_detach(dmabuf);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_detach, "DMA_BUF");
 
@@ -1488,6 +1505,8 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
 	vma_set_file(vma, dmabuf->file);
 	vma->vm_pgoff = pgoff;
 
+	trace_dma_buf_mmap(dmabuf);
+
 	return dmabuf->ops->mmap(dmabuf, vma);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, "DMA_BUF");
diff --git a/include/trace/events/dma_buf.h b/include/trace/events/dma_buf.h
new file mode 100644
index 000000000000..796ae444f6ae
--- /dev/null
+++ b/include/trace/events/dma_buf.h
@@ -0,0 +1,245 @@
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
+TRACE_EVENT(dma_buf_export,
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
+TRACE_EVENT(dma_buf_fd,
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
+TRACE_EVENT(dma_buf_mmap_internal,
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
+TRACE_EVENT(dma_buf_mmap,
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
+TRACE_EVENT(dma_buf_attach,
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
+	),
+
+	TP_fast_assign(
+		__assign_str(dname);
+		__assign_str(exp_name);
+		__assign_str(name);
+		__entry->size = dmabuf->size;
+		__entry->ino = dmabuf->file->f_inode->i_ino;
+	),
+
+	TP_printk("dev_name=%s exp_name=%s name=%s size=%zu ino=%lu",
+		  __get_str(dname),
+		  __get_str(exp_name),
+		  __get_str(name),
+		  __entry->size,
+		  __entry->ino)
+);
+
+TRACE_EVENT(dma_buf_detach,
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
+TRACE_EVENT(dma_buf_get,
+
+	TP_PROTO(int fd, struct file *file),
+
+	TP_ARGS(fd, file),
+
+	TP_STRUCT__entry(
+		__string(exp_name, ((struct dma_buf *)file->private_data)->exp_name)
+		__string(name, ((struct dma_buf *)file->private_data)->name)
+		__field(size_t, size)
+		__field(ino_t, ino)
+		__field(int, fd)
+		__field(long, f_ref)
+	),
+
+	TP_fast_assign(
+		__assign_str(exp_name);
+		__assign_str(name);
+		__entry->size = ((struct dma_buf *)file->private_data)->size;
+		__entry->ino = ((struct dma_buf *)file->private_data)->file->f_inode->i_ino;
+		__entry->fd = fd;
+		__entry->f_ref = file_ref_get(&file->f_ref);
+	),
+
+	TP_printk("exp_name=%s name=%s size=%zu ino=%lu fd=%d f_ref=%ld",
+		  __get_str(exp_name),
+		  __get_str(name),
+		  __entry->size,
+		  __entry->ino,
+		  __entry->fd,
+		  __entry->f_ref)
+);
+
+TRACE_EVENT(dma_buf_put,
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
+		__field(long, f_ref)
+	),
+
+	TP_fast_assign(
+		__assign_str(exp_name);
+		__assign_str(name);
+		__entry->size = dmabuf->size;
+		__entry->ino = dmabuf->file->f_inode->i_ino;
+		__entry->f_ref = file_ref_get(&dmabuf->file->f_ref);
+	),
+
+	TP_printk("exp_name=%s name=%s size=%zu ino=%lu f_ref=%ld",
+		  __get_str(exp_name),
+		  __get_str(name),
+		  __entry->size,
+		  __entry->ino,
+		  __entry->f_ref)
+);
+
+#endif /* _TRACE_DMA_BUF_H */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
-- 
2.34.1


