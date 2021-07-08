Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5F053BF8D7
	for <lists+linux-media@lfdr.de>; Thu,  8 Jul 2021 13:23:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231600AbhGHL0A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jul 2021 07:26:00 -0400
Received: from mga07.intel.com ([134.134.136.100]:50680 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231540AbhGHL0A (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Jul 2021 07:26:00 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="273326690"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; 
   d="scan'208";a="273326690"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2021 04:23:17 -0700
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; 
   d="scan'208";a="428320822"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2021 04:23:15 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 33AA920188;
        Thu,  8 Jul 2021 14:23:13 +0300 (EEST)
Date:   Thu, 8 Jul 2021 14:23:13 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Stefan Riedmueller <s.riedmueller@phytec.de>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/6] media: dt-bindings: mt9p031: Convert bindings to
 yaml
Message-ID: <20210708112313.GA3@paasikivi.fi.intel.com>
References: <20210708091922.5508-1-s.riedmueller@phytec.de>
 <20210708091922.5508-6-s.riedmueller@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210708091922.5508-6-s.riedmueller@phytec.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stefan,

Thanks for the patch.

On Thu, Jul 08, 2021 at 11:19:21AM +0200, Stefan Riedmueller wrote:
> Convert mt9p031 sensor bindings to yaml schema. Also update the
> MAINTAINERS entry.
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
> index 000000000000..7de62e339895
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/mt9p031.yaml#
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
> +    $ref: /schemas/graph.yaml#/properties/port

This should probably be:

	$ref: /schemas/graph.yaml#/$defs/port-base

> +    addittionalProeprties: false


Could you run

	make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml

please?

> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          input-clock-frequency: true
> +          pixel-clock-frequency: true

These two legacy properties were not in the endpoint previously.

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
> +        }:
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
> index c7456776ace5..f2123226baae 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12610,6 +12610,7 @@ M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  T:	git git://linuxtv.org/media_tree.git
> +F:	Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
>  F:	drivers/media/i2c/mt9p031.c
>  F:	include/media/i2c/mt9p031.h
>  

-- 
Kind regards,

Sakari Ailus
