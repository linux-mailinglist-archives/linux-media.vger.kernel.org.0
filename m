Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1623A3AD0D
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2019 04:34:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387455AbfFJCef (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Jun 2019 22:34:35 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:35692 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730224AbfFJCef (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Jun 2019 22:34:35 -0400
X-UUID: 28b4b304262c4b5982a4936f05fcd734-20190610
X-UUID: 28b4b304262c4b5982a4936f05fcd734-20190610
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1668713502; Mon, 10 Jun 2019 10:34:25 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 10 Jun 2019 10:34:24 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 10 Jun 2019 10:34:17 +0800
Message-ID: <1560134057.28527.5.camel@mtksdaap41>
Subject: Re: [PATCH v4 01/14] dt-bindings: Add binding for MT2712 MIPI-CSI2
From:   CK Hu <ck.hu@mediatek.com>
To:     Stu Hsieh <stu.hsieh@mediatek.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "Matthias Brugger" <matthias.bgg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Date:   Mon, 10 Jun 2019 10:34:17 +0800
In-Reply-To: <1559643115-15124-2-git-send-email-stu.hsieh@mediatek.com>
References: <1559643115-15124-1-git-send-email-stu.hsieh@mediatek.com>
         <1559643115-15124-2-git-send-email-stu.hsieh@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, Stu:

"mediatek,mt2712-mipicsi" and "mediatek,mt2712-mipicsi-common" have many
common part with "mediatek,mt8183-seninf", and I've a discussion in [1],
so I would like these two to be merged together.

[1] https://patchwork.kernel.org/patch/10979131/

Regards,
CK

On Tue, 2019-06-04 at 18:11 +0800, Stu Hsieh wrote:
> Add MIPI-CSI2 dt-binding for Mediatek MT2712 SoC
> 
> Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
> ---
>  .../bindings/media/mediatek-mipicsi.txt       | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-mipicsi.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek-mipicsi.txt b/Documentation/devicetree/bindings/media/mediatek-mipicsi.txt
> new file mode 100644
> index 000000000000..e30b6a468129
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek-mipicsi.txt
> @@ -0,0 +1,58 @@
> +* Mediatek MIPI-CSI2 receiver
> +
> +Mediatek MIPI-CSI2 receiver is the MIPI Signal capture hardware present in Mediatek SoCs
> +
> +Required properties:
> +- compatible: should be "mediatek,mt2712-mipicsi"
> +- reg : physical base address of the mipicsi receiver registers and length of
> +  memory mapped region.
> +- power-domains: a phandle to the power domain, see
> +  Documentation/devicetree/bindings/power/power_domain.txt for details.
> +- mediatek,larb: must contain the local arbiters in the current Socs, see
> +  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
> +  for details.
> +- iommus: should point to the respective IOMMU block with master port as
> +  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> +  for details.
> +- mediatek,seninf_mux_camsv: seninf_mux_camsv the data go through of the mipicsi port
> +  any mipicsi port can contain max four seninf_mux_camsv
> +  The Total seninf_mux_camsv is six for mt2712
> +- mediatek,mipicsiid: the id of the mipicsi port, there are two port for mt2712
> +- mediatek,mipicsi: the common component of the two mipicsi port
> +- mediatek,mipicsi_max_vc: the number of virtual channel which subdev used
> +- mediatek,serdes_link_reg: the register of subdev to get the link status
> +
> +Example:
> +	mipicsi0: mipicsi@10217000 {
> +		compatible = "mediatek,mt2712-mipicsi";
> +		mediatek,mipicsi = <&mipicsi>;
> +		iommus = <&iommu0 M4U_PORT_CAM_DMA0>,
> +			 <&iommu0 M4U_PORT_CAM_DMA1>;
> +		mediatek,larb = <&larb2>;
> +		power-domains = <&scpsys MT2712_POWER_DOMAIN_ISP>;
> +
> +		mediatek,seninf_mux_camsv = <&seninf1_mux_camsv0
> +					     &seninf2_mux_camsv1
> +					     &seninf3_mux_camsv2
> +					     &seninf4_mux_camsv3>;
> +		reg = <0 0x10217000 0 0x60>,
> +		      <0 0x15002100 0 0x4>,
> +		      <0 0x15002300 0 0x100>;
> +		mediatek,mipicsiid = <0>;
> +		mediatek,mipicsi_max_vc = <4>;
> +		mediatek,serdes_link_reg = <0x49>;
> +	};
> +
> +	mipicsi1: mipicsi@10218000 {
> +		compatible = "mediatek,mt2712-mipicsi";
> +		mediatek,mipicsi = <&mipicsi>;
> +		iommus = <&iommu0 M4U_PORT_CAM_DMA2>;
> +		mediatek,larb = <&larb2>;
> +		power-domains = <&scpsys MT2712_POWER_DOMAIN_ISP>;
> +		mediatek,seninf_mux_camsv = <&seninf5_mux_camsv4
> +					     &seninf6_mux_camsv5>;
> +		reg = <0 0x10218000 0 0x60>,
> +		      <0 0x15002500 0 0x4>,
> +		      <0 0x15002700 0 0x100>;
> +		mediatek,mipicsiid = <1>;
> +	};


