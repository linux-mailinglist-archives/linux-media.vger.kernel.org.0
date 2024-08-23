Return-Path: <linux-media+bounces-16681-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 264E595D87B
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 23:33:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB0802872AA
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 21:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEDA61C824A;
	Fri, 23 Aug 2024 21:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b="fh74PWUz"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16101C7B8E;
	Fri, 23 Aug 2024 21:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724448724; cv=pass; b=qFYJU9HAa9yMH2yHsS6AzBsXlE6tgDxKzW8d3qxj3bb0seByLkDDMtMQC/OskvKnalp64XBucZkG8LCsrQHryJ8I6NwLwugA66tbs3VQZ6AEMlaP88S4fBcpJ+yTPFDoD9IYMkpcjw5bOU1TAsv1aq9Qc5wX9N5rtIGeD2erLR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724448724; c=relaxed/simple;
	bh=4snZDFXVj0bm3HXTF+7VPc0T/7EGDNywEcZnVkIEPys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vAB9Wn+DEGP6g4gVrT27jNREuiIpMeIXLGJ94uYoGq44Jz3h3+05qZW+yGi0rG9ESJ4xROSH4WP8WtzmRADjLRPWnKRhOIrERA5egxILCmQkMDbbqg1xpZlY5cizNRh+C2t8E3BHKYXLt23uQm5CvjQNOFqVYbuIsZjn+WgVnLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b=fh74PWUz; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: angelogioacchino.delregno@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724448703; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=exs2JR3HccDW2iDl0LCawtHt6OVjA6gW8BgUJjrkTFE4MyA8cvhcLPI+dkePNpLTlUMP4fFQINDRkB3vRjo500WmD9oHK9OZ+qJ+bcZdoTwsTyXiuUmfX5zdMk+rewulWtykaK6XZRGb5FTaPw2NLSJ1KzLo134wxRYXXqBzJRI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724448703; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZQDymaog2zDscM0hJM75yCvE1RibBceXHpxihuxV2r0=; 
	b=ezA916a7vxyq+SB/BvMNUuG4SnCpdZvKS3ORkGakrsH3yuIF7oRTvktXFIfR3Delpr3A6b72BuEkMyD8+5PWN61AcmGuJZJzcSdkk6wB7UKokVFjC0ZcMcw0MrmojkN18Bi8P5epLSO8fyM3x5XifjG9kjdhrbsr8E1dFbWDX0o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724448703;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=ZQDymaog2zDscM0hJM75yCvE1RibBceXHpxihuxV2r0=;
	b=fh74PWUzo7AmNfZoZjL6uRb8HIoxdBNLCPdk7PftLETaD1BLPLmCUxX+Xf7Cft8w
	AdUEUr99vlem0M5poCtYiqlwptl6VuVpFTP8X7hs46l/A01QgER2YYsdmeILmUNnhK+
	AFwZTx24zUZh13PMWWIPSPW1TTLCTi8FIQrRVaiY=
Received: by mx.zohomail.com with SMTPS id 1724448701515640.6604689813307;
	Fri, 23 Aug 2024 14:31:41 -0700 (PDT)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 23 Aug 2024 17:31:23 -0400
Subject: [PATCH 3/4] media: platform: mtk-mdp3: Remove mask parameter from
 MM_REG_WRITE macro
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240823-mdp3-comp-cleanups-v1-3-1f8c1395ecd3@collabora.com>
References: <20240823-mdp3-comp-cleanups-v1-0-1f8c1395ecd3@collabora.com>
In-Reply-To: <20240823-mdp3-comp-cleanups-v1-0-1f8c1395ecd3@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.1
X-ZohoMailClient: External

There are two macros to issue a cmdq write: MM_REG_WRITE_MASK and
MM_REG_WRITE, but confusingly, both of them take a mask parameter. The
difference is that MM_REG_WRITE additionally checks whether the mask
passed in contains the register mask, in which case, the 0xffffffff mask
is passed to cmdq_pkt_write_mask(), effectively disregarding the mask
and calling cmdq_pkt_write() as an optimization.

Move that optimization to the MM_REG_WRITE_MASK macro and make
MM_REG_WRITE the variant that doesn't take a mask, directly calling to
cmdq_pkt_write().

Change the call sites to MM_REG_WRITE whenever a mask wasn't necessary
(ie 0xffffffff or a <register>_MASK was passed as mask) and in other
cases to MM_REG_WRITE_MASK.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 .../media/platform/mediatek/mdp3/mtk-mdp3-comp.c   | 529 +++++++++------------
 .../media/platform/mediatek/mdp3/mtk-mdp3-comp.h   |  10 +-
 2 files changed, 239 insertions(+), 300 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
index 8f62fb167156..beb29ad0b048 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
@@ -72,14 +72,14 @@ static int init_rdma(struct mdp_comp_ctx *ctx, struct mdp_cmdq_cmd *cmd)
 
 		/* Disable RSZ1 */
 		if (ctx->comp->inner_id == rdma0 && prz1)
-			MM_REG_WRITE(cmd, subsys_id, prz1->reg_base, PRZ_ENABLE,
-				     0x0, BIT(0));
+			MM_REG_WRITE_MASK(cmd, subsys_id, prz1->reg_base,
+					  PRZ_ENABLE, 0x0, BIT(0));
 	}
 
 	/* Reset RDMA */
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_RESET, BIT(0), BIT(0));
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_RDMA_RESET, BIT(0), BIT(0));
 	MM_REG_POLL(cmd, subsys_id, base, MDP_RDMA_MON_STA_1, BIT(8), BIT(8));
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_RESET, 0x0, BIT(0));
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_RDMA_RESET, 0x0, BIT(0));
 	return 0;
 }
 
@@ -98,26 +98,25 @@ static int config_rdma_frame(struct mdp_comp_ctx *ctx,
 
 	if (mdp_cfg && mdp_cfg->rdma_support_10bit) {
 		if (block10bit)
-			MM_REG_WRITE(cmd, subsys_id, base,
-				     MDP_RDMA_RESV_DUMMY_0, 0x7, 0x7);
+			MM_REG_WRITE_MASK(cmd, subsys_id, base,
+					  MDP_RDMA_RESV_DUMMY_0, 0x7, 0x7);
 		else
-			MM_REG_WRITE(cmd, subsys_id, base,
-				     MDP_RDMA_RESV_DUMMY_0, 0x0, 0x7);
+			MM_REG_WRITE_MASK(cmd, subsys_id, base,
+					  MDP_RDMA_RESV_DUMMY_0, 0x0, 0x7);
 	}
 
 	/* Setup smi control */
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_GMCIF_CON,
-		     (7 <<  4) + //burst type to 8
-		     (1 << 16),  //enable pre-ultra
-		     0x00030071);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_RDMA_GMCIF_CON,
+			  (7 <<  4) + //burst type to 8
+			  (1 << 16),  //enable pre-ultra
+			  0x00030071);
 
 	/* Setup source frame info */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rdma.src_ctrl);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, rdma.src_ctrl);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_CON, reg,
