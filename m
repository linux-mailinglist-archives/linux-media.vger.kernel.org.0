Return-Path: <linux-media+bounces-39970-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D458B27BED
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 10:59:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 412BBAC7863
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 08:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1BD62E763F;
	Fri, 15 Aug 2025 08:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="sDibPX89"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B862E2E2F1A;
	Fri, 15 Aug 2025 08:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755247990; cv=none; b=JbuOgPtN2cHDtmL0LCGWGAmHYoC8hJcaVs6RHLtirSLyIUKt3YQznA1WepfMWkI2S+jCmxNNIzgwcZq3fJW8B15mOJq3nhwLFHb03iKv+SrEhGG1TfF2QM25cw0wu73L/SBa6iG76CeabdUOXnsi8HzDNj6bSavRTSqWkaW6tQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755247990; c=relaxed/simple;
	bh=ZkqHdKj+3Zolm7JVHMxoJqAtNCuvHnyC+NRArNFiSvs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EoEC/rQs9LYWPm1VHtpKJEabE1s9pujY4a4p6BoFW+SvfgTShMqeM0odJHroe7JaxF3Z8KbBDugv5IrQI6zAbe/OHW4lYPVx5OLo4ZBoJc5S9Mucwxr7KHNNf8pMhKLTLCusH5D+8BrrPMNFqE8/ScjxBUJP4l5ge2UhGC63D88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=sDibPX89; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 3f9f267a79b511f0b33aeb1e7f16c2b6-20250815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=59YtPiMqHJGpxErwBAJ5ghDAd/TjVl00FMsru6ZuO8w=;
	b=sDibPX89FrAIV13IzuujzhPAPvnbG+hevJwkjajJRW9eYWGHkNyeImP1xMZhJolyYgygrvyl5RoiAfI5hkD4U2nvT+NtilNcSTQU9gY26brjeryIw903/6BvxdjzLnJEXS02n3HBmYYqVt2wd3Wf0JfeAguvL0oCT1WJCO3Oi3A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:4d051453-aa43-449c-8bb8-81686472ce28,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:9984416d-c2f4-47a6-876f-59a53e9ecc6e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3f9f267a79b511f0b33aeb1e7f16c2b6-20250815
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 238588778; Fri, 15 Aug 2025 16:53:01 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 15 Aug 2025 16:52:58 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 15 Aug 2025 16:52:57 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, "Yunfei
 Dong" <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 12/14] media: mediatek: vcodec: send share memory address to vcp
Date: Fri, 15 Aug 2025 16:52:25 +0800
Message-ID: <20250815085232.30240-13-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250815085232.30240-1-yunfei.dong@mediatek.com>
References: <20250815085232.30240-1-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Send share memory address to vcp for it is reserved in kernel
side.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h | 2 ++
 drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h b/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h
index 47070be2a991..097561a1efdc 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h
@@ -67,11 +67,13 @@ struct vdec_vpu_ipi_ack {
  * @msg_id	: AP_IPIMSG_DEC_INIT
  * @codec_type	: codec fourcc
  * @ap_inst_addr	: AP video decoder instance address
+ * @shared_iova	: reserved share memory address
  */
 struct vdec_ap_ipi_init {
 	uint32_t msg_id;
 	u32 codec_type;
 	uint64_t ap_inst_addr;
+	u64 shared_iova;
 };
 
 /**
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
index ac10e0dfefb2..428ed9e5f2c3 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
@@ -232,6 +232,8 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
 	msg.msg_id = AP_IPIMSG_DEC_INIT;
 	msg.ap_inst_addr = (unsigned long)vpu;
 	msg.codec_type = vpu->codec_type;
+	if (mtk_vcodec_fw_get_type(vpu->ctx->dev->fw_handler) == VCP)
+		msg.shared_iova = vpu->ctx->dev->fw_handler->vcp->iova_addr;
 
 	mtk_vdec_debug(vpu->ctx, "vdec_inst=%p", vpu);
 
-- 
2.45.2


