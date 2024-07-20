Return-Path: <linux-media+bounces-15193-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AA8937FF1
	for <lists+linux-media@lfdr.de>; Sat, 20 Jul 2024 10:06:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A06B91F21D62
	for <lists+linux-media@lfdr.de>; Sat, 20 Jul 2024 08:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25BAA38398;
	Sat, 20 Jul 2024 08:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="PcV1v94s"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444BC22F14;
	Sat, 20 Jul 2024 08:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721462795; cv=none; b=sB32xBaBnzV4STzGFxB4xxm7CzJeoGdx6GfQ0a1Pr2MwgClVyYLeBeWBkHXhrJtxw+rbRPyniUyJ6jzOCHPjQA7iDOPNWrAiGBjkohJkISFgJtLltj26AZD8wQ+krz+VRJLAuxGtPaFMJU4ZWc27jeYOWVmn4byerh/0C/Fe0To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721462795; c=relaxed/simple;
	bh=MqiRAnoV/QdSwc83gegicRTwlhCqvJrAMFgifHWKp5A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HHKwFkot9SqIUIKzIu29fCu7Fh3r0OGBwQgq54mqQkbW3qDPY5cnR2fEHpWaj9uduTc0tE0tuB8K2LTmEow4U/VgqVZAzenNK5V76BMqm1hdoprRAjx/mSiwMwPFnXJTWAd/GiFkmVsWv/zdjc6soIRvyoaalS3fvvpj+OfNx7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=PcV1v94s; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: f98fc030466711ef87684b57767b52b1-20240720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=p+T/91DKPdqNSBBEBoJG5LDqiDs3jlbfJscwjtg0tng=;
	b=PcV1v94sS/zb5jRfr/gY+E3R+5G9os0roo/V+b67OSYezfywpVhSlMtc/zJbuCqqOh//1mHVqMUStSBwjGjzv4tfZQuhJLAWo4boU9yJQ61mESpDDAGu22gIKnha7ddoIWNG3Y2/Hw6VOj9E7KVAPFwTRzBGXKtOcgqojJZY9Dc=;
X-CID-CACHE: Type:Local,Time:202407201558+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:293076a3-196f-49ae-90f9-4c30b06fe1f8,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:ba885a6,CLOUDID:0050b4d1-436f-4604-ad9d-558fa44a3bbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f98fc030466711ef87684b57767b52b1-20240720
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 696327131; Sat, 20 Jul 2024 15:16:25 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 20 Jul 2024 15:16:24 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 20 Jul 2024 15:16:23 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Jeffrey Kardatzke <jkardatzke@google.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nathan Hebert <nhebert@chromium.org>, Nicolas
 Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Sebastian Fricke
	<sebastian.fricke@collabora.com>, Tomasz Figa <tfiga@chromium.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Marek Szyprowski
	<m.szyprowski@samsung.com>
CC: Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>, Hsin-Yi
 Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Daniel
 Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei Dong
	<yunfei.dong@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, Brian
 Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T . J .
 Mercier" <tjmercier@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	<linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v7 11/28] media: mediatek: vcodec: initialize msg and vsi information
Date: Sat, 20 Jul 2024 15:15:49 +0800
Message-ID: <20240720071606.27930-12-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240720071606.27930-1-yunfei.dong@mediatek.com>
References: <20240720071606.27930-1-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Initialize the msg and vsi information before send to optee, then
calling tee invoke command to send.

