Return-Path: <linux-media+bounces-24985-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3832FA16F46
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 16:36:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E87BC1883F61
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 15:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F921E98E3;
	Mon, 20 Jan 2025 15:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PASg49tD"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFBF1E8824;
	Mon, 20 Jan 2025 15:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737387365; cv=none; b=OMpj00rtXPKXaDvThWsLz2WgAr0MC7TMvTY7zybOFhSK5iqmY1aY98pBBW8GsLLpNkftPcnR5a/uCTy8P47zRAov+dHtf+dAfPUCqtJYccAbFiZwE3INNlo7AdWu8296ejq1Q4PpJnWLB6Gi23TkERrJ6OLdeZNwNcsfeyrTjVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737387365; c=relaxed/simple;
	bh=38XfVFiUzFZdoqYpFgHfA8U6CjXWamNPxamWEgmKX1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tYmW9CIruJdtAcLHj18fhR376HKzy1qa80RXjOTNqBfOq6PxQ644eNnNZzaTOzlph4LC7NawP0mSMBt7W0JxCQcNEPNBxuCYHf94haIn6QmllJrLXs4iWJtlA/TElEDpJhBPRsmhBj62xz6RnpMGoIRVhhKZRu7SJtSkxeMefW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PASg49tD; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1737387361;
	bh=38XfVFiUzFZdoqYpFgHfA8U6CjXWamNPxamWEgmKX1Y=;
	h=From:To:Cc:Subject:Date:From;
	b=PASg49tDoF/izLzWasFK6zvrPpgngmGzpQkB4ulG2QT5pAsHQHlofw99jzYGrmZMD
	 f83PlpOoivLp8TkVuxitz56CpfD7O1HwL3070uqrXpw0s5soYuwoJwhn/+o7CqoXhT
	 8hCv8RL5ZzHrPVP8/9D+KEvKb3obN2mEDy3V+Cy0IAansOVI5vUALg9WrYRkST36ru
	 8sRWUYFDUoft2cB1gGhwQS3BVmSfXRStlnz0ktn9F3sAYR3YEfE1asiF5BOriYzG3o
	 NsV3TNYGh6iLn/StyGh5uKB+N+lp12CBj75C7loSZLVDpQDLnN/1xPl4a5UBFl9+Kn
	 mEGtlOZW5aPqQ==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:fb75:b420:7f1c:508])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 07A9F17E0FAA;
	Mon, 20 Jan 2025 16:36:01 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v3] media: verisilicon: HEVC: Initialize start_bit field
Date: Mon, 20 Jan 2025 16:35:55 +0100
Message-ID: <20250120153555.404806-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Always set start_bit field to 0, if not it could lead to corrupted frames
specially when decoding VP9 bitstreams at the same time since VP9 driver
set it for its own purpose.

Fixes: cb5dd5a0fa51 ("media: hantro: Introduce G2/HEVC decoder")
Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
index 85a44143b378..0e212198dd65 100644
--- a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
+++ b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
@@ -518,6 +518,7 @@ static void set_buffers(struct hantro_ctx *ctx)
 	hantro_reg_write(vpu, &g2_stream_len, src_len);
 	hantro_reg_write(vpu, &g2_strm_buffer_len, src_buf_len);
 	hantro_reg_write(vpu, &g2_strm_start_offset, 0);
+	hantro_reg_write(vpu, &g2_start_bit, 0);
 	hantro_reg_write(vpu, &g2_write_mvs_e, 1);
 
 	hantro_write_addr(vpu, G2_TILE_SIZES_ADDR, ctx->hevc_dec.tile_sizes.dma);
-- 
2.43.0


