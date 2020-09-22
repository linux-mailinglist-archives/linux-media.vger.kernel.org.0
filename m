Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E7EA274904
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 21:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726656AbgIVTXr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 15:23:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:34484 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726448AbgIVTXr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 15:23:47 -0400
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8FD6C2376F;
        Tue, 22 Sep 2020 19:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600802626;
        bh=YSVRLX+G8HcHE+AlF7XG+URmaQ0sbbZbrL31jfA43QM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=s3kCE2FF2hDZ7ft/3RSjsfWUCkILuu7w+s9Nxs1V3wwKAVIJxV6tzrD8yuEIWfcLZ
         Ni2wI/4pwj5nmASalnnXMx2UP1cxGuZNomBqb0V9gNWEOXMitNSOLC4mgXeXqlaL2A
         9aoo3l6HTGKbSXVtcdM+Fx2X380sNdhkKXXwRyGE=
Received: by mail-oi1-f181.google.com with SMTP id x69so22245899oia.8;
        Tue, 22 Sep 2020 12:23:46 -0700 (PDT)
X-Gm-Message-State: AOAM532HYd6r7ul2/YE5G4FX9Se5qnTyXFNoWgPE2q+vCCbM3LRFCmFo
        RtQGTxyFnRkw4aeRAOHF6cmEUPsEn1g4w/pO3w==
X-Google-Smtp-Source: ABdhPJxZbyi+iwWALuyGdgsGTDNoTRH1mBaH07ixS1Yrd7pBExCttVsq4BzpKd3h/dT74o++G7oRjXZcDCwWdevm2R0=
X-Received: by 2002:aca:fc07:: with SMTP id a7mr3619638oii.106.1600802620879;
 Tue, 22 Sep 2020 12:23:40 -0700 (PDT)
MIME-Version: 1.0
References: <1599031090-21608-1-git-send-email-krzk@kernel.org>
 <20200914201310.GA154873@bogus> <20200921112635.GA1233@kozik-lap>
In-Reply-To: <20200921112635.GA1233@kozik-lap>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 22 Sep 2020 13:23:29 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+gT3WSCAsKTrjZMh+vF4mx-m51rO=Wv+YcNxNhjEoO8A@mail.gmail.com>
Message-ID: <CAL_Jsq+gT3WSCAsKTrjZMh+vF4mx-m51rO=Wv+YcNxNhjEoO8A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: media: imx258: Add bindings for
 IMX258 sensor
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 21, 2020 at 5:27 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Mon, Sep 14, 2020 at 02:13:10PM -0600, Rob Herring wrote:
> > On Wed, Sep 02, 2020 at 09:18:08AM +0200, Krzysztof Kozlowski wrote:
> > > Add bindings for the IMX258 camera sensor.  The bindings, just like the
> > > driver, are quite limited, e.g. do not support regulator supplies.
> >
> > Bindings should be complete, not what a driver happens to currently
> > support.
>
> I'll add then more complete picture.
>
> >
> > >
> > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > >
> > > ---
> > >
> > > Changes since v1:
> > > 1. None
> > > ---
> > >  .../devicetree/bindings/media/i2c/imx258.yaml      | 92 ++++++++++++++++++++++
> > >  MAINTAINERS                                        |  1 +
> > >  2 files changed, 93 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx258.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/imx258.yaml b/Documentation/devicetree/bindings/media/i2c/imx258.yaml
> > > new file mode 100644
> > > index 000000000000..ef789ad31143
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/imx258.yaml
> > > @@ -0,0 +1,92 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/i2c/imx258.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Sony IMX258 13 Mpixel CMOS Digital Image Sensor
> > > +
> > > +maintainers:
> > > +  - Krzysztof Kozlowski <krzk@kernel.org>
> > > +
> > > +description: |-
> > > +  IMX258 is a diagonal 5.867mm (Type 1/3.06) 13 Mega-pixel CMOS active pixel
> > > +  type stacked image sensor with a square pixel array of size 4208 x 3120. It
> > > +  is programmable through I2C interface.  Image data is sent through MIPI
> > > +  CSI-2.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: sony,imx258
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  clock-frequency:
> > > +    description: Frequency of input clock if clock is not provided
> > > +    deprecated: true
> >
> > Why are we adding something deprecated on a new binding?
>
> My intention was also to document it but indeed easier to skip it.
>
> >
> > > +    const: 19200000
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  # See ../video-interfaces.txt for more details
> > > +  port:
> > > +    type: object
> > > +    properties:
> > > +      endpoint:
> > > +        type: object
> > > +        properties:
> > > +          data-lanes:
> > > +            items:
> > > +              - const: 1
> > > +              - const: 2
> > > +              - const: 3
> > > +              - const: 4
> >
> > If this is the only config, why does it need to be in DT?
>
> The sensor is capable of two settings: two lanes (1 and 2) and four
> lanes described above.  However Linux driver requires the latter (four
> lanes, 1+2+3+4).
>
> If I were to describe the bindings for HW, someone would really be
> confused and try to use two lanes setup, which won't work. Driver won't
> allow it.

If someone has h/w with only 2 lanes connected, then they have to go
add support to the driver whether we've documented 2 lanes in the
binding or not.

> I understand that bindings document the HW and describe its interface
> but do we really want to put "theoretical" bindings which cannot be used
> in practice with Linux kernel?
>
> If yes, how to nicely document this that only one setting is currently
> working?

You don't, at least in the binding. That's a driver issue. Bindings
are separate. They are stored in the kernel tree for convenience, not
because they are part of the kernel.

Rob
