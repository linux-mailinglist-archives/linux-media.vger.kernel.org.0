Return-Path: <linux-media+bounces-67559-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tycZGBAmVmo+0AAAu9opvQ
	(envelope-from <linux-media+bounces-67559-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 14:05:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8A8754407
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 14:05:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=GFq4DFrF;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67559-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67559-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E83F535168A2
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 11:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3E1F3B14B2;
	Tue, 14 Jul 2026 11:47:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEA73AD524
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 11:47:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784029639; cv=none; b=pZVmfVFOwEGz43cUpFIDRuP6oPIDCJG+o8w3vlKxrIH5bb/QkAyJuopL0uOT1qFrW5eZVv1c6rzUzY0SM2wFK+SgrfpSm5XUWvf2EVNj5FDDkgtMfDBu3V69/jeqQ6WeGTdnsPRWlyB7FCVYw8Z3/XTrKBP3ZkXH7d008SHmYuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784029639; c=relaxed/simple;
	bh=DF0tuHwjjdOjosgy0BJiTXrXk5A2su/avHcXKW7FWl0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VGbVYB/V9McgS6xeG+BiN9uIvJFnRxTSkcoSrWXbfMdFDb0mClwEWVgi7U/qxAmTLg7HXRgN2CXhsEvY14M7YFP3CLi1uvPU11n2Z/Sw2vuVLq6M+bUukQfMdBD/COdXqdi47tnEfGCT4KtRDf0SoINUvBwWRgaZo7mzMVsr3qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GFq4DFrF; arc=none smtp.client-ip=209.85.216.46
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso960916a91.2
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 04:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784029636; x=1784634436; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D6JbozRMrTeKv2vOMW74ecX1vJXvga7e7fLYQK001e4=;
        b=GFq4DFrFmpYwjm3grvLJ6RM4sI+U8iqrxdXa+KfICuy19dfkjN3O8V10Lyb/XALo5R
         bDKWJHBgw/dwdhZNCfR/DE6uCBjLLQXaNmDvzwPRrYTsF09+U7Nu7iy1VGqVm4B/g+Q6
         ko0mv7DchbnlJakfD8WCbGu9yExTNaEngq6lQPKlx50rgGCjOCgO6ASnRJmeqzrShsd8
         0NFl9x7Xl3Fe/rV17HNnIBFfd/CBNj46co4eg+xdH4mBoIht272tWHt93NxlJPvK0TWf
         qtZN0Hr5q2Ki+JNAKxn6YPGxpnmtGcWsXapMad7Xu5NJcZJHSzCZHhMQTU0aKuZS+rOg
         46Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784029636; x=1784634436;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D6JbozRMrTeKv2vOMW74ecX1vJXvga7e7fLYQK001e4=;
        b=ZEA5ZKFJz1xDa+DqpHVPDcksIjCWIisSN/XNegibl4AOCXHYz6P6dz3+t+kpWZxop5
         XxvEwkXP5+GkbQtUJozifcAq24LhTgKbB5SjcDybuq8CqtulP0kXtRzxK0+065vC5vvy
         Dp2wcc8VuKGOz4k6XyAeHI16hPtgxoHA19BmrhwIRA5aQOy4ntxGlocVRqOA2rjY8VTw
         MMIUpbKY9Zr8vExO82F65EjoXYkS59C9UwX1YdH2FPC9+6BvU00CfiHapO3k18TjpTnd
         MAM9b0/8+XrsXRO9wiWHMjtdWykwUFKFVBmJWcoDx1MELQz1B3fOx2Pzd3g4Z3n1/TED
         1oAA==
X-Forwarded-Encrypted: i=1; AHgh+Rrl4+7y26iutjV1eJz+XwjGfTzohYQTAajWJv0oEE4naED4+0J6uBGF86YmsZvPeFHmZ3fVQvZBg5WBJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGigqulSF+GclfXv10TCSQcJxLF+nzWENy56gfvtyJb5w9mDiC
	KYCBcAUB3gXW4CXnOVz/RGZORbIEBd9UL04EokqBZ58GVbTgCXq8N2CJ
X-Gm-Gg: AfdE7cmJm+ujel+AQW2ZKxIlBOkZhN+fMCvySL5u3NNU5W4LiRp/97+Y23KYDV1Q4+s
	Kbmk7799PMAW52P2bx1tZ/m+PJnZgOuD70bii7p3GYtMOhGPtw54dNmtP32lBvFmY2mij6kcyvU
	vqrWnsj1weAJ6bzIcQoVjQ/nwRY9gSLO1jfCumRZdC55HibiVdgwnY317ENTAE6Tw5cQLDkm4eo
	snsllYsT9CBe4yEwDWDFK6ZOT6p4VCy8Ch1WpAEORRFGXX6Wr0ZqQX4/wD7V5o/Y7EOQ377Eu3O
	sJDdmfsvp6vWXE/MwU6pW+FEx/hazNgeampCqmH4xoDq926LfmXiikS0298tR8zXXrxYun98mn4
	QX32nz/eFMUsHGxgqYQekXTKvoiUM0JpkgWdF4GM7Lontrjal1VNoyw89+0AreDHvRg2Zsg7PWP
	s+d5eh+86Y+1dlSjf4
X-Received: by 2002:a17:90b:3ccc:b0:37f:c2a8:ce45 with SMTP id 98e67ed59e1d1-38dc73b936emr12193575a91.4.1784029635683;
        Tue, 14 Jul 2026 04:47:15 -0700 (PDT)
Received: from baineng-pc.. ([117.133.183.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e17470008sm1356162a91.17.2026.07.14.04.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 04:47:15 -0700 (PDT)
From: Baineng Shou <shoubaineng@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	Sandeep Patil <sspatil@android.com>,
	"Andrew F . Davis" <afd@ti.com>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: stable@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Baineng Shou <shoubaineng@gmail.com>
Subject: [PATCH v3 1/2] dma-buf: dma-heap: don't publish fd before copy_to_user() succeeds
Date: Tue, 14 Jul 2026 19:46:53 +0800
Message-Id: <20260714114654.3885457-2-shoubaineng@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260714114654.3885457-1-shoubaineng@gmail.com>
References: <CABdmKX21NHc2=9Sk2F-BFpu6is0vTg-QXLE+wiFNEPdsWWjvog@mail.gmail.com>
 <20260714114654.3885457-1-shoubaineng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.linaro.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67559-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[shoubaineng@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:tjmercier@google.com,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:sspatil@android.com,m:afd@ti.com,m:srini@kernel.org,m:stable@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:shoubaineng@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shoubaineng@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE8A8754407

DMA_HEAP_IOCTL_ALLOC allocates a dma-buf and installs an fd into the
caller's fd table via dma_buf_fd() -> fd_install() before
dma_heap_ioctl() copies the result back to userspace.  If the trailing
copy_to_user() fails, userspace never learns the fd number, but the
fd (and the underlying dma-buf reference) are already visible to
other threads in the same process and are leaked for the lifetime of
the process.

The obvious "close it on the failure path" fix is unsafe: once
fd_install() has run, another thread can already dup() the fd, send
it via SCM_RIGHTS, or close() it and let its number be reused, so a
subsequent close_fd() from the ioctl path can operate on an unrelated
file.  This was pointed out by Christian König on v1 [1].

Restructure the allocation path so that fd_install() is the last,
unfailable step of a successful ioctl:

  1. heap->ops->allocate()      creates the dma_buf.
  2. get_unused_fd_flags()      reserves an fd number in the caller's
                                fd table without publishing it, so
                                no other thread can observe it.
  3. copy_to_user()             delivers the fd number to userspace;
                                on failure the fd is returned with
                                put_unused_fd() and the dma_buf
                                reference is dropped with
                                dma_buf_put(), leaving no user-
                                visible state behind.
  4. dma_buf_fd_install()       publishes the fd and emits the
                                trace_dma_buf_fd tracepoint -- from
                                here on the ioctl cannot fail.

A new dma_buf_fd_install() helper is introduced in dma-buf.c to wrap
fd_install() together with the DMA_BUF_TRACE() call, preserving the
export tracing that dma_buf_fd() provides.  dma_heap_ioctl_allocate()
is refactored to return the struct dma_buf * directly (returning
ERR_PTR on failure) so the caller holds the dmabuf reference across
steps 3 and 4.

The failure at step 3 is easily reachable from userspace: pass a
struct dma_heap_allocation_data that lives in a page whose protection
is flipped to PROT_READ between copy_from_user() and copy_to_user()
(e.g. via mprotect()).  Before this change each such ioctl leaks one
dmabuf fd; after it, the fd table is unchanged on failure and only
/dev/dma_heap/<name> remains open.

No UAPI or heap-driver interface change.

[1] https://lore.kernel.org/dri-devel/175e98de-f414-47d7-81c1-c0fe0a8f7f62@amd.com/

Fixes: c02a81fba74f ("dma-buf: Add dma-buf heaps framework")
Cc: stable@vger.kernel.org
Reviewed-by: T.J. Mercier <tjmercier@google.com>
Signed-off-by: Baineng Shou <shoubaineng@gmail.com>
---
 drivers/dma-buf/dma-buf.c  | 20 ++++++++++
 drivers/dma-buf/dma-heap.c | 80 +++++++++++++++++++-------------------
 include/linux/dma-buf.h    |  1 +
 3 files changed, 61 insertions(+), 40 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index d504c636dc29..4c9add51f9ef 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -803,6 +803,26 @@ int dma_buf_fd(struct dma_buf *dmabuf, int flags)
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_fd, "DMA_BUF");
 
+/**
+ * dma_buf_fd_install - install a reserved fd for a dma-buf
+ * @dmabuf:	[in]	pointer to dma_buf
+ * @fd:		[in]	fd reserved with get_unused_fd_flags()
+ *
+ * Publishes a previously reserved fd into the caller's fd table.
+ * Must only be called after all fallible work (e.g. copy_to_user)
+ * has succeeded, as it cannot be undone safely once called.
+ *
+ * The caller is responsible for having emitted the trace event
+ * (via dma_buf_fd() or get_unused_fd_flags() + this function)
+ * before calling this.
+ */
+void dma_buf_fd_install(struct dma_buf *dmabuf, int fd)
+{
+	DMA_BUF_TRACE(trace_dma_buf_fd, dmabuf, fd);
+	fd_install(fd, dmabuf->file);
+}
+EXPORT_SYMBOL_NS_GPL(dma_buf_fd_install, "DMA_BUF");
+
 /**
  * dma_buf_get - returns the struct dma_buf related to an fd
  * @fd:	[in]	fd associated with the struct dma_buf to be returned
diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index a76bf3f8b071..43c32fb28313 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -55,33 +55,6 @@ MODULE_PARM_DESC(mem_accounting,
 		 "Enable cgroup-based memory accounting for dma-buf heap allocations (default=false).");
 EXPORT_SYMBOL_NS_GPL(mem_accounting, "DMA_BUF_HEAP");
 
-static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
-				 u32 fd_flags,
-				 u64 heap_flags)
-{
-	struct dma_buf *dmabuf;
-	int fd;
-
-	/*
-	 * Allocations from all heaps have to begin
-	 * and end on page boundaries.
-	 */
-	len = PAGE_ALIGN(len);
-	if (!len)
-		return -EINVAL;
-
-	dmabuf = heap->ops->allocate(heap, len, fd_flags, heap_flags);
-	if (IS_ERR(dmabuf))
-		return PTR_ERR(dmabuf);
-
-	fd = dma_buf_fd(dmabuf, fd_flags);
-	if (fd < 0) {
-		dma_buf_put(dmabuf);
-		/* just return, as put will call release and that will free */
-	}
-	return fd;
-}
-
 static int dma_heap_open(struct inode *inode, struct file *file)
 {
 	struct dma_heap *heap;
@@ -99,30 +72,42 @@ static int dma_heap_open(struct inode *inode, struct file *file)
 	return 0;
 }
 
-static long dma_heap_ioctl_allocate(struct file *file, void *data)
+static struct dma_buf *dma_heap_ioctl_allocate(struct file *file, void *data)
 {
 	struct dma_heap_allocation_data *heap_allocation = data;
 	struct dma_heap *heap = file->private_data;
+	struct dma_buf *dmabuf;
 	int fd;
+	size_t len;
 
 	if (heap_allocation->fd)
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 
 	if (heap_allocation->fd_flags & ~DMA_HEAP_VALID_FD_FLAGS)
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 
 	if (heap_allocation->heap_flags & ~DMA_HEAP_VALID_HEAP_FLAGS)
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
+
+	len = PAGE_ALIGN(heap_allocation->len);
+	if (!len)
+		return ERR_PTR(-EINVAL);
+
+	dmabuf = heap->ops->allocate(heap, len, heap_allocation->fd_flags,
+				     heap_allocation->heap_flags);
 
-	fd = dma_heap_buffer_alloc(heap, heap_allocation->len,
-				   heap_allocation->fd_flags,
-				   heap_allocation->heap_flags);
-	if (fd < 0)
-		return fd;
+	if (IS_ERR(dmabuf))
+		return dmabuf;
+
+	fd = get_unused_fd_flags(heap_allocation->fd_flags);
+	if (fd < 0) {
+		dma_buf_put(dmabuf);
+		return ERR_PTR(fd);
+	}
 
 	heap_allocation->fd = fd;
 
-	return 0;
+	return dmabuf;
 }
 
 static unsigned int dma_heap_ioctl_cmds[] = {
@@ -138,6 +123,8 @@ static long dma_heap_ioctl(struct file *file, unsigned int ucmd,
 	unsigned int in_size, out_size, drv_size, ksize;
 	int nr = _IOC_NR(ucmd);
 	int ret = 0;
+	int fd;
+	struct dma_buf *dmabuf;
 
 	if (nr >= ARRAY_SIZE(dma_heap_ioctl_cmds))
 		return -EINVAL;
@@ -174,15 +161,28 @@ static long dma_heap_ioctl(struct file *file, unsigned int ucmd,
 
 	switch (kcmd) {
 	case DMA_HEAP_IOCTL_ALLOC:
-		ret = dma_heap_ioctl_allocate(file, kdata);
+		dmabuf = dma_heap_ioctl_allocate(file, kdata);
+
+		if (IS_ERR(dmabuf)) {
+			ret = PTR_ERR(dmabuf);
+			break;
+		}
+
+		fd = ((struct dma_heap_allocation_data *)kdata)->fd;
+		if (copy_to_user((void __user *)arg, kdata, out_size) != 0) {
+			put_unused_fd(fd);
+			dma_buf_put(dmabuf);
+			ret = -EFAULT;
+		} else {
+			dma_buf_fd_install(dmabuf, fd);
+		}
+
 		break;
 	default:
 		ret = -ENOTTY;
 		goto err;
 	}
 
-	if (copy_to_user((void __user *)arg, kdata, out_size) != 0)
-		ret = -EFAULT;
 err:
 	if (kdata != stack_kdata)
 		kfree(kdata);
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index d1203da56fc5..d15b2b31d3c9 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -567,6 +567,7 @@ void dma_buf_unpin(struct dma_buf_attachment *attach);
 struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info);
 
 int dma_buf_fd(struct dma_buf *dmabuf, int flags);
+void dma_buf_fd_install(struct dma_buf *dmabuf, int fd);
 struct dma_buf *dma_buf_get(int fd);
 void dma_buf_put(struct dma_buf *dmabuf);
 
-- 
2.34.1


