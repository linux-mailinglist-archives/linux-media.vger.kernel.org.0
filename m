Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B44F64FEDE4
	for <lists+linux-media@lfdr.de>; Wed, 13 Apr 2022 05:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232135AbiDMD5D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Apr 2022 23:57:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232123AbiDMD4t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Apr 2022 23:56:49 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13F3662EB;
        Tue, 12 Apr 2022 20:54:27 -0700 (PDT)
X-UUID: c80a6648214d48a4b4a5a94561bae101-20220413
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4,REQID:239001d8-e1c8-4bf9-9c3c-a93feee27325,OB:0,LO
        B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
        ON:release,TS:0
X-CID-META: VersionHash:faefae9,CLOUDID:87e9f8a8-d103-4e36-82b9-b0e86991b3df,C
        OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: c80a6648214d48a4b4a5a94561bae101-20220413
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1656252812; Wed, 13 Apr 2022 11:54:24 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Wed, 13 Apr 2022 11:54:22 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 13 Apr
 2022 11:54:21 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 13 Apr 2022 11:54:19 +0800
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
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4, 5/7] media: mediatek: vcodec: Different codec using different capture format
Date:   Wed, 13 Apr 2022 11:54:08 +0800
Message-ID: <20220413035410.29568-6-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220413035410.29568-1-yunfei.dong@mediatek.com>
References: <20220413035410.29568-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Vp8 need to use MM21, but vp9 and h264 need to use HyFbc mode
for mt8195. Vp8/vp9/h264 use the same MM21 format for mt8192.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../platform/mediatek/vcodec/mtk_vcodec_dec.c | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
index 3859e4c651c6..d0f2dedcc911 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
@@ -35,6 +35,44 @@ mtk_vdec_find_format(struct v4l2_format *f,
 	return NULL;
 }
 
+static bool mtk_vdec_get_cap_fmt(struct mtk_vcodec_ctx *ctx, int format_index)
+{
+	const struct mtk_vcodec_dec_pdata *dec_pdata = ctx->dev->vdec_pdata;
+	const struct mtk_video_fmt *fmt;
+	struct mtk_q_data *q_data;
+	int num_frame_count = 0, i;
+	bool ret = true;
+
+	for (i = 0; i < *dec_pdata->num_formats; i++) {
+		if (dec_pdata->vdec_formats[i].type != MTK_FMT_FRAME)
+			continue;
+
+		num_frame_count++;
+	}
+
+	if (num_frame_count == 1)
+		return true;
+
+	fmt = &dec_pdata->vdec_formats[format_index];
+	q_data = &ctx->q_data[MTK_Q_DATA_SRC];
+	switch (q_data->fmt->fourcc) {
+	case V4L2_PIX_FMT_VP8_FRAME:
+		if (fmt->fourcc == V4L2_PIX_FMT_MM21)
+			ret = true;
+		break;
+	case V4L2_PIX_FMT_H264_SLICE:
+	case V4L2_PIX_FMT_VP9_FRAME:
+		if (fmt->fourcc == V4L2_PIX_FMT_MM21)
+			ret = false;
+		break;
+	default:
+		ret = true;
+		break;
+	};
+
+	return ret;
+}
+
 static struct mtk_q_data *mtk_vdec_get_q_data(struct mtk_vcodec_ctx *ctx,
 					      enum v4l2_buf_type type)
 {
@@ -577,6 +615,9 @@ static int vidioc_enum_fmt(struct v4l2_fmtdesc *f, void *priv,
 		    dec_pdata->vdec_formats[i].type != MTK_FMT_FRAME)
 			continue;
 
+		if (!output_queue && !mtk_vdec_get_cap_fmt(ctx, i))
+			continue;
+
 		if (j == f->index)
 			break;
 		++j;
-- 
2.18.0

