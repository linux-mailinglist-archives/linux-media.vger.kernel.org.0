Return-Path: <linux-media+bounces-17720-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4486596E69D
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 02:03:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF2CE1F24693
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 00:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A0CD3FEC;
	Fri,  6 Sep 2024 00:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sIEWXPrS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E5318D
	for <linux-media@vger.kernel.org>; Fri,  6 Sep 2024 00:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725581014; cv=none; b=ghw7M7NzerBNp2HNMmwvUgo1nkyWMdrfPEUVDCXXXcvxMsy3N9s/WlK8JhELCQuvDGSOCwLixUII7JwyAp0QhOnm1BXYM5PNwk1Z+WIhINiM5Y13aBuhjvX758SYe/55uZNRby1eAeFIhSQircao0Zqq4JH45n0kv81YjV0aNa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725581014; c=relaxed/simple;
	bh=5R/2y/WqhxUV2GXI4fEJ2tBN882Aayxea40bdB1Z9t8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=l1PbQxouheQOA5Hp6NZunktw/8iUlwT4IbbGQBLv7QmjkqS4PAWDiywkB13ZM22TnXwo/vEWXmqm0OOGUycXQJNna48PzAeYA9v7Lz7ETscAn+bhTWDAG499HDM58M1z/5RonetcIp2ZunEf76TY9srkvcA0tko+XvqpcKXIs/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sIEWXPrS; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-7163489149fso1701714a12.3
        for <linux-media@vger.kernel.org>; Thu, 05 Sep 2024 17:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725581013; x=1726185813; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lb94RnSDbmLGLcyEx39Gw1x8H5QxDPdWSPxan+FyvB0=;
        b=sIEWXPrSMRgVqphJU6Jd1APD/IvekzwH2VCJe6iRTkNQnZB4vdX+CyJ/1TX3t7Pch3
         vWOKAaedqnDdJ+G4k3ekdqN15cLOio2p3Sjam6HRiFugC+Ow+j5U7dKOMNxRemtoHyla
         YBSmlHIfmTXx3tnjhY/HJsZjbObV2Kw+NtQBHz7ahHFL7XqM/rELJvQyAevHy3644E2E
         oJqujwo9pMB+SY+LkAIa75Eexc3yi5EbK4K6Vx782xnJXZE8NvrM3BbSq6H8taRMcw9E
         oxcoDzYx4pg/eaw50rICN34zXyJDQ7IkcQf+JYIBpULNKDphYjxasd6FsI7VEJETm4IP
         PYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725581013; x=1726185813;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lb94RnSDbmLGLcyEx39Gw1x8H5QxDPdWSPxan+FyvB0=;
        b=jFubGa9NA8ULua/5aQxBCXhrCsJFV2OlgXuogO8XtXRjnC0Bu/vAqa2J/Z9Kxv58RW
         J9rVY9vnbgIxRA5U+psmSmJLahu/wHwkUjidyudmKAtIwkZLdv5E2GQPH85rsoSXyZ3o
         qk4ZV408FMtOIBMU3I+cKsL+9RWrjTQI0rx9BDbR7RbzdKecyJyLrocFenED+c3/IXZ4
         bBtAajxK+IB7x+W+jtOjlgS0TEZsDU060vE6BuiM70oeOG2Ldpp65DJktqXW+ex1fqgV
         /fpbthDX/DYJS0PkC1xO3hTVYBIzrBFKJepUxs9KA9N0Egz5HWJLVBAC9OjcleuScdAr
         NVEw==
X-Gm-Message-State: AOJu0YztVhnsKTNJceWhCu33TukW4W3G42A6PgSM0w+D1Ir3THg+TBnP
	rh+sZnyTETjdgs93u7kfljIEXoiV7Xi55gWY1JY+KZvCJNeuKrSCJSm9l8rN8ZE6aKSqTnaq3/Y
	aLWhyg43dePme7A==
X-Google-Smtp-Source: AGHT+IGRECBEERbLSskRzYgPKP8c+xQVePlIpPB7xS8H6FIHSZLW2hXff4BteDxNIf99GTAFfJ41K18bV+IfaxY=
X-Received: from tj-virt.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5683])
 (user=tjmercier job=sendgmr) by 2002:a17:902:d2ce:b0:205:799f:125e with SMTP
 id d9443c01a7336-206f0622e71mr203235ad.10.1725581012511; Thu, 05 Sep 2024
 17:03:32 -0700 (PDT)
Date: Fri,  6 Sep 2024 00:03:12 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
Message-ID: <20240906000314.2368749-1-tjmercier@google.com>
Subject: [PATCH] dma-buf: heaps: Add __init to CMA and system heap module_init functions
From: "T.J. Mercier" <tjmercier@google.com>
To: tjmercier@google.com, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Shrink the kernel .text a bit after successful initialization of the
heaps.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 drivers/dma-buf/heaps/cma_heap.c    | 4 ++--
 drivers/dma-buf/heaps/system_heap.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index c384004b918e..39c1e533a2f2 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -366,7 +366,7 @@ static const struct dma_heap_ops cma_heap_ops = {
 	.allocate = cma_heap_allocate,
 };
 
-static int __add_cma_heap(struct cma *cma, void *data)
+static int __init __add_cma_heap(struct cma *cma, void *data)
 {
 	struct cma_heap *cma_heap;
 	struct dma_heap_export_info exp_info;
@@ -391,7 +391,7 @@ static int __add_cma_heap(struct cma *cma, void *data)
 	return 0;
 }
 
-static int add_default_cma_heap(void)
+static int __init add_default_cma_heap(void)
 {
 	struct cma *default_cma = dev_get_cma_area(NULL);
 	int ret = 0;
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index d78cdb9d01e5..26d5dc89ea16 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -421,7 +421,7 @@ static const struct dma_heap_ops system_heap_ops = {
 	.allocate = system_heap_allocate,
 };
 
-static int system_heap_create(void)
+static int __init system_heap_create(void)
 {
 	struct dma_heap_export_info exp_info;
 
-- 
2.46.0.598.g6f2099f65c-goog


