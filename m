Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C557BB9ABA
	for <lists+linux-media@lfdr.de>; Sat, 21 Sep 2019 01:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437058AbfITXaz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Sep 2019 19:30:55 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33028 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404972AbfITXaz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Sep 2019 19:30:55 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ACB032F9;
        Sat, 21 Sep 2019 01:30:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1569022251;
        bh=RZAv6t1HDBJx8+GXuL4a8GG/MLE/yBiOrDBlPfyn46g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CDdGwhbD2sNE4DULnISJRdn0z6Ed/PjaX+0RLsZfIuu8zLp0el958seM98a1ZXJPM
         3MExTQSFMt3niqrfD0awAJ/lYo8u92kNUgqGMN4PufvSTuLqgv8eBXvXtkv1cw+0na
         bc/X8u/Aw8vrQfNyJfzm/edv++C3VpjWJHnSziGs=
Date:   Sat, 21 Sep 2019 02:30:42 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>
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
        Daoyuan.Huang@mediatek.com,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
Subject: Re: [RFC, v3, 1/4] dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
Message-ID: <20190920233042.GI12672@pendragon.ideasonboard.com>
References: <20190911093406.5688-1-bibby.hsieh@mediatek.com>
 <20190911093406.5688-2-bibby.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190911093406.5688-2-bibby.hsieh@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bibby,

Thank you for the patch.

On Wed, Sep 11, 2019 at 05:34:03PM +0800, Bibby Hsieh wrote:
> From: daoyuan huang <daoyuan.huang@mediatek.com>
> 
> This patch adds DT binding document for Media Data Path 3 (MDP3)
> a unit in multimedia system used for scaling and color format convert.
> 
> Signed-off-by: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> Signed-off-by: daoyuan huang <daoyuan.huang@mediatek.com>
> ---
>  .../bindings/media/mediatek,mt8183-mdp3.txt   | 201 ++++++++++++++++++
>  1 file changed, 201 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8183-mdp3.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8183-mdp3.txt b/Documentation/devicetree/bindings/media/mediatek,mt8183-mdp3.txt
> new file mode 100644
> index 000000000000..0d15326d12c1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8183-mdp3.txt
> @@ -0,0 +1,201 @@
> +* Mediatek Media Data Path 3
> +
> +Media Data Path 3 (MDP3) is used for scaling and color space conversion.
> +
> +Required properties (controller node):
> +- compatible: "mediatek,mt8183-mdp"

This compatible string isn't used in the example below nor in any other
patch within this series. Did you mean "mediatek,mt8183-mdp3" ?

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

Do all these nodes really describe separate IP cores ? This looks
extremely complicated to model something as simple as a scaler and color
space converter. It feels like you're trying to model in DT the
individual sub-blocks from the MDP3, while a single DT node to model the
MDP3 as a whole could be enough.

