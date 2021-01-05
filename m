Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6C082EB1CC
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 18:51:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730591AbhAERu0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 12:50:26 -0500
Received: from mail-io1-f48.google.com ([209.85.166.48]:34306 "EHLO
        mail-io1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730375AbhAERuZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 12:50:25 -0500
Received: by mail-io1-f48.google.com with SMTP id i18so175255ioa.1;
        Tue, 05 Jan 2021 09:50:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/XtIg+f6gpHC70+1YwF/fqisRZpaChakcrkklrBAZBs=;
        b=thQDcHGxHYOlhIAHi0U4lfQP5IRM/Pb8i6kVQsD9feYR9jbtpu4oGrD4Hw/FKSJhw2
         1U4vDudMYPj6bC4GfxTOD0qwUIZp6FuKsXYrmtFiezvYJi42Fhxo+lChzbvqWrNErGrO
         iboay45EJm0AiaiQo0lA9tTcGqj8GnRvSAeM2XRHn8PFxq/e4rdHyl8toRVGe0cXc7it
         8RuU9WEDHihH8664eb0U1L0feXSZRvy11r5r+dq8vl3rDlUB+nn8qNg96Osc4iZI7go4
         q9VBmnnkhAIkfP1G7QIdW5Cp28ROlbTWuB/QQNYRJvko85NxcXRKZlOtbt2mDy6VhwHw
         bW0Q==
X-Gm-Message-State: AOAM531RZV9k1/9iEE9JjOVV6uU/36FxAeUIRyE+LA/6rVz32EDkYW6v
        9RLOill3J+VTqrSN6kMHoJl6UjIKlA==
X-Google-Smtp-Source: ABdhPJxKFFTNMj4RPBqrgiGX8oxV3CEsYgbKyvDtlwfE+ekAx+GGj3COMBM5mer23VN91fCvh9ck7w==
X-Received: by 2002:a5d:959a:: with SMTP id a26mr218009ioo.94.1609868984357;
        Tue, 05 Jan 2021 09:49:44 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id j15sm24518ile.1.2021.01.05.09.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 09:49:43 -0800 (PST)
Received: (nullmailer pid 440434 invoked by uid 1000);
        Tue, 05 Jan 2021 17:49:41 -0000
Date:   Tue, 5 Jan 2021 10:49:41 -0700
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Benoit Parrot <bparrot@ti.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: media: Add bindings for OmniVision
 OV1063x sensors
Message-ID: <20210105174941.GA435623@robh.at.kernel.org>
References: <20210104053945.12409-1-laurent.pinchart@ideasonboard.com>
 <20210104053945.12409-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210104053945.12409-2-laurent.pinchart@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 04, 2021 at 07:39:44AM +0200, Laurent Pinchart wrote:
> From: Benoit Parrot <bparrot@ti.com>
> 
> Add device tree bindings for the OmniVision OV10633 and OV10635 camera
> sensors.
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../bindings/media/i2c/ov1063x.yaml           | 97 +++++++++++++++++++

ovti,ov1063x.yaml

>  MAINTAINERS                                   |  7 ++
>  2 files changed, 104 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov1063x.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov1063x.yaml b/Documentation/devicetree/bindings/media/i2c/ov1063x.yaml
> new file mode 100644
> index 000000000000..b5e08dd2f496
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ov1063x.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ov1063x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OmniVision OV10633/OV1035 Camera Sensor
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +
> +description: |-
> +  The OmniVision OV1063x is a 720p camera sensor which supports resolutions up
> +  to 1280x800 and 8- and 10-bit YUV output formats.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ovti,ov10633
> +      - ovti,ov10635
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clocks-names:
> +    const: xvclk
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description:
> +      Specifier for the GPIO connected to the RESETB pin.
> +
> +  powerdown-gpios:
> +    maxItems: 1
> +    description:
> +      Specifier for the GPIO connected to the PWDN pin.
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: ../video-interfaces.yaml#

TBC, this patch has to go in after the above file.

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>

> +        unevaluatedProperties: false
> +
> +        properties:
> +          hsync-active: true
> +          vsync-active: true
> +          pclk-sample: true
> +          bus-width:
> +            enum: [ 8, 10 ]
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clocks-names
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        clock-frequency = <400000>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        camera@37 {
> +            compatible = "ovti,ov10633";
> +            reg = <0x37>;
> +
> +            clocks = <&fixed_clock>;
> +            clocks-names = "xvclk";
> +
> +            reset-gpios = <&gpio4 17 GPIO_ACTIVE_HIGH>;
> +            powerdown-gpios = <&gpio5 11 GPIO_ACTIVE_HIGH>;
> +
> +            port {
> +                camera1: endpoint {
> +                     remote-endpoint = <&vin1a_ep>;
> +                     hsync-active = <1>;
> +                     vsync-active = <1>;
> +                     pclk-sample = <0>;
> +                     bus-width = <8>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 281de213ef47..9dc3a7d75460 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12867,6 +12867,13 @@ M:	Harald Welte <laforge@gnumonks.org>
>  S:	Maintained
>  F:	drivers/char/pcmcia/cm4040_cs.*
>  
> +OMNIVISION OV10633 SENSOR DRIVER
> +M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media_tree.git
> +F:	Documentation/devicetree/bindings/media/i2c/ov1063x.yaml
> +
>  OMNIVISION OV13858 SENSOR DRIVER
>  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
>  L:	linux-media@vger.kernel.org
> -- 
> Regards,
> 
> Laurent Pinchart
> 
