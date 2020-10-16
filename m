Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABC402905B1
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 15:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408019AbgJPNFN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 09:05:13 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35912 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395497AbgJPNFN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 09:05:13 -0400
Received: by mail-ot1-f67.google.com with SMTP id 32so2331940otm.3;
        Fri, 16 Oct 2020 06:05:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hgZ4r6vt8BwAEzbbDhL0J/G4riptZibuzauSDCCs9mY=;
        b=cLWhEt43/ytRRsgdMLABbl70dA6Y4O+nDKCAUSlwNoGL9/En4PWKzq+2LTAqcSQMXt
         xXRghQnc/DZn1zggazImJM9h/VK8jmuj7/DFe9pWEMTdIpZ5KTYXcYknJY+BmZK0VcL/
         BWSIOGNfLXgC575ljulRh/Ge+8Zo9KbH7okswdrGT0Sxvl8IVInw6rUzoE+5o6iQRgvP
         LnQN/1aOpeydZZc0HUUmoOP9AUHgvnoxF2FP66vp1P5mmWiZgdVXSJkutjw45PJ3X2ir
         gXgZ5bbg0Zh7OZgrX0qvMKRBAGo8ci6f+LV0dbYqWWU5GZDVnPZ6finA69AdSXe/Jfoa
         vsUw==
X-Gm-Message-State: AOAM53384TU4nNg4hKLkwFy70GY/e3MjMIU0Fl8xnr0ZQdiEVRJEhI86
        tMAgpWF0yzuZbm0U6nHFqiDzmI80pui7FqwJRMg=
X-Google-Smtp-Source: ABdhPJyasE8+L+WhsIto8lbmb2EyPI+NoyAAJFonBZZvbqbbT/x3qaVP8Iz0aCbicgwpW8HxK3tJj0ctUuQP7PT70Q4=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr2446243otc.145.1602853511721;
 Fri, 16 Oct 2020 06:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <20201016120625.64337-1-jacopo+renesas@jmondi.org>
 <20201016120625.64337-3-jacopo+renesas@jmondi.org> <CAMuHMdUof5Yb=5notGDYycJtZyLzGp2RPjJ=m6GVodBRDxw9ow@mail.gmail.com>
 <20201016145603.bapqjxsvezn6flyv@uno.localdomain>
In-Reply-To: <20201016145603.bapqjxsvezn6flyv@uno.localdomain>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 16 Oct 2020 15:04:59 +0200
Message-ID: <CAMuHMdWwK=3yOQ8b5suN-U8YtGVomjOZ+gZrTHpUaix2xDP8hw@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] dt-bindings: media: max9286: Document 'maxim,high-threshold'
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Fri, Oct 16, 2020 at 2:56 PM Jacopo Mondi <jacopo@jmondi.org> wrote:
> On Fri, Oct 16, 2020 at 01:50:34PM +0200, Geert Uytterhoeven wrote:
> > On Fri, Oct 16, 2020 at 12:09 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> > > Document the 'maxim,high-threshold' vendor property in the bindings
> > > document of the max9286 driver.
> > >
> > > The newly introduced boolean property allows controlling the initial
> > > configuration of the GMSL reverse control channel to accommodate
> > > remote serializers pre-programmed with the high threshold power
> > > supply noise immunity enabled.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >
> > Thanks for your patch!
> >
> > > --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > > +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > > @@ -51,6 +51,19 @@ properties:
> > >    '#gpio-cells':
> > >      const: 2
> > >
> > > +  maxim,high-threshold:
> > > +    description: |
> > > +      A boolean property to increase the initial amplitude of the reverse
> > > +      control channel to compensate for remote serializers pre-programmed with
> > > +      high threshold noise-immunity.
> > > +
> > > +      Some camera modules (in example the RDACM20 one) include an on-board MCU
> > > +      that pre-programs the embedded serializer with reverse channel power
> > > +      supply noise immunity enabled. The deserializer shall increase its
> > > +      reverse channel amplitude to compensate that and be able to communicate
> > > +      with the remote end.
> > > +    type: boolean
> >
> > Does this "high" threshold correspond to some numerical value?
> > I.e. could we run into a future need to support more values than just
> > true/false?
> > If yes, we may want to use a numerical value from the start.
>
> So, this boolean property controls the initial setting of the reverse
> channel amplitude, which has to be opportunely adjusted to be able to
> probe the remote devices as i2c messages are bridged on the reverse
> channel from the deserializer to the remote serializers.
>
> It also implies that if the initial setting is not "high" it has to be
> increased after the remotes have probed, as it is assumed at the end
> the remotes' probe() routine they have enabled their high threshold
> noise immunity feature.
>
> The register that controls the de-serializer reverse channel amplitude
> is not fully documented in the chip manual version I have, but the
> application developer guide shows that it can range from 30mV to
> 200mV. The same developer guide shows 100mV and 170mV as "initial" and
> "high threshold" values to be used.
>
> On the serializer's side (MAX9271 at least) high threshold is a
> boolean control, it is either enabled or disabled.
>
> Hence I suspect that for the max9286-max9271 combo, using fixed 100mV
> and 170mV values is enough. Other serializers might allow a more fine
> grained control of the noise cancelling threshold, and might require a
> more precise adjustment of the deserializer side. I'm honestly not
> sure at this point not having seen any other one.
>
> So yes, this is a deserializer setting that depends on the serializer
> in use, and I'm not 100% comfortable expressing it as a deserializer
> property. That said, having an initial numerical value might serve the
> same purpose allowing more flexibility, if other serializers require a
> more precise control of the initial amplitude.
>
> After the remotes have probed, we could also re-explore the
> possibility of getting the bus configuration using get_mbus_config, as
> detailed in the v1 cover letter [1] as at that time their sub-devices
> have been registered and we can call operations on them. But again,
> this might be not required at all.

Sounds like "maxim,<foo>-threshold-mV" is the way to go?
If you don't know the exact register configuration, and need to
convert to a boolean in the driver, you can still use something like
"threshold < 150 ? ... : ...".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