> +
> +Example:
> +		mdp_camin@14000000 {
> +			compatible = "mediatek,mt8183-mdp-dl";
> +			mediatek,mdp-id = <0>;
> +			reg = <0 0x14000000 0 0x1000>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
> +			clocks = <&mmsys CLK_MM_MDP_DL_TXCK>,
> +				<&mmsys CLK_MM_MDP_DL_RX>;
> +		};
> +
> +		mdp_camin2@14000000 {
> +			compatible = "mediatek,mt8183-mdp-dl";
> +			mediatek,mdp-id = <1>;
> +			reg = <0 0x14000000 0 0x1000>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
> +			clocks = <&mmsys CLK_MM_IPU_DL_TXCK>,
> +				<&mmsys CLK_MM_IPU_DL_RX>;
> +		};
> +
> +		mdp_rdma0: mdp_rdma0@14001000 {
> +			compatible = "mediatek,mt8183-mdp-rdma",
> +				     "mediatek,mt8183-mdp3";
> +			mediatek,scp = <&scp>;
> +			mediatek,mdp-id = <0>;
> +			reg = <0 0x14001000 0 0x1000>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x1000 0x1000>;
> +			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_MDP_RDMA0>,
> +				<&mmsys CLK_MM_MDP_RSZ1>;
> +			iommus = <&iommu M4U_PORT_MDP_RDMA0>;
> +			mediatek,larb = <&larb0>;
> +			mediatek,mmsys = <&mmsys>;
> +			mediatek,mm-mutex = <&mutex>;
> +			mediatek,mailbox-gce = <&gce>;
> +			mboxes = <&gce 20 CMDQ_THR_PRIO_LOWEST 0>,
> +				<&gce 21 CMDQ_THR_PRIO_LOWEST 0>,
> +				<&gce 22 CMDQ_THR_PRIO_LOWEST 0>,
> +				<&gce 23 CMDQ_THR_PRIO_LOWEST 0>;
> +			gce-subsys = <&gce 0x14000000 SUBSYS_1400XXXX>,
> +				<&gce 0x14010000 SUBSYS_1401XXXX>,
> +				<&gce 0x14020000 SUBSYS_1402XXXX>,
> +				<&gce 0x15020000 SUBSYS_1502XXXX>;
> +			mediatek,gce-events = <CMDQ_EVENT_MDP_RDMA0_SOF>,
> +				<CMDQ_EVENT_MDP_RDMA0_EOF>,
> +				<CMDQ_EVENT_MDP_RSZ0_SOF>,
> +				<CMDQ_EVENT_MDP_RSZ1_SOF>,
> +				<CMDQ_EVENT_MDP_TDSHP_SOF>,
> +				<CMDQ_EVENT_MDP_WROT0_SOF>,
> +				<CMDQ_EVENT_MDP_WROT0_EOF>,
> +				<CMDQ_EVENT_MDP_WDMA0_SOF>,
> +				<CMDQ_EVENT_MDP_WDMA0_EOF>,
> +				<CMDQ_EVENT_ISP_FRAME_DONE_P2_0>,
> +				<CMDQ_EVENT_ISP_FRAME_DONE_P2_1>,
> +				<CMDQ_EVENT_ISP_FRAME_DONE_P2_2>,
> +				<CMDQ_EVENT_ISP_FRAME_DONE_P2_3>,
> +				<CMDQ_EVENT_ISP_FRAME_DONE_P2_4>,
> +				<CMDQ_EVENT_ISP_FRAME_DONE_P2_5>,
> +				<CMDQ_EVENT_ISP_FRAME_DONE_P2_6>,
> +				<CMDQ_EVENT_ISP_FRAME_DONE_P2_7>,
> +				<CMDQ_EVENT_ISP_FRAME_DONE_P2_8>,
> +				<CMDQ_EVENT_ISP_FRAME_DONE_P2_9>,
> +				<CMDQ_EVENT_ISP_FRAME_DONE_P2_10>,
> +				<CMDQ_EVENT_ISP_FRAME_DONE_P2_11>,
> +				<CMDQ_EVENT_ISP_FRAME_DONE_P2_12>,
> +				<CMDQ_EVENT_ISP_FRAME_DONE_P2_13>,
> +				<CMDQ_EVENT_ISP_FRAME_DONE_P2_14>,
> +				<CMDQ_EVENT_WPE_A_DONE>,
> +				<CMDQ_EVENT_SPE_B_DONE>;
> +		};
> +
> +		mdp_imgi@15020000 {
> +			compatible = "mediatek,mt8183-mdp-imgi";
> +			mediatek,mdp-id = <0>;
> +			reg = <0 0x15020000 0 0x1000>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1502XXXX 0 0x1000>;
> +		};
> +
> +		mdp_img2o@15020000 {
> +			compatible = "mediatek,mt8183-mdp-exto";
> +			mediatek,mdp-id = <1>;
> +		};
> +
> +		mdp_rsz0: mdp_rsz0@14003000 {
> +			compatible = "mediatek,mt8183-mdp-rsz";
> +			mediatek,mdp-id = <0>;
> +			reg = <0 0x14003000 0 0x1000>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x3000 0x1000>;
> +			clocks = <&mmsys CLK_MM_MDP_RSZ0>;
> +		};
> +
> +		mdp_rsz1: mdp_rsz1@14004000 {
> +			compatible = "mediatek,mt8183-mdp-rsz";
> +			mediatek,mdp-id = <1>;
> +			reg = <0 0x14004000 0 0x1000>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x4000 0x1000>;
> +			clocks = <&mmsys CLK_MM_MDP_RSZ1>;
> +		};
> +
> +		mdp_wrot0: mdp_wrot0@14005000 {
> +			compatible = "mediatek,mt8183-mdp-wrot";
> +			mediatek,mdp-id = <0>;
> +			reg = <0 0x14005000 0 0x1000>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x5000 0x1000>;
> +			clocks = <&mmsys CLK_MM_MDP_WROT0>;
> +			iommus = <&iommu M4U_PORT_MDP_WROT0>;
> +			mediatek,larb = <&larb0>;
> +		};
> +
> +		mdp_path0_sout@14005000 {
> +			compatible = "mediatek,mt8183-mdp-path";
> +			mediatek,mdp-id = <0>;
> +		};
> +
> +		mdp_wdma: mdp_wdma@14006000 {
> +			compatible = "mediatek,mt8183-mdp-wdma";
> +			mediatek,mdp-id = <0>;
> +			reg = <0 0x14006000 0 0x1000>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x6000 0x1000>;
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
> +			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0xc000 0x1000>;
> +			clocks = <&mmsys CLK_MM_MDP_CCORR>;
> +		};

-- 
Regards,

Laurent Pinchart
