Return-Path: <linux-media+bounces-12624-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E7E8FDC76
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 04:02:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EBFC1C22A12
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 02:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12D0F17579;
	Thu,  6 Jun 2024 02:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZ4Y8s4E"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D3719D888;
	Thu,  6 Jun 2024 02:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717639361; cv=none; b=CAHI9szmjfOElTcvC2i5NeLndMMHNsBm1JPo5zDrxT5wurmhkEWWCUpHd0ovpml8/lKCZAoUsuo0u9l1itjVSjVWaBwOWfo+8gk7JX+fjQiYLwMmRuda7fAYrSAR+K7ktBuFsZ85w6AxdMu2yTgB8X9vSCMHbbyCMUwFCOkerWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717639361; c=relaxed/simple;
	bh=HnwwfAUgc11cwTfF//zRNuCOXe/nsNHF5nif1iH6+jM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LOtwmbs4QrAOdeFDPNeStyZiMask1vw1AYOriKLgWV2ZMhaaBAsYA5mdZGG551AmHZPGZ2GCux6SkvmB0YvDqxwLM0aUMsU8TcmERIsmYbxdMuuXO7mSQxXnSNxqd3gpY3vLU/JSqd7KwDA1NBEZpcy6wuSuC3CoAyC0BgAyLGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UZ4Y8s4E; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-374a817a1efso879575ab.2;
        Wed, 05 Jun 2024 19:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717639359; x=1718244159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y2QdOJgbAl50VR+ODfvH7gZ+/T+swJOLHiP22D6L4FU=;
        b=UZ4Y8s4EOegVNBR3Jk/S3WEQ0V/g9pk+coMMNr4yXBK3Om8vTA/qIQjdyvvdtv9/CN
         iesDWowlfBTxmf23jNIUtMkEeEuEqz6NsdyHr0IlU068v+QiGGzPtXQuPUx3sORIDQ0F
         hmQs/gSkqQW9murVKFIMubOxEcGoDBGbzw7bhD5VWJkbTj6b7nLXqAP33G9J/DvEgjw2
         53HaxZBukoDhlNCtcBelCfrj+eV46rLwFFddslc8jxsAfb6PMJTGjVYqS7DTUJch4XnC
         qR0cSzXNt+z7AW+4kf5+LnKq2z2rMN07wY3pQOkPCWP49FUWQN09S3NZiFO1RG04xE37
         2wcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717639359; x=1718244159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y2QdOJgbAl50VR+ODfvH7gZ+/T+swJOLHiP22D6L4FU=;
        b=uOpX2kGuxB8JUUTtPEuy7xHbIcxFV1U4XbD5hdaci02JPZwmpy80/Pf53gBziEau6S
         5oLA/KZtxCL6Ny2LnVb6tNUQoS+m6k1s+XcjOTfYxoDR0SutguHfknmIrXS16s0bhYTR
         B/IniYCnYO8NbbhnlyXAatm1YmF+/8JGnQKwp0PGnyHIJWIx3mSo1JdC3ZlSSjG3dr/9
         Zq4HxjnfMmdl8e6xIdF3dYSUiEU9MgiWgNxxXMGHpC3BWfqPsnRDVbRkws1KejwxJEI6
         YmWV5nllIcBh9BGyhIa5ssSVcKkN6iFx6vt4F9jICW9Xhq9HNtnKeaZOAVmZCAM+c8u1
         blGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVs7+qxB8V+zKgzgqwxz4a0RXagi5Fq2p3UK+6TIBsu5oYd67W0REKvDFeyyzaYLSIh3sM6LTN4JGg4knMCMn/HgSfdwG2yiGa3R3B8xBKXkEq7n8Eq9CDIC1c80m86nKKJZJkPQmSym+c=
X-Gm-Message-State: AOJu0Yx+r0b46tSBpNWiW00socqZ9TxABXaL6gUygz7kxLMdJ59bteYD
	WwMw7VmaVIBfHFEM8oTLZIUMZm9AZypi9dDofachNXfO2igHtFxt
X-Google-Smtp-Source: AGHT+IHSlq08K6ZWDsLBXbZsGjCQVfOxpwCNbb3VH35IvWPENt/ubsieRel0edwXuueEaRAnR54btw==
X-Received: by 2002:a92:ca0b:0:b0:374:a7d0:b0bc with SMTP id e9e14a558f8ab-374b1f3ee14mr47382305ab.23.1717639359104;
        Wed, 05 Jun 2024 19:02:39 -0700 (PDT)
Received: from localhost.localdomain ([2407:7000:8942:5500:aaa1:59ff:fe57:eb97])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6de28f37482sm164515a12.94.2024.06.05.19.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 19:02:38 -0700 (PDT)
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
Subject: [PATCH] dma-buf/heaps: Correct the types of fd_flags and heap_flags
Date: Thu,  6 Jun 2024 14:02:13 +1200
Message-Id: <20240606020213.49854-1-21cnbao@gmail.com>
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

But dma heaps are casting both fd_flags and heap_flags into
unsigned long. This patch makes dma heaps - cma heap and
system heap have consistent types with UAPI.

Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 drivers/dma-buf/heaps/cma_heap.c    | 4 ++--
 drivers/dma-buf/heaps/system_heap.c | 4 ++--
 include/linux/dma-heap.h            | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 4a63567e93ba..c384004b918e 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -274,8 +274,8 @@ static const struct dma_buf_ops cma_heap_buf_ops = {
 
 static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
 					 unsigned long len,
-					 unsigned long fd_flags,
-					 unsigned long heap_flags)
+					 u32 fd_flags,
+					 u64 heap_flags)
 {
 	struct cma_heap *cma_heap = dma_heap_get_drvdata(heap);
 	struct cma_heap_buffer *buffer;
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 9076d47ed2ef..d78cdb9d01e5 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -333,8 +333,8 @@ static struct page *alloc_largest_available(unsigned long size,
 
 static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 					    unsigned long len,
-					    unsigned long fd_flags,
-					    unsigned long heap_flags)
+					    u32 fd_flags,
+					    u64 heap_flags)
 {
 	struct system_heap_buffer *buffer;
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
index 0c05561cad6e..064bad725061 100644
--- a/include/linux/dma-heap.h
+++ b/include/linux/dma-heap.h
@@ -23,8 +23,8 @@ struct dma_heap;
 struct dma_heap_ops {
 	struct dma_buf *(*allocate)(struct dma_heap *heap,
 				    unsigned long len,
-				    unsigned long fd_flags,
-				    unsigned long heap_flags);
+				    u32 fd_flags,
+				    u64 heap_flags);
 };
 
 /**
-- 
2.34.1


