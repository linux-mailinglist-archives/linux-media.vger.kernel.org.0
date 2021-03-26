Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7996234A9B9
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 15:30:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230100AbhCZO3k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 10:29:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbhCZO3I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 10:29:08 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D3E1C0613AA;
        Fri, 26 Mar 2021 07:29:08 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id A6ACD1F46AD6
Message-ID: <a47cea7f31abdd25e6c9d4262be07ce2d852881e.camel@collabora.com>
Subject: Re: [PATCH v2 06/10] media: dt-bindings: Document SAMA5D4 VDEC
 bindings
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Emil Velikov <emil.l.velikov@gmail.com>,
        Rob Herring <robh@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org,
        linux-rockchip <linux-rockchip@lists.infradead.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree <devicetree@vger.kernel.org>
Date:   Fri, 26 Mar 2021 11:28:57 -0300
In-Reply-To: <CACvgo51EpUqRBDQ0tO8aoUM3eo=y9R5VFOazWD05hOaiGwgZPg@mail.gmail.com>
References: <20210311154055.3496076-1-emil.l.velikov@gmail.com>
         <20210311154055.3496076-7-emil.l.velikov@gmail.com>
         <20210324151715.GA3070006@robh.at.kernel.org>
         <CACvgo51EpUqRBDQ0tO8aoUM3eo=y9R5VFOazWD05hOaiGwgZPg@mail.gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Emil,

On Thu, 2021-03-25 at 14:14 +0000, Emil Velikov wrote:
> On Wed, 24 Mar 2021 at 15:17, Rob Herring <robh@kernel.org> wrote:
> > 
> > On Thu, Mar 11, 2021 at 03:40:51PM +0000, Emil Velikov wrote:
> > > From: Emil Velikov <emil.velikov@collabora.com>
> > > 
> > > Add devicetree binding documentation for the Hantro G1/G2 VDEC on
> > > the Microchip SAMAS5D4 SoC.
> > > 
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > Cc: Frank Rowand <frowand.list@gmail.com>
> > > Cc: devicetree@vger.kernel.org>
> > > Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> > > ---
> > > v2
> > >  - Newly introduced
> > >  - s/Atmel/Microchip/ (Nicolas)
> > >  - Drop leading 0 in node name/address
> > > ---
> > >  .../media/microchip,sama5d4-vdec.yaml         | 59 +++++++++++++++++++
> > >  1 file changed, 59 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml b/Documentation/devicetree/bindings/media/microchip,sama5d4-
> > > vdec.yaml
> > > new file mode 100644
> > > index 000000000000..9cb2c0295d54
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
> > > @@ -0,0 +1,59 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +
> > > +%YAML 1.2
> > > +---
> > > +$id: "http://devicetree.org/schemas/media/microchip,sama5d4-vdec.yaml#"
> > > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > > +
> > > +title: Hantro G1 VPU codec implemented on Microchip SAMA5D4 SoCs
> > > +
> > > +maintainers:
> > > +  - Emil Velikov <emil.velikov@collabora.com>
> > > +
> > > +description:
> > > +  Hantro G1 video decode accelerator present on Microchip SAMA5D4 SoCs.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: microchip,sama5d4-vdec
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  interrupt-names:
> > > +    items:
> > > +      - const: vdec
> > 
> > Why do you need a name? *-names are used to distinguish multiple entries
> > and don't add anything if only a single entry.
> > 
> On one hand the names are used to describe the hardware - the SAMA
> board uses designated clock and interrupt lines - both called "vdec".
> Additionally the names are ultimately required by the underlying API -
> platform_get_irq_byname and  devm_clk_bulk_get respectively.
> How can we get the respective entries without the name?
> 

There are APIs to get the resource by index as opposed to by name.
E.g. platform_get_irq.

However, you are confusing here internal kernel implementation
with devicetree bindings. The latter is just a representation
of the hardware.

> Skimming through the existing dts file -
> arch/arm/boot/dts/sama5d4.dtsi and other dts files - there are lots of
> examples where the device tree binding contains the name for a single
> clock/interrupt.
> 


Note that dtsi and dts are the device-tree files, not the bindings.
And even if you find examples, the fact that there exist examples
doesn't mean it's the right thing to do.

Thanks,
Ezequiel

