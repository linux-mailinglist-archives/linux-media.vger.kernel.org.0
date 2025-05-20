Return-Path: <linux-media+bounces-32890-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A80F9ABD40F
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 12:01:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E08A63B52F4
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 10:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 000ED269AFB;
	Tue, 20 May 2025 10:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JO+mWJwv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EC821019C;
	Tue, 20 May 2025 10:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747735259; cv=none; b=WgtKA4x9SF7qQ31sMsTDW2OJTcCtCRBtS61rGBvhuTCQl7cKzeeXujzqRiSL1LdUFE1ciIszP4xPbiXOdqhQqNVWNyphljtl4r/5F//BjBst9YMzgmTVeBJfJ5amzhLZdKaSmD9dP436QWr7ORm2CB/Ff5FRwBx6iJVV95+35EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747735259; c=relaxed/simple;
	bh=VtvyvJBr+xABbz7Z/Y+DSfzvO6xe8ZmQbFMl50W4Adg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Nffd+I00/Gbyys5e5QgzUQi2U4uirlWzGIGum2Wiv3qodxaS6TCSTf6yrypCp+FlisXfkX4wpJ2nElHYRCktSHDbsfoXnncZJAOdwSrLQ6faNTTeT4Bs7tSsV50/2sgGhzZWlAeC3hHfZU9s6FRiREzEHxaAaJXOKSZPllsuvTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JO+mWJwv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 760E2C4CEE9;
	Tue, 20 May 2025 10:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747735258;
	bh=VtvyvJBr+xABbz7Z/Y+DSfzvO6xe8ZmQbFMl50W4Adg=;
	h=From:Date:Subject:To:Cc:From;
	b=JO+mWJwvZgebav7s6IIkQQVajz5Ge2lf2xdMS8+oBzHJAuNCNko1ml50feRmIYcFI
	 QwgZBahA6ywZWArWlTWEm6nZB/7CIVFtF4s6HXfpDo+pVW6O1snVx/y2siukRT5dMr
	 SPSVqb6bMl8w29K6mx9l1p/4EZGm7w/Jv755v0YLniNRfYegH4sdqsDxX2WE1MAANh
	 o9GCJeXo4uWFQdt+HzU4W2MfMEs7n24gEf2z3J0fIj++BsLnWRRDaP0FHSVt5ilcTS
	 BRGizJ3OF34h/Qi77xMYbHtYjpm9/VGIFLAvqS59B4NUUKqi5HOrr8RIPG8HieI4lB
	 bSPh57dhwneWg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 20 May 2025 12:00:53 +0200
Subject: [PATCH] Documentation: dma-buf: heaps: Add naming guidelines
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-dma-buf-heap-names-doc-v1-1-ab31f74809ee@kernel.org>
X-B4-Tracking: v=1; b=H4sIANRSLGgC/x3MQQqAIBBA0avIrBtQoxZdJVpMOtYsMlGKILx70
 vIt/n+hcBYuMKkXMt9S5IwNplPgdoobo/hmsNoOerAa/UG4XgF3poSRDi7oT4e9saMh0i7wCC1
 OmYM8/3heav0A9+Bmw2gAAAA=
X-Change-ID: 20250520-dma-buf-heap-names-doc-31261aa0cfe6
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1869; i=mripard@kernel.org;
 h=from:subject:message-id; bh=VtvyvJBr+xABbz7Z/Y+DSfzvO6xe8ZmQbFMl50W4Adg=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBk6QdfNUwoC2mY7pIvHTVs8LUzhR8fqpk8ldpqXXYO+O
 L6P7ovrmMrCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABPRncbYMNGk4Iwsd2V1e+ps
 3XsTpqmfUFMKzhEQbT7z/vnN71oLWd43tjx9LOK9OMr45ZwALfM9jA2npgk1H3Pw2nPqeQ5TlOY
 Egfsssh+6FB8yV/ZemSf31+Q6o/MSDc63D7dYN0/+7+ixShwA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

We've discussed a number of times of how some heap names are bad, but
not really what makes a good heap name.

Let's document what we expect the heap names to look like.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 Documentation/userspace-api/dma-buf-heaps.rst | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
index 535f49047ce6450796bf4380c989e109355efc05..b24618e360a9a9ba0bd85135d8c1760776f1a37f 100644
--- a/Documentation/userspace-api/dma-buf-heaps.rst
+++ b/Documentation/userspace-api/dma-buf-heaps.rst
@@ -21,5 +21,24 @@ following heaps:
    usually created either through the kernel commandline through the
    `cma` parameter, a memory region Device-Tree node with the
    `linux,cma-default` property set, or through the `CMA_SIZE_MBYTES` or
    `CMA_SIZE_PERCENTAGE` Kconfig options. Depending on the platform, it
    might be called ``reserved``, ``linux,cma``, or ``default-pool``.
+
+Naming Convention
+=================
+
+A good heap name is a name that:
+
+- Is stable, and won't change from one version to the other;
+
+- Describes the memory region the heap will allocate from, and will
+  uniquely identify it in a given platform;
+
+- Doesn't use implementation details, such as the allocator;
+
+- Can describe intended usage.
+
+For example, assuming a platform with a reserved memory region located
+at the RAM address 0x42000000, intended to allocate video framebuffers,
+and backed by the CMA kernel allocator. Good names would be
+`memory@42000000` or `video@42000000`, but `cma-video` wouldn't.

---
base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
change-id: 20250520-dma-buf-heap-names-doc-31261aa0cfe6

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>


