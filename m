Return-Path: <linux-media+bounces-48647-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1648CB705A
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 20:41:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 700DC30161E9
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 19:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD5AB320CCC;
	Thu, 11 Dec 2025 19:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BqUEgWab";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hTcyi2Si"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6C93203A1
	for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 19:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765481514; cv=none; b=JUObAjstReTk8JMVfZ07lfJKSHgqb8u3ZBNup/DJqY2h8QZ+Qtmda71hfaYaI1y5qeAVgpnPUEMRy7pR2pFole4pXrojxZlQRfGxnYwsm88PdLqF1ABAYLOEKuoG1Abbb7wXZzq5UWBrN8Q1InyvvU7vM4QusIVn0MlchUt1hxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765481514; c=relaxed/simple;
	bh=2M5IOiqUEuqkSixspo6eExA8XvWawL3eIHVWOiYInnc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=VI3qlvmrSMcWAgN3TdvQmY33JhKahJwhvtnvu/vWy6SPgLfBxN8aszO+ADPk2jkKEWk/k/StmhaNduYK4XDYfAQQ+0rYYXADCgndXtzA4MsguBNRLrF/lJ+f5BFzAeYfzhHynGTDO3tgV/7m6WLysS5gg2KW+ZBIo/7AX5Hi9dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BqUEgWab; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hTcyi2Si; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765481510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9fNQS7Ht+smYBEt8qQi15gMY9oRc7YfucqsNSafaVMY=;
	b=BqUEgWabxwUfyoNR4Ssc4w+RzJ3si6DqcjWpwT2ldhvaghsvvAe6IJLEsVtaK1ynw6GrSQ
	c/0Dky58d51S7UYh7gkTLCKTDkGulMjrQDbupgfZHufrH76DJxVs7gacLufY4S/N89w+iQ
	FCvGzQ+uMAATsQWVv+KMLVCmbEQzuQg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-272-OXDeWENnMUe9Y04X7zy7sg-1; Thu, 11 Dec 2025 14:31:49 -0500
X-MC-Unique: OXDeWENnMUe9Y04X7zy7sg-1
X-Mimecast-MFC-AGG-ID: OXDeWENnMUe9Y04X7zy7sg_1765481509
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bb0ae16a63so58124585a.3
        for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 11:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1765481509; x=1766086309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9fNQS7Ht+smYBEt8qQi15gMY9oRc7YfucqsNSafaVMY=;
        b=hTcyi2Si/n4XSBzdrX/Wx585cYZNHVNokZudC/OzSwkTDVdEMry3bG+PlLdaBdVfRy
         5WXy1CmFQUcCwLzzHhYHExZ2EGSskP7eZK2cUubk+LVN+OrDGPx096ARRDJuKY6Lcbug
         +QuyL9kgtNdnwrR/CJichayKrm8t+AWDu21RF4nff9d7mmAXGg8oZi5A71I8KUNkun0j
         EATgQD8yfKv2tC3f1DfSziPbaXZO0ipEDRmtuS+Aawpsn4/t8q8C/33w4PRmkClPW5qb
         UxgTVCJPuAIqsQPk0j6Ztmz4w2oOdr4xNsFopW5lEAqjkDOpjGNavrtN9SEB5c+2E/AP
         yeHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765481509; x=1766086309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9fNQS7Ht+smYBEt8qQi15gMY9oRc7YfucqsNSafaVMY=;
        b=vIWogn4Rk+J0Nvs29JLzApmATzjPmyuwtlkN77SbqmLWmyIEbwY2EvDQSbEfCNhm7d
         XGjjuxYijMFKBpKeEmkprqxKtSkzszdCpaAKhzYB3wO65dHwqrN92PW41TpwC97REWU7
         gg6gVkFZouP1qcvgGvEWDp95noo0O0xpSiDKdOf1Eqna+9oC/pJQVsmK+CrhnHvncqTY
         hfr9wlLdvIeDXTSuz/pdgBSmYoCLvVBTrMk++S8JQem3YeeytFnCjX8jTZHPJQeL90ax
         ql61T4l2wTSjtPBVvT2TLrd4WIBulKIj2KbdJaK3qHmRtdGNBK6q7/5XI6df+3jbBea7
         QW+A==
