Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F52950FACB
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 12:34:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348995AbiDZKbl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 06:31:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348954AbiDZKbN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 06:31:13 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A10B1103DD2;
        Tue, 26 Apr 2022 03:08:59 -0700 (PDT)
X-UUID: 263a4ff4834345f7a19fb0225d247747-20220426
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4,REQID:93bcae87-4774-4051-aa4e-d9dce1c59d07,OB:0,LO
        B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
        TION:release,TS:-20
X-CID-META: VersionHash:faefae9,CLOUDID:fc77bf2e-6199-437e-8ab4-9920b4bc5b76,C
        OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 263a4ff4834345f7a19fb0225d247747-20220426
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1002721122; Tue, 26 Apr 2022 18:08:53 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Apr 2022 18:08:52 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 26 Apr
 2022 18:08:51 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 26 Apr 2022 18:08:48 +0800
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
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        "Steve Cho" <stevecho@chromium.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v10, 08/17] media: mediatek: vcodec: Getting supported decoder format types
Date:   Tue, 26 Apr 2022 18:08:19 +0800
Message-ID: <20220426100828.13429-9-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426100828.13429-1-yunfei.dong@mediatek.com>
References: <20220426100828.13429-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Getting supported output and capture queue format types according
to decoder capability.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../vcodec/mtk_vcodec_dec_stateless.c         | 118 +++++++++++++-----
 1 file changed, 84 insertions(+), 34 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
