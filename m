Return-Path: <linux-media+bounces-2340-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A838110F4
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 13:20:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A513B1C20EF9
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 12:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C622828E2C;
	Wed, 13 Dec 2023 12:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JWgYlV/K"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [IPv6:2a00:1098:ed:100::25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 710E5CF;
	Wed, 13 Dec 2023 04:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702470030;
	bh=9nciZ1s7i4iPVYsAX6ZTDm0XS3kNJiPzFH0jLeN0v0g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JWgYlV/K+sX/Xg4s92JYgwTzZOX/1IDaVvv9M5HDRPpldhCk8rQ/LGh6kVLjX7BO0
	 kgJabGOn+G+9yas1/kvmCS2n3V7Oeu/NtbWXpd7L7ymDFV5bVJJLv5FDZQl6sjLl1o
	 EsLf0OAJ6DZw7HZ1ctmbWuVPiokcXNRjz3JSvbA0F4foify2H0xucCqf0lBuQWjMpl
	 Uajg4uM/w3iXsRSBYbPyODUOQ7nBtDgv8fn1DR54msAWXIvL5CkdOezAv6JE4yLWF6
	 L3QIMLYW3oglsNNpPpABh1+L7hcPU8aRsLJUbyCf8O3ZA0RL4ivIZTk2VXFuLX51PB
	 A1Fpn9jbwWSNw==
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2D2153781485;
	Wed, 13 Dec 2023 12:20:29 +0000 (UTC)
From: Eugen Hristev <eugen.hristev@collabora.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	kernel@collabora.com,
	eugen.hristev@collabora.com,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	matthias.bgg@gmail.com
Subject: [PATCH 2/4] media: mediatek: vcodec: fix possible unbalanced PM counter
Date: Wed, 13 Dec 2023 14:20:15 +0200
Message-Id: <20231213122017.102100-2-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231213122017.102100-1-eugen.hristev@collabora.com>
References: <20231213122017.102100-1-eugen.hristev@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is possible that mtk_vcodec_enc_pw_on fails, and in that scenario
the PM counter is not incremented, and subsequent call to
mtk_vcodec_enc_pw_off decrements the counter, leading to a PM imbalance.
Fix by bailing out of venc_if_encode in the case when mtk_vcodec_enc_pw_on
fails.

Fixes: 4e855a6efa54 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Encoder Driver")
Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
---
 .../platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.c     | 4 +++-
 .../platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.h     | 2 +-
 drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.c | 5 ++++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.c
index a22b7dfc656e..1a2b14a3e219 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.c
@@ -58,13 +58,15 @@ int mtk_vcodec_init_enc_clk(struct mtk_vcodec_enc_dev *mtkdev)
 	return 0;
 }
 
-void mtk_vcodec_enc_pw_on(struct mtk_vcodec_pm *pm)
+int mtk_vcodec_enc_pw_on(struct mtk_vcodec_pm *pm)
 {
 	int ret;
 
 	ret = pm_runtime_resume_and_get(pm->dev);
 	if (ret)
 		dev_err(pm->dev, "pm_runtime_resume_and_get fail: %d", ret);
+
+	return ret;
 }
 
 void mtk_vcodec_enc_pw_off(struct mtk_vcodec_pm *pm)
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.h b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.h
index 157ea08ba9e3..2e28f25e36cc 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.h
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.h
@@ -10,7 +10,7 @@
 #include "mtk_vcodec_enc_drv.h"
 
 int mtk_vcodec_init_enc_clk(struct mtk_vcodec_enc_dev *dev);
-void mtk_vcodec_enc_pw_on(struct mtk_vcodec_pm *pm);
+int mtk_vcodec_enc_pw_on(struct mtk_vcodec_pm *pm);
 void mtk_vcodec_enc_pw_off(struct mtk_vcodec_pm *pm);
 void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm);
 void mtk_vcodec_enc_clock_off(struct mtk_vcodec_pm *pm);
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.c
index c402a686f3cb..e83747b8d69a 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.c
@@ -64,7 +64,9 @@ int venc_if_encode(struct mtk_vcodec_enc_ctx *ctx,
 	ctx->dev->curr_ctx = ctx;
 	spin_unlock_irqrestore(&ctx->dev->irqlock, flags);
 
-	mtk_vcodec_enc_pw_on(&ctx->dev->pm);
+	ret = mtk_vcodec_enc_pw_on(&ctx->dev->pm);
+	if (ret)
+		goto venc_if_encode_pw_on_err;
 	mtk_vcodec_enc_clock_on(&ctx->dev->pm);
 	ret = ctx->enc_if->encode(ctx->drv_handle, opt, frm_buf,
 				  bs_buf, result);
@@ -75,6 +77,7 @@ int venc_if_encode(struct mtk_vcodec_enc_ctx *ctx,
 	ctx->dev->curr_ctx = NULL;
 	spin_unlock_irqrestore(&ctx->dev->irqlock, flags);
 
+venc_if_encode_pw_on_err:
 	mtk_venc_unlock(ctx);
 	return ret;
 }
-- 
2.34.1


