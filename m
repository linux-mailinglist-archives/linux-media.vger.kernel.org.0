Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB713126F47
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2019 22:01:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726967AbfLSVBD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Dec 2019 16:01:03 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:43190 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726880AbfLSVBD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Dec 2019 16:01:03 -0500
Received: by mail-ot1-f66.google.com with SMTP id p8so8836419oth.10;
        Thu, 19 Dec 2019 13:01:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ON8eGjdOxXDNxXRbcSo/zXFn8dAXPmlNBuT1v9QHzVI=;
        b=gOYZaPMLL6OtfUWfTkipWvfJE0jY/Ruxl1Pt9NbR2GlfgSEgg6VXiPeoFdCKkAZbF0
         I/pDoW8CebzKqgJajr5TNUMOJiFrPgPVrbraeIORiPYA7YB9qsaKruQuugHXmvVq5b2p
         9Pv6+CLaLWbMa6QahJkNhHj502ulZPJw0VU/uMFFvOYqS3xBEajXWOKarCwJRD9KuY1K
         hrVZNBonARBPJfRLipngluLJKezbih+obAAxmXL7OdDzEF8poAUnYWUZl71CeBhk3muI
         FNKYKJGfxmH6AWQjX/MtUF9BM8j/YoEmFCPINqBZJcQdAMx7lghaVyYHbTEKIFXptdey
         Lfjw==
X-Gm-Message-State: APjAAAV065/3zEDH+H6SPsgm0TZOEcoT2z5DEh6TYE6MLW9omT6OC3CX
        llRA+LBloe9RcXTVK20+LQ==
X-Google-Smtp-Source: APXvYqymkyfBQbbE6mbUJpRdoEUTa5HJV/Tz+rBwksGN5tWKB0xiojoCFA5+NT3bUfNmrK77J5+/Fg==
X-Received: by 2002:a9d:760f:: with SMTP id k15mr10786676otl.65.1576789261369;
        Thu, 19 Dec 2019 13:01:01 -0800 (PST)
Received: from localhost (ip-184-205-110-29.ftwttx.spcsdns.net. [184.205.110.29])
        by smtp.gmail.com with ESMTPSA id b81sm2432958oia.0.2019.12.19.13.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 13:01:00 -0800 (PST)
Date:   Thu, 19 Dec 2019 15:00:59 -0600
From:   Rob Herring <robh@kernel.org>
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, dave.stevenson@raspberrypi.com,
        peter.griffin@linaro.org
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: Add IMX219 CMOS sensor
 binding
Message-ID: <20191219205934.GA19011@bogus>
References: <20191211115441.10637-1-andrey.konovalov@linaro.org>
 <20191211115441.10637-2-andrey.konovalov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191211115441.10637-2-andrey.konovalov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 11, 2019 at 02:54:40PM +0300, Andrey Konovalov wrote:
> Add YAML device tree binding for IMX219 CMOS image sensor, and
> the relevant MAINTAINERS entries.
> 
> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> ---
>  .../devicetree/bindings/media/i2c/imx219.yaml | 112 ++++++++++++++++++
>  MAINTAINERS                                   |   8 ++
>  2 files changed, 120 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx219.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/imx219.yaml b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> new file mode 100644
> index 000000000000..5e4293c21933
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> @@ -0,0 +1,112 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license new bindings:

(GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony 1/4.0-Inch 8Mpixel CMOS Digital Image Sensor
> +
> +maintainers:
> +  - Dave Stevenson <dave.stevenson@raspberrypi.com>
> +
> +description: |-
> +  The Sony imx219 is a 1/4.0-inch CMOS active pixel digital image sensor
> +  with an active array size of 3280H x 2464V. It is programmable through
> +  I2C interface. The I2C address is fixed to 0x10 as per sensor data sheet.
> +  Image data is sent through MIPI CSI-2, which is configured as either 2 or
> +  4 data lanes.
> +
> +properties:
> +  compatible:
> +    const: sony,imx219
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: xclk
> +
> +  VDIG-supply:
> +    description:
> +      Digital I/O voltage supply, 1.8 volts
> +
> +  VANA-supply:
> +    description:
> +      Analog voltage supply, 2.8 volts
> +
> +  VDDL-supply:
> +    description:
> +      Digital core voltage supply, 1.2 volts
> +
> +  xclr-gpios:
> +    description: |-
> +      Reference to the GPIO connected to the xclr pin, if any.
> +      Must be released after all supplies are applied.
> +      This is an active high signal to the imx219.
> +
> +  clock-noncontinuous:
> +    description: |-
> +      Presence of this boolean property decides whether the MIPI CSI-2 clock
> +      is continuous or non-continuous.
> +
> +  camera-clk: true

Not a standard prop. Needs a type, description, etc.

> +
> +  port: true
> +
> +  data-lanes:
> +    description: |-
> +      Should be <1 2 3 4> for four-lane operation, or <1 2> for two-lane
> +      operation.
> +    const: <1 2>

Not valid json-schema. Run 'make dt_binding_check' and fix the errors.

These also go under the 'endpoint' node.

> +  clock-lanes:
> +    const: <0>
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - VANA-supply
> +  - VDIG-supply
> +  - VDDL-supply

port required?

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        imx219: sensor@10 {
> +            compatible = "sony,imx219";
> +            reg = <0x10>;
> +            clocks = <&imx219_clk>;
> +            clock-names = "xclk";
> +            VANA-supply = <&imx219_vana>;   /* 2.8v */
> +            VDIG-supply = <&imx219_vdig>;   /* 1.8v */
> +            VDDL-supply = <&imx219_vddl>;   /* 1.2v */
> +
> +            imx219_clk: camera-clk {
> +                compatible = "fixed-clock";
> +                #clock-cells = <0>;
> +                clock-frequency = <24000000>;
> +            };
> +
> +            port {
> +                imx219_0: endpoint {
> +                    remote-endpoint = <&csi1_ep>;
> +                    clock-lanes = <0>;
> +                    data-lanes = <1 2>;
> +                    clock-noncontinuous;
> +                    bus-type = <4>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 02d5278a4c9a..3baf2954d2f4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15339,6 +15339,14 @@ S:	Maintained
>  F:	drivers/media/i2c/imx214.c
>  F:	Documentation/devicetree/bindings/media/i2c/sony,imx214.txt
>  
> +SONY IMX219 SENSOR DRIVER
> +M:	Dave Stevenson <dave.stevenson@raspberrypi.com>
> +L:	linux-media@vger.kernel.org
> +T:	git git://linuxtv.org/media_tree.git
> +S:	Maintained
> +F:	drivers/media/i2c/imx219.c
> +F:	Documentation/devicetree/bindings/media/i2c/imx219.yaml
> +
>  SONY IMX258 SENSOR DRIVER
>  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
>  L:	linux-media@vger.kernel.org
> -- 
> 2.17.1
> 
