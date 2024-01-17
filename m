Return-Path: <linux-media+bounces-3826-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D91CF830C7D
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 19:12:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 719572838E6
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 18:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E85B22F19;
	Wed, 17 Jan 2024 18:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ohX9ddmt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF8922EE0
	for <linux-media@vger.kernel.org>; Wed, 17 Jan 2024 18:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705515121; cv=none; b=HunWQvLquo+J6KJwx9HX0DnUzAc1iNrG3Kt7uy80C/YbCADmDdW9JaxZ1g3nePTaNKZIO/Y3bPYk+Md+UwwLBqMuj2ea7ZR9FWCsxx+2uV6f6DlwjECtMkEMcEXi5oBeOqlEP1ei1JqgEIezVw7hioQRc9NG09swjsLUJLKpR3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705515121; c=relaxed/simple;
	bh=VpKMkG/oPLhTsmEDt5kJORcf0cqo0mhP/+GF1Y87pr4=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Date:
	 Mime-Version:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	b=FH4wMoVh7wAyb7Hv6mEnPc7q/C+eejp7YffPQaKo0X7NaVqh6XF5Kh2fpejamdSWoTpcKkPKE2YDbp7Je98GvpThUHm2Hp8VDvhonSEKm9CAYlu8l8+TwgwthNzCroS1cft0Vq1o4URo6Cup6ZnyTN9dRCQrQoARgTONe3Y516I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ohX9ddmt; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-28b3b3633f2so6922783a91.0
        for <linux-media@vger.kernel.org>; Wed, 17 Jan 2024 10:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705515118; x=1706119918; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=78wGbyaR1N/RpeDHrml7Zj+rHmeYYvmV/w0ACPzkZ2Q=;
        b=ohX9ddmtZW3Y3Ie40+gMjO8zAmzNWAs0SCK9oLlqwHv4XO5oR+wDVWYtH4Wa+CD6J6
         tIBXt5+pa7oHS/QP64hbeuH/bDBGC/4UjGGaroU6eAbV9KNP/LzmVZGmmFDW9W/F9SKS
         OIYz4hTAVHKtzv+iSYrOkW21BOw0EgDvfVGgIJu198YH6k6I9TFKw3mP/Zl+Dz/Q57cJ
         UIauuEPhCz8HybCpPPADjTa4Wd2dRe9JDjHpdFn6uAl5QzVZZawwZzlKgDX/Ca5P/GR5
         InBUCmh6LzRKfNA/6pfheSDzUIS3d7YP6L7UFVCxhk/q9eqwbPIasFtavn2OPds/4J3J
         z3Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705515118; x=1706119918;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=78wGbyaR1N/RpeDHrml7Zj+rHmeYYvmV/w0ACPzkZ2Q=;
        b=CSQzPJDyFdsLtt6JG8qRKhNo95LHdR3Mw9ICFyEj5NsgxmoePODd51DoEzXwIqCLB5
         kZ8sFyEO5jTlDfa1aHZgJ2H9RCi7/OtuHI6VNM6MrEHrwipT37dSfuy7kYA/7Nuo+wqx
         D14BJEcQPc5JwZQhHLCn1UsIim2aud2m7CuZT+tdnl+FyZqki/Bn8bBuX8iRM+c/dx6O
         PWTGMrTTlk3OR2MP4vgfVJjl0lZU0K2yQu0WcZde9xUu1ewPbzhO28ZZE64fORIT+Kqo
         41VKF/HgyIXVm+rsq2aFH7ZnQQUNpkYpEUfL1vSNSXwjmdUGS/XKBrWzR6w1jvWJAoY2
         hHZQ==
X-Gm-Message-State: AOJu0Ywe0BbaTQfmcdxPTjVtzSFzlUWIEkQGIV+LTH7XrZUrvKyRzmig
	EO2NZ49Fjz+ANMFPYRq+kTb40OJnc2f0TX9vzVHQGw==
X-Google-Smtp-Source: AGHT+IEqlpk5VBwIaxFJ3ed3SctyHMNGEmAma0Nj0WOvArfTlAIrR/Z8ubBEgvCHIcFZ3dr6Jg5yS8q7Aksd9jY=
X-Received: from tj-virt.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5683])
 (user=tjmercier job=sendgmr) by 2002:a17:90b:51c7:b0:28d:6729:c29a with SMTP
 id sf7-20020a17090b51c700b0028d6729c29amr615328pjb.2.1705515117716; Wed, 17
 Jan 2024 10:11:57 -0800 (PST)
Date: Wed, 17 Jan 2024 18:11:40 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.381.gb435a96ce8-goog
Message-ID: <20240117181141.286383-1-tjmercier@google.com>
Subject: [PATCH] dma-buf: heaps: Don't track CMA dma-buf pages under RssFile
From: "T.J. Mercier" <tjmercier@google.com>
To: tjmercier@google.com, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Sandeep Patil <sspatil@android.com>, 
	Laura Abbott <labbott@redhat.com>
Cc: android-mm@google.com, minchan@google.com, daniel@ffwll.ch, 
	John Stultz <john.stultz@linaro.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

DMA buffers allocated from the CMA dma-buf heap get counted under
RssFile for processes that map them and trigger page faults. In
addition to the incorrect accounting reported to userspace, reclaim
behavior was influenced by the MM_FILEPAGES counter until linux 6.8, but
this memory is not reclaimable. [1] Change the CMA dma-buf heap to set
VM_PFNMAP on the VMA so MM does not poke at the memory managed by this
dma-buf heap, and use vmf_insert_pfn to correct the RSS accounting.

The system dma-buf heap does not suffer from this issue since
remap_pfn_range is used during the mmap of the buffer, which also sets
VM_PFNMAP on the VMA.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/mm/vmscan.c?id=fb46e22a9e3863e08aef8815df9f17d0f4b9aede

Fixes: b61614ec318a ("dma-buf: heaps: Add CMA heap to dmabuf heaps")
Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 drivers/dma-buf/heaps/cma_heap.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index ee899f8e6721..4a63567e93ba 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -168,10 +168,7 @@ static vm_fault_t cma_heap_vm_fault(struct vm_fault *vmf)
 	if (vmf->pgoff > buffer->pagecount)
 		return VM_FAULT_SIGBUS;
 
-	vmf->page = buffer->pages[vmf->pgoff];
-	get_page(vmf->page);
-
-	return 0;
+	return vmf_insert_pfn(vma, vmf->address, page_to_pfn(buffer->pages[vmf->pgoff]));
 }
 
 static const struct vm_operations_struct dma_heap_vm_ops = {
@@ -185,6 +182,8 @@ static int cma_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
 	if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) == 0)
 		return -EINVAL;
 
+	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
+
 	vma->vm_ops = &dma_heap_vm_ops;
 	vma->vm_private_data = buffer;
 
-- 
2.43.0.381.gb435a96ce8-goog


