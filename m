Return-Path: <linux-media+bounces-36153-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 794B0AEC9BC
	for <lists+linux-media@lfdr.de>; Sat, 28 Jun 2025 20:27:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 367D43BEDD8
	for <lists+linux-media@lfdr.de>; Sat, 28 Jun 2025 18:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194E226E707;
	Sat, 28 Jun 2025 18:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="QLmVyJNM"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3B0219302;
	Sat, 28 Jun 2025 18:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751135246; cv=pass; b=jPDO5o10f3eHgwc5hA0FJcYq+MzDHANGUXk/kfcb+OZfSn3kaFKOqf4u57ptkgSSkmUzmlsW34iY7dhja8svasmuilzUsSHfH/iYyXoVoihsnxyeCrm6zYAyCtUDuL7+KEThk+5TcAcEctK2zNWyIYBrMZe6Tn2IhVQ0lCg0u88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751135246; c=relaxed/simple;
	bh=E4wVzdmWrKSdbCHEX3fuS6RQ4A6N3MxxO7f/PNjRrdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nlp9QKKJFFyuhV45fZuYnpkD+rt45ZW3WM0BDixLa35jOX76IIU1pxC8pRCkjRWU/2J3jS9l6xLUdkyOBmCoYVN+K/sSsmegsVBStsvAq/AzFw3R43vlsQU1cy5g3pN0LaXz+v46ojVIyw2QR6Cg0glk8dzvtuLPew+KraE+Tzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=QLmVyJNM; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-127c-61ff-fee2-b97e.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:127c:61ff:fee2:b97e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4bV19S63SFzyR7;
	Sat, 28 Jun 2025 21:27:08 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1751135230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AJ+fyHtmJgkbOU1+JyFtXH3gaU+q/29nr2pOPL97MlE=;
	b=QLmVyJNMvqxwfO0CArLdeO6wOs1//3c4tn4KDUZMTr5X802pz27ofknwz+YxdcB22rnJlQ
	zpM+OSPevLjEbVpxqKCjaC9/R8l2HDRV+rTN6O8zz3UY0IdBGaMreahAjQ3oL4EfsNi3nY
	3YligLK/XR2yj1meIXyygqIOJT6fzWI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1751135230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AJ+fyHtmJgkbOU1+JyFtXH3gaU+q/29nr2pOPL97MlE=;
	b=AtTGil98qxH/ITrG4U16BCZcrRV+4Q0yfntxEI7XheX4cwPrrH/03deT+a71Z4qUmIxmjN
	CgrDhYeO26PyhxVDNCCJCxVfYkCNnQ07gci4t6flA2JqMbdchdXistk3tyG0LI89/NOlKe
	+zlEaMKOoHXuDLpBiLQd8zyiuU1HtyQ=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1751135230; a=rsa-sha256; cv=none;
	b=EVxqihENwKj6379ITkl30lwgNmbxDaEhEoPu398eDx7f3Oy405bLTjL5HPg15IL+hnJJ44
	rhDGXmKRwdEQ041aAK9HS66V0ZNxzr3SP0lQf2YKvGzh2pTRRPKDO5H6EaPxdMsaLIW+aY
	FAigjoot/Y0GkPXR4gwRCq4yG4gvytU=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 0AF47634C93;
	Sat, 28 Jun 2025 21:27:05 +0300 (EEST)
Date: Sat, 28 Jun 2025 18:27:05 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl, laurent.pinchart+renesas@ideasonboard.com,
	robh@kernel.org, krzk+dt@kernel.org, bryan.odonoghue@linaro.org,
	laurentiu.palcu@nxp.com, robert.chiras@nxp.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	LnxRevLi@nxp.com, kieran.bingham@ideasonboard.com,
	hdegoede@redhat.com, dave.stevenson@raspberrypi.com,
	mike.rudenko@gmail.com, alain.volmat@foss.st.com,
	devicetree@vger.kernel.org, conor+dt@kernel.org,
	alexander.stein@ew.tq-group.com, umang.jain@ideasonboard.com,
	zhi.mao@mediatek.com, festevam@denx.de, julien.vuillaumier@nxp.com
