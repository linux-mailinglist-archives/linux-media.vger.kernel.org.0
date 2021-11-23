Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 516B745A0E7
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 12:07:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234587AbhKWLK1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 06:10:27 -0500
Received: from mga09.intel.com ([134.134.136.24]:43062 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234722AbhKWLK0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 06:10:26 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10176"; a="234823917"
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800"; 
   d="scan'208";a="234823917"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 03:07:17 -0800
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800"; 
   d="scan'208";a="740458952"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 03:07:15 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 476C120762;
        Tue, 23 Nov 2021 13:07:00 +0200 (EET)
Date:   Tue, 23 Nov 2021 13:07:00 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>, Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        p.zabel@pengutronix.de, Ian Arkver <ian.arkver.dev@gmail.com>,
        kernel@pengutronix.de, Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v8 2/3] media: dt-bindings: Add Intersil ISL79987 DT
 bindings
Message-ID: <YZzLVI2ZUBvXGhkZ@paasikivi.fi.intel.com>
References: <20211123101517.3656935-1-m.tretter@pengutronix.de>
 <20211123101517.3656935-3-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211123101517.3656935-3-m.tretter@pengutronix.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

On Tue, Nov 23, 2021 at 11:15:16AM +0100, Michael Tretter wrote:
> From: Marek Vasut <marex@denx.de>
> 
> Add bindings for the Intersil ISL79987 analog to MIPI CSI-2 decoder.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> To: linux-media@vger.kernel.org
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> Changelog:
> 
> v8: none
> 
> v7: none
> 
> v6: none
> 
> v5: none
> 
> v4: none
> 
> v3:
> 
> - rename pd-gpios property to powerdown-gpios
> - reference graph.yaml for ports/port properties
> - remove reference to video-interfaces.txt
> - remove unnecessary description of ports property
> 
> v2:
> 
> - convert binding to yaml
> - change description to match only isl79987
> - replace num-inputs property with multiple ports
> - add reset gpio
> ---
>  .../bindings/media/i2c/isil,isl79987.yaml     | 100 ++++++++++++++++++
>  1 file changed, 100 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/isil,isl79987.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/isil,isl79987.yaml b/Documentation/devicetree/bindings/media/i2c/isil,isl79987.yaml
> new file mode 100644
> index 000000000000..aee4a5966df3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/isil,isl79987.yaml
> @@ -0,0 +1,100 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/isil,isl79987.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Intersil ISL79987 Analog to MIPI CSI-2 decoder
> +
> +maintainers:
> +  - Michael Tretter <m.tretter@pengutronix.de>
> +  - Marek Vasut <marex@denx.de>
> +
> +description:
> +  The Intersil ISL79987 is an analog to MIPI CSI-2 decoder which is capable of
> +  receiving up to four analog stream and multiplexing them into up to four MIPI
> +  CSI-2 virtual channels, using one MIPI clock lane and 1/2 data lanes.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - isil,isl79987
> +
> +  reg:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description:
> +      A GPIO spec for the RSTB pin (active high)
> +
> +  powerdown-gpios:
> +    maxItems: 1
> +    description:
> +      A GPIO spec for the Power Down pin (active high)
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output port

I think you need need the data-lanes property for endpoints on this port.

> +
> +    patternProperties:
> +      "^port@[1-4]$":
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Input ports
> +
> +    required:
> +      - port@0
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - ports
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      isl7998x_mipi@44 {
> +        compatible = "isil,isl79987";
> +        reg = <0x44>;
> +        powerdown-gpios = <&gpio3 27 GPIO_ACTIVE_HIGH>;
> +        reset-gpios = <&gpio3 28 GPIO_ACTIVE_HIGH>;
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +            isl79987_out: endpoint {
> +              remote-endpoint = <&mipi_csi2_in>;
> +              clock-lanes = <0>;
> +              data-lanes = <1 2>;
> +            };
> +          };
> +
> +          port@1 {
> +            reg = <1>;
> +            endpoint {
> +              remote-endpoint = <&camera_0>;
> +            };
> +          };
> +
> +          port@2 {
> +            reg = <2>;
> +            endpoint {
> +              remote-endpoint = <&camera_1>;
> +            };
> +          };
> +        };
> +      };
> +    };

-- 
Kind regards,

Sakari Ailus
