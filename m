Return-Path: <linux-media+bounces-56273-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCsoHvNdu2knjQIAu9opvQ
	(envelope-from <linux-media+bounces-56273-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 03:22:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECD22C4E02
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 03:22:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2CC8A3025EE7
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 02:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB737389471;
	Thu, 19 Mar 2026 02:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="B2Gt4fY8"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CA6387341;
	Thu, 19 Mar 2026 02:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773886929; cv=none; b=A/ryg/4kPMO3Dyzu4M4KKQSSq284JFOu6sUZe7vHHDE7aNMLXY71v3eNwP1jmfZC76zhHUqOvl4U2mqbHU5m93cIylVvtE0a0b3785J7+SWuxMpjMok852s7vbPHQfTJlpQrf6bLxwqixf4sR+oCUaNYKaUhbjP0WlxP0JjVXFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773886929; c=relaxed/simple;
	bh=zZ6aXTHPnRDiG7kUWkKzvviVOYweqsLiLDTZfJvIwV4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T1tHLFRJ8cny3K6ddfLz7B5uYvlmWWBmq3WSpmt1jRJoVmA672NPYXFwns0UTI/tGbqp7JmZiMPw4nzCD/hRrqcq7X3iCWDBRwWd6fY3oKeBmaPNDrS/uf7TCWHSemaQ8mkShRLf143mc6s99KaxdhiHfYv+RJY2lzh9nUS8pxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=B2Gt4fY8; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 6be1b638233a11f1a02d4725871ece0b-20260319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From; bh=kLmrfGSNnQK3ny4OWc+T9d81jZH/ljPYXHqB8bJR7Ho=;
	b=B2Gt4fY8auInR/Xqs8uEiv1vLv46sHGFhwuBQchl/Ec2VORhaiC+hpUQ2YN5AlmB0HOTdxCVPxUXnd4KAb+NY33zJxwQHJijGlVThVLGRG3eMN6FWrDKyZ57ZqTJo3U4RnbaOyWPNCX5tuMLnFIHWaej50rUU8Q6sQtfX4dCFt8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:7fd5ff7c-a359-4528-8582-4c6ebcb39c54,IP:0,U
	RL:0,TC:0,Content:0,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-20
X-CID-META: VersionHash:e7bac3a,CLOUDID:76f5e2d4-060f-4ecc-9ee0-121eeeb4a682,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:1,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:
	0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6be1b638233a11f1a02d4725871ece0b-20260319
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1672720124; Thu, 19 Mar 2026 10:22:05 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 19 Mar 2026 10:22:03 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 19 Mar 2026 10:22:03 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v13 11/12] media: mediatek: jpeg: add jpeg compatible
Date: Thu, 19 Mar 2026 10:21:50 +0800
Message-ID: <20260319022152.31313-12-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260319022152.31313-1-kyrie.wu@mediatek.com>
References: <20260319022152.31313-1-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-56273-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[xs4all.nl,kernel.org,collabora.com,gmail.com,mediatek.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kyrie.wu@mediatek.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[mediatek.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.971];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 7ECD22C4E02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add jpeg dec and enc compatible for mt8196

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 34 +++++++++++++++++++
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  |  3 ++
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  |  3 ++
 3 files changed, 40 insertions(+)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index e67df5eb711b..287f6bd53ce6 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1916,6 +1916,19 @@ static struct mtk_jpeg_variant mtk8195_jpegenc_drvdata = {
 	.jpeg_worker = mtk_jpegenc_worker,
 };
 
+static struct mtk_jpeg_variant mtk8196_jpegenc_drvdata = {
+	.formats = mtk_jpeg_enc_formats,
+	.num_formats = MTK_JPEG_ENC_NUM_FORMATS,
+	.qops = &mtk_jpeg_enc_qops,
+	.m2m_ops = &mtk_jpeg_multicore_enc_m2m_ops,
+	.dev_name = "mtk-jpeg-enc",
+	.ioctl_ops = &mtk_jpeg_enc_ioctl_ops,
+	.out_q_default_fourcc = V4L2_PIX_FMT_YUYV,
+	.cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
+	.multi_core = true,
+	.jpeg_worker = mtk_jpegenc_worker,
+};
+
 static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata = {
 	.formats = mtk_jpeg_dec_formats,
 	.num_formats = MTK_JPEG_DEC_NUM_FORMATS,
@@ -1929,6 +1942,19 @@ static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata = {
 	.jpeg_worker = mtk_jpegdec_worker,
 };
 
+static const struct mtk_jpeg_variant mtk8196_jpegdec_drvdata = {
+	.formats = mtk_jpeg_dec_formats,
+	.num_formats = MTK_JPEG_DEC_NUM_FORMATS,
+	.qops = &mtk_jpeg_dec_qops,
+	.m2m_ops = &mtk_jpeg_multicore_dec_m2m_ops,
+	.dev_name = "mtk-jpeg-dec",
+	.ioctl_ops = &mtk_jpeg_dec_ioctl_ops,
+	.out_q_default_fourcc = V4L2_PIX_FMT_JPEG,
+	.cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
+	.multi_core = true,
+	.jpeg_worker = mtk_jpegdec_worker,
+};
+
 static const struct of_device_id mtk_jpeg_match[] = {
 	{
 		.compatible = "mediatek,mt8173-jpgdec",
@@ -1950,6 +1976,14 @@ static const struct of_device_id mtk_jpeg_match[] = {
 		.compatible = "mediatek,mt8195-jpgdec",
 		.data = &mtk8195_jpegdec_drvdata,
 	},
+	{
+		.compatible = "mediatek,mt8196-jpgenc",
+		.data = &mtk8196_jpegenc_drvdata,
+	},
+	{
+		.compatible = "mediatek,mt8196-jpgdec",
+		.data = &mtk8196_jpegdec_drvdata,
+	},
 	{},
 };
 
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
index e4d2c5d4ec73..5a485e905787 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
@@ -45,6 +45,9 @@ static const struct of_device_id mtk_jpegdec_hw_ids[] = {
 	{
 		.compatible = "mediatek,mt8195-jpgdec-hw",
 	},
+	{
+		.compatible = "mediatek,mt8196-jpgdec-hw",
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_jpegdec_hw_ids);
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
index 2adea3aca50b..1cfdfac98829 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
@@ -52,6 +52,9 @@ static const struct of_device_id mtk_jpegenc_drv_ids[] = {
 	{
 		.compatible = "mediatek,mt8195-jpgenc-hw",
 	},
+	{
+		.compatible = "mediatek,mt8196-jpgenc-hw",
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_jpegenc_drv_ids);
-- 
2.45.2


