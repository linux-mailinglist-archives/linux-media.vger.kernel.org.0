Return-Path: <linux-media+bounces-12552-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB2C8FC144
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 03:26:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0C471F2310D
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 01:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D24610A1E;
	Wed,  5 Jun 2024 01:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCRJDpBM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6382F44;
	Wed,  5 Jun 2024 01:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717550790; cv=none; b=fmmzh7lBnb45w98I99nMrax/BSSKMY+Deqyl4090p1G9dsLmJqDB0JDOn0naTBmhZdka8aM3qi+IHsQ4LrY8exzJKz0tCbms29iO2PHUWM/SHf0Je2UH0uabA5QZ343nYT2qgfG/XS4qftcYulBhl2cY5CrhfC27F7QC2fO91+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717550790; c=relaxed/simple;
	bh=pfnjwzyV08UL5l8zXUi9O3kqZDZoSJafjB4pwAi3Ir0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EzF3GshklAoQmX9o7jFjJ9bEv2e0WnhLmYrhO5wPrr3045Yf5HR1XADc3CeXnE47U2DF0OoY5HaeKJ+eKyD9C9gQN/kWxlLrJpX5EwBEQwUCb4S5UNvDEwmVTS8/RcEaLw5vimeB6HagCCXgeTm4vKg5dxbuRzV1mwATR960FzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCRJDpBM; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-6ce533b643dso2024060a12.3;
        Tue, 04 Jun 2024 18:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717550789; x=1718155589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RUIjL2bB2TqpHtA3OGdQJrt/bxd1bdS7vuCMFqU7/Ts=;
        b=WCRJDpBMi9XiFIFW8SKYhFEa5/SqIMYQZXyPWMgQNM3kAT9BHKrUHC+Are7/2iakFj
         +DlG/sDys/23RyEv8cKuxCK7RmSJMLIUzpGzv/4an/Ou1KxMJSj0GFWOyjBHu85pCE7+
         LbTgSZmp3kZyLyujCFdKwSlUR29XknFBYfGYYas2JgKnzHbHbxVCdk22VuOLldnkBKnI
         Ea3RWQ0WFxHzoIILg4cmQRys+BwwUF0ubby9sYOTmmMoas8EjrWGb/cxiTiu3hRe2JAS
         /15TeBMScg7vg3ZnkOYzpdO7Qk3tYAsg09ZGZyLZmnW7iI+pLD4lN+LkZUCl5s67iCe+
         P4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717550789; x=1718155589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RUIjL2bB2TqpHtA3OGdQJrt/bxd1bdS7vuCMFqU7/Ts=;
        b=q2cSnLtateZ4sYK8N+v+75kO0UfBy1jcergwhZ/2uOo4OrMHplYfo8jldJ9TeWIvZB
         VXxmA055idF20nVhYr4JY6GCDZzQnWsh3syvXM/zdyGkKrYq7jMwFh+NtP01bMwZCXB4
         9IwQWQr2+DyxC6l4YqL6BBzVjtUHR/inFrhXP7SghGPWxVa4sJEdkmK/4NQEnZr60SCL
         z90oq+8/KgCQdtTEbii9OJbnbe1sDTn0aJSGLzHZICg8GZ+BVS2zxkCJ5Or1P3TVA25X
         HtoVerfsalVrVgwTocJBzbkd66IzsJxrmFFhW1fHhUQPfwHndaoSuW/2FOwGUnM3Utt3
         1cLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwiuk+rU+nqTyXmo+EIO6Y7VRa57UWMTs174WyOtJT96zr6rxT7Kkr3hvZO8fY6ErmwmXWNzXDmQgcha0/WIgXAgbEFEKSHpWIvu8ySJXyrxZMVB3pBwSs+WI5TR/GN2qpTC/t2OHZeSw=
X-Gm-Message-State: AOJu0YwCGsw4IcEJDQf7j8Fz3hwGRJpVHgy8KiA2aedhJkwWAvt3VgSB
	3eE6FKiAsGJnhsttdrYAwqGu+eCiS3Mia4fOXYZlCair5VIKbwmR
X-Google-Smtp-Source: AGHT+IGuTZCyKrper2d0FzGSQcG256xnePEMwZfbyz58T1ZcrICBdGuafuNDPsQyZ8zq1/vaVlDFFA==
X-Received: by 2002:a17:90a:ac0d:b0:2c1:c648:1c50 with SMTP id 98e67ed59e1d1-2c27db16442mr1073954a91.17.1717550788575;
        Tue, 04 Jun 2024 18:26:28 -0700 (PDT)
Received: from barry-desktop.hub ([2407:7000:8942:5500:aaa1:59ff:fe57:eb97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c2806bd8adsm174203a91.39.2024.06.04.18.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 18:26:28 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org,
	sumit.semwal@linaro.org
Cc: Brian.Starkey@arm.com,
	benjamin.gaignard@collabora.com,
	christian.koenig@amd.com,
	dri-devel@lists.freedesktop.org,
	jstultz@google.com,
	linux-kernel@vger.kernel.org,
	tjmercier@google.com,
	v-songbaohua@oppo.com,
	hailong.liu@oppo.com
Subject: [PATCH v2] dma-buf: align fd_flags and heap_flags with dma_heap_allocation_data
Date: Wed,  5 Jun 2024 13:26:05 +1200
Message-Id: <20240605012605.5341-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Barry Song <v-songbaohua@oppo.com>

dma_heap_allocation_data defines the UAPI as follows:

 struct dma_heap_allocation_data {
 	__u64 len;
 	__u32 fd;
 	__u32 fd_flags;
 	__u64 heap_flags;
 };

However, dma_heap_buffer_alloc() casts both fd_flags and heap_flags
into unsigned int. We're inconsistent with types in the non UAPI
arguments. This patch fixes it.

Signed-off-by: Barry Song <v-songbaohua@oppo.com>
Acked-by: John Stultz <jstultz@google.com>
---
 -v2:
 collect ack of John, thanks!
 refine commit message;

 drivers/dma-buf/dma-heap.c    | 4 ++--
 include/uapi/linux/dma-heap.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 84ae708fafe7..2298ca5e112e 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -50,8 +50,8 @@ static struct class *dma_heap_class;
 static DEFINE_XARRAY_ALLOC(dma_heap_minors);
 
 static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
-				 unsigned int fd_flags,
-				 unsigned int heap_flags)
+				 u32 fd_flags,
+				 u64 heap_flags)
 {
 	struct dma_buf *dmabuf;
 	int fd;
diff --git a/include/uapi/linux/dma-heap.h b/include/uapi/linux/dma-heap.h
index 6f84fa08e074..a4cf716a49fa 100644
--- a/include/uapi/linux/dma-heap.h
+++ b/include/uapi/linux/dma-heap.h
@@ -19,7 +19,7 @@
 #define DMA_HEAP_VALID_FD_FLAGS (O_CLOEXEC | O_ACCMODE)
 
 /* Currently no heap flags */
-#define DMA_HEAP_VALID_HEAP_FLAGS (0)
+#define DMA_HEAP_VALID_HEAP_FLAGS (0ULL)
 
 /**
  * struct dma_heap_allocation_data - metadata passed from userspace for
-- 
2.34.1


