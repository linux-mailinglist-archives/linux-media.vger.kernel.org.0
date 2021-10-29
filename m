Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2B5243F5A6
	for <lists+linux-media@lfdr.de>; Fri, 29 Oct 2021 05:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231815AbhJ2D6M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Oct 2021 23:58:12 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:41394 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231777AbhJ2D6K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Oct 2021 23:58:10 -0400
X-UUID: e9d22bbfc6f64768b2e41961ba383c73-20211029
X-UUID: e9d22bbfc6f64768b2e41961ba383c73-20211029
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1206013765; Fri, 29 Oct 2021 11:55:38 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Oct 2021 11:55:37 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs10n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 29 Oct 2021 11:55:36 +0800
From:   Yunfei Dong <yunfei.dong@mediatek.com>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>
CC:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.corp-partner.google.com>
Subject: [PATCH v8, 05/17] media: mtk-vcodec: Support MT8192
Date:   Fri, 29 Oct 2021 11:55:15 +0800
Message-ID: <20211029035527.454-6-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029035527.454-1-yunfei.dong@mediatek.com>
References: <20211029035527.454-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Yunfei Dong <yunfei.dong@mediatek.corp-partner.google.com>

Adds MT8192's compatible "mediatek,mt8192-vcodec-dec".
Adds MT8192's device private data mtk_lat_sig_core_pdata.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
v8: add patch to support 8192
---
 .../media/platform/mtk-vcodec/mtk_vcodec_dec.h   |  1 +
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c     |  4 ++++
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c        | 16 ++++++++++++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
index 46783516b84a..e30806c1faea 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
@@ -67,6 +67,7 @@ extern const struct v4l2_m2m_ops mtk_vdec_m2m_ops;
 extern const struct media_device_ops mtk_vcodec_media_ops;
 extern const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata;
 extern const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata;
+extern const struct mtk_vcodec_dec_pdata mtk_lat_sig_core_pdata;
 
 
 /*
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 3ac4c3935e4e..b7a51e96d4ba 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -393,6 +393,10 @@ static const struct of_device_id mtk_vcodec_match[] = {
 		.compatible = "mediatek,mt8183-vcodec-dec",
 		.data = &mtk_vdec_8183_pdata,
 	},
+	{
+		.compatible = "mediatek,mt8192-vcodec-dec",
+		.data = &mtk_lat_sig_core_pdata,
+	},
 	{},
 };
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
index 8f4a1f0a0769..26e4d6f4ec04 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
@@ -358,3 +358,19 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
 	.worker = mtk_vdec_worker,
 	.flush_decoder = mtk_vdec_flush_decoder,
 };
+
+const struct mtk_vcodec_dec_pdata mtk_lat_sig_core_pdata = {
+	.chip = MTK_MT8192,
+	.init_vdec_params = mtk_init_vdec_params,
+	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
+	.vdec_vb2_ops = &mtk_vdec_request_vb2_ops,
+	.vdec_formats = mtk_video_formats,
+	.num_formats = NUM_FORMATS,
+	.default_out_fmt = &mtk_video_formats[DEFAULT_OUT_FMT_IDX],
+	.default_cap_fmt = &mtk_video_formats[DEFAULT_CAP_FMT_IDX],
+	.vdec_framesizes = mtk_vdec_framesizes,
+	.num_framesizes = NUM_SUPPORTED_FRAMESIZE,
+	.uses_stateless_api = true,
+	.worker = mtk_vdec_worker,
+	.flush_decoder = mtk_vdec_flush_decoder,
+};
-- 
2.25.1