X-Gm-Message-State: AOJu0YxB4Rd2Y40TpsgboAPJoiDy6ewlIEVzCps9Qah0TTGX5k3QiRyt
	/lkA4UDFUovLxMJGa7Ue/ZuGka2hnfDKzB6FDGY8eJJSTPDxdt2O/FjMTDezD7l0QlY5j/oT32f
	oFTYuv2OuRgtYdu5Pjwm7oIygUGpnOp5EuPZGWwfWRR1kE63Hn32C036P69ekoV/N
X-Gm-Gg: AY/fxX5MegQhg6qbmjrCAN3TvdwcMzBzItXcU0X94SOqn6sDnF/+K4I/JQZOWzww02l
	hYkg9dVWkNA+vU9xIO6Fmplo986iFjXVir3H7Ycez0gFKr/fAiUSusZxRNUS+ZRAYPtbA+LtZNf
	xKL2WgNLdSILf6nUx3NqmjBGwJQ05qRPuxjyTmiY07UKlj5A9yKP89WcMNjpIsegwz+xL3ffF5R
	jFMTw2ReI7QK9g0F8wO906h2MFVwf0K7UagOtsKSsV32Tl5LuTqhJvRZ4KApybpV+Z9tuSU8IzP
	d8tMdGX04LYhXmk/FHGIinPgdBjT3xBEf2cuO/8df0R9ec9IIdbns65xnXZWHQlW49G/Dl9AMs9
	+bmP1az96HtK4BFmC4Wb6eBR2MuQF2eMn2kXS3Hx0EvYfvPACQAghSg==
X-Received: by 2002:a05:620a:190d:b0:8b2:2607:83d5 with SMTP id af79cd13be357-8ba3b20cc7amr1086240285a.75.1765481508540;
        Thu, 11 Dec 2025 11:31:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjxv4hC6ptOgdZUS2F0ohaHHF/DSOrKZqK5mzPaPV5p8p12y+Xs+J8IIFSF5PnIj57uqbRqw==
X-Received: by 2002:a05:620a:190d:b0:8b2:2607:83d5 with SMTP id af79cd13be357-8ba3b20cc7amr1086234585a.75.1765481507972;
        Thu, 11 Dec 2025 11:31:47 -0800 (PST)
Received: from localhost (pool-100-17-22-234.bstnma.fios.verizon.net. [100.17.22.234])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5452ec6sm292782685a.1.2025.12.11.11.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 11:31:47 -0800 (PST)
From: Eric Chanudet <echanude@redhat.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Christian Koenig <christian.koenig@amd.com>,
	Maxime Ripard <mripard@redhat.com>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Eric Chanudet <echanude@redhat.com>
Subject: [PATCH] dma-buf: system_heap: account for system heap allocation in memcg
Date: Thu, 11 Dec 2025 14:31:07 -0500
Message-ID: <20251211193106.755485-2-echanude@redhat.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

The system dma-buf heap lets userspace allocate buffers from the page
allocator. However, these allocations are not accounted for in memcg,
allowing processes to escape limits that may be configured.

Pass the __GFP_ACCOUNT for our allocations to account them into memcg.

Userspace components using the system heap can be constrained with, e.g:
  systemd-run --user --scope -p MemoryMax=10M ...

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
 drivers/dma-buf/heaps/system_heap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 4c782fe33fd4..c91fcdff4b77 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -38,10 +38,10 @@ struct dma_heap_attachment {
 	bool mapped;
 };
 
-#define LOW_ORDER_GFP (GFP_HIGHUSER | __GFP_ZERO)
+#define LOW_ORDER_GFP (GFP_HIGHUSER | __GFP_ZERO | __GFP_ACCOUNT)
 #define HIGH_ORDER_GFP  (((GFP_HIGHUSER | __GFP_ZERO | __GFP_NOWARN \
 				| __GFP_NORETRY) & ~__GFP_RECLAIM) \
-				| __GFP_COMP)
+				| __GFP_COMP | __GFP_ACCOUNT)
 static gfp_t order_flags[] = {HIGH_ORDER_GFP, HIGH_ORDER_GFP, LOW_ORDER_GFP};
 /*
  * The selection of the orders used for allocation (1MB, 64K, 4K) is designed
-- 
2.52.0


