Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF36E30D56E
	for <lists+linux-media@lfdr.de>; Wed,  3 Feb 2021 09:40:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232967AbhBCIjj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Feb 2021 03:39:39 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:53953 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232949AbhBCIjb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Feb 2021 03:39:31 -0500
X-UUID: d86ab703ba6c4f02b062ab686072fe31-20210203
X-UUID: d86ab703ba6c4f02b062ab686072fe31-20210203
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1878262360; Wed, 03 Feb 2021 16:38:47 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Feb 2021 16:38:03 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 3 Feb 2021 16:38:03 +0800
From:   Irui Wang <irui.wang@mediatek.com>
To:     Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Fritz Koenig <frkoenig@chromium.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>
CC:     Maoguang Meng <maoguang.meng@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Irui Wang <irui.wang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 3/5] dt-bindings: media: mtk-vcodec: Add binding for MT8192 VENC
Date:   Wed, 3 Feb 2021 16:37:50 +0800
Message-ID: <20210203083752.12586-4-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210203083752.12586-1-irui.wang@mediatek.com>
References: <20210203083752.12586-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Updates binding document for mt8192 encoder driver.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../bindings/media/mediatek-vcodec.txt        | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
index e4644f8caee9..c7fac557006f 100644
--- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
@@ -9,6 +9,7 @@ Required properties:
   "mediatek,mt8173-vcodec-avc-enc" for mt8173 avc encoder.
   "mediatek,mt8183-vcodec-enc" for MT8183 encoder.
   "mediatek,mt8173-vcodec-dec" for MT8173 decoder.
+  "mediatek,mt8192-vcodec-enc" for MT8192 encoder.
 - reg : Physical base address of the video codec registers and length of
   memory mapped region.
 - interrupts : interrupt number to the cpu.
@@ -128,3 +129,28 @@ vcodec_enc_lt: vcodec@19002000 {
     assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
     assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL_370P5>;
   };
+
+vcodec_enc: vcodec@0x17020000 {
+    compatible = "mediatek,mt8192-vcodec-enc";
+    reg = <0 0x17020000 0 0x2000>;
+    iommus = <&iommu0 M4U_PORT_L7_VENC_RCPU>,
+             <&iommu0 M4U_PORT_L7_VENC_REC>,
+             <&iommu0 M4U_PORT_L7_VENC_BSDMA>,
+             <&iommu0 M4U_PORT_L7_VENC_SV_COMV>,
+             <&iommu0 M4U_PORT_L7_VENC_RD_COMV>,
+             <&iommu0 M4U_PORT_L7_VENC_CUR_LUMA>,
+             <&iommu0 M4U_PORT_L7_VENC_CUR_CHROMA>,
+             <&iommu0 M4U_PORT_L7_VENC_REF_LUMA>,
+             <&iommu0 M4U_PORT_L7_VENC_REF_CHROMA>,
+             <&iommu0 M4U_PORT_L7_VENC_SUB_R_LUMA>,
+             <&iommu0 M4U_PORT_L7_VENC_SUB_W_LUMA>;
+    interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH 0>;
+    dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
+    mediatek,scp = <&scp>;
+    power-domains = <&scpsys MT8192_POWER_DOMAIN_VENC>;
+    clocks = <&vencsys CLK_VENC_SET1_VENC>;
+    clock-names = "venc-set1";
+    assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
+    assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D4>;
+};
+
-- 
2.25.1

