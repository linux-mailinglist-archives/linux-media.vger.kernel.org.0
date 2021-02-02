Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B73A930CAD0
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 20:03:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239139AbhBBTBJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 14:01:09 -0500
Received: from mga14.intel.com ([192.55.52.115]:53347 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239256AbhBBS7V (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Feb 2021 13:59:21 -0500
IronPort-SDR: vi4TedBFuGfF3yIRJeLP1923tuBfhvrjQ2ftaflYnSY4bV6a8v1aQbIrSF31uOwpuf1EM+U0Tz
 d9nWhJmI4/fQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9883"; a="180135121"
X-IronPort-AV: E=Sophos;i="5.79,396,1602572400"; 
   d="scan'208";a="180135121"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2021 10:57:36 -0800
IronPort-SDR: yOgzWzLCLv+wAc0iRkn8cxRNxFoXd90I1lYEz8Y90NXu1b5HEwBF2EZcgRC0Nhn19+ivqqB/IA
 6gg/ckLQ4EnQ==
X-IronPort-AV: E=Sophos;i="5.79,396,1602572400"; 
   d="scan'208";a="370831913"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2021 10:57:34 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 005E5208F7; Tue,  2 Feb 2021 20:57:31 +0200 (EET)
Date:   Tue, 2 Feb 2021 20:57:31 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Martina Krasteva <martinax.krasteva@linux.intel.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        daniele.alessandrelli@linux.intel.com,
        paul.j.murphy@linux.intel.com, gjorgjix.rosikopulos@linux.intel.com
Subject: Re: [PATCH v5 1/2] dt-bindings: media: Add bindings for imx334
Message-ID: <20210202185731.GW32460@paasikivi.fi.intel.com>
References: <20210201172445.164-1-martinax.krasteva@linux.intel.com>
 <20210201172445.164-2-martinax.krasteva@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210201172445.164-2-martinax.krasteva@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martina,

On Mon, Feb 01, 2021 at 05:24:44PM +0000, Martina Krasteva wrote:
> From: Martina Krasteva <martinax.krasteva@intel.com>
> 
> - Add dt-bindings documentation for Sony imx334 sensor driver.
> - Add MAINTAINERS entry for Sony imx334 binding documentation.
> 
> Signed-off-by: Martina Krasteva <martinax.krasteva@intel.com>
> Reviewed-by: Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>
> Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> Acked-by: Paul J. Murphy <paul.j.murphy@intel.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/media/i2c/sony,imx334.yaml | 77 ++++++++++++++++++++++
>  MAINTAINERS                                        |  8 +++
>  2 files changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
> new file mode 100644
> index 000000000000..e6b4f41f3232
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2021 Intel Corporation
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/sony,imx334.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony IMX334 Sensor
> +
> +maintainers:
> +  - Paul J. Murphy <paul.j.murphy@intel.com>
> +  - Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> +
> +description:
> +  IMX334 sensor is a Sony CMOS active pixel digital image sensor with an active
> +  array size of 3864H x 2202V. It is programmable through I2C interface. The
> +  I2C client address is fixed to 0x1a as per sensor data sheet. Image data is
> +  sent through MIPI CSI-2.
> +
> +properties:
> +  compatible:
> +    const: sony,imx334
> +  reg:
> +    description: I2C address
> +    maxItems: 1

Could you also add the clock properties such as in here:

<URL:https://git.linuxtv.org/sailus/media_tree.git/tree/Documentation/devicetree/bindings/media/i2c/imx258.yaml>

> +
> +  port:
> +    type: object
> +    additionalProperties: false
> +    $ref: /schemas/graph.yaml#/properties/port
> +
> +    properties:
> +      endpoint:
> +        type: object
> +        properties:
> +          data-lanes:
> +            $ref: ../video-interfaces.yaml#/properties/data-lanes
> +          link-frequencies:
> +            $ref: ../video-interfaces.yaml#/properties/link-frequencies
> +            description:
> +              Allowed data bus frequencies are 891000000, 594000000 and
> +              455500000 Hz.

These frequencies are those supported by the driver, aren't they, not those
supported by the sensor (of which many support virtually almost the entire
range from some 100 MHz to 1 GHz, depending on the external clock
frequency)?

If so, please drop the description from link-frequencies, or adjust it to
what the sensor actually supports.

> +
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +
> +    required:
> +      - endpoint
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
> +        camera@1a {
> +            compatible = "sony,imx334";
> +            reg = <0x1a>;
> +
> +            port {
> +                imx334: endpoint {
> +                    remote-endpoint = <&cam>;
> +                    data-lanes = <1 2 3 4>;
> +                    link-frequencies = /bits/ 64 <891000000>;
> +                };
> +            };
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3353de0c4bc8..2ab75519938a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16589,6 +16589,14 @@ S:	Maintained
>  T:	git git://linuxtv.org/media_tree.git
>  F:	drivers/media/i2c/imx319.c
>  
> +SONY IMX334 SENSOR DRIVER
> +M:	Paul J. Murphy <paul.j.murphy@intel.com>
> +M:	Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media_tree.git
> +F:	Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
> +
>  SONY IMX355 SENSOR DRIVER
>  M:	Tianshu Qiu <tian.shu.qiu@intel.com>
>  L:	linux-media@vger.kernel.org

-- 
Kind regards,

Sakari Ailus
