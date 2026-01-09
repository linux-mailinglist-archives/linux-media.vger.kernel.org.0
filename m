Return-Path: <linux-media+bounces-50277-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DD0D09254
	for <lists+linux-media@lfdr.de>; Fri, 09 Jan 2026 13:00:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C3B830BB669
	for <lists+linux-media@lfdr.de>; Fri,  9 Jan 2026 11:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA0A359F86;
	Fri,  9 Jan 2026 11:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mo8uNNpJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E304C33C52A
	for <linux-media@vger.kernel.org>; Fri,  9 Jan 2026 11:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767959662; cv=none; b=g4yr3sKCmkLfMaWselhURlh2LUFBDK2fRVN/rdcqUPvsarKKSOPRTAWqt+lGTSZB2hKtTuTGvxFcxirbCPfQCgdIXcfEgbzjMCZPE/aH1zOfQI2cyIDVtoIslQCb3Fl2RiXlMFR1/ztXPaYo7W4C1Rl31jNn6nfXUpLoZ9wY0Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767959662; c=relaxed/simple;
	bh=EhmC6nkin4PeFKbgEaHMt9Z8GHXTiocoHrURIkp2DIA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TvqST2lP5WGuBiaDmh2GhN+6HDIZuDmaZNIkfbXCCeYRk9hi8ibe1+m0+IWPhkeL+of4+r6MzV/PbJw/dyGM2+t4aEHj4pxOZdLGN12/1z8/9JvCye4Kx6uUGg5H8cquzHyeHVQ/IEWHrjvxua+/WgTU4koEA2TkKL1sHugR/8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mo8uNNpJ; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-81e821c3d4eso330408b3a.3
        for <linux-media@vger.kernel.org>; Fri, 09 Jan 2026 03:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767959660; x=1768564460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JauvZBqo6Cva8p0R8RkbxSWRYj4m+D5povLuy9EeYqI=;
        b=mo8uNNpJ+9MVB+11pJeY8eZr3QBOyQeHSYSNKqCL2VLa3tPTMSh05gh1dupaZ5ttco
         uSY1d93hrc9mGNfhDraEHZDFJs49Fos+vHoFwTnOzob5Yd+jDzvC5d2ift7IXvYn/GWJ
         EGwaZhDuDE+gBDU5bK9A3NPlfU++7ZUuuLtei76dSmIWDCXXvDzlgv715CbuPAsXBJ3V
         rekVA8M2Hr72k5sHPzNT3FjJvr9wbfrrrwYOtzwxnyTJUMFdMSbOOtea2HwwK89EkQfi
         2YFSiF2bSn/WT8tk8zprvdhC9H7n061f2Qpmpa5wR3mdRRlc3l86FqFuGNkjMnD5khVr
         TZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767959660; x=1768564460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JauvZBqo6Cva8p0R8RkbxSWRYj4m+D5povLuy9EeYqI=;
        b=ZB2o/XFyq6K0YAMnzU288N49TvHfPA823wmylrBCLgp9dkzaMYQyok9GRJI4OZcW5g
         u6tVI7IleHIiuyYrogx9az+cIcBZOhaMVC4rY2JgWTxpcFHz9SQGZ4owOwtZQhX/Vgbj
         ijeUmEdEWwnx3WtcCR0X96lWtTMdf9RhLKjVZMqbtj1tZkEkMkMLR81anrTX4swA1Msc
         zdGWEq2S1/T+xBSZmYBmmqJtzriymp2Wna0pan4FUN5QpJ1bzdqMH43dw1vb/ZeykFNV
         Ly725fvhIq8+//gM6dXD+c9kIZYYla67eEhT38co2MG8q3tjYWX+1w97xKmIBwbqwKxT
         NaEw==
X-Gm-Message-State: AOJu0YzoR9lli3iMv4er6t30Vo9wAPL2amScmlFoL5Ov8YuSG+PcWDPZ
	/8yJFIxm2SrBcmrK22HSc9XePkU9CifPQED5M5G/sMke28GRn5ycyWxSFVugZh3Vv5w=
