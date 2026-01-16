Return-Path: <linux-media+bounces-50923-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4198D386AA
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 21:09:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6DB3A3132CD9
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 20:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 207993A0E9A;
	Fri, 16 Jan 2026 20:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dg0U2ryx";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="NGPpPzR8"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95B73A1E81
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 20:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768594001; cv=none; b=Rg2E/NZHgA719d2y51ktXa1a24YMKA9UMqNv+Oa9/bjFsbcf3sBn58Fhe2jBD0VKUuTIAT0M0J+j1NuaRSXwPirvaIUNDKY6o/7oRuijv2JYNvuIoqam2sgmdFOBT45fBzU8BXwUYNhBQuBEr8RmidgsAnhxHEZSN27+za19w4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768594001; c=relaxed/simple;
	bh=0KajZD261H9CQz6wd84eSYgdFmFB6AYoXKRt0dtJmfo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gKPrHzv6Eivy2ZiBK8gNGg2IJGXFGVWVGRxFYm+2K6tWvfZZG7w2+wGcS7lAmBsRIIlXcBWCYaZ/rcf/rZJGDtjUqL+7fna4UYpMYq5XN1CQv77M3AZpt4yab1B38yJPK9oeH5OnAgP8Ik8FSLWg2mruaEFXJ7rPK5je1IM0nJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dg0U2ryx; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=NGPpPzR8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768593997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=twwZ6029cLkDAYezw98Z3f9QT2dYne/kukXgOmvL3oQ=;
	b=Dg0U2ryxpEGmD3kaDOKxWNF8Q7hthcuBEJNS8dJvtQKUNKgc86O+u5NkH2xkGed9UWFbU2
	VHSADqBhY1joSzIpNX+Iclu9BPmra+dR9gPUENYyVrhl5Bc79edtub0Fv1JkpzdEX3cPZI
	htI/bEa932lajUWcjKABfVYe+R0USZE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221-Nu--C3lONNeKA-bMHdya8Q-1; Fri, 16 Jan 2026 15:06:36 -0500
X-MC-Unique: Nu--C3lONNeKA-bMHdya8Q-1
X-Mimecast-MFC-AGG-ID: Nu--C3lONNeKA-bMHdya8Q_1768593996
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6ae763d03so91904285a.3
        for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 12:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768593995; x=1769198795; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=twwZ6029cLkDAYezw98Z3f9QT2dYne/kukXgOmvL3oQ=;
        b=NGPpPzR8kX6iS9j+6rW2AV70rwlcCG8CEfrJP6cf9XHkIvG62ZgEWvmDLWq9SZewuU
         leraVNiQcC8Pwk7vK0NHFL7XyRb6a1W238o3b+Urd5HgLlrI+JOgCsFtQln7S6CkGfp0
         WG0Wl9dDNJbB4rR1h2y+CZYd45mQvaNDxPkiYYj4Cqx153GxLZmQhrHyNrDr7ymnWr+T
         DTAZo06upAWH3A8tp4C4AviuH6vcQjayKQSmIpO+DhvYyYrFUTBuuOTNej7QubUjKYjQ
         uM6qrhrpbtdnOnnkqoufGcfLJwA0zwp/0z1iAl3ArjgH2pcCUZxLDQStKQlkwRxfNW4V
         Okbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768593995; x=1769198795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=twwZ6029cLkDAYezw98Z3f9QT2dYne/kukXgOmvL3oQ=;
        b=UOkJLckzFbDIPwKA4DP+39K5fIQJqVttFUuBjIVs/atJLQou/6cBgRqLlO0UPnaaYi
         6yrDh4oIvXKFQVg0weLOAN18ywTDwRr4s+T8tdWUW8bJmwl23go4hL+vADw8faJG708k
         Phty7oKBP7R0uRc53GCFLYuuoZ/m0N5cCjOG9nELNbge4lZz9pf60u6bhsf+GDKY7dUF
         P3NY6qlQO6KCrNQU2rUO7tSJxsQ7EbVSmJVybXcIPLriMTVOHyg9J+Glt7QfiJVO+aOn
         9vTbuL0U3rJsiwvbNXXMtSNY6jVUXa4C0D5IRn6mWZeMJ2EODfAlNh5cZk+ZJU8G+mu1
         yO0w==