For the optee communication interface is different with scp, adding
condition to separate them.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  2 +
 .../mediatek/vcodec/decoder/vdec_vpu_if.c     | 43 ++++++++++++++++---
 .../mediatek/vcodec/decoder/vdec_vpu_if.h     |  4 ++
 3 files changed, 43 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index dcab8a257380..459a3e269a6d 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -175,6 +175,7 @@ struct mtk_vcodec_dec_pdata {
  * @vpu_inst: vpu instance pointer.
  *
  * @is_10bit_bitstream: set to true if it's 10bit bitstream
+ * @is_secure_playback: Secure Video Playback (SVP) mode
  */
 struct mtk_vcodec_dec_ctx {
 	enum mtk_instance_type type;
@@ -220,6 +221,7 @@ struct mtk_vcodec_dec_ctx {
 	void *vpu_inst;
 
 	bool is_10bit_bitstream;
+	bool is_secure_playback;
 };
 
 /**
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
index 145958206e38..6b34a0b52df4 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
@@ -150,7 +150,10 @@ static void vpu_dec_ipi_handler(void *data, unsigned int len, void *priv)
 
 static int vcodec_vpu_send_msg(struct vdec_vpu_inst *vpu, void *msg, int len)
 {
-	int err, id, msgid;
+	struct mtk_vdec_optee_data_to_shm *optee_data;
+	int id, hw_id, msgid;
+	void *ack_msg;
+	int err;
 
 	msgid = *(uint32_t *)msg;
 	mtk_vdec_debug(vpu->ctx, "id=%X", msgid);
@@ -160,16 +163,39 @@ static int vcodec_vpu_send_msg(struct vdec_vpu_inst *vpu, void *msg, int len)
 
 	if (vpu->ctx->dev->vdec_pdata->hw_arch == MTK_VDEC_LAT_SINGLE_CORE) {
 		if (msgid == AP_IPIMSG_DEC_CORE ||
-		    msgid == AP_IPIMSG_DEC_CORE_END)
+		    msgid == AP_IPIMSG_DEC_CORE_END) {
+			optee_data = &vpu->core_optee_info;
 			id = vpu->core_id;
-		else
+		} else {
+			optee_data = &vpu->lat_optee_info;
 			id = vpu->id;
+		}
 	} else {
+		optee_data = &vpu->core_optee_info;
 		id = vpu->id;
 	}
 
-	err = mtk_vcodec_fw_ipi_send(vpu->ctx->dev->fw_handler, id, msg,
-				     len, 2000);
+	if (!vpu->ctx->is_secure_playback) {
+		err = mtk_vcodec_fw_ipi_send(vpu->ctx->dev->fw_handler, id, msg, len, 2000);
+	} else {
+		hw_id = (id == SCP_IPI_VDEC_LAT) ? MTK_VDEC_LAT0 : MTK_VDEC_CORE;
+
+		mtk_vcodec_dec_optee_set_msg_info(optee_data, msg, len);
+
+		/*
+		 * There is no need to copy the data (VSI) message to shared memory,
+		 * but we still need to set the buffer size to a non-zero value.
+		 */
+		if (msgid == AP_IPIMSG_DEC_CORE || msgid == AP_IPIMSG_DEC_START)
+			mtk_vcodec_dec_optee_set_data_info(optee_data, vpu->ctx->dev, hw_id);
+
+		err = mtk_vcodec_dec_optee_invokd_cmd(vpu->ctx->dev, hw_id, optee_data);
+		vpu->failure = err;
+
+		ack_msg = mtk_vcodec_dec_get_shm_buffer_va(vpu->ctx->dev, hw_id, OPTEE_MSG_INDEX);
+		vpu_dec_ipi_handler(ack_msg, 0, vpu->ctx->dev);
+	}
+
 	if (err) {
 		mtk_vdec_err(vpu->ctx, "send fail vpu_id=%d msg_id=%X status=%d",
 			     id, msgid, err);
@@ -215,7 +241,12 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
 		return err;
 	}
 
-	if (vpu->ctx->dev->vdec_pdata->hw_arch == MTK_VDEC_LAT_SINGLE_CORE) {
+	/*
+	 * Using tee interface to communicate with optee os directly for SVP mode,
+	 * fw ipi interface is used for normal playback.
+	 */
+	if (vpu->ctx->dev->vdec_pdata->hw_arch == MTK_VDEC_LAT_SINGLE_CORE &&
+	    !vpu->ctx->is_secure_playback) {
 		err = mtk_vcodec_fw_ipi_register(vpu->ctx->dev->fw_handler,
 						 vpu->core_id, vpu->handler,
 						 "vdec", vpu->ctx->dev);
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.h b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.h
index 57ed9b1f5eaa..8e9d4c2cbb88 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.h
@@ -27,6 +27,8 @@ struct mtk_vcodec_dec_ctx;
  * @codec_type     : use codec type to separate different codecs
  * @capture_type:	used capture type to separate different capture format
  * @fb_sz  : frame buffer size of each plane
+ * @lat_optee_info  : used to send msg to optee shm buffer
+ * @core_optee_info  : used to send msg to optee shm buffer
  */
 struct vdec_vpu_inst {
 	int id;
@@ -43,6 +45,8 @@ struct vdec_vpu_inst {
 	unsigned int codec_type;
 	unsigned int capture_type;
 	unsigned int fb_sz[2];
+	struct mtk_vdec_optee_data_to_shm lat_optee_info;
+	struct mtk_vdec_optee_data_to_shm core_optee_info;
 };
 
 /**
-- 
2.18.0