-		     0x03C8FE0F);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_RDMA_SRC_CON, reg, 0x03C8FE0F);
 
 	if (mdp_cfg)
 		if (mdp_cfg->rdma_support_10bit && en_ufo) {
@@ -126,17 +125,15 @@ static int config_rdma_frame(struct mdp_comp_ctx *ctx,
 				reg = CFG_COMP(MT8183, ctx->param, rdma.ufo_dec_y);
 			else if (CFG_CHECK(MT8195, p_id))
 				reg = CFG_COMP(MT8195, ctx->param, rdma.ufo_dec_y);
-			MM_REG_WRITE(cmd, subsys_id,
-				     base, MDP_RDMA_UFO_DEC_LENGTH_BASE_Y,
-				     reg, 0xFFFFFFFF);
+			MM_REG_WRITE(cmd, subsys_id, base,
+				     MDP_RDMA_UFO_DEC_LENGTH_BASE_Y, reg);
 
 			if (CFG_CHECK(MT8183, p_id))
 				reg = CFG_COMP(MT8183, ctx->param, rdma.ufo_dec_c);
 			else if (CFG_CHECK(MT8195, p_id))
 				reg = CFG_COMP(MT8195, ctx->param, rdma.ufo_dec_c);
-			MM_REG_WRITE(cmd, subsys_id,
-				     base, MDP_RDMA_UFO_DEC_LENGTH_BASE_C,
-				     reg, 0xFFFFFFFF);
+			MM_REG_WRITE(cmd, subsys_id, base,
+				     MDP_RDMA_UFO_DEC_LENGTH_BASE_C, reg);
 
 			/* Set 10bit source frame pitch */
 			if (block10bit) {
@@ -144,9 +141,9 @@ static int config_rdma_frame(struct mdp_comp_ctx *ctx,
 					reg = CFG_COMP(MT8183, ctx->param, rdma.mf_bkgd_in_pxl);
 				else if (CFG_CHECK(MT8195, p_id))
 					reg = CFG_COMP(MT8195, ctx->param, rdma.mf_bkgd_in_pxl);
-				MM_REG_WRITE(cmd, subsys_id,
-					     base, MDP_RDMA_MF_BKGD_SIZE_IN_PXL,
-					     reg, 0x001FFFFF);
+				MM_REG_WRITE_MASK(cmd, subsys_id, base,
+						  MDP_RDMA_MF_BKGD_SIZE_IN_PXL,
+						  reg, 0x001FFFFF);
 			}
 		}
 
@@ -157,128 +154,121 @@ static int config_rdma_frame(struct mdp_comp_ctx *ctx,
 		reg = CFG_COMP(MT8195, ctx->param, rdma.control);
 		rdma_con_mask = 0x1130;
 	}
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_CON, reg,
-		     rdma_con_mask);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_RDMA_CON, reg, rdma_con_mask);
 
 	/* Setup source buffer base */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rdma.iova[0]);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, rdma.iova[0]);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_BASE_0, reg,
-		     0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_BASE_0, reg);
 
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rdma.iova[1]);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, rdma.iova[1]);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_BASE_1, reg,
-		     0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_BASE_1, reg);
 
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rdma.iova[2]);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, rdma.iova[2]);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_BASE_2, reg,
-		     0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_BASE_2, reg);
 
 	/* Setup source buffer end */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rdma.iova_end[0]);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, rdma.iova_end[0]);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_END_0,
-		     reg, 0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_END_0, reg);
 
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rdma.iova_end[1]);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, rdma.iova_end[1]);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_END_1,
-		     reg, 0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_END_1, reg);
 
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rdma.iova_end[2]);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, rdma.iova_end[2]);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_END_2,
-		     reg, 0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_END_2, reg);
 
 	/* Setup source frame pitch */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rdma.mf_bkgd);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, rdma.mf_bkgd);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_MF_BKGD_SIZE_IN_BYTE,
-		     reg, 0x001FFFFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_RDMA_MF_BKGD_SIZE_IN_BYTE,
+			  reg, 0x001FFFFF);
 
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rdma.sf_bkgd);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, rdma.sf_bkgd);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SF_BKGD_SIZE_IN_BYTE,
-		     reg, 0x001FFFFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_RDMA_SF_BKGD_SIZE_IN_BYTE,
+			  reg, 0x001FFFFF);
 
 	/* Setup color transform */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rdma.transform);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, rdma.transform);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_TRANSFORM_0,
-		     reg, 0x0F110000);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_RDMA_TRANSFORM_0,
+			  reg, 0x0F110000);
 
 	if (!mdp_cfg || !mdp_cfg->rdma_esl_setting)
 		goto rdma_config_done;
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, rdma.dmabuf_con0);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_DMABUF_CON_0,
-		     reg, 0x0FFF00FF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_RDMA_DMABUF_CON_0,
+			  reg, 0x0FFF00FF);
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, rdma.ultra_th_high_con0);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_ULTRA_TH_HIGH_CON_0,
-		     reg, 0x3FFFFFFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_RDMA_ULTRA_TH_HIGH_CON_0,
+			  reg, 0x3FFFFFFF);
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, rdma.ultra_th_low_con0);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_ULTRA_TH_LOW_CON_0,
-		     reg, 0x3FFFFFFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_RDMA_ULTRA_TH_LOW_CON_0,
+			  reg, 0x3FFFFFFF);
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, rdma.dmabuf_con1);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_DMABUF_CON_1,
-		     reg, 0x0F7F007F);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_RDMA_DMABUF_CON_1,
+			  reg, 0x0F7F007F);
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, rdma.ultra_th_high_con1);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_ULTRA_TH_HIGH_CON_1,
-		     reg, 0x3FFFFFFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_RDMA_ULTRA_TH_HIGH_CON_1,
+			  reg, 0x3FFFFFFF);
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, rdma.ultra_th_low_con1);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_ULTRA_TH_LOW_CON_1,
-		     reg, 0x3FFFFFFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_RDMA_ULTRA_TH_LOW_CON_1,
+			  reg, 0x3FFFFFFF);
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, rdma.dmabuf_con2);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_DMABUF_CON_2,
-		     reg, 0x0F3F003F);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_RDMA_DMABUF_CON_2,
+			  reg, 0x0F3F003F);
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, rdma.ultra_th_high_con2);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_ULTRA_TH_HIGH_CON_2,
-		     reg, 0x3FFFFFFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_RDMA_ULTRA_TH_HIGH_CON_2,
+			  reg, 0x3FFFFFFF);
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, rdma.ultra_th_low_con2);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_ULTRA_TH_LOW_CON_2,
-		     reg, 0x3FFFFFFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_RDMA_ULTRA_TH_LOW_CON_2,
+			  reg, 0x3FFFFFFF);
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, rdma.dmabuf_con3);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_DMABUF_CON_3,
-		     reg, 0x0F3F003F);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_RDMA_DMABUF_CON_3,
+			  reg, 0x0F3F003F);
 
 rdma_config_done:
 	return 0;
@@ -297,15 +287,14 @@ static int config_rdma_subfrm(struct mdp_comp_ctx *ctx,
 	u32 reg = 0;
 
 	/* Enable RDMA */
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_EN, BIT(0), BIT(0));
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_RDMA_EN, BIT(0), BIT(0));
 
 	/* Set Y pixel offset */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rdma.subfrms[index].offset[0]);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, rdma.subfrms[index].offset[0]);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_OFFSET_0,
-		     reg, 0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_OFFSET_0, reg);
 
 	/* Set 10bit UFO mode */
 	if (mdp_cfg) {
@@ -315,8 +304,7 @@ static int config_rdma_subfrm(struct mdp_comp_ctx *ctx,
 			else if (CFG_CHECK(MT8195, p_id))
 				reg = CFG_COMP(MT8195, ctx->param, rdma.subfrms[index].offset_0_p);
 			MM_REG_WRITE(cmd, subsys_id, base,
-				     MDP_RDMA_SRC_OFFSET_0_P,
-				     reg, 0xFFFFFFFF);
+				     MDP_RDMA_SRC_OFFSET_0_P, reg);
 		}
 	}
 
@@ -325,40 +313,38 @@ static int config_rdma_subfrm(struct mdp_comp_ctx *ctx,
 		reg = CFG_COMP(MT8183, ctx->param, rdma.subfrms[index].offset[1]);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, rdma.subfrms[index].offset[1]);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_OFFSET_1,
