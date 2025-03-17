Return-Path: <linux-media+bounces-28349-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6C4A64CBD
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 12:32:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7806C3AF73F
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 11:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28C9123716E;
	Mon, 17 Mar 2025 11:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o1hCQxNu"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAEA22FDEF;
	Mon, 17 Mar 2025 11:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742211115; cv=none; b=m+QSHbiz5fUpGjitYb5+O1KYYFiBV7cLdmyh8VLDJK1WNlU0+EHMJJHmOBuLX0dlUX9mgF8XVxaDrR0w4v15PxmxQ2HVo0EmFgjqDGDJc9ngvNpZaJnXq8iKxDLjfQP9jOb2VUYlvg81yxPQMn1fszWN3KMVfJEx7BljlzN1fHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742211115; c=relaxed/simple;
	bh=H3zpgL+lCiZOqENycMl3Ma7kHbOZCKm9xVVNVoMukyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=elFWuj+ELKugHfCkBNzGx0+oHvpaDAZJbpNQm2b+L1gAW8YqOjfbP4mUVgAp05tyx3KOcF2ObuKXVcWLB5JI/FrM2wW+7Ri7Oqkh9PKyraPzTHykMYWm2egheurqwrMEqxP/gptAN74KPbXr2RBAOcqCIlesiOpdsc8/dNk8osI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o1hCQxNu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F26ADC4CEE3;
	Mon, 17 Mar 2025 11:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742211115;
	bh=H3zpgL+lCiZOqENycMl3Ma7kHbOZCKm9xVVNVoMukyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o1hCQxNuQNZys42vV7aSyxY/j8a4rPvzx8UkJsOHlorgFuksDi6jfVLsus2l56ELd
	 eTKXqH0JR0zEG4aakwoWyMoVVRUpvrqa4hIrn1capejtLkNvfE1S9qnN4QQS5+0Pv0
	 YMfK58e3Hn2VpytHs2EF7AKLUNB0WHXeeR1f+b1tZVjgKmgkwgEMg0jLsSyWmuom8E
	 Wb/PHSRTxRu2F6GZ/mja1HozByd1vJOumUXM4cr4Iegn6gH59dS6XmU12xCVBwB9Z1
	 HU347d5mZQvo8tEc8/4n0tvaGPtfk/z8j4eDzjF6k3ntsgaKDWtKkyd3V4OqIBUffS
	 9nsVeU3IuU0SA==
Date: Mon, 17 Mar 2025 12:31:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: media: renesas,isp: Add ISP core
 function block
Message-ID: <20250317-merry-ringtail-of-competition-7d46fb@krzk-bin>
References: <20250315152708.328036-1-niklas.soderlund+renesas@ragnatech.se>
 <20250315152708.328036-2-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250315152708.328036-2-niklas.soderlund+renesas@ragnatech.se>

On Sat, Mar 15, 2025 at 04:27:02PM +0100, Niklas S=C3=B6derlund wrote:
> diff --git a/Documentation/devicetree/bindings/media/renesas,isp.yaml b/D=
ocumentation/devicetree/bindings/media/renesas,isp.yaml
> index c4de4555b753..de9bc739e084 100644
> --- a/Documentation/devicetree/bindings/media/renesas,isp.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,isp.yaml
> @@ -25,19 +25,54 @@ properties:
>            - renesas,r8a779h0-isp # V4M
>        - const: renesas,rcar-gen4-isp # Generic R-Car Gen4
>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> +
> +  reg-names:
> +    minItems: 1
> +    items:
> +      - const: cs
> +      - const: core

All of this and further must be restricted per compatible. Otherwise
commit msg should explain why one SoC can have it different on different
boards.

> =20
>    interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> +
> +  interrupt-names:
> +    minItems: 1
> +    items:
> +      - const: cs
> +      - const: core
> =20
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: cs
> +      - const: core
> =20
>    power-domains:
>      maxItems: 1
> =20
>    resets:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> +
> +  reset-names:
> +    minItems: 1
> +    items:
> +      - const: cs
> +      - const: core
> +
> +  renesas,vspx:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      A phandle to the companion VSPX responsible for the Streaming Brid=
ge

But what does this device needs it for?

> +      functionality. This property is not mandatory and not all ISP devi=
ces
> +      have one attached.

Drop last sentence, redundant. Instead disallow it (renesas,vspx: false)
for all the variants not having VSPX.

> =20
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
> @@ -103,10 +138,14 @@ properties:
>  required:
>    - compatible
>    - reg
> +  - reg-names
>    - interrupts
> +  - interrupt-names
>    - clocks
> +  - clock-names
>    - power-domains
>    - resets
> +  - reset-names
>    - ports
> =20
>  additionalProperties: false
> @@ -119,11 +158,16 @@ examples:
> =20
>      isp1: isp@fed20000 {
>              compatible =3D "renesas,r8a779a0-isp", "renesas,rcar-gen4-is=
p";
> -            reg =3D <0xfed20000 0x10000>;
> -            interrupts =3D <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
> +            reg =3D <0xfed20000 0x10000>, <0xfee00000 0x10000>;
> +            reg-names =3D "cs", "core";
> +            interrupts =3D <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-names =3D "cs", "core";
>              clocks =3D <&cpg CPG_MOD 613>;
> +            clock-names =3D "cs";

Why no core? The names feel inconsistent. If your block has "core" reg
for the "ISP core" sublock, why there is no "ISP core" clock for that
subblock?

Best regards,
Krzysztof


