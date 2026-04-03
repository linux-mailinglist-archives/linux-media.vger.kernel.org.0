Return-Path: <linux-media+bounces-58012-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JejCLljz2lZvwYAu9opvQ
	(envelope-from <linux-media+bounces-58012-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 08:52:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B33A2391855
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 08:52:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E6C503092867
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2026 06:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFA3337C90D;
	Fri,  3 Apr 2026 06:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FHMJCZ1j"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DD3372B31;
	Fri,  3 Apr 2026 06:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775198999; cv=none; b=jSuuz9rq3PgxXbAOaZ2Q1MO48sf6AQLNMan+dDLR80qs+NNYoeZNeysJ/JdVo9oXXKh+AfBxO9eFc2x5ik7irUQZbmUJFfSuEr9y6nsFpQdXAwsdabF6tJafTS7drFerRykoj0k7aY3SkMa6KPng+JsDmKXrlwWBgqiqFEqPGu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775198999; c=relaxed/simple;
	bh=RB83I2nH48G2R5UVVKvA0Wx1mlrNr4P968tNH9JcDDA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NKBKCW+RQ88MozHfuBaXz8faMGo3tS6GCet/B17Np/cdILZ+wFRzGL7vvuWwaVYcFUG+IYSuOjZQcmZrwZebWA2VPolIte1IStTjqunEk6bGcvRK+7DlJlVrTHTBX0GIKHsw2Zduv8fX8dztfjHopbgZY9NuN7vBaqaDVo9Oap8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=FHMJCZ1j; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 4cfb559e2f2911f1ae70033691e9ac7d-20260403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Lvbv8ytIdTwjGat5iq09ZVK5234WoS7drLcT9eltSXI=;
	b=FHMJCZ1jXdJb6yChLAATfRRXklLdpgux44U4GxPLLzm6j+4dLX3pyyMqZlBL95SEFczUXkrDRHFbNnt/MrxVRoge1QoB941ZDO6Oek0u+HO/pyngArJXTa5WoX6vA4nCbcHVP2wN7vUHqeLcKDJxfai3sMcGI9q+kGtK9m9l7Qk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:5e50e509-4224-4597-9c3c-c25c95ee9d63,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:40e8048f-6df4-4a3d-a7a4-fbdc42d669ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4cfb559e2f2911f1ae70033691e9ac7d-20260403
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1440060470; Fri, 03 Apr 2026 14:49:45 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 3 Apr 2026 14:49:44 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 3 Apr 2026 14:49:43 +0800
From: Jianhua Lin <jianhua.lin@mediatek.com>
To: <nicolas@ndufresne.ca>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, Jianhua Lin <jianhua.lin@mediatek.com>
Subject: [PATCH v6 3/3] media: mediatek: jpeg: add compatible for MT8189 SoC
Date: Fri, 3 Apr 2026 14:49:12 +0800
Message-ID: <20260403064912.17259-4-jianhua.lin@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260403064912.17259-1-jianhua.lin@mediatek.com>
References: <20260403064912.17259-1-jianhua.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-58012-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[ndufresne.ca,kernel.org,gmail.com,collabora.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianhua.lin@mediatek.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[mediatek.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: B33A2391855
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Compared to the previous generation ICs, the MT8189 uses a 34-bit IOVA
address space (16GB) and requires a single clock configuration.

Therefore, add new compatible strings ("mediatek,mt8189-jpgenc" and
"mediatek,mt8189-jpgdec") along with their specific driver data to
support the JPEG encoder and decoder of the MT8189 SoC.

Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
---
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 8c684756d5fc..786cc2942c3a 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1867,6 +1867,10 @@ static struct clk_bulk_data mt8173_jpeg_dec_clocks[] = {
 	{ .id = "jpgdec" },
 };
 
+static struct clk_bulk_data mtk_jpeg_dec_clocks[] = {
+	{ .id = "jpgdec" },
+};
+
 static const struct mtk_jpeg_variant mt8173_jpeg_drvdata = {
 	.clks = mt8173_jpeg_dec_clocks,
 	.num_clks = ARRAY_SIZE(mt8173_jpeg_dec_clocks),
@@ -1898,6 +1902,38 @@ static const struct mtk_jpeg_variant mtk_jpeg_drvdata = {
 	.multi_core = false,
 };
 
+static const struct mtk_jpeg_variant mtk8189_jpegenc_drvdata = {
+	.clks = mtk_jpeg_clocks,
+	.num_clks = ARRAY_SIZE(mtk_jpeg_clocks),
+	.formats = mtk_jpeg_enc_formats,
+	.num_formats = MTK_JPEG_ENC_NUM_FORMATS,
+	.qops = &mtk_jpeg_enc_qops,
+	.irq_handler = mtk_jpeg_enc_irq,
+	.hw_reset = mtk_jpeg_enc_reset,
+	.m2m_ops = &mtk_jpeg_enc_m2m_ops,
+	.dev_name = "mtk-jpeg-enc",
+	.ioctl_ops = &mtk_jpeg_enc_ioctl_ops,
+	.out_q_default_fourcc = V4L2_PIX_FMT_YUYV,
+	.cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
+	.support_34bit = true,
+};
+
+static const struct mtk_jpeg_variant mtk8189_jpegdec_drvdata = {
+	.clks = mtk_jpeg_dec_clocks,
+	.num_clks = ARRAY_SIZE(mtk_jpeg_dec_clocks),
+	.formats = mtk_jpeg_dec_formats,
+	.num_formats = MTK_JPEG_DEC_NUM_FORMATS,
+	.qops = &mtk_jpeg_dec_qops,
+	.irq_handler = mtk_jpeg_dec_irq,
+	.hw_reset = mtk_jpeg_dec_reset,
+	.m2m_ops = &mtk_jpeg_dec_m2m_ops,
+	.dev_name = "mtk-jpeg-dec",
+	.ioctl_ops = &mtk_jpeg_dec_ioctl_ops,
+	.out_q_default_fourcc = V4L2_PIX_FMT_JPEG,
+	.cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
+	.support_34bit = true,
+};
+
 static struct mtk_jpeg_variant mtk8195_jpegenc_drvdata = {
 	.formats = mtk_jpeg_enc_formats,
 	.num_formats = MTK_JPEG_ENC_NUM_FORMATS,
@@ -1937,6 +1973,14 @@ static const struct of_device_id mtk_jpeg_match[] = {
 		.compatible = "mediatek,mtk-jpgenc",
 		.data = &mtk_jpeg_drvdata,
 	},
+	{
+		.compatible = "mediatek,mt8189-jpgenc",
+		.data = &mtk8189_jpegenc_drvdata,
+	},
+	{
+		.compatible = "mediatek,mt8189-jpgdec",
+		.data = &mtk8189_jpegdec_drvdata,
+	},
 	{
 		.compatible = "mediatek,mt8195-jpgenc",
 		.data = &mtk8195_jpegenc_drvdata,
-- 
2.45.2