-		     reg, 0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_OFFSET_1, reg);
 
 	/* Set V pixel offset */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rdma.subfrms[index].offset[2]);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, rdma.subfrms[index].offset[2]);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_OFFSET_2,
-		     reg, 0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_OFFSET_2, reg);
 
 	/* Set source size */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rdma.subfrms[index].src);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, rdma.subfrms[index].src);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_MF_SRC_SIZE, reg,
-		     0x1FFF1FFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_RDMA_MF_SRC_SIZE, reg,
+			  0x1FFF1FFF);
 
 	/* Set target size */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rdma.subfrms[index].clip);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, rdma.subfrms[index].clip);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_MF_CLIP_SIZE,
-		     reg, 0x1FFF1FFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_RDMA_MF_CLIP_SIZE,
+			  reg, 0x1FFF1FFF);
 
 	/* Set crop offset */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rdma.subfrms[index].clip_ofst);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, rdma.subfrms[index].clip_ofst);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_MF_OFFSET_1,
-		     reg, 0x003F001F);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_RDMA_MF_OFFSET_1,
+			  reg, 0x003F001F);
 
 	if (CFG_CHECK(MT8183, p_id)) {
 		csf_l = CFG_COMP(MT8183, ctx->param, subfrms[index].in.left);
@@ -369,8 +355,8 @@ static int config_rdma_subfrm(struct mdp_comp_ctx *ctx,
 	}
 	if (mdp_cfg && mdp_cfg->rdma_upsample_repeat_only)
 		if ((csf_r - csf_l + 1) > 320)
-			MM_REG_WRITE(cmd, subsys_id, base,
-				     MDP_RDMA_RESV_DUMMY_0, BIT(2), BIT(2));
+			MM_REG_WRITE_MASK(cmd, subsys_id, base,
+					  MDP_RDMA_RESV_DUMMY_0, BIT(2), BIT(2));
 
 	return 0;
 }
@@ -393,7 +379,7 @@ static int wait_rdma_event(struct mdp_comp_ctx *ctx, struct mdp_cmdq_cmd *cmd)
 	MM_REG_WAIT(cmd, ctx->comp->gce_event[MDP_GCE_EVENT_EOF]);
 
 	/* Disable RDMA */
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_EN, 0x0, BIT(0));
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_RDMA_EN, 0x0, BIT(0));
 	return 0;
 }
 
@@ -411,10 +397,10 @@ static int init_rsz(struct mdp_comp_ctx *ctx, struct mdp_cmdq_cmd *cmd)
 	u8 subsys_id = ctx->comp->subsys_id;
 
 	/* Reset RSZ */
-	MM_REG_WRITE(cmd, subsys_id, base, PRZ_ENABLE, 0x10000, BIT(16));
-	MM_REG_WRITE(cmd, subsys_id, base, PRZ_ENABLE, 0x0, BIT(16));
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, PRZ_ENABLE, 0x10000, BIT(16));
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, PRZ_ENABLE, 0x0, BIT(16));
 	/* Enable RSZ */
-	MM_REG_WRITE(cmd, subsys_id, base, PRZ_ENABLE, BIT(0), BIT(0));
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, PRZ_ENABLE, BIT(0), BIT(0));
 
 	if (CFG_CHECK(MT8195, p_id)) {
 		struct device *dev;
@@ -437,7 +423,7 @@ static int config_rsz_frame(struct mdp_comp_ctx *ctx,
 	u32 reg = 0;
 
 	if (mdp_cfg && mdp_cfg->rsz_etc_control)
-		MM_REG_WRITE(cmd, subsys_id, base, RSZ_ETC_CONTROL, 0x0, 0xFFFFFFFF);
+		MM_REG_WRITE(cmd, subsys_id, base, RSZ_ETC_CONTROL, 0x0);
 
 	if (CFG_CHECK(MT8183, p_id))
 		bypass = CFG_COMP(MT8183, ctx->param, frame.bypass);
@@ -446,7 +432,7 @@ static int config_rsz_frame(struct mdp_comp_ctx *ctx,
 
 	if (bypass) {
 		/* Disable RSZ */
-		MM_REG_WRITE(cmd, subsys_id, base, PRZ_ENABLE, 0x0, BIT(0));
+		MM_REG_WRITE_MASK(cmd, subsys_id, base, PRZ_ENABLE, 0x0, BIT(0));
 		return 0;
 	}
 
@@ -454,29 +440,27 @@ static int config_rsz_frame(struct mdp_comp_ctx *ctx,
 		reg = CFG_COMP(MT8183, ctx->param, rsz.control1);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, rsz.control1);
-	MM_REG_WRITE(cmd, subsys_id, base, PRZ_CONTROL_1, reg,
-		     0x03FFFDF3);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, PRZ_CONTROL_1, reg, 0x03FFFDF3);
 
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rsz.control2);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, rsz.control2);
-	MM_REG_WRITE(cmd, subsys_id, base, PRZ_CONTROL_2, reg,
-		     0x0FFFC290);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, PRZ_CONTROL_2, reg, 0x0FFFC290);
 
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rsz.coeff_step_x);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, rsz.coeff_step_x);
-	MM_REG_WRITE(cmd, subsys_id, base, PRZ_HORIZONTAL_COEFF_STEP,
-		     reg, 0x007FFFFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, PRZ_HORIZONTAL_COEFF_STEP, reg,
+			  0x007FFFFF);
 
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rsz.coeff_step_y);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, rsz.coeff_step_y);
-	MM_REG_WRITE(cmd, subsys_id, base, PRZ_VERTICAL_COEFF_STEP,
-		     reg, 0x007FFFFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, PRZ_VERTICAL_COEFF_STEP, reg,
+			  0x007FFFFF);
 
 	return 0;
 }
@@ -495,15 +479,13 @@ static int config_rsz_subfrm(struct mdp_comp_ctx *ctx,
 		reg = CFG_COMP(MT8183, ctx->param, rsz.subfrms[index].control2);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, rsz.subfrms[index].control2);