X-Gm-Gg: AY/fxX6+clPnem3EhXfw7KRyrLDExGpu/tiHtqEklS5ZJLnXnfrxyrf9iJEjlxEOS1o
	NmbDRbUjw5BpdYJBld2k71Te9tQS5rZLVA8Of6WFytHwyWDbXvAtUlQ2UEc6jag+k6btoJb5H2a
	OtleyQMiaDjxXBiYWf3M0VqrvbEe3mB1iApgJMmL9vhYdNNIF6chdDS34Bkds7deHDDxKtFqrRe
	hcw/eBdFoC/WjCm79N6HajRGhJzjEDc+Wment1a3ZrrgFE1/XZ4aBaYDBVoqzHZjZhJGFJBvoYy
	vyyH+gPIMDVB3He/xI8Okrb2tv9Y6ntpWebaB14tAGng7QOYuIfh0ziim9gvPF03N/9aFIT04ah
	uDyNOQndOnfTiDEzA7efhEuEsO9muV4Fjct2rm1gO3pRzvFQmiA3Ry0byA0vr+KMHuOdWvTOuPw
	9k5+zfQtVsgIZkECafAM6p
X-Google-Smtp-Source: AGHT+IGJsJDUNZxvJK6DcdFcbMt6f0ivnHHKsdAWaZ5McyHBHiarLs2CuBwbrEcuofVCQILi6kXTFw==
X-Received: by 2002:a05:6a00:4c0b:b0:7ae:fea:e928 with SMTP id d2e1a72fcca58-81b7de5d195mr8325201b3a.18.1767959660179;
        Fri, 09 Jan 2026 03:54:20 -0800 (PST)
