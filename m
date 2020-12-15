Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 363932DAC43
	for <lists+linux-media@lfdr.de>; Tue, 15 Dec 2020 12:48:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728153AbgLOLpS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Dec 2020 06:45:18 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:32808 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726176AbgLOLpJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Dec 2020 06:45:09 -0500
Received: by mail-oi1-f195.google.com with SMTP id d203so1815848oia.0;
        Tue, 15 Dec 2020 03:44:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BbG51VDL4a3D3WxvKDwdNNij3DPMhXdykNgU9lNfhY4=;
        b=p/GCag1Ta/KIrktKek+HseIeF/7TTVxs6CL5lspMTTsoJX/cjNaqc8Md2drCGlwp3q
         ESOM4OQvYZQh5uxAs+ZLxkWpm/oigR+M53zeZqw/kqpGjuYi4y6NHkHuGNE47AKIHBaB
         9wEUGOq3lQBbEVsjQ3lmmhrcH9cdt/3lKOrOLek0lwzm1Jy1LHFQSGElwk8oNKJ4JsEE
         Cg0oDyoX8a0WHruCYLgLzz6m2uW2WqzI0ufx/VZhoFemjLVuJeahWikZ5DUkdKMdcnyI
         MiEKsdnLwCuKyArQFsIUymCdtQDlrzD0D3WgIzBRJLTGFIgsIjfWikJCj3Y2g/UGGMMU
         k9OQ==
X-Gm-Message-State: AOAM532nQZRDhmUw2vnsklfRovvWGeYYiuvWlpb+07fppBE0y9c8Figq
        cQb35w+COe8DIviPLXsI6tDWFUGJFio6i/SOrG8=
X-Google-Smtp-Source: ABdhPJwTIsyWmDlBuDcxelxLOBIEQyA3zttZ+JMw3/42rMVSz+JSr/I6zBJ1mxVhoNfRZpLCvuATTM66b7ku9/kdKZc=
X-Received: by 2002:aca:5c08:: with SMTP id q8mr21310941oib.54.1608032668032;
 Tue, 15 Dec 2020 03:44:28 -0800 (PST)
MIME-Version: 1.0
References: <20201116135305.81319-1-jacopo+renesas@jmondi.org>
 <20201116135305.81319-3-jacopo+renesas@jmondi.org> <20201130220048.GA3104550@robh.at.kernel.org>
 <20201215111420.zpc67jkary3l5j4z@uno.localdomain>
In-Reply-To: <20201215111420.zpc67jkary3l5j4z@uno.localdomain>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Dec 2020 12:44:17 +0100
Message-ID: <CAMuHMdX1bzRqZEvXod3QNx+SNybP85wpQ66=bxyQJ4kAoo6X1g@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] dt-bindings: media: max9286: Document 'maxim,initial-reverse-channel-mV'
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Rob Herring <robh@kernel.org>,
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

Hi Jacopo,

On Tue, Dec 15, 2020 at 12:14 PM Jacopo Mondi <jacopo@jmondi.org> wrote:
> On Mon, Nov 30, 2020 at 03:00:48PM -0700, Rob Herring wrote:
> > On Mon, Nov 16, 2020 at 02:52:59PM +0100, Jacopo Mondi wrote:
> > > Document the 'initial-reverse-channel-mV' vendor property in the
> > > bindings document of the max9286 driver.
> > >
> > > The newly introduced property allows to specifying the initial
> > > configuration of the GMSL reverse control channel to accommodate
> > > remote serializers pre-programmed with the high threshold power
> > > supply noise immunity enabled.
> > >
> > > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > ---
> > >  .../bindings/media/i2c/maxim,max9286.yaml     | 23 +++++++++++++++++++
> > >  1 file changed, 23 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > > index 9ea827092fdd..f61234d204fa 100644
> > > --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > > +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > > @@ -51,6 +51,26 @@ properties:
> > >    '#gpio-cells':
> > >      const: 2
> > >
> > > +  maxim,initial-reverse-channel-mV:
> >
> > Use standard unit suffix.
> >
>
> Which one ? :)

Documentation/devicetree/bindings/property-units.txt

> I see in v5.10 one 'mV', three 'mv', one 'millivolts', several
> 'microvolts'.
>
> I'll go with the majority and make this
> 'maxim,initial-reverse-channel-mv'

Wrong guess ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
