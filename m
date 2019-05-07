Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F392A16515
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2019 15:52:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726793AbfEGNwk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 May 2019 09:52:40 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:16027 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726444AbfEGNwk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 May 2019 09:52:40 -0400
X-UUID: 224ef36218ca4f27a573c49c6ba05807-20190507
X-UUID: 224ef36218ca4f27a573c49c6ba05807-20190507
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <jerry-ch.chen@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1290839521; Tue, 07 May 2019 21:52:32 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs03n2.mediatek.inc (172.21.101.182) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 7 May 2019 21:52:30 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 7 May 2019 21:52:30 +0800
Message-ID: <1557237150.11458.45.camel@mtksdccf07>
Subject: Re: [RFC PATCH V1 3/6] dt-bindings: mt8183: Added FD dt-bindings
From:   Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>
To:     Rob Herring <robh@kernel.org>
CC:     <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>, <tfiga@chromium.org>,
        <matthias.bgg@gmail.com>, <mchehab@kernel.org>,
        <yuzhao@chromium.org>, <zwisler@chromium.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <Sean.Cheng@mediatek.com>,
        <sj.huang@mediatek.com>, <christie.yu@mediatek.com>,
        <holmes.chiou@mediatek.com>, <frederic.chen@mediatek.com>,
        <jungo.lin@mediatek.com>, <Rynn.Wu@mediatek.com>,
        <linux-media@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        <devicetree@vger.kernel.org>, <shik@chromium.org>,
        <suleiman@chromium.org>, <jerry-ch.chen@mediatek.com>
Date:   Tue, 7 May 2019 21:52:30 +0800
In-Reply-To: <20190501224647.GA12044@bogus>
References: <20190423104505.38778-1-Jerry-Ch.chen@mediatek.com>
         <20190423104505.38778-4-Jerry-Ch.chen@mediatek.com>
         <20190501224647.GA12044@bogus>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-TM-SNTS-SMTP: 208F602F23B4135D007ECC86C99CD3A7F4CB67645D09D8B5C4AFEE51EBC031A52000:8
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

Thank you for your comments.

On Wed, 2019-05-01 at 17:46 -0500, Rob Herring wrote:
> On Tue, Apr 23, 2019 at 06:45:02PM +0800, Jerry-ch Chen wrote:
> > From: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
> > 
> > This patch adds DT binding documentation for the Face Detection (FD)
> > unit of the camera system on Mediatek's SoCs.
> > 
> > Signed-off-by: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
> > ---
> >  .../bindings/media/mediatek,mt8183-fd.txt     | 34 +++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8183-fd.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8183-fd.txt b/Documentation/devicetree/bindings/media/mediatek,mt8183-fd.txt
> > new file mode 100644
> > index 000000000000..97c12fd93e7e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/mediatek,mt8183-fd.txt
> > @@ -0,0 +1,34 @@
> > +* Mediatek Face Detection Unit (FD)
> > +
> > +Face Detection (FD) unit is a typical memory-to-memory HW device.
> > +It provides hardware accelerated face detection function, and it
> > +is able to detect different poses of faces. FD will writre result
> > +of detected face into memory as output.
> > +
> > +Required properties:
> > +- compatible: "mediatek,mt8183-fd"
> > +- reg: Physical base address and length of the function block register space
> > +- interrupts: interrupt number to the cpu.
> > +- iommus: should point to the respective IOMMU block with master port as
> > +  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> > +  for details.
> 
> How many entries? Looks like 3 from the example.
> 

Yes, we have 3 entries.  I would like to update this part as
following:

iommus: should point to the 3 entries:  M4U_PORT_CAM_FDVT_RP,
M4U_PORT_CAM_FDVT_WR and M4U_PORT_CAM_FDVT_RB.  (Please see
Documentation/devicetree/bindings/iommu/mediatek,iommu.txt for details.)

> > +- mediatek,larb: must contain the local arbiters in the current Socs, see
> > +  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
> > +  for details.
> > +- clocks : must contain the FDVT clock
> > +- clock-names: must contain FD_CLK_IMG_FD
> > +
> > +Example:
> > +	fd:fd@1502b000 {
>            ^ space needed
> 

We will fix it in next version of the patch.

> > +		compatible = "mediatek,mt8183-fd";
> > +		mediatek,larb = <&larb5>;
> > +		mediatek,scp = <&scp>;
> > +		iommus = <&iommu M4U_PORT_CAM_FDVT_RP>,
> > +			 <&iommu M4U_PORT_CAM_FDVT_WR>,
> > +			 <&iommu M4U_PORT_CAM_FDVT_RB>;
> > +		reg = <0 0x1502b000 0 0x1000>;
> > +		interrupts = <GIC_SPI 269 IRQ_TYPE_LEVEL_LOW>;
> > +		clocks = <&imgsys CLK_IMG_FDVT>;
> > +		clock-names = "FD_CLK_IMG_FD";
> > +	};
> > +
> > -- 
> > 2.18.0
> > 

Sincerely,

Jerry



