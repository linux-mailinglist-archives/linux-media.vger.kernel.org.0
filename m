Return-Path: <linux-media+bounces-11486-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A748C6808
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 15:58:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF41EB2431A
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 13:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CE6A140388;
	Wed, 15 May 2024 13:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tOp4lR8X"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B769C14036A;
	Wed, 15 May 2024 13:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715781471; cv=none; b=uw5GjysECbnsMly5EdG6OdgxwF4I1lvVKtszDILgWgpPwTDuWXsqOh36eqN0OB4DRzSjxdjr4sYeRF0zRISu+0Jr/vk2hKmDVCeBEtEj0K4IMLq08iryFVI0bYn756SY/EQlGJZa5orBb+ayS4kh09ufdH10srNXoc3KRrJs0Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715781471; c=relaxed/simple;
	bh=WlatdzDn5ln9onnNggxk+fyl1HpLY51fWYKvzy2mHOg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c91rY8S5tUzr6ewzTbtiYbFvo3hwMJeW/5d7nPDmVOl6TChiKIot8qRF7W9LXXQ6LPrWJdmXKOvqRTTNzjvSqcfvkVDUwoCY6eYeAWcTzRxJQGFop7xW1ooVScjZsHsvCmrYLDBvj0w1jQ9baGL7wP/ILJrcMuEdRK/dxm0oqG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tOp4lR8X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B28C116B1;
	Wed, 15 May 2024 13:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715781471;
	bh=WlatdzDn5ln9onnNggxk+fyl1HpLY51fWYKvzy2mHOg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tOp4lR8Xi9y7SXrlPN4RRDtbbEihJDZsXFsYuT50HqukD2dqQDCKdRN12/0+EMRKb
	 4GxcHkEYYQwNTs55WBFKc3l8txKL7m7sWXy58yR6ih2EpH7fbVOpRIbmJzLB6y7L43
	 z3tzAMtENCjfDLcFGgLMxefwVbI2x/Ra7oqPq5kA6UeMNjS2ontIRJ7DJYf23xlGTD
	 xRqA61OBzd3oV7HWy8to7fJOtP3opiZ9MdMxQw1dt2zDLuA0DQztG0HIZC/g1962Us
	 k5i+gtEJav11An/G8O6Hb/Kv3zajjRErguxEBm1vDSs9KJn7+vjtGWzAjdYB9tbZ1E
	 XDf25KvPwtkxA==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 15 May 2024 15:56:58 +0200
Subject: [PATCH 3/8] dma-buf: heaps: Import uAPI header
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240515-dma-buf-ecc-heap-v1-3-54cbbd049511@kernel.org>
References: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
In-Reply-To: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=758; i=mripard@kernel.org;
 h=from:subject:message-id; bh=WlatdzDn5ln9onnNggxk+fyl1HpLY51fWYKvzy2mHOg=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGku+/3e/CltXrZHt3vnu0l/DhuoJs0MtQxoT13VdKcst
 2F5oU55x1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjI9cmMDY8aVp+d+WfjezXZ
 BxK7Ww+09n27yvEt6mCamVPDJU9H0ef93XVdB32ttZZOu7j37cmVVxnrPdJ8JPqMt8d3xXZP5t7
 xT1xa/dZ8lb1mKvf895zO+z7ZtenGhg5hzzuPwsUUkhKear4GAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The uAPI header has a bunch of constants and structures that might be
handy in drivers.

Let's include the header in the driver-side dma-heap header.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/linux/dma-heap.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
index 0c05561cad6e..e7cf110c5fdc 100644
--- a/include/linux/dma-heap.h
+++ b/include/linux/dma-heap.h
@@ -10,10 +10,12 @@
 #define _DMA_HEAPS_H
 
 #include <linux/cdev.h>
 #include <linux/types.h>
 
+#include <uapi/linux/dma-heap.h>
+
 struct dma_heap;
 
 /**
  * struct dma_heap_ops - ops to operate on a given heap
  * @allocate:		allocate dmabuf and return struct dma_buf ptr

-- 
2.44.0


