Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D00CC48C1F3
	for <lists+linux-media@lfdr.de>; Wed, 12 Jan 2022 11:07:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352317AbiALKHh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jan 2022 05:07:37 -0500
Received: from ewsoutbound.kpnmail.nl ([195.121.94.168]:12722 "EHLO
        ewsoutbound.kpnmail.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352280AbiALKHg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jan 2022 05:07:36 -0500
X-KPN-MessageId: 5e5d1dae-738f-11ec-8862-005056aba152
Received: from smtp.kpnmail.nl (unknown [10.31.155.38])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id 5e5d1dae-738f-11ec-8862-005056aba152;
        Wed, 12 Jan 2022 11:06:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:from:to:subject:mime-version:date:message-id;
        bh=wIA0JQDAoXszNARnEAdzwHJWxxC9RrgmPfNrnGawQLs=;
        b=YtVBPdSsoK8l89GCULva3pmj4pLa5Ja8bKJYypw9Qfg1CTcVEx7TXk1iqGek/J9l6BN/fv8GCnV8F
         dIk6mU1NKglS3Xs/6YhhV9G5zMBPNpsdKiY+OTYZnJVzEDfYB7rj6xLVYC7X0GNlSQ5RXBWGEAGxFf
         rVHeKh/GH5a/G52WrhIwVK+734iMYshXUhe+AChsS6rvYTR56RZspppssv36zjmVhM4sChLnInx6PO
         gZYltgKOHsURYLXFrU1MrIsqBaWEzRrwCcV7hiFApZLqN9cYuZju3fRGVmKw9LCosgl7cVQhwd1yGv
         TClEiwTmE9kQp7M+QCX8Ayb5o2AEvZg==
X-KPN-VerifiedSender: No
X-CMASSUN: 33|sYhIEHB9bXnlHxbf2RC1UZJUH3YtrsGPP43X5OsFuUuNUKajKZgjGrNLnW7vqAm
 aGRQdFCaA2jumjRVxQ9+FyQ==
X-Originating-IP: 193.91.129.219
Received: from [192.168.2.10] (cdb815bc1.dhcp.as2116.net [193.91.129.219])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id 760e7922-738f-11ec-94d2-005056abf0db;
        Wed, 12 Jan 2022 11:07:34 +0100 (CET)
Message-ID: <3e1ec445-e91e-e285-7f33-78c7379711d6@xs4all.nl>
Date:   Wed, 12 Jan 2022 11:07:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [PATCH v18, 00/19] Support multi hardware decode using
 of_platform_populate
Content-Language: en-US
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>
Cc:     George Sun <george.sun@mediatek.com>,
        Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
        Irui Wang <irui.wang@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-media@vger.kernel.org
References: <20220112094923.16839-1-yunfei.dong@mediatek.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220112094923.16839-1-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/01/2022 10:49, Yunfei Dong wrote:
> This series adds support for multi hardware decode into mtk-vcodec, by first adding use
> of_platform_populate to manage each hardware information: interrupt, clock, register
> bases and power. Secondly add core work queue to deal with core hardware message,
> at the same time, add msg queue for different hardware share messages. Lastly, the
> architecture of different specs are not the same, using specs type to separate them.
> 
> This series has been tested with both MT8183 and MT8173. Decoding was working for both chips.
> 
> Patches 1~3 rewrite get register bases and power on/off interface.
> Patches 4 export decoder pm interfaces.
> Patches 5 add to support 8192.
> Patch 6 support multi hardware.
> Patch 7 separate video encoder and decoder document
> Patch 8-17 add interfaces to support core hardware.
> Patch 18-19 remove mtk_vcodec_release_dec/enc_pm interfaces.
> ---
> changes compared with v17:
> - fix checkpatch fail.

I still get a whole load of checkpatch 'WARNING' and 'CHECK' messages.

Did you forget the --strict option to checkpatch?

But even without that I get warnings like this:

0018-media-mtk-vcodec-Remove-mtk_vcodec_release_dec_pm.patch
------------------------------------------------------------
WARNING: Co-developed-by: must be immediately followed by Signed-off-by:
#14:
Co-developed-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
total: 0 errors, 1 warnings, 105 lines checked

Regards,

	Hans

> - fix kernel-doc fail
> - fix smatch fail.
> 
> changes compared with v16:
> - fix build warning for patch 13.
> 
> changes compared with v15:
> - add Reviewed-by for patch 10.
> 
> changes compared with v14:
> - rebase to latest media stage.
> 
> changes compared with v13:
> - change some function position in case of ko dependency for patch 15.
> - add reviewed-by for patch 06/13/15.
> 
> changes compared with v12:
> - fix comments from rob for patch 15.
> - fix comments from steve for 06 and 13.
> 
> changes compared with v11:
> - fix comments from AngeloGioacchino for patch 09~11/19.
> - fix comments from steve for patch 03/19.
> 
> changes compared with v10:
> - fix comments from tzung-bi for patch 06/19.
> - add more detail information for hardware block diagram 15/19
> 
> changes compared with v9:
> - need not to build ko, just export pm interfaces for patch 04/19.
> - fix comments for patch 06/19
> 
> changes compared with v8:
> - add new patch 18~19 to remove mtk_vcodec_release_de/enc_pm interfaces.
> - fix spelling mistakes for patch 17/19
> - fix yaml comments for patch 15/19
> 
> Changes compared with v7:
> - add new patch 4 to build decoder pm file as module
> - add new patch 5 to support 8192
> - fix comments for patch 6/17
> - change some logic for using work queue instead of create thread for core hardware decode for patch 10/17
> - using work queue for hardware decode instead of create thread for patch 13/17
> - add returen value for patch 14/17
> - fix yaml check fail 15/17
> 
> Changes compared with v6:
> - Use of_platform_populate to manage multi hardware, not component framework for patch 4/15
> - Re-write dtsi document for hardware architecture changed for patch 13/15 -The dtsi will write like below in patch 13/15:
>     vcodec_dec: vcodec_dec@16000000 {
>         compatible = "mediatek,mt8192-vcodec-dec";
>         #address-cells = <2>;
>         #size-cells = <2>;
>         ranges;
>         reg = <0 0x16000000 0 0x1000>;		/* VDEC_SYS */
>         mediatek,scp = <&scp>;
>         iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
>         dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
>         vcodec_lat {
>             compatible = "mediatek,mtk-vcodec-lat";
>             reg = <0 0x16010000 0 0x800>;		/* VDEC_MISC */
>             reg-name = "reg-misc";
>             interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
>             iommus = <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD_EXT>,
>                  <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD2_EXT>,
>                  <&iommu0 M4U_PORT_L5_VDEC_LAT0_AVC_MV_EXT>,
>                  <&iommu0 M4U_PORT_L5_VDEC_LAT0_PRED_RD_EXT>,
>                  <&iommu0 M4U_PORT_L5_VDEC_LAT0_TILE_EXT>,
>                  <&iommu0 M4U_PORT_L5_VDEC_LAT0_WDMA_EXT>,
>                  <&iommu0 M4U_PORT_L5_VDEC_LAT0_RG_CTRL_DMA_EXT>,
>                  <&iommu0 M4U_PORT_L5_VDEC_UFO_ENC_EXT>;
>             clocks = <&topckgen CLK_TOP_VDEC_SEL>,
>                  <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
>                  <&vdecsys_soc CLK_VDEC_SOC_LAT>,
>                  <&vdecsys_soc CLK_VDEC_SOC_LARB1>,
>                  <&topckgen CLK_TOP_MAINPLL_D4>;
>             clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat",
>                   "vdec-vdec", "vdec-top";
>             assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
>             assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
>             power-domains = <&spm MT8192_POWER_DOMAIN_VDEC>;
>         };
> 
>         vcodec_core {
>             compatible = "mediatek,mtk-vcodec-core";
>             reg = <0 0x16025000 0 0x1000>;		/* VDEC_CORE_MISC */
>             reg-names = "reg-misc";
>             interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
>             iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>,
>                  <&iommu0 M4U_PORT_L4_VDEC_UFO_EXT>,
>                  <&iommu0 M4U_PORT_L4_VDEC_PP_EXT>,
>                  <&iommu0 M4U_PORT_L4_VDEC_PRED_RD_EXT>,
>                  <&iommu0 M4U_PORT_L4_VDEC_PRED_WR_EXT>,
>                  <&iommu0 M4U_PORT_L4_VDEC_PPWRAP_EXT>,
>                  <&iommu0 M4U_PORT_L4_VDEC_TILE_EXT>,
>                  <&iommu0 M4U_PORT_L4_VDEC_VLD_EXT>,
>                  <&iommu0 M4U_PORT_L4_VDEC_VLD2_EXT>,
>                  <&iommu0 M4U_PORT_L4_VDEC_AVC_MV_EXT>,
>                  <&iommu0 M4U_PORT_L4_VDEC_RG_CTRL_DMA_EXT>;
>             clocks = <&topckgen CLK_TOP_VDEC_SEL>,
>                  <&vdecsys CLK_VDEC_VDEC>,
>                  <&vdecsys CLK_VDEC_LAT>,
>                  <&vdecsys CLK_VDEC_LARB1>,
>                  <&topckgen CLK_TOP_MAINPLL_D4>;
>             clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat",
>                   "vdec-vdec", "vdec-top";
>             assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
>             assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
>             power-domains = <&spm MT8192_POWER_DOMAIN_VDEC2>;
>         };
>     };
> 
> Changes compared with v5:
> - Add decoder hardware block diagram for patch 13/15
> 
> Changes compared with v4:
> - Fix comments for patch 4/15
>   >> +     if (dev->is_comp_supported) {
>   >> +             ret = mtk_vcodec_init_master(dev);
>   >> +             if (ret < 0)
>   >> +                     goto err_component_match;
>   >> +     } else {
>   >> +             platform_set_drvdata(pdev, dev);
>   >> +     }
>   Fix platform_set_drvdata.
> - Fix build error for patch 9/15
> - Add depend patch in case of error header file for patch 13/15
> 
> Changes compared with v3:
> - Fix return value for patch 1/15
> - Fix comments for patch 4/15
>   > Looking up "mediatek,mtk-vcodec-core" to determine if it uses component framwork sounds like...
>   Add prameter in pdata, for all platform will use compoent after mt8183
> 
>   >> +     if (dev->is_comp_supported) {
>   >> +             ret = mtk_vcodec_init_master(dev);
>   >> +             if (ret < 0)
>   >> +                     goto err_component_match;
>   >> +     } else {
>   >> +             platform_set_drvdata(pdev, dev);
>   >> +     }
>   > + Has asked the same question in [1].  Why it removes the
>   > +platform_set_drvdata() above?  mtk_vcodec_init_master() also calls platform_set_drvdata().
>   Must call component_master_add_with_match after platform_set_drvdata for component architecture.
> - Fix yaml files check fail for patch 5/15
> - Fix yaml file check fail for patch 14/15
> 
> Changes compared with v1:
> - Fix many comments for patch 3/14
> - Remove unnecessary code for patch 4/14
> - Using enum mtk_vdec_hw_count instead of magic numbers for patch 6/14
> - Reconstructed get/put lat buffer for lat and core hardware for patch 7/14
> - Using yaml format to instead of txt file for patch 12/14
> 
> Yunfei Dong (19):
>   media: mtk-vcodec: Get numbers of register bases from DT
>   media: mtk-vcodec: Align vcodec wake up interrupt interface
>   media: mtk-vcodec: Refactor vcodec pm interface
>   media: mtk-vcodec: export decoder pm functions
>   media: mtk-vcodec: Support MT8192
>   media: mtk-vcodec: Add to support multi hardware decode
>   dt-bindings: media: mtk-vcodec: Separate video encoder and decoder
>     dt-bindings
>   media: mtk-vcodec: Use pure single core for MT8183
>   media: mtk-vcodec: Add irq interface for multi hardware
>   media: mtk-vcodec: Add msg queue feature for lat and core architecture
>   media: mtk-vcodec: Generalize power and clock on/off interfaces
>   media: mtk-vcodec: Add new interface to lock different hardware
>   media: mtk-vcodec: Add work queue for core hardware decode
>   media: mtk-vcodec: Support 34bits dma address for vdec
>   dt-bindings: media: mtk-vcodec: Adds decoder dt-bindings for mt8192
>   media: mtk-vcodec: Add core dec and dec end ipi msg
>   media: mtk-vcodec: Use codec type to separate different hardware
>   media: mtk-vcodec: Remove mtk_vcodec_release_dec_pm
>   media: mtk-vcodec: Remove mtk_vcodec_release_enc_pm
> 
>  .../media/mediatek,vcodec-decoder.yaml        | 176 +++++++++++
>  .../media/mediatek,vcodec-encoder.yaml        | 187 ++++++++++++
>  .../media/mediatek,vcodec-subdev-decoder.yaml | 265 ++++++++++++++++
>  .../bindings/media/mediatek-vcodec.txt        | 131 --------
>  drivers/media/platform/mtk-vcodec/Makefile    |   6 +-
>  .../platform/mtk-vcodec/mtk_vcodec_dec.c      |   4 +-
>  .../platform/mtk-vcodec/mtk_vcodec_dec.h      |   1 +
>  .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 177 ++++++++---
>  .../platform/mtk-vcodec/mtk_vcodec_dec_hw.c   | 201 ++++++++++++
>  .../platform/mtk-vcodec/mtk_vcodec_dec_hw.h   |  56 ++++
>  .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 106 +++++--
>  .../platform/mtk-vcodec/mtk_vcodec_dec_pm.h   |  12 +-
>  .../mtk-vcodec/mtk_vcodec_dec_stateful.c      |   2 +
>  .../mtk-vcodec/mtk_vcodec_dec_stateless.c     |  21 ++
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  73 ++++-
>  .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  21 +-
>  .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   |  10 +-
>  .../platform/mtk-vcodec/mtk_vcodec_enc_pm.h   |   3 +-
>  .../platform/mtk-vcodec/mtk_vcodec_intr.c     |  27 +-
>  .../platform/mtk-vcodec/mtk_vcodec_intr.h     |   4 +-
>  .../platform/mtk-vcodec/mtk_vcodec_util.c     |  59 +++-
>  .../platform/mtk-vcodec/mtk_vcodec_util.h     |   8 +-
>  .../platform/mtk-vcodec/vdec/vdec_h264_if.c   |   2 +-
>  .../mtk-vcodec/vdec/vdec_h264_req_if.c        |   2 +-
>  .../platform/mtk-vcodec/vdec/vdec_vp8_if.c    |   2 +-
>  .../platform/mtk-vcodec/vdec/vdec_vp9_if.c    |   2 +-
>  .../media/platform/mtk-vcodec/vdec_drv_if.c   |  21 +-
>  .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |  16 +-
>  .../platform/mtk-vcodec/vdec_msg_queue.c      | 289 ++++++++++++++++++
>  .../platform/mtk-vcodec/vdec_msg_queue.h      | 151 +++++++++
>  .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  46 ++-
>  .../media/platform/mtk-vcodec/vdec_vpu_if.h   |  22 ++
>  .../platform/mtk-vcodec/venc/venc_h264_if.c   |   2 +-
>  .../platform/mtk-vcodec/venc/venc_vp8_if.c    |   2 +-
>  34 files changed, 1812 insertions(+), 295 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec.txt
>  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
>  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
>  create mode 100644 drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
>  create mode 100644 drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
> 