-	MM_REG_WRITE(cmd, subsys_id, base, PRZ_CONTROL_2, reg,
-		     0x00003800);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, PRZ_CONTROL_2, reg, 0x00003800);
 
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rsz.subfrms[index].src);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, rsz.subfrms[index].src);
-	MM_REG_WRITE(cmd, subsys_id, base, PRZ_INPUT_IMAGE, reg,
-		     0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base, PRZ_INPUT_IMAGE, reg);
 
 	if (CFG_CHECK(MT8183, p_id)) {
 		csf_l = CFG_COMP(MT8183, ctx->param, subfrms[index].in.left);
@@ -514,60 +496,56 @@ static int config_rsz_subfrm(struct mdp_comp_ctx *ctx,
 	}
 	if (mdp_cfg && mdp_cfg->rsz_disable_dcm_small_sample)
 		if ((csf_r - csf_l + 1) <= 16)
-			MM_REG_WRITE(cmd, subsys_id, base, PRZ_CONTROL_1,
-				     BIT(27), BIT(27));
+			MM_REG_WRITE_MASK(cmd, subsys_id, base, PRZ_CONTROL_1,
+					  BIT(27), BIT(27));
 
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, subfrms[index].luma.left);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, subfrms[index].luma.left);
-	MM_REG_WRITE(cmd, subsys_id, base, PRZ_LUMA_HORIZONTAL_INTEGER_OFFSET,
-		     reg, 0xFFFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, PRZ_LUMA_HORIZONTAL_INTEGER_OFFSET,
+			  reg, 0xFFFF);
 
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, subfrms[index].luma.left_subpix);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, subfrms[index].luma.left_subpix);
-	MM_REG_WRITE(cmd, subsys_id,
-		     base, PRZ_LUMA_HORIZONTAL_SUBPIXEL_OFFSET,
-		     reg, 0x1FFFFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, PRZ_LUMA_HORIZONTAL_SUBPIXEL_OFFSET,
+			  reg, 0x1FFFFF);
 
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, subfrms[index].luma.top);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, subfrms[index].luma.top);
-	MM_REG_WRITE(cmd, subsys_id, base, PRZ_LUMA_VERTICAL_INTEGER_OFFSET,
-		     reg, 0xFFFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, PRZ_LUMA_VERTICAL_INTEGER_OFFSET,
+			  reg, 0xFFFF);
 
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, subfrms[index].luma.top_subpix);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, subfrms[index].luma.top_subpix);
-	MM_REG_WRITE(cmd, subsys_id, base, PRZ_LUMA_VERTICAL_SUBPIXEL_OFFSET,
-		     reg, 0x1FFFFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, PRZ_LUMA_VERTICAL_SUBPIXEL_OFFSET,
+			  reg, 0x1FFFFF);
 
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, subfrms[index].chroma.left);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, subfrms[index].chroma.left);
-	MM_REG_WRITE(cmd, subsys_id,
-		     base, PRZ_CHROMA_HORIZONTAL_INTEGER_OFFSET,
-		     reg, 0xFFFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, PRZ_CHROMA_HORIZONTAL_INTEGER_OFFSET,
+			  reg, 0xFFFF);
 
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, subfrms[index].chroma.left_subpix);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, subfrms[index].chroma.left_subpix);
-	MM_REG_WRITE(cmd, subsys_id,
-		     base, PRZ_CHROMA_HORIZONTAL_SUBPIXEL_OFFSET,
-		     reg, 0x1FFFFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, PRZ_CHROMA_HORIZONTAL_SUBPIXEL_OFFSET,
+			  reg, 0x1FFFFF);
 
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rsz.subfrms[index].clip);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, rsz.subfrms[index].clip);
-	MM_REG_WRITE(cmd, subsys_id, base, PRZ_OUTPUT_IMAGE, reg,
-		     0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base, PRZ_OUTPUT_IMAGE, reg);
 
 	if (CFG_CHECK(MT8195, p_id)) {
 		struct device *dev;
@@ -596,19 +574,19 @@ static int config_rsz_subfrm(struct mdp_comp_ctx *ctx,
 		if (CFG_CHECK(MT8195, p_id))
 			reg = CFG_COMP(MT8195, ctx->param, rsz.subfrms[index].merge_cfg);
 		MM_REG_WRITE(cmd, merge->subsys_id, merge->reg_base,
-			     MDP_MERGE_CFG_0, reg, 0xFFFFFFFF);
+			     MDP_MERGE_CFG_0, reg);
 		MM_REG_WRITE(cmd, merge->subsys_id, merge->reg_base,
-			     MDP_MERGE_CFG_4, reg, 0xFFFFFFFF);
+			     MDP_MERGE_CFG_4, reg);
 		MM_REG_WRITE(cmd, merge->subsys_id, merge->reg_base,
-			     MDP_MERGE_CFG_24, reg, 0xFFFFFFFF);
+			     MDP_MERGE_CFG_24, reg);
 		MM_REG_WRITE(cmd, merge->subsys_id, merge->reg_base,
-			     MDP_MERGE_CFG_25, reg, 0xFFFFFFFF);
+			     MDP_MERGE_CFG_25, reg);
 
 		/* Bypass mode */
 		MM_REG_WRITE(cmd, merge->subsys_id, merge->reg_base,
-			     MDP_MERGE_CFG_12, BIT(0), 0xFFFFFFFF);
+			     MDP_MERGE_CFG_12, BIT(0));
 		MM_REG_WRITE(cmd, merge->subsys_id, merge->reg_base,
-			     MDP_MERGE_ENABLE, BIT(0), 0xFFFFFFFF);
+			     MDP_MERGE_ENABLE, BIT(0));
 	}
 
 rsz_subfrm_done:
@@ -634,8 +612,8 @@ static int advance_rsz_subfrm(struct mdp_comp_ctx *ctx,
 		}
 
 		if ((csf_r - csf_l + 1) <= 16)
-			MM_REG_WRITE(cmd, subsys_id, base, PRZ_CONTROL_1, 0x0,
-				     BIT(27));
+			MM_REG_WRITE_MASK(cmd, subsys_id, base, PRZ_CONTROL_1, 0x0,
+					  BIT(27));
 	}
 
 	return 0;
@@ -655,14 +633,14 @@ static int init_wrot(struct mdp_comp_ctx *ctx, struct mdp_cmdq_cmd *cmd)
 	u8 subsys_id = ctx->comp->subsys_id;
 
 	/* Reset WROT */
-	MM_REG_WRITE(cmd, subsys_id, base, VIDO_SOFT_RST, BIT(0), BIT(0));
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, VIDO_SOFT_RST, BIT(0), BIT(0));
 	MM_REG_POLL(cmd, subsys_id, base, VIDO_SOFT_RST_STAT, BIT(0), BIT(0));
 
 	/* Reset setting */
 	if (CFG_CHECK(MT8195, p_id))
-		MM_REG_WRITE(cmd, subsys_id, base, VIDO_CTRL, 0x0, 0xFFFFFFFF);
+		MM_REG_WRITE(cmd, subsys_id, base, VIDO_CTRL, 0x0);
 
-	MM_REG_WRITE(cmd, subsys_id, base, VIDO_SOFT_RST, 0x0, BIT(0));
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, VIDO_SOFT_RST, 0x0, BIT(0));
 	MM_REG_POLL(cmd, subsys_id, base, VIDO_SOFT_RST_STAT, 0x0, BIT(0));
 	return 0;
 }
@@ -681,39 +659,36 @@ static int config_wrot_frame(struct mdp_comp_ctx *ctx,
 		reg = CFG_COMP(MT8183, ctx->param, wrot.iova[0]);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, wrot.iova[0]);
-	MM_REG_WRITE(cmd, subsys_id, base, VIDO_BASE_ADDR, reg,
-		     0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_BASE_ADDR, reg);
 
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, wrot.iova[1]);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, wrot.iova[1]);
-	MM_REG_WRITE(cmd, subsys_id, base, VIDO_BASE_ADDR_C, reg,
-		     0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_BASE_ADDR_C, reg);
 
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, wrot.iova[2]);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, wrot.iova[2]);
-	MM_REG_WRITE(cmd, subsys_id, base, VIDO_BASE_ADDR_V, reg,
-		     0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_BASE_ADDR_V, reg);
 
 	if (mdp_cfg && mdp_cfg->wrot_support_10bit) {
 		if (CFG_CHECK(MT8195, p_id))
 			reg = CFG_COMP(MT8195, ctx->param, wrot.scan_10bit);
-		MM_REG_WRITE(cmd, subsys_id, base, VIDO_SCAN_10BIT,
-			     reg, 0x0000000F);
+		MM_REG_WRITE_MASK(cmd, subsys_id, base, VIDO_SCAN_10BIT,
+				  reg, 0x0000000F);
 
 		if (CFG_CHECK(MT8195, p_id))
 			reg = CFG_COMP(MT8195, ctx->param, wrot.pending_zero);
-		MM_REG_WRITE(cmd, subsys_id, base, VIDO_PENDING_ZERO,
-			     reg, 0x04000000);
+		MM_REG_WRITE_MASK(cmd, subsys_id, base, VIDO_PENDING_ZERO,
+				  reg, 0x04000000);
 	}
 
 	if (CFG_CHECK(MT8195, p_id)) {
 		reg = CFG_COMP(MT8195, ctx->param, wrot.bit_number);
-		MM_REG_WRITE(cmd, subsys_id, base, VIDO_CTRL_2,
-			     reg, 0x00000007);
+		MM_REG_WRITE_MASK(cmd, subsys_id, base, VIDO_CTRL_2,
+				  reg, 0x00000007);
 	}
 
 	/* Write frame related registers */
