Return-Path: <linux-media+bounces-28642-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F31FBA6E0AC
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 18:16:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6192A16FA78
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 17:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1887F2641F6;
	Mon, 24 Mar 2025 17:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lHu7M+Xz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E04D26280C;
	Mon, 24 Mar 2025 17:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742836510; cv=none; b=BPSGltP03Jo5Wn6C1BknAXRLPpxf0EoIh3RINaiZYGhVEClg9INtnAevLTEXZApCnEdQqUO5d6E5OPJyVGF4b4H/6UcwjYv8fKZ/YvNQtsJaJNwoYxqceCJPbYFBEYknQJYOsHQdE+kfxtvLgDZ2BNestj7nk4QoNyVEnDc8NRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742836510; c=relaxed/simple;
	bh=zQxP07MhxVvj6zM9OfYRvoiZKKMGISEc3dM4iezMPa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KOG0D6yAUYMDYIbUnGzIWLY11Wsj938FzK6iQDrDUl/HndAuj5zmeyckZnVh1yQU5RkrliyGqNK4wj0Q+xqyfI04zJyfjx1HCN+puPbcM8GNpJl9qxY9M8W3750PaBlRhunFty2rONtHc93ZJWB8nUrGxHYSb07pxFa+LMdHoNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lHu7M+Xz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C9F2C4CEEA;
	Mon, 24 Mar 2025 17:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742836509;
	bh=zQxP07MhxVvj6zM9OfYRvoiZKKMGISEc3dM4iezMPa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lHu7M+XzgPBAgS1CVIU28tpITVzELZe3b75+j6IN7V95QuFBjRIJV8aZCC831tb30
	 og1lj+UMNqDw2XurTDMeoFWzaPQRttb209fbwccXapgXVcLBvXSMjvthcnvzTdbhl5
	 tJXYkoSCQuo61hcDtMGXgeJVUGO0nxPsZbWc0uYRCXknxI45KMSuFkzC6kPoXnTlnN
	 hQui2LHCuCvz9PxpGhBgmUnoVvh7Y791d9T7FenHXVBl/PLJ7zCqQ/6Jqm0Hi/GiW4
	 KDI17Yc6kU8plgLfZhshKV42ca1yyeU+yPJLRWzDWcub+rWayLv+Bomb8COix+MNu3
	 sVfPMAjAFrp8g==
Date: Mon, 24 Mar 2025 12:15:08 -0500
From: Rob Herring <robh@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: hdegoede@redhat.com, mchehab@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, sakari.ailus@linux.intel.com,
	hverkuil@xs4all.nl, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] media: dt-bindings: Add OmniVision OV02C10
Message-ID: <20250324171508.GA668235-robh@kernel.org>
References: <20250319145927.70534-1-hdegoede@redhat.com>
 <20250324000912.105662-1-bryan.odonoghue@linaro.org>
 <20250324000912.105662-2-bryan.odonoghue@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324000912.105662-2-bryan.odonoghue@linaro.org>

On Mon, Mar 24, 2025 at 12:09:12AM +0000, Bryan O'Donoghue wrote:
> Add bindings for OVO2C10 a two megapixel 1080p RGB sensor.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/media/i2c/ovti,ov02c10.yaml      | 117 ++++++++++++++++++
>  1 file changed, 117 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02c10.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02c10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02c10.yaml
> new file mode 100644
> index 000000000000..6380a17fe65f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02c10.yaml
> @@ -0,0 +1,117 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (c) 2025 Linaro Ltd.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov02c10.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Omnivision OV02C10 CMOS Sensor
> +
> +maintainers:
> +  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> +
> +description: |
> +  The Omnivision OV02C10 is a 2 megapixel, CMOS image sensor which supports:
> +  - Automatic black level calibration (ABLC)
> +  - Programmable controls for frame rate, mirror and flip, binning, cropping
> +    and windowing
> +  - Output formats 10-bit 4C RGB RAW, 10-bit Bayer RAW
> +  - 2-lane MIPI D-PHY TX @ 800 Mbps per lane
> +  - 1-lane MIPI D-PHY TX @ 1.5 Gbps per lane
> +  - Dynamic defect pixel cancellation
> +  - Standard SCCB command interface
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    const: ovti,ov02c10
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  avdd-supply:
> +    description: Analogue circuit voltage supply.
> +
> +  dovdd-supply:
> +    description: I/O circuit voltage supply.
> +
> +  dvdd-supply:
> +    description: Digital circuit voltage supply.
> +
> +  reset-gpios:
> +    description: Active low GPIO connected to XSHUTDOWN pad of the sensor.
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        additionalProperties: false
> +
> +        properties:
> +          data-lanes:
> +            oneOf:
> +              - items:
> +                  - const: 1
> +              - items:
> +                  - const: 1
> +                  - const: 2

minItems: 1

And drop the first oneOf entry (and oneOf).

> +          link-frequencies: true
> +          remote-endpoint: true
> +
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +          - remote-endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
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
> +        ov02c10: camera@36 {
> +            compatible = "ovti,ov02c10";
> +            reg = <0x36>;
> +
> +            reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
> +            pinctrl-names = "default";
> +            pinctrl-0 = <&cam_rgb_defaultt>;
> +
> +            clocks = <&ov02c10_clk>;
> +
> +            assigned-clocks = <&ov02c10_clk>;
> +            assigned-clock-parents = <&ov02c10_clk_parent>;
> +            assigned-clock-rates = <19200000>;
> +
> +            avdd-supply = <&vreg_l7b_2p8>;
> +            dvdd-supply = <&vreg_l7b_1p8>;
> +            dovdd-supply = <&vreg_l3m_1p8>;
> +
> +            port {
> +                ov02c10_ep: endpoint {
> +                    remote-endpoint = <&csiphy4_ep>;
> +                    data-lanes = <1 2>;
> +                    link-frequencies = /bits/ 64 <400000000>;
> +                };
> +            };
> +        };
> +    };
> +...
> -- 
> 2.49.0
> 

