Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62D762FE296
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 07:20:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbhAUGTi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 01:19:38 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:44647 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727036AbhAUGTL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 01:19:11 -0500
X-UUID: 9b1b27e1bc9944ceaab791692b99a727-20210121
X-UUID: 9b1b27e1bc9944ceaab791692b99a727-20210121
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1829408630; Thu, 21 Jan 2021 14:18:09 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Jan 2021 14:18:07 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 21 Jan 2021 14:18:06 +0800
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
        Yunfei Dong <yunfei.dong@mediatek.com>
CC:     Irui Wang <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/3] dt-bindings: media: mtk-vcodec: Separating mtk vcodec encoder node
Date:   Thu, 21 Jan 2021 14:18:02 +0800
Message-ID: <20210121061804.26423-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Updates binding document since the avc and vp8 hardware encoder in
MT8173 are now separated. Separate "mediatek,mt8173-vcodec-enc" to
"mediatek,mt8173-vcodec-vp8-enc" and "mediatek,mt8173-vcodec-avc-enc".

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Signed-off-by: Maoguang Meng <maoguang.meng@mediatek.com>
Signed-off-by: Irui Wang <irui.wang@mediatek.com>

---
 .../bindings/media/mediatek-vcodec.txt        | 58 ++++++++++---------
 1 file changed, 31 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
index 8217424fd4bd..f85276e629bf 100644
--- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
@@ -4,7 +4,9 @@ Mediatek Video Codec is the video codec hw present in Mediatek SoCs which
 supports high resolution encoding and decoding functionalities.
 
 Required properties:
-- compatible : "mediatek,mt8173-vcodec-enc" for MT8173 encoder
+- compatible : must be one of the following string:
+  "mediatek,mt8173-vcodec-vp8-enc" for mt8173 vp8 encoder.
+  "mediatek,mt8173-vcodec-avc-enc" for mt8173 avc encoder.
   "mediatek,mt8183-vcodec-enc" for MT8183 encoder.
   "mediatek,mt8173-vcodec-dec" for MT8173 decoder.
 - reg : Physical base address of the video codec registers and length of
@@ -13,10 +15,11 @@ Required properties:
 - mediatek,larb : must contain the local arbiters in the current Socs.
 - clocks : list of clock specifiers, corresponding to entries in
   the clock-names property.
-- clock-names: encoder must contain "venc_sel_src", "venc_sel",,
-  "venc_lt_sel_src", "venc_lt_sel", decoder must contain "vcodecpll",
-  "univpll_d2", "clk_cci400_sel", "vdec_sel", "vdecpll", "vencpll",
-  "venc_lt_sel", "vdec_bus_clk_src".
+- clock-names:
+   avc venc must contain "venc_sel";
+   vp8 venc must contain "venc_lt_sel";
+   decoder  must contain "vcodecpll", "univpll_d2", "clk_cci400_sel",
+   "vdec_sel", "vdecpll", "vencpll", "venc_lt_sel", "vdec_bus_clk_src".
 - iommus : should point to the respective IOMMU block with master port as
   argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
   for details.
@@ -80,14 +83,10 @@ vcodec_dec: vcodec@16000000 {
     assigned-clock-rates = <0>, <0>, <0>, <1482000000>, <800000000>;
   };
 
-  vcodec_enc: vcodec@18002000 {
-    compatible = "mediatek,mt8173-vcodec-enc";
-    reg = <0 0x18002000 0 0x1000>,    /*VENC_SYS*/
-          <0 0x19002000 0 0x1000>;    /*VENC_LT_SYS*/
-    interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>,
-		 <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
-    mediatek,larb = <&larb3>,
-		    <&larb5>;
+vcodec_enc: vcodec@18002000 {
+    compatible = "mediatek,mt8173-vcodec-avc-enc";
+    reg = <0 0x18002000 0 0x1000>;
+    interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
     iommus = <&iommu M4U_PORT_VENC_RCPU>,
              <&iommu M4U_PORT_VENC_REC>,
              <&iommu M4U_PORT_VENC_BSDMA>,
@@ -98,8 +97,20 @@ vcodec_dec: vcodec@16000000 {
              <&iommu M4U_PORT_VENC_REF_LUMA>,
              <&iommu M4U_PORT_VENC_REF_CHROMA>,
              <&iommu M4U_PORT_VENC_NBM_RDMA>,
-             <&iommu M4U_PORT_VENC_NBM_WDMA>,
-             <&iommu M4U_PORT_VENC_RCPU_SET2>,
+             <&iommu M4U_PORT_VENC_NBM_WDMA>;
+    mediatek,larb = <&larb3>;
+    mediatek,vpu = <&vpu>;
+    clocks = <&topckgen CLK_TOP_VENC_SEL>;
+    clock-names = "venc_sel";
+    assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
+    assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL>;
+  };
+
+vcodec_enc_lt: vcodec@19002000 {
+    compatible = "mediatek,mt8173-vcodec-vp8-enc";
+    reg =  <0 0x19002000 0 0x1000>;	/* VENC_LT_SYS */
+    interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
+    iommus = <&iommu M4U_PORT_VENC_RCPU_SET2>,
              <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
              <&iommu M4U_PORT_VENC_BSDMA_SET2>,
              <&iommu M4U_PORT_VENC_SV_COMA_SET2>,
@@ -108,17 +119,10 @@ vcodec_dec: vcodec@16000000 {
              <&iommu M4U_PORT_VENC_CUR_CHROMA_SET2>,
              <&iommu M4U_PORT_VENC_REF_LUMA_SET2>,
              <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
+    mediatek,larb = <&larb5>;
     mediatek,vpu = <&vpu>;
-    clocks = <&topckgen CLK_TOP_VENCPLL_D2>,
-             <&topckgen CLK_TOP_VENC_SEL>,
-             <&topckgen CLK_TOP_UNIVPLL1_D2>,
-             <&topckgen CLK_TOP_VENC_LT_SEL>;
-    clock-names = "venc_sel_src",
-                  "venc_sel",
-                  "venc_lt_sel_src",
-                  "venc_lt_sel";
-    assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>,
-                      <&topckgen CLK_TOP_VENC_LT_SEL>;
-    assigned-clock-parents = <&topckgen CLK_TOP_VENCPLL_D2>,
-                             <&topckgen CLK_TOP_UNIVPLL1_D2>;
+    clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
+    clock-names = "venc_lt_sel";
+    assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
+    assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL_370P5>;
   };
-- 
2.18.0

