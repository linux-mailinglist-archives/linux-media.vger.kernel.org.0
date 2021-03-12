Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE9973386F1
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 08:57:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232030AbhCLH4c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 02:56:32 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:56555 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231690AbhCLH4F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 02:56:05 -0500
X-UUID: 4acb5c40dd684ba0a0c4c2b0d4fe31b8-20210312
X-UUID: 4acb5c40dd684ba0a0c4c2b0d4fe31b8-20210312
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1666184384; Fri, 12 Mar 2021 15:55:57 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Mar 2021 15:55:55 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 12 Mar 2021 15:55:54 +0800
From:   Irui Wang <irui.wang@mediatek.com>
To:     Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>, <yong.wu@mediatek.com>
CC:     Irui Wang <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2,4/5] media: mtk-vcodec: Add MT8192 H264 venc driver
Date:   Fri, 12 Mar 2021 15:55:41 +0800
Message-ID: <20210312075542.5503-5-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210312075542.5503-1-irui.wang@mediatek.com>
References: <20210312075542.5503-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add MT8192 venc driver's compatible and device private data.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../media/platform/mtk-vcodec/mtk_vcodec_drv.h    |  1 +
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c      | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 869d958d2b99..39e78aa670a3 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -302,6 +302,7 @@ struct mtk_vcodec_ctx {
 enum mtk_chip {
 	MTK_MT8173,
 	MTK_MT8183,
+	MTK_MT8192,
 };
 
 /**
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index 26b089e81213..981299a44c4a 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -425,12 +425,27 @@ static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
 	.core_id = VENC_SYS,
 };
 
+static const struct mtk_vcodec_enc_pdata mt8192_pdata = {
+	.chip = MTK_MT8192,
+	.uses_ext = true,
+	/* MT8192 supports the same capture formats as MT8183*/
+	.capture_formats = mtk_video_formats_capture_mt8183,
+	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_mt8183),
+	/* MT8192 supports the same output formats as MT8173 */
+	.output_formats = mtk_video_formats_output_mt8173,
+	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output_mt8173),
+	.min_bitrate = 64,
+	.max_bitrate = 100000000,
+	.core_id = VENC_SYS,
+};
+
 static const struct of_device_id mtk_vcodec_enc_match[] = {
 	{.compatible = "mediatek,mt8173-vcodec-enc",
 			.data = &mt8173_avc_pdata},
 	{.compatible = "mediatek,mt8173-vcodec-enc-vp8",
 			.data = &mt8173_vp8_pdata},
 	{.compatible = "mediatek,mt8183-vcodec-enc", .data = &mt8183_pdata},
+	{.compatible = "mediatek,mt8192-vcodec-enc", .data = &mt8192_pdata},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_vcodec_enc_match);
-- 
2.18.0

