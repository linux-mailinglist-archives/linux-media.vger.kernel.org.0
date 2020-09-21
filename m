Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 254ED272267
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 13:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbgIUL1Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 07:27:16 -0400
Received: from mail-ej1-f68.google.com ([209.85.218.68]:38558 "EHLO
        mail-ej1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726430AbgIUL1P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 07:27:15 -0400
Received: by mail-ej1-f68.google.com with SMTP id gx22so8127047ejb.5;
        Mon, 21 Sep 2020 04:27:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TklpADd3IHxb6z2of1IfW1yIIhmPXuPXH+f9NSI1fhs=;
        b=WCTopBcK+Sd0dUJtuJWj5cH8F7KWpWtyznsLb5KWH+RdgVsCnky3ioj5/5A9sENcHL
         +3TUNlOJe8XR91YE0d2VdpbITPCSof7rcxVcCNjqERZQs/VoyBbiD2C3UJads7//95ht
         Su1EfXPI5cbhnA02rO3wuz2Y+DuKWt36tbBt58s0P3gjH8M7aHeuGmzVkGrd2wpwpHJk
         Z1r4KqXVLgJs404pwlbng9kVyo2zx+D8Imd0J0l8GSyb1knWFug7BId/06NV5kevqCuW
         LMU2CP9il1sABb1B3llnJ6J/qfW5mbdboL0rJkj5N4UnDLqNYgDs/KNq7m4jS86h5nJQ
         zoGw==
X-Gm-Message-State: AOAM533yfe40M5nFYr3rOzAEWTFWoM3Rt2Ao9FJFJFOSAY8T8yjE7qoF
        INr2Szq/ZxeivK2WZv3IbqM=
X-Google-Smtp-Source: ABdhPJwD2dkaD3vci3J10BEc2dBbE2JojebgK4ZMrXwRGuPek2cZCWlF8pueaGRM3ASW48A72otQnQ==
X-Received: by 2002:a17:906:f9d8:: with SMTP id lj24mr50631653ejb.379.1600687633079;
        Mon, 21 Sep 2020 04:27:13 -0700 (PDT)
Received: from kozik-lap ([194.230.155.191])
        by smtp.googlemail.com with ESMTPSA id cf7sm8470136edb.78.2020.09.21.04.26.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Sep 2020 04:27:12 -0700 (PDT)
Date:   Mon, 21 Sep 2020 13:26:35 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: media: imx258: Add bindings for
 IMX258 sensor
Message-ID: <20200921112635.GA1233@kozik-lap>
References: <1599031090-21608-1-git-send-email-krzk@kernel.org>
 <20200914201310.GA154873@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200914201310.GA154873@bogus>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 14, 2020 at 02:13:10PM -0600, Rob Herring wrote:
> On Wed, Sep 02, 2020 at 09:18:08AM +0200, Krzysztof Kozlowski wrote:
> > Add bindings for the IMX258 camera sensor.  The bindings, just like the
> > driver, are quite limited, e.g. do not support regulator supplies.
> 
> Bindings should be complete, not what a driver happens to currently 
> support.

I'll add then more complete picture.

> 
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > 
> > ---
> > 
> > Changes since v1:
> > 1. None
> > ---
> >  .../devicetree/bindings/media/i2c/imx258.yaml      | 92 ++++++++++++++++++++++
> >  MAINTAINERS                                        |  1 +
> >  2 files changed, 93 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx258.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/imx258.yaml b/Documentation/devicetree/bindings/media/i2c/imx258.yaml
> > new file mode 100644
> > index 000000000000..ef789ad31143
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/imx258.yaml
> > @@ -0,0 +1,92 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/imx258.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sony IMX258 13 Mpixel CMOS Digital Image Sensor
> > +
> > +maintainers:
> > +  - Krzysztof Kozlowski <krzk@kernel.org>
> > +
> > +description: |-
> > +  IMX258 is a diagonal 5.867mm (Type 1/3.06) 13 Mega-pixel CMOS active pixel
> > +  type stacked image sensor with a square pixel array of size 4208 x 3120. It
> > +  is programmable through I2C interface.  Image data is sent through MIPI
> > +  CSI-2.
> > +
> > +properties:
> > +  compatible:
> > +    const: sony,imx258
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-frequency:
> > +    description: Frequency of input clock if clock is not provided
> > +    deprecated: true
> 
> Why are we adding something deprecated on a new binding?

My intention was also to document it but indeed easier to skip it.

> 
> > +    const: 19200000
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  # See ../video-interfaces.txt for more details
> > +  port:
> > +    type: object
> > +    properties:
> > +      endpoint:
> > +        type: object
> > +        properties:
> > +          data-lanes:
> > +            items:
> > +              - const: 1
> > +              - const: 2
> > +              - const: 3
> > +              - const: 4
> 
> If this is the only config, why does it need to be in DT?

The sensor is capable of two settings: two lanes (1 and 2) and four
lanes described above.  However Linux driver requires the latter (four
lanes, 1+2+3+4).

If I were to describe the bindings for HW, someone would really be
confused and try to use two lanes setup, which won't work. Driver won't
allow it.

I understand that bindings document the HW and describe its interface
but do we really want to put "theoretical" bindings which cannot be used
in practice with Linux kernel?

If yes, how to nicely document this that only one setting is currently
working?

> 
> > +
> > +          link-frequencies:
> > +            allOf:
> > +              - $ref: /schemas/types.yaml#/definitions/uint64-array
> > +            description:
> > +              Allowed data bus frequencies.
> > +
> > +        required:
> > +          - data-lanes
> > +          - link-frequencies
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - port
> > +
> > +
> > +if:
> > +  not:
> > +    required:
> > +      - clocks
> > +then:
> > +  required:
> > +    - clock-frequency
> > +
> > +unevaluatedProperties: false
> 
> additionalProperties

Right.

Best regards,
Krzysztof
