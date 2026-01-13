Return-Path: <linux-media+bounces-50616-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D15A6D1B683
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 22:33:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B33C83013D4A
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 21:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA089340A6C;
	Tue, 13 Jan 2026 21:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="POlG7/uL";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kqr/6nnM"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD93531AA92
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 21:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768340001; cv=none; b=bvzYYJ1sco9GBaBvWcoK5mOYAflUaHCp8FKAqkGT3MR8MviEU5or9GsZySIl/OhNk9nV2q4OQwSQv83SUtywDabIgmxHrtTCu+DCu/rWRWXnhjH7oxx8R57rm3EzAm8/AOhw5e5Li2GQMgIXvbEjkXJM80tuzZOiPii5MqTTe/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768340001; c=relaxed/simple;
	bh=ZWJnmPWfWVf378+SE5bFLrcxXaooa53b6CwQljwKQRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y0F2U3Q1OML8bWKszSomNS/dU9TVYOBsUb1UOE7btkEm2UNTyZ4gLmD71kThAmZ66z0WMwmsz5cfpFNAa/1JZof/BX4m3J9/J8E0axLb50z3j8LmLN/la91S/tkyBJDt5kNWNadFRi3Rn8KI51kX3vKvrJqx0BpbjaCZF52EriM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=POlG7/uL; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kqr/6nnM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768339998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K1tY2jOzHY+cvWTFhoRqTcHQY4mx0y53P502cs7Wi0g=;
	b=POlG7/uLy7HNzk7vEucZPvAHsQPNgkvkloek9bC1PZpJUUTo5U6Vrn+thQkjnJL6A4c0cJ
	RQ0P/Ndd3rBMfRjEMEbc0NXu15l0ZzAQ3x48hg9nycNMDPworwwZbLuvsbM27cAFSJJen9
	X7xLFyIX25zfmwV20Rimyqs6cniZJm0=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-pdjgpFvWPo-vKspeg24e_g-1; Tue, 13 Jan 2026 16:33:17 -0500
X-MC-Unique: pdjgpFvWPo-vKspeg24e_g-1
X-Mimecast-MFC-AGG-ID: pdjgpFvWPo-vKspeg24e_g_1768339997
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed7591799eso208649331cf.0
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 13:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768339997; x=1768944797; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K1tY2jOzHY+cvWTFhoRqTcHQY4mx0y53P502cs7Wi0g=;
        b=kqr/6nnMIej2Hksflyel0AdS8Gc02E0OTYS4W8sgcA1mV0BWsgm/qAfEcbuGki5y22
         iHZ2UHwE7BX0pzOTWTBZKSZ4yDOkt9wkotmqVC+pnO3RfdCV5BEdeAPhiqVuWhRqTyOy
         IuNc9nx6ZBiGI7px1jNH8f6p4W/vdbEeJ397hBoTvbgCh8AuvEmuX4z2RPDiCTnkUulw
         o83t/aY0VJT+UTzC4kCmHHRpYDSKDV2d9RjpDl0Mp/zz0l8cR1dsOtbQFiRNqJwoSO7Y
         n0udWXljVyRdC3Z3e9+rMVPL2Kh6wAeIl2Rb3Syop4JEGvRjvs00iRp5WRm4OP8A/gV/
         QJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768339997; x=1768944797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K1tY2jOzHY+cvWTFhoRqTcHQY4mx0y53P502cs7Wi0g=;
        b=mP46mNTyfxHSwxD8mYgjasyGyMDIfOl1tHPvp8Iq15NwJfWprIIPnQb9xGBBVbKlyz
         9kxa2VZwF1FGlLeGBgy/1t1o2YHd7Igd6L4oLRSUv2k0sWgHMe4IeXvxtrd4b4ZqZIIW
         +o1uboUfru8tGQRlhuXn6XFhkBhB/R/VSmjq6YdPTIdXHDsJMqmytuKlwtNp8WD1b0wo
         qlgvQVdQCIyEfVFc2vMWrPtFqZ0Qy31T5eOxo21J5HXfluS3EToHJpIv/WeaMq4yyGyg
         EF/f5kjuR3+ve7YMKdlabKcxQg7MWPHdcF9zMIr7OU4rqquIJeqL4CtLTPQwLlPQjY39
         FfMQ==
