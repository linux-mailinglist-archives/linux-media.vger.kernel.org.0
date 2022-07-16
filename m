Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEBB0576CE1
	for <lists+linux-media@lfdr.de>; Sat, 16 Jul 2022 11:34:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232254AbiGPJe2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 Jul 2022 05:34:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231651AbiGPJe0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 Jul 2022 05:34:26 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C0D024945;
        Sat, 16 Jul 2022 02:34:22 -0700 (PDT)
X-UUID: 90bfbc433e4c4c21a2e8833febf01589-20220716
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:a7759f4b-efca-407c-87f7-aebe051f42fe,OB:0,LO
        B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,RULE:Release_Ham,AC
        TION:release,TS:105
X-CID-INFO: VERSION:1.1.8,REQID:a7759f4b-efca-407c-87f7-aebe051f42fe,OB:0,LOB:
        0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,RULE:Spam_GS981B3D,AC
        TION:quarantine,TS:105
X-CID-META: VersionHash:0f94e32,CLOUDID:9d8b7464-0b3f-4b2c-b3a6-ed5c044366a0,C
        OID:82ba7e9e45b5,Recheck:0,SF:28|16|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:1,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 90bfbc433e4c4c21a2e8833febf01589-20220716
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 303772488; Sat, 16 Jul 2022 17:34:15 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sat, 16 Jul 2022 17:34:14 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Sat, 16 Jul 2022 17:34:13 +0800
From:   Irui Wang <irui.wang@mediatek.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        <angelogioacchino.delregno@collabora.com>,
        <nicolas.dufresne@collabora.com>, <wenst@chromium.org>,
        kyrie wu <kyrie.wu@mediatek.com>
CC:     <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Tomasz Figa <tfiga@chromium.org>, <xia.jiang@mediatek.com>,
        <maoguang.meng@mediatek.com>, <srv_heupstream@mediatek.com>,
        irui wang <irui.wang@mediatek.com>
Subject: [V5,2/8] media: mtk-jpegdec: export jpeg decoder functions
Date:   Sat, 16 Jul 2022 17:34:02 +0800
Message-ID: <20220716093408.29734-3-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220716093408.29734-1-irui.wang@mediatek.com>
References: <20220716093408.29734-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: kyrie wu <kyrie.wu@mediatek.com>

mtk jpeg decoder is built as a module, export some functions to make them
visible by other modules.

Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
Signed-off-by: irui wang <irui.wang@mediatek.com>

---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
index 1e3852295f2f..d2f25f43e852 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
@@ -189,6 +189,7 @@ int mtk_jpeg_dec_fill_param(struct mtk_jpeg_dec_param *param)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_jpeg_dec_fill_param);
 
 u32 mtk_jpeg_dec_get_int_status(void __iomem *base)
 {
@@ -200,6 +201,7 @@ u32 mtk_jpeg_dec_get_int_status(void __iomem *base)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(mtk_jpeg_dec_get_int_status);
 
 u32 mtk_jpeg_dec_enum_result(u32 irq_result)
 {
@@ -216,11 +218,13 @@ u32 mtk_jpeg_dec_enum_result(u32 irq_result)
 
 	return MTK_JPEG_DEC_RESULT_ERROR_UNKNOWN;
 }
+EXPORT_SYMBOL_GPL(mtk_jpeg_dec_enum_result);
 
 void mtk_jpeg_dec_start(void __iomem *base)
 {
 	writel(0, base + JPGDEC_REG_TRIG);
 }
+EXPORT_SYMBOL_GPL(mtk_jpeg_dec_start);
 
 static void mtk_jpeg_dec_soft_reset(void __iomem *base)
 {
@@ -240,6 +244,7 @@ void mtk_jpeg_dec_reset(void __iomem *base)
 	mtk_jpeg_dec_soft_reset(base);
 	mtk_jpeg_dec_hard_reset(base);
 }
+EXPORT_SYMBOL_GPL(mtk_jpeg_dec_reset);
 
 static void mtk_jpeg_dec_set_brz_factor(void __iomem *base, u8 yscale_w,
 					u8 yscale_h, u8 uvscale_w, u8 uvscale_h)
@@ -408,3 +413,4 @@ void mtk_jpeg_dec_set_config(void __iomem *base,
 				   config->dma_last_mcu);
 	mtk_jpeg_dec_set_pause_mcu_idx(base, config->total_mcu);
 }
+EXPORT_SYMBOL_GPL(mtk_jpeg_dec_set_config);
-- 
2.18.0

