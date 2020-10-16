Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 949452908ED
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 17:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408907AbgJPPy1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 11:54:27 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:42499 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408822AbgJPPy1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 11:54:27 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 620264000A;
        Fri, 16 Oct 2020 15:54:20 +0000 (UTC)
Date:   Fri, 16 Oct 2020 19:54:06 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Eugen.Hristev@microchip.com
Cc:     laurent.pinchart@ideasonboard.com, robh+dt@kernel.org,
        sakari.ailus@iki.fi, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: media: atmel: csi2dc: add bindings
 for microchip csi2dc
Message-ID: <20201016175406.meg2wbsjmhj4xf7z@uno.localdomain>
References: <20200826065142.205000-1-eugen.hristev@microchip.com>
 <20201010211743.GB3939@pendragon.ideasonboard.com>
 <c5d27d11-891b-afd8-0be1-02bf5eb8bef9@microchip.com>
 <20201012130425.2rszhgd7eh7nffrv@uno.localdomain>
 <c473748a-18f9-082a-9121-9c04c663e434@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c473748a-18f9-082a-9121-9c04c663e434@microchip.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Eugen,

On Fri, Oct 16, 2020 at 12:30:59PM +0000, Eugen.Hristev@microchip.com wrote:
> On 12.10.2020 16:04, Jacopo Mondi wrote:
> > Hello,
> >     just my 2 cents, as I've noticed this patch skimming through the
> >     list
> >
> > On Mon, Oct 12, 2020 at 07:19:43AM +0000, Eugen.Hristev@microchip.com wrote:

[snip]

>
> Hi,
>
> Thanks for helping,
> >
> > Is this property describing the CSI-2 clock continuous, non-continuous
> > mode configuration, or did I mis-interpreted it ?
>
> I think so. This is a setting inside the csi2dc regarding clock. If we
> can obtain it from pads operations, then it's good, but the question is,
> if the devices can provide this or not ?

The transmitter can provide this information, as it knows which clock
mode it is going to use (it's not clear from the CSI-2 spec which side
is in charge of the selection, but it seems natural to me that it's up
to the transmitter side). Whether they implement the right operation
to do so, well... see below

> >
> > We added support for retrieving run-time configuration of the media
> > bus with the get_mbus_config pad operations recently. Among the
> > configuration flags for MBUS_CSI2_DPHY there are inded CONTINUOUS and
> > NON_CONTINUOUS clock flags.
> >
> >>>
> >>>> +
> >>>> +  microchip,inter-line-delay:
> >>>> +    allOf:
> >>>> +    - $ref: /schemas/types.yaml#/definitions/uint32
> >>>> +    - minimum: 1
> >>>> +    - maximum: 16
> >>>> +    default: 16
> >>>> +    description:
> >>>> +      Indicates how many clock cycles should be introduced between each line.
> >>>
> >>> This also sounds like a configuration parameter. How does one compute
> >>> the right value for this ?
> >>
> >> I think this is a delay that can be added inside the hardware block,
> >> depending on the interface speed and bandwidth. I will try to understand
> >> more details from the hardware design and come back with a more detailed
> >> answer.
> >>
>
> Regarding this, I will remove it. Our design team advised to have a
> hardcoded value for this product.
>
> >>>
> >>>> +
> >>>> +
> >>>> +        properties:
> >>>> +          reg:
> >>>> +            enum: [0, 1, 2, 3]
> >>>> +            description: virtual channel for the endpoint
> >>>
> >>> The virtual channel used by the source is also something that needs to
> >>> be queried from the source at runtime, it doesn't belong to this
> >>> binding.
> >>
> >> The same question as for the gated clock configuration. How can we use
> >> v4l2 subdevice API to obtain such information from the subdevice? And if
> >> the subdevice does not offer such information ?
> >
> > I think the subdev driver should be instrumented to report it instead of
> > hard-coding the information in DT which should be otherwise updated
> > depending on which sensor is connected to the board. Does it make
> > sense to you ?
>
> It does, but then, it won't work unless connected to instrumented
> subdevices. Which is not really something I would do, since it would
> completely limit the usability.
> Do you have any example on how to get the virtual id from the subdev ?

As examples of CSI-2 transmitters implementing get_mbus_config() we
have tc358743 and adv748x reporting the number of active data lanes.

Reporting the virtual channel in use is a matter of using one of the
following flags:

/* CSI-2 Virtual Channel identifiers. */
#define V4L2_MBUS_CSI2_CHANNEL_0		BIT(4)
#define V4L2_MBUS_CSI2_CHANNEL_1		BIT(5)
#define V4L2_MBUS_CSI2_CHANNEL_2		BIT(6)
#define V4L2_MBUS_CSI2_CHANNEL_3		BIT(7)

As an example of a receiver driver rcar-csi2 uses the operation to
dynamically negotiate the number of data lanes. To handle virtual
channel you would need to inspect which of the above flags have been
set by the subdevice.

On deciding if this better handled by using a subdev operation or a DT
property, I understand the subdev driver needs to implement
get_mbus_config, but hardcoding it in DT I fear is a no-go for
mainline and honestly it doesn't sound much more advantageous, as it
needs to be adapted according to the connected sensor anyway, doesn't
it ? But I'm happy to defer this call to the maintainers, I hope I
just have provided some useful references.

Cheers
   j

>
> Thanks again,
>
> Eugen
> >
> > Cheers
> >     j
> >
> >>
> >> Thanks again,
> >>
> >> Eugen
> >>>
> >>>> +
> >>>> +          remote-endpoint: true
> >>>> +
> >>>> +        required:
> >>>> +          - remote-endpoint
> >>>> +          - reg
> >>>> +
> >>>> +        additionalProperties: false
> >>>> +
> >>>> +    additionalProperties: false
> >>>> +
> >>>> +required:
> >>>> +  - compatible
> >>>> +  - reg
> >>>> +  - clocks
> >>>> +  - clock-names
> >>>> +  - port@0
> >>>> +
> >>>> +examples:
> >>>> +  - |
> >>>> +    csi2dc@e1404000 {
> >>>> +        compatible = "microchip,sama7g5-csi2dc";
> >>>> +        #address-cells = <1>;
> >>>> +        #size-cells = <0>;
> >>>> +        reg = <0xe1404000 0x500>;
> >>>> +        clocks = <&pclk>, <&scck>;
> >>>> +        clock-names = "pclk", "scck";
> >>>> +
> >>>> +        port@0 {
> >>>> +               reg = <0>; /* must be 0, first child port */
> >>>> +               csi2dc_in: endpoint { /* input from IDI interface */
> >>>> +                     remote-endpoint = <&csi2host_out>;
> >>>> +               };
> >>>> +        };
> >>>> +
> >>>> +        port@1 {
> >>>> +                #address-cells = <1>;
> >>>> +                #size-cells = <0>;
> >>>> +                reg = <1>; /* must be 1, second child port */
> >>>> +                csi2dc_out: endpoint@2 {
> >>>> +                        reg = <2>;  /* virtual channel identifier */
> >>>> +                        remote-endpoint = <&xisc_in>; /* output to sensor controller */
> >>>> +                };
> >>>> +        };
> >>>> +    };
> >>>> +
> >>>> +...
> >>>
> >>> --
> >>> Regards,
> >>>
> >>> Laurent Pinchart
> >>>
> >>
>
