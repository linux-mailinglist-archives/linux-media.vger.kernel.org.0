Return-Path: <linux-media+bounces-39385-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B4EB1FE22
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 05:27:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B19A9172F90
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 03:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F73281371;
	Mon, 11 Aug 2025 03:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tsbDrsAU"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F204226AA91;
	Mon, 11 Aug 2025 03:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754882795; cv=none; b=B2zzPDDE4YIqYIiT5fU41HXmu2l6WkJhP2wapA0+Vc9WnT3y6rBvVUCkyEuWdOtcYyomJWQunQIdI5LPG2uC5XiMd58y9H+KInN23QUgyIs+zNRBEn5o+w1tvEuLVDbbDXOkn52Kdg8WmWjdRS0tMNL0dhmQknB2oGaxPVmXGSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754882795; c=relaxed/simple;
	bh=zz0ZM9ZFRwm095VDH9EjPCVZUBGFyDlDqbuRlIfOW1E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tccjMvT/2Ut3FGRIEbKD0BgRgrQgAW73zn58IGdrgTLBx5o3KC1sh+ffi/8C0KLeLjs1i1RCXFXql3JR8zZERX4GlfrKIxYMi1BWqyjFSMZ2MNQ6ZsyTse4/lSWHhZQwfAW/ug6pHp0xqHh7FXmXB/wYeffQQannJiwLUs+Dkvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=tsbDrsAU; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: f73da67c766211f0b33aeb1e7f16c2b6-20250811
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=dmDycyrKedKl+dsAB3R2YpSJL9+g7fyKUBQKL63ne0k=;
	b=tsbDrsAUaJGHen6PRa0CtMiXbhMJGivD9QzbS6o13l/glRGNwT/pPVwDuFXbxjBaWBdNkUuocA+yJ3ydbzpCFLUB8axSm6nglj5+lnTHF99JRaobWjnI7waO0gHCK0nhB/v0bKzO4qct0f3Vw26U3MXLqXscGRAcVOS9ZUhoQk4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:1d8689e6-193a-4b1b-a0d6-7814036dcdd5,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:9e4a4451-d89a-4c27-9e37-f7ccfcbebd5b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f73da67c766211f0b33aeb1e7f16c2b6-20250811
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1751619749; Mon, 11 Aug 2025 11:26:27 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 11 Aug 2025 11:27:08 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 11 Aug 2025 11:26:19 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>, Sebastian Fricke
	<sebastian.fricke@collabora.com>, Nathan Hebert <nhebert@chromium.org>, "Arnd
 Bergmann" <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, George Sun
	<george.sun@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	<andrzejtp2010@gmail.com>
Subject: [PATCH v2 3/8] media: mediatek: vcodec: add profile and level supporting for MT8189
Date: Mon, 11 Aug 2025 11:26:10 +0800
Message-ID: <20250811032616.1385-4-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250811032616.1385-1-kyrie.wu@mediatek.com>
References: <20250811032616.1385-1-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

add profile and level supporting for H264 and vp9 of MT8189

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index c1cef78471a9..0a9bdc5316f9 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -552,6 +552,7 @@ static void mtk_vcodec_dec_fill_h264_level(struct v4l2_ctrl_config *cfg,
 	switch (ctx->dev->chip_name) {
 	case MTK_VDEC_MT8192:
 	case MTK_VDEC_MT8188:
+	case MTK_VDEC_MT8189:
 		cfg->max = V4L2_MPEG_VIDEO_H264_LEVEL_5_2;
 		break;
 	case MTK_VDEC_MT8195:
@@ -573,6 +574,7 @@ static void mtk_vcodec_dec_fill_h264_profile(struct v4l2_ctrl_config *cfg,
 {
 	switch (ctx->dev->chip_name) {
 	case MTK_VDEC_MT8188:
+	case MTK_VDEC_MT8189:
 	case MTK_VDEC_MT8195:
 	case MTK_VDEC_MT8196:
 		cfg->max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10;
@@ -623,6 +625,7 @@ static void mtk_vcodec_dec_fill_vp9_level(struct v4l2_ctrl_config *cfg,
 	case MTK_VDEC_MT8188:
 		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1;
 		break;
+	case MTK_VDEC_MT8189:
 	case MTK_VDEC_MT8195:
 	case MTK_VDEC_MT8196:
 		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2;
@@ -641,6 +644,7 @@ static void mtk_vcodec_dec_fill_vp9_profile(struct v4l2_ctrl_config *cfg,
 {
 	switch (ctx->dev->chip_name) {
 	case MTK_VDEC_MT8188:
+	case MTK_VDEC_MT8189:
 	case MTK_VDEC_MT8195:
 	case MTK_VDEC_MT8196:
 		cfg->max = V4L2_MPEG_VIDEO_VP9_PROFILE_2;
-- 
2.46.0


