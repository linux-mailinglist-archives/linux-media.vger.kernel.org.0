Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21A11460D7D
	for <lists+linux-media@lfdr.de>; Mon, 29 Nov 2021 04:44:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376918AbhK2DrY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Nov 2021 22:47:24 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:57246 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1348702AbhK2DpY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Nov 2021 22:45:24 -0500
X-UUID: c213228f80c84c4082de79aea647833f-20211129
X-UUID: c213228f80c84c4082de79aea647833f-20211129
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 59910171; Mon, 29 Nov 2021 11:42:05 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Mon, 29 Nov 2021 11:42:03 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas10.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Mon, 29 Nov 2021 11:42:02 +0800
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
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v11, 00/19] Support multi hardware decode using of_platform_populate
Date:   Mon, 29 Nov 2021 11:41:42 +0800
Message-ID: <20211129034201.5767-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds support for multi hardware decode into mtk-vcodec, by first adding use
of_platform_populate to manage each hardware information: interrupt, clock, register
bases and power. Secondly add core work queue to deal with core hardware message,
at the same time, add msg queue for different hardware share messages. Lastly, the
architecture of different specs are not the same, using specs type to separate them.

This series has been tested with both MT8183 and MT8173. Decoding was working for both chips.

Patches 1~3 rewrite get register bases and power on/off interface.
Patches 4 export decoder pm interfaces.
Patches 5 add to support 8192.
Patch 6 support multi hardware.
Patch 7 separate video encoder and decoder document
Patch 8-17 add interfaces to support core hardware.
Patch 18-19 remove mtk_vcodec_release_dec/enc_pm interfaces.
---
changes compared with v9:
- fix comments from tzung-bi for patch 06/19.
- add more detail information for hardware block diagram 15/19

changes compared with v9:
- need not to build ko, just export pm interfaces for patch 04/19.
- fix comments for patch 06/19

changes compared with v8:
- add new patch 18~19 to remove mtk_vcodec_release_de/enc_pm interfaces.
- fix spelling mistakes for patch 17/19
- fix yaml comments for patch 15/19

Changes compared with v7:
- add new patch 4 to build decoder pm file as module
- add new patch 5 to support 8192
- fix comments for patch 6/17
- change some logic for using work queue instead of create thread for core hardware decode for patch 10/17
- using work queue for hardware decode instead of create thread for patch 13/17
- add returen value for patch 14/17
- fix yaml check fail 15/17

Changes compared with v6:
- Use of_platform_populate to manage multi hardware, not component framework for patch 4/15
- Re-write dtsi document for hardware architecture changed for patch 13/15 -The dtsi will write like below in patch 13/15:
    vcodec_dec: vcodec_dec@16000000 {
        compatible = "mediatek,mt8192-vcodec-dec";
        #address-cells = <2>;
        #size-cells = <2>;
        ranges;
        reg = <0 0x16000000 0 0x1000>;		/* VDEC_SYS */
        mediatek,scp = <&scp>;
        iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
        dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
        vcodec_lat {
            compatible = "mediatek,mtk-vcodec-lat";
            reg = <0 0x16010000 0 0x800>;		/* VDEC_MISC */
            reg-name = "reg-misc";
            interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
            iommus = <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD_EXT>,
                 <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD2_EXT>,
                 <&iommu0 M4U_PORT_L5_VDEC_LAT0_AVC_MV_EXT>,
                 <&iommu0 M4U_PORT_L5_VDEC_LAT0_PRED_RD_EXT>,
                 <&iommu0 M4U_PORT_L5_VDEC_LAT0_TILE_EXT>,
                 <&iommu0 M4U_PORT_L5_VDEC_LAT0_WDMA_EXT>,
                 <&iommu0 M4U_PORT_L5_VDEC_LAT0_RG_CTRL_DMA_EXT>,
                 <&iommu0 M4U_PORT_L5_VDEC_UFO_ENC_EXT>;
            clocks = <&topckgen CLK_TOP_VDEC_SEL>,
                 <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
                 <&vdecsys_soc CLK_VDEC_SOC_LAT>,
                 <&vdecsys_soc CLK_VDEC_SOC_LARB1>,
                 <&topckgen CLK_TOP_MAINPLL_D4>;
            clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat",
                  "vdec-vdec", "vdec-top";
            assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
            assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
            power-domains = <&spm MT8192_POWER_DOMAIN_VDEC>;
        };

        vcodec_core {
            compatible = "mediatek,mtk-vcodec-core";
            reg = <0 0x16025000 0 0x1000>;		/* VDEC_CORE_MISC */
            reg-names = "reg-misc";
            interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
            iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>,
                 <&iommu0 M4U_PORT_L4_VDEC_UFO_EXT>,
                 <&iommu0 M4U_PORT_L4_VDEC_PP_EXT>,
                 <&iommu0 M4U_PORT_L4_VDEC_PRED_RD_EXT>,
                 <&iommu0 M4U_PORT_L4_VDEC_PRED_WR_EXT>,
                 <&iommu0 M4U_PORT_L4_VDEC_PPWRAP_EXT>,
                 <&iommu0 M4U_PORT_L4_VDEC_TILE_EXT>,
                 <&iommu0 M4U_PORT_L4_VDEC_VLD_EXT>,
                 <&iommu0 M4U_PORT_L4_VDEC_VLD2_EXT>,
                 <&iommu0 M4U_PORT_L4_VDEC_AVC_MV_EXT>,
                 <&iommu0 M4U_PORT_L4_VDEC_RG_CTRL_DMA_EXT>;
            clocks = <&topckgen CLK_TOP_VDEC_SEL>,
                 <&vdecsys CLK_VDEC_VDEC>,
                 <&vdecsys CLK_VDEC_LAT>,
                 <&vdecsys CLK_VDEC_LARB1>,
                 <&topckgen CLK_TOP_MAINPLL_D4>;
            clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat",
                  "vdec-vdec", "vdec-top";
            assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
            assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
            power-domains = <&spm MT8192_POWER_DOMAIN_VDEC2>;
        };
    };

