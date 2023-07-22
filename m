Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DB6175DADD
	for <lists+linux-media@lfdr.de>; Sat, 22 Jul 2023 09:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231297AbjGVHsD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Jul 2023 03:48:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231415AbjGVHr7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Jul 2023 03:47:59 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53EEF4202;
        Sat, 22 Jul 2023 00:47:19 -0700 (PDT)
X-UUID: d469db6a286311eeb20a276fd37b9834-20230722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=qqEksVJOPOKTBPEsGrR2lio+XwHgG5w59AALFAQnXeI=;
        b=Bqy75utWYAj0+cwNWEAlYMhTcesfOtoLlYiPvi3fbfraUwPMN2Ye7jgJd6fDy62OIubCyBJxYTzBc2szngcfp7bQhTokOf+k4E8OH+l3lB/ex7AujM7/xOadg6Lt54aNn18UjTtbJ3e3HtzCg9ERPPOiBxSHbjwdiPv9EQwg0J8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28,REQID:887ee29f-7bbf-4515-b44d-80b92dac8371,IP:0,U
        RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
        ON:release,TS:70
X-CID-INFO: VERSION:1.1.28,REQID:887ee29f-7bbf-4515-b44d-80b92dac8371,IP:0,URL
        :0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
        ON:quarantine,TS:70
X-CID-META: VersionHash:176cd25,CLOUDID:1da7ff4c-06c1-468b-847d-5b62d44dbb9b,B
        ulkID:230722154614MWI8BHDS,BulkQuantity:1,Recheck:0,SF:48|38|29|28|17|19,T
        C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
        OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,
        TF_CID_SPAM_FSD
X-UUID: d469db6a286311eeb20a276fd37b9834-20230722
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 880688141; Sat, 22 Jul 2023 15:46:12 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 22 Jul 2023 15:46:11 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 22 Jul 2023 15:46:10 +0800
From:   Yunfei Dong <yunfei.dong@mediatek.com>
To:     =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= 
        <nfraprado@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Nathan Hebert <nhebert@chromium.org>
CC:     Chen-Yu Tsai <wenst@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        "Steve Cho" <stevecho@chromium.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2,1/2] media: mediatek: vcodec: checking decoder ack message parameter
Date:   Sat, 22 Jul 2023 15:46:07 +0800
Message-ID: <20230722074608.30766-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK:  N
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Need to checking all parameters of msg data are valid or not,
in case of access null pointer or unreasonable value leading
to kernel reboot.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  2 +
 .../mediatek/vcodec/decoder/vdec_vpu_if.c     | 77 ++++++++++++-------
 2 files changed, 52 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index 6c318de25a55..7e36b2c69b7d 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -161,6 +161,7 @@ struct mtk_vcodec_dec_pdata {
  * @hw_id: hardware index used to identify different hardware.
  *
  * @msg_queue: msg queue used to store lat buffer information.
+ * @vpu_inst: vpu instance pointer.
  *
  * @is_10bit_bitstream: set to true if it's 10bit bitstream
  */
@@ -205,6 +206,7 @@ struct mtk_vcodec_dec_ctx {
 	int hw_id;
 
 	struct vdec_msg_queue msg_queue;
+	void *vpu_inst;
 
 	bool is_10bit_bitstream;
 };
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
index 82c3dc8c4127..23cfe5c6c90b 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
@@ -72,6 +72,21 @@ static void handle_get_param_msg_ack(const struct vdec_vpu_ipi_get_param_ack *ms
 	}
 }
 
