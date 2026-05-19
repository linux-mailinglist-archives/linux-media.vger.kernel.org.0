Return-Path: <linux-media+bounces-62195-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKQcAHvqDGq9pwUAu9opvQ
	(envelope-from <linux-media+bounces-62195-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 00:55:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB4F585DDA
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 00:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 361E8303E4E7
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 22:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82D813A168E;
	Tue, 19 May 2026 22:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WYXse9LJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACB43A0B05;
	Tue, 19 May 2026 22:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779231302; cv=none; b=SuGwneBxdfxSjwvqx6BoqxJRL0S6CIxniV6t2hxHi5+PKXGyZK4kv7PLhNl+w1bngbHwrpJMJUlngqMG/LL3YVt0CHj/GmMmeQ0WEtxGhoUCZVgXal1YNTZxcQ2mPTqzHZahFZM0qbI2mCAkvyIt8EAZxMl88RyaUX/n08Sn8fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779231302; c=relaxed/simple;
	bh=CPzCK5QGY3IBZVvr1cXgpkykNusJXWFMCjWtw+Cy5BU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tbVhLYzGLHzsdmukRZsmcBiqKf5hz0sW8x0FpPm1WH9t1efY5Y733SJxL898ftqCJKZpx4l/IzCPekK0BxAX6aLVUA1noHOVkNewSG0YqHyDXsjEL5KKDH3Az5igVCbvtyYaGffBgzqtQdHkTOxqN9evFzX39sB1i3GhJgPZsOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WYXse9LJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (unknown [IPv6:2a01:cb1d:8ee:8600:346a:417a:479f:f6a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E093E55;
	Wed, 20 May 2026 00:54:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779231282;
	bh=CPzCK5QGY3IBZVvr1cXgpkykNusJXWFMCjWtw+Cy5BU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WYXse9LJFfqo4bMINyiIs3ae84T9m6PmAduMf4ndBYQz62iXcLxDcOMm7c+eiNEMb
	 OVBCoqbb8tmYHf+UMt5HRecYnfzqw46005FMjzdqMUiVsDDkLPzSyS4namSH4BXIeB
	 4lDsRkY1YONdldclXYThLnsvtOT5hnEQdeu5ITvM=
Date: Wed, 20 May 2026 00:54:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: Add Sony IMX678
Message-ID: <20260519225453.GI16205@killaraus.ideasonboard.com>
References: <20260516-imx678-v2-0-4854ac61d6fb@ideasonboard.com>
 <20260516-imx678-v2-1-4854ac61d6fb@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260516-imx678-v2-1-4854ac61d6fb@ideasonboard.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_FROM(0.00)[bounces-62195-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ideasonboard.com:email,ideasonboard.com:dkim,1a:email]
X-Rspamd-Queue-Id: 4AB4F585DDA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jai,

Thank you for the patch.

On Sat, May 16, 2026 at 07:49:10PM +0530, Jai Luthra wrote:
> Sony IMX678 is an 8.4 Megapixel (3856x2180) CMOS sensor, that can output
> pixels over MIPI CSI-2 bus. Add bindings for it.
> 
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
> Changes in v2:
> - Add per-variant compatibles for mono and colour, alongside the
>   generic fallback, so the variant can be declared without powering
>   the sensor at probe.
> - Rename reset GPIO to xclr as that's what it's called in the
>   datasheet, and how it behaves

For standard functions such as reset or power down, the preferred and
recommended naming scheme is to use the function name instead of the
signal name. "reset-gpios" is the right name for the property
corresonding to the XCLR signal. The signal name is then documented in
the description.

> - Reference the generic video interface devices schema and switch to
>   unevaluatedProperties.
> - Drop "link-frequencies: true"
> - Drop the T: entry for media.git from MAINTAINERS.
> ---
>  .../devicetree/bindings/media/i2c/sony,imx678.yaml | 129 +++++++++++++++++++++
>  MAINTAINERS                                        |   6 +
>  2 files changed, 135 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> new file mode 100644
> index 000000000000..8f12853f40e6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> @@ -0,0 +1,129 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2026 Ideas on Board Oy
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/sony,imx678.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony IMX678 Sensor
> +
> +maintainers:
> +  - Jai Luthra <jai.luthra@ideasonboard.com>
> +
> +description:
> +  Sony IMX678 diagonal 8.86 mm (Type 1/1.8) CMOS active pixel type solid-state
> +  image sensor with a square pixel array and 8.40M (3856x2180) effective pixels.
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - sony,imx678
> +      - sony,imx678-aamr
> +      - sony,imx678-aaqr
> +    description:
> +      The IMX678 sensor exists in a colour variant (IMX678-AAQR) and a mono
> +      variant (IMX678-AAMR). An internal register can also help detect this at
> +      runtime.

The description should explain how the three compatible strings differ.
The difference between sony,imx678-aamr and sony,imx678-aaqr is quite
evident, but it's not clear to the reader if they should pick
sony,imx678 or one of the other two values.

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: |
> +      Input clock (INCK). Only the rates listed in the datasheet are supported:
> +      13.5, 18, 24, 27, 36, 37.125, 72, and 74.25 MHz.
> +    maxItems: 1
> +
> +  avdd-supply:
> +    description: Analog power supply (3.3V)
> +
> +  ovdd-supply:
> +    description: Interface power supply (1.8V)
> +
> +  dvdd-supply:
> +    description: Digital power supply (1.2V)
> +
> +  xclr-gpios:
> +    description: Sensor XCLR GPIO
> +    maxItems: 1
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
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +                  - const: 4
> +                  - const: 5
> +                  - const: 6
> +                  - const: 7
> +                  - const: 8
> +
> +        required:
> +          - data-lanes
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
> +  - ovdd-supply
> +  - dvdd-supply
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
> +        camera@1a {
> +            compatible = "sony,imx678";
> +            reg = <0x1a>;
> +            clocks = <&imx678_clk>;
> +
> +            avdd-supply = <&camera_avdd_3v3>;
> +            ovdd-supply = <&camera_ovdd_1v8>;
> +            dvdd-supply = <&camera_dvdd_1v2>;
> +
> +            xclr-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
> +
> +            port {
> +                imx678: endpoint {
> +                    remote-endpoint = <&cam>;
> +                    data-lanes = <1 2 3 4>;
> +                    link-frequencies = /bits/ 64 <720000000>;
> +                };
> +            };
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2fb1c75afd16..6b368345a771 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24911,6 +24911,12 @@ T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
>  F:	drivers/media/i2c/imx415.c
>  
> +SONY IMX678 SENSOR DRIVER
> +M:	Jai Luthra <jai.luthra@ideasonboard.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> +
>  SONY MEMORYSTICK SUBSYSTEM
>  M:	Maxim Levitsky <maximlevitsky@gmail.com>
>  M:	Alex Dubov <oakad@yahoo.com>

-- 
Regards,

Laurent Pinchart

