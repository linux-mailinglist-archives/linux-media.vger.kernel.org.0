Return-Path: <linux-media+bounces-35709-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6D3AE5782
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 00:41:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B36077ACEDA
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 22:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E651227EA7;
	Mon, 23 Jun 2025 22:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="S3R3KxG0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1BE223DF0;
	Mon, 23 Jun 2025 22:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750718493; cv=none; b=c9eM3Me+sIeGqn4y2QVrE57R9i/lzdqhBfd+l31dc2/9HSQZM352BPXX8R5VKujbXn208k6Q0joIf42LBXp5ZJRsg/Z9N8o1BDNKZQCqmbSiW1ZPo+veN6V++H09kmoqKhOr4ybWohVWcFruGio8AzAVl9aMIr9B8Bc0liur3r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750718493; c=relaxed/simple;
	bh=8QM9xe4p3Jw9CvHmj8FE269+kxfNiJ5TSyIZOJ7WgvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tyukxlNSkjWzsklMGFHsjGYK7Y4m0dW9y7u584xjkRMWo6gWaAkgprzDrRGvwNV8Bom+mlMoAPlRIeq0fQWWAi+GZ8kmpEbJWIUtm//Wp6CzIlOpc3563kcYFcpXaJxfz16LIEjqe7mVU8i7r72xattO2YzIKIpR4F0Rg7A4j+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=S3R3KxG0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B100B741;
	Tue, 24 Jun 2025 00:41:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750718472;
	bh=8QM9xe4p3Jw9CvHmj8FE269+kxfNiJ5TSyIZOJ7WgvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S3R3KxG0CNk+VS4gi/5mUmt/vTjZ0Cp1iuT+AnGfMyHxFaLVdFxt3iCmsMtuN80Kn
	 PHJsqbCjFqZaBzEKjP/Dujigdu3fsIFRgmqodnzss7w2mfmtjIALkRFn7GHyXflbKP
	 pLUCM3gN+yQHiGrirlQdrZzo5YA6kk9648J/PMOs=
Date: Tue, 24 Jun 2025 01:41:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kumar M <anil.mamidala@xilinx.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, "Guoniu.zhou" <guoniu.zhou@nxp.com>,
	Stefan Hladnik <stefan.hladnik@gmail.com>,
	Florian Rebaudo <frebaudo@witekio.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: Add bindings for AP1302
 and AR0144
Message-ID: <20250623224109.GD15951@pendragon.ideasonboard.com>
References: <20250623-ap1302-v3-0-c9ca5b791494@nxp.com>
 <20250623-ap1302-v3-1-c9ca5b791494@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250623-ap1302-v3-1-c9ca5b791494@nxp.com>

Hi Frank,

Thank you for the patch.

On Mon, Jun 23, 2025 at 03:17:37PM -0400, Frank Li wrote:
> From: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
> 
> The AP1302 is a standalone ISP for ON Semiconductor sensors, which can
> connect RAW sensors (AR0144).
> 
> Add corresponding DT bindings.
> 
> Signed-off-by: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Stefan Hladnik <stefan.hladnik@gmail.com>
> Signed-off-by: Florian Rebaudo <frebaudo@witekio.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Previous try:
> https://lore.kernel.org/linux-media/1631091372-16191-2-git-send-email-anil.mamidala@xilinx.com/
> 
> Change in v3:
> - Move sensors under ports
> - use compatible string to indentify connected raw sensors
> - Add onnn,ar0144.yaml
> ---
>  .../devicetree/bindings/media/i2c/onnn,ap1302.yaml | 151 +++++++++++++++++++++
>  .../devicetree/bindings/media/i2c/onnn,ar0144.yaml |  75 ++++++++++
>  MAINTAINERS                                        |   9 ++
>  3 files changed, 235 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
> new file mode 100644
> index 0000000000000..6b745dcf3fd3f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
> @@ -0,0 +1,151 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/onnn,ap1302.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ON Semiconductor AP1302 Advanced Image Coprocessor
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +  - Anil Kumar M <anil.mamidala@xilinx.com>
> +
> +description:
> +  The AP1302 is a standalone ISP for ON Semiconductor sensors. It interfaces to
> +  up to two RAW CMOS sensors over MIPI CSI-2 connections, processes the two
> +  video streams and outputs YUV frames to the host over a MIPI CSI-2 interface.
> +  Frames are output side by side or on two virtual channels.
> +
> +  The sensors must be identical. They are connected to the AP1302 on dedicated
> +  I2C buses, and are controlled by the AP1302 firmware. They are not accessible
> +  from the host.
> +
> +properties:
> +  compatible:
> +    const: onnn,ap1302
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description:
> +          Reference to the CLK clock.
> +
> +  reset-gpios:
> +    items:
> +      - description:
> +          Reference to the GPIO connected to the RST pin (active low).
> +
> +  standby-gpios:
> +    items:
> +      - description:
> +          Reference to the GPIO connected to the STANDBY pin (active high).
> +
> +  enable-gpios:
> +    items:
> +      - description:
> +          Reference to the GPIO connected to the EN pin (active high).
> +
> +  dvdd-supply: true
> +
> +  hmisc-supply: true
> +
> +  smisc-supply: true
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    unevaluatedProperties: false
> +
> +    patternProperties:
> +      "^port@[01]":
> +        description:
> +          Sensors connected to the first and second input, if no sensor
> +          connect, isp generate test pattern. The compatible string under
> +          port@0 and port@1 have to be the same.
> +
> +        allOf:
> +          - $ref: /schemas/graph.yaml#/$defs/port-base
> +          - $ref: onnn,ar0144.yaml

