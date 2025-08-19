Return-Path: <linux-media+bounces-40318-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BCFB2CDBD
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 22:25:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66FEE4E0A60
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 20:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C4C326D48;
	Tue, 19 Aug 2025 20:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p9mXTJyV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC0286337;
	Tue, 19 Aug 2025 20:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755635144; cv=none; b=TsitFnJZAks8MSJNNBlHoQ8MGgz0DcikZ6rhhJ6UlWMX6568+vNvx1V8/383vddK8ozN0bbjwgccwd0BE+Q/EEKG16JApCbu3lTtsgM0MzvykFBpW4V4unXZMN6QLX2SrcnK8g0Qa9++UI1nUiGI7pPoGBdbaBmHkl22IwEC4so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755635144; c=relaxed/simple;
	bh=LVUaZqCxEUn+s6SnkVv9nwjEjzbR7xwmGoy2kx670yA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KYukk/sMWM+e3ZxI9tssVQXfgvmIAMXVSbqoJOUDcytEcXurOKwpfvXA53kkakjkWZaP6Bk2xIMUOQqox25oWv75YE8A4B9vXFOfJ+VABpmJLdL6+THWGrabQCqC5z6ebMv+sJkNUZKI96BkgzL2oB3TwPLCl7e4eN7wpShMMkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p9mXTJyV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41918C4CEF1;
	Tue, 19 Aug 2025 20:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755635143;
	bh=LVUaZqCxEUn+s6SnkVv9nwjEjzbR7xwmGoy2kx670yA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p9mXTJyVtAJW6EU2VyTFiBiQN6eyYhf23nYEiCWf35QpyZuCUlWB+EyeJHl3M1kb8
	 seC4nUGGiHl+4JyD96/K9Uf4yWMU1cIomeRG3sH48VdN3uL24KdhOFcuDyf/Cnqx1R
	 FPXutLIvX0ziKX22QMYXDLlMHHg6e9jZrtKonJpTcBDBkPfaOpIj3zBX6h+cNoK5l4
	 UGP0gJ6q9cJpP6+mhbXDT6WNyxW02cmhfSRGjBgdDpztw7mkM12gvFamCoDrR14qqZ
	 ET4HKev0mPOoe40QcunVUs0+D3Eus0JAiQosqFS+2IcTdtE7eO8IcP0D5BK7XxEJEs
	 o5WCLjUEBjx0A==
Date: Tue, 19 Aug 2025 15:25:42 -0500
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: media: i2c: document Sony IMX111
 CMOS sensor
Message-ID: <20250819202542.GA1254999-robh@kernel.org>
References: <20250819120428.83437-1-clamor95@gmail.com>
 <20250819120428.83437-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819120428.83437-2-clamor95@gmail.com>

On Tue, Aug 19, 2025 at 03:04:26PM +0300, Svyatoslav Ryhel wrote:
> Add bindings for Sony IMX111 CMOS Digital Image Sensor found in LG
> Optimus 4X (P880) and Optimus Vu (P895) smartphones.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../bindings/media/i2c/sony,imx111.yaml       | 126 ++++++++++++++++++
>  1 file changed, 126 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
> new file mode 100644
> index 000000000000..52d88f5d477e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
> @@ -0,0 +1,126 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/sony,imx111.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony IMX111 8MP CMOS Digital Image Sensor
> +
> +maintainers:
> +  - Svyatoslav Ryhel <clamor95@gmail.com>
> +
> +description:
> +  IMX111 sensor is a Sony CMOS active pixel digital image sensor with an active
> +  array size of 2464H x 3280V. It is programmable through I2C interface. Image
> +  data is sent through MIPI CSI-2, through 1 or 2 lanes.
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    const: sony,imx111
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: EXTCLK with possible frequency from 6 to 54 MHz
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  iovdd-supply:
> +    description: Digital IO power supply (1.8V)
> +
> +  dvdd-supply:
> +    description: Digital power supply (1.2V)
> +
> +  avdd-supply:
> +    description: Analog power supply (2.7V)
> +
> +  eeprom:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      A phandle to the node of the eeprom, that holds sensors configuration data.

This assumes the eeprom is dedicated to the sensor. What if it is just a 
subset of some eeprom or other storage. Perhaps this should use nvmem 
binding.

> +
> +  flash-leds: true
> +  lens-focus: true
> +
> +  orientation: true
> +  rotation: true

Use 'unevaluatedProperties' instead and drop these.

> +
> +  assigned-clocks: true
> +  assigned-clock-rates: true
> +  assigned-clock-parents: true

Always allowed on nodes with 'clocks', so drop.

> +
> +  port:
> +    additionalProperties: false
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes: true
> +          bus-type: true
> +          link-frequencies: true
> +
> +        required:
> +          - data-lanes
> +          - bus-type
> +          - link-frequencies
> +
> +    required:
> +      - endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interfaces.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        camera@10 {
> +            compatible = "sony,imx111";
> +            reg = <0x10>;
> +
> +            clocks = <&imx111_clk>;
> +
> +            iovdd-supply = <&camera_vddio_1v8>;
> +            dvdd-supply = <&camera_vddd_1v2>;
> +            avdd-supply = <&camera_vdda_2v7>;
> +
> +            orientation = <1>;
> +            rotation = <90>;
> +
> +            eeprom = <&eeprom>;
> +            flash-leds = <&led>;
> +            lens-focus = <&vcm>;
> +
> +            reset-gpios = <&gpio 84 GPIO_ACTIVE_LOW>;
> +
> +            port {
> +                imx111_output: endpoint {
> +                    data-lanes = <1 2>;
> +                    bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +                    link-frequencies = /bits/ 64 <271200000>;
> +                    remote-endpoint = <&csi_input>;
> +                };
> +            };
> +        };
> +    };
> +...
> -- 
> 2.48.1
> 

