Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66D813C7B9E
	for <lists+linux-media@lfdr.de>; Wed, 14 Jul 2021 04:19:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237524AbhGNCWA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jul 2021 22:22:00 -0400
Received: from mail-io1-f43.google.com ([209.85.166.43]:36422 "EHLO
        mail-io1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237370AbhGNCV7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jul 2021 22:21:59 -0400
Received: by mail-io1-f43.google.com with SMTP id u7so185683ion.3;
        Tue, 13 Jul 2021 19:19:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=J7z2oSLzVMt4SabkTXK9Gz/CtB++JstqH99nEoet3iE=;
        b=tLeKFGed7hMGtdG+YEo/E3MiLo5Smg+0EwDZgpsaqz6E3cObuh23dEVtfK9DEcTzpX
         pIudCTJ1uZroMcXvOON/sAVqqr2LH6DPMCs5GIDH9CgmFY9hjxE8wIWoCV6QlpvXuMZe
         NA/hczMpAs2iEMZ5LEsDKF38FOyTcD5bJfAHNRH6BGWM6FJd1AePR5dHN6LDNkO8oLMy
         bGp9XgJ2VRBVRPCPtqMVwslGJKi+y/mUQuFuUPbZ7ov42EGkK8nKq84V2r+2y9OR5IYx
         LLugrjbKbB8vkT+7R6tzIE/yxHwlz2h5bLpFsMJd1st+mEv1fQ4Y2SdAoXa2y4IaH5eB
         Qujw==
X-Gm-Message-State: AOAM530fzlVpZv5x5NB/Joa1QDbrA+jQRaxQHhvZrKDNtmf3+R0KG3Mi
        4CKou00J+pD3u9u+5BqmqSDHJogYhA==
X-Google-Smtp-Source: ABdhPJyYsxBeRLUDTa6xK3WqJToa3dq7jqxLFr8eHgRDm1wJ2nu9DBMqK6ES7lSkInARegyykqkf3g==
X-Received: by 2002:a6b:b2d1:: with SMTP id b200mr5412440iof.187.1626229147947;
        Tue, 13 Jul 2021 19:19:07 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id c7sm431400ile.69.2021.07.13.19.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 19:19:07 -0700 (PDT)
Received: (nullmailer pid 1317722 invoked by uid 1000);
        Wed, 14 Jul 2021 02:19:04 -0000
Date:   Tue, 13 Jul 2021 20:19:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stefan Riedmueller <s.riedmueller@phytec.de>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/6] media: dt-bindings: mt9p031: Convert bindings to
 yaml
Message-ID: <20210714021904.GA1312716@robh.at.kernel.org>
References: <20210712085535.11907-1-s.riedmueller@phytec.de>
 <20210712085535.11907-6-s.riedmueller@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210712085535.11907-6-s.riedmueller@phytec.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 12, 2021 at 10:55:34AM +0200, Stefan Riedmueller wrote:
> Convert mt9p031 sensor bindings to yaml schema. Also update the
> MAINTAINERS entry.
> 
> Although input-clock-frequency and pixel-clock-frequency have not been
> definded as endpoint propierties in the textual bindings, the sensor
> does parse them from the endpoint. Thus move these properties to the
> endpoint in the new yaml bindings.
> 
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> ---
>  .../bindings/media/i2c/aptina,mt9p031.yaml    | 75 +++++++++++++++++++
>  .../devicetree/bindings/media/i2c/mt9p031.txt | 40 ----------
>  MAINTAINERS                                   |  1 +
>  3 files changed, 76 insertions(+), 40 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/mt9p031.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml b/Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
> new file mode 100644
> index 000000000000..ad9a2db73d86
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/aptina,mt9p031.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Aptina 1/2.5-Inch 5Mp CMOS Digital Image Sensor
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +
> +description: |
> +  The Aptina MT9P031 is a 1/2.5-inch CMOS active pixel digital image sensor
> +  with an active array size of 2592H x 1944V. It is programmable through a
> +  simple two-wire serial interface.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aptina,mt9p031
> +      - aptina,mt9p031m
> +
> +  reg:
> +    description: I2C device address
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: Chip reset GPIO
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#

Doesn't look like you use any properties from video-interfaces.yaml. You 
should just reference graph.yaml#/$defs/endpoint-base instead.

> +        unevaluatedProperties: false
> +
> +        properties:
> +          input-clock-frequency: true
> +          pixel-clock-frequency: true

These are custom properties, so they need a type, description, and any 
constraints.

> +
> +        required:
> +          - input-clock-frequency
> +          - pixel-clock-frequency
> +
> +required:
> +  - compatible
> +  - reg
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        mt9p031@5d {
> +            compatible = "aptina,mt9p031";
> +            reg = <0x5d>;
> +            reset-gpios = <&gpio_sensor 0 0>;
> +
> +            port {
> +                mt9p031_1: endpoint {
> +                    input-clock-frequency = <6000000>;
> +                    pixel-clock-frequency = <96000000>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/media/i2c/mt9p031.txt b/Documentation/devicetree/bindings/media/i2c/mt9p031.txt
> deleted file mode 100644
> index cb60443ff78f..000000000000
> --- a/Documentation/devicetree/bindings/media/i2c/mt9p031.txt
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -* Aptina 1/2.5-Inch 5Mp CMOS Digital Image Sensor
> -
> -The Aptina MT9P031 is a 1/2.5-inch CMOS active pixel digital image sensor with
> -an active array size of 2592H x 1944V. It is programmable through a simple
> -two-wire serial interface.
> -
> -Required Properties:
> -- compatible: value should be either one among the following
> -	(a) "aptina,mt9p031" for mt9p031 sensor
> -	(b) "aptina,mt9p031m" for mt9p031m sensor
> -
> -- input-clock-frequency: Input clock frequency.
> -
> -- pixel-clock-frequency: Pixel clock frequency.
> -
> -Optional Properties:
> -- reset-gpios: Chip reset GPIO
> -
> -For further reading on port node refer to
> -Documentation/devicetree/bindings/media/video-interfaces.txt.
> -
> -Example:
> -
> -	i2c0@1c22000 {
> -		...
> -		...
> -		mt9p031@5d {
> -			compatible = "aptina,mt9p031";
> -			reg = <0x5d>;
> -			reset-gpios = <&gpio3 30 0>;
> -
> -			port {
> -				mt9p031_1: endpoint {
> -					input-clock-frequency = <6000000>;
> -					pixel-clock-frequency = <96000000>;
> -				};
> -			};
> -		};
> -		...
> -	};
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a61f4f3b78a9..33dd81237a91 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12635,6 +12635,7 @@ M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  T:	git git://linuxtv.org/media_tree.git
> +F:	Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
>  F:	drivers/media/i2c/mt9p031.c
>  F:	include/media/i2c/mt9p031.h
>  
> -- 
> 2.25.1
> 
> 
