Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4282425C0F1
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 14:26:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728826AbgICMZc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 08:25:32 -0400
Received: from mga11.intel.com ([192.55.52.93]:7920 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728731AbgICMYR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Sep 2020 08:24:17 -0400
IronPort-SDR: dqBmYJBpGeo7JdeHND5NUKrCIw0cexb5txHj93ZPZXLfw4OzPXu2gajWte2u3Llvo7O2hW4JLg
 I+rmTd/S2Jzg==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="155067646"
X-IronPort-AV: E=Sophos;i="5.76,386,1592895600"; 
   d="scan'208";a="155067646"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2020 05:23:36 -0700
IronPort-SDR: aiUb6nTgHIKXIB8OKWkpdonU9gPrR9gO8i0pGZvRcWuP5ogDPkbOSOozaBE8vHCx/ahlCGukzs
 HnRBoWXD59Fw==
X-IronPort-AV: E=Sophos;i="5.76,386,1592895600"; 
   d="scan'208";a="375859338"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2020 05:23:33 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 95E89203ED; Thu,  3 Sep 2020 15:23:31 +0300 (EEST)
Date:   Thu, 3 Sep 2020 15:23:31 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, Leon Luo <leonl@leopardimaging.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: media: imx274: Convert to json-schema
Message-ID: <20200903122331.GJ32646@paasikivi.fi.intel.com>
References: <20200903115143.13717-1-jacopo+renesas@jmondi.org>
 <20200903115143.13717-3-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903115143.13717-3-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thanks for the update.

On Thu, Sep 03, 2020 at 01:51:42PM +0200, Jacopo Mondi wrote:
> Convert the imx274 bindings document to json-schema and update
> the MAINTAINERS file accordingly.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../devicetree/bindings/media/i2c/imx274.txt  | 38 ------------
>  .../bindings/media/i2c/sony,imx274.yaml       | 59 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 60 insertions(+), 39 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/imx274.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/imx274.txt b/Documentation/devicetree/bindings/media/i2c/imx274.txt
> deleted file mode 100644
> index 0727079d2410..000000000000
> --- a/Documentation/devicetree/bindings/media/i2c/imx274.txt
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -* Sony 1/2.5-Inch 8.51Mp CMOS Digital Image Sensor
> -
> -The Sony imx274 is a 1/2.5-inch CMOS active pixel digital image sensor with
> -an active array size of 3864H x 2202V. It is programmable through I2C
> -interface. The I2C address is fixed to 0x1a as per sensor data sheet.
> -Image data is sent through MIPI CSI-2, which is configured as 4 lanes
> -at 1440 Mbps.
> -
> -
> -Required Properties:
> -- compatible: value should be "sony,imx274" for imx274 sensor
> -- reg: I2C bus address of the device
> -
> -Optional Properties:
> -- reset-gpios: Sensor reset GPIO
> -- clocks: Reference to the input clock.
> -- clock-names: Should be "inck".
> -- VANA-supply: Sensor 2.8v analog supply.
> -- VDIG-supply: Sensor 1.8v digital core supply.
> -- VDDL-supply: Sensor digital IO 1.2v supply.
> -
> -The imx274 device node should contain one 'port' child node with
> -an 'endpoint' subnode. For further reading on port node refer to
> -Documentation/devicetree/bindings/media/video-interfaces.txt.
> -
> -Example:
> -	sensor@1a {
> -		compatible = "sony,imx274";
> -		reg = <0x1a>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		reset-gpios = <&gpio_sensor 0 0>;
> -		port {
> -			sensor_out: endpoint {
> -				remote-endpoint = <&csiss_in>;
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
> new file mode 100644
> index 000000000000..f757ce380cb2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/sony,imx274.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony 1/2.5-Inch 8.51MP CMOS Digital Image Sensor
> +
> +maintainers:
> +  - Leon Luo <leonl@leopardimaging.com>
> +
> +description: |
> +  The Sony IMX274 is a 1/2.5-inch CMOS active pixel digital image sensor with an
> +  active array size of 3864H x 2202V. It is programmable through I2C interface.
> +  Image data is sent through MIPI CSI-2, which is configured as 4 lanes at 1440
> +  Mbps.
> +
> +properties:
> +  compatible:
> +    const: sony,imx274
> +
> +  reg:
> +    const: 0x1a
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  port:
> +    type: object
> +    description: |
> +      Output video port. See ../video-interfaces.txt.
> +

What happened to the supplies and the clocks?

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
> +        imx274: camera-sensor@1a {
> +            compatible = "sony,imx274";
> +            reg = <0x1a>;
> +            reset-gpios = <&gpio_sensor 0 0>;
> +
> +            port {
> +                sensor_out: endpoint {
> +                    remote-endpoint = <&csiss_in>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3f8f093268b7..093a54ae1527 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16127,7 +16127,7 @@ M:	Leon Luo <leonl@leopardimaging.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  T:	git git://linuxtv.org/media_tree.git
> -F:	Documentation/devicetree/bindings/media/i2c/imx274.txt
> +F:	Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
>  F:	drivers/media/i2c/imx274.c
> 
>  SONY IMX290 SENSOR DRIVER

-- 
Regards,

Sakari Ailus
