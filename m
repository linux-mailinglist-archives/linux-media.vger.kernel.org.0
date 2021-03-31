Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F9D53505AE
	for <lists+linux-media@lfdr.de>; Wed, 31 Mar 2021 19:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234382AbhCaRnd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Mar 2021 13:43:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbhCaRnB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Mar 2021 13:43:01 -0400
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AC51C061574;
        Wed, 31 Mar 2021 10:43:01 -0700 (PDT)
Received: by mail-ua1-x92b.google.com with SMTP id h34so6387461uah.5;
        Wed, 31 Mar 2021 10:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6QUinmrvLjexZh4h6qxhdrf+90LRRGclLO2gy+3m3h0=;
        b=bDcIcHosuB1gdY9wWuOho+xe1EAqCn/mgVXT0aZV46gFLzCOHAQts+kRA+maDvEzKZ
         Xdcws4+Y71rHgxYyRITbYHFu470S75k5aUzTzr9q7GoMLH9rMTP/BFMXJcBHj4+LuuBF
         NiPR16CudOKuhuFNzxzslz0SFU6pIyYXXt1+TRKCYJOer/8nZIikcWUiGuprajWuUvbj
         RXhF4FHNCyG9fZYlOlT9i0+rIhzOpluCg0J12gphF75/Wsx+XbLb5Nb5QH5ZZGQRZZuX
         /Tjyhm+eKWJr6/raA8h92pbHaFmileDu4ghji83D9rY8Hx0xFWMZcvwNjnWUStmEBPjs
         ei6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6QUinmrvLjexZh4h6qxhdrf+90LRRGclLO2gy+3m3h0=;
        b=TrDTVzwU8KDRj58WGdt5/KaNAwgoP92aC7GdlYrF1yEaQwzIfAoE5r/umMsG0D1BTa
         z1HfjE1PrmJTg6end2cWUrAJivAX2pYO9yOIoDNUpzFVaTBE/Td4BGsmYVS69N7FlUtv
         Kg/M5U1XNgErrp/HrkFQRDBe40Cu333/shLHDxuKb1toxl267kzBMPhYLGL5AyvYZI04
         WwyFrJOXq4DcQLsz5mQRyxcVmFFCUp4rtDPVPJZDQqh1tFHI7j8UH31MnpxL2MXHzlQp
         aqQ0gtDhoEex9bpamN8qssosZ1rAtd+2anHLQZwD/lRBWlxdjXvaujVaJGVEjTUxRlsX
         Jr0Q==
X-Gm-Message-State: AOAM532A44OeBLzZC4FBYA8pkX9GvT/NK6JbdKYuosrYqBEzjYnjMUgY
        UN4zec5u4OZZJU0KD0i5a/tk3Qy9JkLTRayHsaIHY3l3HGbOig==
X-Google-Smtp-Source: ABdhPJy3yexeTGobTP9R8fdNLFXCSzmoWAuERwfQlI+gE5cqr3/I+uy//5OSLMXkzsMGB3WDh2SXsV+7KZ2Ml4hXzkA=
X-Received: by 2002:ab0:12a:: with SMTP id 39mr2339668uak.19.1617212580827;
 Wed, 31 Mar 2021 10:43:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210311154055.3496076-1-emil.l.velikov@gmail.com>
 <20210311154055.3496076-7-emil.l.velikov@gmail.com> <20210324151715.GA3070006@robh.at.kernel.org>
 <CACvgo51EpUqRBDQ0tO8aoUM3eo=y9R5VFOazWD05hOaiGwgZPg@mail.gmail.com> <a47cea7f31abdd25e6c9d4262be07ce2d852881e.camel@collabora.com>
In-Reply-To: <a47cea7f31abdd25e6c9d4262be07ce2d852881e.camel@collabora.com>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Wed, 31 Mar 2021 18:42:49 +0100
Message-ID: <CACvgo53GKQDZeiCjWKnt_hEp8Ctnueau_BKTqw7WXuPz-HUaPw@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] media: dt-bindings: Document SAMA5D4 VDEC bindings
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Rob Herring <robh@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org,
        linux-rockchip <linux-rockchip@lists.infradead.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 26 Mar 2021 at 14:29, Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> Hi Emil,
>
> On Thu, 2021-03-25 at 14:14 +0000, Emil Velikov wrote:
> > On Wed, 24 Mar 2021 at 15:17, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Thu, Mar 11, 2021 at 03:40:51PM +0000, Emil Velikov wrote:
> > > > From: Emil Velikov <emil.velikov@collabora.com>
> > > >
> > > > Add devicetree binding documentation for the Hantro G1/G2 VDEC on
> > > > the Microchip SAMAS5D4 SoC.
> > > >
> > > > Cc: Rob Herring <robh+dt@kernel.org>
> > > > Cc: Frank Rowand <frowand.list@gmail.com>
> > > > Cc: devicetree@vger.kernel.org>
> > > > Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> > > > ---
> > > > v2
> > > >  - Newly introduced
> > > >  - s/Atmel/Microchip/ (Nicolas)
> > > >  - Drop leading 0 in node name/address
> > > > ---
> > > >  .../media/microchip,sama5d4-vdec.yaml         | 59 +++++++++++++++++++
> > > >  1 file changed, 59 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml b/Documentation/devicetree/bindings/media/microchip,sama5d4-
> > > > vdec.yaml
> > > > new file mode 100644
> > > > index 000000000000..9cb2c0295d54
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
> > > > @@ -0,0 +1,59 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: "http://devicetree.org/schemas/media/microchip,sama5d4-vdec.yaml#"
> > > > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > > > +
> > > > +title: Hantro G1 VPU codec implemented on Microchip SAMA5D4 SoCs
> > > > +
> > > > +maintainers:
> > > > +  - Emil Velikov <emil.velikov@collabora.com>
> > > > +
> > > > +description:
> > > > +  Hantro G1 video decode accelerator present on Microchip SAMA5D4 SoCs.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: microchip,sama5d4-vdec
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  interrupts:
> > > > +    maxItems: 1
> > > > +
> > > > +  interrupt-names:
> > > > +    items:
> > > > +      - const: vdec
> > >
> > > Why do you need a name? *-names are used to distinguish multiple entries
> > > and don't add anything if only a single entry.
> > >
> > On one hand the names are used to describe the hardware - the SAMA
> > board uses designated clock and interrupt lines - both called "vdec".
> > Additionally the names are ultimately required by the underlying API -
> > platform_get_irq_byname and  devm_clk_bulk_get respectively.
> > How can we get the respective entries without the name?
> >
>
> There are APIs to get the resource by index as opposed to by name.
> E.g. platform_get_irq.
>
> However, you are confusing here internal kernel implementation
> with devicetree bindings. The latter is just a representation
> of the hardware.
>
My train of thought was that if we're missing API to fetch the entries
via non-name means, then there's a reasonable precedent to expose the
name. Clearly I missed the API, so my argument is just off.

> > Skimming through the existing dts file -
> > arch/arm/boot/dts/sama5d4.dtsi and other dts files - there are lots of
> > examples where the device tree binding contains the name for a single
> > clock/interrupt.
> >
>
>
> Note that dtsi and dts are the device-tree files, not the bindings.
> And even if you find examples, the fact that there exist examples
> doesn't mean it's the right thing to do.
>
Fully agreed. Thanks for the correction and hints.

The v3, just submitted, lacks the names all together.

-Emil
