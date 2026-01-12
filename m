Return-Path: <linux-media+bounces-50487-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 03809D151EF
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 20:46:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33762304A7FC
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 19:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368AC324B0C;
	Mon, 12 Jan 2026 19:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lzo1rJdW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B3E199EAD;
	Mon, 12 Jan 2026 19:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768247181; cv=none; b=tC8B+7HqEzYHHdJ6NB6oJp60llIz6Ww8POJcZLPU094fUfOy94z93J3lmvVhRonA65aEq0yktYGTa3veacvUEVmRreJZyKh1x28kZsqOvWubUZ1WoDq6bJw7dOWpM5gL4Sw90+eBfrmkjQ1rG0W1Ajv7ut6vFOFcPXa2o5bIpeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768247181; c=relaxed/simple;
	bh=VXJ6h3xFbwt2UIWSnC4R8hbSW7fTxGdJagGd17ozxnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NYLMHTFHjF1Sr18zo/b86RAnWHZjkXX6kTW9OotYys5VQSGlEjQEa8BIdVrchfuEV7kEIWh2jdo9swRfdG4HZ7aeiIkcnvYt5mxJmk0pGzmf6N8XIPComsvzMaIYn9zOUjxcYg5k1Rxw4L7GPh0DNy+5kGHahKAxQAlUxsh+VGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lzo1rJdW; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768247180; x=1799783180;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VXJ6h3xFbwt2UIWSnC4R8hbSW7fTxGdJagGd17ozxnM=;
  b=Lzo1rJdWrzWSn+8B3pT5UxeSImmZ5Az9Wt62FVlG/wz7Hc/KkY0E+CSm
   Uun2yR1Ib6Wp79c44Z09OglefpVM/kxItSzXPJwcDlkYuh+3wiBXWNy5a
   6tv1qXgiMC08wfScQRO6MZXYSys5FSqFQc+1vGqzwSzZt/DokZMiQf3Ij
   LIRdRGgtsVPxdCyW1JF8ERpiiBHR88J5u7xtOWwtA9Mg7P9kqoB6MjMG1
   iBKguOw+ICa8hUVqzdaKc3bKs/2sTu/di2XZwnvciszlGKPILykW3IeOo
   ZUft59JZaTxji7PLFLS5NiwKfZ3VCjFH2WFgsP4k9bVtILhsKYSEfIl80
   A==;
X-CSE-ConnectionGUID: mZ34YCZaSdaMeATnsZqILQ==
X-CSE-MsgGUID: 2cznFjS1QSyrfZ2mXJeFHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="79823763"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="79823763"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 11:46:19 -0800
X-CSE-ConnectionGUID: Oh/FLYvsRpiq7l8qsCeGYg==
X-CSE-MsgGUID: w/b5Z9c3Q8aw0OB7g6Hw3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="234884303"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.154])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 11:46:12 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1C7BC120742;
	Mon, 12 Jan 2026 21:46:10 +0200 (EET)
Date: Mon, 12 Jan 2026 21:46:10 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Matthias Fend <matthias.fend@emfend.at>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Svyatoslav Ryhel <clamor95@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hao Yao <hao.yao@intel.com>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH v7 1/2] media: dt-bindings: i2c: add Himax HM1246 image
 sensor
Message-ID: <aWVPgtRnxfL2zSSu@kekkonen.localdomain>
References: <20260112-hm1246-v7-0-fee8587f2808@emfend.at>
 <20260112-hm1246-v7-1-fee8587f2808@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112-hm1246-v7-1-fee8587f2808@emfend.at>

Hi Matthias,

On Mon, Jan 12, 2026 at 03:49:32PM +0100, Matthias Fend wrote:
> Add YAML device tree binding for Himax HM1246 image sensor.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
> ---
>  .../bindings/media/i2c/himax,hm1246.yaml           | 117 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 ++
>  2 files changed, 124 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml b/Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..deecc1105105a67e81d1ddb7f31324baa8188f88
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml
> @@ -0,0 +1,117 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright 2025 Matthias Fend <matthias.fend@emfend.at>
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/himax,hm1246.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Himax HM1246-AWD 1/3.7-Inch megapixel SoC image sensor
> +
> +maintainers:
> +  - Matthias Fend <matthias.fend@emfend.at>
> +
> +description:
> +  The Himax HM1246-AWD is a 1/3.7-Inch CMOS image sensor SoC with an active
> +  array size of 1296 x 976. It is programmable through an I2C interface and
> +  connected via parallel bus.
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    const: himax,hm1246
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: Input reference clock (6 - 27 MHz)
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: Active low XSHUTDOWN pin
> +    maxItems: 1
> +
> +  avdd-supply:
> +    description: Power for analog circuit (3.0 - 3.6 V)
> +
> +  iovdd-supply:
> +    description: Power for I/O circuit (1.7 - 3.6 V)
> +
> +  dvdd-supply:
> +    description: Power for digital circuit (1.5 / 1.8 V)
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +    description: Parallel video output port
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          hsync-active:
> +            default: 1
> +
> +          vsync-active:
> +            default: 1
> +
> +          pclk-sample:
> +            default: 0

I think you should have bus-width here as well -- either make it mandatory
or add a default.

> +
> +        required:
> +          - link-frequencies
> +
> +    required:
> +      - endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - avdd-supply
> +  - iovdd-supply
> +  - dvdd-supply
> +  - port
> +
> +unevaluatedProperties: false
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
> +        sensor@24 {
> +            compatible =  "himax,hm1246";
> +            reg = <0x24>;
> +
> +            clocks = <&hm1246_clk>;
> +
> +            reset-gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
> +
> +            avdd-supply = <&hm1246_avdd>;
> +            iovdd-supply = <&hm1246_iovdd>;
> +            dvdd-supply = <&hm1246_dvdd>;
> +
> +            orientation = <2>;
> +            rotation = <0>;
> +
> +            port {
> +                endpoint {
> +                    remote-endpoint = <&isp_par_in>;
> +                    bus-width = <10>;
> +                    hsync-active = <1>; /* active high */
> +                    vsync-active = <1>; /* active high */
> +                    pclk-sample = <1>; /* sample on rising edge */
> +                    link-frequencies = /bits/ 64 <42200000>;
> +                };
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 752ccaea38b0ee74282e06f233463eba122fa92c..c09de45c5260b70af8a524721d4a999a1efa415d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11290,6 +11290,13 @@ L:	linux-kernel@vger.kernel.org
>  S:	Maintained
>  F:	drivers/misc/hisi_hikey_usb.c
>  
> +HIMAX HM1246 SENSOR DRIVER
> +M:	Matthias Fend <matthias.fend@emfend.at>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media_tree.git

I think this can be dropped as I understand you don't have commit access.

> +F:	Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml
> +
>  HIMAX HX83112B TOUCHSCREEN SUPPORT
>  M:	Job Noorman <job@noorman.info>
>  L:	linux-input@vger.kernel.org
> 

-- 
Kind regards,

Sakari Ailus

