Return-Path: <linux-media+bounces-16072-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D029994DBC6
	for <lists+linux-media@lfdr.de>; Sat, 10 Aug 2024 11:10:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75C041F22347
	for <lists+linux-media@lfdr.de>; Sat, 10 Aug 2024 09:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43FD715746A;
	Sat, 10 Aug 2024 09:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kF7YFE/2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D0D1CD37;
	Sat, 10 Aug 2024 09:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723280973; cv=none; b=l+7/eGAhTRCM40SfrZcFyV5iJleNb/xcsqcoP4itjZngvSIi2mmtr3TiYQxb0yi5PE6RzcNh8HAmHZ+qiAtkGPej8JsD6CkFarIN70HgZmgDjmPBFae7VtDfUzph4FuxMYQ1553txSiwDBokNLESyILxcCPNfBOGbF8yqCLIRoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723280973; c=relaxed/simple;
	bh=HspsSskBa2s3o+CjExE7DqUE/JIgX3VED+Eb67tWGS4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b7DPUXklhTYljr9JMz6LKUA7vpnKwbyZ4nPTRk781bzcMpmg4CQsuShnzgGrF5MLFxDscOX78+6KyGkCuMh4AyP6F8IVq3CY0SWO1CpCw0c1m4RnrtDdr6D0YWbqw4pk56+Qriizy1xOrmOTAIB0hU7JYTZZPJH/g0iGCLNBppc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kF7YFE/2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 787E4C32781;
	Sat, 10 Aug 2024 09:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723280973;
	bh=HspsSskBa2s3o+CjExE7DqUE/JIgX3VED+Eb67tWGS4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kF7YFE/2LlWrLH2YjCy2uRPJgfw+n22HeBfBcO0ao5x77U84Kz9JIRKr6VlnT2ZLG
	 nuQH9W6hvA7GdI/fdeK7CSzcAGuLeuZCn61vWIoJJM7GjljMKn7DfpqjYUhLN+gKBC
	 BkmOLv2nHfNvtXYAD/+1cYHpnnoZqshoJdq41/dgXIpdNy4PVuX2UlV7Olsy5ooOOJ
	 gowd2Dxt6EF4DnIIhYADwtrxPIGVLD2q3R23jgEXUPs66aeWaYzhhq3vNtUULejsuD
	 NW8mKozh8GopMFavdh00U/bfRySSdk41tc0JiEPHGApzpxBN9lBCWK9wA1plPLcrCX
	 tQm2FtdeRXkRg==
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
Subject: [PATCH v3 2/5] drm/mediatek: Use cmdq_pkt_create() and cmdq_pkt_destroy()
Date: Sat, 10 Aug 2024 09:09:15 +0000
Message-Id: <20240810090918.7457-3-chunkuang.hu@kernel.org>
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

Use cmdq_pkt_create() and cmdq_pkt_destroy() common function
instead of implementing drm version.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c | 46 +++--------------------------
 1 file changed, 4 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index a1976c3ae001..5413c0c3dfe8 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -113,44 +113,6 @@ static void mtk_drm_finish_page_flip(struct mtk_crtc *mtk_crtc)
 	}
 }
 
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
-static int mtk_drm_cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *pkt,
-				   size_t size)
-{
-	struct device *dev;
-	dma_addr_t dma_addr;
-
-	pkt->va_base = kzalloc(size, GFP_KERNEL);
-	if (!pkt->va_base)
-		return -ENOMEM;
-
-	pkt->buf_size = size;
-	pkt->cl = (void *)client;
-
-	dev = client->chan->mbox->dev;
-	dma_addr = dma_map_single(dev, pkt->va_base, pkt->buf_size,
-				  DMA_TO_DEVICE);
-	if (dma_mapping_error(dev, dma_addr)) {
-		dev_err(dev, "dma map failed, size=%u\n", (u32)(u64)size);
-		kfree(pkt->va_base);
-		return -ENOMEM;
-	}
-
-	pkt->pa_base = dma_addr;
-
-	return 0;
-}
-
-static void mtk_drm_cmdq_pkt_destroy(struct cmdq_pkt *pkt)
-{
-	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
-
-	dma_unmap_single(client->chan->mbox->dev, pkt->pa_base, pkt->buf_size,
-			 DMA_TO_DEVICE);
-	kfree(pkt->va_base);
-}
-#endif
-
 static void mtk_crtc_destroy(struct drm_crtc *crtc)
 {
 	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
@@ -158,7 +120,7 @@ static void mtk_crtc_destroy(struct drm_crtc *crtc)
 
 	mtk_mutex_put(mtk_crtc->mutex);
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	mtk_drm_cmdq_pkt_destroy(&mtk_crtc->cmdq_handle);
+	cmdq_pkt_destroy(&mtk_crtc->cmdq_client, &mtk_crtc->cmdq_handle);
 
 	if (mtk_crtc->cmdq_client.chan) {
 		mbox_free_channel(mtk_crtc->cmdq_client.chan);
@@ -1094,9 +1056,9 @@ int mtk_crtc_create(struct drm_device *drm_dev, const unsigned int *path,
 			mbox_free_channel(mtk_crtc->cmdq_client.chan);
 			mtk_crtc->cmdq_client.chan = NULL;
 		} else {
-			ret = mtk_drm_cmdq_pkt_create(&mtk_crtc->cmdq_client,
-						      &mtk_crtc->cmdq_handle,
-						      PAGE_SIZE);
+			ret = cmdq_pkt_create(&mtk_crtc->cmdq_client,
+					      &mtk_crtc->cmdq_handle,
+					      PAGE_SIZE);
 			if (ret) {
 				dev_dbg(dev, "mtk_crtc %d failed to create cmdq packet\n",
 					drm_crtc_index(&mtk_crtc->base));
-- 
2.34.1


