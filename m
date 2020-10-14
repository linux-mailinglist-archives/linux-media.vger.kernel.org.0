Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D99428E16F
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 15:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731293AbgJNNhs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 09:37:48 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:38867 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727302AbgJNNhs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 09:37:48 -0400
Received: by mail-ot1-f66.google.com with SMTP id i12so3433165ota.5;
        Wed, 14 Oct 2020 06:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s2wWOInQ8+vzngRWo3XRF2pWOPT3Nx6yp+ifXy9Qs0c=;
        b=RzKgZVO291rGbSb0EINUiJKH3ea4AXBy7UIWXAmUxxbQcKzeEVu8PoNleEWESyIZFo
         SqHxsBmq4MIn0PedU1X8FBPDQOsx1dDmaQ3Ygdpxrl1TlUv/0CSVoeACIna6hxoiQAU0
         r0uwJjXygclMzwOPwcxtVov8ZR8dWL+nH4TdsLuVukdo8H8yIjytcLvdHCaJUeNiYXWb
         pColmMAoAy5O4PH1NU5+YsSyVAvaicnqF4evkn0RHYwsgbowIUxKKRLptKqU2WHd0rlC
         iJFE6oIYVtKn4B9YYMC4Hjo9piePJlLHHVhob4Hfp6CAqLSHo3yxgMlkqAo3Pu9V3Ams
         Djmg==
X-Gm-Message-State: AOAM531Vl7RJLZ9XIVCmDHhhRLStdj3eEfY2BQsf2znGjH4f83zqe8GQ
        XZDINo1pABkHzwRvYpJhBjDuxVtOSLZmMgOh3Uo=
X-Google-Smtp-Source: ABdhPJy9iYGXrU7DqcZa7XGwlKnBaYB+luAsu4+KZd/HG51ramF2oqtYSKdYaI/WbWzc+G1S0t8taE1P2cHpyZnrj2Y=
X-Received: by 2002:a9d:5e14:: with SMTP id d20mr3259164oti.107.1602682667066;
 Wed, 14 Oct 2020 06:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <20201013150150.14801-1-fabrizio.castro.jz@renesas.com> <20201013150150.14801-5-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20201013150150.14801-5-fabrizio.castro.jz@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 14 Oct 2020 15:37:35 +0200
Message-ID: <CAMuHMdUxCiwjsFRYpVND-FLajaceUf+jWK0ZBR5Rp5xJ+MPDgA@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] media: dt-bindings: media: renesas,drif: Add
 r8a77965 support
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

On Tue, Oct 13, 2020 at 5:02 PM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> The r8a77965 (a.k.a. R-Car M3-N) device tree schema is
> compatible with the already documented R-Car Gen3 devices.
>
> Document r8a77965 support within renesas,drif.yaml.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/Documentation/devicetree/bindings/media/renesas,drif.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,drif.yaml
> @@ -53,6 +53,7 @@ properties:
>        - enum:
>          - renesas,r8a7795-drif        # R-Car H3
>          - renesas,r8a7796-drif        # R-Car M3-W
> +        - renesas,r8a77965-drif       # R-Car M3-N
>          - renesas,r8a77990-drif       # R-Car E3
>        - const: renesas,rcar-gen3-drif # Generic R-Car Gen3 compatible device

I guess you're aware M3-N (and E3) have an extra register?
Probably the driver just relies on its initial value, but it never hurts to be
explicit and initialize it properly.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
