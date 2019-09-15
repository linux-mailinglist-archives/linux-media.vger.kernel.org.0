Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2655B2F47
	for <lists+linux-media@lfdr.de>; Sun, 15 Sep 2019 10:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbfIOIyc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Sep 2019 04:54:32 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:44544 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725951AbfIOIyb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Sep 2019 04:54:31 -0400
Received: by mail-ed1-f65.google.com with SMTP id p2so29261366edx.11;
        Sun, 15 Sep 2019 01:54:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PWnzu3eflcbwSP6tx+4Ivb9O3SO0Lh/ZkIkmqyjnoX4=;
        b=o0ASUyWZVM0uYIFkEBWyia3S4BtPjEBymEhFfFUGuV358/EYU6KRr5vebja9OG5cDN
         /ZE/NEgSXPjBwWGTY9ZIiLlFS09P9jxA6HtQ5hypKSeooEs43DphJl8DOAtM3Fxzx6CQ
         +xMZ3/pgtjke3EfRjBxPO5Sid9xWBsx3fI8C5d/10FJ64GpPza6d6+2WFM92VwPAt0+T
         uiAOXbawOZhaDDMcaiSmswNeHdnCGK3zEucLpzOqKFUTs36VGEEGN7lZYZ9ubaaIE1lE
         1p2UzfZp2Uzkvf3XudyQ0J+BZSClp0nfBWMjSA8KPzaUB0ZaAxoRw66FeoqQy7k4uZpO
         VEXA==
X-Gm-Message-State: APjAAAVW3ocY8dOYj8ZLn45zjT+2bDvkx8jifDNTi7SAfpLie8hoe4vu
        zo2CMZcLLoHrMX/OMSH3dqXkonj0hIw=
X-Google-Smtp-Source: APXvYqw6hbGgxxJF6pEw8NNamzz/+yf3p1joWgujcvfqZxHKQwGhDXrKYxRlcchwB4MOm6gczEZVZg==
X-Received: by 2002:a17:906:7709:: with SMTP id q9mr15166080ejm.286.1568537668852;
        Sun, 15 Sep 2019 01:54:28 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id ba28sm857147edb.4.2019.09.15.01.54.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Sep 2019 01:54:28 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id 5so982482wmg.0;
        Sun, 15 Sep 2019 01:54:28 -0700 (PDT)
X-Received: by 2002:a1c:a54a:: with SMTP id o71mr10242857wme.51.1568537667994;
 Sun, 15 Sep 2019 01:54:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.34bcd988943a26671681eaf849aacab51fab1cfe.1562847292.git-series.maxime.ripard@bootlin.com>
 <110dd9ff1784c29fa16304825a41d1603a33f166.1562847292.git-series.maxime.ripard@bootlin.com>
 <CAGb2v64nx2AuWZN+RxCneE0pqvXr_d7u6mQ+=nCHv2VJ1MNtrQ@mail.gmail.com>
In-Reply-To: <CAGb2v64nx2AuWZN+RxCneE0pqvXr_d7u6mQ+=nCHv2VJ1MNtrQ@mail.gmail.com>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Sun, 15 Sep 2019 16:54:16 +0800
X-Gmail-Original-Message-ID: <CAGb2v66Sin9HZ+QENegLQ3d7iiy278niwdr9rEZ0HwUfeQNFRQ@mail.gmail.com>
Message-ID: <CAGb2v66Sin9HZ+QENegLQ3d7iiy278niwdr9rEZ0HwUfeQNFRQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] dt-bindings: media: Add Allwinner A10 CSI binding
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 15, 2019 at 4:34 PM Chen-Yu Tsai <wens@csie.org> wrote:
>
> Hi,
>
> Sorry for chiming in so late.
>
> On Thu, Jul 11, 2019 at 8:15 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> >
> > The Allwinner A10 CMOS Sensor Interface is a camera capture interface also
> > used in later (A10s, A13, A20, R8 and GR8) SoCs.
> >
> > On some SoCs, like the A10, there's multiple instances of that controller,
> > with one instance supporting more channels and having an ISP.
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > ---
> >  Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml | 94 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 94 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> > new file mode 100644
> > index 000000000000..97c9fc3b5050
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> > @@ -0,0 +1,94 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/arm/allwinner,sun4i-a10-csi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Allwinner A10 CMOS Sensor Interface (CSI) Device Tree Bindings
> > +
> > +maintainers:
> > +  - Chen-Yu Tsai <wens@csie.org>
> > +  - Maxime Ripard <maxime.ripard@bootlin.com>
> > +
> > +description: |-
> > +  The Allwinner A10 and later has a CMOS Sensor Interface to retrieve
> > +  frames from a parallel or BT656 sensor.
> > +
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - allwinner,sun7i-a20-csi0
> > +          - const: allwinner,sun4i-a10-csi0
>
> CSI0 on the A10 has an ISP. Do we know if the one in the A20 does
> as well? It certainly doesn't say so in the user manual. If not,
> then we can't claim that A20 CSI0 is compatible with A10 CSI0.
>
> > +
> > +      - items:
> > +          - const: allwinner,sun4i-a10-csi0
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: The CSI interface clock
> > +      - description: The CSI module clock
> > +      - description: The CSI ISP clock
> > +      - description: The CSI DRAM clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: bus
> > +      - const: mod
>
> I doubt this actually is a module clock. Based on the usage in your
> device tree patch, and the csi driver in the old linux-sunxi kernel,
> the clock rate is set to 24 MHz, or whatever the sensor requires for
> MCLK.

I'm working on adding support for this on the R40, and it seems with
this SoC the picture is much clearer. It has the same CSI interface
block, but the CCU has the clocks correctly named. We have:

  - CSI_MCLK0
  - CSI_MCLK1
  - CSI_SCLK

in addition to the bus clocks.

The CSI section also explains the clock signals:

    6.1.3.2. Clock Sources
    Two Clocks need to be configured for CSI controller. CSI0/1_MCLK
    provides the master clock for sensor and other devices. CSI_SCLK
    is the top clock for the whole CSI module.

So it would seem the ISP clock we currently have in the DT is simply
the module clock shared by all CSI-related hardware blocks, and the
module clock is bogus.

ChenYu

> ChenYu
>
> > +      - const: isp
> > +      - const: ram
> > +
> > +  resets:
> > +    description: The reset line driver this IP
> > +    maxItems: 1
> > +
> > +  pinctrl-0:
> > +    minItems: 1
> > +
> > +  pinctrl-names:
> > +    const: default
> > +
> > +  port:
> > +    type: object
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      endpoint:
> > +        properties:
> > +          bus-width:
> > +            const: 8
> > +            description: Number of data lines actively used.
> > +
> > +          data-active: true
> > +          hsync-active: true
> > +          pclk-sample: true
> > +          remote-endpoint: true
> > +          vsync-active: true
> > +
> > +        required:
> > +          - bus-width
> > +          - data-active
> > +          - hsync-active
> > +          - pclk-sample
> > +          - remote-endpoint
> > +          - vsync-active
> > +
> > +    required:
> > +      - endpoint
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +
> > +additionalProperties: false
> > +...
> > --
> > git-series 0.9.1