@@ -721,14 +696,13 @@ static int config_wrot_frame(struct mdp_comp_ctx *ctx,
 		reg = CFG_COMP(MT8183, ctx->param, wrot.control);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, wrot.control);
-	MM_REG_WRITE(cmd, subsys_id, base, VIDO_CTRL, reg,
-		     0xF131510F);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, VIDO_CTRL, reg, 0xF131510F);
 
 	/* Write pre-ultra threshold */
 	if (CFG_CHECK(MT8195, p_id)) {
 		reg = CFG_COMP(MT8195, ctx->param, wrot.pre_ultra);
-		MM_REG_WRITE(cmd, subsys_id, base, VIDO_DMA_PREULTRA, reg,
-			     0x00FFFFFF);
+		MM_REG_WRITE_MASK(cmd, subsys_id, base, VIDO_DMA_PREULTRA, reg,
+				  0x00FFFFFF);
 	}
 
 	/* Write frame Y pitch */
@@ -736,37 +710,34 @@ static int config_wrot_frame(struct mdp_comp_ctx *ctx,
 		reg = CFG_COMP(MT8183, ctx->param, wrot.stride[0]);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, wrot.stride[0]);
-	MM_REG_WRITE(cmd, subsys_id, base, VIDO_STRIDE, reg,
-		     0x0000FFFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, VIDO_STRIDE, reg, 0x0000FFFF);
 
 	/* Write frame UV pitch */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, wrot.stride[1]);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, wrot.stride[1]);
-	MM_REG_WRITE(cmd, subsys_id, base, VIDO_STRIDE_C, reg,
-		     0xFFFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, VIDO_STRIDE_C, reg, 0xFFFF);
 
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, wrot.stride[2]);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, wrot.stride[2]);
-	MM_REG_WRITE(cmd, subsys_id, base, VIDO_STRIDE_V, reg,
-		     0xFFFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, VIDO_STRIDE_V, reg, 0xFFFF);
 
 	/* Write matrix control */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, wrot.mat_ctrl);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, wrot.mat_ctrl);
-	MM_REG_WRITE(cmd, subsys_id, base, VIDO_MAT_CTRL, reg, 0xF3);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, VIDO_MAT_CTRL, reg, 0xF3);
 
 	/* Set the fixed ALPHA as 0xFF */
-	MM_REG_WRITE(cmd, subsys_id, base, VIDO_DITHER, 0xFF000000,
-		     0xFF000000);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, VIDO_DITHER, 0xFF000000,
+			  0xFF000000);
 
 	/* Set VIDO_EOL_SEL */
-	MM_REG_WRITE(cmd, subsys_id, base, VIDO_RSV_1, BIT(31), BIT(31));
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, VIDO_RSV_1, BIT(31), BIT(31));
 
 	/* Set VIDO_FIFO_TEST */
 	if (CFG_CHECK(MT8183, p_id))
@@ -775,8 +746,8 @@ static int config_wrot_frame(struct mdp_comp_ctx *ctx,
 		reg = CFG_COMP(MT8195, ctx->param, wrot.fifo_test);
 
 	if (reg != 0)
-		MM_REG_WRITE(cmd, subsys_id, base, VIDO_FIFO_TEST,
-			     reg, 0xFFF);
+		MM_REG_WRITE_MASK(cmd, subsys_id, base, VIDO_FIFO_TEST, reg,
+				  0xFFF);
 
 	/* Filter enable */
 	if (mdp_cfg && mdp_cfg->wrot_filter_constraint) {
@@ -784,13 +755,13 @@ static int config_wrot_frame(struct mdp_comp_ctx *ctx,
 			reg = CFG_COMP(MT8183, ctx->param, wrot.filter);
 		else if (CFG_CHECK(MT8195, p_id))
 			reg = CFG_COMP(MT8195, ctx->param, wrot.filter);
-		MM_REG_WRITE(cmd, subsys_id, base, VIDO_MAIN_BUF_SIZE,
-			     reg, 0x77);
+		MM_REG_WRITE_MASK(cmd, subsys_id, base, VIDO_MAIN_BUF_SIZE, reg,
+				  0x77);
 
 		/* Turn off WROT DMA DCM */
 		if (CFG_CHECK(MT8195, p_id))
-			MM_REG_WRITE(cmd, subsys_id, base, VIDO_ROT_EN,
-				     (0x1 << 23) + (0x1 << 20), 0x900000);
+			MM_REG_WRITE_MASK(cmd, subsys_id, base, VIDO_ROT_EN,
+					  (0x1 << 23) + (0x1 << 20), 0x900000);
 	}
 
 	return 0;
@@ -808,57 +779,52 @@ static int config_wrot_subfrm(struct mdp_comp_ctx *ctx,
 		reg = CFG_COMP(MT8183, ctx->param, wrot.subfrms[index].offset[0]);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, wrot.subfrms[index].offset[0]);
-	MM_REG_WRITE(cmd, subsys_id, base, VIDO_OFST_ADDR,
-		     reg, 0x0FFFFFFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, VIDO_OFST_ADDR, reg, 0x0FFFFFFF);
 
 	/* Write U pixel offset */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, wrot.subfrms[index].offset[1]);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, wrot.subfrms[index].offset[1]);
-	MM_REG_WRITE(cmd, subsys_id, base, VIDO_OFST_ADDR_C,
-		     reg, 0x0FFFFFFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, VIDO_OFST_ADDR_C, reg, 0x0FFFFFFF);
 
 	/* Write V pixel offset */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, wrot.subfrms[index].offset[2]);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, wrot.subfrms[index].offset[2]);
-	MM_REG_WRITE(cmd, subsys_id, base, VIDO_OFST_ADDR_V,
-		     reg, 0x0FFFFFFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, VIDO_OFST_ADDR_V, reg,
+			  0x0FFFFFFF);
 
 	/* Write source size */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, wrot.subfrms[index].src);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, wrot.subfrms[index].src);
-	MM_REG_WRITE(cmd, subsys_id, base, VIDO_IN_SIZE, reg,
-		     0x1FFF1FFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, VIDO_IN_SIZE, reg, 0x1FFF1FFF);
 
 	/* Write target size */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, wrot.subfrms[index].clip);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, wrot.subfrms[index].clip);
-	MM_REG_WRITE(cmd, subsys_id, base, VIDO_TAR_SIZE, reg,
-		     0x1FFF1FFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, VIDO_TAR_SIZE, reg, 0x1FFF1FFF);
 
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, wrot.subfrms[index].clip_ofst);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, wrot.subfrms[index].clip_ofst);
-	MM_REG_WRITE(cmd, subsys_id, base, VIDO_CROP_OFST, reg,
-		     0x1FFF1FFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, VIDO_CROP_OFST, reg, 0x1FFF1FFF);
 
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, wrot.subfrms[index].main_buf);
 	else if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, wrot.subfrms[index].main_buf);
-	MM_REG_WRITE(cmd, subsys_id, base, VIDO_MAIN_BUF_SIZE,
-		     reg, 0x1FFF7F00);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, VIDO_MAIN_BUF_SIZE, reg,
+			  0x1FFF7F00);
 
 	/* Enable WROT */
-	MM_REG_WRITE(cmd, subsys_id, base, VIDO_ROT_EN, BIT(0), BIT(0));
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, VIDO_ROT_EN, BIT(0), BIT(0));
 
 	return 0;
 }
