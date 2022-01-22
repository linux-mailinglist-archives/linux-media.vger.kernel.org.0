Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 214894969B4
	for <lists+linux-media@lfdr.de>; Sat, 22 Jan 2022 04:53:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232454AbiAVDxb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Jan 2022 22:53:31 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:51826 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232380AbiAVDx2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Jan 2022 22:53:28 -0500
X-UUID: 09f6de263ab74f9f9f5c9b59998baef9-20220122
X-UUID: 09f6de263ab74f9f9f5c9b59998baef9-20220122
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 492808022; Sat, 22 Jan 2022 11:53:24 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Sat, 22 Jan 2022 11:53:22 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 22 Jan 2022 11:53:20 +0800
From:   Yunfei Dong <yunfei.dong@mediatek.com>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Tzung-Bi Shih" <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>
CC:     George Sun <george.sun@mediatek.com>,
        Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Steve Cho <stevecho@chromium.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v6, 02/15] media: mtk-vcodec: Using firmware type to separate different firmware architecture
Date:   Sat, 22 Jan 2022 11:53:03 +0800
Message-ID: <20220122035316.18179-3-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220122035316.18179-1-yunfei.dong@mediatek.com>
References: <20220122035316.18179-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

MT8173 platform use vpu firmware, mt8183/mt8192 will use scp
firmware instead, using chip name is not reasonable to separate
different firmware architecture. Using firmware type is much better.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Tzung-Bi Shih<tzungbi@google.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_dec_stateful.c   |  1 -
 .../platform/mtk-vcodec/mtk_vcodec_dec_stateless.c  |  2 --
 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h  | 13 -------------
 .../media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  5 -----
 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c   |  6 ++++++
 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h   |  1 +
 drivers/media/platform/mtk-vcodec/vdec_vpu_if.c     |  4 ++--
 drivers/media/platform/mtk-vcodec/venc_vpu_if.c     |  2 +-
 8 files changed, 10 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
