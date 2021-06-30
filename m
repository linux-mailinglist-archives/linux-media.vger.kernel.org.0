Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8DC43B7F6F
	for <lists+linux-media@lfdr.de>; Wed, 30 Jun 2021 10:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233690AbhF3I5i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Jun 2021 04:57:38 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:55081 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S233442AbhF3I5h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Jun 2021 04:57:37 -0400
X-UUID: ff3354f5fc0b4bc3829834d708b10193-20210630
X-UUID: ff3354f5fc0b4bc3829834d708b10193-20210630
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1218654307; Wed, 30 Jun 2021 16:52:55 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 16:52:53 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Jun 2021 16:52:52 +0800
From:   Irui Wang <irui.wang@mediatek.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>
CC:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Fritz Koenig <frkoenig@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 1/3] media: mtk-vcodec: Clean redundant encoder format definition
Date:   Wed, 30 Jun 2021 16:52:45 +0800
Message-ID: <20210630085247.27554-2-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210630085247.27554-1-irui.wang@mediatek.com>
References: <20210630085247.27554-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The supported capture/output formats don't depend on models,
clean redundant definitions and nameing with type instead.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  | 50 ++++++++-----------
 1 file changed, 20 insertions(+), 30 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index 45d1870c83dd..4489a9744cd7 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -26,7 +26,7 @@
 module_param(mtk_v4l2_dbg_level, int, S_IRUGO | S_IWUSR);
 module_param(mtk_vcodec_dbg, bool, S_IRUGO | S_IWUSR);
 
-static const struct mtk_video_fmt mtk_video_formats_output_mt8173[] = {
+static const struct mtk_video_fmt mtk_video_formats_output[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_NV12M,
 		.type = MTK_FMT_FRAME,
@@ -49,7 +49,7 @@ static const struct mtk_video_fmt mtk_video_formats_output_mt8173[] = {
 	},
 };
 
-static const struct mtk_video_fmt mtk_video_formats_capture_mt8173_avc[] =  {
+static const struct mtk_video_fmt mtk_video_formats_capture_h264[] =  {
 	{
 		.fourcc = V4L2_PIX_FMT_H264,
 		.type = MTK_FMT_ENC,
@@ -57,7 +57,7 @@ static const struct mtk_video_fmt mtk_video_formats_capture_mt8173_avc[] =  {
 	},
 };
 
-static const struct mtk_video_fmt mtk_video_formats_capture_mt8173_vp8[] =  {
+static const struct mtk_video_fmt mtk_video_formats_capture_vp8[] =  {
 	{
 		.fourcc = V4L2_PIX_FMT_VP8,
 		.type = MTK_FMT_ENC,
@@ -65,14 +65,6 @@ static const struct mtk_video_fmt mtk_video_formats_capture_mt8173_vp8[] =  {
 	},
 };
 
-static const struct mtk_video_fmt mtk_video_formats_capture_mt8183[] =  {
-	{
-		.fourcc = V4L2_PIX_FMT_H264,
-		.type = MTK_FMT_ENC,
-		.num_planes = 1,
-	},
-};
-
 /* Wake up context wait_queue */
 static void wake_up_ctx(struct mtk_vcodec_ctx *ctx, unsigned int reason)
 {
@@ -392,10 +384,10 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 
 static const struct mtk_vcodec_enc_pdata mt8173_avc_pdata = {
 	.chip = MTK_MT8173,
-	.capture_formats = mtk_video_formats_capture_mt8173_avc,
-	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_mt8173_avc),
-	.output_formats = mtk_video_formats_output_mt8173,
-	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output_mt8173),
+	.capture_formats = mtk_video_formats_capture_h264,
+	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
+	.output_formats = mtk_video_formats_output,
+	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output),
 	.min_bitrate = 1,
 	.max_bitrate = 4000000,
 	.core_id = VENC_SYS,
@@ -403,10 +395,10 @@ static const struct mtk_vcodec_enc_pdata mt8173_avc_pdata = {
 
 static const struct mtk_vcodec_enc_pdata mt8173_vp8_pdata = {
 	.chip = MTK_MT8173,
-	.capture_formats = mtk_video_formats_capture_mt8173_vp8,
-	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_mt8173_vp8),
-	.output_formats = mtk_video_formats_output_mt8173,
-	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output_mt8173),
+	.capture_formats = mtk_video_formats_capture_vp8,
+	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_vp8),
+	.output_formats = mtk_video_formats_output,
+	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output),
 	.min_bitrate = 64,
 	.max_bitrate = 4000000,
 	.core_id = VENC_LT_SYS,
@@ -415,11 +407,10 @@ static const struct mtk_vcodec_enc_pdata mt8173_vp8_pdata = {
 static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
 	.chip = MTK_MT8183,
 	.uses_ext = true,
-	.capture_formats = mtk_video_formats_capture_mt8183,
-	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_mt8183),
-	/* MT8183 supports the same output formats as MT8173 */
-	.output_formats = mtk_video_formats_output_mt8173,
-	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output_mt8173),
+	.capture_formats = mtk_video_formats_capture_h264,
+	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
+	.output_formats = mtk_video_formats_output,
+	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output),
 	.min_bitrate = 64,
 	.max_bitrate = 40000000,
 	.core_id = VENC_SYS,
@@ -428,16 +419,15 @@ static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
 static const struct mtk_vcodec_enc_pdata mt8192_pdata = {
 	.chip = MTK_MT8192,
 	.uses_ext = true,
-	/* MT8192 supports the same capture formats as MT8183 */
-	.capture_formats = mtk_video_formats_capture_mt8183,
-	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_mt8183),
-	/* MT8192 supports the same output formats as MT8173 */
-	.output_formats = mtk_video_formats_output_mt8173,
-	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output_mt8173),
+	.capture_formats = mtk_video_formats_capture_h264,
+	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
+	.output_formats = mtk_video_formats_output,
+	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output),
 	.min_bitrate = 64,
 	.max_bitrate = 100000000,
 	.core_id = VENC_SYS,
 };
+
 static const struct of_device_id mtk_vcodec_enc_match[] = {
 	{.compatible = "mediatek,mt8173-vcodec-enc",
 			.data = &mt8173_avc_pdata},
-- 
2.18.0

