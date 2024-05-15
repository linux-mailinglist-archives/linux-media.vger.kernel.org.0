Return-Path: <linux-media+bounces-11488-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B1A8C680F
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 15:59:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7557D1C21C88
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 13:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7AD61411F1;
	Wed, 15 May 2024 13:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KtdH8diI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099751411DB;
	Wed, 15 May 2024 13:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715781478; cv=none; b=qccHXTjTShCBjxBbSPxVvcY7RZizKfqnwEo+9P7A+GRj3/ypnFd3Cr1oO9NJdQMMaGzhVikOnffI5P6KT69aVnrWWf2Avy+E74I0suTCm6cyHrQR9aQtK+xTpdJM7/1xl3uu/6uYezVGQh/q9kT/WoDWppwPcecKhxo6gP/2SKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715781478; c=relaxed/simple;
	bh=+td2VTdxnfVRiC1SSw6dBtys0XD7Sod+cqvq7T/2at8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kR6iQm36QeK2O9qm1NDjr1/MbSIWMeUf+KtM2haoyam2Bo5qV6rXcvg+19UngJ/rIeMY/N6D1zP2jdZzq/I1NhZ+fGmulTsHugE4myqzHBipP99qhkWZO+cbhphtoGIvNPyO25rX0afvN0hLG7+qbYtPPcE3i+GWYkbUDbJFreA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KtdH8diI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47694C2BD11;
	Wed, 15 May 2024 13:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715781477;
	bh=+td2VTdxnfVRiC1SSw6dBtys0XD7Sod+cqvq7T/2at8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KtdH8diImn5gIEe0U7/AhqBlZ7YEtbhRy6QCY7F6lxBQkdF5Ctxrj9Uc7TMvLQbp7
	 Zb+vFQM9TKFFcOyEYx2GwJ1NWd4Han36isoLtvmMqXDDU6NWjUnb40FJNrywbYpmME
	 vq9Nzb0xa1oAoA3HduTOopGkMp17mn/A14jg7fcIU/ghx0AQ2hnmYDpC+H/rREJ1dA
	 HEy4TUvR4dQ4kcT2NP6sJkCBu6RkZnB9V6M1iiWYv0Qb/QkMLS4fjKtlt5gKX+Eqj8
	 VA0k9ubrvJvcZjM3JLgi3wlmippUnGZ/mDAvxVJhxYABsg+qdGtootB7uKAiHumCaH
	 z0ybkFLOOhCEw==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 15 May 2024 15:57:00 +0200
Subject: [PATCH 5/8] dma-buf: heaps: system: Remove global variable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240515-dma-buf-ecc-heap-v1-5-54cbbd049511@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1705; i=mripard@kernel.org;
 h=from:subject:message-id; bh=+td2VTdxnfVRiC1SSw6dBtys0XD7Sod+cqvq7T/2at8=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGku+/0vr4tVvXx5rcA68dY53V7P43MLbmlFVFxelf615
 bKyDqtAx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjIz1rGWvmESVdfXVrnsvWM
 5ZV5XTtvv5nv0vOpZ+muNZJdJ9O5jPcvSdxwp2vVjilOJ54l3/GYa89YzVJ+5U1ncHDQnzvFb1p
 /lNm/dv6p/zB36vwJxiucfl4+53KiSET88P1HOiHcht6W3gX9AA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The system heap has been using its struct dma_heap pointer but wasn't
using it anywhere.

Since we'll need additional parameters to attach to that heap type,
let's create a private structure and set it as the dma_heap drvdata,
removing the global variable in the process.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/dma-buf/heaps/system_heap.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 9076d47ed2ef..8b5e6344eea4 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -19,11 +19,13 @@
 #include <linux/module.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 
-static struct dma_heap *sys_heap;
+struct system_heap {
+	struct dma_heap *heap;
+};
 
 struct system_heap_buffer {
 	struct dma_heap *heap;
 	struct list_head attachments;
 	struct mutex lock;
@@ -422,17 +424,22 @@ static const struct dma_heap_ops system_heap_ops = {
 };
 
 static int system_heap_create(void)
 {
 	struct dma_heap_export_info exp_info;
+	struct system_heap *sys_heap;
+
+	sys_heap = kzalloc(sizeof(*sys_heap), GFP_KERNEL);
+	if (!sys_heap)
+		return -ENOMEM;
 
 	exp_info.name = "system";
 	exp_info.ops = &system_heap_ops;
-	exp_info.priv = NULL;
+	exp_info.priv = sys_heap;
 
-	sys_heap = dma_heap_add(&exp_info);
-	if (IS_ERR(sys_heap))
-		return PTR_ERR(sys_heap);
+	sys_heap->heap = dma_heap_add(&exp_info);
+	if (IS_ERR(sys_heap->heap))
+		return PTR_ERR(sys_heap->heap);
 
 	return 0;
 }
 module_init(system_heap_create);

-- 
2.44.0