@@ -881,11 +847,11 @@ static int wait_wrot_event(struct mdp_comp_ctx *ctx, struct mdp_cmdq_cmd *cmd)
 	MM_REG_WAIT(cmd, ctx->comp->gce_event[MDP_GCE_EVENT_EOF]);
 
 	if (mdp_cfg && mdp_cfg->wrot_filter_constraint)
-		MM_REG_WRITE(cmd, subsys_id, base, VIDO_MAIN_BUF_SIZE, 0x0,
-			     0x77);
+		MM_REG_WRITE_MASK(cmd, subsys_id, base, VIDO_MAIN_BUF_SIZE, 0x0,
+				  0x77);
 
 	/* Disable WROT */
-	MM_REG_WRITE(cmd, subsys_id, base, VIDO_ROT_EN, 0x0, BIT(0));
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, VIDO_ROT_EN, 0x0, BIT(0));
 
 	return 0;
 }
@@ -904,9 +870,9 @@ static int init_wdma(struct mdp_comp_ctx *ctx, struct mdp_cmdq_cmd *cmd)
 	u8 subsys_id = ctx->comp->subsys_id;
 
 	/* Reset WDMA */
-	MM_REG_WRITE(cmd, subsys_id, base, WDMA_RST, BIT(0), BIT(0));
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, WDMA_RST, BIT(0), BIT(0));
 	MM_REG_POLL(cmd, subsys_id, base, WDMA_FLOW_CTRL_DBG, BIT(0), BIT(0));
-	MM_REG_WRITE(cmd, subsys_id, base, WDMA_RST, 0x0, BIT(0));
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, WDMA_RST, 0x0, BIT(0));
 	return 0;
 }
 
@@ -918,40 +884,35 @@ static int config_wdma_frame(struct mdp_comp_ctx *ctx,
 	u8 subsys_id = ctx->comp->subsys_id;
 	u32 reg = 0;
 
-	MM_REG_WRITE(cmd, subsys_id, base, WDMA_BUF_CON2, 0x10101050,
-		     0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base, WDMA_BUF_CON2, 0x10101050);
 
 	/* Setup frame information */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, wdma.wdma_cfg);
-	MM_REG_WRITE(cmd, subsys_id, base, WDMA_CFG, reg,
-		     0x0F01B8F0);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, WDMA_CFG, reg, 0x0F01B8F0);
 	/* Setup frame base address */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, wdma.iova[0]);
-	MM_REG_WRITE(cmd, subsys_id, base, WDMA_DST_ADDR, reg,
-		     0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base, WDMA_DST_ADDR, reg);
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, wdma.iova[1]);
-	MM_REG_WRITE(cmd, subsys_id, base, WDMA_DST_U_ADDR, reg,
-		     0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base, WDMA_DST_U_ADDR, reg);
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, wdma.iova[2]);
-	MM_REG_WRITE(cmd, subsys_id, base, WDMA_DST_V_ADDR, reg,
-		     0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base, WDMA_DST_V_ADDR, reg);
 	/* Setup Y pitch */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, wdma.w_in_byte);
-	MM_REG_WRITE(cmd, subsys_id, base, WDMA_DST_W_IN_BYTE,
-		     reg, 0x0000FFFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, WDMA_DST_W_IN_BYTE, reg,
+			  0x0000FFFF);
 	/* Setup UV pitch */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, wdma.uv_stride);
-	MM_REG_WRITE(cmd, subsys_id, base, WDMA_DST_UV_PITCH,
-		     reg, 0x0000FFFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, WDMA_DST_UV_PITCH, reg,
+			  0x0000FFFF);
 	/* Set the fixed ALPHA as 0xFF */
-	MM_REG_WRITE(cmd, subsys_id, base, WDMA_ALPHA, 0x800000FF,
-		     0x800000FF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, WDMA_ALPHA, 0x800000FF,
+			  0x800000FF);
 
 	return 0;
 }
@@ -966,36 +927,33 @@ static int config_wdma_subfrm(struct mdp_comp_ctx *ctx,
 	/* Write Y pixel offset */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, wdma.subfrms[index].offset[0]);
-	MM_REG_WRITE(cmd, subsys_id, base, WDMA_DST_ADDR_OFFSET,
-		     reg, 0x0FFFFFFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, WDMA_DST_ADDR_OFFSET, reg,
+			  0x0FFFFFFF);
 	/* Write U pixel offset */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, wdma.subfrms[index].offset[1]);
-	MM_REG_WRITE(cmd, subsys_id, base, WDMA_DST_U_ADDR_OFFSET,
-		     reg, 0x0FFFFFFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, WDMA_DST_U_ADDR_OFFSET, reg,
+			  0x0FFFFFFF);
 	/* Write V pixel offset */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, wdma.subfrms[index].offset[2]);
-	MM_REG_WRITE(cmd, subsys_id, base, WDMA_DST_V_ADDR_OFFSET,
-		     reg, 0x0FFFFFFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, WDMA_DST_V_ADDR_OFFSET, reg,
+			  0x0FFFFFFF);
 	/* Write source size */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, wdma.subfrms[index].src);
-	MM_REG_WRITE(cmd, subsys_id, base, WDMA_SRC_SIZE, reg,
-		     0x3FFF3FFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, WDMA_SRC_SIZE, reg, 0x3FFF3FFF);
 	/* Write target size */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, wdma.subfrms[index].clip);
-	MM_REG_WRITE(cmd, subsys_id, base, WDMA_CLIP_SIZE, reg,
-		     0x3FFF3FFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, WDMA_CLIP_SIZE, reg, 0x3FFF3FFF);
 	/* Write clip offset */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, wdma.subfrms[index].clip_ofst);
-	MM_REG_WRITE(cmd, subsys_id, base, WDMA_CLIP_COORD, reg,
-		     0x3FFF3FFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, WDMA_CLIP_COORD, reg, 0x3FFF3FFF);
 
 	/* Enable WDMA */
-	MM_REG_WRITE(cmd, subsys_id, base, WDMA_EN, BIT(0), BIT(0));
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, WDMA_EN, BIT(0), BIT(0));
 
 	return 0;
 }
@@ -1007,7 +965,7 @@ static int wait_wdma_event(struct mdp_comp_ctx *ctx, struct mdp_cmdq_cmd *cmd)
 
 	MM_REG_WAIT(cmd, ctx->comp->gce_event[MDP_GCE_EVENT_EOF]);
 	/* Disable WDMA */
-	MM_REG_WRITE(cmd, subsys_id, base, WDMA_EN, 0x0, BIT(0));
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, WDMA_EN, 0x0, BIT(0));
 	return 0;
 }
 
@@ -1033,19 +991,17 @@ static int reset_luma_hist(struct mdp_comp_ctx *ctx, struct mdp_cmdq_cmd *cmd)
 
 	/* Reset histogram */
 	for (i = 0; i <= hist_num; i++)
-		MM_REG_WRITE_MASK(cmd, subsys_id, base,
-				  (MDP_LUMA_HIST_INIT + (i << 2)),
-				  0, 0xFFFFFFFF);
+		MM_REG_WRITE(cmd, subsys_id, base,
+			     (MDP_LUMA_HIST_INIT + (i << 2)), 0);
 
 	if (mdp_cfg->tdshp_constrain)
 		MM_REG_WRITE(cmd, subsys_id, base,
-			     MDP_DC_TWO_D_W1_RESULT_INIT, 0, 0xFFFFFFFF);
+			     MDP_DC_TWO_D_W1_RESULT_INIT, 0);
 
 	if (mdp_cfg->tdshp_contour)
 		for (i = 0; i < hist_num; i++)
-			MM_REG_WRITE_MASK(cmd, subsys_id, base,
-					  (MDP_CONTOUR_HIST_INIT + (i << 2)),
-					  0, 0xFFFFFFFF);
+			MM_REG_WRITE(cmd, subsys_id, base,
+				     (MDP_CONTOUR_HIST_INIT + (i << 2)), 0);
 
 	return 0;
 }
