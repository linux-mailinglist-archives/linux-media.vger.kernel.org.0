Return-Path: <linux-media+bounces-40489-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBEAB2E7C3
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 23:56:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 511C5AA21B5
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 21:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 043F23375C5;
	Wed, 20 Aug 2025 21:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ABF/DvJb"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F07335BD0;
	Wed, 20 Aug 2025 21:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755726980; cv=none; b=ZeJV9swUdD1YHlsuu+DHugcwM65Ac+h8+n6CXEb/JMlikpavDtDlSuka2zFLhG0hRvem7A37cZoS5nyjrYwsHydOJjvcviictkTl9HhYSXJutVPTyUUisdM9xC6OR1Mj/Qv4oy6XMJbaU86B65cdw3hsFZ+aMbfMbJtPi/ONWfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755726980; c=relaxed/simple;
	bh=0rUHM2uemlukqAn2SUAopv8MRbyIeZpCqjQQeDYDJaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k2QzK7goOG2l74pxc+IXK5Qk9yYl/MvzVMLX6JisyEUWs4tA0Mgf9myFNKS44mWgZ1dLBgbZOxzXk2fZ/pjlCwClQCaB5jJya13+BtrVYfE6Cp+MRg8SF49swj18g5QvCtaT3JPzUebftOJyETTGNBdvArd/k7DsOwvKvrxBti0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ABF/DvJb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A3ABC4CEE7;
	Wed, 20 Aug 2025 21:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755726980;
	bh=0rUHM2uemlukqAn2SUAopv8MRbyIeZpCqjQQeDYDJaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ABF/DvJbxqGXza3FxFbixGqKBqH73e+JPH6xVycVidOenOqzumdOqzd2Dr0PFeLkk
	 C9Cua9MvYGWHo8FmJEzkyJ0MQlPchKQQLmsyB1392ZtTi6Fk+nJwlgp+g1OcYPVMhq
	 kWR4uV63i7/cDt0wzhlX3PGtLAk0ZNERXS1Tkj1ekAYLaa7pLSKAoKQJ923zhtA0Ml
	 lE/uJHY4GAyKDaUptb/2A9ZNieQ+W3e8XH3KzOJU6SnXHlE8pK2tp7qFpN02Dga5Dt
	 WqfDOU6evwGNrqnUHdMzZxW8HOXEF72EM3HeETMhP3TzL4qlDDLWWEIwRn3A3OXFcy
	 6JYQv5PLl22Jw==
Date: Wed, 20 Aug 2025 16:56:19 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Val Packett <val@packett.cool>
Subject: Re: [PATCH 1/7] dt-bindings: media: i2c: Add DW9718S, DW9719 and
 DW9761 VCM
Message-ID: <20250820215619.GA1381920-robh@kernel.org>
References: <20250817-dw9719-v1-0-426f46c69a5a@apitzsch.eu>
 <20250817-dw9719-v1-1-426f46c69a5a@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250817-dw9719-v1-1-426f46c69a5a@apitzsch.eu>

On Sun, Aug 17, 2025 at 07:09:20PM +0200, André Apitzsch wrote:
> Document Dongwoon DW9718S, DW9719 and DW9761 VCM devicetree bindings.
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> 
> --
> 
> The possible values for sac-mode and vcm-prescale of DW9719 and DW9761
> are missing because there is no documentation available.
> ---
>  .../bindings/media/i2c/dongwoon,dw9719.yaml        | 115 +++++++++++++++++++++
>  1 file changed, 115 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..80fd3fd42327fcafe3ff209d1cd6bbe17b8a211b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/dongwoon,dw9719.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Dongwoon Anatech DW9719 Voice Coil Motor (VCM) Controller
> +
> +maintainers:
> +  - devicetree@vger.kernel.org

No. Must be someone that has the h/w or cares about it. If there is no 
one, then we don't need the binding.

> +
> +description:
> +  The Dongwoon DW9718S/9719/9761 is a single 10-bit digital-to-analog converter
> +  with 100 mA output current sink capability, designed for linear control of
> +  voice coil motors (VCM) in camera lenses. This chip provides a Smart Actuator
> +  Control (SAC) mode intended for driving voice coil lenses in camera modules.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - dongwoon,dw9718s
> +      - dongwoon,dw9719
> +      - dongwoon,dw9761
> +
> +  reg:
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description: VDD power supply
> +
> +  dongwoon,sac-mode:
> +    description: |
> +      Slew Rate Control mode to use: direct, LSC (Linear Slope Control) or
> +      SAC1-SAC6 (Smart Actuator Control).
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum:
> +      - 0   # Direct mode
> +      - 1   # LSC mode
> +      - 2   # SAC1 mode (operation time# 0.32 x Tvib)
> +      - 3   # SAC2 mode (operation time# 0.48 x Tvib)
> +      - 4   # SAC3 mode (operation time# 0.72 x Tvib)
> +      - 5   # SAC4 mode (operation time# 1.20 x Tvib)
> +      - 6   # SAC5 mode (operation time# 1.64 x Tvib)
> +      - 7   # SAC6 mode (operation time# 1.88 x Tvib)
> +    default: 4
> +
> +  dongwoon,vcm-prescale:
> +    description:
> +      Indication of VCM switching frequency dividing rate select.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: dongwoon,dw9718s
> +    then:
> +      properties:
> +        dongwoon,sac-mode:
> +          default: 4
> +        dongwoon,vcm-prescale:
> +          description:
> +            The final frequency is 10 MHz divided by (value + 2).
> +          minimum: 0

That's already the minimum being unsigned.

> +          maximum: 15
> +          default: 0
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: dongwoon,dw9719
> +    then:
> +      properties:
> +        dongwoon,sac-mode:
> +          default: 4
> +        dongwoon,vcm-prescale:
> +          default: 96
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: dongwoon,dw9761
> +    then:
> +      properties:
> +        dongwoon,sac-mode:
> +          default: 6

At the top-level you already said the default is 4. The if/then is an 
AND operation. 'default' is just an annotation and has no effect on 
validation. I would just drop it from the if/then altogether. It's not 
worth the complexity.

> +        dongwoon,vcm-prescale:
> +          default: 62
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        actuator@c {
> +            compatible = "dongwoon,dw9718s";
> +            reg = <0x0c>;
> +
> +            vdd-supply = <&pm8937_l17>;
> +
> +            dongwoon,sac-mode = <4>;
> +            dongwoon,vcm-prescale = <0>;
> +        };
> +    };
> 
> -- 
> 2.50.1
> 

