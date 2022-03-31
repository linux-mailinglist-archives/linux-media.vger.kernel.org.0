Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F5234ED274
	for <lists+linux-media@lfdr.de>; Thu, 31 Mar 2022 06:35:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbiCaEKa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Mar 2022 00:10:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229773AbiCaEJf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Mar 2022 00:09:35 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26898DCA99;
        Wed, 30 Mar 2022 20:43:43 -0700 (PDT)
X-UUID: 2acd7eb0dc6b4430a884787d0de150c0-20220331
X-UUID: 2acd7eb0dc6b4430a884787d0de150c0-20220331
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1739540298; Thu, 31 Mar 2022 10:48:40 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Thu, 31 Mar 2022 10:48:38 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 31 Mar 2022 10:48:37 +0800
From:   Yunfei Dong <yunfei.dong@mediatek.com>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        "Hans Verkuil" <hverkuil-cisco@xs4all.nl>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
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
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        Steve Cho <stevecho@chromium.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v8, 07/17] media: mediatek: vcodec: Refactor supported vdec formats and framesizes
Date:   Thu, 31 Mar 2022 10:47:51 +0800
Message-ID: <20220331024801.29229-8-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331024801.29229-1-yunfei.dong@mediatek.com>
References: <20220331024801.29229-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Supported output and capture format types for mt8192 are different
with mt8183. Redefine parameters to store them.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../media/platform/mediatek/vcodec/mtk_vcodec_dec.c |  8 ++++----
 .../mediatek/vcodec/mtk_vcodec_dec_stateful.c       | 13 ++++++++-----
 .../mediatek/vcodec/mtk_vcodec_dec_stateless.c      | 13 +++++++------
 .../media/platform/mediatek/vcodec/mtk_vcodec_drv.h | 13 +++++++++++--
 4 files changed, 30 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
