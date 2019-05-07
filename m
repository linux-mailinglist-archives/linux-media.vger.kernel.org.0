Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD57C16591
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2019 16:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbfEGOWQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 May 2019 10:22:16 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:38798 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726454AbfEGOWQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 May 2019 10:22:16 -0400
X-UUID: 154115064e8a4275805302ff7213d8ff-20190507
X-UUID: 154115064e8a4275805302ff7213d8ff-20190507
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <frederic.chen@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 191652116; Tue, 07 May 2019 22:22:06 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 7 May 2019 22:22:05 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 7 May 2019 22:22:05 +0800
Message-ID: <1557238925.11663.21.camel@mtksdccf07>
Subject: Re: [RFC PATCH V1 1/6] dt-bindings: mt8183: Add binding for DIP
 shared memory
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
Date:   Tue, 7 May 2019 22:22:05 +0800
In-Reply-To: <20190430011506.GA8514@bogus>
References: <20190417104511.21514-1-frederic.chen@mediatek.com>
         <20190417104511.21514-2-frederic.chen@mediatek.com>
         <20190430011506.GA8514@bogus>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear Rob,

I appreciate your comments.

On Mon, 2019-04-29 at 20:15 -0500, Rob Herring wrote:
> On Wed, Apr 17, 2019 at 06:45:06PM +0800, Frederic Chen wrote:
> > This patch adds the binding for describing the shared memory
> > used to exchange configuration and tuning data between the
> > co-processor and Digital Image Processing (DIP) unit of the
> > camera ISP system on Mediatek SoCs.
> > 
> > Signed-off-by: Frederic Chen <frederic.chen@mediatek.com>
> > ---
> >  .../mediatek,reserve-memory-dip_smem.txt      | 45 +++++++++++++++++++
> >  1 file changed, 45 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-dip_smem.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-dip_smem.txt b/Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-dip_smem.txt
> > new file mode 100644
> > index 000000000000..64c001b476b9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-dip_smem.txt
> > @@ -0,0 +1,45 @@
> > +Mediatek DIP Shared Memory binding
> > +
> > +This binding describes the shared memory, which serves the purpose of
> > +describing the shared memory region used to exchange data between Digital
> > +Image Processing (DIP) and co-processor in Mediatek SoCs.
> > +
> > +The co-processor doesn't have the iommu so we need to use the physical
> > +address to access the shared buffer in the firmware.
> > +
> > +The Digital Image Processing (DIP) can access memory through mt8183 IOMMU so
> > +it can use dma address to access the memory region.
> > +(See iommu/mediatek,iommu.txt for the detailed description of Mediatek IOMMU)
> > +
> > +
> > +Required properties:
> > +
> > +- compatible: must be "mediatek,reserve-memory-dip_smem"
> 
> Don't use '_'.

I got it. I will use "mediatek,reserve-memory-dip-smem" instead in next
version of the patch

> 
> > +
> > +- reg: required for static allocation (see reserved-memory.txt for
> > +  the detailed usage)
> > +
> > +- alloc-range: required for dynamic allocation. The range must
> > +  between 0x00000400 and 0x100000000 due to the co-processer's
> > +  addressing limitation
> 
> Generally, you should pick either static or dynamic allocation for a 
> given binding. Static if there's some address restriction or sharing, 
> dynamic if not.
> 
> Sounds like static in this case.
> 

DIP reserved memory has address restriction so it is the static case. I
would like to remove the dynamic allocation part and modify the
description as following:

- reg: required for DIP. The range must be between 0x00000400 and
  0x100000000 due to the co-processor's addressing limitation.
  The size must be 26MB. Please see reserved-memory.txt for the 
  detailed usage.

> > +
> > +- size: required for dynamic allocation. The unit is bytes.
> > +  If you want to enable the full feature of Digital Processing Unit,
> > +  you need 20 MB at least.
> > +
> > +
> > +Example:
> > +
> > +The following example shows the DIP shared memory setup for MT8183.
> > +
> > +	reserved-memory {
> > +		#address-cells = <2>;
> > +		#size-cells = <2>;
> > +		ranges;
> > +		reserve-memory-dip_smem {
> > +			compatible = "mediatek,reserve-memory-dip_smem";
> > +			size = <0 0x1400000>;
> > +			alignment = <0 0x1000>;
> > +			alloc-ranges = <0 0x40000000 0 0x50000000>;
> > +		};
> > +	};
> > -- 
> > 2.18.0
> > 

Sincerely,

Frederic Chen


