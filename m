Return-Path: <linux-media+bounces-50617-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7F4D1B68C
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 22:34:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B869304EBF4
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 21:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E2134D907;
	Tue, 13 Jan 2026 21:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HnFJOPDy";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bcP/39sL"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A007833FE2B
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 21:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768340003; cv=none; b=nD7fnpctTazOtsviCSpNY/DFTbUAdGrCSrLMwhQMJzVZ+BkZPlGe9qkXqx+GQ14kaDWoUTLqzZtx5EtnRabNz91ztMTvpGPD8bPnlmcQvQSWUPHH3ve3QfrFmwWKpjvLxVtDmz8qfUu7WUcmFg4Ek3SKd0LtjY+ADVn2dEGGVs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768340003; c=relaxed/simple;
	bh=EDJzO86JKqPT/j5xHbRoDVIahm8DxIRb2MqBjzWRIzU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J9ElGO0pRhtbOHDF+q441MJGOFf+elD5/TqxjyK+zkZrgTtW/TuVAbCWxAiRrOn7k281zUHQe2MqTNCssCYmXY02BZcWlg5hm8kF1A9CnqcD2+5ifHXsYtrxwy65Vv8dQiYdezbFpHvhtkG4mvTjBphNMIMaahuW2Yfi5XewRWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HnFJOPDy; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bcP/39sL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768340000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ix94cAHm6joBtNxj2zTeHiWa8RvsRVDwgdWzBk5YVco=;
	b=HnFJOPDyL76Hj+Np1PzN+ymyR6LcG34/wl4los9fa51VFUx8Y32qERAcsLZCrcH4Ts2+Xq
	qjh4ct9dxg9uYQNPNncWRiH4oEdkllp4iyxulptv4OWQMOJDUCvxmtWJ5PRCzY18v0jhJz
	XU2pa0pM4Iioyt+DTQ8Wx4i4OyNoFVw=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-21PqNTJpOUeHazO5aj87rg-1; Tue, 13 Jan 2026 16:33:19 -0500
X-MC-Unique: 21PqNTJpOUeHazO5aj87rg-1
X-Mimecast-MFC-AGG-ID: 21PqNTJpOUeHazO5aj87rg_1768339999
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88883a2cabbso318322276d6.0
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 13:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768339999; x=1768944799; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ix94cAHm6joBtNxj2zTeHiWa8RvsRVDwgdWzBk5YVco=;
        b=bcP/39sLDreiiV9Ab5wHE5E9aQvpWVa6JwTYEGpt0U+ifDOXX47WLXCy7gnY6Je0zv
         BzgOuYRo+W0ABPqbqbHms6n47vuPRa6L1syC1QsyCJywbDYTF4rKtjrADOLisNMUmBrk
         CSum/lvTfhz7NvaSJdRXI0klDY7fs74e/E8f4FNjH1YyJm4JPXXgDUPh2aroiC953y8a
         Qvw7Ez2k/J1jpcmk1p4HKgFN3qXXQ6J/9245erquHaj1r+Me/8S7zz4zd5cyGPLgk13G
         biyXycv/mydnwsz8PDnq0HugZlijT4VdnAuSRHUlrlT9yYYnrJd5fnmzdnzDvXFqMxzZ
         y+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768339999; x=1768944799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ix94cAHm6joBtNxj2zTeHiWa8RvsRVDwgdWzBk5YVco=;
        b=vNBhfJn3Yii87N1vrWFmf95jqaAYwRcQqUeGZBtLF9PmmLeW+QHEJEWd+4hL5dIVeF
         NpZbcKTKFiqopFpW7H53Kp4YbOgYVU1b3E9BUc+VM0QBr+QOyQx1b+J9Ia0ch276pt3I
         8bryf4F2g+x3Y9S/G7Ya0yH3pDhx9Xm1Sn5bGwGaileh5EiYQI7nBzV3/kuKil2pSVFq
         xnbpB6W8k5beBwkgOsonW6UkajG+pAXRkF4AW9dDry+mrocJeJbrOFo8dWdITEEi3bLV
         9Q0bOQYKJB3H280bsAbn1M51ttWPfTA2uIDhu2gxgF+Hbi4tDs38wPl1+tc4/cLMoXQ+
         DTaA==
