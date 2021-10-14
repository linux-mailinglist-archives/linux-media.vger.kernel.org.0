Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9FF942D7BF
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 13:07:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbhJNLJs convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 14 Oct 2021 07:09:48 -0400
Received: from mail-ua1-f51.google.com ([209.85.222.51]:41600 "EHLO
        mail-ua1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbhJNLJr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 07:09:47 -0400
Received: by mail-ua1-f51.google.com with SMTP id r17so10417423uaf.8;
        Thu, 14 Oct 2021 04:07:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/B6ewknB+MnHQvbRitQiDqwEigA4oJZAAkLELf2uq8k=;
        b=IhRG2NI8CtKD5Cn1F0OeiTfxqOdTKpDjU30BnKwwIG1AmBvAOrlf6aH46+HFlkuMnl
         9J8T+H1KQxXy2sGe2ityu/GmRHk46r8UJlmAtZymMM9TRMGdcEyKQHvZresiRPnDzKQt
         sTOnNsKsqhxlOGQjamylnbmhuzgVN67Gk3WiMRpF6a9qqip4V82USRxuPzhReNo3X2yC
         f277ZSS7il0bcNtW2+8zc+b8MWHGhcun/s9SoPtAEvGBfZW058DKUIz5+tGnRlLjJWm5
         O4C4005n8RSvOt76M93MK+pASg93+RJjtj9+EfpfQfCPJxV1UmmhckVzaLCHqk2mnoAB
         RrLg==
X-Gm-Message-State: AOAM531jcBWiU94xxfKlhaKoaPB66SECUZKZP8k4v0f7VFBu3+Jac8C8
        nWcogH7CBsVcKpgp7qoNdQowe/TTGgjT44wohRM=
X-Google-Smtp-Source: ABdhPJzR8w7sEGJx4FbLAPby8TuPvSntTiEjxdZmilE9t67Wa2qfpVF/SNWeNBBOB81v0B0bGAoPskq58OmJlR5TUBw=
X-Received: by 2002:a67:d583:: with SMTP id m3mr6014080vsj.41.1634209662141;
 Thu, 14 Oct 2021 04:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211012183324.717975-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdX8LzmksfB85iSMX4+RYq=SYTamw5C3GNgbAV+9f1uAyQ@mail.gmail.com> <YWgK3c+8wHWw8IYM@oden.dyn.berto.se>
In-Reply-To: <YWgK3c+8wHWw8IYM@oden.dyn.berto.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 14 Oct 2021 13:07:30 +0200
Message-ID: <CAMuHMdWsLzLqVNdt2EGD20fMXxb3R70Hx3EyPHwLsFc82qAG8A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: adv748x: Convert bindings to json-schema
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Thu, Oct 14, 2021 at 12:48 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On 2021-10-13 17:08:44 +0200, Geert Uytterhoeven wrote:
> > On Tue, Oct 12, 2021 at 8:48 PM Niklas Söderlund
> > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > Convert ADV748X analog video decoder documentation to json-schema.

> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/adv748x.yaml

> > > +allOf:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: adi,adv7481
> > > +    then:
> > > +      properties:
> > > +        interrupts:
> > > +          minItems: 1
> > > +          maxItems: 3
> > > +
> > > +        interrupt-names:
> > > +          minItems: 1
> > > +          items:
> > > +            - enum: [ intrq1, intrq2, intrq3 ]
> > > +            - enum: [ intrq1, intrq2, intrq3 ]
> > > +            - enum: [ intrq1, intrq2, intrq3 ]
> >
> > They can really appear in any order?
>
> Yes, as not all interrupt lines may be wired up. It would be nice to
> enforce that intrq2 must come before intrq3 if both are wired but I'm
> not sure how to express that.

You mean

    items:
      - const: intrq1
      - const: intrq2
      - const: intrq3

?

If the first two might be exchanged, you can still fix the last one:

    items:
      - const: [ intrq1, intrq2 ]
      - const: [ intrq1, intrq2 ]
      - const: intrq3

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
