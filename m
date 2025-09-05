Return-Path: <linux-media+bounces-41821-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BED5B453EC
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 12:00:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C359C5A231E
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 10:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9574129A326;
	Fri,  5 Sep 2025 09:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="GUI0CfKg"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747D6298CA2;
	Fri,  5 Sep 2025 09:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757066392; cv=pass; b=jSE4SvQi2lj5Vr9LpRp+MpFxB2LDpUSSgaTSnCFM6UY78ublhzoSigA6DycLEuLddoMBbZqfuPkghoZxpvLcw0FcBofpLg/cpNFqS5Ho2jfV0nF3Im5jTVdZnJ99mOUCtRgq1UU1RvvmlASpZhVLNOPTjHPp4KyztuWrCVGi9dE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757066392; c=relaxed/simple;
	bh=4B0uCafS9PeiWwtB76K0wpVYqUotJLtrS8aEO+uQLTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LlManCDUCH76jj9k8BdgEdN9p5VCjNP3R2WmzFVzxLxVoIqGLwYpIGBhZCBsk9MvmYQBPSv5WJAiH8OsCUpNwe/J8LtQiBd8x/tOP4m067xUwZn5ozGmEVGhbHrE1qZ+9vepMt+g3LMKTeonGeZcjcSaMWilcyCfQXQiNuvTdGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=GUI0CfKg; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4cJBf52cjYzyTd;
	Fri,  5 Sep 2025 12:59:41 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1757066381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oxU6PeI8iqd+YU+k6CwK/hzw7lag9KitjUROGBpvzGM=;
	b=GUI0CfKgySHWm7Ai8V/4Q+/y88QEc2bLWtjGFYKs/gyCjaBnn63TEnwZc0IJ22JPvTrpOp
	1tN+SMDR3kNGkDPvYXj90eWNST1xMPF/q1cargR5yYXf76L6qkodwh8d188QB/on9obLb0
	pvAFtlyrPl85XX5F+wjIcu1FlFcrU8s=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1757066381; a=rsa-sha256; cv=none;
	b=ss4sCOxcsjmOecGY53Y1SCx43ctwU/adJnvSCrjJt12hgfr4BdJsaHqnMQRoBtz/Ck8UQr
	jClsQldiaeCs/yj41q0KJG1sr4VfaQG4029fB9Oq9zgkqnb/Ec26AKM2np3M/tgo1JzGtK
	MkaxjDHnZHE24nhR4dYZI/lpcjAlH5E=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1757066381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oxU6PeI8iqd+YU+k6CwK/hzw7lag9KitjUROGBpvzGM=;
	b=y8gsDYeHGpYkGtnCvKUTtWPp489kC8Yom9V6pnpHQee4uHoDHvZE7NDddbsbqSBbNYWZsf
	XX43UMgDQ2PUWDL+YhyAudCXCOc9GQMBFluqp+ZKrhBqXt0NBKb5HfqSb3QKOdDXcP0Jta
	RTwsNuM7DJ3AsmOeh4KsgwYIb1BAvzA=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 74846634C93;
	Fri,  5 Sep 2025 12:59:40 +0300 (EEST)
Date: Fri, 5 Sep 2025 12:59:40 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Matthias Fend <matthias.fend@emfend.at>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH v2 1/2] media: dt-bindings: i2c: add Himax HM1246 image
 sensor
Message-ID: <aLq0jJtdaxIpN9CT@valkosipuli.retiisi.eu>
References: <20250526-hm1246-v2-0-6b882827a3a5@emfend.at>
 <20250526-hm1246-v2-1-6b882827a3a5@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526-hm1246-v2-1-6b882827a3a5@emfend.at>

Hi Matthias,

Thanks for the set.

On Mon, May 26, 2025 at 08:59:27AM +0200, Matthias Fend wrote:
> Add YAML device tree binding for Himax HM1246 image sensor.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
> ---
>  .../bindings/media/i2c/himax,hm1246.yaml           | 111 +++++++++++++++++++++
>  1 file changed, 111 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml b/Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..8a67de7e3ffcaa9f1acfe443b1e36fffb79dbacf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml
> @@ -0,0 +1,111 @@
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
> +          bus-type:
> +            const: 5

Does the device also support e.g. Bt.656? If not, you can drop this.

If the rest of the parallel interface parameter properties aren't
mandatory, what are their default values?

> +
> +        required:
> +          - bus-type
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

It'd be nice to add macros for these in
include/dt-bindings/media/video-interfaces.h .

> +            rotation = <0>;
> +
> +            port {
> +                endpoint {
> +                    remote-endpoint = <&isp_par_in>;
> +                    bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
> +                    bus-width = <10>;
> +                    hsync-active = <1>; /* active high */
> +                    vsync-active = <1>; /* active high */
> +                    pclk-sample = <1>; /* sample on rising edge */
> +                };
> +            };
> +        };
> +    };
> 

-- 
Regards,

Sakari Ailus

