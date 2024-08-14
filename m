Return-Path: <linux-media+bounces-16299-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F9B951BD7
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 15:30:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E56B8B22DE3
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 13:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAA0B1B143F;
	Wed, 14 Aug 2024 13:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nAVCifR0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1492C1B14F2;
	Wed, 14 Aug 2024 13:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723642197; cv=none; b=faqtJ8+UdUpI20lhRDSuOmwHxiFAz9xjKINXiUB58ZbCDm2VgSzlKIabvaV6yg3m+zSb2WSCsJ81NijeoFWm3gmqbXoDyDWyjQ4/BsVJoCwOuf9BRDMGUabj9fm0nuV5g9opm0ONSiCu4Lc1oE7863Vyn+DeW33rz2dMF7IPPBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723642197; c=relaxed/simple;
	bh=mUpu+YWVecY1aPQOlg2VTx+dHx/jbbbKQqnOG1D+6Hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nvF/JLwTVtZ7X168RaS9qtnkttqN4XonHa/mgaDKyBelHdBQHQ2TVM+CMQ+iPX7fUFzfr1ulr830zpG1sfcrmTLEoIKTSpRKPOIQqWRY2RT7EqhYaydTI/Qw0EtZRVtBBJMhvF/eQqmPpbden/7BJkLD//ssZYIPggL46Sw2UwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nAVCifR0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4647CC4AF0D;
	Wed, 14 Aug 2024 13:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723642196;
	bh=mUpu+YWVecY1aPQOlg2VTx+dHx/jbbbKQqnOG1D+6Hg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nAVCifR0ODEUL5L7T3l3oN7jTE75oyAHAqB5kzH40KpBnSxkSf0/bsWk3iTBN8GC9
	 LTdgHsZb5ySD5xLiUfSmV5/by8ipkwJcXwK/a3xRnL/6Ua+GzfKnLDAvbKMWwjM2Dz
	 rYa6+XKZ7I342sBfWJRJSd064hLoI3+1hTM+M6Igqfv4elqclbBPlfRaIYI8Fk2u0w
	 hKKeBgM9/DWNuwCyNqGHjqdP4RFEhYIN665UKI2B1TZpA9r4d58NwhqhsLDEwk0Q7a
	 4SbwWWFQ3LX7KzoWgHcpUksDgFkxw5RbSaoBukqP7gURGJWPQv03DQQ8sZtpyDtqkU
	 0SY/l/GmgC7KA==
Date: Wed, 14 Aug 2024 07:29:54 -0600
From: Rob Herring <robh@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/6] media: dt-bindings: Add description of OmniVision
 OG01A1B image sensor
Message-ID: <20240814132954.GA2289726-robh@kernel.org>
References: <20240813102035.1763559-1-vladimir.zapolskiy@linaro.org>
 <20240813102035.1763559-2-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813102035.1763559-2-vladimir.zapolskiy@linaro.org>

On Tue, Aug 13, 2024 at 01:20:30PM +0300, Vladimir Zapolskiy wrote:
> Add device tree bindings documentation for OmniVision OG01A1B image
> sensor.

Drop 'description of ' in subject.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  .../bindings/media/i2c/ovti,og01a1b.yaml      | 107 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 108 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml
> new file mode 100644
> index 000000000000..ca57c01739d2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2023-2024 Linaro Ltd.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,og01a1b.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OmniVision OG01A1B Image Sensor
> +
> +maintainers:
> +  - Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> +
> +description:
> +  The OmniVision OG01A1B is black and white CMOS 1.3 Megapixel (1280x1024)
> +  image sensor controlled over an I2C-compatible SCCB bus.
> +  The sensor transmits images on a MIPI CSI-2 output interface with one or
> +  two data lanes.
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    const: ovti,og01a1b
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: Active low GPIO connected to XSHUTDOWN pad of the sensor.
> +    maxItems: 1
> +
> +  strobe-gpios:
> +    description: Input GPIO connected to strobe pad of the sensor.
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
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +    description:
> +      Output port node, single endpoint describing the CSI-2 transmitter.
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            minItems: 1
> +            maxItems: 2
> +            items:
> +              enum: [1, 2]
> +
> +          link-frequencies: true
> +
> +        required:
> +          - data-lanes
> +          - link-frequencies
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
> +        sensor@60 {
> +            compatible = "ovti,og01a1b";
> +            reg = <0x60>;
> +            clocks = <&clk 0>;
> +            reset-gpios = <&gpio 117 GPIO_ACTIVE_LOW>;
> +            avdd-supply = <&vreg_3v3>;
> +            dovdd-supply = <&vreg_1p8>;
> +            dvdd-supply = <&vreg_1p2>;
> +
> +            port {
> +                og01a1b_ep: endpoint {
> +                    remote-endpoint = <&csiphy_ep>;
> +                    data-lanes = <1 2>;
> +                    link-frequencies = /bits/ 64 <500000000>;
> +                };
> +            };
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cf9c9221c388..9b0d1db35b7d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16507,6 +16507,7 @@ OMNIVISION OG01A1B SENSOR DRIVER
>  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml
>  F:	drivers/media/i2c/og01a1b.c
>  
>  OMNIVISION OV01A10 SENSOR DRIVER
> -- 
> 2.45.2
> 

