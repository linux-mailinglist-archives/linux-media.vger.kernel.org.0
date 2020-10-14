Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A193A28E179
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 15:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731314AbgJNNkI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 09:40:08 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:38541 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727421AbgJNNkI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 09:40:08 -0400
Received: by mail-oi1-f196.google.com with SMTP id h10so3251947oie.5;
        Wed, 14 Oct 2020 06:40:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jCnZ/JpB+JXOTDIrqvdLg2bEBOQwlU7eY0le6lMCNEQ=;
        b=KuG9M7cz4UWGQEe/qm6OH4axCB1FNOJR2NVEB2cR3hG3sGiq/8sBg8s5iVSYzGq4TV
         vZwop4tC8HtAsQQq9t7F7BLIN/PvPkeD/ArIubjlTcVj84yxRR45Mqsf/1+SCjd2Xbhj
         H6TysEXylt3jQFvE7xh/E77NgYQVgAri0h0e804dAoXUFHpZHbh402p/QUUCOStu+O8S
         aix5gyP9/2YbtUz6rHtrihh5z77p64ZKzTABs2qbVB8WGKqMFUwKQVmyyqAHPXIKsGiD
         VTRplHK8ggQsoYycki4+6HPXFfwkD1mPssVfd8HZN7SsF7lvUBWwaUvD/SfLv+H/5RcM
         LPDA==
X-Gm-Message-State: AOAM5338fk1x7hVC3v9C3JRD/LOBcyGDzmu+gqtVcalNmDkkhKLxbzhX
        Ye3yh23uBg7XTZKV1Q8mJ8MOKI0tCH9cKuBNyU8=
X-Google-Smtp-Source: ABdhPJwrKQ8pTGdWIQGUyhJ+Vc2C+9xNkkzXQCNgDfOVBnfJAbhwj0L3O+JuHzMw6QF9CtswUMYLMuLt2N1Gu5O+268=
X-Received: by 2002:aca:f203:: with SMTP id q3mr2114100oih.148.1602682806605;
 Wed, 14 Oct 2020 06:40:06 -0700 (PDT)
MIME-Version: 1.0
References: <20201013150150.14801-1-fabrizio.castro.jz@renesas.com> <20201013150150.14801-3-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20201013150150.14801-3-fabrizio.castro.jz@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 14 Oct 2020 15:39:54 +0200
Message-ID: <CAMuHMdU-X0qmM+fVTV9czNa5++c9-N9GRowzaV9c+tcyXyrPHg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] media: dt-bindings: media: renesas,drif: Convert
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

On Tue, Oct 13, 2020 at 5:02 PM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> Convert the Renesas DRIF bindings to DT schema and update
> MAINTAINERS accordingly.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> v2->3:
> * Removed the definition of pinctrl-0 and pinctrl-names, as
>   suggested by Geert
> * Added "power-domains" to the list of required properties,
>   as suggested by Geert
> * Reworked the conditional requirements, Geert, what do you
>   think?

Thanks for the update!


> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/renesas,drif.yaml

> +allOf:
> +  - if:
> +      required:
> +        - renesas,primary-bond
> +    then:
> +      required:
> +        - pinctrl-0
> +        - pinctrl-names
> +        - port
> +
> +  - if:
> +      required:
> +        - port
> +    then:
> +      required:
> +        - pinctrl-0
> +        - pinctrl-names
> +
> +  - if:
> +      not:
> +        required:
> +          - port
> +    then:

This can just be an "else" branch for the previous "if" statement?

> +      properties:
> +        pinctrl-0: false
> +        pinctrl-names: false

With the above fixed/clarified:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
