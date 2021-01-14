Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB3A2F6176
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 14:04:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728729AbhANNDh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 08:03:37 -0500
Received: from mail-qk1-f174.google.com ([209.85.222.174]:41188 "EHLO
        mail-qk1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726066AbhANNDf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 08:03:35 -0500
Received: by mail-qk1-f174.google.com with SMTP id 19so7523702qkm.8;
        Thu, 14 Jan 2021 05:03:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tevr+spNEpRnq44NthoNPfr11G6U21MwOk+W3Rj2u8A=;
        b=p6izCGH0r6lIcugzvAuaLO6nS00KMZZUCs/OkbVJt6LaL3JY5MonNKAKsp3D6ThimQ
         M2hQc0OpIxpRh/Mt+i74O4fHdYeDdFt3SqIcYGyaXTD/UgAN9pOnqUGRnSh1RI0tPmKp
         5xr8eZErTtivPFMNrA/0sAW5vYLvsdtwDCOE6tbpEZuC0+qMWfljFsay1ouwP5NsGGXF
         rvrO5V/L3MpCBY4d/uqv0wUzM1k52NUsrFfX7jKQ8RQfYC6tHfL2AWaxXyMDW8OvHqZD
         FHwSiUGM4Nx2j9aMcQ+miQzuzw7gje1OfLIuyed6rWPRF4i4ySpCgk4CR5X6Bl29q7Ne
         m4TQ==
X-Gm-Message-State: AOAM5338fL0hcZcTXhdla7EqOg8nVkNlv5Bd4cfzjgs4BQahPq64gKur
        FfxXH56YuhYYmFRylAu7pjodAq5vCs/lc5U5+TQ=
X-Google-Smtp-Source: ABdhPJz7zX1VUb6yM/UFCYla+bwht/B5d+uqLgHlNnpvlh8YvZy2Bzj7uocTaFDWEPNqsL1pXXusBDtHKGx+wylrIcs=
X-Received: by 2002:a37:a950:: with SMTP id s77mr7011771qke.122.1610629374384;
 Thu, 14 Jan 2021 05:02:54 -0800 (PST)
MIME-Version: 1.0
References: <20201021135332.4928-1-fabrizio.castro.jz@renesas.com> <20201021135332.4928-3-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20201021135332.4928-3-fabrizio.castro.jz@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 14 Jan 2021 14:02:42 +0100
Message-ID: <CAMuHMdWj_Gm6vwOF9Akz84WakA3KTcNTRHte6ukEF_U5=Q8xFA@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] media: dt-bindings: media: renesas,drif: Convert
 to json-schema
To:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabrizio, Rob,

On Wed, Oct 21, 2020 at 3:53 PM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> Convert the Renesas DRIF bindings to DT schema and update
> MAINTAINERS accordingly.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/renesas,drif.yaml

> +  clock-names:
> +    maxItems: 1
> +    items:
> +      - const: fck

With latest dt-schema, "make dt_binding_check" complains:

    Documentation/devicetree/bindings/media/renesas,drif.yaml:
properties:clock-names:maxItems: False schema does not allow 1
    Documentation/devicetree/bindings/media/renesas,drif.yaml:
ignoring, error in schema: properties: clock-names: maxItems

Using

       clock-names:
         const: fck

Fixes that.

However, I'm wondering why I do not get a complaint about the similar
clock/clock-names in
Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml.
Because they're part of an else branch?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