@@ -1055,9 +1011,9 @@ static int init_tdshp(struct mdp_comp_ctx *ctx, struct mdp_cmdq_cmd *cmd)
 	phys_addr_t base = ctx->comp->reg_base;
 	u16 subsys_id = ctx->comp->subsys_id;
 
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_TDSHP_CTRL, BIT(0), BIT(0));
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_TDSHP_CTRL, BIT(0), BIT(0));
 	/* Enable FIFO */
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_TDSHP_CFG, BIT(1), BIT(1));
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_TDSHP_CFG, BIT(1), BIT(1));
 
 	return reset_luma_hist(ctx, cmd);
 }
@@ -1072,7 +1028,7 @@ static int config_tdshp_frame(struct mdp_comp_ctx *ctx,
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, tdshp.cfg);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_TDSHP_CFG, reg, BIT(0));
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_TDSHP_CFG, reg, BIT(0));
 
 	return 0;
 }
@@ -1086,26 +1042,24 @@ static int config_tdshp_subfrm(struct mdp_comp_ctx *ctx,
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, tdshp.subfrms[index].src);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_TDSHP_INPUT_SIZE,
-		     reg, MDP_TDSHP_INPUT_SIZE_MASK);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_TDSHP_INPUT_SIZE, reg);
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, tdshp.subfrms[index].clip_ofst);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_TDSHP_OUTPUT_OFFSET,
-		     reg, 0x00FF00FF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_TDSHP_OUTPUT_OFFSET, reg,
+			  0x00FF00FF);
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, tdshp.subfrms[index].clip);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_TDSHP_OUTPUT_SIZE,
-		     reg, MDP_TDSHP_OUTPUT_SIZE_MASK);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_TDSHP_OUTPUT_SIZE, reg);
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, tdshp.subfrms[index].hist_cfg_0);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_HIST_CFG_00, reg, 0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_HIST_CFG_00, reg);
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, tdshp.subfrms[index].hist_cfg_1);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_HIST_CFG_01, reg, 0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_HIST_CFG_01, reg);
 
 	return 0;
 }
@@ -1122,21 +1076,19 @@ static int init_color(struct mdp_comp_ctx *ctx, struct mdp_cmdq_cmd *cmd)
 	phys_addr_t base = ctx->comp->reg_base;
 	u16 subsys_id = ctx->comp->subsys_id;
 
-	MM_REG_WRITE(cmd, subsys_id, base,
-		     MDP_COLOR_START, 0x1, BIT(1) | BIT(0));
-	MM_REG_WRITE(cmd, subsys_id, base,
-		     MDP_COLOR_WIN_X_MAIN, 0xFFFF0000, 0xFFFFFFFF);
-	MM_REG_WRITE(cmd, subsys_id, base,
-		     MDP_COLOR_WIN_Y_MAIN, 0xFFFF0000, 0xFFFFFFFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_COLOR_START, 0x1,
+			  BIT(1) | BIT(0));
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_COLOR_WIN_X_MAIN, 0xFFFF0000);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_COLOR_WIN_Y_MAIN, 0xFFFF0000);
 
 	/* Reset color matrix */
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_COLOR_CM1_EN, 0x0, BIT(0));
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_COLOR_CM2_EN, 0x0, BIT(0));
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_COLOR_CM1_EN, 0x0, BIT(0));
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_COLOR_CM2_EN, 0x0, BIT(0));
 
 	/* Enable interrupt */
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_COLOR_INTEN, 0x7, 0x7);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_COLOR_INTEN, 0x7, 0x7);
 
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_COLOR_OUT_SEL, 0x333, 0x333);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_COLOR_OUT_SEL, 0x333, 0x333);
 
 	return 0;
 }
@@ -1151,8 +1103,7 @@ static int config_color_frame(struct mdp_comp_ctx *ctx,
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, color.start);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_COLOR_START,
-		     reg, MDP_COLOR_START_MASK);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_COLOR_START, reg);
 
 	return 0;
 }
@@ -1166,13 +1117,13 @@ static int config_color_subfrm(struct mdp_comp_ctx *ctx,
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, color.subfrms[index].in_hsize);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_COLOR_INTERNAL_IP_WIDTH,
-		     reg, 0x00003FFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_COLOR_INTERNAL_IP_WIDTH,
+			  reg, 0x00003FFF);
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, color.subfrms[index].in_vsize);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_COLOR_INTERNAL_IP_HEIGHT,
-		     reg, 0x00003FFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_COLOR_INTERNAL_IP_HEIGHT,
+			  reg, 0x00003FFF);
 
 	return 0;
 }
@@ -1190,9 +1141,9 @@ static int init_ccorr(struct mdp_comp_ctx *ctx, struct mdp_cmdq_cmd *cmd)
 	u8 subsys_id = ctx->comp->subsys_id;
 
 	/* CCORR enable */
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_CCORR_EN, BIT(0), BIT(0));
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_CCORR_EN, BIT(0), BIT(0));
 	/* Relay mode */
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_CCORR_CFG, BIT(0), BIT(0));
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_CCORR_CFG, BIT(0), BIT(0));
 	return 0;
 }
 
@@ -1214,8 +1165,8 @@ static int config_ccorr_subfrm(struct mdp_comp_ctx *ctx,
 
 	hsize = csf_r - csf_l + 1;
 	vsize = csf_b - csf_t + 1;
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_CCORR_SIZE,
-		     (hsize << 16) + (vsize <<  0), 0x1FFF1FFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_CCORR_SIZE,
+			  (hsize << 16) + (vsize <<  0), 0x1FFF1FFF);
 	return 0;
 }
 
@@ -1231,7 +1182,7 @@ static int init_aal(struct mdp_comp_ctx *ctx, struct mdp_cmdq_cmd *cmd)
 	u16 subsys_id = ctx->comp->subsys_id;
 
 	/* Always set MDP_AAL enable to 1 */
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_AAL_EN, BIT(0), BIT(0));
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_AAL_EN, BIT(0), BIT(0));
 
 	return 0;
 }
@@ -1246,11 +1197,11 @@ static int config_aal_frame(struct mdp_comp_ctx *ctx,
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, aal.cfg_main);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_AAL_CFG_MAIN, reg, BIT(7));
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_AAL_CFG_MAIN, reg, BIT(7));
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, aal.cfg);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_AAL_CFG, reg, BIT(0));
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_AAL_CFG, reg, BIT(0));
 
 	return 0;
 }
@@ -1264,18 +1215,16 @@ static int config_aal_subfrm(struct mdp_comp_ctx *ctx,
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, aal.subfrms[index].src);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_AAL_SIZE,
-		     reg, MDP_AAL_SIZE_MASK);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_AAL_SIZE, reg);
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, aal.subfrms[index].clip_ofst);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_AAL_OUTPUT_OFFSET,
-		     reg, 0x00FF00FF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_AAL_OUTPUT_OFFSET, reg,
+			  0x00FF00FF);
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, aal.subfrms[index].clip);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_AAL_OUTPUT_SIZE,
-		     reg, MDP_AAL_OUTPUT_SIZE_MASK);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_AAL_OUTPUT_SIZE, reg);
 
 	return 0;
 }
@@ -1293,7 +1242,7 @@ static int init_hdr(struct mdp_comp_ctx *ctx, struct mdp_cmdq_cmd *cmd)
 	u16 subsys_id = ctx->comp->subsys_id;
 
 	/* Always set MDP_HDR enable to 1 */
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_TOP, BIT(0), BIT(0));
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_HDR_TOP, BIT(0), BIT(0));
 
 	return 0;
 }