Changes compared with v5:
- Add decoder hardware block diagram for patch 13/15

Changes compared with v4:
- Fix comments for patch 4/15
  >> +     if (dev->is_comp_supported) {
  >> +             ret = mtk_vcodec_init_master(dev);
  >> +             if (ret < 0)
  >> +                     goto err_component_match;
  >> +     } else {
  >> +             platform_set_drvdata(pdev, dev);
  >> +     }
  Fix platform_set_drvdata.
- Fix build error for patch 9/15
- Add depend patch in case of error header file for patch 13/15

Changes compared with v3:
- Fix return value for patch 1/15
- Fix comments for patch 4/15
  > Looking up "mediatek,mtk-vcodec-core" to determine if it uses component framwork sounds like...
  Add prameter in pdata, for all platform will use compoent after mt8183

  >> +     if (dev->is_comp_supported) {
  >> +             ret = mtk_vcodec_init_master(dev);
  >> +             if (ret < 0)
  >> +                     goto err_component_match;
  >> +     } else {
  >> +             platform_set_drvdata(pdev, dev);
  >> +     }
  > + Has asked the same question in [1].  Why it removes the
  > +platform_set_drvdata() above?  mtk_vcodec_init_master() also calls platform_set_drvdata().
  Must call component_master_add_with_match after platform_set_drvdata for component architecture.
- Fix yaml files check fail for patch 5/15
- Fix yaml file check fail for patch 14/15

Changes compared with v1:
- Fix many comments for patch 3/14
- Remove unnecessary code for patch 4/14
- Using enum mtk_vdec_hw_count instead of magic numbers for patch 6/14
- Reconstructed get/put lat buffer for lat and core hardware for patch 7/14
- Using yaml format to instead of txt file for patch 12/14

Yunfei Dong (19):
  media: mtk-vcodec: Get numbers of register bases from DT
  media: mtk-vcodec: Align vcodec wake up interrupt interface
  media: mtk-vcodec: Refactor vcodec pm interface
  media: mtk-vcodec: export decoder pm functions
  media: mtk-vcodec: Support MT8192
  media: mtk-vcodec: Add to support multi hardware decode
  dt-bindings: media: mtk-vcodec: Separate video encoder and decoder
    dt-bindings
  media: mtk-vcodec: Use pure single core for MT8183
  media: mtk-vcodec: Add irq interface for multi hardware
  media: mtk-vcodec: Add msg queue feature for lat and core architecture
  media: mtk-vcodec: Generalize power and clock on/off interfaces
  media: mtk-vcodec: Add new interface to lock different hardware
  media: mtk-vcodec: Add work queue for core hardware decode
  media: mtk-vcodec: Support 34bits dma address for vdec
  dt-bindings: media: mtk-vcodec: Adds decoder dt-bindings for mt8192
  media: mtk-vcodec: Add core dec and dec end ipi msg
  media: mtk-vcodec: Use codec type to separate different hardware
  media: mtk-vcodec: Remove mtk_vcodec_release_dec_pm
  media: mtk-vcodec: Remove mtk_vcodec_release_enc_pm

 .../media/mediatek,vcodec-decoder.yaml        | 176 +++++++++++
 .../media/mediatek,vcodec-encoder.yaml        | 187 ++++++++++++
 .../media/mediatek,vcodec-subdev-decoder.yaml | 266 ++++++++++++++++
 .../bindings/media/mediatek-vcodec.txt        | 131 --------
 drivers/media/platform/mtk-vcodec/Makefile    |   6 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      |   4 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec.h      |   1 +
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 206 ++++++++++---
 .../platform/mtk-vcodec/mtk_vcodec_dec_hw.c   | 175 +++++++++++
 .../platform/mtk-vcodec/mtk_vcodec_dec_hw.h   |  55 ++++
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 104 +++++--
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.h   |  12 +-
 .../mtk-vcodec/mtk_vcodec_dec_stateful.c      |   2 +
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c     |  20 ++
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  71 ++++-
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  21 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   |  10 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.h   |   3 +-
 .../platform/mtk-vcodec/mtk_vcodec_intr.c     |  27 +-
 .../platform/mtk-vcodec/mtk_vcodec_intr.h     |   4 +-
 .../platform/mtk-vcodec/mtk_vcodec_util.c     |  60 +++-
 .../platform/mtk-vcodec/mtk_vcodec_util.h     |   8 +-
 .../platform/mtk-vcodec/vdec/vdec_h264_if.c   |   2 +-
 .../mtk-vcodec/vdec/vdec_h264_req_if.c        |   2 +-
 .../platform/mtk-vcodec/vdec/vdec_vp8_if.c    |   2 +-
 .../platform/mtk-vcodec/vdec/vdec_vp9_if.c    |   2 +-
 .../media/platform/mtk-vcodec/vdec_drv_if.c   |  21 +-
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |  16 +-
 .../platform/mtk-vcodec/vdec_msg_queue.c      | 286 ++++++++++++++++++
 .../platform/mtk-vcodec/vdec_msg_queue.h      | 148 +++++++++
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  46 ++-
 .../media/platform/mtk-vcodec/vdec_vpu_if.h   |  22 ++
 .../platform/mtk-vcodec/venc/venc_h264_if.c   |   2 +-
 .../platform/mtk-vcodec/venc/venc_vp8_if.c    |   2 +-
 34 files changed, 1805 insertions(+), 295 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec.txt
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec_msg_queue.h

-- 
2.25.1