index 04ca43c77e5f..7966c132be8f 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
@@ -613,7 +613,6 @@ static struct vb2_ops mtk_vdec_frame_vb2_ops = {
 };
 
 const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata = {
-	.chip = MTK_MT8173,
 	.init_vdec_params = mtk_init_vdec_params,
 	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
 	.vdec_vb2_ops = &mtk_vdec_frame_vb2_ops,
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
index 23d997ac114d..5aebf88f997b 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
@@ -343,7 +343,6 @@ static struct vb2_ops mtk_vdec_request_vb2_ops = {
 };
 
 const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
-	.chip = MTK_MT8183,
 	.init_vdec_params = mtk_init_vdec_params,
 	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
 	.vdec_vb2_ops = &mtk_vdec_request_vb2_ops,
@@ -362,7 +361,6 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
 
 /* This platform data is used for one lat and one core architecture. */
 const struct mtk_vcodec_dec_pdata mtk_lat_sig_core_pdata = {
-	.chip = MTK_MT8192,
 	.init_vdec_params = mtk_init_vdec_params,
 	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
 	.vdec_vb2_ops = &mtk_vdec_request_vb2_ops,
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 94b47b7c912b..5056abe3d2be 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -335,13 +335,6 @@ struct mtk_vcodec_ctx {
 	struct vdec_msg_queue msg_queue;
 };
 
-enum mtk_chip {
-	MTK_MT8173,
-	MTK_MT8183,
-	MTK_MT8192,
-	MTK_MT8195,
-};
-
 /*
  * enum mtk_vdec_hw_arch - Used to separate different hardware architecture
  */
@@ -367,7 +360,6 @@ enum mtk_vdec_hw_arch {
  * @vdec_framesizes: supported video decoder frame sizes
  * @num_framesizes: count of video decoder frame sizes
  *
- * @chip: chip this decoder is compatible with
  * @hw_arch: hardware arch is used to separate pure_sin_core and lat_sin_core
  *
  * @is_subdev_supported: whether support parent-node architecture(subdev)
@@ -390,7 +382,6 @@ struct mtk_vcodec_dec_pdata {
 	const struct mtk_codec_framesizes *vdec_framesizes;
 	const int num_framesizes;
 
-	enum mtk_chip chip;
 	enum mtk_vdec_hw_arch hw_arch;
 
 	bool is_subdev_supported;
@@ -400,8 +391,6 @@ struct mtk_vcodec_dec_pdata {
 /**
  * struct mtk_vcodec_enc_pdata - compatible data for each IC
  *
- * @chip: chip this encoder is compatible with
- *
  * @uses_ext: whether the encoder uses the extended firmware messaging format
  * @min_bitrate: minimum supported encoding bitrate
  * @max_bitrate: maximum supported encoding bitrate
@@ -412,8 +401,6 @@ struct mtk_vcodec_dec_pdata {
  * @core_id: stand for h264 or vp8 encode index
  */
 struct mtk_vcodec_enc_pdata {
-	enum mtk_chip chip;
-
 	bool uses_ext;
 	unsigned long min_bitrate;
 	unsigned long max_bitrate;
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index 507ad1ea2104..3ac6969c54c0 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -378,7 +378,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 }
 
 static const struct mtk_vcodec_enc_pdata mt8173_avc_pdata = {
-	.chip = MTK_MT8173,
 	.capture_formats = mtk_video_formats_capture_h264,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
 	.output_formats = mtk_video_formats_output,
@@ -389,7 +388,6 @@ static const struct mtk_vcodec_enc_pdata mt8173_avc_pdata = {
 };
 
 static const struct mtk_vcodec_enc_pdata mt8173_vp8_pdata = {
-	.chip = MTK_MT8173,
 	.capture_formats = mtk_video_formats_capture_vp8,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_vp8),
 	.output_formats = mtk_video_formats_output,
@@ -400,7 +398,6 @@ static const struct mtk_vcodec_enc_pdata mt8173_vp8_pdata = {
 };
 
 static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
-	.chip = MTK_MT8183,
 	.uses_ext = true,
 	.capture_formats = mtk_video_formats_capture_h264,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
@@ -412,7 +409,6 @@ static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
 };
 
 static const struct mtk_vcodec_enc_pdata mt8192_pdata = {
-	.chip = MTK_MT8192,
 	.uses_ext = true,
 	.capture_formats = mtk_video_formats_capture_h264,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
@@ -424,7 +420,6 @@ static const struct mtk_vcodec_enc_pdata mt8192_pdata = {
 };
 
 static const struct mtk_vcodec_enc_pdata mt8195_pdata = {
-	.chip = MTK_MT8195,
 	.uses_ext = true,
 	.capture_formats = mtk_video_formats_capture_h264,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
index 94b39ae5c2e1..556e54aadac9 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
@@ -65,3 +65,9 @@ int mtk_vcodec_fw_ipi_send(struct mtk_vcodec_fw *fw, int id, void *buf,
 	return fw->ops->ipi_send(fw, id, buf, len, wait);
 }
 EXPORT_SYMBOL_GPL(mtk_vcodec_fw_ipi_send);
+
+int mtk_vcodec_fw_get_type(struct mtk_vcodec_fw *fw)
+{
+	return fw->type;
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_fw_get_type);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
index 539bb626772c..acd355961e3a 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
@@ -39,5 +39,6 @@ int mtk_vcodec_fw_ipi_register(struct mtk_vcodec_fw *fw, int id,
 			       const char *name, void *priv);
 int mtk_vcodec_fw_ipi_send(struct mtk_vcodec_fw *fw, int id,
 			   void *buf, unsigned int len, unsigned int wait);
+int mtk_vcodec_fw_get_type(struct mtk_vcodec_fw *fw);
 
 #endif /* _MTK_VCODEC_FW_H_ */
diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
index dd35d2c5f920..7210061c772f 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
@@ -33,8 +33,8 @@ static void handle_init_ack_msg(const struct vdec_vpu_ipi_init_ack *msg)
 	 */
 	vpu->inst_id = 0xdeadbeef;
 
-	/* Firmware version field does not exist on MT8173. */
-	if (vpu->ctx->dev->vdec_pdata->chip == MTK_MT8173)
+	/* VPU firmware does not contain a version field. */
+	if (mtk_vcodec_fw_get_type(vpu->ctx->dev->fw_handler) == VPU)
 		return;
 
 	/* Check firmware version. */
diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
index e7899d8a3e4e..d3570c4c177d 100644
--- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
@@ -18,7 +18,7 @@ static void handle_enc_init_msg(struct venc_vpu_inst *vpu, const void *data)
 					     msg->vpu_inst_addr);
 
 	/* Firmware version field value is unspecified on MT8173. */
-	if (vpu->ctx->dev->venc_pdata->chip == MTK_MT8173)
+	if (mtk_vcodec_fw_get_type(vpu->ctx->dev->fw_handler) == VPU)
 		return;
 
 	/* Check firmware version. */
-- 
2.25.1

