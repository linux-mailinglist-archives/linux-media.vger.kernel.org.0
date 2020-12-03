Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FA8A2CDC8B
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 18:38:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728773AbgLCRiK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 12:38:10 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:53353 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728925AbgLCRiK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 12:38:10 -0500
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 7B75140007;
        Thu,  3 Dec 2020 17:37:24 +0000 (UTC)
Date:   Thu, 3 Dec 2020 18:37:33 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org, naush@raspberrypi.com,
        dave.stevenson@raspberrypi.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, niklas.soderlund@ragnatech.se,
        dafna.hirschfeld@collabora.com, hverkuil@xs4all.nl,
        nsaenzjulienne@suse.de, mchehab+huawei@kernel.org
Subject: Re: [PATCH v4 2/5] dt-bindings: media: Document BCM283x CSI2/CCP2
 receiver
Message-ID: <20201203173733.wmdjr2cpii3ab75s@uno.localdomain>
References: <20201110174036.220883-1-jacopo@jmondi.org>
 <20201110174036.220883-3-jacopo@jmondi.org>
 <20201202212031.GY4351@valkosipuli.retiisi.org.uk>
 <20201203164417.y3vrabzjhalhahmh@uno.localdomain>
 <20201203172519.GG4351@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201203172519.GG4351@valkosipuli.retiisi.org.uk>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Thu, Dec 03, 2020 at 07:25:19PM +0200, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Thu, Dec 03, 2020 at 05:44:17PM +0100, Jacopo Mondi wrote:
