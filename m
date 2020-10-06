Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 651B82852BD
	for <lists+linux-media@lfdr.de>; Tue,  6 Oct 2020 21:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727183AbgJFT6K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Oct 2020 15:58:10 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:39923 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbgJFT6K (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Oct 2020 15:58:10 -0400
Received: by mail-oi1-f194.google.com with SMTP id c13so13939075oiy.6;
        Tue, 06 Oct 2020 12:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kIm/kYkFd5ATD8cOM8dTc1HeywhgoFeF5PPVpIyeSXY=;
        b=qeFbBb/s8Az7g/i5Ok7evXSkurGGJwGru57hu9VUGpc//k0+mDUliWKchbOqxqizv5
         SUC++xp+o2sH4yhORS2mW/fTO8MuAnsf+3JMGmT0SqYYeKSkSBnBmS35M9+ZxV790FLR
         9Gh2qryt+Q4jk1pU3tNmaaooDaiKaxWKkNykoCUgUxSg+ar5gj7e1GbRhvlPQ9lGPzGS
         UGyT/zvk1+IqnHww7x9s5yWE2xcaT+6fqgFsQLx21KzkGNwasbeK+dlANRCOmUHDGtX7
         ly/aN5Sao8YaxfVK6SYbzKCJMLG/pCPAlx2fnDBFcC+6sVYX+3hWGJixfXh72NdFoDIu
         6Irw==
X-Gm-Message-State: AOAM532MQv3GERcFzdzNktLy0Q02W53SA2cxb907OEiXkWOA4tXS2Brp
        n+lyUdQEOrJ/bsM+lOpAPvTQ/f0XBzQS
X-Google-Smtp-Source: ABdhPJzgZcca9a0994gGZm0RgItXzi0dBUiF1MamqLGgl4l2pBk0oDX6+YyS4lGekaOnN4R6Sy7eoA==
X-Received: by 2002:a05:6808:359:: with SMTP id j25mr3915422oie.85.1602014289228;
        Tue, 06 Oct 2020 12:58:09 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f13sm415146oij.0.2020.10.06.12.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 12:58:08 -0700 (PDT)
Received: (nullmailer pid 2733212 invoked by uid 1000);
        Tue, 06 Oct 2020 19:58:07 -0000
Date:   Tue, 6 Oct 2020 14:58:07 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [RESEND PATCH 023/100] dt-bindings: nokia,smia: Convert to YAML
Message-ID: <20201006195807.GA2724596@bogus>
References: <20200930201914.31377-1-sakari.ailus@linux.intel.com>
 <20200930201914.31377-5-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930201914.31377-5-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 30, 2020 at 11:19:11PM +0300, Sakari Ailus wrote:
> Convert nokia,smia DT bindings to YAML.
> 
> Also add explicit license to bindings.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../bindings/media/i2c/nokia,smia.txt         |  68 --------
>  .../bindings/media/i2c/nokia,smia.yaml        | 147 ++++++++++++++++++
>  2 files changed, 147 insertions(+), 68 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/nokia,smia.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/nokia,smia.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/nokia,smia.txt b/Documentation/devicetree/bindings/media/i2c/nokia,smia.txt
> deleted file mode 100644
> index 5ea4f799877b..000000000000
> --- a/Documentation/devicetree/bindings/media/i2c/nokia,smia.txt
> +++ /dev/null
> @@ -1,68 +0,0 @@
> -SMIA/SMIA++ sensor
> -
> -SMIA (Standard Mobile Imaging Architecture) is an image sensor standard
> -defined jointly by Nokia and ST. SMIA++, defined by Nokia, is an extension
> -of that. These definitions are valid for both types of sensors.
> -
> -More detailed documentation can be found in
> -Documentation/devicetree/bindings/media/video-interfaces.txt .
> -
> -The device node should contain a "port" node which may contain one or more
> -endpoint nodes, in accordance with video interface bindings defined in
> -Documentation/devicetree/bindings/media/video-interfaces.txt .
> -
> -Mandatory properties
> ---------------------
> -
> -- compatible: "nokia,smia"
> -- reg: I2C address (0x10, or an alternative address)
> -- clocks: External clock to the sensor
> -- clock-frequency: Frequency of the external clock to the sensor
> -
> -
> -Optional properties
> --------------------
> -
> -- reset-gpios: XSHUTDOWN GPIO
> -- flash-leds: See ../video-interfaces.txt
> -- lens-focus: See ../video-interfaces.txt
> -- rotation: Integer property; valid values are 0 (sensor mounted upright)
> -	    and 180 (sensor mounted upside down). See
> -	    ../video-interfaces.txt .
> -- vana-supply: Analogue voltage supply (VANA), typically 2,8 volts (sensor
> -  dependent).
> -
> -
> -Endpoint node mandatory properties
> -----------------------------------
> -
> -- data-lanes: <1..n>
> -- link-frequencies: List of allowed data link frequencies. An array of
> -  64-bit elements.
> -
> -
> -Example
> --------
> -
> -&i2c2 {
> -	clock-frequency = <400000>;
> -
> -	camera-sensor@10 {
> -		compatible = "nokia,smia";
> -		reg = <0x10>;
> -		reset-gpios = <&gpio3 20 0>;
> -		vana-supply = <&vaux3>;
> -		clocks = <&omap3_isp 0>;
> -		clock-frequency = <9600000>;
> -		nokia,nvm-size = <512>; /* 8 * 64 */
> -		port {
> -			smiapp_ep: endpoint {
> -				data-lanes = <1 2>;
> -				remote-endpoint = <&csi2a_ep>;
> -				link-frequencies =
> -					/bits/ 64 <199200000 210000000
> -						   499200000>;
> -			};
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/media/i2c/nokia,smia.yaml b/Documentation/devicetree/bindings/media/i2c/nokia,smia.yaml
> new file mode 100644
> index 000000000000..3d6f68b0e559
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/nokia,smia.yaml
> @@ -0,0 +1,147 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2014--2020 Intel Corporation
> +
> +$id: http://devicetree.org/schemas/media/i2c/nokia,smia.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SMIA/SMIA++ sensor
> +
> +maintainers:
> +  - Sakari Ailus <sakari.ailus@linux.intel.com>
> +
> +description:
> +
> +  SMIA (Standard Mobile Imaging Architecture) is an image sensor standard
> +  defined jointly by Nokia and ST. SMIA++, defined by Nokia, is an extension of
> +  that. These definitions are valid for both types of sensors.
> +
> +  More detailed documentation can be found in
> +  Documentation/devicetree/bindings/media/video-interfaces.txt .
> +
> +properties:
> +  compatible:
> +    const: nokia,smia
> +
> +  reg:
> +    maxItems: 1
> +
> +  vana-supply:
> +    description: Analogue voltage supply (VANA), typically 2,8 volts (sensor
> +      dependent).
> +    maxItems: 1
> +
> +  clocks:
> +    description: External clock to the sensor.
> +    maxItems: 1
> +
> +  clock-frequency:
> +    description: Frequency of the external clock to the sensor.
> +
> +  reset-gpios:
> +    description: Reset GPIO. Also commonly called XSHUTDOWN in hardware
> +      documentation.
> +    maxItems: 1
> +
> +  flash-leds:
> +    description: Flash LED phandles. See ../video-interfaces.txt for details.
> +
> +  lens-focus:
> +    description: Lens focus controller phandles. See ../video-interfaces.txt
> +      for details.
> +
> +  rotation:
> +    description: Rotation; either 0 or 180 degrees.

enum: [ 0, 180 ]

> +
> +  port:
> +    type: object
> +    properties:
> +      endpoint:
> +        type: object
> +        properties:
> +          link-frequencies:
> +            $ref: /schemas/types.yaml#/definitions/uint64-array
> +            description: List of allowed data link frequencies. An array of
> +              64-bit elements.

Just 'link-frequencies: true' unless you have some additional 
constraints.

> +          data-lanes:
> +            oneOf:
> +              - items:
> +                - const: 1
> +              - items:
> +                - const: 1
> +                - const: 2
> +              - items:
> +                - const: 1
> +                - const: 2
> +                - const: 3
> +              - items:
> +                - const: 1
> +                - const: 2
> +                - const: 3
> +                - const: 4
> +              - items:
> +                - const: 1
> +                - const: 2
> +                - const: 3
> +                - const: 4
> +                - const: 5
> +              - items:
> +                - const: 1
> +                - const: 2
> +                - const: 3
> +                - const: 4
> +                - const: 5
> +                - const: 6
> +              - items:
> +                - const: 1
> +                - const: 2
> +                - const: 3
> +                - const: 4
> +                - const: 5
> +                - const: 6
> +                - const: 7
> +              - items:
> +                - const: 1
> +                - const: 2
> +                - const: 3
> +                - const: 4
> +                - const: 5
> +                - const: 6
> +                - const: 7
> +                - const: 8

This all can be just the last 'items' plus:

minItems: 1
maxItems: 8


> +        required:
> +          - link-frequencies
> +          - data-lanes
> +
> +required:
> +  - compatible
> +  - reg
> +  - clock-frequency
> +  - clocks

additionalProperties: false

> +
> +examples:
> +  - |
> +    i2c2 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        clock-frequency = <400000>;
> +
> +        camera-sensor@10 {
> +            compatible = "nokia,smia";
> +            reg = <0x10>;
> +            reset-gpios = <&gpio3 20 0>;
> +            vana-supply = <&vaux3>;
> +            clocks = <&omap3_isp 0>;
> +            clock-frequency = <9600000>;
> +            nokia,nvm-size = <512>; /* 8 * 64 */

Not documented.

> +            port {
> +                smiapp_ep: endpoint {
> +                    data-lanes = <1 2>;
> +                    remote-endpoint = <&csi2a_ep>;
> +                    link-frequencies = /bits/ 64 <199200000 210000000
> +                                                  499200000>;
> +                };
> +            };
> +        };
> +    };
> +...
> -- 
> 2.27.0
> 
