Return-Path: <linux-media+bounces-30713-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A132AA96C2C
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 15:12:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 424127A7164
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 13:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AC5B281377;
	Tue, 22 Apr 2025 13:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n15q944H"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473D618CBE1;
	Tue, 22 Apr 2025 13:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745327518; cv=none; b=pXHB7nQGbjdt4hiWueJwKv03oRtQjHtb0RQVMyEcz9NC3bVm00u7Gg+gWP523n7vqqoamM90pwDU8QYfDE7BLfStvsJBPlQF6CqBakQJwUGODrv0Wwct7wraYb6nFPpaG2s7MAv3RWg8yApCqhnePFHRKSOHKeMH/3YYhT8RaU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745327518; c=relaxed/simple;
	bh=rRjktDJ0MUBAM/q9snEfNjjc72sE7/oAhMScX+HK/Jc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k3USzz0GVM+qk3yqEF018f/GtnS9GHtl0pCw1Lq+d5vauhODF9cKR/c9ryXcqpRcs5dFXXKqULyueOFlP8k63fEYFbEXgXoRGDbvtLNeZWpLwG1E7GlAgme2qCNwgfx1P7v/F4WpYNJQt3qU05ncYEa9Sk8bN7sDH+bzNTwSQoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=n15q944H; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 27961666;
	Tue, 22 Apr 2025 15:09:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745327386;
	bh=rRjktDJ0MUBAM/q9snEfNjjc72sE7/oAhMScX+HK/Jc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n15q944HIcA5QyAjmzJSVdftRaVtGEC7F6+mf7fB3FkKL4hDZDbnAe6j7io+0+q91
	 tNaNqLfle9GtruOaJZlnjvCAs6pjNrCHib92f0H6NUF4MpZZE9ggRgsAiIcA2O+SQC
	 KScLGn7kuOzSrSXDf60UpqtGz7v1+3BJYkd9SnDA=
Date: Tue, 22 Apr 2025 16:11:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 1/2] media: dt-bindings: Add ST VD55G1 camera sensor
Message-ID: <20250422131151.GA16823@pendragon.ideasonboard.com>
References: <20250404-b4-vd55g1-v5-0-98f2f02eec59@foss.st.com>
 <20250404-b4-vd55g1-v5-1-98f2f02eec59@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250404-b4-vd55g1-v5-1-98f2f02eec59@foss.st.com>

Hi Benjamin,

Thank you for the patch.

On Fri, Apr 04, 2025 at 04:50:51PM +0200, Benjamin Mugnier wrote:
> Also update MAINTAINERS file accordingly.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> ---
>  .../devicetree/bindings/media/i2c/st,vd55g1.yaml   | 132 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 ++
>  2 files changed, 139 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml b/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..6b777f86790da4e5941ac1cad86dc1a5021f9f5b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
> @@ -0,0 +1,132 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (c) 2025 STMicroelectronics SA.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/st,vd55g1.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics VD55G1 Global Shutter Image Sensor
> +
> +maintainers:
> +  - Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> +  - Sylvain Petinot <sylvain.petinot@foss.st.com>
> +
> +description: |-
> + The STMicroelectronics VD55G1 is a global shutter image sensor with an active
> + array size of 804H x 704V. It is programmable through I2C interface. The I2C
> + address is fixed to 0x10.

If you intend for this block of text to be split in two paragraphs, it's
missing a blank line here. Otherwise, it should be reflowed as a single
paragraph.

> + Image data is sent through MIPI CSI-2, which is configured as only 1 data
> + lane. The sensor provides 4 GPIOS that can be used for external LED signal
> + (synchronized with sensor integration periods).
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    const: st,vd55g1
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  vcore-supply:
> +    description: Digital core power supply (1.15V)
> +
> +  vddio-supply:
> +    description: Digital IO power supply (1.8V)
> +
> +  vana-supply:
> +    description: Analog power supply (2.8V)
> +
> +  reset-gpios:
> +    description: Sensor reset active low GPIO (XSHUTDOWN)
> +    maxItems: 1
> +
> +  st,leds:
> +    description:
> +      List sensor's GPIOs used to control strobe light sources during exposure
> +      time. The numbers identify the sensor pin on which the illumination
> +      system is connected. GPIOs are active-high.

If multiple GPIOs are specified, do they all serve the exact same
purpose, or is there a need to differentiate them ?

> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 4
> +    items:
> +      minimum: 0
> +      maximum: 3
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
> +        properties:
> +          data-lanes:
> +            items:
> +              - const: 1
> +
> +          link-frequencies:
> +            maxItems: 1
> +            items:
> +              minimum: 125000000
> +              maximum: 600000000
> +
> +          lane-polarities:
> +            minItems: 1
> +            maxItems: 2

Does the sensor support non-continuous D-PHY clock ?

> +
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - vcore-supply
> +  - vddio-supply
> +  - vana-supply
> +  - reset-gpios
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        camera-sensor@10 {
> +            compatible = "st,vd55g1";
> +            reg = <0x10>;
> +
> +            clocks = <&camera_clk_12M>;
> +
> +            vcore-supply = <&camera_vcore_v1v15>;
> +            vddio-supply = <&camera_vddio_v1v8>;
> +            vana-supply = <&camera_vana_v2v8>;
> +
> +            reset-gpios = <&gpio 5 GPIO_ACTIVE_LOW>;
> +            st,leds = <2>;
> +
> +            orientation = <2>;
> +            rotation = <0>;
> +
> +            port {
> +                endpoint {
> +                    data-lanes = <1>;
> +                    link-frequencies = /bits/ 64 <600000000>;
> +                    remote-endpoint = <&csiphy0_ep>;
> +                };
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2286200b355bde3604607be916ef09aa88feed0e..4f5e9005063a157de69e81b10f8def9da9e6c04c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22410,6 +22410,13 @@ S:	Maintained
>  F:	Documentation/hwmon/stpddc60.rst
>  F:	drivers/hwmon/pmbus/stpddc60.c
>  
> +ST VD55G1 DRIVER
> +M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> +M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
> +
>  ST VGXY61 DRIVER
>  M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>  M:	Sylvain Petinot <sylvain.petinot@foss.st.com>

-- 
Regards,

Laurent Pinchart

