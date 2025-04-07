Return-Path: <linux-media+bounces-29554-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A96F9A7E6C6
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 18:36:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9910018903BB
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 16:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B75A120D50A;
	Mon,  7 Apr 2025 16:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AQsLiNZG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AB220B7F2;
	Mon,  7 Apr 2025 16:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744043359; cv=none; b=j2Xfy6QGp11gBUpEDnWb9P75rTFxOEX080ZzJRCijU6H06PK8o+xBkTb1papHIiJcVFcIluEAs5RON44sgCbDHZcs0OJ5ThXfimlPdu0HY5Re++xLnaCMln/rxqPZ5fZgFtxRzTY7NK80EVKUcvQC/1LaJFG7EUBVoxtvebdk9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744043359; c=relaxed/simple;
	bh=1C6ZG4gfgRFuD1fnDCAECEFIYkJtuil+Y06ILcKyW2w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BPFzFzg/IvEqOqxoJadgVF77IDLmNSgfUP8bTRFiNGbDm+eyojs9ZS3RHSwXPFoT+gEtE91hnODBaa6OHswgpi7iQO4isot8dRwXbQIxnL7eJFKscgk/1rNGbyDspXBeQxZCIpiIwnxM/cAbGjn6/xTDenNZj3SgwAoekogu7Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AQsLiNZG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 308BCC4CEDD;
	Mon,  7 Apr 2025 16:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744043357;
	bh=1C6ZG4gfgRFuD1fnDCAECEFIYkJtuil+Y06ILcKyW2w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AQsLiNZG/aTcU5wR1SppHAaRoPsJR5YqBvb6TuYXJ2uVPu7NGp0BDKwIrkrkpfdNC
	 ceYII2Vjr4+Kr3yjC004BakBTHAGYHQvYPCBM+cpW0IbQ8NsAAG+TQpyHZu5oX9xm2
	 1V+UR7mvuWjxituJb/1ZzKFWzdJ7vrTYiWynUf9YzHZrfm6GISoVeWlAVrjKdB48vK
	 z30n58TD1LiH0ZPvWSB2zxq6wOVPXDqowpyObOGTIcJ0GyxBMs0N7C7J0fphLcrcsZ
	 aBFEcBRXnX7EdktV8EbLDXpGbtUjYYZXbqREVvrUoPNYavd2XXox8REKcg7EqaiijJ
	 RnNyGcBXlCFkQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 07 Apr 2025 18:29:07 +0200
Subject: [PATCH v3 1/2] dma-buf: heaps: system: Remove global variable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-dma-buf-ecc-heap-v3-1-97cdd36a5f29@kernel.org>
References: <20250407-dma-buf-ecc-heap-v3-0-97cdd36a5f29@kernel.org>
In-Reply-To: <20250407-dma-buf-ecc-heap-v3-0-97cdd36a5f29@kernel.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1239; i=mripard@kernel.org;
 h=from:subject:message-id; bh=1C6ZG4gfgRFuD1fnDCAECEFIYkJtuil+Y06ILcKyW2w=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOmf/4bdZdK44HYnfHtItur/6tT3ezpkQ6dWfPh9KT3YT
 mlf8conHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZiIzmVGhllKEyIVeDf03Z+1
 /kPhlasbTp3w3vrIgENgdZPDpufWT5YyMuzO375gd93Hq7fTzv97zfPxRum8a2x7ti39/nsrR1v
 CwTXsAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The system heap is storing its struct dma_heap pointer in a global
variable but isn't using it anywhere.

Let's move the global variable into system_heap_create() to make it
local.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/dma-buf/heaps/system_heap.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 26d5dc89ea1663a0d078e3a5723ca3d8d12b935f..82b1b714300d6ff5f3e543059dd8215ceaa00c69 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -19,12 +19,10 @@
 #include <linux/module.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 
-static struct dma_heap *sys_heap;
-
 struct system_heap_buffer {
 	struct dma_heap *heap;
 	struct list_head attachments;
 	struct mutex lock;
 	unsigned long len;
@@ -422,10 +420,11 @@ static const struct dma_heap_ops system_heap_ops = {
 };
 
 static int __init system_heap_create(void)
 {
 	struct dma_heap_export_info exp_info;
+	struct dma_heap *sys_heap;
 
 	exp_info.name = "system";
 	exp_info.ops = &system_heap_ops;
 	exp_info.priv = NULL;
 

-- 
2.49.0