X-Gm-Message-State: AOJu0Ywjn5Lzv4G6f5lMnHVjj7bSAOKENKU1RA1pyxM9SKdvo68BVkiJ
	l826hQxyWCJVeW+ysMK3XVUJOOiTHXBySMI96h88cUpD/p6MdecngUmPgoGY1A7G4zTobUB+AhL
	h7P0c6z88+ZxmpnuUlB8KYcTwEf4M/HYy3CRS+oqqp2EqDz5QKSf6b6KFuySmG7uH
X-Gm-Gg: AY/fxX4/52Oqa5VWDM++Dxt6MHpzyfounMLAlYv4fdhesXpMDnHBJlZMAvFbrpHFwSM
	YJFxvGobuAxGO1um0qj1e48mIm272ggsBMl54f+VF0Crn0lfGpPWiiVLgkPvDaqexfumvu7HyPI
	IvqZVu2PfYDwQLuXuq9OnYszhbCVydePTKo0AuKLBxlWXEhLu0gqK7fADKHop1HwWQ7Pviz+awq
	fL8n2Y7+RY8UzBgC0nZ3TcBOHslXQKBk2GFScEEw71q7WmmlDIFZ4fC128udI97g9rZm0+hPEwE
	1kX3j4Z6sEskNEyKXl5ZdwAjrGmpU5A9G5jB4GFwgob0rzMB8V/GVxGJ8m5rtl0TQ6zGb6Fc8MQ
	LRFx7dsUFjErYp7NdZbD4BrNFeAllMXy+VRYZ27sItguhMaflZbM=
X-Received: by 2002:ac8:58d4:0:b0:4ed:bb39:9a60 with SMTP id d75a77b69052e-5014846b14dmr8396871cf.40.1768339996913;
        Tue, 13 Jan 2026 13:33:16 -0800 (PST)
X-Received: by 2002:ac8:58d4:0:b0:4ed:bb39:9a60 with SMTP id d75a77b69052e-5014846b14dmr8396511cf.40.1768339996449;
        Tue, 13 Jan 2026 13:33:16 -0800 (PST)
Received: from localhost (pool-100-17-20-16.bstnma.fios.verizon.net. [100.17.20.16])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50148df8305sm1253971cf.9.2026.01.13.13.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 13:33:15 -0800 (PST)
From: Eric Chanudet <echanude@redhat.com>
Date: Tue, 13 Jan 2026 16:32:44 -0500
Subject: [PATCH v2 1/2] dma-buf: heaps: add parameter to account
 allocations using cgroup
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-dmabuf-heap-system-memcg-v2-1-e85722cc2f24@redhat.com>
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

Add a parameter to enable dma-buf heaps allocation accounting using
cgroup for heaps that implement it. It is disabled by default as doing
so incurs caveats based on how memcg currently accounts for shared
buffers.

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
 drivers/dma-buf/dma-heap.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 8ab49924f8b71a0272dc89a609539a429feaf6c8..f72e93cb8367fa196e5b87e762a60463023887df 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -49,6 +49,11 @@ static dev_t dma_heap_devt;
 static struct class *dma_heap_class;
 static DEFINE_XARRAY_ALLOC(dma_heap_minors);
 
+bool mem_accounting;
+module_param(mem_accounting, bool, 0444);
+MODULE_PARM_DESC(mem_accounting,
+		 "Enable cgroup-based memory accounting for dma-buf heap allocations (default=false).");
+
 static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
 				 u32 fd_flags,
 				 u64 heap_flags)

-- 
2.52.0


