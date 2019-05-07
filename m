Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D493B1657C
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2019 16:16:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbfEGOQZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 May 2019 10:16:25 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:35832 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726063AbfEGOQZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 May 2019 10:16:25 -0400
X-UUID: 92cac1ec1011402e98fa0e667af04154-20190507
X-UUID: 92cac1ec1011402e98fa0e667af04154-20190507
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <frederic.chen@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1660573465; Tue, 07 May 2019 22:16:20 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 7 May 2019 22:16:19 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 7 May 2019 22:16:19 +0800
Message-ID: <1557238579.11663.15.camel@mtksdccf07>
Subject: Re: [RFC PATCH V1 3/6] dt-bindings: mt8183: Added DIP dt-bindings
From:   Frederic Chen <frederic.chen@mediatek.com>
To:     Rob Herring <robh@kernel.org>
CC:     <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>, <tfiga@chromium.org>,
        <matthias.bgg@gmail.com>, <mchehab@kernel.org>,
        <yuzhao@chromium.org>, <zwisler@chromium.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <Sean.Cheng@mediatek.com>,
        <sj.huang@mediatek.com>, <christie.yu@mediatek.com>,
        <holmes.chiou@mediatek.com>, <Jerry-ch.Chen@mediatek.com>,
        <jungo.lin@mediatek.com>, <Rynn.Wu@mediatek.com>,
        <linux-media@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        <devicetree@vger.kernel.org>, <shik@chromium.org>,
        <suleiman@chromium.org>
Date:   Tue, 7 May 2019 22:16:19 +0800
In-Reply-To: <20190430011619.GA22170@bogus>
References: <20190417104511.21514-1-frederic.chen@mediatek.com>
         <20190417104511.21514-4-frederic.chen@mediatek.com>
         <20190430011619.GA22170@bogus>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear Rob,

I appreciate your comments.

On Mon, 2019-04-29 at 20:16 -0500, Rob Herring wrote:
> On Wed, Apr 17, 2019 at 06:45:08PM +0800, Frederic Chen wrote:
> > This patch adds DT binding documentation for the Digital Image
> > Processing (DIP) unit of camera ISP system on Mediatek's SoCs.
> > 
> > Signed-off-by: Frederic Chen <frederic.chen@mediatek.com>
> > ---
> >  .../bindings/media/mediatek,mt8183-dip.txt    | 35 +++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8183-dip.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8183-dip.txt b/Documentation/devicetree/bindings/media/mediatek,mt8183-dip.txt
> > new file mode 100644
> > index 000000000000..0e1994bf82f0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/mediatek,mt8183-dip.txt
> > @@ -0,0 +1,35 @@
> > +* Mediatek Digital Image Processor (DIP)
> > +
> > +Digital Image Processor (DIP) unit in Mediatek ISP system is responsible for
> > +image content adjustment according to the tuning parameters. DIP can process
> > +the image form memory buffer and output the processed image to multiple output
> > +buffers. Furthermore, it can support demosaicing and noise reduction on the
> > +images.
> > +
> > +Required properties:
> > +- compatible: "mediatek,mt8183-dip"
> > +- reg: Physical base address and length of the function block register space
> > +- interrupts: interrupt number to the cpu
> > +- iommus: should point to the respective IOMMU block with master port as
> > +  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> > +  for details.
> > +- mediatek,larb: must contain the local arbiters in the current Socs, see
> > +  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
> > +  for details.
> > +- clocks: must contain the local arbiters 5 (LARB5) and DIP clock
> > +- clock-names: must contain DIP_CG_IMG_LARB5 and DIP_CG_IMG_DIP
> > +
> > +Example:
> > +	dip: dip@15022000 {
> > +		compatible = "mediatek,mt8183-dip";
> > +		mediatek,larb = <&larb5>;
> 
> > +		mediatek,mdp3 = <&mdp_rdma0>;
> > +		mediatek,vpu = <&vpu>;
> 
> Not documented.
> 

“mediatek,vpu” will be replaced by “mediatek,scp.” I would like to 
add the following description in next version of the patch:

- mediatek,scp: must point to the scp block of the co-processor used
  with DIP. Please see
  Documentation/devicetree/bindings/remoteproc/mtk,scp.txt for the
  detail.

- mediatek,mdp3: must point to the Media Data Path 3 (MDP3) block.
  Please see
  Documentation/devicetree/bindings/media/mediatek,mt8183-mdp3.txt
  for the detail.

Example:

	mdp_rdma0: mdp_rdma0@14001000 {
		compatible = "mediatek,mt8183-mdp-rdma",
			     "mediatek,mt8183-mdp3";
		mediatek,vpu = <&vpu>;
		mediatek,scp = <&scp>;
		mediatek,mdp-id = <0>;
		/* ...... */
		};

	scp: scp@10500000 {
		compatible = "mediatek,mt8183-scp";
		reg = <0 0x10500000 0 0x80000>,
		      <0 0x105c0000 0 0x5000>;
		reg-names = "sram", "cfg";
		interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
		clocks = <&infracfg CLK_INFRA_SCPSYS>;
		clock-names = "main";
		memory-region = <&scp_mem_reserved>;
		status = "okay";
	};

	dip: dip@15022000 {
		compatible = "mediatek,mt8183-dip";
		mediatek,larb = <&larb5>;
		mediatek,mdp3 = <&mdp_rdma0>;
		mediatek,scp = <&scp>;
		/* ...... */
	};


The dependent Mediatek SCP and MDP3 patch have been sent:
[1] Mediatek SCP, https://patchwork.kernel.org/patch/10897319/
[2] Meidatek MDP3, https://patchwork.kernel.org/patch/10844229/

> > +		iommus = <&iommu M4U_PORT_CAM_IMGI>;
> > +		reg = <0 0x15022000 0 0x6000>;
> > +		interrupts = <GIC_SPI 268 IRQ_TYPE_LEVEL_LOW>;
> > +		clocks = <&imgsys CLK_IMG_LARB5>,
> > +			 <&imgsys CLK_IMG_DIP>;
> > +		clock-names = "DIP_CG_IMG_LARB5",
> > +			      "DIP_CG_IMG_DIP";
> > +	};
> > -- 
> > 2.18.0
> > 

Sincerely,

Frederic Chen