> > Hi Sakari,
> >
> > On Wed, Dec 02, 2020 at 11:20:31PM +0200, Sakari Ailus wrote:
> > > Hi Jacopo,
> > >
> > > On Tue, Nov 10, 2020 at 06:40:33PM +0100, Jacopo Mondi wrote:
> > > > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > >
> > > > Document the DT bindings for the CSI2/CCP2 receiver peripheral (known as
> > > > Unicam) on BCM283x SoCs.
> > > >
> > > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > > ---
> > > >  .../bindings/media/brcm,bcm2835-unicam.yaml   | 155 ++++++++++++++++++
> > > >  1 file changed, 155 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml b/Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
> > > > new file mode 100644
> > > > index 0000000000000..6ffc900e8ae8f
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
> > > > @@ -0,0 +1,155 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +# Copyright (C) 2020 Raspberry Pi (Trading) Ltd.
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/media/brcm,bcm2835-unicam.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Broadcom BCM283x Camera Interface (Unicam)
> > > > +
> > > > +maintainers:
> > > > +  - Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > > +  - Raspberry Pi kernel list <kernel-list@raspberrypi.com>
> > > > +
> > > > +description:
> > > > +  The Unicam block on BCM283x SoCs is the receiver for either CSI-2 or CCP2
> > > > +  data from image sensors or similar devices.
> > > > +
> > > > +  The main platform using this SoC is the Raspberry Pi family of boards. On the
> > > > +  Pi the VideoCore firmware can also control this hardware block, and driving
> > > > +  it from two different processors will cause issues. To avoid this, the
> > > > +  firmware checks the device tree configuration during boot. If it finds device
> > > > +  tree nodes whose name starts with "csi" then it will stop the firmware
> > > > +  accessing the block, and it can then safely be used via the device tree
> > > > +  binding.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: brcm,bcm2835-unicam
> > >
> > > The compatible string doesn't quite match with the title. Which SoCs are
> > > supported?
> > >
> >
> > Afaict bcm2835 and bcm2711. There might be more I'm not aware of.
> > There should be no distinction between then, but Dave knows more.
> >
> > Would a per-soc compatible work better or is a single brcm,unicam
> > good enough to start with and we can add per-soc compatibles if
> > there's any per-SoC difference that will need to be handled in future ?
>
> If there are any differences between them, that's the way to take them into
> account (assuming they can't told apart at runtime). In that case you could
> just do the check in the driver. I think some Allwinner CSI-2 / parallel
> receivers use that.
>

There might be difference, I don't know, but as of now the driver does
not need to tell them apart. I agree if we ever find a SoC-specific
different then supporting old DTBS with a single compatible might get
tricky.

I'll defer this to Dave, he knows how many SoC uses this IP and if
they will ever have to be told apart.

> >
> > > > +
> > > > +  reg:
> > > > +    items:
> > > > +      - description: Main registers block
> > > > +      - description: Clock registers block
> > > > +
> > > > +  interrupts:
> > > > +    maxItems: 1
> > > > +
> > > > +  clocks:
> > > > +    minItems: 1
> > > > +    maxItems: 2
> > > > +
> > > > +  clock-names:
> > > > +    minItems: 1
> > > > +    items:
> > > > +      - const: lp
> > > > +      - const: core
> > > > +
> > > > +  power-domains:
> > > > +    maxItems: 1
> > > > +
> > > > +  brcm,num-data-lanes:
> > > > +    description:
> > > > +      The number of data lanes supported by this Unicam instance. It may be
> > > > +      larger than the number of data lanes routed on the board, as described by
> > > > +      the data-lanes property of the endpoint.
> > > > +    allOf:
> > > > +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> > > > +      - enum: [1, 2, 4]
> > >
> > > Do you need this information besides how many lanes are connected?
> > >
> > > Does the number of lanes change even within the same model of SoC? Could
> > > you use the compatible string to differentiate between them?
> > >
> >
> > I had a similar question:
> > https://patchwork.linuxtv.org/project/linux-media/patch/20200504092611.9798-5-laurent.pinchart@ideasonboard.com/#121079
> >
> > I think the discussion ended with the fact that not all the available
> > lanes in the IP might be routed to the connector, and that depends on
> > the board.
>
> Right, and this is what this property describes.
>

Ack to keep it then ?

> Going back to my earlier question, doesn't the number of lanes available in
> the SoC depend on the SoC where this block is integrated, which could be
> indicated by a compatible string?
>
> I don't really have a strong opinion on either, but knowing the exact piece
> of hardware might be helpful for other reasons, too (I'm not commenting on
> Unicam in particular here).
>
> >
> > > > +
> > > > +  port:
> > > > +    type: object
> > > > +    description:
> > > > +      Input port node, as described in video-interfaces.txt.
> > > > +
> > > > +    properties:
> > > > +      endpoint:
> > > > +        type: object
> > > > +
> > > > +        properties:
> > > > +          clock-lanes:
> > > > +            items:
> > > > +              - const: 0
> > >
> > > Please drop. There's nothing to tell software here.
> > >
> >
> > Ack
> >
> > > > +
> > > > +          data-lanes:
> > > > +            description:
> > > > +              Lane reordering is not supported, items shall be in order,
> > > > +              starting at 1.
> > > > +            allOf:
> > > > +              - $ref: "/schemas/types.yaml#/definitions/uint32-array"
> > > > +              - maxItems: 1
> > > > +                items:
> > > > +                  minItems: 1
> > > > +                  maxItems: 4
> > > > +                  items:
> > > > +                    - const: 1
> > > > +                    - const: 2
> > > > +                    - const: 3
> > > > +                    - const: 4
> > >
> > > No need to specify items.
> > >
> >
> > Actually here we might need to support [1, 2] and [1, 2, 3, 4].
> > I'll rebase on the converted video-interfaces to see it that helps
>
> If you do not support lane reordering, then just the number of values
> matters. Ideally, indeed, it'd be monotonically incrementing integers from
> 1.
>
> See e.g. Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml for an
> example. It got merged earlier today.

Ah! maximum: 8. I was about to reply to Rob's video-interfaces
conversion and this might need to be pointed out.
I was also about to ask it it's an issue if the bindings validation
does not catch arrays as: [1, 3] as the constraint of being
monotonically increasing values is expressed in words only. I guess
it's fine, the alternative syntax is awful:

            anyOf:
              - items:
                - const: 1
                - const: 2
              - items:
                - const: 1
                - const: 2
                - const: 3
                - const: 4

>
> --
> Kind regards,
>
> Sakari Ailus
