Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDB5027551E
	for <lists+linux-media@lfdr.de>; Wed, 23 Sep 2020 12:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgIWKH3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Sep 2020 06:07:29 -0400
Received: from mail-oo1-f67.google.com ([209.85.161.67]:35466 "EHLO
        mail-oo1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgIWKH3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Sep 2020 06:07:29 -0400
Received: by mail-oo1-f67.google.com with SMTP id k13so4897514oor.2;
        Wed, 23 Sep 2020 03:07:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9XK+a5D95/1wbJzORmRvs/BV2jYI+52XziQI659z+Uw=;
        b=AiNUSh3eJtfbMQdjgvoP5PvXNVTCgXKydW2bl6FHmygEIfNWBx3WirKusOFksP+48V
         mcFo2NrkiV4wZ8ocWQGeFs8jegX8F999h9xMeBbiGSwAY2ERRULubaIDBSO12A6hKDRE
         3nz3dOPuGE0YXUMX2vDHMRBNIeakL9pg3QBz1NImymZN/WzduIkHqAysBXWYlL3CURrg
         YIVih4D4tKOopd6d7Y883zkJpJnPqLNQ1Sl0Hf5Q2S/T0YsRHhnUeHnuDuzRMMrf4iBD
         7jTr0OADbhtQJk0P82E3yZPoqjkgg//lH1ShgAvuTBikQnXl8zhQ5NQF6iHsd8tdeIhn
         WwRA==
X-Gm-Message-State: AOAM530GfdX4ihZk8cAcbHBv2kZyCidusUrxJ6sSFpCcZ6OgkWdJ3zic
        GgjpU1PyzkdiU3/QR0mpSHrLhov8vsPeqLqikek=
X-Google-Smtp-Source: ABdhPJzKgB7bjYh4yzRyc+MCDZwz93ndhYNHs1RaSZLKWCP5yqa8mIJ+TRXvBdiU0376eaYprTKvjBHyRp8WyQRlfis=
X-Received: by 2002:a4a:e616:: with SMTP id f22mr6038730oot.11.1600855648513;
 Wed, 23 Sep 2020 03:07:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200916105949.24858-1-fabrizio.castro.jz@renesas.com> <20200916105949.24858-3-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20200916105949.24858-3-fabrizio.castro.jz@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 23 Sep 2020 12:07:17 +0200
Message-ID: <CAMuHMdU-DSqUmch3OR1pSbDkVNGDKx_YGT_432uYpoPDh_nS1Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] media: dt-bindings: media: renesas,drif: Convert
 to json-schema
To:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabrizio,

On Wed, Sep 16, 2020 at 1:00 PM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> Convert the Renesas DRIF bindings to DT schema and update
> MAINTAINERS accordingly.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/renesas,drif.yaml

> +properties:

> +  pinctrl-0:
> +    maxItems: 1
> +
> +  pinctrl-names:
> +    maxItems: 1
> +    items:
> +      - const: default

I think these are added automatically by the tooling, so there is no
need to list them explicitly.
Or do you need to list them here because of the required logic below?

> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - dmas
> +  - dma-names
> +  - renesas,bonding

Missing "power-domains".

> +
> +if:
> +  required:
> +    - renesas,primary-bond
> +then:
> +  required:
> +    - pinctrl-0
> +    - pinctrl-names
> +    - port

The last 3 properties must not be present for a secondary interface,
right?  To express that, I think you need to add:

    else:
      properties:
        - pinctrl-0: false
        - pinctrl-names: false
        - port: false

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
