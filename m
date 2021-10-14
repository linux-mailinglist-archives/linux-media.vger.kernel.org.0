Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31A4D42D922
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 14:14:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230431AbhJNMQq convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 14 Oct 2021 08:16:46 -0400
Received: from mail-ua1-f42.google.com ([209.85.222.42]:37413 "EHLO
        mail-ua1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbhJNMQp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 08:16:45 -0400
Received: by mail-ua1-f42.google.com with SMTP id f4so10801875uad.4;
        Thu, 14 Oct 2021 05:14:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uSgwEdSK/cP0BAVR7w9BC8teraQBneOdj/TBKAiNitk=;
        b=ArYVcTBw+s2PBWqlUn27p7yVzRihhaHJuK2AUCCgPBlWkCWvmxUrVfbt33a6p1WIUO
         BWWDPppIEKQqeBSmkezmgh1goXNsRm8aI9l/xosvTzrjunNtoYjddG8kPtfdysJ+wYvU
         Wby5foSU+/D3wIjALFR+d0bOpMu63gOfudeW0W1W2Lx+M7x4peF1zcWRLl0mJcosXI3V
         AFqdluAt3+FlCBRE9TP0pdaanD8UWtUUPktsrRFxFdUa6DCtjZdlmn9e7shkPtXSDdPu
         qwl2RzMkyEHULQ2AitIeo7gxRq1zUjphrjg8v7hSexDA5N3oilZkl9W/QRG17PW9gWtw
         SV+A==
X-Gm-Message-State: AOAM532+3PbjzGIPR43f0ldFk/PdHFwDS0C/vgylqstLeYVY/7auAim0
        oYCALe3Rgt+kivRCo0d0j9EiAtmb4J3No+053Yk=
X-Google-Smtp-Source: ABdhPJyyhKhVhCwQN/zriVaXalKFtQGrHLlEA5DcmiD5fPytYuZJnMSerls8J3njxuXeZ2I/DFezSNikYbLBL6Tyvbg=
X-Received: by 2002:ab0:16d4:: with SMTP id g20mr5758794uaf.114.1634213677950;
 Thu, 14 Oct 2021 05:14:37 -0700 (PDT)
MIME-Version: 1.0
References: <20211012183324.717975-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdX8LzmksfB85iSMX4+RYq=SYTamw5C3GNgbAV+9f1uAyQ@mail.gmail.com>
 <YWgK3c+8wHWw8IYM@oden.dyn.berto.se> <CAMuHMdWsLzLqVNdt2EGD20fMXxb3R70Hx3EyPHwLsFc82qAG8A@mail.gmail.com>
 <YWgW+ArZ48NeHr5F@oden.dyn.berto.se>
In-Reply-To: <YWgW+ArZ48NeHr5F@oden.dyn.berto.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 14 Oct 2021 14:14:26 +0200
Message-ID: <CAMuHMdVBVUvyVkjc80fJwuo+-XoEerhOx3QX3w2XtFYf-YY5=g@mail.gmail.com>
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

On Thu, Oct 14, 2021 at 1:39 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On 2021-10-14 13:07:30 +0200, Geert Uytterhoeven wrote:
> > On Thu, Oct 14, 2021 at 12:48 PM Niklas Söderlund
> > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > On 2021-10-13 17:08:44 +0200, Geert Uytterhoeven wrote:
> > > > On Tue, Oct 12, 2021 at 8:48 PM Niklas Söderlund
> > > > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > > > Convert ADV748X analog video decoder documentation to json-schema.
> >
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/media/i2c/adv748x.yaml
> >
> > > > > +allOf:
> > > > > +  - if:
> > > > > +      properties:
> > > > > +        compatible:
> > > > > +          contains:
> > > > > +            const: adi,adv7481
> > > > > +    then:
> > > > > +      properties:
> > > > > +        interrupts:
> > > > > +          minItems: 1
> > > > > +          maxItems: 3
> > > > > +
> > > > > +        interrupt-names:
> > > > > +          minItems: 1
> > > > > +          items:
> > > > > +            - enum: [ intrq1, intrq2, intrq3 ]
> > > > > +            - enum: [ intrq1, intrq2, intrq3 ]
> > > > > +            - enum: [ intrq1, intrq2, intrq3 ]
> > > >
> > > > They can really appear in any order?
> > >
> > > Yes, as not all interrupt lines may be wired up. It would be nice to
> > > enforce that intrq2 must come before intrq3 if both are wired but I'm
> > > not sure how to express that.
> >
> > You mean
> >
> >     items:
> >       - const: intrq1
> >       - const: intrq2
> >       - const: intrq3
>
> Will this not enforce that if intrq2 is present intrq1 must be too?
>
> >
> > ?
> >
> > If the first two might be exchanged, you can still fix the last one:
> >
> >     items:
> >       - const: [ intrq1, intrq2 ]
> >       - const: [ intrq1, intrq2 ]
> >       - const: intrq3
>
> Same here, will this not fail if only intrq3 is given?

Right. And these combinations are all valid?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
