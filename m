Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE6AB067B
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 03:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729075AbfILB34 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Sep 2019 21:29:56 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:48534 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728926AbfILB34 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Sep 2019 21:29:56 -0400
X-UUID: 3075fde28c9548b481116a65195e57da-20190912
X-UUID: 3075fde28c9548b481116a65195e57da-20190912
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1307416832; Thu, 12 Sep 2019 09:29:49 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 12 Sep 2019 09:29:47 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 12 Sep 2019 09:29:47 +0800
Message-ID: <1568251787.13007.0.camel@mtksdaap41>
Subject: Re: [RFC, v3, 1/4] dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
From:   CK Hu <ck.hu@mediatek.com>
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>
CC:     <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>, <tfiga@chromium.org>,
        <matthias.bgg@gmail.com>, <mchehab@kernel.org>,
        <devicetree@vger.kernel.org>, <Sean.Cheng@mediatek.com>,
        <Rynn.Wu@mediatek.com>, <srv_heupstream@mediatek.com>,
        daoyuan huang <daoyuan.huang@mediatek.com>,
        <holmes.chiou@mediatek.com>, <Jerry-ch.Chen@mediatek.com>,
        <jungo.lin@mediatek.com>, <sj.huang@mediatek.com>,
        <yuzhao@chromium.org>, <linux-mediatek@lists.infradead.org>,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
        <zwisler@chromium.org>, <christie.yu@mediatek.com>,
        <frederic.chen@mediatek.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>
Date:   Thu, 12 Sep 2019 09:29:47 +0800
In-Reply-To: <20190911093406.5688-2-bibby.hsieh@mediatek.com>
References: <20190911093406.5688-1-bibby.hsieh@mediatek.com>
         <20190911093406.5688-2-bibby.hsieh@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Hi, Bibby:

On Wed, 2019-09-11 at 17:34 +0800, Bibby Hsieh wrote:
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

In [1], mmsys, mdp_camin, mdp_camin2 are at the same address
(0x14000000), so these three should be only one device (mmsys device
[2]). As I know, mmsys provide display clock control, display routing,
mdp clock control and mdp routing, but the binding just show the clock
part. I guess mdp_camin and mdp_camin2 here are the mdp routing part of
mmsys, so this should be moved to mmsys binding.


[1] https://patchwork.kernel.org/patch/11140747/
[2]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt?h=v5.3-rc8

Regards,
CK
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