+static bool vpu_dec_check_ap_inst(struct mtk_vcodec_dec_dev *dec_dev, struct vdec_vpu_inst *vpu)
+{
+	struct mtk_vcodec_dec_ctx *ctx;
+	int ret = false;
+
+	list_for_each_entry(ctx, &dec_dev->ctx_list, list) {
+		if (!IS_ERR_OR_NULL(ctx) && ctx->vpu_inst == vpu) {
+			ret = true;
+			break;
+		}
+	}
+
+	return ret;
+}
+
 /*
  * vpu_dec_ipi_handler - Handler for VPU ipi message.
  *
@@ -84,44 +99,51 @@ static void handle_get_param_msg_ack(const struct vdec_vpu_ipi_get_param_ack *ms
  */
 static void vpu_dec_ipi_handler(void *data, unsigned int len, void *priv)
 {
+	struct mtk_vcodec_dec_dev *dec_dev;
 	const struct vdec_vpu_ipi_ack *msg = data;
-	struct vdec_vpu_inst *vpu = (struct vdec_vpu_inst *)
-					(unsigned long)msg->ap_inst_addr;
+	struct vdec_vpu_inst *vpu;
 
-	if (!vpu) {
+	dec_dev = (struct mtk_vcodec_dec_dev *)priv;
+	vpu = (struct vdec_vpu_inst *)(unsigned long)msg->ap_inst_addr;
+	if (!priv || !vpu) {
 		mtk_v4l2_vdec_err(vpu->ctx, "ap_inst_addr is NULL, did the SCP hang or crash?");
 		return;
 	}
 
-	mtk_vdec_debug(vpu->ctx, "+ id=%X", msg->msg_id);
+	if (!vpu_dec_check_ap_inst(dec_dev, vpu) || msg->msg_id < VPU_IPIMSG_DEC_INIT_ACK ||
+	    msg->msg_id > VPU_IPIMSG_DEC_GET_PARAM_ACK) {
+		mtk_v4l2_vdec_err(vpu->ctx, "vdec msg id not correctly => 0x%x", msg->msg_id);
+		vpu->failure = -EINVAL;
+		goto error;
+	}
 
 	vpu->failure = msg->status;
-	vpu->signaled = 1;
+	if (msg->status != 0)
+		goto error;
 
-	if (msg->status == 0) {
-		switch (msg->msg_id) {
-		case VPU_IPIMSG_DEC_INIT_ACK:
-			handle_init_ack_msg(data);
-			break;
+	switch (msg->msg_id) {
+	case VPU_IPIMSG_DEC_INIT_ACK:
+		handle_init_ack_msg(data);
+		break;
 
-		case VPU_IPIMSG_DEC_START_ACK:
-		case VPU_IPIMSG_DEC_END_ACK:
-		case VPU_IPIMSG_DEC_DEINIT_ACK:
-		case VPU_IPIMSG_DEC_RESET_ACK:
-		case VPU_IPIMSG_DEC_CORE_ACK:
-		case VPU_IPIMSG_DEC_CORE_END_ACK:
-			break;
+	case VPU_IPIMSG_DEC_START_ACK:
+	case VPU_IPIMSG_DEC_END_ACK:
+	case VPU_IPIMSG_DEC_DEINIT_ACK:
+	case VPU_IPIMSG_DEC_RESET_ACK:
+	case VPU_IPIMSG_DEC_CORE_ACK:
+	case VPU_IPIMSG_DEC_CORE_END_ACK:
+		break;
 
-		case VPU_IPIMSG_DEC_GET_PARAM_ACK:
-			handle_get_param_msg_ack(data);
-			break;
-		default:
-			mtk_vdec_err(vpu->ctx, "invalid msg=%X", msg->msg_id);
-			break;
-		}
+	case VPU_IPIMSG_DEC_GET_PARAM_ACK:
+		handle_get_param_msg_ack(data);
+		break;
+	default:
+		mtk_vdec_err(vpu->ctx, "invalid msg=%X", msg->msg_id);
+		break;
 	}
 
-	mtk_vdec_debug(vpu->ctx, "- id=%X", msg->msg_id);
+error:
+	vpu->signaled = 1;
 }
 
 static int vcodec_vpu_send_msg(struct vdec_vpu_inst *vpu, void *msg, int len)
@@ -182,9 +204,10 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
 
 	init_waitqueue_head(&vpu->wq);
 	vpu->handler = vpu_dec_ipi_handler;
+	vpu->ctx->vpu_inst = vpu;
 
 	err = mtk_vcodec_fw_ipi_register(vpu->ctx->dev->fw_handler, vpu->id,
-					 vpu->handler, "vdec", NULL);
+					 vpu->handler, "vdec", vpu->ctx->dev);
 	if (err) {
 		mtk_vdec_err(vpu->ctx, "vpu_ipi_register fail status=%d", err);
 		return err;
@@ -193,7 +216,7 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
 	if (vpu->ctx->dev->vdec_pdata->hw_arch == MTK_VDEC_LAT_SINGLE_CORE) {
 		err = mtk_vcodec_fw_ipi_register(vpu->ctx->dev->fw_handler,
 						 vpu->core_id, vpu->handler,
-						 "vdec", NULL);
+						 "vdec", vpu->ctx->dev);
 		if (err) {
 			mtk_vdec_err(vpu->ctx, "vpu_ipi_register core fail status=%d", err);
 			return err;
-- 
2.18.0

