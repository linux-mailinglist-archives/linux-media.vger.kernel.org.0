Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A96A35C414
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 12:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239408AbhDLKem (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 06:34:42 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:51949 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239548AbhDLKek (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 06:34:40 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 54B3320006;
        Mon, 12 Apr 2021 10:34:18 +0000 (UTC)
Date:   Mon, 12 Apr 2021 12:34:57 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Eugen.Hristev@microchip.com
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 28/30] dt-bindings: media: atmel: add microchip-xisc
 binding
Message-ID: <20210412103457.3ahntx5ngskgb57e@uno.localdomain>
References: <20210405155105.162529-1-eugen.hristev@microchip.com>
 <20210405155105.162529-29-eugen.hristev@microchip.com>
 <20210412095714.uivebcatgazzq5ae@uno.localdomain>
 <7269db4c-bc76-58e4-4423-7be9f0369d5c@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7269db4c-bc76-58e4-4423-7be9f0369d5c@microchip.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eugene,

On Mon, Apr 12, 2021 at 10:12:22AM +0000, Eugen.Hristev@microchip.com wrote:
> On 4/12/21 12:57 PM, Jacopo Mondi wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > Hi Eugene,
> >
> > On Mon, Apr 05, 2021 at 06:51:03PM +0300, Eugen Hristev wrote:
> >> Add bindings for the microchip xisc, a driver based on atmel-isc.
> >> It shares common code with atmel-isc, but the xisc is the next generation
> >> ISC which is present on sama7g5 product.
> >> It has an enhanced pipeline, additional modules, formats, and it supports
> >> not only parallel sensors, but also serial sensors, by connecting to a demux
> >> endpoint present on sama7g5.
> >> One of the key points for creating a new binding is the clocking scheme, as
> >> atmel-isc requires 3 mandatory clocks, the microchip-xisc requires a single
> >> input clock.
> >>
> >> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> >> ---
> >>
> >> Hello Rob, all,
> >>
> >> I did not convert this yet to yaml because I would like first your feedback
> >> if the binding is good.
> >> If it's fine I will convert both this new binding and the old atmel-isc
> >> to yaml.
> >>
> >> Thanks for your feedback,
> >> Eugen
> >>
> >>   .../bindings/media/microchip-xisc.txt         | 64 +++++++++++++++++++
> >>   1 file changed, 64 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/media/microchip-xisc.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/media/microchip-xisc.txt b/Documentation/devicetree/bindings/media/microchip-xisc.txt
> >> new file mode 100644
> >> index 000000000000..080a357ed84d
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/media/microchip-xisc.txt
> >> @@ -0,0 +1,64 @@
> >> +Microchip eXtended Image Sensor Controller (XISC)
> >> +----------------------------------------------
> >> +
> >> +Required properties for XISC:
> >> +- compatible
> >> +     Must be "microchip,sama7g5-xisc".
> >> +- reg
> >> +     Physical base address and length of the registers set for the device.
> >> +- interrupts
> >> +     Should contain IRQ line for the XISC.
> >> +- clocks
> >> +     List of clock specifiers, corresponding to entries in
> >> +     the clock-names property;
> >> +     Please refer to clock-bindings.txt.
> >> +- clock-names
> >> +     Required elements: "hclock".
> >> +     This is the clock that clocks the sensor controller, and is usually
> >> +     fed from the clock tree. It is used for the internal controller logic.
> >> +- #clock-cells
> >> +     Should be 0.
> >> +- clock-output-names
> >> +     Should be "isc-mck".
> >> +- pinctrl-names, pinctrl-0
> >> +     Please refer to pinctrl-bindings.txt.
> >> +
> >> +Optional properties for XISC:
> >> +- microchip,mipi-mode;
> >> +     As the XISC is usually connected to a demux/bridge, the XISC receives
> >> +     the same type of input, however, it should be aware of the type of
> >> +     signals received. The mipi-mode enables different internal handling
> >> +     of the data and clock lines.
> >
> > What does 'mipi-mode' do to a component that has an parallel receiver ?
>
> Actually, this indeed has a parallel receiver, but it's only inside the
> SoC. The other end of the parallel connection is a demuxer/bridge. This
> demuxer will take the input from either a real parallel sensor or a CSI2
> stream.
> Even if the pixels are then converted into a parallel stream, it looks
> like the pixel data has a bit of different constrains in term of hold
> and setup time, and other electrical characteristics inside the SoC.
> The XISC hardware designer decided to leave a bit in the user interface
> called 'mipi-mode' , and by setting this, the capture interface of the
> XISC is better adapted to a demuxed stream from a CSI2, rather than
> adapted to a stream coming from a parallel sensor directly.
>
> I am not sure I explained it right, but this is what I understand, when
> I asked the hardware design about it.
>
> So we have to manually set this bit if we have the demuxer deserializing
> the CSI2 pixels or they are connected to a parallel sensor.
> The XISC has no way of telling which is the correct setup, and from the
> demuxer perspective, things are the same.
>
> The endpoint connection between the xisc and the demuxer looks to be the
> same, looking as if there is a parallel connection.
> To know more, the XISC would be needing to look further down the
> pipeline, and this is something which I could not force it to do.

Thanks for the details. It would be interesting to know what changes
when the stream is received from the muxer, the parallel interface
timings should not affected, but I get there are not many ways around
this

>
>
> >
> >> +
> >> +XISC supports a single port node with internal parallel bus.
> >> +It should contain one 'port' child node with child 'endpoint' node.
> >> +Please refer to the bindings defined in
> >> +Documentation/devicetree/bindings/media/video-interfaces.txt.
> >> +
> >> +This endpoint has to be connected to a bridge that acts as a demux from either
> >> +a serial interface or acts as a simple direct bridge to a parallel sensor.
> >> +
> >> +Example:
> >> +xisc: xisc@e1408000 {
> >> +     compatible = "microchip,sama7g5-isc";
> >> +     reg = <0xe1408000 0x2000>;
> >> +     interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
> >> +     #address-cells = <1>;
> >> +     #size-cells = <0>;
> >> +     clocks = <&pmc PMC_TYPE_PERIPHERAL 56>;
> >> +     clock-names = "hclock";
> >> +     #clock-cells = <0>;
> >> +     clock-output-names = "isc-mck";
> >> +     microchip,mipi-mode;
> >> +
> >> +     port@1 {
> >> +             reg = <1>;
> >> +             xisc_in: endpoint {
> >> +             bus-width = <12>;
> >> +             hsync-active = <1>;
> >> +             vsync-active = <1>;
> >> +             remote-endpoint = <&csi2dc_out>;
> > nit: indentation
> >
> > Have you consided using bus-type property ? As that's a new binding I
> > would consider making it mandatory, and to modify the DT parsinga
> > routine accordingly to remove auto-guessing, which according to my
> > understanding is almost 'deprecated' ?
>
> Having bus-type would just be an useful addition for finding out the bus
> interface ? or it has some other consequences as well ?
> Current XISC code actually expects a parallel interface, so it's kind of
> set already, having a bus-type would not bring any new information from
> a driver perspective
>

Have I read the parsing routine wrong, as it seems BT.656 is also
supported. IF only parallel is, the dt parsing routine should set
bus_type to V4L2_MBUS_PARALLEL. Although there's still plenty of drivers
relying on auto-guessing, so I won't inist on this :)

Thanks
  j

> >
> >> +             };
> >> +     };
> >> +};
> >> +
> >> --
> >> 2.25.1
> >>
>
