Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1F644E58
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 23:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726944AbfFMVZa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 17:25:30 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:37552 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfFMVZa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jun 2019 17:25:30 -0400
Received: by mail-qt1-f196.google.com with SMTP id y57so144711qtk.4;
        Thu, 13 Jun 2019 14:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pwPeTWWoYFYFIhYmi6aZL5cgp0+9f5aFv7IECLWMUt0=;
        b=SIhQH6Ki1JUGg/+7YQtk1lh0aLzT+GDe6VyzE4Z5iiWIWmZ8Ms08vBQwfvRs1D4RBo
         qkN8xcwYXnbhGTh1dk+20uxUxgh1PhoAB3CwfyP8pmCW5JSUmdUkaM52c/pU8ANvCVln
         Z/ecSK0e4h+fDUDfbd5OrWHBRO2aklJiGjp2WYqT+Y2OEdzVzsOvHEDlR6zS8N16MS7d
         RROyDoGJnEyNOy5PHZVb3LDUNfmeLyMSGiaLJcUy8OjvXNmT8l1f/LnfkZxwm8RV7ipr
         mnF7vwfknsZ2P4IYGYUv6BFs3fQgXsNq6Vq/u6uGjltFDgolKL1ab2e7Zvli58KXDYN2
         18ew==
X-Gm-Message-State: APjAAAUQb+9RbAH2Q8bIbBCP2jSF3Rb8/XqxX30CIyrjgG8I4DZfPl2h
        6IKa3AKaiPLBv9SpH0GfyQ==
X-Google-Smtp-Source: APXvYqym+4r9cTrTMVSWS00ZJWIUja2MNF8G5k+B4Zqzp4a7yrEhwGp41zWVhrP3vxtOGKU5I9ZF2w==
X-Received: by 2002:ac8:28bc:: with SMTP id i57mr45628479qti.288.1560461128360;
        Thu, 13 Jun 2019 14:25:28 -0700 (PDT)
Received: from localhost ([64.188.179.243])
        by smtp.gmail.com with ESMTPSA id g53sm436943qtk.65.2019.06.13.14.25.27
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 14:25:27 -0700 (PDT)
Date:   Thu, 13 Jun 2019 15:25:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Daoyuan Huang <daoyuan.huang@mediatek.com>
Cc:     hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com,
        tfiga@chromium.org, matthias.bgg@gmail.com, mchehab@kernel.org,
        yuzhao@chromium.org, zwisler@chromium.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, Sean.Cheng@mediatek.com,
        sj.huang@mediatek.com, christie.yu@mediatek.com,
        holmes.chiou@mediatek.com, frederic.chen@mediatek.com,
        Jerry-ch.Chen@mediatek.com, jungo.lin@mediatek.com,
        Rynn.Wu@mediatek.com, linux-media@vger.kernel.org,
        srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
Subject: Re: [RFC v2 1/4] dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
Message-ID: <20190613212525.GA6235@bogus>
References: <20190516032332.56844-1-daoyuan.huang@mediatek.com>
 <20190516032332.56844-2-daoyuan.huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190516032332.56844-2-daoyuan.huang@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 16, 2019 at 11:23:29AM +0800, Daoyuan Huang wrote:
