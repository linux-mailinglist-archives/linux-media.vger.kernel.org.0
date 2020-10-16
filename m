Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCA8A29059E
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 14:56:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407972AbgJPM4Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 08:56:24 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:40863 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407894AbgJPM4X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 08:56:23 -0400
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 397C5100008;
        Fri, 16 Oct 2020 12:56:17 +0000 (UTC)
Date:   Fri, 16 Oct 2020 16:56:03 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v3 2/7] dt-bindings: media: max9286: Document
 'maxim,high-threshold'
Message-ID: <20201016145603.bapqjxsvezn6flyv@uno.localdomain>
References: <20201016120625.64337-1-jacopo+renesas@jmondi.org>
 <20201016120625.64337-3-jacopo+renesas@jmondi.org>
 <CAMuHMdUof5Yb=5notGDYycJtZyLzGp2RPjJ=m6GVodBRDxw9ow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdUof5Yb=5notGDYycJtZyLzGp2RPjJ=m6GVodBRDxw9ow@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert
   (and Kieran, as his question on the other patch is actually on
   the same point)

On Fri, Oct 16, 2020 at 01:50:34PM +0200, Geert Uytterhoeven wrote:
> Hi Jacopo,
>
> On Fri, Oct 16, 2020 at 12:09 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> > Document the 'maxim,high-threshold' vendor property in the bindings
> > document of the max9286 driver.
> >
> > The newly introduced boolean property allows controlling the initial
> > configuration of the GMSL reverse control channel to accommodate
> > remote serializers pre-programmed with the high threshold power
> > supply noise immunity enabled.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>
> Thanks for your patch!
>
> > --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > @@ -51,6 +51,19 @@ properties:
> >    '#gpio-cells':
> >      const: 2
> >
> > +  maxim,high-threshold:
> > +    description: |
> > +      A boolean property to increase the initial amplitude of the reverse
> > +      control channel to compensate for remote serializers pre-programmed with
> > +      high threshold noise-immunity.
> > +
> > +      Some camera modules (in example the RDACM20 one) include an on-board MCU
> > +      that pre-programs the embedded serializer with reverse channel power
> > +      supply noise immunity enabled. The deserializer shall increase its
> > +      reverse channel amplitude to compensate that and be able to communicate
> > +      with the remote end.
> > +    type: boolean
>
> Does this "high" threshold correspond to some numerical value?
> I.e. could we run into a future need to support more values than just
> true/false?
> If yes, we may want to use a numerical value from the start.

So, this boolean property controls the initial setting of the reverse
channel amplitude, which has to be opportunely adjusted to be able to
probe the remote devices as i2c messages are bridged on the reverse
channel from the deserializer to the remote serializers.

It also implies that if the initial setting is not "high" it has to be
increased after the remotes have probed, as it is assumed at the end
the remotes' probe() routine they have enabled their high threshold
noise immunity feature.

The register that controls the de-serializer reverse channel amplitude
is not fully documented in the chip manual version I have, but the
application developer guide shows that it can range from 30mV to
200mV. The same developer guide shows 100mV and 170mV as "initial" and
"high threshold" values to be used.

On the serializer's side (MAX9271 at least) high threshold is a
boolean control, it is either enabled or disabled.

Hence I suspect that for the max9286-max9271 combo, using fixed 100mV
and 170mV values is enough. Other serializers might allow a more fine
grained control of the noise cancelling threshold, and might require a
more precise adjustment of the deserializer side. I'm honestly not
sure at this point not having seen any other one.

So yes, this is a deserializer setting that depends on the serializer
in use, and I'm not 100% comfortable expressing it as a deserializer
property. That said, having an initial numerical value might serve the
same purpose allowing more flexibility, if other serializers require a
more precise control of the initial amplitude.

After the remotes have probed, we could also re-explore the
possibility of getting the bus configuration using get_mbus_config, as
detailed in the v1 cover letter [1] as at that time their sub-devices
have been registered and we can call operations on them. But again,
this might be not required at all.

Thanks
   j

[1] https://www.spinics.net/lists/linux-renesas-soc/msg52886.html

>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
