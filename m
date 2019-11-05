Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEF87EF2EF
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2019 02:44:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730203AbfKEBn4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 20:43:56 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:45850 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728987AbfKEBnz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Nov 2019 20:43:55 -0500
Received: by mail-oi1-f193.google.com with SMTP id k2so16029591oij.12;
        Mon, 04 Nov 2019 17:43:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CUXJwWe90bW8v3xaQ2VIEMTd+WY4inmX6uoXpP0UKrU=;
        b=r5EuhHg6f8V5uZJsgCvYIpRsKkdlXHyeuAFsuMFTXx/AMza2vM7tmvMv8IDNCxjPAH
         my+FM0252BjXcRtI+LiYkkclhgbWHxVS3e0/kLKmdzQBfh2+if8BjwM21K1rJcjEurBf
         NPBfTzfX5ijXxFXZqYO3qGAqQ3W3ohygPxLbv/6aGKlhRj/MyoyNxHhgI+j35UxeDyET
         3M66xVEUyP5nt13PNOP34RUchIJMRFrjSNcylc7AXPZUHwHzzbQVAOb0bEEI+BuLBAqO
         ffpUW+/Fc4x65T0krdgN+S7eLND6DfCGgVHJVHNudKAKZ9KQ9stxFTu37+Fybmmty9Cz
         Hzgg==
X-Gm-Message-State: APjAAAW5QpqcYp3dJlhnSR7JFcyHbaRyZ83JlojNYKyG+3Pn6dgnrhwQ
        65j7Pad4L2WFnMwfTxfR9Q==
X-Google-Smtp-Source: APXvYqzyj/IhgIcosg+V9eSDk1T7UbLbJYKj67K43VeYokAtGtiA5geqXFgLTpyjlQIlyARe5+gqiA==
X-Received: by 2002:aca:da06:: with SMTP id r6mr1699237oig.82.1572918234843;
        Mon, 04 Nov 2019 17:43:54 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l18sm1216351oti.11.2019.11.04.17.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 17:43:54 -0800 (PST)
Date:   Mon, 4 Nov 2019 19:43:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org
Subject: Re: [PATCH v4 1/2] dt-bindings: media: i2c: Add IMX296 CMOS sensor
 binding
Message-ID: <20191105014353.GA841@bogus>
References: <20191030094902.32582-1-manivannan.sadhasivam@linaro.org>
 <20191030094902.32582-2-manivannan.sadhasivam@linaro.org>
 <20191030115328.GA6253@valkosipuli.retiisi.org.uk>
 <20191030120105.GA11432@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191030120105.GA11432@Mani-XPS-13-9360>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 30, 2019 at 05:31:05PM +0530, Manivannan Sadhasivam wrote:
> Hi Sakari,
> 
> On Wed, Oct 30, 2019 at 01:53:28PM +0200, Sakari Ailus wrote:
> > Hi Nabuvannan,
> > 
> > On Wed, Oct 30, 2019 at 03:19:01PM +0530, Manivannan Sadhasivam wrote:
> > > Add YAML devicetree binding for IMX296 CMOS image sensor. Let's also
> > > add MAINTAINERS entry for the binding and driver.
> > > 
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > ---
> > >  .../devicetree/bindings/media/i2c/imx296.yaml | 94 +++++++++++++++++++
> > >  MAINTAINERS                                   |  8 ++
> > >  2 files changed, 102 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx296.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/imx296.yaml b/Documentation/devicetree/bindings/media/i2c/imx296.yaml
> > > new file mode 100644
> > > index 000000000000..c04ec2203268
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/imx296.yaml
> > > @@ -0,0 +1,94 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/i2c/imx296.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Sony IMX296 1/2.8-Inch CMOS Image Sensor
> > > +
> > > +maintainers:
> > > +  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > +
> > > +description: |-
> > > +  The Sony IMX296 is a 1/2.9-Inch active pixel type CMOS Solid-state image
> > > +  sensor with square pixel array and 1.58 M effective pixels. This chip
> > > +  features a global shutter with variable charge-integration time. It is
> > > +  programmable through I2C and 4-wire interfaces. The sensor output is
> > > +  available via CSI-2 serial data output (1 Lane).
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: sony,imx296
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  clock-names:
> > > +    description:
> > > +      Input clock for the sensor.
> > > +    items:
> > > +      - const: mclk
> > > +
> > > +  clock-frequency:
> > > +    description:
> > > +      Frequency of the mclk clock in Hertz.
> > > +
> > > +  vddo-supply:
> > > +    description:
> > > +      Definition of the regulator used as interface power supply.
> > > +
> > > +  vdda-supply:
> > > +    description:
> > > +      Definition of the regulator used as analog power supply.
> > > +
> > > +  vddd-supply:
> > > +    description:
> > > +      Definition of the regulator used as digital power supply.
> > > +
> > > +  reset-gpios:
> > > +    description:
> > > +      The phandle and specifier for the GPIO that controls sensor reset.
> > > +    maxItems: 1
> > > +
> > > +  port: true
> > 
> > You're missing "type: object" under port.
> > 
> 
> I did that intentionally, since there are other places where I can see the
> "type" field not specified. So, I was not sure about that. Most of the
> display bindings don't specify "type" and they are most available ones.
> I don't think the "port" property differs between cameras and displays.
> So I went with that.

The difference is the panel bindings have a common schema included 
which defines 'port' at least as a node. I don't think an include would 
help too much here, so probably best to add 'type: object' for now. 
Either way, this may change once video-interfaces.txt is converted if 
any of those properties apply here.

Either way:

Reviewed-by: Rob Herring <robh@kernel.org>

Rob
