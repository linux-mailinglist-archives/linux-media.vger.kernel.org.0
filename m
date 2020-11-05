Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5092A79A0
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 09:49:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727731AbgKEItN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 03:49:13 -0500
Received: from mga04.intel.com ([192.55.52.120]:43169 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725827AbgKEItM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Nov 2020 03:49:12 -0500
IronPort-SDR: Xa6pS323LmCgAdAN1Hgb++UA1jc+OAHjpVrztGfQDe75iE6MCvNHaTsq7QpwaAh2zfsTB96qXL
 v5nihRkUXQww==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="166759811"
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="166759811"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 00:49:02 -0800
IronPort-SDR: zeDz80cwtr5wzyggCKqBu7UeVVw/aWKtbcnIb0FCNl5tR3p10c5Kkq2Q0/T0mSONCICPYxYFiX
 Syy2fs2GyH9Q==
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="539303094"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 00:48:57 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 864AA20901; Thu,  5 Nov 2020 10:48:55 +0200 (EET)
Date:   Thu, 5 Nov 2020 10:48:55 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-sunxi@googlegroups.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Yong Deng <yong.deng@magewell.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kevin.lhopital@hotmail.com
Subject: Re: [PATCH 11/14] dt-bindings: media: i2c: Add A83T MIPI CSI-2
 bindings documentation
Message-ID: <20201105084855.GA26150@paasikivi.fi.intel.com>
References: <20201023174546.504028-1-paul.kocialkowski@bootlin.com>
 <20201023174546.504028-12-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201023174546.504028-12-paul.kocialkowski@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

On Fri, Oct 23, 2020 at 07:45:43PM +0200, Paul Kocialkowski wrote:
> This introduces YAML bindings documentation for the A83T MIPI CSI-2
> controller.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../media/allwinner,sun8i-a83t-mipi-csi2.yaml | 158 ++++++++++++++++++
>  1 file changed, 158 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun8i-a83t-mipi-csi2.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun8i-a83t-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/allwinner,sun8i-a83t-mipi-csi2.yaml
> new file mode 100644
> index 000000000000..2384ae4e7be0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun8i-a83t-mipi-csi2.yaml
> @@ -0,0 +1,158 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/allwinner,sun8i-a83t-mipi-csi2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner A83T MIPI CSI-2 Device Tree Bindings
> +
> +maintainers:
> +  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> +
> +properties:
> +  compatible:
> +    const: allwinner,sun8i-a83t-mipi-csi2
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Bus Clock
> +      - description: Module Clock
> +      - description: MIPI-specific Clock
> +      - description: Misc CSI Clock
> +
> +  clock-names:
> +    items:
> +      - const: bus
> +      - const: mod
> +      - const: mipi
> +      - const: misc
> +
> +  resets:
> +    maxItems: 1
> +
> +  # See ./video-interfaces.txt for details
> +  ports:
> +    type: object
> +
> +    properties:
> +      port@0:
> +        type: object
> +        description: Input port, connect to a MIPI CSI-2 sensor
> +
> +        properties:
> +          reg:
> +            const: 0
> +
> +          endpoint:
> +            type: object
> +
> +            properties:
> +              remote-endpoint: true
> +
> +              bus-type:
> +                const: 4

Again, if this is D-PHY only, you can remove this.

> +
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4

Does the device support lane reordering? If not, you can remove
clock-lanes.

> +
> +            required:
> +              - bus-type
> +              - data-lanes
> +              - remote-endpoint
> +
> +            additionalProperties: false
> +
> +        required:
> +          - endpoint
> +
> +        additionalProperties: false
> +
> +      port@1:
> +        type: object
> +        description: Output port, connect to a CSI controller
> +
> +        properties:
> +          reg:
> +            const: 1
> +
> +          endpoint:
> +            type: object
> +
> +            properties:
> +              remote-endpoint: true
> +
> +              bus-type:
> +                const: 4

Is it a MIPI CSI-2 D-PHY -> MIPI CSI-2 D-PHY device? I call that "cable".
:-)

> +
> +            additionalProperties: false
> +
> +        required:
> +          - endpoint
> +
> +        additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/sun8i-a83t-ccu.h>
> +    #include <dt-bindings/reset/sun8i-a83t-ccu.h>
> +
> +    mipi_csi2: mipi-csi2@1cb1000 {
> +        compatible = "allwinner,sun8i-a83t-mipi-csi2";
> +        reg = <0x01cb1000 0x1000>;
> +        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&ccu CLK_BUS_CSI>,
> +                 <&ccu CLK_CSI_SCLK>,
> +                 <&ccu CLK_MIPI_CSI>,
> +                 <&ccu CLK_CSI_MISC>;
> +        clock-names = "bus", "mod", "mipi", "misc";
> +        resets = <&ccu RST_BUS_CSI>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            mipi_csi2_in: port@0 {
> +                reg = <0>;
> +
> +                mipi_csi2_in_ov8865: endpoint {
> +                    bus-type = <4>; /* MIPI CSI-2 D-PHY */
> +                    clock-lanes = <0>;
> +                    data-lanes = <1 2 3 4>;
> +
> +                    remote-endpoint = <&ov8865_out_mipi_csi2>;
> +                };
> +            };
> +
> +            mipi_csi2_out: port@1 {
> +                reg = <1>;
> +
> +                mipi_csi2_out_csi: endpoint {
> +                    bus-type = <4>; /* MIPI CSI-2 D-PHY */
> +                    remote-endpoint = <&csi_in_mipi_csi2>;
> +                };
> +            };
> +        };
> +    };
> +
> +...

-- 
Regards,

Sakari Ailus
