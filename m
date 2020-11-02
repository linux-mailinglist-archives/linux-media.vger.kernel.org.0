Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 485642A371D
	for <lists+linux-media@lfdr.de>; Tue,  3 Nov 2020 00:24:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbgKBXYU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Nov 2020 18:24:20 -0500
Received: from mga05.intel.com ([192.55.52.43]:20424 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725864AbgKBXYS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Nov 2020 18:24:18 -0500
IronPort-SDR: aN4eiiiFU52bCelJxpydTNOnTJ6xr7lKsBOpOuvoVIb738rHBs12Mx5KeEwh5rHgAvQLJ3nDUb
 MH7F1TcgE+vA==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="253677440"
X-IronPort-AV: E=Sophos;i="5.77,446,1596524400"; 
   d="scan'208";a="253677440"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2020 15:24:17 -0800
IronPort-SDR: pgpIVZr8lyMlNwZIOfNcZs4zgSS46Cx9smlJDiBgb+C0lmscg+qilwYf+qKpMYURB2vpSd6Bg5
 NAb/H1KjX3Nw==
X-IronPort-AV: E=Sophos;i="5.77,446,1596524400"; 
   d="scan'208";a="336322207"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2020 15:24:14 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 9705120A2D; Tue,  3 Nov 2020 01:24:11 +0200 (EET)
Date:   Tue, 3 Nov 2020 01:24:11 +0200
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
        Maxime Ripard <mripard@kernel.org>, kevin.lhopital@hotmail.com,
        =?iso-8859-1?Q?K=E9vin_L'h=F4pital?= <kevin.lhopital@bootlin.com>
Subject: Re: [PATCH 1/3] dt-bindings: media: i2c: Add OV8865 bindings
 documentation
Message-ID: <20201102232411.GD26150@paasikivi.fi.intel.com>
References: <20201023175406.504527-1-paul.kocialkowski@bootlin.com>
 <20201023175406.504527-2-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201023175406.504527-2-paul.kocialkowski@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

On Fri, Oct 23, 2020 at 07:54:04PM +0200, Paul Kocialkowski wrote:
> This introduces YAML bindings documentation for the OV8865
> image sensor.
> 
> Co-developed-by: Kévin L'hôpital <kevin.lhopital@bootlin.com>
> Signed-off-by: Kévin L'hôpital <kevin.lhopital@bootlin.com>
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../bindings/media/i2c/ovti,ov8865.yaml       | 124 ++++++++++++++++++
>  1 file changed, 124 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
> new file mode 100644
> index 000000000000..807f1a94afae
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
> @@ -0,0 +1,124 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov8865.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OmniVision OV8865 Image Sensor Device Tree Bindings
> +
> +maintainers:
> +  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> +
> +properties:
> +  compatible:
> +    const: ovti,ov8865
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: EXTCLK Clock
> +
> +  clock-names:
> +    items:
> +      - const: extclk

Is this needed with a single clock?

And... shouldn't this also come with assigned-clock-rates etc., to set the
clock frequency?

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

I believe you can drop clock-lanes and bus-type; these are both constants.

I presume the device does not support lane remapping?

Could you also add link-frequencies, to list which frequencies are known to
be good?

Same comments on the other OV sensor bindings.

> +
> +          data-lanes:
> +            minItems: 1
> +            maxItems: 4
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
> +    #include <dt-bindings/clock/sun8i-a83t-ccu.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c2 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ov8865: camera@36 {
> +            compatible = "ovti,ov8865";
> +            reg = <0x36>;
> +
> +            pinctrl-names = "default";
> +            pinctrl-0 = <&csi_mclk_pin>;
> +
> +            clocks = <&ccu CLK_CSI_MCLK>;
> +            clock-names = "extclk";
> +
> +            avdd-supply = <&reg_ov8865_avdd>;
> +            dovdd-supply = <&reg_ov8865_dovdd>;
> +            dvdd-supply = <&reg_ov8865_dvdd>;
> +
> +            powerdown-gpios = <&pio 4 17 GPIO_ACTIVE_LOW>; /* PE17 */
> +            reset-gpios = <&pio 4 16 GPIO_ACTIVE_LOW>; /* PE16 */
> +
> +            port {
> +                ov8865_out_mipi_csi2: endpoint {
> +                    bus-type = <4>; /* MIPI CSI-2 D-PHY */
> +                    clock-lanes = <0>;
> +                    data-lanes = <1 2 3 4>;
> +
> +                    remote-endpoint = <&mipi_csi2_in_ov8865>;
> +                };
> +            };
> +        };
> +    };
> +
> +...

-- 
Regards,

Sakari Ailus