Subject: Re: [PATCH v4 1/4] dt-bindings: media: i2c: Add OX05B1S sensor
Message-ID: <aGAz-TA7fjI-m76N@valkosipuli.retiisi.eu>
References: <20250305094359.299895-1-mirela.rabulea@nxp.com>
 <20250305094359.299895-2-mirela.rabulea@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305094359.299895-2-mirela.rabulea@nxp.com>

Hi Mirela,

On Wed, Mar 05, 2025 at 11:43:56AM +0200, Mirela Rabulea wrote:
> Add bindings for Omnivision OX05B1S sensor.
> Also add compatible for Omnivision OS08A20 sensor.
> 
> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> Changes in v4:
> 	Collect Reviewed-by
> 
> Changes in v3:
> 	Use unevaluatedProperties: false and drop orientation/rotation
> 	Drop items and keep alphabetical order in compatible property
> 	Shorten the description for reset_gpio
> 	Make the supplies required.
> 	Use generic node name (camera instead of ox05b1s)
> 
> Changes in v2:
> 	Small updates on description
> 	Update subject, drop "bindings" and "driver"
> 	Just one binding patch (squash os08a20 bindings)
> 	Re-flow to 80 columns.
> 	Drop clock name (not needed in case of single clock)
> 	Make the clock required property, strictly from sensor module point of view, it is mandatory (will use a fixed clock for nxp board)
> 	Add regulators: avdd, dvdd, dovdd
> 	Add $ref: /schemas/media/video-interface-devices.yaml
> 	Drop assigned-clock* properties (defined in clocks.yaml)
> 	Keep "additionalProperties : false" and orientation/rotation (unevaluatedProperties: false was suggested, but only orientation/rotation are needed from video-interface-devices.yaml)
> 	Include assigned-clock* in the example, for completeness sake (although it was also suggested to omit them)
> 
>  .../bindings/media/i2c/ovti,ox05b1s.yaml      | 119 ++++++++++++++++++
>  1 file changed, 119 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml
> new file mode 100644
> index 000000000000..9f35b4e67bea
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml
> @@ -0,0 +1,119 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2024 NXP
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,ox05b1s.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Omnivision OX05B1S Image Sensor
> +
> +maintainers:
> +  - Mirela Rabulea <mirela.rabulea@nxp.com>
> +
> +description:
> +  The Omnivision OX05B1S is a 1/2.5-Inch CMOS image sensor with an active
> +  array size of 2592 x 1944. It is programmable through I2C interface.
> +  Image data is available via MIPI CSI-2 serial data output.
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ovti,os08a20
> +      - ovti,ox05b1s

The bindings only describe ox05b1s. How are the two different?

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: Input clock (24 MHz)
> +    maxItems: 1

Is this really a hardware limitation, or what the driver is currently
limited to? In the former case, I'd include the range.

> +
> +  reset-gpios:
> +    description: Active low XSHUTDOWN pin
> +    maxItems: 1
> +
> +  avdd-supply:
> +    description: Power for analog circuit (2.8V)
> +
> +  dovdd-supply:
> +    description: Power for I/O circuit (1.8V)
> +
> +  dvdd-supply:
> +    description: Power for digital circuit (1.2V)
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +    description: MIPI CSI-2 transmitter port
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
> +        required:
> +          - data-lanes
> +
> +    required:
> +      - endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - port
> +  - avdd-supply
> +  - dovdd-supply
> +  - dvdd-supply
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
> +        camera@36 {
> +            compatible = "ovti,ox05b1s";
> +            reg = <0x36>;
> +            clocks = <&ox05b1s_clk>;
> +
> +            assigned-clocks = <&ox05b1s_clk>;
> +            assigned-clock-parents = <&ox05b1s_clk_parent>;
> +            assigned-clock-rates = <24000000>;
> +
> +            reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
> +
> +            avdd-supply = <&camera_avdd_2v8>;
> +            dovdd-supply = <&camera_dovdd_1v8>;
> +            dvdd-supply = <&camera_dvdd_1v2>;
> +
> +            orientation = <2>;
> +            rotation = <0>;
> +
> +            port {
> +                ox05b1s_mipi_0_ep: endpoint {
> +                    remote-endpoint = <&mipi_csi0_ep>;
> +                    data-lanes = <1 2 3 4>;
> +                };
> +            };
> +        };
> +    };
> +...

-- 
Kind regards,

Sakari Ailus

