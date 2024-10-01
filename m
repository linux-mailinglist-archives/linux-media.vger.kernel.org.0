Return-Path: <linux-media+bounces-18924-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E842798BD64
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 15:22:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48FF1B248FF
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 13:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BEA11C3F06;
	Tue,  1 Oct 2024 13:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="csnwXS8W"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B95C2E3;
	Tue,  1 Oct 2024 13:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727788952; cv=none; b=drMRcjyHde3nX0/MTTwxs0yqYVmT6rU1ZLtIIQWLHJFk/VQoGowbEAaLD/IOh68p/2RteBaI+tCSArXMObpNrM66GF3VywK+1ASshi2Fgr8Fkj+nMcilel72zuArZQBqAkwsJi9v+aP5whBc754Iy65gPFEkybQE/urud0YqS+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727788952; c=relaxed/simple;
	bh=FYxMFMqA9TwLZxCONfU4Ds+nGLsbsl+OsaBi8cs39Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zme+ZcRZTNTTb5GK0ernO9KWBUZxmebCqCu9R4/va/S7iofmPTMsLqUhJYZAsYoQ4IJCJxmBUZNPThXi0XQfzSQXPerVIC/r2ng7666JT1ntjFNiB444oHt6vM78rXGfeyO5ik6vKj3FLJ3Omb5ktihRYfYXSagLclMvOz1GtpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=csnwXS8W; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727788952; x=1759324952;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FYxMFMqA9TwLZxCONfU4Ds+nGLsbsl+OsaBi8cs39Rg=;
  b=csnwXS8WHoG5uSvKcGmjOfdVY1ItgdpIojR8wjpJePs1Okff2p4tUqR7
   rI+Ml7nebDQmp6PnnDn/G9bftTaKUCE23xjJEUxKpMngFgmj0rjPfqxVv
   +LGAX74zzMahcLSUizsdis5aGINAGZk+P/5NMDsPUF33fmJQQc7mDkciG
   cC8j66SHDZ/qVnvg6MULxtPO6IeyQEDpOIHFv9/YAaCAfMqeG7bdFuqPV
   70pO+GLBY1Fk+aSNzytZAmHV+/sLkteW6YJrhZf/5pXHfDP26upbjCODh
   5Bb+84Lj1Ha8Rl5BWz2ode0nJdhxZ5Y7F8yKBqcPvAtIiX0zIq+PqQ33h
   w==;
X-CSE-ConnectionGUID: fDkU79peQ9CuQ4nYzUbNkw==
X-CSE-MsgGUID: 7ePCUAnaQQiVuQYAII7M6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="37480702"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="37480702"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 06:22:30 -0700
X-CSE-ConnectionGUID: TLyYmWrGQxq+8EMFbopq1A==
X-CSE-MsgGUID: VwWvoWZlSBePNBrgsemoNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="73714580"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 06:22:27 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0F62B11F855;
	Tue,  1 Oct 2024 16:22:24 +0300 (EEST)
Date: Tue, 1 Oct 2024 13:22:24 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Subject: Re: [PATCH v2 2/4] media: dt-bindings: Add OmniVision OV08X40
Message-ID: <Zvv3kM1wWDiRCCiA@kekkonen.localdomain>
References: <20241001-b4-master-24-11-25-ov08x40-v2-0-e478976b20c1@linaro.org>
 <20241001-b4-master-24-11-25-ov08x40-v2-2-e478976b20c1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001-b4-master-24-11-25-ov08x40-v2-2-e478976b20c1@linaro.org>

Hi Bryan,

On Tue, Oct 01, 2024 at 02:15:50PM +0100, Bryan O'Donoghue wrote:
> Add bindings for the already upstream OV08X40 to enable usage of this
> sensor on DT based systems.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/media/i2c/ovti,ov08x40.yaml           | 120 +++++++++++++++++++++
>  1 file changed, 120 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov08x40.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov08x40.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..bc499e4b5d48ed57250dec33a91c92552f137cf9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov08x40.yaml
> @@ -0,0 +1,120 @@
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
> +description: |
> +  The Omnivision OV08X40 is a 9.2 megapixel, CMOS image sensor which supports:
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
> +  assigned-clocks: true
> +  assigned-clock-parents: true
> +  assigned-clock-rates: true

As much as I'd like to see these mandatory, there seem to be cases where
they can't be used. Therefore I'd leave them in the example only.

If that turns out to be the only change to do, I can also handle that while
applying.

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
> +
> +            assigned-clocks = <&ov9282_clk>;
> +            assigned-clock-parents = <&ov9282_clk_parent>;
> +            assigned-clock-rates = <19200000>;
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

