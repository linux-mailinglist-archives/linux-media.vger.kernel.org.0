Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FB922A0C22
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 18:09:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727313AbgJ3RJW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 13:09:22 -0400
Received: from mga03.intel.com ([134.134.136.65]:52619 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726461AbgJ3RJV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 13:09:21 -0400
IronPort-SDR: e1NsEu5GSFSTQ/6xpbbuAEUpOhddV8f/odcNrrja5FER7GlFENV1pqjdNVgX726wptxqupxy4Q
 0tyyuG1u9Q5g==
X-IronPort-AV: E=McAfee;i="6000,8403,9790"; a="168733504"
X-IronPort-AV: E=Sophos;i="5.77,434,1596524400"; 
   d="scan'208";a="168733504"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2020 10:09:19 -0700
IronPort-SDR: BiLJew72EJoWCdLhy033Fh1u26n2eXAIZ+BnUAZR6QFJahl7/ks2vtcv2uDdcO4iNBHjTQXYoE
 rsbRvcmmXQTQ==
X-IronPort-AV: E=Sophos;i="5.77,434,1596524400"; 
   d="scan'208";a="351930010"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2020 10:09:16 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id E60BA20C9F; Fri, 30 Oct 2020 18:37:22 +0200 (EET)
Date:   Fri, 30 Oct 2020 18:37:22 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: Add OV5648 bindings
 documentation
Message-ID: <20201030163722.GS26150@paasikivi.fi.intel.com>
References: <20201023174944.504358-1-paul.kocialkowski@bootlin.com>
 <20201023174944.504358-2-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201023174944.504358-2-paul.kocialkowski@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

On Fri, Oct 23, 2020 at 07:49:43PM +0200, Paul Kocialkowski wrote:
> This introduces YAML bindings documentation for the OV5648
> image sensor.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../bindings/media/i2c/ovti,ov5648.yaml       | 115 ++++++++++++++++++
>  1 file changed, 115 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
> new file mode 100644
> index 000000000000..347af925b450
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov5648.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OmniVision OV5648 Image Sensor Device Tree Bindings
> +
> +maintainers:
> +  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> +
> +properties:
> +  compatible:
> +    const: ovti,ov5648
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: XVCLK Clock
> +
> +  clock-names:
> +    items:
> +      - const: xvclk
> +
> +  dvdd-supply:
> +    description: Digital Domain Power Supply
> +
> +  avdd-supply:
> +    description: Analog Domain Power Supply (internal AVDD is used if missing)
> +
> +  dovdd-supply:
> +    description: I/O Domain Power Supply
> +
> +  powerdown-gpios:
> +    maxItems: 1
> +    description: Power Down Pin GPIO Control (active low)
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: Reset Pin GPIO Control (active low)
> +
> +  port:
> +    type: object
> +    description: Input port, connect to a MIPI CSI-2 receiver

"Input"? I'd describe this as output.

How about e.g. "MIPI CSI-2 transmitter port"?

> +
> +    properties:
> +      endpoint:
> +        type: object
> +
> +        properties:
> +          remote-endpoint: true
> +
> +          bus-type:
> +            const: 4
> +
> +          clock-lanes:
> +            maxItems: 1

You can drop the two as they're always the same.

> +
> +          data-lanes:
> +            minItems: 1
> +            maxItems: 2
> +
> +        required:
> +          - bus-type
> +          - data-lanes
> +          - remote-endpoint
> +
> +        additionalProperties: false
> +
> +    required:
> +      - endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - dvdd-supply
> +  - dovdd-supply
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/sun8i-v3s-ccu.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ov5648: camera@36 {
> +            compatible = "ovti,ov5648";
> +            reg = <0x36>;
> +
> +            dvdd-supply = <&ov5648_dvdd>;
> +            avdd-supply = <&ov5648_avdd>;
> +            dovdd-supply = <&ov5648_dovdd>;
> +            clocks = <&ov5648_xvclk 0>;
> +            clock-names = "xvclk";
> +
> +            ov5648_out: port {
> +                ov5648_out_mipi_csi2: endpoint {
> +                    bus-type = <4>; /* MIPI CSI-2 D-PHY */
> +                    clock-lanes = <0>;
> +                    data-lanes = <1 2>;
> +
> +                    remote-endpoint = <&mipi_csi2_in_ov5648>;
> +                };
> +            };
> +        };
> +    };

-- 
Sakari Ailus
