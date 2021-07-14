Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D0EF3C85F2
	for <lists+linux-media@lfdr.de>; Wed, 14 Jul 2021 16:19:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232362AbhGNOWQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jul 2021 10:22:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:51898 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231543AbhGNOWP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jul 2021 10:22:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 25E64613D2;
        Wed, 14 Jul 2021 14:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626272364;
        bh=Z6upmCVFtsDIQuNaf3MDnsNQ47RpnTy+0pUzdx4gsOY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ISq87PJFGQ+QY8QX/hSqifenHkHQ64DouZ0oR5webTjVggnG4wUBDLPQM4GVYS1Ni
         YoCjbclkDcKepZz97LfJvVaNegbbjUg6XFzZtZS5Qs/V11BSDOGDbBNkfqA5G11lPa
         16H2wI8wkfff6STRN0YP0987cJuGKPPNLRQYPI3ElO88vCZ7Tu4GhT/UrFkEHm4yTr
         cFwQjIE87XFbw5WBDu9bI7KYOg/7LczFBQ7RdOTo51stikoH/skGNkZFco5DjLxVNv
         HEehnuDjFKSyCe3eUCrrPPKBoZjmovoMvKAW9Cbj5R3Zj8IHIsixWCVZCm4bKLVDcQ
         i9MXobHZuqTAg==
Received: by mail-ed1-f44.google.com with SMTP id t2so2946098edd.13;
        Wed, 14 Jul 2021 07:19:24 -0700 (PDT)
X-Gm-Message-State: AOAM532tV96ZeqRybE5E+VrEaZVrB8XsO4yPAK+ujXp6EuM/ArjnhSuj
        4+amwNZWjlsNJADGnEIz7uZInGjvwsrpiplo0g==
X-Google-Smtp-Source: ABdhPJznKXoJRvB40YWJoo+5QJLF5eujnJu6K23tda1AvQp+YMebU+bksEpUgf6yrVl8h9VjXWSjQlEug6nip9TThXY=
X-Received: by 2002:a50:9345:: with SMTP id n5mr14184472eda.289.1626272362692;
 Wed, 14 Jul 2021 07:19:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210712085535.11907-1-s.riedmueller@phytec.de>
 <20210712085535.11907-6-s.riedmueller@phytec.de> <20210714021904.GA1312716@robh.at.kernel.org>
 <99b0b3ad4eac3a5653e0e4630bf59fc63eef114d.camel@phytec.de>
In-Reply-To: <99b0b3ad4eac3a5653e0e4630bf59fc63eef114d.camel@phytec.de>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 14 Jul 2021 08:19:10 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+xJsmae3cu1oVdiUPnUWPb+61UYzMYMq4FaQ1M9Su-sQ@mail.gmail.com>
Message-ID: <CAL_Jsq+xJsmae3cu1oVdiUPnUWPb+61UYzMYMq4FaQ1M9Su-sQ@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] media: dt-bindings: mt9p031: Convert bindings to yaml
To:     =?UTF-8?Q?Stefan_Riedm=C3=BCller?= <S.Riedmueller@phytec.de>
Cc:     "mchehab@kernel.org" <mchehab@kernel.org>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 14, 2021 at 4:01 AM Stefan Riedm=C3=BCller
<S.Riedmueller@phytec.de> wrote:
>
> Hi Rob,
>
> On Tue, 2021-07-13 at 20:19 -0600, Rob Herring wrote:
> > On Mon, Jul 12, 2021 at 10:55:34AM +0200, Stefan Riedmueller wrote:
> > > Convert mt9p031 sensor bindings to yaml schema. Also update the
> > > MAINTAINERS entry.
> > >
> > > Although input-clock-frequency and pixel-clock-frequency have not bee=
n
> > > definded as endpoint propierties in the textual bindings, the sensor
> > > does parse them from the endpoint. Thus move these properties to the
> > > endpoint in the new yaml bindings.
> > >
> > > Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> > > ---
> > >  .../bindings/media/i2c/aptina,mt9p031.yaml    | 75 +++++++++++++++++=
++
> > >  .../devicetree/bindings/media/i2c/mt9p031.txt | 40 ----------
> > >  MAINTAINERS                                   |  1 +
> > >  3 files changed, 76 insertions(+), 40 deletions(-)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
> > >  delete mode 100644
> > > Documentation/devicetree/bindings/media/i2c/mt9p031.txt
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
> > > b/Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
> > > new file mode 100644
> > > index 000000000000..ad9a2db73d86
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
> > > @@ -0,0 +1,75 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/i2c/aptina,mt9p031.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Aptina 1/2.5-Inch 5Mp CMOS Digital Image Sensor
> > > +
> > > +maintainers:
> > > +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > +
> > > +description: |
> > > +  The Aptina MT9P031 is a 1/2.5-inch CMOS active pixel digital image
> > > sensor
> > > +  with an active array size of 2592H x 1944V. It is programmable thr=
ough
> > > a
> > > +  simple two-wire serial interface.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - aptina,mt9p031
> > > +      - aptina,mt9p031m
> > > +
> > > +  reg:
> > > +    description: I2C device address
> > > +    maxItems: 1
> > > +
> > > +  reset-gpios:
> > > +    maxItems: 1
> > > +    description: Chip reset GPIO
> > > +
> > > +  port:
> > > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > > +    additionalProperties: false
> > > +
> > > +    properties:
> > > +      endpoint:
> > > +        $ref: /schemas/media/video-interfaces.yaml#
> >
> > Doesn't look like you use any properties from video-interfaces.yaml. Yo=
u
> > should just reference graph.yaml#/$defs/endpoint-base instead.
>
> Thanks for your comment. It made me realize, that I have something wrong.=
 The
> driver does use properties from the video interface as it parses the bus
> configuration from the endpoint. But I thought these properties were
> implicitly used by referencing the video-interfaces schema. Now I assume =
that
> I have to mention them here explicitly. Correct?

Yes, because presumably you only support some subset of possible values.

Rob
