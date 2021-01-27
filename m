Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44102305B61
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 13:30:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236732AbhA0M3t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jan 2021 07:29:49 -0500
Received: from mail-wm1-f42.google.com ([209.85.128.42]:38912 "EHLO
        mail-wm1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237782AbhA0M05 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jan 2021 07:26:57 -0500
Received: by mail-wm1-f42.google.com with SMTP id u14so1473773wmq.4;
        Wed, 27 Jan 2021 04:26:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=s8STOwDnZktAr5XSsZpxPTgg/wzUn+w2B4TEpUXyMVw=;
        b=gK9ltotN+40TUVOVJnpropJXwlEKqMQ0w4XIgDvt98x309yykck+2glRB9Tr1kfx2m
         Tkr6r7kfw6+d9u869d/FLZ7VUXfb9UI73FD2DT9L/sZIXPFjhel4qDvYjAYDZEbs2ldi
         gOUeRj34j5BTTkkm0U6wvgXovQd4uMVLwp0yNzlNBRGcmyZ8WAjQK7J3hzi+fQJjcUyI
         5TsRVQ6RG89abzJ7d9nc54BiMlyYHsTEqnRkCQhbfJFoKRLp+NXm325/StqkIOHuekOJ
         q9ALkg1bi5/9alkkS0bEStmseRbe4Ku9zJ+3AqbyjtMpJ6E8+Vaz/RdBLKB6Fix1Ww3e
         2B2A==
X-Gm-Message-State: AOAM532g38VmBibgjApQhrYE82r+kXVMpxBzRsV4P7q4fUWqNSn5rF03
        +cVbyz+b4nfFrpqSC6gR2/w=
X-Google-Smtp-Source: ABdhPJwYp1nwQ+73M6r0oTdmT6Kq9O0d6kgAe4eLD2OunE9oChenHrNIqFUUCi/3UgQTRI9Zgykkpw==
X-Received: by 2002:a7b:cb81:: with SMTP id m1mr4041455wmi.117.1611750374810;
        Wed, 27 Jan 2021 04:26:14 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id d85sm9372902wmd.2.2021.01.27.04.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 04:26:13 -0800 (PST)
Date:   Wed, 27 Jan 2021 13:26:12 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 1/4] dt-bindings: media: imx258: add bindings for
 IMX258 sensor
Message-ID: <20210127122612.evk5sooijid3dmzd@kozik-lap>
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

Before I remove too much - you mean "clock-lanes" is redundant or entire
set of properties in "port" node?

Best regards,
Krzysztof
