Return-Path: <linux-media+bounces-50924-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DA7D38685
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 21:07:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 27DC630409ED
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 20:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C27B39A7E0;
	Fri, 16 Jan 2026 20:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DSP7+4mq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="R6GsjZec"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E56B34DB5C
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 20:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768594004; cv=none; b=E3WggGjTjlrN8i+6onsuoHYpHThVzc2xhQW0BxQtVyvX4LVUMAj/cgKcW6LdxV+u3Ii/IOXvl3w+9DEqQRy7uwWXdX1npT6RH9kr7YHbC4S0bg2r3aC/KxuOkrYs/b/Yd/XxvK0hQjKk8zZJsRSDx5Hx/t03v6tX3yHlL9gPTro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768594004; c=relaxed/simple;
	bh=VaKlN2Ndz9D15vhuvG+QVIBd4WPxjWJfre6Zf4rcgSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f4GO2yDufetfid3eNym3xIcDPjZ3z/xe113Xj6gHBzSN7RrpypvOM3N4GZphBBHPeXHIFjXPw6gxDaRGPJPzZlqCmV5K6T5C/mfbgXJY87TmXv9V4/dGGyjazBqVKs1FGyf8hYZwiQokEiBLKyYYUEsm7t+gfJSjauWVhOzRjck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DSP7+4mq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=R6GsjZec; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768594000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PAII7mTGSKHnVbVtbYqYnUY14STvK0vS9h+9Pl6qxlo=;
	b=DSP7+4mqJjxPlLvRnUf+fE+xGTiRVv/irHBBicGD4PTkTIrrSklfDUEaczP88QgeSsrC04
	m7rd/B6SK9mivlVTxrNzKd2Vj+4mE2D0l7hUuIyjvykMNLiPS1Ovt+rpOu+FTju6F02Ot2
	YWo3wQKnRWda8gn7420PalAPf57fhSw=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-7h1BN5G5NCmUOzHKO08YNA-1; Fri, 16 Jan 2026 15:06:38 -0500
X-MC-Unique: 7h1BN5G5NCmUOzHKO08YNA-1
X-Mimecast-MFC-AGG-ID: 7h1BN5G5NCmUOzHKO08YNA_1768593998
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50146a67232so73198251cf.2
        for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 12:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768593998; x=1769198798; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PAII7mTGSKHnVbVtbYqYnUY14STvK0vS9h+9Pl6qxlo=;
        b=R6GsjZecYzab/KJY8lNUAf676BYOavBarrc7znSCMFG+yhgjqqg3Z5wLbF3O7yw3Kf
         /zCV8TDKWWqqW6ORPG+xA2MChFaF9u2uHDjMX3cDGwW2uik4UHRBphAadzPMskxGaoNI
         XVbKaCxhfr5OSYOnL2WDilBgUMam2uNrSmaFPTTs3qJwFtAi99rLVW1txJD954LKIBeK
         NqnYbB2VhciHDsbzk3AppcIHwKUq01gFXdMYfakYj36parMMiYTeGUsZMCfPsl5VETx4
         U1O3Ov8dHjFJg5I0ZX/lnUXG6XuCLIFe5zo0o0EaSsmCk2gUsQBNmJI3fuxkSTMz7fra
         oPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768593998; x=1769198798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PAII7mTGSKHnVbVtbYqYnUY14STvK0vS9h+9Pl6qxlo=;
        b=lx/HvxKDMJBLprHeu5RgdIc7IvHSGwA5x1P8fw0b/7fITdrbMtvjKbn912SBrsnW6M
         UoowpzivEQCS8BTLTOiKqPdTfy6IiQ7G+9iOtJ1xtmYvQ0hlsAvps6x/W3MzhOKjA8Ib
         l+M7NFct1HpSRctVupNrilEf1HetPRTzct1GwY7brO2yTtbZLsYCK2PFKnqL5FlLIjg9
         RT9zMJgCnYoM9H6eV9CN4k1F035/4iYrH6d1FlVpf6wcNKGAuFHvUPEkQwOBjlZjfACF
         zBG7Ie/Ca0dW1QzoGOAmyE0PEcGNtArXv8OChwx/NV7T6FtfKCjrtWTL/Pv0HQbju7oU
         g2IA==
X-Gm-Message-State: AOJu0Yyliv3rgkLKXsXTVzvWTH6spL5l4Oa5f+W5zZpSkPJFezvw2M2/
	otM7CvmPi8jQt7zsg8PGAiiS4OBW1tsp7ime8JL6AtrCZCNLSuspAdHklLSz932ZygMeUnwuqkT
	eRi98qMgivNRJqHuY80wcOfWlnHJ+A99Dn3aQdk5rC2LB9mnKxDZ3HeP8skWYD8f3
X-Gm-Gg: AY/fxX5OtiRYMUamtvWys2nF5KBlYYENaAL96+2E+PgE4zVq8t4yGBNfIA+E2PO6zqF
	OUgomgOSjGE/TiS6ippFbVUDgDcyrPRieaQ4GOyuqZjgAKn+QgzMyU5ywq8nV4U/pQzn+4X2N9y
	jFVFA6Asl+DpK9z06dTiwZ55XgwWXZeDnI91G7UfyhVoH8x/hGPJ1ENapHYltIT2zaWeky54AcW
	UGyp80/6pj5a861zUAOMHZRjOQyBQSdeKHnVsFFxH7XBfgLjTJHgxck9CVBXD6pcO+mNPCT/M5K
	x0q54yCX8MUbyp6k+BQj3bQS/A3rsa6/R/59RrzFaZxmuSng05mykIsGLm9SKcdRJU6z9iW4e23
	ZuhhalMCBKrnIXl95zABKrV9gJRvKO+eNqP26pB8y719TDXgNTPI=
X-Received: by 2002:ac8:588f:0:b0:4f3:5816:bd8d with SMTP id d75a77b69052e-502a179ca4fmr63770361cf.62.1768593997955;
        Fri, 16 Jan 2026 12:06:37 -0800 (PST)
X-Received: by 2002:ac8:588f:0:b0:4f3:5816:bd8d with SMTP id d75a77b69052e-502a179ca4fmr63769841cf.62.1768593997449;
        Fri, 16 Jan 2026 12:06:37 -0800 (PST)
Received: from localhost (pool-100-17-20-16.bstnma.fios.verizon.net. [100.17.20.16])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1efb0b2sm28738281cf.29.2026.01.16.12.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 12:06:35 -0800 (PST)
From: Eric Chanudet <echanude@redhat.com>
Date: Fri, 16 Jan 2026 15:05:39 -0500
Subject: [PATCH v3 2/2] dma-buf: system_heap: account for system heap
 allocation in memcg
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-dmabuf-heap-system-memcg-v3-2-ecc6b62cc446@redhat.com>
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

The system dma-buf heap lets userspace allocate buffers from the page
allocator. However, these allocations are not accounted for in memcg,
allowing processes to escape limits that may be configured.

Pass __GFP_ACCOUNT for system heap allocations, based on the
dma_heap.mem_accounting parameter, to use memcg and account for them.

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
 drivers/dma-buf/heaps/system_heap.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 4c782fe33fd497a74eb5065797259576f9b651b6..4049d042afa14ec2f4d034f59f1740600a20c1e5 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -320,14 +320,17 @@ static struct page *alloc_largest_available(unsigned long size,
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


