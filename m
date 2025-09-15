Return-Path: <linux-media+bounces-42539-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A5FB574CA
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 11:24:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5737A1A24E95
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 09:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB582F363B;
	Mon, 15 Sep 2025 09:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="u6mHfz4C"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59BE2F9C47;
	Mon, 15 Sep 2025 09:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757928029; cv=none; b=a6QwUe8SpaRtzUOXJtGfnEqfl99dOyOn0qc+CzKpp+Yy+D2S2F6Tkd4Me9V7AHWkoq2X3a6tHBhmic6tB2IRmUaY9E5Fm6w1UVqGZQgiSY+b2pnPYW0hBUFNFAlAEG8gfino33ADVb22sT5ArZcdMQPs0X2KBRB0NrWACKB51pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757928029; c=relaxed/simple;
	bh=BBV11Ho0tc+Utu8uS2EfLylS/m9H64nWp9VfpPNknAk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lmz6UUZaWQ0+UUlbabk3S9euAGYxd94/aooLUTgc/Fu/giSy8P9yQNjKjVUYEGlSgQvJ1s7XZuQcOT7vs3l8aqsbXcwFp4CIrkuBiv40/nTp/xcy5wZCktiOAlM/mS7BXfj9T0H109VJSmOzrcb3OlImS4xGe3LbxYB6H+VRJMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=u6mHfz4C; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 3384eeec921511f0b33aeb1e7f16c2b6-20250915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=LaNNoYa5Du7iCqkc2oPxcr71/D7vogeLUkEIi2fqLmY=;
	b=u6mHfz4Cf7JJtwYtnM5JBa21swJExdqPeFVwOrmnNt3C9bu5IgZLki5zJuEZbcuWHbdlwARlUSR6V/K/rKSe0EN4fcAFvxgnsSYsI2EUjQEuZ/yRx5c0vdpQrrCgg7Qk2+VLigEedtZNXYdK+x7s3635X3PRFpSQzzyDgNJSug4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:0465c470-592b-4ce0-9052-50cef22c08c9,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:1ca6b93,CLOUDID:9ce1cc84-5317-4626-9d82-238d715c253f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3384eeec921511f0b33aeb1e7f16c2b6-20250915
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1321633581; Mon, 15 Sep 2025 17:20:20 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 15 Sep 2025 17:20:18 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 15 Sep 2025 17:20:17 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>, Sebastian Fricke
	<sebastian.fricke@collabora.com>, Nathan Hebert <nhebert@chromium.org>, Arnd
 Bergmann <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, George Sun
	<george.sun@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	<andrzejtp2010@gmail.com>
Subject: [PATCH v3 8/8] media: mediatek: encoder: Add MT8189 encoder compatible data
Date: Mon, 15 Sep 2025 17:19:58 +0800
Message-ID: <20250915091958.31509-9-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250915091958.31509-1-kyrie.wu@mediatek.com>
References: <20250915091958.31509-1-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

add compatible data to support MT8189 encoding.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c   | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
index c869c4245ebc..4f5c2d8d2855 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
@@ -468,6 +468,19 @@ static const struct mtk_vcodec_enc_pdata mt8196_pdata = {
 	.set_dma_bit_mask = true,
 };
 
+static const struct mtk_vcodec_enc_pdata mt8189_pdata = {
+	.venc_model_num = 8189,
+	.capture_formats = mtk_video_formats_capture_h264,
+	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
+	.output_formats = mtk_video_formats_output,
+	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output),
+	.min_bitrate = 64,
+	.max_bitrate = 100000000,
+	.core_id = VENC_SYS,
+	.uses_common_fw_iface = true,
+	.set_dma_bit_mask = true,
+};
+
 static const struct of_device_id mtk_vcodec_enc_match[] = {
 	{.compatible = "mediatek,mt8173-vcodec-enc",
 			.data = &mt8173_avc_pdata},
@@ -478,6 +491,7 @@ static const struct of_device_id mtk_vcodec_enc_match[] = {
 	{.compatible = "mediatek,mt8192-vcodec-enc", .data = &mt8192_pdata},
 	{.compatible = "mediatek,mt8195-vcodec-enc", .data = &mt8195_pdata},
 	{.compatible = "mediatek,mt8196-vcodec-enc", .data = &mt8196_pdata},
+	{.compatible = "mediatek,mt8189-vcodec-enc", .data = &mt8189_pdata},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_vcodec_enc_match);
-- 
2.45.2


