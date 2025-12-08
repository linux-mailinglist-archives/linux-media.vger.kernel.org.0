Return-Path: <linux-media+bounces-48382-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 31889CACC9A
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 11:04:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 891C33095AA1
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 10:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CDB23101B8;
	Mon,  8 Dec 2025 09:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QYCISWrP"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E53E2F6929;
	Mon,  8 Dec 2025 09:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765187559; cv=none; b=EHlqtH2Chw/qU4NtSKtHOIzMEk7QMGlyGMEcfbsQgOF/VaSeRlCHNexfEo/1nfm/rF9D87gKHuSli12kjekZpe5GdQCb4paKpE0ndPzF5rVM/yFrHso7FrCOGF3oodxX2LVpWuNJB4X7jmXRa1D86NXUssQyhAT49pByJanUbyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765187559; c=relaxed/simple;
	bh=W3g/qjurLiwWMVQbIZdUXiIhPWSknKR4dp2Kd3ms36k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YwhC1mJr4iEfg9Q2l5joeODxOUeuWpWUZf2i1KXCNtogGpK1CDaOl3n/kkO460IzfaJVJKWdbW1BbBcHaCgcCqZILO/IRwu7pB795EBNm/E52j7QsdMotNmbL7O33KVRccIvTSrvU4AeeH6NCbaiImx85G51KdPQ0Mk273FpcKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QYCISWrP; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765187555;
	bh=W3g/qjurLiwWMVQbIZdUXiIhPWSknKR4dp2Kd3ms36k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QYCISWrPaBYGTPXrI3nmOaAIIodsirOfCW7Qs3hW62ZK6Qq1r4Kfz+X37xCV2wb73
	 1ru+lqsp65UUBHK2gpV+aFvOUghn2u/5sH4+JgBr0z5kNecx2UqoqmwZsXJUyapXL7
	 iIQ80RPDJ7qqljyc2Fc05ggfAWsNKbqwDlV7v0K2iNuIYBjv9Q/eAIyZXWBgKziUNY
	 0xWIm4PEgx7JQSApaCzbh1ApYeeKPsr9nJUDwoBacfFyuihuey1w2nNnIMsBYFoiM9
	 KJWxCaKW/WaZlD8tDe2uAOQuvL8Cv3yED1x13Xcq47bqjCEnl8Hny2atYN6GaJpVjB
	 JRzthSTi313Sw==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:e493:1c28:b2b2:21dc])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3BC8617E1104;
	Mon,  8 Dec 2025 10:52:35 +0100 (CET)
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
Subject: [PATCH] media: verisilicon: AV1: Fix tx mode bit setting
Date: Mon,  8 Dec 2025 10:52:27 +0100
Message-ID: <20251208095227.19720-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251208095227.19720-1-benjamin.gaignard@collabora.com>
References: <20251208095227.19720-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If tx_mode field is non-zero then write it value + 2 else
write 0.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Fixes: 727a400686a2c ("media: verisilicon: Add Rockchip AV1 decoder")
---
 drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index f4f7cb45b1f1..fccdece51b1b 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -2005,7 +2005,7 @@ static void rockchip_vpu981_av1_dec_set_parameters(struct hantro_ctx *ctx)
 			 !!(ctrls->frame->flags & V4L2_AV1_FRAME_FLAG_ALLOW_HIGH_PRECISION_MV));
 	hantro_reg_write(vpu, &av1_comp_pred_mode,
 			 (ctrls->frame->flags & V4L2_AV1_FRAME_FLAG_REFERENCE_SELECT) ? 2 : 0);
-	hantro_reg_write(vpu, &av1_transform_mode, (ctrls->frame->tx_mode == 1) ? 3 : 4);
+	hantro_reg_write(vpu, &av1_transform_mode, ctrls->frame->tx_mode ? ctrls->frame->tx_mode + 2 : 0);
 	hantro_reg_write(vpu, &av1_max_cb_size,
 			 (ctrls->sequence->flags
 			  & V4L2_AV1_SEQUENCE_FLAG_USE_128X128_SUPERBLOCK) ? 7 : 6);
-- 
2.43.0


