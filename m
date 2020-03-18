Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2F3A189DAC
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 15:16:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbgCROQr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 10:16:47 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:43005 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbgCROQr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 10:16:47 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id B4E461BF209;
        Wed, 18 Mar 2020 14:16:42 +0000 (UTC)
Date:   Wed, 18 Mar 2020 15:19:39 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund@ragnatech.se, laurent.pinchart@ideasonboard.com,
        hyunk@xilinx.com, manivannan.sadhasivam@linaro.org,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: media: max9286: Add overlap window
Message-ID: <20200318141939.wzn7tdaxpb4anyou@uno.localdomain>
References: <20200316202757.529740-1-jacopo+renesas@jmondi.org>
 <20200316202757.529740-3-jacopo+renesas@jmondi.org>
 <c029c8b3-928b-24d0-777e-add1136bf051@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c029c8b3-928b-24d0-777e-add1136bf051@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Wed, Mar 18, 2020 at 09:45:14AM +0000, Kieran Bingham wrote:
> Hi Jacopo,
>
> On 16/03/2020 20:27, Jacopo Mondi wrote:
> > The MAX9286 chip exposes a way to control the 'overlap window'
> > parameter, most probably used in calculation of the frame
> > synchronization interval.
> >
> > When used in conjunction with some serializers, the overlap window has to
> > be disabled in order to correctly achieve frame sync locking.
> >
> > As the exact meaning of that control is not documented in the chip's
> > manual, require all DTS users to specify the value of the window. When,
> > and if, in future the meaning of control gets clarified and a default
>
> /in future/in the future/
> /of control/of the control/
>
> > behaviour (window enabled or disabled) can be established, a new boolean
> > property could supersede this one while being sure that older DTB are
>
> /DTB/DTBs/
>
> > fully specified to avoid confusion.
> >
> > Provide a few convenience macros for the window disabled and window
> > default value.
>
> Well it's not the best solution (putting hardcode values into the DTB)
> but I agree, without documentation these are almost 'magic values for
> the hardware' which is unfortunate.

>
> I do fear this may be the wrong place still though.
>
> This is dependent upon the 'serializer' connected, so is it a property
> of the serializer that the max9286 should query at probe time to see
> what it has connected?

I see two distinct issues here:
1) overlap window: this is really a property of the deserializer and
should be here specified
2) reverse channel amplitude: this depends on the serializer
configuration. we could make this a serializer property and have the
deserializer read it from the remote end,  which, if I'm not
mistaken is a no-go (not sure I recall why, but I refrained to do so
as I recall it was considered bad practice).

This should work by ideally rewriting the deser properties when
loading overlays, or simply configuring the deserializer correctly
depending on which serializer is connected in your system. I don't see
it working differently than any other endpoint property. If you have a
parallel video port configured with an active high vsync polarity and
you want to connect a camera with a low active signal state you should
change you video input port ni your .dts or rewrite it with an overlay
in case of dynamic loading.

>
> But that's just back to the whole topic of bus-parameter negotiations
> between the serializer and deserializer ...
>

The real solution here would be to have operations to call on the
remote to get the bus configuration and act accordingly...

I recently proposed
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=256127
which works on remote pads though, and we have one pad per gmsl
channel, while this should be queried from the device. Yes we can bend
this to interrogate the remote side on the first connected channel and
ignore the pad argument in the callee, but maybe we can do better than
proposing an API and working it around immediately ? :)

>
> But with this solution, any dtb segment or overlay for the serializer
> needs to modify the max9286 depending on it's requirements ... that
> feels a bit odd. Possible, I think, but odd.

Really not someone with any dt overlay experience here, but re-writing
properties of nodes defined in the DTS seems like an intentended
feature of overlays... Is anyone with more experience listenting (says
Jacopo looking at Geert ?)

Thanks
   j
>
> Do we have any precedence in existing DT to reference on this topic?
>
>
>
>
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  .../devicetree/bindings/media/i2c/maxim,max9286.yaml  | 11 +++++++++++
> >  MAINTAINERS                                           |  1 +
> >  include/dt-bindings/media/maxim-gmsl.h                |  9 +++++++++
> >  3 files changed, 21 insertions(+)
> >  create mode 100644 include/dt-bindings/media/maxim-gmsl.h
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > index f9d3e5712c59..ee8e0418b3f0 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > @@ -46,6 +46,14 @@ properties:
> >      description: GPIO connected to the \#PWDN pin with inverted polarity
> >      maxItems: 1
> >
> > +  # Until the overlap window control gets not clarified, require dts
> > +  # to set its value explicitly,
> > +  maxim,overlap-window:
> > +    description: Overlap window duration, in pixel clock cycles.
> > +    maxItems: 1
> > +    allOf:
> > +      - $ref: /schemas/types.yaml#/definitions/uint32
> > +
> >    ports:
> >      type: object
> >      description: |
> > @@ -146,6 +154,7 @@ properties:
> >  required:
> >    - compatible
> >    - reg
> > +  - maxim,overlap-window
> >    - ports
> >    - i2c-mux
> >
> > @@ -154,6 +163,7 @@ additionalProperties: false
> >  examples:
> >    - |
> >      #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/media/maxim-gmsl.h>
> >
> >      i2c@e66d8000 {
> >        #address-cells = <1>;
> > @@ -166,6 +176,7 @@ examples:
> >          reg = <0x2c>;
> >          poc-supply = <&camera_poc_12v>;
> >          enable-gpios = <&gpio 13 GPIO_ACTIVE_HIGH>;
> > +        maxim,overlap-window = MAX9286_OVLP_WINDOW_DISABLED;
> >
> >          ports {
> >            #address-cells = <1>;
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 21a9ff4fe684..3d2455085c80 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -10190,6 +10190,7 @@ M:	Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> >  L:	linux-media@vger.kernel.org
> >  S:	Maintained
> >  F:	Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > +F:	include/dt-bindings/media/maxim-gmsl.h
> >  F:	drivers/media/i2c/max9286.c
> >
> >  MAX9860 MONO AUDIO VOICE CODEC DRIVER
> > diff --git a/include/dt-bindings/media/maxim-gmsl.h b/include/dt-bindings/media/maxim-gmsl.h
> > new file mode 100644
> > index 000000000000..47945ffc3a4d
> > --- /dev/null
> > +++ b/include/dt-bindings/media/maxim-gmsl.h
> > @@ -0,0 +1,9 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _DT_BINDINGS_MEDIA_MAXIM_GMSL_H
> > +#define _DT_BINDINGS_MEDIA_MAXIM_GMSL_H
> > +
> > +/* MAX9286 default overlap values. */
> > +#define MAX9286_OVLP_WINDOW_DISABLED	<0>
> > +#define MAX9286_OVLP_WINDOW_DEFAULT	<0x1680>
> > +
> > +#endif /* _DT_BINDINGS_MEDIA_MAXIM_GMSL_H */
> >
>
