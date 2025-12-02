Return-Path: <linux-media+bounces-48026-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2FDC9A834
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 08:42:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A3B82347109
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 07:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C243054EB;
	Tue,  2 Dec 2025 07:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hovUyWKA"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADF730217C;
	Tue,  2 Dec 2025 07:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764661259; cv=none; b=eKm/+g4K2GK2rUw8mv5UP2TbF92MBx6bIKnThIVvI3CPF9X0VPWrQ1oJ5+cGUt1gVlVH/7+yD4KjbjVPBUCgkmOmEVD2fxyV+QgjBDbH1xRatTLSh2m94+tcZ06/Ix1KE+rEfhmrSKNVeOAsnfWXM0UukbfPAXjB1t7fOoV+7Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764661259; c=relaxed/simple;
	bh=wPzAP751srpGk80wnYFsqd1BQdSY+PtdMB8D071mTsk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QXDnT66yKUiMJ2Tq6lGP4KxQqLGPwj2/e6g80qm/XSIdRODGdhtPpbLUXhN5Ah/Acst/qYjQTfV8h6nVfQc49e+WCV/ea2ONwa4S3cMd/tNhfkpxp0CdIqegIaI/JJe5ZJBP299p4vGCa5eUcPD5swQz4hPtOttUvuMNdgv04/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=hovUyWKA; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 3771990ecf5211f0b2bf0b349165d6e0-20251202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=OQPUOIFyhTcDc81TnNIOZzSwrJgcab56GhBBQWq/duE=;
	b=hovUyWKATAx9HW4HAoKR/t4ulwAko6qXFBYFTcOrUPBWZ6QeuPIKp50K00EDCPj3qVZ6xxs8DU2tcKlrtRHZv1xUEs5B5ZcgcCYqz8ytBkmvD6anQ5SiRzAWKbIrlPo3u9K5lA+S/eufbatHS5GIdrB1k2GORpxHJdl3215Zgzk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:c4f26b80-9eb3-4759-b9f1-1821de91f150,IP:0,UR
	L:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:a9d874c,CLOUDID:66bfbaa9-6421-45b1-b8b8-e73e3dc9a90f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:2,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3771990ecf5211f0b2bf0b349165d6e0-20251202
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1834067356; Tue, 02 Dec 2025 15:40:47 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 2 Dec 2025 15:40:45 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Tue, 2 Dec 2025 15:40:44 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Nathan Hebert <nhebert@chromium.org>, "Arnd
 Bergmann" <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, George Sun
	<george.sun@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	<andrzejtp2010@gmail.com>, Yilong Zhou <yilong.zhou@mediatek.com>
Subject: [PATCH v6 03/10] media: mediatek: vcodec: add decoder compatible to support MT8189
Date: Tue, 2 Dec 2025 15:40:30 +0800
Message-ID: <20251202074038.3173-4-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20251202074038.3173-1-kyrie.wu@mediatek.com>
References: <20251202074038.3173-1-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

MT8189 is pure single core architecture. Add its compatible to
initialize platform data.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.h   |  1 +
 .../vcodec/decoder/mtk_vcodec_dec_drv.c        |  4 ++++
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c  | 18 ++++++++++++++++++
 3 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h
index 80cb46f1cded..2bde871c0224 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h
@@ -71,6 +71,7 @@ extern const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata;
 extern const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata;
 extern const struct mtk_vcodec_dec_pdata mtk_vdec_8186_pdata;
 extern const struct mtk_vcodec_dec_pdata mtk_vdec_8188_pdata;
+extern const struct mtk_vcodec_dec_pdata mtk_vdec_8189_pdata;
 extern const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata;
 extern const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata;
 extern const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
index d7a269045fd6..2d1a545e727c 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -553,6 +553,10 @@ static const struct of_device_id mtk_vcodec_match[] = {
 		.compatible = "mediatek,mt8196-vcodec-dec",
 		.data = &mtk_vdec_8196_pdata,
 	},
+	{
+		.compatible = "mediatek,mt8189-vcodec-dec",
+		.data = &mtk_vdec_8189_pdata,
+	},
 	{},
 };
 
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index d249a8774948..9e43c54f8c4d 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -1013,3 +1013,21 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8186_pdata = {
 	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
 	.chip_name = 8186,
 };
+
+const struct mtk_vcodec_dec_pdata mtk_vdec_8189_pdata = {
+	.init_vdec_params = mtk_init_vdec_params,
+	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
+	.vdec_vb2_ops = &mtk_vdec_request_vb2_ops,
+	.vdec_formats = mtk_video_formats,
+	.num_formats = &num_formats,
+	.default_out_fmt = &default_out_format,
+	.default_cap_fmt = &default_cap_format,
+	.uses_stateless_api = true,
+	.worker = mtk_vdec_worker,
+	.flush_decoder = mtk_vdec_flush_decoder,
+	.cap_to_disp = mtk_vdec_stateless_cap_to_disp,
+	.get_cap_buffer = vdec_get_cap_buffer,
+	.is_subdev_supported = true,
+	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
+	.chip_name = 8189,
+};
-- 
2.45.2