Received: from xiao.mioffice.cn ([43.224.245.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81dab89f2a5sm2757485b3a.56.2026.01.09.03.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 03:54:19 -0800 (PST)
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
Subject: [PATCH v13] dma-buf: add some tracepoints to debug.
Date: Fri,  9 Jan 2026 19:54:11 +0800
Message-Id: <20260109115411.115270-1-gxxa03070307@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <7e126504-1966-4c63-8db5-dfe57e206169@amd.com/>
References: <7e126504-1966-4c63-8db5-dfe57e206169@amd.com/>
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

Changes since v12: https://lore.kernel.org/all/20251229031547.59272-1-gxxa03070307@gmail.com/
- list history changes

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

 drivers/dma-buf/dma-buf.c      |  9 ++----
 include/trace/events/dma_buf.h | 50 ++++++++++++++++++----------------
 2 files changed, 29 insertions(+), 30 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index a4d8f2ff94e4..ac4238063ec1 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -48,12 +48,10 @@
  */
 #define DMA_BUF_TRACE(FUNC, ...)					\
 	do {								\
-		if (FUNC##_enabled()) {					\
+		/* Always expose lock if lockdep is enabled */		\
+		if (IS_ENABLED(CONFIG_LOCKDEP) || FUNC##_enabled()) {	\
 			guard(spinlock)(&dmabuf->name_lock);		\
 			FUNC(__VA_ARGS__);				\
-		} else if (IS_ENABLED(CONFIG_LOCKDEP)) {		\
-			/* Expose this lock when lockdep is enabled */	\
-			guard(spinlock)(&dmabuf->name_lock);		\
 		}							\
 	} while (0)
 
@@ -806,8 +804,7 @@ int dma_buf_fd(struct dma_buf *dmabuf, int flags)
 		return -EINVAL;
 
 	fd = FD_ADD(flags, dmabuf->file);
-	if (fd >= 0)
-		DMA_BUF_TRACE(trace_dma_buf_fd, dmabuf, fd);
+	DMA_BUF_TRACE(trace_dma_buf_fd, dmabuf, fd);
 
 	return fd;
 }
diff --git a/include/trace/events/dma_buf.h b/include/trace/events/dma_buf.h
index 35f8140095f4..3bb88d05bcc8 100644
--- a/include/trace/events/dma_buf.h
+++ b/include/trace/events/dma_buf.h
@@ -15,15 +15,15 @@ DECLARE_EVENT_CLASS(dma_buf,
 	TP_ARGS(dmabuf),
 
 	TP_STRUCT__entry(
-		__string(exp_name, dmabuf->exp_name)
-		__field(size_t, size)
-		__field(ino_t, ino)
+		__string(	exp_name,		dmabuf->exp_name)
+		__field(	size_t,			size)
+		__field(	ino_t,			ino)
 	),
 
 	TP_fast_assign(
 		__assign_str(exp_name);
-		__entry->size = dmabuf->size;
-		__entry->ino = dmabuf->file->f_inode->i_ino;
+		__entry->size	= dmabuf->size;
+		__entry->ino	= dmabuf->file->f_inode->i_ino;
 	),
 
 	TP_printk("exp_name=%s size=%zu ino=%lu",
@@ -40,21 +40,21 @@ DECLARE_EVENT_CLASS(dma_buf_attach_dev,
 	TP_ARGS(dmabuf, attach, is_dynamic, dev),
 
 	TP_STRUCT__entry(
-		__string(dev_name, dev_name(dev))
-		__string(exp_name, dmabuf->exp_name)
-		__field(size_t, size)
-		__field(ino_t, ino)
-		__field(struct dma_buf_attachment *, attach)
-		__field(bool, is_dynamic)
+		__string(	dev_name,			dev_name(dev))
+		__string(	exp_name,			dmabuf->exp_name)
+		__field(	size_t,				size)
+		__field(	ino_t,				ino)
+		__field(	struct dma_buf_attachment *,	attach)
+		__field(	bool,				is_dynamic)
 	),
 
 	TP_fast_assign(
 		__assign_str(dev_name);
 		__assign_str(exp_name);
-		__entry->size = dmabuf->size;
-		__entry->ino = dmabuf->file->f_inode->i_ino;
-		__entry->is_dynamic = is_dynamic;
-		__entry->attach = attach;
+		__entry->size		= dmabuf->size;
+		__entry->ino		= dmabuf->file->f_inode->i_ino;
+		__entry->is_dynamic	= is_dynamic;
+		__entry->attach		= attach;
 	),
 
 	TP_printk("exp_name=%s size=%zu ino=%lu attachment:%p is_dynamic=%d dev_name=%s",
@@ -73,17 +73,17 @@ DECLARE_EVENT_CLASS(dma_buf_fd,
 	TP_ARGS(dmabuf, fd),
 
 	TP_STRUCT__entry(
-		__string(exp_name, dmabuf->exp_name)
-		__field(size_t, size)
-		__field(ino_t, ino)
-		__field(int, fd)
+		__string(	exp_name,		dmabuf->exp_name)
+		__field(	size_t,			size)
+		__field(	ino_t,			ino)
+		__field(	int,			fd)
 	),
 
 	TP_fast_assign(
 		__assign_str(exp_name);
-		__entry->size = dmabuf->size;
-		__entry->ino = dmabuf->file->f_inode->i_ino;
-		__entry->fd = fd;
+		__entry->size	= dmabuf->size;
+		__entry->ino	= dmabuf->file->f_inode->i_ino;
+		__entry->fd	= fd;
 	),
 
 	TP_printk("exp_name=%s size=%zu ino=%lu fd=%d",
@@ -137,11 +137,13 @@ DEFINE_EVENT(dma_buf_attach_dev, dma_buf_detach,
 	TP_ARGS(dmabuf, attach, is_dynamic, dev)
 );
 
-DEFINE_EVENT(dma_buf_fd, dma_buf_fd,
+DEFINE_EVENT_CONDITION(dma_buf_fd, dma_buf_fd,
 
 	TP_PROTO(struct dma_buf *dmabuf, int fd),
 
-	TP_ARGS(dmabuf, fd)
+	TP_ARGS(dmabuf, fd),
+
+	TP_CONDITION(fd >= 0)
 );
 
 DEFINE_EVENT(dma_buf_fd, dma_buf_get,
-- 
2.34.1


