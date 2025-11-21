Return-Path: <linux-media+bounces-47556-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D959BC77E6D
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 09:28:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D89CD4EBB1D
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 08:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1C333E373;
	Fri, 21 Nov 2025 08:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ps/jj8OT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD74E2FDC57;
	Fri, 21 Nov 2025 08:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763713286; cv=none; b=oejguto8qnxYSCsveqLIytbGVqXl4J4R90enDg0aP8pxn7wkU0CykdM7WKS7vcNpJt+yoVJO2k9/a0KD5M0wcfr033EYvMahmMdcC9rbAb08BpTool8cpdYD8UCmQB40/oUABpeVpLJD4RRXFikcHkerzph7jjME3M0mmVFJ4Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763713286; c=relaxed/simple;
	bh=bbkC/gm+PlvYtnfQwRKFSQLCAfd4zVrxvX6KXk1XrPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MlqRWW0T0Gg01eBXH2WE9Ddtsa3uOTls8RoheG0z1XLZUM16MhK0317aVBuO3kQnfeTSDSEYnyLZ6cnXTUV1kBIXj41sHsofFJ7SCvVI+xpjX5HPltAlNy4/aB7ZF90Q/UDW6QQkjuPvASpwhS0r4GeLF9goC8myJ4kq9ExJXA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ps/jj8OT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E369FC4CEF1;
	Fri, 21 Nov 2025 08:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763713285;
	bh=bbkC/gm+PlvYtnfQwRKFSQLCAfd4zVrxvX6KXk1XrPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ps/jj8OTyCxwmGcOFq4SxnG4HIdTLuzI2EE2RjXYt015cAW9PDLc1kesVkR43f1Lr
	 eSSpeXoRzFUGjxsd4JKBIJBcwwmvlkI4ApM1SgHGkmNCoIJs6L5ZQOiMwgCxp81WQR
	 1HLM0KmRGlR09MfeyWVLJ8LSlJKkA8VbMYQ22UyymhXXJbjvj+Xbp1GvpjY1o/hsNc
	 0Ehn0L0DZRBxbCiEyJ+uvl7Z2wPc4nHp/u33m1Zptegkn7xznD25NXicOwFUdd11XE
	 hc40aJVd6dbcwwUspVLVqF9EDDHgKYaKfopVzyVRJA32nXr6fsB+Py83AUZQ23U0TW
	 TsqcdI8UDU/Ew==
Date: Fri, 21 Nov 2025 09:21:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael Tretter <m.tretter@pengutronix.de>
Cc: Lars-Peter Clausen <lars@metafoo.de>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	kernel@pengutronix.de
Subject: Re: [PATCH v3 1/4] media: dt-bindings: adi,adv7180: add VPP and CSI
 register maps
Message-ID: <20251121-ambrosial-ermine-of-gallantry-cf2c51@kuoka>
References: <20251120-b4-adv7180-vpp-sub-device-v3-0-c9d80661e7d9@pengutronix.de>
 <20251120-b4-adv7180-vpp-sub-device-v3-1-c9d80661e7d9@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251120-b4-adv7180-vpp-sub-device-v3-1-c9d80661e7d9@pengutronix.de>

On Thu, Nov 20, 2025 at 03:22:53PM +0100, Michael Tretter wrote:
> Different variants of the ADV7280 chip have up to three register maps.
> The availability of the CSI and VPP register maps depends on the chip
> variant. The address of the additional register maps depends on the
> board design and other chips on the I2C but. They may be programmed via
> registers in the main register map.
> 
> Allow to specify the addresses of the VPP and CSI register maps in the
> device tree to solve I2C address conflicts on a board level.
> 
> The CSI and VPP register maps are always optional to allow backwards
> compatibility with existing device trees which may rely on the default
> address.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
> Changes in v3:
> - add minItems to all if:then: cases
> - make enums with one item const
> Changes in v2:
> - document backwards compatibility in commit message
> - extend register maps in top level and define limits per variant
> - define additional register maps for all variants
> - document, why the programmable addresses are hardware description
> ---
>  .../devicetree/bindings/media/i2c/adi,adv7180.yaml | 99 +++++++++++++++++++++-
>  1 file changed, 98 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/adi,adv7180.yaml b/Documentation/devicetree/bindings/media/i2c/adi,adv7180.yaml
> index dee8ce7cb7ba..c455da2b7912 100644
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

VPP  or CSI register map

> +      - description: VPP register map

CSI register map

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
> +      - const: csi
>  
>    powerdown-gpios:
>      maxItems: 1
> @@ -138,6 +158,64 @@ allOf:
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
> +          minItems: 1

I guess you added minItems after my suggestions of being explicit, heh,
I did not provide you all rules because that one seemed obvious - 1 is
already minimum, so it can be skipped.

Please drop minItems here.

> +          maxItems: 1
> +
> +        reg-names:
> +          minItems: 1

and here

The rest is fine, so with all fixes above:

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


