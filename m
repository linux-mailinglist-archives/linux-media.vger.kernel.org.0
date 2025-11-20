Return-Path: <linux-media+bounces-47443-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC1AC72B48
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 09:05:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 659743570A1
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 08:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28F76302758;
	Thu, 20 Nov 2025 08:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NWU3m47Q"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7616D2D063F;
	Thu, 20 Nov 2025 08:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763625891; cv=none; b=XQ4gnHhmLP8VCWC4/z6mkVB4vejKQX+OyEdYjYFY49earg4L6MKmfiwoyD/vupsOI6ewjmZBRqFCjAXZEAuYGwO7umabaMdB9b87I+xOZCiz3MtSpXAGI6YSx/ZNf03vg2FNealzajMG1j2ZHFCgA1h81P6COh5Mp+Ligru1pM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763625891; c=relaxed/simple;
	bh=kZYWb/g02bT8X3jIx6M3OoYsWyrxc26Nntqt2xri9Cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y5451Fbs2iVkBpMRhhqvD6XY3Em9Fye9zlmkR4U02NzV/AdAh8CU4zxw5HKzbNSMR32YaBuW3gahhvsbGVPXMUREfIkXN5Yt2/5WFyFHeONYGdqoEbslX5u8d2BsKirTCTFyCPsFW6lktCc2Uzg/YJE4/Cz8cHD3F4ITZq+3MmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NWU3m47Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 774D6C4CEF1;
	Thu, 20 Nov 2025 08:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763625891;
	bh=kZYWb/g02bT8X3jIx6M3OoYsWyrxc26Nntqt2xri9Cc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NWU3m47Qrj9p9CvDWb/FZZBrScm6kbJAl9lTVGMbUmDtM478mDuh7I03TUbBEByl9
	 WZ0WSQbXTEhC2tUF0lZWeDK/YjdSH4kr+9mIs48zOA9V1XkvCdVAZr02+NBVAzhJnc
	 vvEMlmV6iemmVNH9/CxgT3aZCAQaCPeE1e+WTO4WXyvsaA+sPlwBetIozqyOv0rUnB
	 l25Fx8qbUTeQkFX/LQyYl9bc8SRqmLAq0g+O3ubuDa5yq5gVXzTiw5A3yNZ2Uv2cgc
	 JP94dSn6zT9uhwg+5sCQCTEQpmyYDBwj5a+8VW5y02SaEYh/w9JtMjSsGmblxP2uQu
	 fCozh9tOrrYvQ==
Date: Thu, 20 Nov 2025 09:04:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael Tretter <m.tretter@pengutronix.de>
Cc: Lars-Peter Clausen <lars@metafoo.de>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	kernel@pengutronix.de
Subject: Re: [PATCH v2 1/4] media: dt-bindings: adi,adv7180: add VPP and CSI
 register maps
Message-ID: <20251120-calm-invisible-bullmastiff-ceaf71@kuoka>
References: <20251119-b4-adv7180-vpp-sub-device-v2-0-86a7790b63ab@pengutronix.de>
 <20251119-b4-adv7180-vpp-sub-device-v2-1-86a7790b63ab@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251119-b4-adv7180-vpp-sub-device-v2-1-86a7790b63ab@pengutronix.de>

On Wed, Nov 19, 2025 at 05:25:51PM +0100, Michael Tretter wrote:
> diff --git a/Documentation/devicetree/bindings/media/i2c/adi,adv7180.yaml b/Documentation/devicetree/bindings/media/i2c/adi,adv7180.yaml
> index dee8ce7cb7ba..dbbbe76291bc 100644
> --- a/Documentation/devicetree/bindings/media/i2c/adi,adv7180.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/adi,adv7180.yaml
> @@ -30,7 +30,27 @@ properties:
>            - adi,adv7282-m
>  
>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: main register map
> +      - description: CSI register map
> +      - description: VPP register map
> +    description:
> +      The ADV7180 family may have up to three register maps. All chips have
> +      the main register map. The availability of the CSI and VPP register maps
> +      depends on the chip variant.
> +
> +      The addresses of the CSI and VPP register maps are programmable by
> +      software. They depend on the board layout and other devices on the I2C
> +      bus and are determined by the hardware designer to avoid address
> +      conflicts on the I2C bus.
> +
> +  reg-names:
> +    minItems: 1
> +    items:
> +      - const: main
> +      - enum: [ csi, vpp ]
> +      - enum: [ csi, vpp ]

Last entry must be:

const: vpp

We do not allow flexible order... but the problem is that your if:then:
does not match above at all. You do not have three items anywhere.


>  
>    powerdown-gpios:
>      maxItems: 1
> @@ -138,6 +158,58 @@ allOf:
>        required:
>          - ports
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - adi,adv7180
> +              - adi,adv7180cp
> +              - adi,adv7180st
> +              - adi,adv7182
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 1
> +
> +        reg-names:
> +          maxItems: 1
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - adi,adv7281
> +              - adi,adv7281-m
> +              - adi,adv7281-ma
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 2
> +
> +        reg-names:
> +          items:
> +            - const: main
> +            - enum: [ csi ]

const

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - adi,adv7280
> +              - adi,adv7282
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 2
> +
> +        reg-names:
> +          items:
> +            - const: main
> +            - enum: [ vpp ]

const

> +
>  examples:

Best regards,
Krzysztof


