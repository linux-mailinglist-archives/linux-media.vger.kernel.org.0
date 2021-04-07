Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67A70357443
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 20:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355247AbhDGS1a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 14:27:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:35058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244465AbhDGS12 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Apr 2021 14:27:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 957BA61369;
        Wed,  7 Apr 2021 18:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617820038;
        bh=civl3rtKmZVKyR9ItLSDPXdFlUFOfTPLYTaDdcUXRJ0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hvdIc/zqCD2jKb0vWu2wSKfMVYpGObVeQn4bn80Gdh9E5Ad+sdRjfEJfhc5E/qimO
         HhBkeP+EV0UWJ626oKxmmepyc9cEyPPBWuVmXD5CUxrOmHbaLEwmvsC8v4czPAklqv
         ThIddQrLfgahfHFdDh0WfSMOF8J7MMaUPYFWKmWWUIKfv3uY9t4BwUgzyKHE0uF+gt
         gbcG2xVRrhXLlLTOWJ6Uv7qwZKG8xiPO4PUozyoRknQY5T3i+UGeqLe9YOA7GgI9Fy
         8Ba1cpMRkpjZ7nNr/OgCEU2I+tkoAHF3wANfpGYwpWYpqLU1zwAA8UT5lEffnL+u9f
         B+eV+L3we2Cyg==
Received: by mail-ed1-f41.google.com with SMTP id w18so22122584edc.0;
        Wed, 07 Apr 2021 11:27:18 -0700 (PDT)
X-Gm-Message-State: AOAM533YFcP1PfB65gj09iiBSGYvDBX1K+r7LCCSeWmU0PNIeJQlX5JD
        gMGBwskjDD9DsvFHFRMcyL4JjLBIjCg0kH73Gg==
X-Google-Smtp-Source: ABdhPJxuF4m8Cv6vB7cycR9a11U3VWLb0th6pWAfnmJO20Xe+RabuLQbU2wYltdTrAKQD4UgS+vCwDZrLh4+NDKWLN8=
X-Received: by 2002:aa7:cd83:: with SMTP id x3mr6071362edv.373.1617820037163;
 Wed, 07 Apr 2021 11:27:17 -0700 (PDT)
MIME-Version: 1.0
References: <20201021135332.4928-1-fabrizio.castro.jz@renesas.com>
 <20201021135332.4928-3-fabrizio.castro.jz@renesas.com> <CAMuHMdWj_Gm6vwOF9Akz84WakA3KTcNTRHte6ukEF_U5=Q8xFA@mail.gmail.com>
In-Reply-To: <CAMuHMdWj_Gm6vwOF9Akz84WakA3KTcNTRHte6ukEF_U5=Q8xFA@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 7 Apr 2021 13:27:05 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLgSjOxc8uoicSLE8nR=EKGpzK31CyHgdp5xarLtMV=9w@mail.gmail.com>
Message-ID: <CAL_JsqLgSjOxc8uoicSLE8nR=EKGpzK31CyHgdp5xarLtMV=9w@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] media: dt-bindings: media: renesas,drif: Convert
 to json-schema
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
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
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 14, 2021 at 7:02 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Fabrizio, Rob,
>
> On Wed, Oct 21, 2020 at 3:53 PM Fabrizio Castro
> <fabrizio.castro.jz@renesas.com> wrote:
> > Convert the Renesas DRIF bindings to DT schema and update
> > MAINTAINERS accordingly.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Rob Herring <robh@kernel.org>
>
> Thanks for your patch!
>
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/renesas,drif.yaml
>
> > +  clock-names:
> > +    maxItems: 1
> > +    items:
> > +      - const: fck
>
> With latest dt-schema, "make dt_binding_check" complains:
>
>     Documentation/devicetree/bindings/media/renesas,drif.yaml:
> properties:clock-names:maxItems: False schema does not allow 1
>     Documentation/devicetree/bindings/media/renesas,drif.yaml:
> ignoring, error in schema: properties: clock-names: maxItems

Seems this just got applied, and now this error is in linux-next.

>
> Using
>
>        clock-names:
>          const: fck
>
> Fixes that.
>
> However, I'm wondering why I do not get a complaint about the similar
> clock/clock-names in
> Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml.
> Because they're part of an else branch?

Probably. if/then/else schemas have fewer checks as they can be
incomplete (only additional constraints on the top-level schema).

Rob