@@ -1308,11 +1257,11 @@ static int config_hdr_frame(struct mdp_comp_ctx *ctx,
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, hdr.top);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_TOP, reg, BIT(29) | BIT(28));
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_HDR_TOP, reg, BIT(29) | BIT(28));
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, hdr.relay);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_RELAY, reg, BIT(0));
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_HDR_RELAY, reg, BIT(0));
 
 	return 0;
 }
@@ -1326,37 +1275,36 @@ static int config_hdr_subfrm(struct mdp_comp_ctx *ctx,
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, hdr.subfrms[index].win_size);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_TILE_POS,
-		     reg, MDP_HDR_TILE_POS_MASK);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_TILE_POS, reg);
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, hdr.subfrms[index].src);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_SIZE_0, reg, 0x1FFF1FFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_HDR_SIZE_0, reg, 0x1FFF1FFF);
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, hdr.subfrms[index].clip_ofst0);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_SIZE_1, reg, 0x1FFF1FFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_HDR_SIZE_1, reg, 0x1FFF1FFF);
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, hdr.subfrms[index].clip_ofst1);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_SIZE_2, reg, 0x1FFF1FFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_HDR_SIZE_2, reg, 0x1FFF1FFF);
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, hdr.subfrms[index].hist_ctrl_0);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_HIST_CTRL_0, reg, 0x00003FFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_HDR_HIST_CTRL_0, reg, 0x00003FFF);
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, hdr.subfrms[index].hist_ctrl_1);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_HIST_CTRL_1, reg, 0x00003FFF);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_HDR_HIST_CTRL_1, reg, 0x00003FFF);
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, hdr.subfrms[index].hdr_top);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_TOP, reg, BIT(6) | BIT(5));
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_HDR_TOP, reg, BIT(6) | BIT(5));
 
 	/* Enable histogram */
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, hdr.subfrms[index].hist_addr);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_HIST_ADDR, reg, BIT(9));
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_HDR_HIST_ADDR, reg, BIT(9));
 
 	return 0;
 }
@@ -1373,8 +1321,8 @@ static int init_fg(struct mdp_comp_ctx *ctx, struct mdp_cmdq_cmd *cmd)
 	phys_addr_t base = ctx->comp->reg_base;
 	u16 subsys_id = ctx->comp->subsys_id;
 
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_FG_TRIGGER, BIT(2), BIT(2));
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_FG_TRIGGER, 0x0, BIT(2));
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_FG_TRIGGER, BIT(2), BIT(2));
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_FG_TRIGGER, 0x0, BIT(2));
 
 	return 0;
 }
@@ -1389,11 +1337,11 @@ static int config_fg_frame(struct mdp_comp_ctx *ctx,
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, fg.ctrl_0);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_FG_FG_CTRL_0, reg, BIT(0));
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_FG_FG_CTRL_0, reg, BIT(0));
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, fg.ck_en);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_FG_FG_CK_EN, reg, 0x7);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_FG_FG_CK_EN, reg, 0x7);
 
 	return 0;
 }
@@ -1407,11 +1355,11 @@ static int config_fg_subfrm(struct mdp_comp_ctx *ctx,
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, fg.subfrms[index].info_0);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_FG_TILE_INFO_0, reg, 0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_FG_TILE_INFO_0, reg);
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, fg.subfrms[index].info_1);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_FG_TILE_INFO_1, reg, 0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_FG_TILE_INFO_1, reg);
 
 	return 0;
 }
@@ -1428,14 +1376,11 @@ static int init_ovl(struct mdp_comp_ctx *ctx, struct mdp_cmdq_cmd *cmd)
 	phys_addr_t base = ctx->comp->reg_base;
 	u16 subsys_id = ctx->comp->subsys_id;
 
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_OVL_EN,
-		     BIT(0), MDP_OVL_EN_MASK);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_OVL_EN, BIT(0));
 
 	/* Set to relay mode */
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_OVL_SRC_CON,
-		     BIT(9), MDP_OVL_SRC_CON_MASK);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_OVL_DP_CON,
-		     BIT(0), MDP_OVL_DP_CON_MASK);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_OVL_SRC_CON, BIT(9));
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_OVL_DP_CON, BIT(0));
 
 	return 0;
 }
@@ -1450,11 +1395,11 @@ static int config_ovl_frame(struct mdp_comp_ctx *ctx,
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, ovl.L0_con);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_OVL_L0_CON, reg, BIT(29) | BIT(28));
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_OVL_L0_CON, reg, BIT(29) | BIT(28));
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, ovl.src_con);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_OVL_SRC_CON, reg, BIT(0));
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_OVL_SRC_CON, reg, BIT(0));
 
 	return 0;
 }
@@ -1468,14 +1413,12 @@ static int config_ovl_subfrm(struct mdp_comp_ctx *ctx,
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, ovl.subfrms[index].L0_src_size);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_OVL_L0_SRC_SIZE,
-		     reg, MDP_OVL_L0_SRC_SIZE_MASK);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_OVL_L0_SRC_SIZE, reg);
 
 	/* Setup output size */
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, ovl.subfrms[index].roi_size);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_OVL_ROI_SIZE,
-		     reg, MDP_OVL_ROI_SIZE_MASK);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_OVL_ROI_SIZE, reg);
 
 	return 0;
 }
@@ -1492,13 +1435,10 @@ static int init_pad(struct mdp_comp_ctx *ctx, struct mdp_cmdq_cmd *cmd)
 	phys_addr_t base = ctx->comp->reg_base;
 	u16 subsys_id = ctx->comp->subsys_id;
 
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_PAD_CON,
-		     BIT(1), MDP_PAD_CON_MASK);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_PAD_CON, BIT(1));
 	/* Reset */
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_PAD_W_SIZE,
-		     0, MDP_PAD_W_SIZE_MASK);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_PAD_H_SIZE,
-		     0, MDP_PAD_H_SIZE_MASK);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_PAD_W_SIZE, 0);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_PAD_H_SIZE, 0);
 
 	return 0;
 }
@@ -1512,8 +1452,7 @@ static int config_pad_subfrm(struct mdp_comp_ctx *ctx,
 
 	if (CFG_CHECK(MT8195, p_id))
 		reg = CFG_COMP(MT8195, ctx->param, pad.subfrms[index].pic_size);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_PAD_PIC_SIZE,
-		     reg, MDP_PAD_PIC_SIZE_MASK);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_PAD_PIC_SIZE, reg);
 
 	return 0;
 }
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
index 5bcd7f8c6edf..902006d7c4ba 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
@@ -10,17 +10,17 @@
 #include "mtk-mdp3-cmdq.h"
 
 #define MM_REG_WRITE_MASK(cmd, id, base, ofst, val, mask)	\
-	cmdq_pkt_write_mask(&((cmd)->pkt), id,			\
-		(base) + (ofst), (val), (mask))
-
-#define MM_REG_WRITE(cmd, id, base, ofst, val, mask)		\
 do {								\
 	typeof(mask) (m) = (mask);				\
-	MM_REG_WRITE_MASK(cmd, id, base, ofst, val,		\
+	cmdq_pkt_write_mask(&((cmd)->pkt), id, (base) + (ofst),	\
+			    (val),				\
 		(((m) & (ofst##_MASK)) == (ofst##_MASK)) ?	\
 			(0xffffffff) : (m));			\
 } while (0)
 
+#define MM_REG_WRITE(cmd, id, base, ofst, val)			\
+	cmdq_pkt_write(&((cmd)->pkt), id, (base) + (ofst), (val))
+
 #define MM_REG_WAIT(cmd, evt)					\
 do {								\
 	typeof(cmd) (c) = (cmd);				\

-- 
2.46.0