index c1c3f439d7d1..1fb49a779c5d 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
@@ -26,7 +26,7 @@ mtk_vdec_find_format(struct v4l2_format *f,
 	const struct mtk_video_fmt *fmt;
 	unsigned int k;
 
-	for (k = 0; k < dec_pdata->num_formats; k++) {
+	for (k = 0; k < *dec_pdata->num_formats; k++) {
 		fmt = &dec_pdata->vdec_formats[k];
 		if (fmt->fourcc == f->fmt.pix_mp.pixelformat)
 			return fmt;
@@ -531,7 +531,7 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
 	if (fsize->index != 0)
 		return -EINVAL;
 
-	for (i = 0; i < dec_pdata->num_framesizes; ++i) {
+	for (i = 0; i < *dec_pdata->num_framesizes; ++i) {
 		if (fsize->pixel_format != dec_pdata->vdec_framesizes[i].fourcc)
 			continue;
 
@@ -563,7 +563,7 @@ static int vidioc_enum_fmt(struct v4l2_fmtdesc *f, void *priv,
 	const struct mtk_video_fmt *fmt;
 	int i, j = 0;
 
-	for (i = 0; i < dec_pdata->num_formats; i++) {
+	for (i = 0; i < *dec_pdata->num_formats; i++) {
 		if (output_queue &&
 		    dec_pdata->vdec_formats[i].type != MTK_FMT_DEC)
 			continue;
@@ -576,7 +576,7 @@ static int vidioc_enum_fmt(struct v4l2_fmtdesc *f, void *priv,
 		++j;
 	}
 
-	if (i == dec_pdata->num_formats)
+	if (i == *dec_pdata->num_formats)
 		return -EINVAL;
 
 	fmt = &dec_pdata->vdec_formats[i];
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c
index e7fd39180123..9c7e6145cebb 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c
@@ -37,7 +37,9 @@ static const struct mtk_video_fmt mtk_video_formats[] = {
 	},
 };
 
-#define NUM_FORMATS ARRAY_SIZE(mtk_video_formats)
+static const unsigned int num_supported_formats =
+	ARRAY_SIZE(mtk_video_formats);
+
 #define DEFAULT_OUT_FMT_IDX 0
 #define DEFAULT_CAP_FMT_IDX 3
 
@@ -59,7 +61,8 @@ static const struct mtk_codec_framesizes mtk_vdec_framesizes[] = {
 	},
 };
 
-#define NUM_SUPPORTED_FRAMESIZE ARRAY_SIZE(mtk_vdec_framesizes)
+static const unsigned int num_supported_framesize =
+	ARRAY_SIZE(mtk_vdec_framesizes);
 
 /*
  * This function tries to clean all display buffers, the buffers will return
@@ -230,7 +233,7 @@ static void mtk_vdec_update_fmt(struct mtk_vcodec_ctx *ctx,
 	unsigned int k;
 
 	dst_q_data = &ctx->q_data[MTK_Q_DATA_DST];
-	for (k = 0; k < NUM_FORMATS; k++) {
+	for (k = 0; k < num_supported_formats; k++) {
 		fmt = &mtk_video_formats[k];
 		if (fmt->fourcc == pixelformat) {
 			mtk_v4l2_debug(1, "Update cap fourcc(%d -> %d)",
@@ -612,11 +615,11 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata = {
 	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
 	.vdec_vb2_ops = &mtk_vdec_frame_vb2_ops,
 	.vdec_formats = mtk_video_formats,
-	.num_formats = NUM_FORMATS,
+	.num_formats = &num_supported_formats,
 	.default_out_fmt = &mtk_video_formats[DEFAULT_OUT_FMT_IDX],
 	.default_cap_fmt = &mtk_video_formats[DEFAULT_CAP_FMT_IDX],
 	.vdec_framesizes = mtk_vdec_framesizes,
-	.num_framesizes = NUM_SUPPORTED_FRAMESIZE,
+	.num_framesizes = &num_supported_framesize,
 	.worker = mtk_vdec_worker,
 	.flush_decoder = mtk_vdec_flush_decoder,
 	.is_subdev_supported = false,
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
index 727a128de18b..e83a5772d7dc 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
@@ -94,7 +94,8 @@ static const struct mtk_video_fmt mtk_video_formats[] = {
 	},
 };
 
-#define NUM_FORMATS ARRAY_SIZE(mtk_video_formats)
+static const unsigned int num_supported_formats = ARRAY_SIZE(mtk_video_formats);
+
 #define DEFAULT_OUT_FMT_IDX    0
 #define DEFAULT_CAP_FMT_IDX    1
 
@@ -106,7 +107,7 @@ static const struct mtk_codec_framesizes mtk_vdec_framesizes[] = {
 	},
 };
 
-#define NUM_SUPPORTED_FRAMESIZE ARRAY_SIZE(mtk_vdec_framesizes)
+static const unsigned int num_supported_framesize = ARRAY_SIZE(mtk_vdec_framesizes);
 
 static void mtk_vdec_stateless_cap_to_disp(struct mtk_vcodec_ctx *ctx, int error,
 					   struct media_request *src_buf_req)
@@ -362,11 +363,11 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
 	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
 	.vdec_vb2_ops = &mtk_vdec_request_vb2_ops,
 	.vdec_formats = mtk_video_formats,
-	.num_formats = NUM_FORMATS,
+	.num_formats = &num_supported_formats,
 	.default_out_fmt = &mtk_video_formats[DEFAULT_OUT_FMT_IDX],
 	.default_cap_fmt = &mtk_video_formats[DEFAULT_CAP_FMT_IDX],
 	.vdec_framesizes = mtk_vdec_framesizes,
-	.num_framesizes = NUM_SUPPORTED_FRAMESIZE,
+	.num_framesizes = &num_supported_framesize,
 	.uses_stateless_api = true,
 	.worker = mtk_vdec_worker,
 	.flush_decoder = mtk_vdec_flush_decoder,
@@ -382,11 +383,11 @@ const struct mtk_vcodec_dec_pdata mtk_lat_sig_core_pdata = {
 	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
 	.vdec_vb2_ops = &mtk_vdec_request_vb2_ops,
 	.vdec_formats = mtk_video_formats,
-	.num_formats = NUM_FORMATS,
+	.num_formats = &num_supported_formats,
 	.default_out_fmt = &mtk_video_formats[DEFAULT_OUT_FMT_IDX],
 	.default_cap_fmt = &mtk_video_formats[DEFAULT_CAP_FMT_IDX],
 	.vdec_framesizes = mtk_vdec_framesizes,
-	.num_framesizes = NUM_SUPPORTED_FRAMESIZE,
+	.num_framesizes = &num_supported_framesize,
 	.uses_stateless_api = true,
 	.worker = mtk_vdec_worker,
 	.flush_decoder = mtk_vdec_flush_decoder,
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
index c06463142182..d74a9e0e74fe 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
@@ -344,6 +344,15 @@ enum mtk_vdec_hw_arch {
 	MTK_VDEC_LAT_SINGLE_CORE,
 };
 
+/*
+ * struct mtk_vdec_format_types - Structure used to get supported
+ *		  format types according to decoder capability
+ */
+enum mtk_vdec_format_types {
+	MTK_VDEC_FORMAT_MM21 = 0x20,
+	MTK_VDEC_FORMAT_H264_SLICE = 0x100,
+};
+
 /**
  * struct mtk_vcodec_dec_pdata - compatible data for each IC
  * @init_vdec_params: init vdec params
@@ -380,12 +389,12 @@ struct mtk_vcodec_dec_pdata {
 	struct vb2_ops *vdec_vb2_ops;
 
 	const struct mtk_video_fmt *vdec_formats;
-	const int num_formats;
+	const int *num_formats;
 	const struct mtk_video_fmt *default_out_fmt;
 	const struct mtk_video_fmt *default_cap_fmt;
 
 	const struct mtk_codec_framesizes *vdec_framesizes;
-	const int num_framesizes;
+	const int *num_framesizes;
 
 	enum mtk_vdec_hw_arch hw_arch;
 
-- 
2.18.0

