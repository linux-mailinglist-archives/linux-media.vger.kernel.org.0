Return-Path: <linux-media+bounces-16075-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0056594DBCD
	for <lists+linux-media@lfdr.de>; Sat, 10 Aug 2024 11:10:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F3E51F22086
	for <lists+linux-media@lfdr.de>; Sat, 10 Aug 2024 09:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52E15158540;
	Sat, 10 Aug 2024 09:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QCrHhe1t"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F4814E2C0;
	Sat, 10 Aug 2024 09:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723280983; cv=none; b=aOdO8+OptScTinGtwlnJva24kH5/LrapnWDVHUpZY6mXHVgken1pLZnGSz0O8ovfHkg/EY1dvyD0Jl/lMqbA8qmYuFPBUsHrEhtUPhGt+gvsHypY9X+7U5cbET77dQNKL6xWj8o98oSuyeA4Q5ebkayiOw24GnkQVkUWtLUPgvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723280983; c=relaxed/simple;
	bh=ROGEn5ECVelo0EfWlJ1OSMy/l5R+qmtaTbsKv+Infh4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V3iZriDPmYtOtV5TqkCyavM7krqg8+92yHEfxPxMWGLgoigAVA9rjCjuUGWDdOD7ExVZQrlVJ4pvPyM7bKDUniSaP6blI4kGfFtOjvmjIOwDf32rvu8cWiQM/AwazOEO8I5fTlxIgNiHHQOHpcE4V9N3vCxYkQfz9zRxAr0Oudo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QCrHhe1t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57A03C32781;
	Sat, 10 Aug 2024 09:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723280983;
	bh=ROGEn5ECVelo0EfWlJ1OSMy/l5R+qmtaTbsKv+Infh4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QCrHhe1tehZEgJv9yR01fvEw4fMFqrOrQbpgACuU6KeO0JhwgNiJIoL1LlGJo9xUg
	 xKDLSUWtO5SWa62SQQjUxeQk3oVZIRJN1Gdms+FCSkE1PymDDISRaypD7l8R6s2ynP
	 8Nmns4r7qD+kZZFq6q0vZS4dy/r+CreBDBRNyP7c6bFgPPMeP92Md1o4WcSVgRTrsU
	 Y3SjSzGdEEgT9n+3b1I5mex1QCVg89oQlx5yGloS6ZEE/DHwWAJucT+KuiA0kt+Bm1
	 N4JA8ybhUjAny9H/xJ6hGWdfEm4ygXTwIsrbGr858cUXb1r46BvK1BxnKj/VfJXnIv
	 poSb/APgF54Tg==
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
Subject: [PATCH v3 5/5] soc: mediatek: cmdq: Remove cmdq_pkt_finalize() helper function
Date: Sat, 10 Aug 2024 09:09:18 +0000
Message-Id: <20240810090918.7457-6-chunkuang.hu@kernel.org>
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

In order to have fine-grained control, use cmdq_pkt_eoc() and
cmdq_pkt_jump_rel() to replace cmdq_pkt_finalize().

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 22 ----------------------
 include/linux/soc/mediatek/mtk-cmdq.h  | 13 -------------
 2 files changed, 35 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index a8fccedba83f..2a47dda4dd4a 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -538,27 +538,5 @@ int cmdq_pkt_eoc(struct cmdq_pkt *pkt)
 }
 EXPORT_SYMBOL(cmdq_pkt_eoc);
 
-int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
-{
-	struct cmdq_instruction inst = { {0} };
-	int err;
-
-	/* insert EOC and generate IRQ for each command iteration */
-	inst.op = CMDQ_CODE_EOC;
-	inst.value = CMDQ_EOC_IRQ_EN;
-	err = cmdq_pkt_append_command(pkt, inst);
-	if (err < 0)
-		return err;
-
-	/* JUMP to end */
-	inst.op = CMDQ_CODE_JUMP;
-	inst.value = CMDQ_JUMP_PASS >>
-		cmdq_get_shift_pa(((struct cmdq_client *)pkt->cl)->chan);
-	err = cmdq_pkt_append_command(pkt, inst);
-
-	return err;
-}
-EXPORT_SYMBOL(cmdq_pkt_finalize);
-
 MODULE_DESCRIPTION("MediaTek Command Queue (CMDQ) driver");
 MODULE_LICENSE("GPL v2");
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 5bee6f7fc400..0c3906e8ad19 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -391,14 +391,6 @@ int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa);
  */
 int cmdq_pkt_eoc(struct cmdq_pkt *pkt);
 
-/**
- * cmdq_pkt_finalize() - Append EOC and jump command to pkt.
- * @pkt:	the CMDQ packet
- *
- * Return: 0 for success; else the error code is returned
- */
-int cmdq_pkt_finalize(struct cmdq_pkt *pkt);
-
 #else /* IS_ENABLED(CONFIG_MTK_CMDQ) */
 
 static inline int cmdq_dev_get_client_reg(struct device *dev,
@@ -519,11 +511,6 @@ static inline int cmdq_pkt_eoc(struct cmdq_pkt *pkt)
 	return -EINVAL;
 }
 
-static inline int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
-{
-	return -EINVAL;
-}
-
 #endif /* IS_ENABLED(CONFIG_MTK_CMDQ) */
 
 #endif	/* __MTK_CMDQ_H__ */
-- 
2.34.1


