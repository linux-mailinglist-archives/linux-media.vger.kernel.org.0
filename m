Return-Path: <linux-media+bounces-18652-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8659876FF
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 17:53:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CA001C218D1
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 15:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833C0158D6A;
	Thu, 26 Sep 2024 15:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S5AbWTfl"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCAB14D71D;
	Thu, 26 Sep 2024 15:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727366006; cv=none; b=lUOTCK0JKhdk1KEfQq8IhIAEQzdLgIZN1YGeIvQpAdxrjiQ4rtAL0Xk2T9KsJUllxvXXktHlcL4YUEein6Nc8goP4RbUsw3MZyUu5OASOA/eqyr+1EJ4ECpqecikuVQfu5NhPG9kde1vnfkm5yWfKD/rZNQwjt8pz1Y9l+5WNq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727366006; c=relaxed/simple;
	bh=HdUlhmJM33BN01qsO0SdP+QNOHFS0k9N4WEEYcDOsfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gx/vKqfiUVhB9ah1QS1WnJG7cU0O2ON+w8dUoAiNTyfrbr1W6N54hx5RTJpCfxzQeNlXXaMxjV3UVKvWAEUl28D2QawUdiPuYhaltJFvpIPyqNRsWUijhwlXPj4aESn7MryZ7M8eCv5HejeQ9BcOypnSIeJok0fLFxKFdzUcivE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S5AbWTfl; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727366005; x=1758902005;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HdUlhmJM33BN01qsO0SdP+QNOHFS0k9N4WEEYcDOsfc=;
  b=S5AbWTfleFHS4fS9xb+U5kJYrVYAC3bOTzN40Cnk6Pih+bFYzIcJoqjk
   NGfTTObM1V3KZshGjoUM+Zo2IuVxQMLUWSaQeOk54jJ/MU5FeO6+S6vXz
   oF9yFTvrdacXTf/i6Vk7dORMCiIDVcAJkwU2Qllip4i3TZ27weObXW8L3
   vE+mR0D8DqzD4MNBq3zY1DClZbUhQMDLcNDUMY0reIHYQjPNfxpb+PtjP
   DyeDqyY7dIUt80m1hA/2zx5zRF+Rp0m16EfjcPhoDJsahIzS4ihup2Ikt
   MrCZdR0BqeCnEhgM5/WsrNWubqK5w2JZQvsFtD5qKWD34xQXpJt3fwbbn
   A==;
X-CSE-ConnectionGUID: NQeTUwkDSKOHMDLxqm86bw==
X-CSE-MsgGUID: WWFLR++3T1amEfPuzTwXIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="30357813"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="30357813"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 08:53:25 -0700
X-CSE-ConnectionGUID: L4CB1lYXRECOnuy6xzgwsg==
X-CSE-MsgGUID: oJnWVjW4T0iLFckNXC60Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="76291050"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 08:53:22 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D47C411F843;
	Thu, 26 Sep 2024 18:53:19 +0300 (EEST)
Date: Thu, 26 Sep 2024 15:53:19 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Jason Chen <jason.z.chen@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] media: dt-bindings: Add OmniVision OV08X40
Message-ID: <ZvWDbxzm2cCgC8tP@kekkonen.localdomain>
References: <20240926-b4-master-24-11-25-ov08x40-v1-0-e4d5fbd3b58a@linaro.org>
 <20240926-b4-master-24-11-25-ov08x40-v1-2-e4d5fbd3b58a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926-b4-master-24-11-25-ov08x40-v1-2-e4d5fbd3b58a@linaro.org>

Hi Bryan,

Thanks for the set.

On Thu, Sep 26, 2024 at 04:46:38PM +0100, Bryan O'Donoghue wrote:
> Add bindings for the already upstream OV08X40 to enable usage of this
> sensor on dts based systems.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/media/i2c/ovti,ov08x40.yaml           | 130 +++++++++++++++++++++
>  1 file changed, 130 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov08x40.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov08x40.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..250785f062d0146e8615d8f3e7700aebbd40b1dc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov08x40.yaml
> @@ -0,0 +1,130 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (c) 2024 Linaro Ltd.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov08x40.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Omnivision OV08X40 CMOS Sensor
> +
> +maintainers:
> +  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> +
> +description: |-
> +  The Omnivision OV08X40 is a 9.2 megapixel, CMOS image sensor which supports.
> +  - Automatic black level calibration (ABLC)
> +  - Programmable controls for frame rate, mirror and flip, binning, cropping
> +    and windowing
> +  - Output formats 10-bit 4C RGB RAW, 10-bit Bayer RAW
> +  - 4-lane MIPI D-PHY TX @ 1 Gbps per lane
> +  - 2-lane MPIP D-PHY TX @ 2 Gbps per lane
> +  - Dynamic defect pixel cancellation
> +  - Standard SCCB command interface
> +
> +properties:
> +  compatible:
> +    const: ovti,ov08x40
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    description:
> +      Input clock for the sensor.
> +    items:
> +      - const: xvclk

This seems redundant.

> +
> +  clock-frequency:
> +    description:
> +      Frequency of the xvclk clock in Hertz.

Could you instead use the frequency already set, using assigned-clock* in
the example?

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
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            oneOf:
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
> +
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - clock-frequency
> +  - dovdd-supply
> +  - avdd-supply
> +  - dvdd-supply
> +  - reset-gpios
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
> +        ov08x40: camera@36 {
> +            compatible = "ovti,ov08x40";
> +            reg = <0x36>;
> +
> +            reset-gpios = <&tlmm 111 GPIO_ACTIVE_LOW>;
> +            pinctrl-names = "default";
> +            pinctrl-0 = <&cam_rgb_defaultt>;
> +
> +            clocks = <&ov08x40_clk>;
> +            clock-names = "xvclk";
> +            clock-frequency = <19200000>;
> +
> +            avdd-supply = <&vreg_l7b_2p8>;
> +            dvdd-supply = <&vreg_l7b_1p8>;
> +            dovdd-supply = <&vreg_l3m_1p8>;
> +
> +            port {
> +                ov08x40_ep: endpoint {
> +                    remote-endpoint = <&csiphy4_ep>;
> +                    data-lanes = <1 2 3 4>;
> +                    link-frequencies = /bits/ 64 <400000000>;
> +                };
> +            };
> +        };
> +    };
> +...
> 

-- 
Kind regards,

Sakari Ailus

