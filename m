Return-Path: <linux-media+bounces-50658-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA1BD1D5C8
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 10:07:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2D6C6300A9BC
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 09:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FE42381711;
	Wed, 14 Jan 2026 09:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CU66B5Ue"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40634199D8;
	Wed, 14 Jan 2026 09:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768381638; cv=none; b=CL+4BF8cZ77yk1zv8S1gv+7VmHGneifNBcFtro04d/yaNVK6WbR9SiNvUp4oJpZw0/Q/G8Mf05uMePeuiNJITVuF4C76BHJC15HE2h9GtUNo+PhHqPKO6Hwg8Ald5CImFf9jaoMWU+cZTN1qp02MFmvovoRJfDF4wbubCmaY5QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768381638; c=relaxed/simple;
	bh=j119wK6B4A0ysyL4xbjSO7vHKZL3ZlEVWLrbyVa9FPg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HFg2ErtoeO67n1Pe+skiV3REAI+bMc7h2Tn+lRnnijLSVzSiybK/6PFHhD+nqywiglyS4BxF2NEj1GWjoc6siuySh5334AzjkelCC85y++Ir1E4Avx43Apx2D+qqH0zdOwHRg0EutO1aRk7n4ErVG9hWZNydAQqJw/bjhbFBHU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CU66B5Ue; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768381635;
	bh=j119wK6B4A0ysyL4xbjSO7vHKZL3ZlEVWLrbyVa9FPg=;
	h=From:To:Cc:Subject:Date:From;
	b=CU66B5UepWe+HPoa9c+V7/8zP0ArJSABZQ5thZD/8sIH3pKn1uJhRsU0cCIn3wbdu
	 jjLhZCwBKAPs/6//wE7L02ekcY1/3eRr5Swg5hq6WqHPloDUVPkPaoCFDGknBepPlA
	 da9WY7k71yxtVsAfcC6BO3/6yT4wtzGxjbYXQ41gbvBM+QFFjJtbMPDvJ3XmqRY/Hj
	 r4xTQeEXIXLiB9hDKNW0zBsy7lYsau1hU6E75BYaUE0vYTLUD27hdUjQHYnNNv7CD2
	 E6vyDHZWy1bFwgeYwD0QH4HlQBOfFZOexxuvCr+SbmJOKvfZgKorQRy+yhk8Nr2ZtP
	 vBHkMpK+C02dg==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:1dad:60e8:7174:bd20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 32F2917E13C3;
	Wed, 14 Jan 2026 10:07:15 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	heiko@sntech.de,
	hverkuil@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH] media: verisilicon: AV1: Fix tile info buffer size
Date: Wed, 14 Jan 2026 10:07:10 +0100
Message-ID: <20260114090710.71473-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each tile info is composed of: row_sb, col_sb, start_pos
and end_pos (4 bytes each). So the total required memory
is AV1_MAX_TILES * 16 bytes.
Use the correct #define to allocate the buffer and avoid
writing tile info in non-allocated memory.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Fixes: 727a400686a2c ("media: verisilicon: Add Rockchip AV1 decoder")
---
 .../media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index e4703bb6be7c..af854b149f35 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -373,12 +373,12 @@ int rockchip_vpu981_av1_dec_init(struct hantro_ctx *ctx)
 		return -ENOMEM;
 	av1_dec->global_model.size = GLOBAL_MODEL_SIZE;
 
-	av1_dec->tile_info.cpu = dma_alloc_coherent(vpu->dev, AV1_MAX_TILES,
+	av1_dec->tile_info.cpu = dma_alloc_coherent(vpu->dev, AV1_TILE_INFO_SIZE,
 						    &av1_dec->tile_info.dma,
 						    GFP_KERNEL);
 	if (!av1_dec->tile_info.cpu)
 		return -ENOMEM;
-	av1_dec->tile_info.size = AV1_MAX_TILES;
+	av1_dec->tile_info.size = AV1_TILE_INFO_SIZE;
 
 	av1_dec->film_grain.cpu = dma_alloc_coherent(vpu->dev,
 						     ALIGN(sizeof(struct rockchip_av1_film_grain), 2048),
-- 
2.43.0


