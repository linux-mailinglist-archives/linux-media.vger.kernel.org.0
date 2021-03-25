Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3012D3493DA
	for <lists+linux-media@lfdr.de>; Thu, 25 Mar 2021 15:15:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231225AbhCYOOg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Mar 2021 10:14:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230113AbhCYOOT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Mar 2021 10:14:19 -0400
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDEDDC06174A;
        Thu, 25 Mar 2021 07:14:18 -0700 (PDT)
Received: by mail-ua1-x932.google.com with SMTP id j4so551638uan.1;
        Thu, 25 Mar 2021 07:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0SSljh8VgyOCvuZyrp0irHi3aJFMKD0jnieo/jO7CEI=;
        b=Tqd7++4+FcQgPrOd6IdwoJABBd4WVgiLVbVQGDorDUfzwmBXuD1Ys2luNVgih5rPXd
         UTVb13yXK5P8IKpk1q4dtqq97ERfq+pBVRWyR0nWCPORggX0N3MPJZPGt66fEeU7EA6G
         +SaURMLj8qbFcK5KAibAXit9+bUtnS4GijIxqKVls4t+ozFH5yYT0s29VtTBkE0oZqPL
         ouRhG9uQOpVbn4fk5+3eYQ08fJnIN0Gswc3XeVgxuC6Cpf3bmKz/h+gRBSnGH3YizS9m
         G2xoIxRfvwC85jBmnoF96ikNKn3Zewi4SAIuSggMjuJGscvtip557E1s/bd1Krb6wDEq
         KtFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0SSljh8VgyOCvuZyrp0irHi3aJFMKD0jnieo/jO7CEI=;
        b=pJeYeRv0TjO6ota+HIpCPBdOP0FSJ8pMZ/QAr9zI6huV8uOsK9sNZjGl/fjTEVc4BZ
         mUpjE3YKKs4tW4ylyZ6uYmbaarWaULPjXBK6AGzDLrI1Snp/mldDQA0fMKON52pGuK26
         qmQiBgg2JOq5AAnZ+13RSpayPpYJbnNuEzZhInsUacH/MQJAqPkAD5M28qYFNTXyjmaQ
         js3OT9YQ6Rh/aZZhEuqT6yOFBOEawd5U24iOmSsSU0XwZhtoBlZg+3vMWhjljaaemdIs
         A2qhXl/mJs6d8vUHw+GNZJpi/HzrQmSiXj1ka2pyyDOyc0o0wXBtyYhsxrVoVeTTzVSI
         3/RQ==
X-Gm-Message-State: AOAM530ntcI5R3FrD58kaHSHMBmupF1XAgAqi1AXQo/WR2UybpN1uuui
        V/TE+vUtvuOe5H9oDw95zzezQ/p+8bR2j8sKMEgzEU8nUgJTEA==
X-Google-Smtp-Source: ABdhPJykAGvfrWh/jq0MsPDnI0kz6Tj5UWjX8pgwdXEkcGFOTuEwxthi3FtQxf+dmirWaPsTUHw8+scnIfB4K4Mz6uQ=
X-Received: by 2002:ab0:32d0:: with SMTP id f16mr4947078uao.64.1616681657893;
 Thu, 25 Mar 2021 07:14:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210311154055.3496076-1-emil.l.velikov@gmail.com>
 <20210311154055.3496076-7-emil.l.velikov@gmail.com> <20210324151715.GA3070006@robh.at.kernel.org>
In-Reply-To: <20210324151715.GA3070006@robh.at.kernel.org>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Thu, 25 Mar 2021 14:14:06 +0000
Message-ID: <CACvgo51EpUqRBDQ0tO8aoUM3eo=y9R5VFOazWD05hOaiGwgZPg@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] media: dt-bindings: Document SAMA5D4 VDEC bindings
To:     Rob Herring <robh@kernel.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
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

On Wed, 24 Mar 2021 at 15:17, Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Mar 11, 2021 at 03:40:51PM +0000, Emil Velikov wrote:
> > From: Emil Velikov <emil.velikov@collabora.com>
> >
> > Add devicetree binding documentation for the Hantro G1/G2 VDEC on
> > the Microchip SAMAS5D4 SoC.
> >
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Frank Rowand <frowand.list@gmail.com>
> > Cc: devicetree@vger.kernel.org>
> > Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> > ---
> > v2
> >  - Newly introduced
> >  - s/Atmel/Microchip/ (Nicolas)
> >  - Drop leading 0 in node name/address
> > ---
> >  .../media/microchip,sama5d4-vdec.yaml         | 59 +++++++++++++++++++
> >  1 file changed, 59 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml b/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
> > new file mode 100644
> > index 000000000000..9cb2c0295d54
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
> > @@ -0,0 +1,59 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +
> > +%YAML 1.2
> > +---
> > +$id: "http://devicetree.org/schemas/media/microchip,sama5d4-vdec.yaml#"
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: Hantro G1 VPU codec implemented on Microchip SAMA5D4 SoCs
> > +
> > +maintainers:
> > +  - Emil Velikov <emil.velikov@collabora.com>
> > +
> > +description:
> > +  Hantro G1 video decode accelerator present on Microchip SAMA5D4 SoCs.
> > +
> > +properties:
> > +  compatible:
> > +    const: microchip,sama5d4-vdec
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: vdec
>
> Why do you need a name? *-names are used to distinguish multiple entries
> and don't add anything if only a single entry.
>
On one hand the names are used to describe the hardware - the SAMA
board uses designated clock and interrupt lines - both called "vdec".
Additionally the names are ultimately required by the underlying API -
platform_get_irq_byname and  devm_clk_bulk_get respectively.
How can we get the respective entries without the name?

Skimming through the existing dts file -
arch/arm/boot/dts/sama5d4.dtsi and other dts files - there are lots of
examples where the device tree binding contains the name for a single
clock/interrupt.

Thanks
Emil