index 0034b2ee9259..5101322f4fe9 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
@@ -81,34 +81,23 @@ static const struct mtk_stateless_control mtk_stateless_controls[] = {
 
 #define NUM_CTRLS ARRAY_SIZE(mtk_stateless_controls)
 
-static const struct mtk_video_fmt mtk_video_formats[] = {
-	{
-		.fourcc = V4L2_PIX_FMT_H264_SLICE,
-		.type = MTK_FMT_DEC,
-		.num_planes = 1,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_MM21,
-		.type = MTK_FMT_FRAME,
-		.num_planes = 2,
-	},
-};
-
-static const unsigned int num_supported_formats = ARRAY_SIZE(mtk_video_formats);
-
-#define DEFAULT_OUT_FMT_IDX    0
-#define DEFAULT_CAP_FMT_IDX    1
-
-static const struct mtk_codec_framesizes mtk_vdec_framesizes[] = {
-	{
-		.fourcc	= V4L2_PIX_FMT_H264_SLICE,
-		.stepwise = {  MTK_VDEC_MIN_W, MTK_VDEC_MAX_W, 16,
-				MTK_VDEC_MIN_H, MTK_VDEC_MAX_H, 16 },
-	},
+static struct mtk_video_fmt mtk_video_formats[2];
+static struct mtk_codec_framesizes mtk_vdec_framesizes[1];
+
+static struct mtk_video_fmt default_out_format;
+static struct mtk_video_fmt default_cap_format;
+static unsigned int num_formats;
+static unsigned int num_framesizes;
+
+static struct v4l2_frmsize_stepwise stepwise_fhd = {
+	.min_width = MTK_VDEC_MIN_W,
+	.max_width = MTK_VDEC_MAX_W,
+	.step_width = 16,
+	.min_height = MTK_VDEC_MIN_H,
+	.max_height = MTK_VDEC_MAX_H,
+	.step_height = 16
 };
 
-static const unsigned int num_supported_framesize = ARRAY_SIZE(mtk_vdec_framesizes);
-
 static void mtk_vdec_stateless_cap_to_disp(struct mtk_vcodec_ctx *ctx, int error,
 					   struct media_request *src_buf_req)
 {
@@ -323,6 +312,62 @@ const struct media_device_ops mtk_vcodec_media_ops = {
 	.req_queue	= v4l2_m2m_request_queue,
 };
 
+static void mtk_vcodec_add_formats(unsigned int fourcc,
+				   struct mtk_vcodec_ctx *ctx)
+{
+	struct mtk_vcodec_dev *dev = ctx->dev;
+	const struct mtk_vcodec_dec_pdata *pdata = dev->vdec_pdata;
+	int count_formats = *pdata->num_formats;
+	int count_framesizes = *pdata->num_framesizes;
+
+	switch (fourcc) {
+	case V4L2_PIX_FMT_H264_SLICE:
+		mtk_video_formats[count_formats].fourcc = fourcc;
+		mtk_video_formats[count_formats].type = MTK_FMT_DEC;
+		mtk_video_formats[count_formats].num_planes = 1;
+
+		mtk_vdec_framesizes[count_framesizes].fourcc = fourcc;
+		mtk_vdec_framesizes[count_framesizes].stepwise = stepwise_fhd;
+		num_framesizes++;
+		break;
+	case V4L2_PIX_FMT_MM21:
+		mtk_video_formats[count_formats].fourcc = fourcc;
+		mtk_video_formats[count_formats].type = MTK_FMT_FRAME;
+		mtk_video_formats[count_formats].num_planes = 2;
+		break;
+	default:
+		mtk_v4l2_err("Can not add unsupported format type");
+		return;
+	}
+
+	num_formats++;
+	mtk_v4l2_debug(3, "num_formats: %d num_frames:%d dec_capability: 0x%x",
+		       count_formats, count_framesizes, ctx->dev->dec_capability);
+}
+
+static void mtk_vcodec_get_supported_formats(struct mtk_vcodec_ctx *ctx)
+{
+	int cap_format_count = 0, out_format_count = 0;
+
+	if (num_formats && num_framesizes)
+		return;
+
+	if (ctx->dev->dec_capability & MTK_VDEC_FORMAT_MM21) {
+		mtk_vcodec_add_formats(V4L2_PIX_FMT_MM21, ctx);
+		cap_format_count++;
+	}
+	if (ctx->dev->dec_capability & MTK_VDEC_FORMAT_H264_SLICE) {
+		mtk_vcodec_add_formats(V4L2_PIX_FMT_H264_SLICE, ctx);
+		out_format_count++;
+	}
+
+	if (cap_format_count)
+		default_cap_format = mtk_video_formats[cap_format_count - 1];
+	if (out_format_count)
+		default_out_format =
+			mtk_video_formats[cap_format_count + out_format_count - 1];
+}
+
 static void mtk_init_vdec_params(struct mtk_vcodec_ctx *ctx)
 {
 	struct vb2_queue *src_vq;
@@ -330,6 +375,11 @@ static void mtk_init_vdec_params(struct mtk_vcodec_ctx *ctx)
 	src_vq = v4l2_m2m_get_vq(ctx->m2m_ctx,
 				 V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 
+	if (!ctx->dev->vdec_pdata->is_subdev_supported)
+		ctx->dev->dec_capability |=
+			MTK_VDEC_FORMAT_H264_SLICE | MTK_VDEC_FORMAT_MM21;
+	mtk_vcodec_get_supported_formats(ctx);
+
 	/* Support request api for output plane */
 	src_vq->supports_requests = true;
 	src_vq->requires_requests = true;
@@ -363,11 +413,11 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
 	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
 	.vdec_vb2_ops = &mtk_vdec_request_vb2_ops,
 	.vdec_formats = mtk_video_formats,
-	.num_formats = &num_supported_formats,
-	.default_out_fmt = &mtk_video_formats[DEFAULT_OUT_FMT_IDX],
-	.default_cap_fmt = &mtk_video_formats[DEFAULT_CAP_FMT_IDX],
+	.num_formats = &num_formats,
+	.default_out_fmt = &default_out_format,
+	.default_cap_fmt = &default_cap_format,
 	.vdec_framesizes = mtk_vdec_framesizes,
-	.num_framesizes = &num_supported_framesize,
+	.num_framesizes = &num_framesizes,
 	.uses_stateless_api = true,
 	.worker = mtk_vdec_worker,
 	.flush_decoder = mtk_vdec_flush_decoder,
@@ -383,11 +433,11 @@ const struct mtk_vcodec_dec_pdata mtk_lat_sig_core_pdata = {
 	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
 	.vdec_vb2_ops = &mtk_vdec_request_vb2_ops,
 	.vdec_formats = mtk_video_formats,
-	.num_formats = &num_supported_formats,
-	.default_out_fmt = &mtk_video_formats[DEFAULT_OUT_FMT_IDX],
-	.default_cap_fmt = &mtk_video_formats[DEFAULT_CAP_FMT_IDX],
+	.num_formats = &num_formats,
+	.default_out_fmt = &default_out_format,
+	.default_cap_fmt = &default_cap_format,
 	.vdec_framesizes = mtk_vdec_framesizes,
-	.num_framesizes = &num_supported_framesize,
+	.num_framesizes = &num_framesizes,
 	.uses_stateless_api = true,
 	.worker = mtk_vdec_worker,
 	.flush_decoder = mtk_vdec_flush_decoder,
-- 
2.18.0