You can't do that, that's plain wrong, sorry. There are issue raised in
the review of v2, please try to understand the problem and propose a
solution there. This is not what we need.

> +
> +        unevaluatedProperties: false
> +
> +    properties:
> +      port@2:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            properties:
> +              clock-noncontinuous:
> +                type: boolean
> +
> +              data-lanes:
> +                oneOf:
> +                  - items:
> +                      - const: 1
> +                  - items:
> +                      - const: 1
> +                      - const: 2
> +                  - items:
> +                      - const: 1
> +                      - const: 2
> +                      - const: 3
> +                      - const: 4
> +
> +            required:
> +              - data-lanes
> +
> +    required:
> +      - port@2
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        camera@3c {
> +            compatible = "onnn,ap1302";
> +            reg = <0x3c>;
> +
> +            clocks = <&clk24mhz>;
> +
> +            reset-gpios = <&pio 102 GPIO_ACTIVE_LOW>;
> +            standby-gpios = <&pio 40 GPIO_ACTIVE_HIGH>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    compatible = "onnn,ar0144";
> +                    reg = <0>;
> +                    vaa-supply = <&vaa_regulator>;
> +                };
> +
> +                port@2 {
> +                    reg = <2>;
> +
> +                    endpoint {
> +                        remote-endpoint = <&seninf_in1>;
> +                        clock-noncontinuous;
> +                        data-lanes = <1 2 3 4>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ar0144.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,ar0144.yaml
> new file mode 100644
> index 0000000000000..68562cf4c00ca
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/onnn,ar0144.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/onnn,ar0144.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ON Semiconductor AP0144 RAW CMOS sensor

AP0144 seems to be a typo.

> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +  - Anil Kumar M <anil.mamidala@xilinx.com>

Listing people as maintainers when they had nothing to do with
development of a file isn't very polite.

> +
> +description:
> +  AP0144 RAW CMOS can be use standalone with any SOCs, or work with AP1302
> +  ISP.

How a sensor is used is not relevant for its DT bindings.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - onnn,ar0144
> +      - onnn,ar0330
> +      - onnn,ar1335

There's also no explanation for this.

> +
> +  reg:
> +    maxItems: 1
> +
> +  vaa-supply: true
> +
> +  vdd-supply: true
> +
> +  vddio-supply: true
> +
> +  vddpll-supply: true
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          not:
> +            contains:
> +              const: onnn,ar0330
> +    then:
> +      properties:
> +        vddpll-supply: false
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        camera@10 {
> +            compatible = "onnn,ar0144";
> +            reg = <0x10>;
> +            vaa-supply = <&vaa>;
> +            vddio-supply = <&vddio>;
> +            vdd-supply = <&vdd>;

No input clock, reset signal, ports ?

> +        };
> +    };
> +
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d6f1670290589..1362d351f2574 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1766,6 +1766,15 @@ L:	linux-sound@vger.kernel.org
>  S:	Maintained
>  F:	sound/aoa/
>  
> +AP1302 ON SEMICONDUCTOR ISP DRIVER
> +M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +R:	Frank Li <Frank.Li@nxp.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media.git
> +F:	Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
> +F:	Documentation/devicetree/bindings/media/i2c/onnn,ar0144.yaml
> +
>  APEX EMBEDDED SYSTEMS STX104 IIO DRIVER
>  M:	William Breathitt Gray <wbg@kernel.org>
>  L:	linux-iio@vger.kernel.org

-- 
Regards,

Laurent Pinchart

