Return-Path: <linux-media+bounces-38167-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F397B0C2A0
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 13:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A06B77A6790
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 11:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ACE429C355;
	Mon, 21 Jul 2025 11:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gUIi1Mjc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCE92BCF45;
	Mon, 21 Jul 2025 11:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753096671; cv=none; b=AI/7gYeL+n4qNUyyITTQU6QSvOHgzR+a4tKBg/T2lHTPWYS32A48c4PkhE2VM6fzFUByI3A8Wfrcwh+9rNpE0TWQqr2TR1QKlWfcbRdijF7Yj28aY4df7JmjOTvepNF8knLjDpoNb9gN72fH2RtCad3clWLfPER/+8C+eVYjKQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753096671; c=relaxed/simple;
	bh=ZzIQMj2Qi1QqJ5MVd3O/jzU3y2DI0Os/GobSPh/q4e0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mu7D8k4UIrrNGrfx0C6FMCw6MXqoUhLmLiV6dv27g0n11/mqQG24PnFIOA76DcgcFoze/KDRyu0OYciRRKYU5C1RLQjctSZg53kzfJnL8wvpfVn0UMJP93Llf+MJZYNvX6TMWMTPsEF/pnUhNq7ez6u3CFu/5BV3c2zCQkvRoBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gUIi1Mjc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECDBAC4CEF4;
	Mon, 21 Jul 2025 11:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753096671;
	bh=ZzIQMj2Qi1QqJ5MVd3O/jzU3y2DI0Os/GobSPh/q4e0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gUIi1MjcCWbuCDNdOxoH5rN4rx4xBzEi4zWIucdoBrEq6oduafd5YMuf/TqV1JO6r
	 D0LYbKlJF0SqRJ9PcU+c8Tnffy7lGwUF6zThZlDK+DOAGMiBWDgrzWf7W7bARt8v/f
	 fJgtlsjhkpcQBM3ZKAfEKFSvs+UDaMWHpHigCAyh8eXdXC2OY3yzJT9dx5/dBGjfkH
	 ciMlAzwpFZhnQCbTgV1eFG6KBCliTEN3j0CqFaZeVO2bQuoSi9at45V5hqmapVRNQL
	 fVNOq2Nwvvf42gcINScoZirZDuMJVQxNa3dJrXUAcHe+CIuj9IJi1ubYFVhBqlRC4m
	 ZUMFffImy6Tyw==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 21 Jul 2025 13:17:33 +0200
Subject: [PATCH v7 4/5] dma: contiguous: Reserve default CMA heap
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-dma-buf-ecc-heap-v7-4-031836e1a942@kernel.org>
References: <20250721-dma-buf-ecc-heap-v7-0-031836e1a942@kernel.org>
In-Reply-To: <20250721-dma-buf-ecc-heap-v7-0-031836e1a942@kernel.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Andrew Davis <afd@ti.com>, Jared Kangas <jkangas@redhat.com>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 iommu@lists.linux.dev, linux-doc@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1401; i=mripard@kernel.org;
 h=from:subject:message-id; bh=ZzIQMj2Qi1QqJ5MVd3O/jzU3y2DI0Os/GobSPh/q4e0=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBl1iuelfs8VOPHLoe/KrNPHHM0Nm66V73jbeD5/01ejs
 6tvWIgf7JjKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQATyUxlrBXXkMldt8Le7dq6
 TcnTZ27M++O6OmZDouq7jdf8zFcemXXWWljs0U3WN+dDc+RZpn6arc/Y8OZE+T+ODeFP9nZrRYk
 9V473CFUocf5X1rPE4Ful3/8/1h9c2k7a8HyqV+6+vCx5q58jAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The CMA code, in addition to the reserved-memory regions in the device
tree, will also register a default CMA region if the device tree doesn't
provide any, with its size and position coming from either the kernel
command-line or configuration.

Let's register that one for use to create a heap for it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 kernel/dma/contiguous.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index e81982c0ee8f5c0654731adb611df4bcc4637c7c..7aec2a559607b86e4d9df33ae2c004f7fb30fff1 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -237,17 +237,23 @@ void __init dma_contiguous_reserve(phys_addr_t limit)
 		selected_size = max(size_bytes, cma_early_percent_memory());
 #endif
 	}
 
 	if (selected_size && !dma_contiguous_default_area) {
+		int ret;
+
 		pr_debug("%s: reserving %ld MiB for global area\n", __func__,
 			 (unsigned long)selected_size / SZ_1M);
 
 		dma_contiguous_reserve_area(selected_size, selected_base,
 					    selected_limit,
 					    &dma_contiguous_default_area,
 					    fixed);
+
+		ret = dma_heap_cma_register_heap(dma_contiguous_default_area);
+		if (ret)
+			pr_warn("Couldn't register default CMA heap.");
 	}
 }
 
 void __weak
 dma_contiguous_early_fixup(phys_addr_t base, unsigned long size)

-- 
2.50.1


