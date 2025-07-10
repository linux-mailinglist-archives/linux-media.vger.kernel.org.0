Return-Path: <linux-media+bounces-37417-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FA9B00B75
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 20:34:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B554716CEDE
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 18:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB0CE2FCE3F;
	Thu, 10 Jul 2025 18:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QLL5WEkl"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB681D7E54;
	Thu, 10 Jul 2025 18:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752172440; cv=none; b=C6sdgodYq6kXJvL8VfSpCYk0wZMRFQphQxqGUKyVRmtJAQGRJU3kbjrd7f17hJIjo+txChmSxomNBRIsMgnpSeAsZUno39V2j2PyHitMCp1ZuxG/Tkuj1O+KuloipqStTZySPnlH4d6kUTVg5FqjYfzrSnPbjyZcSEAi+Co0b08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752172440; c=relaxed/simple;
	bh=Vs70MeZf1mYaXGnKJLdsSgmTm2iQdUulBxeRcsD98/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L73wqrudZT/2qVaaho3Bl3jFXnBM8Eh28U2ctjVvSQGqOMH1VTQjGUURctvgRBl3Rebk4Tiv+g4C2DJ0pRLKEcv0DBjija2mN0QOu64hC77A8uqOJHeGMzJWkQ73qg8NKjKG0K742V33JD/e/T0ydbaAKw00Qt0Y7XRSXbjjqJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QLL5WEkl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54AD0C4CEE3;
	Thu, 10 Jul 2025 18:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752172439;
	bh=Vs70MeZf1mYaXGnKJLdsSgmTm2iQdUulBxeRcsD98/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QLL5WEkl9iGpzg+UXniN8zcwc/kvgVq9XmsTyTWBzXNIbNgRyUqB2nCT09Vfsdalm
	 0bUTot71/LUmO2cqqlCNekoDAwcA1TWAWxbPRH6RHYMvCghZYaeM14yKPcHvfziQLS
	 +NNapYYO5PteG6Yz9FDFrohN9k649YHr6TnGgtIu8SfCAlz6t0AtNHqxFdJZp7zPsE
	 gfKV0fRP3Fe3CgjPy7rr75VtQIkFzblwRqwMLSROlQGjL6Ca2zLISrGEDAJCY/bnk4
	 VFJZXryAEkyIYsU5F9APD7VQYZf049o+okma2hn0ZL9DYc0KHfKoYqhFY/Et9QBgo1
	 DoqhsSN6ReSww==
Date: Thu, 10 Jul 2025 13:33:56 -0500
From: Rob Herring <robh@kernel.org>
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: sakari.ailus@linux.intel.com, krzk+dt@kernel.org,
	kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
	pratap.nirujogi@amd.com, laurent.pinchart@ideasonboard.com,
	tarang.raval@siliconsignals.io,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Arnd Bergmann <arnd@arndb.de>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: Add ov2735 sensor
Message-ID: <20250710183356.GA3026892-robh@kernel.org>
References: <20250710131107.69017-1-hardevsinh.palaniya@siliconsignals.io>
 <20250710131107.69017-2-hardevsinh.palaniya@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710131107.69017-2-hardevsinh.palaniya@siliconsignals.io>

On Thu, Jul 10, 2025 at 06:40:58PM +0530, Hardevsinh Palaniya wrote:
> From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> 
> Add bindings for Omnivision OV2735 sensor.
> 
> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
> ---
>  .../bindings/media/i2c/ovti,ov2735.yaml       | 115 ++++++++++++++++++
>  1 file changed, 115 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml
> new file mode 100644
> index 000000000000..d9d01db88844
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov2735.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OmniVision OV2735 Image Sensor
> +
> +maintainers:
> +  - Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> +
> +description: |

Don't need '|' if no formatting to preserve.

> +  The OmniVision OV2735 is a 2MP (1920x1080) color CMOS image sensor controlled
> +  through an I2C-compatible SCCB bus. it outputs RAW10 format and uses a 1/2.7"
> +  optical format.
> +
> +properties:
> +  compatible:
> +    const: ovti,ov2735
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: XVCLK clock
> +
> +  clock-names:
> +    items:
> +      - const: xvclk
> +
> +  avdd-supply:
> +    description: Analog Domain Power Supply
> +
> +  dovdd-supply:
> +    description: I/O Domain Power Supply
> +
> +  dvdd-supply:
> +    description: Digital Domain Power Supply
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: Reset Pin GPIO Control (active low)
> +
> +  enable-gpios:
> +    maxItems: 1
> +    description: |

Same here.

> +      Active-low enable pin. Labeled as 'PWDN' in the datasheet, but acts as
> +      an enable signal. During power rail ramp-up, the device remains powered
> +      down. Once power rails are stable, pulling this pin low powers on the
> +      device.
> +
> +  port:
> +    description: MIPI CSI-2 transmitter port
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
> +              - const: 2
> +
> +        required:
> +          - data-lanes
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - avdd-supply
> +  - dovdd-supply
> +  - dvdd-supply
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rk3399-cru.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        camera-sensor@3c {
> +            compatible = "ovti,ov2735";
> +            reg = <0x3c>;
> +            clocks = <&ov2735_clk>;
> +
> +            assigned-clocks = <&ov2735_clk>;
> +            assigned-clock-parents = <&ov2735_clk_parent>;
> +            assigned-clock-rates = <24000000>;
> +
> +            avdd-supply = <&ov2735_avdd>;
> +            dovdd-supply = <&ov2735_dovdd>;
> +            dvdd-supply = <&ov2735_dvdd>;
> +
> +            reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
> +            enable-gpios = <&gpio2 11 GPIO_ACTIVE_LOW>;
> +
> +            port {
> +                cam_out: endpoint {
> +                    remote-endpoint = <&mipi_in_cam>;
> +                    data-lanes = <1 2>;
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.34.1
> 

