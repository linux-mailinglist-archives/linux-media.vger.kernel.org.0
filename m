Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 570071FF5B
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 08:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbfEPGMg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 02:12:36 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:26411 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726315AbfEPGMg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 02:12:36 -0400
X-UUID: 9c6e19ab591b4bdda77bc291f268d520-20190516
X-UUID: 9c6e19ab591b4bdda77bc291f268d520-20190516
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <jungo.lin@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1194110267; Thu, 16 May 2019 14:12:27 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 16 May 2019 14:12:26 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 16 May 2019 14:12:26 +0800
Message-ID: <1557987146.5721.12.camel@mtksdccf07>
Subject: Re: [RFC,V2,03/11] dt-bindings: mt8183: Added camera ISP Pass 1
From:   Jungo Lin <jungo.lin@mediatek.com>
To:     Rob Herring <robh@kernel.org>
CC:     <ryan.yu@mediatek.com>, <frankie.chiu@mediatek.com>,
        <laurent.pinchart+renesas@ideasonboard.com>,
        <Rynn.Wu@mediatek.com>, <suleiman@chromium.org>,
        <Jerry-ch.Chen@mediatek.com>, <hans.verkuil@cisco.com>,
        <frederic.chen@mediatek.com>, <seraph.huang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <shik@chromium.org>, <yuzhao@chromium.org>,
        <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
        <mchehab@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <Sean.Cheng@mediatek.com>, <srv_heupstream@mediatek.com>,
        <sj.huang@mediatek.com>, <tfiga@chromium.org>,
        <christie.yu@mediatek.com>, <zwisler@chromium.org>
Date:   Thu, 16 May 2019 14:12:26 +0800
In-Reply-To: <20190514195417.GA21726@bogus>
References: <jungo.lin@mediatek.com>
         <20190510015755.51495-4-jungo.lin@mediatek.com>
         <20190514195417.GA21726@bogus>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, Rob:

Thanks for your comments.

On Tue, 2019-05-14 at 14:54 -0500, Rob Herring wrote:
> On Fri, May 10, 2019 at 09:57:52AM +0800, Jungo Lin wrote:
> > This patch adds DT binding document for the Pass 1 (P1) unit in
> > Mediatek's camera ISP system. The Pass 1 unit grabs the sensor data
> > out from the sensor interface, applies ISP image effects from tuning
> > data and outputs the image data or statistics data to DRAM.
> > 
> > Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
> > ---
> >  .../bindings/media/mediatek,camisp.txt        | 92 +++++++++++++++++++
> >  1 file changed, 92 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/mediatek,camisp.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/media/mediatek,camisp.txt b/Documentation/devicetree/bindings/media/mediatek,camisp.txt
> > new file mode 100644
> > index 000000000000..759e55a5dfac
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/mediatek,camisp.txt
> > @@ -0,0 +1,92 @@
> > +* Mediatek Image Signal Processor Pass 1 (ISP P1)
> > +
> > +The Pass 1 unit of Mediatek's camera ISP system grabs the sensor data out
> > +from the sensor interface, applies ISP effects from tuning data and outputs
> > +the image data and statistics data to DRAM. Furthermore, Pass 1 unit has
> > +the ability to output two different resolutions frames at the same time to
> > +increase the performance of the camera application.
> > +
> > +Required properties:
> > +- compatible: Must be "mediatek,mt8183-camisp" for MT8183.
> > +- reg: Must contain an entry for each entry in reg-names.
> 
> Must list reg-names here and define the values. Though, I don't find 
> cam1, cam2, cam3 to be too useful.
> 

Ok, we will list all our supported reg-names in next patch.

> > +- interrupts: interrupt number to the cpu.
> > +- iommus: shall point to the respective IOMMU block with master port
> > +  as argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> > +  for details.
> 
> How many entries?
> 

Basic, we just need to add only one master port for IOMMU property.
We will revise this and drop the other two ports.

> > +- power-domains : a phandle to the power domain of this local arbiter.
> > +- clocks: device clocks, see
> > +  Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
> > +- clock-names: must be "CAMSYS_CAM_CGPDN" and "CAMSYS_CAMTG_CGPDN".
> > +- mediatek,larb: must contain the local arbiters in the current SOCs, see
> > +  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
> > +  for details.
> > +- mediatek,scp : the node of system control processor (SCP), see
> > +  Documentation/devicetree/bindings/remoteproc/mtk,scp.txt for details.
> > +- memory-region : the reserved shared memory region between Pass 1 unit and
> > +  system control processor.
> > +
> > +Example:
> > +SoC specific DT entry:
> > +
> > +	camisp: camisp@1a000000 {
> > +		compatible = "mediatek,mt8183-camisp", "syscon";
> > +		reg = <0 0x1a000000 0 0x1000>,
> > +		      <0 0x1a003000 0 0x1000>,
> > +		      <0 0x1a004000 0 0x2000>,
> > +		      <0 0x1a006000 0 0x2000>;
> > +		reg-names = "camisp",
> > +		            "cam1",
> > +		            "cam2",
> > +		            "cam3";
> > +		interrupts = <GIC_SPI 253 IRQ_TYPE_LEVEL_LOW>,
> > +			     <GIC_SPI 254 IRQ_TYPE_LEVEL_LOW>,
> > +			     <GIC_SPI 255 IRQ_TYPE_LEVEL_LOW>;
> > +		interrupt-names = "cam1",
> > +				  "cam2",
> > +				  "cam3";
> > +		iommus = <&iommu M4U_PORT_CAM_LSCI0>,
> > +			 <&iommu M4U_PORT_CAM_LSCI1>,
> > +			 <&iommu M4U_PORT_CAM_BPCI>;
> > +		#clock-cells = <1>;
> > +		power-domains = <&scpsys MT8183_POWER_DOMAIN_CAM>;
> > +		/* Camera CCF */
> > +		clocks = <&camsys CLK_CAM_CAM>,
> > +			 <&camsys CLK_CAM_CAMTG>;
> > +		clock-names = "CAMSYS_CAM_CGPDN",
> > +			      "CAMSYS_CAMTG_CGPDN";
> > +		mediatek,larb = <&larb3>,
> > +				<&larb6>;
> > +		mediatek,scp = <&scp>;
> > +		memory-region = <&cam_mem_reserved>;
> > +	};
> > +
> > +Reserved memory specific DT entry (see reserved memory binding for more
> > +information):
> > +
> > +Example:
> > +SoC specific DT entry:
> > +
> > +	cam_mem_reserved: cam_mem_region {
> > +		compatible = "mediatek,reserve-memory-cam-smem";
> > +		no-map;
> > +		size = <0 0x01400000>; / *20 MB share mem size */
> > +		alignment = <0 0x1000>;
> > +		alloc-ranges = <0 0x40000000 0 0x10000000>;
> > +	};
> > +
> > +Mediatek ISP P1 supports a single port node with MIPI-CSI2 bus. It should
> > +contain one 'port' child node with child 'endpoint' node. Please refer to
> > +the bindings defined in Documentation/devicetree/bindings/media/video-interfaces.txt
> > +and Documentation/devicetree/bindings/media/mediatek-seninf.txt.
> > +
> > +Example:
> > +Board specific DT entry:
> 
> Don't split examples like this.
> 

Ok, we will keep one example in next patch.

Best regards,

Jungo

> > +
> > +	&camisp {
> > +		port@0 {
> > +			seninf_0: endpoint {
> > +				remote-endpoint = <&seninf_core>;
> > +			};
> > +		};
> > +	};
> > +
> > -- 
> > 2.18.0
> > 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek


