Return-Path: <linux-media+bounces-16071-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFDF94DBC3
	for <lists+linux-media@lfdr.de>; Sat, 10 Aug 2024 11:09:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 046931C20F4B
	for <lists+linux-media@lfdr.de>; Sat, 10 Aug 2024 09:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D26FE15252D;
	Sat, 10 Aug 2024 09:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WLUMjZlc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDE71CD37;
	Sat, 10 Aug 2024 09:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723280970; cv=none; b=o38aN6yI3BRW6jFOW553sPDRXFyB/rqUXg+mKshAGG00UTvqkfzj0lj5q5H6VT3Cpj6ulvropQanBvFYsCapU68d8D1XFOPPIacGE1KvHl92e2jHbAnNG5FPXlWpq9UENQDXLSTFLrc9n2xJazz7FZbuLiMP0ettdHamUfkbRXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723280970; c=relaxed/simple;
	bh=1Fnww6k0nGJSxPsTeSzHvQo4ix8VyOpPTfrw4z8M81Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lCNZztH4htdL8Q8bUiGS7Q75LzMyCDtFXhj3oCp0sXyQabbvkChUJBaJk2eaX+BueMceHPSFz1kVinNdqn1bvu3uJj6IMGYF+TqNKkFSJ3KH9LaZmDChRzgK50flGcmqWveddEIJiMWi4kEEBPO0L6BllDHQvv3zvAKUjBKedw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WLUMjZlc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 279A2C4AF0C;
	Sat, 10 Aug 2024 09:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723280969;
	bh=1Fnww6k0nGJSxPsTeSzHvQo4ix8VyOpPTfrw4z8M81Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WLUMjZlcnxAJA6zW3HW/7RPikZOue9Bm8r+LiundHSKLCNTdC6ej9p0aF5WeSbuJC
	 hvJs8PijYz5AiE2t/oB6iC9K0aO8Bkt2ars/onu/nrK/sKHkZLVmNb+FC+EWR4QrOR
	 Te2EtXMZRRDO1Ca6fj4joLczo3X/dGn34gNSu1MTnUIXFY2l0EyLTLnugGF72IfVPK
	 bdH65meJw6tYfRScQyEk/urPQjo8r116QEktU2oce+vbgKryChKjq7lmuVU1KG2Ub7
	 6TKupH1i79E2oeIp7Zbi3SCErDTY4LjRFrcBmEEscOVFeLTGCuoC3QKGqgzU+7RQXc
	 k6iamFwZq0rfA==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Moudy Ho <moudy.ho@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v3 1/5] drm/mediatek: Use cmdq_pkt_eoc() instead of cmdq_pkt_finalize()
Date: Sat, 10 Aug 2024 09:09:14 +0000
Message-Id: <20240810090918.7457-2-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240810090918.7457-1-chunkuang.hu@kernel.org>
References: <20240810090918.7457-1-chunkuang.hu@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For some client driver, it want to reduce latency between excuting
previous packet command and next packet command, so append jump
command to the end of previous packet and the jump destination
address is the start address of next packet command buffer. Before
next packet exist, the previous packet has no information of where
to jump to, so append nop command first. When next packet exist,
change nop command to jump command. For mediatek drm driver, it
never has next packet, so appending nop command is redundant.
Because cmdq_pkt_finalize() would append nop command, so change
calling cmdq_pkt_finalize() to cmdq_pkt_eoc() to prevent append
redundant nop command.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 6f34f573e127..a1976c3ae001 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -607,7 +607,7 @@ static void mtk_crtc_update_config(struct mtk_crtc *mtk_crtc, bool needs_vblank)
 		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
 		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
 		mtk_crtc_ddp_config(crtc, cmdq_handle);
-		cmdq_pkt_finalize(cmdq_handle);
+		cmdq_pkt_eoc(cmdq_handle);
 		dma_sync_single_for_device(mtk_crtc->cmdq_client.chan->mbox->dev,
 					   cmdq_handle->pa_base,
 					   cmdq_handle->cmd_buf_size,
-- 
2.34.1


