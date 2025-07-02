Return-Path: <linux-media+bounces-36513-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F71AF0C30
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 09:04:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 956C74E0EA0
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 07:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 962DE22541F;
	Wed,  2 Jul 2025 07:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e6Uvt45f"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCE31BEF74;
	Wed,  2 Jul 2025 07:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751439868; cv=none; b=YoubL/SkrToa5z6dsOZPpUA6U0mXyRBGErZj9MVYG1EOi9Hqmephomltx5WkDLiBUcWUj2ABRjf/1vBW5uqMpwlPz18mWpB9zCyAiXSiIpnNmCxOb2X44MUVNcSLKbsK+hqSRvlE5KEsSU2C3e+5wRthVpZsC4qWTT9+CmXZNrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751439868; c=relaxed/simple;
	bh=Lz9zi/Yfl3Wdd/VDQ4o8Nf2IC7U8HcEQkmzBUjntbms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mF6nUfUV7Zg3TLsxjfIfpm0PIFICCOYcyywit3133AsPL4Ky8SfWm5TK3rP5stoBEAoiEySCYvQSCr7OWNXgVEshY830LhIf3ewpAduSLfZXVmm+SDUuPQG0bIMe6KVZe6EnB4e3NcW4Hm86RFfMnjjqZDBoNv48f+L0r0Ec1uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e6Uvt45f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE803C4CEEE;
	Wed,  2 Jul 2025 07:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751439867;
	bh=Lz9zi/Yfl3Wdd/VDQ4o8Nf2IC7U8HcEQkmzBUjntbms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e6Uvt45fUTbSfhjbkPMHQLssFEzKWpWN+mzGUMTYYN5Gi1XvxZE9ejkKM6NV5gGEv
	 /L6Wrfr6naMHQvyKKPmAqxlPFsOcHbSfk6iJ+X7Ki3xEAB5yby/4zGiYF0og8W/rpG
	 8Dg3nmt6iie/v8/S4xWrsbQArsL+QtKWUF8NAENGgIv+JctKDymLeroaRH6xVDOrsR
	 6SmkjBxMafQxsXCOHsUDMUhHJbBmCvBcHyJ4iy5gmAZOwCsA0IObt7OjogavBvqww5
	 gZ00xV9/kSLzhvfhJdJNAU2gzqTA6dlLnnOOaXrKftWgEmEF08QU5HJ23g679omwyu
	 VlgUiZTSL85aQ==
Date: Wed, 2 Jul 2025 09:04:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: philippe baetens <philippebaetens@gmail.com>
Cc: mchehab@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	krzk+dt@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] Add bindings for ams Mira220 cmos image sensor
Message-ID: <20250702-cuddly-statuesque-jackrabbit-c8eb6f@krzk-bin>
References: <aGP67H5_GxL4z2Nc@raspberrypi>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aGP67H5_GxL4z2Nc@raspberrypi>

On Tue, Jul 01, 2025 at 05:12:44PM +0200, philippe baetens wrote:
> Mira220 is a global shutter NIR-enhanced image sensor made by AMS.
> Driver is submitted in the next patch of this series and verified on a raspberry pi.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> 
> Signed-off-by: philippe baetens <philippebaetens@gmail.com>

Fix your Git, so your identity uses same style. It is "Philippe
Baetens", no?


> ---
> Changes in v3:
> 	 - Improve commit message
> 	 - add mailing list for device tree.
> 
> Changes in v2:
> 	 - add maintainers and Documentation.yaml
> 

> ---
>  .../bindings/media/i2c/ams,mira220.yaml       | 125 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 131 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml b/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml
> new file mode 100644
> index 000000000..21a55ff07
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml
> @@ -0,0 +1,125 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ams,mira220.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ams 2.2 MP NIR enhanced global shutter image sensor
> +
> +maintainers:
> +  - Philippe Baetens <philippebaetens@gmail.com>
> +
> +description: |-
> +  2.2 MP NIR enhanced global shutter image sensor designed for 2D and 3D
> +  consumer and industrial machine vision applications.
> +  Due to its small size, configurability and high sensitivity both
> +  in visual as well as NIR, the Mira220 is well suited for 2D and
> +  3D applications, which include Active Stereo Vision,
> +  Structured Light Vision for Robotics and AR/VR.
> +
> +properties:
> +  compatible:
> +    const: ams,mira220
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    description: Input clock (38.4 MHz)
> +    items:
> +      - const: inck

Drop clock-names, redundant.

> +
> +  vdig-supply:
> +    description:
> +      Digital I/O voltage supply, 1.35 volts
> +
> +  vana1-supply:
> +    description:
> +      Analog1 voltage supply, 2.8 volts
> +
> +  vana2-supply:
> +    description:
> +      Analog2 voltage supply, 1.8 volts
> +
> +  vddl-supply:
> +    description:
> +      Digital core voltage supply, 1.8 volts
> +
> +  reset-gpios:
> +    description: Sensor reset (XCLR) GPIO
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    description: |

Drop |

> +      Video output port
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            anyOf:
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +                  - const: 4
> +
> +          link-frequencies: true

Drop, not needed.

> +
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +
> +    additionalProperties: false

This goes after $ref

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - vdig-supply
> +  - vana-supply
> +  - vddl-supply
> +  - port
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
> +        mira220: camera-sensor@1a {
> +            compatible = "ams,mira220";
> +            reg = <0x54>;

Does not match unit address.

> +
> +            clocks = <&cam1_clk>;

Best regards,
Krzysztof