X-Gm-Message-State: AOJu0YzoIDMkwhj3sObAV4FU3bY9zfYsspw0q1rrz9CKZduRf3LP2mOi
	5izYzGaL4mXMQ1qeSztZ9+RPo6jEzFi2FpfkncRUEwHI0DeOFRJR5dAW0fMqlZLFgfVjJpH5vh1
	kTXBEYYHDWHJAOCAcRxPg4yPXEte6WiP0pZE3ZqAzgJbEBNKCd21YiunLxBWp1iP6
X-Gm-Gg: AY/fxX74QrT4Fswd7RM2yBUzYHBflWLotdI90bwRCPNrEyOaO32/yUg7N7zNXMV5j9y
	t85jVPIhc/m/VBB7/aA10zkGT2KPXdfdZoWfpdzYwzZDItwl41SbQMWVRjAxXWjiDfZRGkFaDEh
	VM82XyX3D+DUyipk8EaA+UR4mJXDT8ieQiqFh82Donz0tFMUAFCOgfU5fTiWf60/RTwePsDdPZS
	HY/Pu30bBaBBozV6qZcfZuSfVbJ/shaB7S8OiPcRyWYeqQvLK2VCLyUoD/hy1tnfhcQIXCH+DVp
	yHOI1AkfkSUzPw+fW3NvnM7+PTyPRbVbF7XeIX22JKiRtaQnAXWUhs/grtmuncr5BdK712pD8ln
	G6BKn6lgIo5cr+L6lER3f2rYkP1cvoJoi9FrvjYTDrR1XsD6WSPM=
X-Received: by 2002:a05:620a:1a1b:b0:8b2:77aa:73d3 with SMTP id af79cd13be357-8c52fb37f7cmr83797285a.2.1768339998757;
        Tue, 13 Jan 2026 13:33:18 -0800 (PST)
X-Received: by 2002:a05:620a:1a1b:b0:8b2:77aa:73d3 with SMTP id af79cd13be357-8c52fb37f7cmr83793585a.2.1768339998302;
        Tue, 13 Jan 2026 13:33:18 -0800 (PST)
Received: from localhost (pool-100-17-20-16.bstnma.fios.verizon.net. [100.17.20.16])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8907726041fsm172437926d6.45.2026.01.13.13.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 13:33:17 -0800 (PST)
From: Eric Chanudet <echanude@redhat.com>
Date: Tue, 13 Jan 2026 16:32:45 -0500
Subject: [PATCH v2 2/2] dma-buf: system_heap: account for system heap
 allocation in memcg
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-dmabuf-heap-system-memcg-v2-2-e85722cc2f24@redhat.com>
References: <20260113-dmabuf-heap-system-memcg-v2-0-e85722cc2f24@redhat.com>
In-Reply-To: <20260113-dmabuf-heap-system-memcg-v2-0-e85722cc2f24@redhat.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Maxime Ripard <mripard@redhat.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Eric Chanudet <echanude@redhat.com>
X-Mailer: b4 0.14.2

The system dma-buf heap lets userspace allocate buffers from the page
allocator. However, these allocations are not accounted for in memcg,
allowing processes to escape limits that may be configured.

Pass __GFP_ACCOUNT for system heap allocations, based on the
dma_heap.mem_accounting parameter, to use memcg and account for them.

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
 drivers/dma-buf/heaps/system_heap.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 4c782fe33fd497a74eb5065797259576f9b651b6..139b50df64ed4c4a6fdd69f25fe48324fbe2c481 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -52,6 +52,8 @@ static gfp_t order_flags[] = {HIGH_ORDER_GFP, HIGH_ORDER_GFP, LOW_ORDER_GFP};
 static const unsigned int orders[] = {8, 4, 0};
 #define NUM_ORDERS ARRAY_SIZE(orders)
 
+extern bool mem_accounting;
+
 static int dup_sg_table(struct sg_table *from, struct sg_table *to)
 {
 	struct scatterlist *sg, *new_sg;
@@ -320,14 +322,17 @@ static struct page *alloc_largest_available(unsigned long size,
 {
 	struct page *page;
 	int i;
+	gfp_t flags;
 
 	for (i = 0; i < NUM_ORDERS; i++) {
 		if (size <  (PAGE_SIZE << orders[i]))
 			continue;
 		if (max_order < orders[i])
 			continue;
-
-		page = alloc_pages(order_flags[i], orders[i]);
+		flags = order_flags[i];
+		if (mem_accounting)
+			flags |= __GFP_ACCOUNT;
+		page = alloc_pages(flags, orders[i]);
 		if (!page)
 			continue;
 		return page;

-- 
2.52.0


