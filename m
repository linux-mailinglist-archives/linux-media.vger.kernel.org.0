Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E693B99425
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 14:47:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732440AbfHVMry (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Aug 2019 08:47:54 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:9090 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725857AbfHVMry (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Aug 2019 08:47:54 -0400
X-UUID: 870d0c0bd40b4895aec31bc472739f42-20190822
X-UUID: 870d0c0bd40b4895aec31bc472739f42-20190822
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by mailgw02.mediatek.com
        (envelope-from <jungo.lin@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0707 with TLS)
        with ESMTP id 941777995; Thu, 22 Aug 2019 20:47:47 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 22 Aug 2019 20:47:35 +0800
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 22 Aug 2019 20:47:35 +0800
Message-ID: <1566478060.5044.0.camel@mtksdccf07>
Subject: Re: [RFC,v4,1/4] media: dt-bindings: mt8183: Added camera ISP Pass 1
From:   Jungo Lin <jungo.lin@mediatek.com>
To:     Rob Herring <robh@kernel.org>
CC:     <tfiga@chromium.org>, <hverkuil-cisco@xs4all.nl>,
        <laurent.pinchart@ideasonboard.com>, <matthias.bgg@gmail.com>,
        <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        <ddavenport@chromium.org>, <Sean.Cheng@mediatek.com>,
        <sj.huang@mediatek.com>, <frederic.chen@mediatek.com>,
        <Jerry-ch.Chen@mediatek.com>, <frankie.chiu@mediatek.com>,
        <ryan.yu@mediatek.com>, <Rynn.Wu@mediatek.com>,
        <yuzhao@chromium.org>, <zwisler@chromium.org>, <shik@chromium.org>,
        <suleiman@chromium.org>
Date:   Thu, 22 Aug 2019 20:47:40 +0800
In-Reply-To: <20190821194752.GA15270@bogus>
References: <jungo.lin@mediatek.com>
         <20190807124803.29884-1-jungo.lin@mediatek.com>
         <20190807124803.29884-2-jungo.lin@mediatek.com>
         <20190821194752.GA15270@bogus>
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

On Wed, 2019-08-21 at 14:47 -0500, Rob Herring wrote:
> On Wed, Aug 07, 2019 at 08:48:00PM +0800, Jungo Lin wrote:
> > This patch adds DT binding document for the Pass 1 (P1) unit
> > in Mediatek's camera ISP system. The Pass 1 unit grabs the sensor
> > data out from the sensor interface, applies ISP image effects
> > from tuning data and outputs the image data or statistics data to DRAM.
> > 
> > Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
> > ---
> >  .../bindings/media/mediatek,camisp.txt        | 73 +++++++++++++++++++
> >  1 file changed, 73 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/mediatek,camisp.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/media/mediatek,camisp.txt b/Documentation/devicetree/bindings/media/mediatek,camisp.txt
> > new file mode 100644
> > index 000000000000..fa2713acceca
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/mediatek,camisp.txt
> > @@ -0,0 +1,73 @@
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
> > +- reg: Physical base address of the camera function block register and
> > +  length of memory mapped region. Must contain an entry for each entry
> > +  in reg-names.
> > +- reg-names: Must include the following entries:
> > +  "cam_sys": Camera base function block
> > +  "cam_uni": Camera UNI function block
> > +  "cam_a": Camera ISP P1 hardware unit A
> > +  "cam_b": Camera ISP P1 hardware unit B
> > +  "cam_c": Camera ISP P1 hardware unit C
> > +- interrupts: Must contain an entry for each entry in interrupt-names.
> > +- interrupt-names : Must include the following entries:
> > +  "cam_uni": Camera UNI interrupt
> > +  "cam_a": Camera unit A interrupt
> > +  "cam_b": Camera unit B interrupt
> > +  "cam_c": Camera unit C interrupt
> > +- iommus: Shall point to the respective IOMMU block with master port
> > +  as argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> > +  for details.
> > +- clocks: A list of phandle and clock specifier pairs as listed
> > +  in clock-names property, see
> > +  Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
> > +- clock-names: Must be "camsys_cam_cgpdn" and "camsys_camtg_cgpdn".
> > +- mediatek,larb: Must contain the local arbiters in the current SoCs, see
> > +  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
> > +  for details.
> > +- power-domains: a phandle to the power domain, see
> > +  Documentation/devicetree/bindings/power/power_domain.txt for details.
> > +- mediatek,scp : The node of system control processor (SCP), see
> > +  Documentation/devicetree/bindings/remoteproc/mtk,scp.txt for details.
> > +
> > +Example:
> > +SoC specific DT entry:
> > +
> > +		camisp: camisp@1a000000 {
> > +			compatible = "mediatek,mt8183-camisp", "syscon";
> 
> syscon doesn't seem appropriate nor is it documented.
> 

Thanks for your comment.
I will remove "syscon" in next patch.

Best regards,

Jungo

> > +			reg = <0 0x1a000000 0 0x1000>,
> > +					<0 0x1a003000 0 0x1000>,
> > +					<0 0x1a004000 0 0x2000>,
> > +					<0 0x1a006000 0 0x2000>,
> > +					<0 0x1a008000 0 0x2000>;
> > +			reg-names = "cam_sys",
> > +					"cam_uni",
> > +					"cam_a",
> > +					"cam_b",
> > +					"cam_c";
> > +			interrupts = <GIC_SPI 253 IRQ_TYPE_LEVEL_LOW>,
> > +					<GIC_SPI 254 IRQ_TYPE_LEVEL_LOW>,
> > +					<GIC_SPI 255 IRQ_TYPE_LEVEL_LOW>,
> > +					<GIC_SPI 256 IRQ_TYPE_LEVEL_LOW>;
> > +			interrupt-names = "cam_uni",
> > +					"cam_a",
> > +					"cam_b",
> > +					"cam_c";
> > +			iommus = <&iommu M4U_PORT_CAM_IMGO>;
> > +			clocks = <&camsys CLK_CAM_CAM>,
> > +					<&camsys CLK_CAM_CAMTG>;
> > +			clock-names = "camsys_cam_cgpdn",
> > +					"camsys_camtg_cgpdn";
> > +			mediatek,larb = <&larb3>,
> > +					<&larb6>;
> > +			power-domains = <&scpsys MT8183_POWER_DOMAIN_CAM>;
> > +			mediatek,scp = <&scp>;
> > +		};
> > -- 
> > 2.18.0
> > 


