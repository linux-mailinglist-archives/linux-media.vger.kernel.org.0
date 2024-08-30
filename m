Return-Path: <linux-media+bounces-17236-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 283B496697F
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 21:26:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02FB8B22A91
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 19:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3D401BBBE5;
	Fri, 30 Aug 2024 19:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZradwWnG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7A033CD1
	for <linux-media@vger.kernel.org>; Fri, 30 Aug 2024 19:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725046002; cv=none; b=CuO4ktv2RtMz5pc9lsBdc2OaFCwvNzYQXrJ7utqJutPy7nCME4j7VDrMZXoJTEjf8GgnXgSGHimrXcQ826Yovns9v/F1eJ/IyLpnUETp53rOkgilpQKIhqdIcYtlIRwjQcsVI8XFEyfLId4z4mkzjFL7BqCmi6QHuJ/vK8VlEAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725046002; c=relaxed/simple;
	bh=8QVHSbxNTzTLHDg1HVfV1vyaxEg8m3Y3kEmk4ONuLIw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Nu9jrUbLg0SHrcs5uNZfsNH0KnaV8mnPgUL2YsGZYzBQH8AtbFfjr+M7cXJCGVtnw0jel/GEnTSuLCjiUycs4dzQQ+9pWJWqei5gvPzdVnQAFxvSRRruBCOAtwMGWxxQ44dSaYsjW7VcjuIroviBCekKgjIP7UMuMQf6zHyyic8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZradwWnG; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7143d76d29fso2395690b3a.3
        for <linux-media@vger.kernel.org>; Fri, 30 Aug 2024 12:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725046000; x=1725650800; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FuDRdZr3lnXIzC7C2IwkgUCCNdeMT8LTC1OgvHLHr0o=;
        b=ZradwWnG8IGjO1RyDHLcT1zpjxOiiS8oTt5cQ2TqaPIlVryG5CVghopJTjq5sAAQCp
         EDlLJxcZrD3MQnj8P7rLI5jDr74RgzzYSqoF8USz4zV9xz7Efdkna5V6lqpRz8skk+z2
         oR0DgvIIXL5FDc4c5N3HJvDgii64X3kIV7ItTWi9M98NOxSVxnOMmYpicIgvCkfvllMK
         fpD/KbvqLRE2FGefXlqlEPpMytlLb7zzPBbmDBFVQVpzaca09BkMu3LcWoMjyNO8MPyK
         wsrWPDNZvd9BlIXGYSUFZWTDGqU4kzhFlnRd+eF6TrtT5ul5hyIXu02fQVsOudKUTrfE
         f0Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725046000; x=1725650800;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FuDRdZr3lnXIzC7C2IwkgUCCNdeMT8LTC1OgvHLHr0o=;
        b=lfPrFIz+8WDBA1sG2v5sNtqgKW9F0gBzrL8u+HJZSdMow1zPABFPDcycqnXGzr+sJd
         v8a9cjymes1i1e+b1gJjBVHvKy0mEECOG4MX1yTS/S2wVLMyRNAEgqdV39lERfOO23I8
         iEhCqZJsSl61Q1ZyHdAfaaFeneI9D4rUWH+8PjSbiozLqcwE2rmFZvfALxaiedKGJtKA
         L+Hib7OPHslP9n/4/JPrxEnx0ozsAL7+xUpwOA30OYbd5tVO9eUFIBlHV43MKtHKR6+d
         BtaysE2h7qvaDyUVdVOU0kLVD6dSBpcpB4KQjovvjypwEdcNY+8NVdnLWlUQxKeMKx6r
         NaKw==
X-Forwarded-Encrypted: i=1; AJvYcCWsG1dv/ckw2pm0UW2/6u4DuI553gwvitK3U0lR8+Bd32BEj1N1ZpZu1IneawxaLZPfFIX9WBoVCGUOXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhUukHUYBIOBdhu0YjvM1GSUuvbW9kKPdLY6o4sZjaJW3/r7kq
	IxAuPV4f+HMJc+O4pxbd3wvbw3qu8DefjAm/HDIr3x9MVaJviBjr/HIDGA4+4Z6HpsZngw/iKgw
	eB1vWi2nxhGRN0g==
X-Google-Smtp-Source: AGHT+IEYDT5yTYPujoEQ0Ej+aCUk5iv9pvxNQHghRZEWhY4u/r1jH/tjVnZ/WpOzBL4HVQ0C2o97rg0PjRinvWA=
X-Received: from tj-virt.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5683])
 (user=tjmercier job=sendgmr) by 2002:a05:6a00:8585:b0:714:1436:1cef with SMTP
 id d2e1a72fcca58-717307cbc9bmr7143b3a.6.1725045999943; Fri, 30 Aug 2024
 12:26:39 -0700 (PDT)
Date: Fri, 30 Aug 2024 19:26:26 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
Message-ID: <20240830192627.2546033-1-tjmercier@google.com>
Subject: [PATCH] dma-buf: heaps: Fix off-by-one in CMA heap fault handler
From: "T.J. Mercier" <tjmercier@google.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>
Cc: android-mm@google.com, Xingyu Jin <xingyuj@google.com>, stable@vger.kernel.org, 
	John Stultz <john.stultz@linaro.org>, Brian Starkey <brian.starkey@arm.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Until VM_DONTEXPAND was added in commit 1c1914d6e8c6 ("dma-buf: heaps:
Don't track CMA dma-buf pages under RssFile") it was possible to obtain
a mapping larger than the buffer size via mremap and bypass the overflow
check in dma_buf_mmap_internal. When using such a mapping to attempt to
fault past the end of the buffer, the CMA heap fault handler also checks
the fault offset against the buffer size, but gets the boundary wrong by
1. Fix the boundary check so that we don't read off the end of the pages
array and insert an arbitrary page in the mapping.

Reported-by: Xingyu Jin <xingyuj@google.com>
Fixes: a5d2d29e24be ("dma-buf: heaps: Move heap-helper logic into the cma_heap implementation")
Cc: stable@vger.kernel.org # Applicable >= 5.10. Needs adjustments only for 5.10.
Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 drivers/dma-buf/heaps/cma_heap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index c384004b918e..93be88b805fe 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -165,7 +165,7 @@ static vm_fault_t cma_heap_vm_fault(struct vm_fault *vmf)
 	struct vm_area_struct *vma = vmf->vma;
 	struct cma_heap_buffer *buffer = vma->vm_private_data;
 
-	if (vmf->pgoff > buffer->pagecount)
+	if (vmf->pgoff >= buffer->pagecount)
 		return VM_FAULT_SIGBUS;
 
 	return vmf_insert_pfn(vma, vmf->address, page_to_pfn(buffer->pages[vmf->pgoff]));
-- 
2.46.0.469.g59c65b2a67-goog