> From: daoyuan huang <daoyuan.huang@mediatek.com>
> 
> This patch adds DT binding document for Media Data Path 3 (MDP3)
> a unit in multimedia system used for scaling and color format convert.
> 
> Signed-off-by: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> Signed-off-by: daoyuan huang <daoyuan.huang@mediatek.com>
> ---
>  .../bindings/media/mediatek,mt8183-mdp3.txt   | 217 ++++++++++++++++++
>  1 file changed, 217 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8183-mdp3.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8183-mdp3.txt b/Documentation/devicetree/bindings/media/mediatek,mt8183-mdp3.txt
> new file mode 100644
> index 000000000000..cf3e808b7146
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8183-mdp3.txt
> @@ -0,0 +1,217 @@
> +* Mediatek Media Data Path 3
> +
> +Media Data Path 3 (MDP3) is used for scaling and color space conversion.
> +
> +Required properties (controller node):
> +- compatible: "mediatek,mt8183-mdp"
> +- mediatek,scp: the node of system control processor (SCP), using the
> +  remoteproc & rpmsg framework, see
> +  Documentation/devicetree/bindings/remoteproc/mtk,scp.txt for details.
> +- mediatek,mmsys: the node of mux(multiplexer) controller for HW connections.
> +- mediatek,mm-mutex: the node of sof(start of frame) signal controller.
> +- mediatek,mailbox-gce: the node of global command engine (GCE), used to
> +  read/write registers with critical time limitation, see
> +  Documentation/devicetree/bindings/mailbox/mtk-gce.txt for details.
> +- mboxes: mailbox number used to communicate with GCE.
> +- gce-subsys: sub-system id corresponding to the register address.
> +- gce-event-names: in use event name list, used to correspond to event IDs.
> +- gce-events: in use event IDs list, all IDs are defined in
> +  'dt-bindings/gce/mt8183-gce.h'.
> +
> +Required properties (all function blocks, child node):
> +- compatible: Should be one of
> +        "mediatek,mt8183-mdp-rdma"  - read DMA
> +        "mediatek,mt8183-mdp-rsz"   - resizer
> +        "mediatek,mt8183-mdp-wdma"  - write DMA
> +        "mediatek,mt8183-mdp-wrot"  - write DMA with rotation
> +        "mediatek,mt8183-mdp-ccorr" - color correction with 3X3 matrix
> +- reg: Physical base address and length of the function block register space
> +- clocks: device clocks, see
> +  Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
> +- power-domains: a phandle to the power domain, see
> +  Documentation/devicetree/bindings/power/power_domain.txt for details.
> +- mediatek,mdp-id: HW index to distinguish same functionality modules.
> +
> +Required properties (DMA function blocks, child node):
> +- compatible: Should be one of
> +        "mediatek,mt8183-mdp-rdma"
> +        "mediatek,mt8183-mdp-wdma"
> +        "mediatek,mt8183-mdp-wrot"
> +- iommus: should point to the respective IOMMU block with master port as
> +  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> +  for details.
> +- mediatek,larb: must contain the local arbiters in the current Socs, see
> +  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
> +  for details.
> +
> +Required properties (input path selection node):
> +- compatible:
> +        "mediatek,mt8183-mdp-dl"    - MDP direct link input source selection
> +- reg: Physical base address and length of the function block register space
> +- clocks: device clocks, see
> +  Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
> +- mediatek,mdp-id: HW index to distinguish same functionality modules.
> +
> +Required properties (ISP PASS2 (DIP) module path selection node):
> +- compatible:
> +        "mediatek,mt8183-mdp-imgi"  - input DMA of ISP PASS2 (DIP) module for raw image input
> +- reg: Physical base address and length of the function block register space
> +- mediatek,mdp-id: HW index to distinguish same functionality modules.
> +
> +Required properties (SW node):
> +- compatible: Should be one of
> +        "mediatek,mt8183-mdp-exto"  - output DMA of ISP PASS2 (DIP) module for yuv image output
> +        "mediatek,mt8183-mdp-path"  - MDP output path selection
> +- mediatek,mdp-id: HW index to distinguish same functionality modules.
> +
> +Example:
> +		mdp_camin@14000000 {

s/_/-/ in node names

> +			compatible = "mediatek,mt8183-mdp-dl";
> +			mediatek,mdp-id = <0>;
> +			reg = <0 0x14000000 0 0x1000>;
> +			clocks = <&mmsys CLK_MM_MDP_DL_TXCK>,
> +				<&mmsys CLK_MM_MDP_DL_RX>;
> +		};
> +
> +		mdp_camin2@14000000 {
> +			compatible = "mediatek,mt8183-mdp-dl";
> +			mediatek,mdp-id = <1>;
> +			reg = <0 0x14000000 0 0x1000>;

You've got 2 nodes at the same address. You can't do that.

Build your dtb with W=1 and dtc will warn on this. And fix any other 
warnings you get.

> +			clocks = <&mmsys CLK_MM_IPU_DL_TXCK>,
> +				<&mmsys CLK_MM_IPU_DL_RX>;
> +		};
> +
> +		mdp_rdma0: mdp_rdma0@14001000 {
> +			compatible = "mediatek,mt8183-mdp-rdma", "mediatek,mt8183-mdp3";
> +			mediatek,scp = <&scp>;
> +			mediatek,mdp-id = <0>;
> +			reg = <0 0x14001000 0 0x1000>;
> +			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_MDP_RDMA0>,
> +				<&mmsys CLK_MM_MDP_RSZ1>;
> +			iommus = <&iommu M4U_PORT_MDP_RDMA0>;
> +			mediatek,larb = <&larb0>;
> +			mediatek,mmsys = <&mmsys>;
> +			mediatek,mm-mutex = <&mutex>;
> +			mediatek,mailbox-gce = <&gce>;
> +			mboxes = <&gce 20 0 CMDQ_THR_PRIO_LOWEST>,
> +				<&gce 21 0 CMDQ_THR_PRIO_LOWEST>,
> +				<&gce 22 0 CMDQ_THR_PRIO_LOWEST>,
> +				<&gce 23 0 CMDQ_THR_PRIO_LOWEST>;
> +			gce-subsys = <&gce 0x14000000 SUBSYS_1400XXXX>,
> +				<&gce 0x14010000 SUBSYS_1401XXXX>,
> +				<&gce 0x14020000 SUBSYS_1402XXXX>,
> +				<&gce 0x15020000 SUBSYS_1502XXXX>;
> +			gce-event-names = "rdma0_sof",
> +				"rsz0_sof",
> +				"rsz1_sof",
> +				"tdshp0_sof",
> +				"wrot0_sof",
> +				"wdma0_sof",
> +				"rdma0_done",
> +				"wrot0_done",
> +				"wdma0_done",
> +				"isp_p2_0_done",
> +				"isp_p2_1_done",
> +				"isp_p2_2_done",
> +				"isp_p2_3_done",
> +				"isp_p2_4_done",
> +				"isp_p2_5_done",
> +				"isp_p2_6_done",
> +				"isp_p2_7_done",
> +				"isp_p2_8_done",
> +				"isp_p2_9_done",
> +				"isp_p2_10_done",
> +				"isp_p2_11_done",
> +				"isp_p2_12_done",
> +				"isp_p2_13_done",
> +				"isp_p2_14_done",
> +				"wpe_done",
> +				"wpe_b_done";
> +			gce-events = <&gce CMDQ_EVENT_MDP_RDMA0_SOF>,
> +				<&gce CMDQ_EVENT_MDP_RSZ0_SOF>,
> +				<&gce CMDQ_EVENT_MDP_RSZ1_SOF>,
> +				<&gce CMDQ_EVENT_MDP_TDSHP_SOF>,
> +				<&gce CMDQ_EVENT_MDP_WROT0_SOF>,
> +				<&gce CMDQ_EVENT_MDP_WDMA0_SOF>,
> +				<&gce CMDQ_EVENT_MDP_RDMA0_EOF>,
> +				<&gce CMDQ_EVENT_MDP_WROT0_EOF>,
> +				<&gce CMDQ_EVENT_MDP_WDMA0_EOF>,
> +				<&gce CMDQ_EVENT_ISP_FRAME_DONE_P2_0>,
> +				<&gce CMDQ_EVENT_ISP_FRAME_DONE_P2_1>,
> +				<&gce CMDQ_EVENT_ISP_FRAME_DONE_P2_2>,
> +				<&gce CMDQ_EVENT_ISP_FRAME_DONE_P2_3>,
> +				<&gce CMDQ_EVENT_ISP_FRAME_DONE_P2_4>,
> +				<&gce CMDQ_EVENT_ISP_FRAME_DONE_P2_5>,
> +				<&gce CMDQ_EVENT_ISP_FRAME_DONE_P2_6>,
> +				<&gce CMDQ_EVENT_ISP_FRAME_DONE_P2_7>,
> +				<&gce CMDQ_EVENT_ISP_FRAME_DONE_P2_8>,
> +				<&gce CMDQ_EVENT_ISP_FRAME_DONE_P2_9>,
> +				<&gce CMDQ_EVENT_ISP_FRAME_DONE_P2_10>,
> +				<&gce CMDQ_EVENT_ISP_FRAME_DONE_P2_11>,
> +				<&gce CMDQ_EVENT_ISP_FRAME_DONE_P2_12>,
> +				<&gce CMDQ_EVENT_ISP_FRAME_DONE_P2_13>,
> +				<&gce CMDQ_EVENT_ISP_FRAME_DONE_P2_14>,
> +				<&gce CMDQ_EVENT_WPE_A_DONE>,
> +				<&gce CMDQ_EVENT_SPE_B_DONE>;
> +		};
> +
> +		mdp_imgi@15020000 {
> +			compatible = "mediatek,mt8183-mdp-imgi";
> +			mediatek,mdp-id = <0>;
> +			reg = <0 0x15020000 0 0x1000>;
> +		};
> +
> +		mdp_img2o@15020000 {
> +			compatible = "mediatek,mt8183-mdp-exto";
> +			mediatek,mdp-id = <1>;

Missing reg? Again, looks like 2 nodes at the same address.

> +		};
> +
> +		mdp_rsz0: mdp_rsz0@14003000 {
> +			compatible = "mediatek,mt8183-mdp-rsz";
> +			mediatek,mdp-id = <0>;
> +			reg = <0 0x14003000 0 0x1000>;
> +			clocks = <&mmsys CLK_MM_MDP_RSZ0>;
> +		};
> +
> +		mdp_rsz1: mdp_rsz1@14004000 {
> +			compatible = "mediatek,mt8183-mdp-rsz";
> +			mediatek,mdp-id = <1>;
> +			reg = <0 0x14004000 0 0x1000>;
> +			clocks = <&mmsys CLK_MM_MDP_RSZ1>;
> +		};
> +
> +		mdp_wrot0: mdp_wrot0@14005000 {
> +			compatible = "mediatek,mt8183-mdp-wrot";
> +			mediatek,mdp-id = <0>;
> +			reg = <0 0x14005000 0 0x1000>;
> +			clocks = <&mmsys CLK_MM_MDP_WROT0>;
> +			iommus = <&iommu M4U_PORT_MDP_WROT0>;
> +			mediatek,larb = <&larb0>;
> +		};
> +
> +		mdp_path0_sout@14005000 {
> +			compatible = "mediatek,mt8183-mdp-path";
> +			mediatek,mdp-id = <0>;

Missing reg? Again, looks like 2 nodes at the same address.

> +		};
> +
> +		mdp_wdma: mdp_wdma@14006000 {
> +			compatible = "mediatek,mt8183-mdp-wdma";
> +			mediatek,mdp-id = <0>;
> +			reg = <0 0x14006000 0 0x1000>;
> +			clocks = <&mmsys CLK_MM_MDP_WDMA0>;
> +			iommus = <&iommu M4U_PORT_MDP_WDMA0>;
> +			mediatek,larb = <&larb0>;
> +		};
> +
> +		mdp_path1_sout@14006000 {
> +			compatible = "mediatek,mt8183-mdp-path";
> +			mediatek,mdp-id = <1>;
> +		};
> +
> +		mdp_ccorr: mdp_ccorr@1401c000 {
> +			compatible = "mediatek,mt8183-mdp-ccorr";
> +			mediatek,mdp-id = <0>;
> +			reg = <0 0x1401c000 0 0x1000>;
> +			clocks = <&mmsys CLK_MM_MDP_CCORR>;
> +		};
> -- 
> 2.18.0
> 
