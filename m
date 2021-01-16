Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31A5E2F8FE7
	for <lists+linux-media@lfdr.de>; Sun, 17 Jan 2021 00:46:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727446AbhAPXpw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 Jan 2021 18:45:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726788AbhAPXpt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 Jan 2021 18:45:49 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16135C061573;
        Sat, 16 Jan 2021 15:45:09 -0800 (PST)
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id E8782634C89;
        Sun, 17 Jan 2021 01:44:04 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1l0vEi-0002pe-Pb; Sun, 17 Jan 2021 01:44:04 +0200
Date:   Sun, 17 Jan 2021 01:44:04 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     mchehab@kernel.org, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org
Subject: Re: [PATCH v4 2/2] media: dt-bindings: media: i2c: Add IMX300 CMOS
 sensor binding
Message-ID: <20210116234404.GX850@valkosipuli.retiisi.org.uk>
References: <20210113182934.444727-1-angelogioacchino.delregno@somainline.org>
 <20210113182934.444727-3-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113182934.444727-3-angelogioacchino.delregno@somainline.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi AngeloGioacchino,

On Wed, Jan 13, 2021 at 07:29:34PM +0100, AngeloGioacchino Del Regno wrote:
> Add YAML device tree binding for IMX300 CMOS image sensor, and
> the relevant MAINTAINERS entries.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  .../bindings/media/i2c/sony,imx300.yaml       | 112 ++++++++++++++++++
>  MAINTAINERS                                   |   7 ++
>  2 files changed, 119 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml
> new file mode 100644
> index 000000000000..4fa767feea80
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml
> @@ -0,0 +1,112 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/sony,imx300.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony 1/2.3-Inch 25Mpixel Stacked CMOS Digital Image Sensor
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> +
> +description: |-
> +  The Sony IMX300 is a 1/2.3-inch Stacked CMOS (Exmor-RS) digital image
> +  sensor with a pixel size of 1.08um and an active array size of
> +  5948H x 4140V. It is programmable through I2C interface at address 0x10.
> +  Image data is sent through MIPI CSI-2, which is configured as either 2 or
> +  4 data lanes.
> +
> +properties:
> +  compatible:
> +    const: sony,imx300
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1

Please add assigned clock related properties; see
Documentation/driver-api/media/camera-sensor.rst .

> +
> +  vdig-supply:
> +    description:
> +      Digital I/O voltage supply, 1.15-1.20 volts
> +
> +  vana-supply:
> +    description:
> +      Analog voltage supply, 2.2 volts
> +
> +  vddl-supply:
> +    description:
> +      Digital core voltage supply, 1.8 volts
> +
> +  reset-gpios:
> +    description: |-
> +      Reference to the GPIO connected to the xclr pin, if any.
> +      Must be released (set high) after all supplies are applied.
> +
> +  # See ../video-interfaces.txt for more details
> +  port:
> +    type: object
> +    properties:
> +      endpoint:
> +        type: object
> +
> +        properties:
> +          data-lanes:
> +            description: |-
> +              The driver only supports four-lane operation.

This can be removed as bindings describe hardware, not driver operation.

> +            items:
> +              - const: 0
> +              - const: 1
> +              - const: 2
> +              - const: 3

Two lanes here, too?

> +
> +          clock-noncontinuous: true
> +
> +          link-frequencies:
> +            $ref: /schemas/types.yaml#/definitions/uint64-array
> +            description:
> +              Allowed data bus frequencies. The driver currently needs
> +              to switch between 780000000 and 480000000 Hz in order to
> +              guarantee functionality of all modes.

You can omit this description, too.

> +
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - vana-supply
> +  - vdig-supply
> +  - vddl-supply

Are the regulators really required? I'm not quite sure about the
established practices; still the common case is that one or two of these
are hard-wired.

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
> +        imx300: sensor@10 {
> +            compatible = "sony,imx300";
> +            reg = <0x10>;
> +            clocks = <&imx300_xclk>;
> +            vana-supply = <&imx300_vana>;   /* 2.2v */
> +            vdig-supply = <&imx300_vdig>;   /* 1.2v */
> +            vddl-supply = <&imx300_vddl>;   /* 1.8v */
> +
> +            port {
> +                imx300_0: endpoint {
> +                    remote-endpoint = <&csi1_ep>;
> +                    data-lanes = <0 1 2 3>;
> +                    clock-noncontinuous;
> +                    link-frequencies = /bits/ 64 <780000000 480000000>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ad9abb42f852..5e0f08f48d48 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16633,6 +16633,13 @@ T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/devicetree/bindings/media/i2c/imx290.txt
>  F:	drivers/media/i2c/imx290.c
>  
> +SONY IMX300 SENSOR DRIVER
> +M:	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> +L:	linux-media@vger.kernel.org

Please also add the git tree.

Ideally also the MAINTAINERS change comes with the first patch adding the
files, which should be the DT bindings. I.e. just reverse the order of the
patches.

> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml
> +F:	drivers/media/i2c/imx300.c
> +
>  SONY IMX319 SENSOR DRIVER
>  M:	Bingbu Cao <bingbu.cao@intel.com>
>  L:	linux-media@vger.kernel.org

-- 
Kind regards,

Sakari Ailus
