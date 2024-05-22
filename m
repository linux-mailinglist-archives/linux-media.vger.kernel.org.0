Return-Path: <linux-media+bounces-11713-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E07FB8CBD6F
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 11:02:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 058CD1C2099B
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 09:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 579017FBBE;
	Wed, 22 May 2024 09:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H4+W7yQj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BE418EB1;
	Wed, 22 May 2024 09:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716368571; cv=none; b=HrEM+egvLRthT+I8+/xrTq/XVXzxMwOT0A8rWtkOiMOS80CPsw//0/gxvWmbd8NYsysA6R0wMAA4MdVW5Ztjegv8iudhWuCjk27XXyob2ejlqIAd+L6+ZjMQaHaE2KWfCUybw0oHkeNCH2Nc5AIA9Ewlq358s6191IylHDyW0Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716368571; c=relaxed/simple;
	bh=df1Xo2E4oNV3Ik/iVOCYN6L6LPpEV5UloozS7oqR3Sg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kzRwhdYLZUpcXaQRIcpPRdyM3/cXm+ucylXRm3R6w8jdGi+TL8Lpy48VyfdB2hl6aWfulOB+XiRn2SHlCURRK+yrYyz9omh6i2DNtN935AZSSQIvyVQy4kwsgdab2cQjymdarKh4fjEPYY9ZarkJsgX8X9FDflEyQuA56YOJhto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H4+W7yQj; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1eeabda8590so7962485ad.0;
        Wed, 22 May 2024 02:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716368566; x=1716973366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nLNtBYttVOortE4drZbAdtdQ+c5yWCs8A7f+Kl7W60c=;
        b=H4+W7yQj7Ep82CMdk0DSqjWuA+jd7e8oEORZw5+GEidBaKGkPxy1stTRE6qUhyT0Fj
         aJZ51cmszUvbXyxdDyRaQ+KlVewiw/rzythgOVYWFTWRG+T7rzUZMBGrNbtKrfF7+g06
         hlbXaj7TYxCB+V+/Gn8bVZOADojfJXVPEgsGlVdhp+FwaPTFooytIqVcS5qgnqSFV/KP
         58BkddzkSgq43xhoGaBchn2VDglDHwJI2ypm050f3d2upixOnCkTUOnpWM2M38z5eBgx
         qx1ulMiuHnO9/A2UinRUO2T0T/RatRqtdmqmATRcIXipRGbXE24J4LVL23uCYdhRPvED
         nU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716368566; x=1716973366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nLNtBYttVOortE4drZbAdtdQ+c5yWCs8A7f+Kl7W60c=;
        b=pyyyIp/FiZKzRERLnotunFlZwBTpcMw/97pdZ4i3X/5G2j9eFpB6U/f+o5ehMj0sdF
         pOttHpxut6Y9Qt7qwBjtq/OhYFXnf9vSnwbqpTe8x66SVe+wwT+ue16S8JRqK/NKBuDR
         0ewVrtQFZ1R8eRZmATn1jDXOdTSNDxyuv/qHZgJ0EOoPMrttb7FurR20B2nD6LvCCOxj
         qHxgHlwjr2TyAmClemK9ZTJG61O8daz3/0u9YRTedKameH8MyP8fgzN/ykXbOh5xA8uc
         7JxAXpDVOGcJ/vfNch/C+lxA5G2FG/8EsVvcPquymX9y+fMycjFB9ixpjMeVEZsWnXeA
         eJ7Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5Xgd5HO4hmgc3qfHaVRQ14oBMH/ofTdMzHq8txxiRQhf+hKt5YzPMisRU6E3XkWxqvHK8DarXDO9H5yXjA7NPww961RwUlFv7VUA=
X-Gm-Message-State: AOJu0Yx8lcsY8848zdkCOXlW3Xom1W05Subi8sf5G4SnCHISOQioszPZ
	1RfaPFaN60J5FfsqCl2rZRYr155mfVegi39ePNrPG2Oyj2fLgJIU
X-Google-Smtp-Source: AGHT+IF29gJJxooGTt+9X3IuC3RscusZu+sJgvCtr+mjChH43A1gvSfHGvV2d3z6054ZVRbSW9iN0Q==
X-Received: by 2002:a17:902:ecc7:b0:1f3:53c:32be with SMTP id d9443c01a7336-1f31c95c225mr15349755ad.2.1716368566546;
        Wed, 22 May 2024 02:02:46 -0700 (PDT)
Received: from localhost.localdomain ([2407:7000:8942:5500:aaa1:59ff:fe57:eb97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bad819csm235033875ad.84.2024.05.22.02.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 02:02:46 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: sumit.semwal@linaro.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
	benjamin.gaignard@collabora.com,
	Brian.Starkey@arm.com,
	jstultz@google.com,
	tjmercier@google.com,
	christian.koenig@amd.com,
	Barry Song <v-songbaohua@oppo.com>
Subject: [RFC PATCH] dma-buf: align fd_flags and heap_flags with dma_heap_allocation_data
Date: Wed, 22 May 2024 21:01:58 +1200
Message-Id: <20240522090158.121797-1-21cnbao@gmail.com>
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

However, dma_heap_buffer_alloc() casts them into unsigned int. It's unclear
whether this is intentional or what the purpose is, but it can be quite
confusing for users.

Adding to the confusion, dma_heap_ops.allocate defines both of these as
unsigned long. Fortunately, since dma_heap_ops is not part of the UAPI,
it is less of a concern.

struct dma_heap_ops {
        struct dma_buf *(*allocate)(struct dma_heap *heap,
                                    unsigned long len,
                                    unsigned long fd_flags,
                                    unsigned long heap_flags);
};

I am sending this RFC in hopes of clarifying these confusions.

If the goal is to constrain both flags to 32 bits while ensuring the struct
is aligned to 64 bits, it would have been more suitable to define
dma_heap_allocation_data accordingly from the beginning, like so:

 struct dma_heap_allocation_data {
         __u64 len;
         __u32 fd;
         __u32 fd_flags;
         __u32 heap_flags;
	 __u32 padding;
 };

Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
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


