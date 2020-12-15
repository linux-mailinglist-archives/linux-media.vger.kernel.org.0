Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B71F2DACBD
	for <lists+linux-media@lfdr.de>; Tue, 15 Dec 2020 13:10:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728826AbgLOMJN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Dec 2020 07:09:13 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:45609 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728706AbgLOMJA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Dec 2020 07:09:00 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 89A95FF80E;
        Tue, 15 Dec 2020 12:07:58 +0000 (UTC)
Date:   Tue, 15 Dec 2020 13:08:09 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Rob Herring <robh@kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>
Subject: Re: [PATCH v5 2/8] dt-bindings: media: max9286: Document
 'maxim,initial-reverse-channel-mV'
Message-ID: <20201215120809.l4qrwdfoq5jpsfi5@uno.localdomain>
References: <20201116135305.81319-1-jacopo+renesas@jmondi.org>
 <20201116135305.81319-3-jacopo+renesas@jmondi.org>
 <20201130220048.GA3104550@robh.at.kernel.org>
 <20201215111420.zpc67jkary3l5j4z@uno.localdomain>
 <CAMuHMdX1bzRqZEvXod3QNx+SNybP85wpQ66=bxyQJ4kAoo6X1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdX1bzRqZEvXod3QNx+SNybP85wpQ66=bxyQJ4kAoo6X1g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

On Tue, Dec 15, 2020 at 12:44:17PM +0100, Geert Uytterhoeven wrote:
> Hi Jacopo,
>
> On Tue, Dec 15, 2020 at 12:14 PM Jacopo Mondi <jacopo@jmondi.org> wrote:
> > On Mon, Nov 30, 2020 at 03:00:48PM -0700, Rob Herring wrote:
> > > On Mon, Nov 16, 2020 at 02:52:59PM +0100, Jacopo Mondi wrote:
> > > > Document the 'initial-reverse-channel-mV' vendor property in the
> > > > bindings document of the max9286 driver.
> > > >
> > > > The newly introduced property allows to specifying the initial
> > > > configuration of the GMSL reverse control channel to accommodate
> > > > remote serializers pre-programmed with the high threshold power
> > > > supply noise immunity enabled.
> > > >
> > > > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > > ---
> > > >  .../bindings/media/i2c/maxim,max9286.yaml     | 23 +++++++++++++++++++
> > > >  1 file changed, 23 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > > > index 9ea827092fdd..f61234d204fa 100644
> > > > --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > > > +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > > > @@ -51,6 +51,26 @@ properties:
> > > >    '#gpio-cells':
> > > >      const: 2
> > > >
> > > > +  maxim,initial-reverse-channel-mV:
> > >
> > > Use standard unit suffix.
> > >
> >
> > Which one ? :)
>
> Documentation/devicetree/bindings/property-units.txt
>

Oh, I had no idea we have this.
It's been here since a long time it seems, my bad
        Date:   Mon Feb 8 10:55:55 2016

> > I see in v5.10 one 'mV', three 'mv', one 'millivolts', several
> > 'microvolts'.
> >
> > I'll go with the majority and make this
> > 'maxim,initial-reverse-channel-mv'
>
> Wrong guess ;-)
>

Maybe a stupid question, but the fact only 'microvolts' is listed, is
an implied suggestion to use 'millivolts' for simmetry or to express
the value in micro volts ?

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