X-Gm-Message-State: AOJu0Yzcdnq4EweAVe8bPEbmrrPTStGcxCv7w5fTQWC9qi6UIh9BCW/3
	wwWFwkK2jq+yJEboYN8C8B5HfxBbtoMkcsYy2l9K4YYMImsLa/yMdCSYA+kXuWmPWtjrlRo9qh8
	rIjUUYowkwPfFqsgOg4KvQW5c9UoMpR7txPWisnoP6N4Dh/nBVoDdtdHOsaumCpT9xIr3uWJZ
X-Gm-Gg: AY/fxX4HhblU73THrMc8Ee6G+rBJ9Jb7dSOy9DTdS+uEPwN7xar6c1/F58oQam6tuz/
	ZtD0Xy26Jn/n+F4ow6qxr1rLaeQ1k87mqAjhlAP5DtGLned+dZ+fTp1ioFQx1V/aFmNO0sFPJHE
	hR0XoSDPbQrETBoLZMsmvtqy8vyEof9KQe7lvVDkuu0z6xdml/XFREE+2uJ2T89rnXHd4zLoMaI
	pewPsPMlUhw6OEPQAiTx2Gt/0G5a0zXyV2DPYM8E+b2HWo8p9WryZKYibQe/wMX8lmh1xDdHkra
	PZbJoM925b3bZB2+s5mz0z5SOLqOj+5sTPMeCBK9EvY/3hMJbUjUFu/jSh6G2ObxC45cHSoifFX
	tEdMKZ8Du4iVK061IhQE/Kqs6xj+KsvGQzX104Sxfkytb1mfMJus=
X-Received: by 2002:a05:620a:45a8:b0:88f:e620:21cd with SMTP id af79cd13be357-8c6a67b093emr567594885a.62.1768593995540;
        Fri, 16 Jan 2026 12:06:35 -0800 (PST)
X-Received: by 2002:a05:620a:45a8:b0:88f:e620:21cd with SMTP id af79cd13be357-8c6a67b093emr567588885a.62.1768593994868;
        Fri, 16 Jan 2026 12:06:34 -0800 (PST)
Received: from localhost (pool-100-17-20-16.bstnma.fios.verizon.net. [100.17.20.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71bf2b0sm297117485a.12.2026.01.16.12.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 12:06:33 -0800 (PST)
From: Eric Chanudet <echanude@redhat.com>
Date: Fri, 16 Jan 2026 15:05:38 -0500
Subject: [PATCH v3 1/2] dma-buf: heaps: add parameter to account
 allocations using cgroup
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-dmabuf-heap-system-memcg-v3-1-ecc6b62cc446@redhat.com>
References: <20260116-dmabuf-heap-system-memcg-v3-0-ecc6b62cc446@redhat.com>
In-Reply-To: <20260116-dmabuf-heap-system-memcg-v3-0-ecc6b62cc446@redhat.com>
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

Add a parameter to enable dma-buf heaps allocation accounting using
cgroup for heaps that implement it. It is disabled by default as doing
so incurs caveats based on how memcg currently accounts for shared
buffers.

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
 drivers/dma-buf/dma-heap.c | 5 +++++
 include/linux/dma-heap.h   | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 8ab49924f8b71a0272dc89a609539a429feaf6c8..d230ddeb24e0fa1f2d51cb5d2868ec54fc8376a8 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -49,6 +49,11 @@ static dev_t dma_heap_devt;
 static struct class *dma_heap_class;
 static DEFINE_XARRAY_ALLOC(dma_heap_minors);
 
+bool __read_mostly mem_accounting;
+module_param(mem_accounting, bool, 0444);
+MODULE_PARM_DESC(mem_accounting,
+		 "Enable cgroup-based memory accounting for dma-buf heap allocations (default=false).");
+
 static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
 				 u32 fd_flags,
 				 u64 heap_flags)
diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
index 27d15f60950a2093e592be1b961c02e672826e58..648328a64b27eaf25c8b18809a02c6410cbbffde 100644
--- a/include/linux/dma-heap.h
+++ b/include/linux/dma-heap.h
@@ -46,4 +46,6 @@ const char *dma_heap_get_name(struct dma_heap *heap);
 
 struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info);
 
+extern bool mem_accounting;
+
 #endif /* _DMA_HEAPS_H */

-- 
2.52.0


