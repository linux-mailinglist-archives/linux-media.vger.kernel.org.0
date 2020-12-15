Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B26FC2DAE4A
	for <lists+linux-media@lfdr.de>; Tue, 15 Dec 2020 14:50:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727997AbgLONuT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Dec 2020 08:50:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:58998 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726844AbgLONuN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Dec 2020 08:50:13 -0500
X-Gm-Message-State: AOAM530/lLb4vZRsy2dfnBxZoELggSFnMR20RXD79GLrHmjGs0GxUhKb
        0yrYa/K1Wxxuyqux384jkXfin7V9nxjmEYxS5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608040171;
        bh=1IMbW6DcnKL8W48aPBvi3J2CKA3F7ooAmZekZr9m+L0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HTlC43YJ+fLFivFeqZJrNSvXJmIwUuO2fDRjtyPCJ7F+4WTLxZxKq9aBQrwKiTcc3
         NuRf3//DqITqA9N/Dcp1Z5lr04c8E860zj0NyMXmaicXuFXS27x6fqvFyQKc1GOru3
         2SXE4QzUrrj9cBmjoXKcph0b4L9xCCOGdjpo+mDXm6SqABTnxhZ7f5RqzuWxVcnagj
         sBLadlh0rhr+AAwfDKWmlxp+ySzujgV/bGGlAY5d/JpOvvnu1GyjcwDSvx6XUKrvlW
         7cCni0zV9BU2tqKf9cjeV8Rd9E3HQuZbnLMDFuwnlGGQs+9ZiuZmhWYvG7PWiRHxEP
         aXPaULd7uU9Fw==
X-Google-Smtp-Source: ABdhPJxeSn5V2lNIzJOznNBcsMQo5d0IxoNQaeQ4VnHLUv/oXb7MgUGmNleynG5tLxUE24Cj719pHTH+rRKYuDU0dKQ=
X-Received: by 2002:a05:6214:c23:: with SMTP id a3mr37646233qvd.4.1608040170394;
 Tue, 15 Dec 2020 05:49:30 -0800 (PST)
MIME-Version: 1.0
References: <20201116135305.81319-1-jacopo+renesas@jmondi.org>
 <20201116135305.81319-3-jacopo+renesas@jmondi.org> <20201130220048.GA3104550@robh.at.kernel.org>
 <20201215111420.zpc67jkary3l5j4z@uno.localdomain> <CAMuHMdX1bzRqZEvXod3QNx+SNybP85wpQ66=bxyQJ4kAoo6X1g@mail.gmail.com>
 <20201215120809.l4qrwdfoq5jpsfi5@uno.localdomain>
In-Reply-To: <20201215120809.l4qrwdfoq5jpsfi5@uno.localdomain>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 15 Dec 2020 07:49:18 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+u4tqxdWGvSFu+SiuM3dA1g0tpWZHnnz0zSjoMnhPWXA@mail.gmail.com>
Message-ID: <CAL_Jsq+u4tqxdWGvSFu+SiuM3dA1g0tpWZHnnz0zSjoMnhPWXA@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] dt-bindings: media: max9286: Document 'maxim,initial-reverse-channel-mV'
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 15, 2020 at 6:08 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Hi Geert,
>
> On Tue, Dec 15, 2020 at 12:44:17PM +0100, Geert Uytterhoeven wrote:
> > Hi Jacopo,
> >
> > On Tue, Dec 15, 2020 at 12:14 PM Jacopo Mondi <jacopo@jmondi.org> wrote:
> > > On Mon, Nov 30, 2020 at 03:00:48PM -0700, Rob Herring wrote:
> > > > On Mon, Nov 16, 2020 at 02:52:59PM +0100, Jacopo Mondi wrote:
> > > > > Document the 'initial-reverse-channel-mV' vendor property in the
> > > > > bindings document of the max9286 driver.
> > > > >
> > > > > The newly introduced property allows to specifying the initial
> > > > > configuration of the GMSL reverse control channel to accommodate
> > > > > remote serializers pre-programmed with the high threshold power
> > > > > supply noise immunity enabled.
> > > > >
> > > > > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > > > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > > > ---
> > > > >  .../bindings/media/i2c/maxim,max9286.yaml     | 23 +++++++++++++++++++
> > > > >  1 file changed, 23 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > > > > index 9ea827092fdd..f61234d204fa 100644
> > > > > --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > > > > +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > > > > @@ -51,6 +51,26 @@ properties:
> > > > >    '#gpio-cells':
> > > > >      const: 2
> > > > >
> > > > > +  maxim,initial-reverse-channel-mV:
> > > >
> > > > Use standard unit suffix.
> > > >
> > >
> > > Which one ? :)
> >
> > Documentation/devicetree/bindings/property-units.txt
> >
>
> Oh, I had no idea we have this.
> It's been here since a long time it seems, my bad
>         Date:   Mon Feb 8 10:55:55 2016
>
> > > I see in v5.10 one 'mV', three 'mv', one 'millivolts', several
> > > 'microvolts'.
> > >
> > > I'll go with the majority and make this
> > > 'maxim,initial-reverse-channel-mv'
> >
> > Wrong guess ;-)
> >
>
> Maybe a stupid question, but the fact only 'microvolts' is listed, is
> an implied suggestion to use 'millivolts' for simmetry or to express
> the value in micro volts ?

Use microvolts. Not having every possible unit is on purpose.

Rob
