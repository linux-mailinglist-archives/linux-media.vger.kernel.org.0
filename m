Return-Path: <linux-media+bounces-45085-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E7CBF371B
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 22:28:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A677718C4497
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 20:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B8C2E6CBE;
	Mon, 20 Oct 2025 20:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GT0Np3+s"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C419F338933;
	Mon, 20 Oct 2025 20:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760991799; cv=none; b=SQNCWneccdAYLF+B0JPwWNRP0FGuRFnYEDe0r5bRktnNkEdmqmhPrcWYxs0A+/yl/W00KjwuM/WmF4mBaLtVmN020pz/O+E5CoH0RqpTt+D+owLPSbdzzQsVGLwKX4Qc9xMBzKbR3FOJdd4v2rygKhrnteplidPysdZl35yZgiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760991799; c=relaxed/simple;
	bh=Fk3blhMUdnslSk00RCdDdWYZRmiP9vzB+Pv8XKEG820=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BDumDlfW6weW2MPNthbQyOPvvsMI7pNYSi0omXZN27bo1IhHFpKeh60isdOFaQAUm11bFmL/qDJ1jXBZh+RKJ3hNZ/W8Ht/8xN6+MPRkSiX+Z3zc3XIH5/9ulKXb7n5ihKo0OcdaRuZ9AJYo7h9wYkSVwIwt/AbA7UwYLE6G6NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GT0Np3+s; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760991797; x=1792527797;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Fk3blhMUdnslSk00RCdDdWYZRmiP9vzB+Pv8XKEG820=;
  b=GT0Np3+sjrKaBgmojVg8evTqN4zf81pgF/UZxa9Iw/E9LteWs7D8vB6E
   DNODp4RS7UVR+3WGmuK1O0aA1kKsCdu9OuAAJbJUr1M/e8SmcxGO3kCEs
   Co8a1t4IiKesoHI8o8IV8cDX0m6mG2RBnBMk0yAz40CdkTaoVlf/RPZBn
   +eqbhFW9/+c7cNVPU3LzoNu1odV6D3fLgUFHtbE4GroaO1coFBiUGpPek
   roqDEgSaQ06rqDgobC25VcmsHij3922Mb/vHYjUNhe8jiwhTcct4BWG/7
   lQfmGuh5/H7FilJWKJvGmOPKMwrtDXeBRrLgv3euAqCbdgmdernCvsRTX
   w==;
X-CSE-ConnectionGUID: UPq6kbPGRf+dWxS0CUC3Ww==
X-CSE-MsgGUID: NWwd0E91SiOUGbCk3f1CJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62323749"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="62323749"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 13:23:14 -0700
X-CSE-ConnectionGUID: 6+NcgifSS9KuptaaHy14QQ==
X-CSE-MsgGUID: RuACaNA2TM+oAgGvYg3/qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="187826386"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.104])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 13:23:12 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 87A0D120BF8;
	Mon, 20 Oct 2025 23:23:09 +0300 (EEST)
Date: Mon, 20 Oct 2025 23:23:09 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: Add Samsung S5KJN1 image
 sensor
Message-ID: <aPaaLZoLMH3TfyJl@kekkonen.localdomain>
References: <20251016020419.2137290-1-vladimir.zapolskiy@linaro.org>
 <20251016020419.2137290-2-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016020419.2137290-2-vladimir.zapolskiy@linaro.org>

Hi Vladimir,

Thanks for the set.

On Thu, Oct 16, 2025 at 05:04:18AM +0300, Vladimir Zapolskiy wrote:
> Add device tree bindings documentation for Samsung S5KJN1 image sensor.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  .../bindings/media/i2c/samsung,s5kjn1.yaml    | 95 +++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml
> new file mode 100644
> index 000000000000..2220b3e528d4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/samsung,s5kjn1.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung S5KJN1 Image Sensor
> +
> +description:
> +  Samsung S5KJN1 (ISOCELL JN1) image sensor is a 50MP image sensor.
> +  The sensor is controlled over a serial camera control bus protocol,
> +  the widest supported output image frame size is 8160x6144 at 10 frames
> +  per second rate, data output format is RAW10 transferred over 4-lane
> +  MIPI D-PHY interface.

Can the sensor work with fewer lanes? This is almost always the case. In
this case you'd need data-lanes property but feel free to make 4 the
default if you like.

> +
> +maintainers:
> +  - Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    const: samsung,s5kjn1
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: MCLK supply clock.
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: Active low GPIO connected to RESET pad of the sensor.
> +    maxItems: 1
> +
> +  afvdd-supply:
> +    description: Autofocus voltage supply, 2.8-3.0 volts.

The driver doesn't seem to support this. I suppose the driver could be
amended with the usual controls (e.g. FOCUS_ABSOLUTE)?

> +
> +  avdd-supply:
> +    description: Analogue voltage supply, 2.8 volts.
> +
> +  dovdd-supply:
> +    description: Digital I/O voltage supply, 1.8 volts.
> +
> +  dvdd-supply:
> +    description: Digital core voltage supply, 1.05 volts.
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
> +        required:
> +          - link-frequencies
> +
> +required:
> +  - compatible
> +  - reg
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +      #include <dt-bindings/gpio/gpio.h>
> +
> +      i2c {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          camera@56 {
> +              compatible = "samsung,s5kjn1";
> +              reg = <0x56>;
> +              clocks = <&camera_mclk 0>;
> +              assigned-clocks = <&camera_mclk 0>;
> +              assigned-clock-rates = <24000000>;
> +              reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
> +              avdd-supply = <&vreg_2p8>;
> +              dovdd-supply = <&vreg_1p8>;
> +              dvdd-supply = <&vreg_1p05>;
> +
> +              port {
> +                  endpoint {
> +                      link-frequencies = /bits/ 64 <700000000>;
> +                      remote-endpoint = <&mipi_csi2_ep>;
> +                  };
> +              };
> +          };
> +      };
> +...

-- 
Kind regards,

Sakari Ailus

