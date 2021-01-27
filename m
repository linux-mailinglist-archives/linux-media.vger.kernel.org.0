Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E385305B49
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 13:26:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237709AbhA0M0C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jan 2021 07:26:02 -0500
Received: from mail-wr1-f44.google.com ([209.85.221.44]:44460 "EHLO
        mail-wr1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237723AbhA0MYg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jan 2021 07:24:36 -0500
Received: by mail-wr1-f44.google.com with SMTP id d16so1663987wro.11;
        Wed, 27 Jan 2021 04:24:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ShB3cnXbxrmD9a+bdXYQdwTEtb4JqHT3bdcJ08qiOYM=;
        b=K4N3DUw1JbX2KkHEBhRTAmorhclvTBMN8JFu0pIWIAu9QQ0aH9qd3Rppn8HCFsFlv9
         1LvZuYMCsHDsN/5MQ3Vn+ifvIw4O7LJwXVGdNQThM1wa3ZPsjnXnQJJ10auYh/McayEz
         4Nwdg9lgjmgpVYF/59RfwmcJyl0x2sdhoEv863GXYO237ke252EpMbqWzN/UvGBKBgJi
         Cus6S4EWge1zbBea1ud/0zUdRg9SVmA3Ze/Eafvx1a5fGGJupLpyFWVPoTZ9xfii2z7E
         fTX06gxafRWxqPC/NcbtYjZCV7wLsG2eqpnDQ++gm7+qohpqzCm95+EY166NTZIsSSuI
         gDGg==
X-Gm-Message-State: AOAM532d6O0XE6bH0ks2pvMhIepiv17PtxL2wEt4cg3MfL4Ew8J3W397
        bzHIF15JoSlBytt3BUh95Mo=
X-Google-Smtp-Source: ABdhPJzhDxEpDBEc1vtDjMlmipHrb96zdgWsWtS3oEMrAA/05Zb3TzAV22yLxNp4CFki4xmeOC8Zvg==
X-Received: by 2002:a5d:66ce:: with SMTP id k14mr10947071wrw.397.1611750234180;
        Wed, 27 Jan 2021 04:23:54 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id g12sm2325875wmh.14.2021.01.27.04.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 04:23:53 -0800 (PST)
Date:   Wed, 27 Jan 2021 13:23:51 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 1/4] dt-bindings: media: imx258: add bindings for
 IMX258 sensor
Message-ID: <20210127122351.nokesldtzq4wchiq@kozik-lap>
References: <20201118202715.6692-1-krzk@kernel.org>
 <20210122091822.GB27155@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210122091822.GB27155@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jan 22, 2021 at 11:18:22AM +0200, Sakari Ailus wrote:
> Hi Krysztof,
> 
> On Wed, Nov 18, 2020 at 09:27:12PM +0100, Krzysztof Kozlowski wrote:
> > Add bindings for the IMX258 camera sensor.  The bindings, just like the
> > driver, are quite limited, e.g. do not support regulator supplies.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > 
> > ---
> > 
> > Changes since v4:
> > 1. Add clock-lanes,
> > 2. Add Rob's review,
> > 3. Add one more example and extend existing one,
> > 4. Add common clock properties (assigned-*).
> > 
> > Changes since v3:
> > 1. Document also two lane setup.
> > 
> > Changes since v2:
> > 1. Remove clock-frequency, add reset GPIOs, add supplies.
> > 2. Use additionalProperties.
> > 
> > Changes since v1:
> > 1. None
> > ---
> >  .../devicetree/bindings/media/i2c/imx258.yaml | 140 ++++++++++++++++++
> >  MAINTAINERS                                   |   1 +
> >  2 files changed, 141 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx258.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/imx258.yaml b/Documentation/devicetree/bindings/media/i2c/imx258.yaml
> > new file mode 100644
> > index 000000000000..4a3471fb88a1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/imx258.yaml
> > @@ -0,0 +1,140 @@
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
> > +  assigned-clocks: true
> > +  assigned-clock-parents: true
> > +  assigned-clock-rates: true
> > +
> > +  clocks:
> > +    description:
> > +      Clock frequency from 6 to 27 MHz.
> > +    maxItems: 1
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  reset-gpios:
> > +    description: |-
> > +      Reference to the GPIO connected to the XCLR pin, if any.
> > +
> > +  vana-supply:
> > +    description:
> > +      Analog voltage (VANA) supply, 2.7 V
> > +
> > +  vdig-supply:
> > +    description:
> > +      Digital I/O voltage (VDIG) supply, 1.2 V
> > +
> > +  vif-supply:
> > +    description:
> > +      Interface voltage (VIF) supply, 1.8 V
> > +
> > +  # See ../video-interfaces.txt for more details
> > +  port:
> > +    type: object
> > +    properties:
> > +      endpoint:
> > +        type: object
> > +        properties:
> > +          clock-lanes:
> > +            const: 0
> 
> This is redundant. Please remove, same for the examples. Can be a separate
> patch, too.
> 
> With this change the set seems good to me.

OK, I'll remove it and send a v7.

Best regards,
Krzysztof

