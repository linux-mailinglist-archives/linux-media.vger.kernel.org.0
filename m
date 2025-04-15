Return-Path: <linux-media+bounces-30284-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F721A8AB52
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 00:36:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C4CA7AC8C2
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 22:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3597029DB6B;
	Tue, 15 Apr 2025 22:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lWnTlOV8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB6B255259;
	Tue, 15 Apr 2025 22:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744756559; cv=none; b=q6zCOdOHD4Nc9SIPqnPwyuv0uS9oNklvRY5ovqM6ABzEgRJjibh+GgIE3SrHta60psbd35YaKmF4ybNtIGkfGPzzV737cLUD4EJwylhKjkv5KVar9HXBbO8q/Wm09mFPZ783yE6CffewNTUn0LAiLKVCYUfKetma3s6JfCwAQCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744756559; c=relaxed/simple;
	bh=h+8aBUuwLi/fRk8qAOrFLH8Sai8/fXwxK8UFNl4wO2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tHjCCL3wpnbITpiXU9AuZ9I5czz8PZ8qq6057T1du47dbNhCkRw26b91l08wyST4exor20Pam+7hut7JfllQh1CHi2ZRQMZ9picXwfwAprV612Q71UYyjQxfO3S0tqKfgSl88uz/JdzT/S6SZC6VB6gftx/AkVG+SbgGjgjsHPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lWnTlOV8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DADB4C4CEE7;
	Tue, 15 Apr 2025 22:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744756559;
	bh=h+8aBUuwLi/fRk8qAOrFLH8Sai8/fXwxK8UFNl4wO2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lWnTlOV8bCu0YyZfXx51DvZLH5q7CKtpRPqb405mdbHI5i92D9/Q1Kxdhm4Ltp0rD
	 8xkz+RJollv/AATpEHl3NIC0Ul0Gp7hyMvYQw/iwV8Z+m2QqhRGPYqY7fPFx2yLR/c
	 WtD6MHpPVgvpog4hnrcb1HNOxq3Cxz47LfbO5tdGFnT+RxQZBXAgLwjM9IJyHMOMTJ
	 lPDHx52afhyqbVJDLfLSD7j/7eWyTa4c35POPqc/898WQBgQdigxozhm7/xIPwaMFF
	 AW5Adxs6qCAT9kj3fMrPzzg7VJBsTrp3VQ+H/CZkBzuIAcFSsCYlR0//Vteauh0kmB
	 gGLjezxgRu5AA==
Date: Tue, 15 Apr 2025 17:35:57 -0500
From: Rob Herring <robh@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: dt-bindings: Convert Analog Devices ad5820 to
 DT schema
Message-ID: <20250415223557.GA940473-robh@kernel.org>
References: <20250414-b4-ad5820-dt-yaml-v3-1-39bbb5db7b2b@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414-b4-ad5820-dt-yaml-v3-1-39bbb5db7b2b@ixit.cz>

On Mon, Apr 14, 2025 at 06:04:01PM +0200, David Heidelberg wrote:
> Convert the Analog Devices ad5820 to DT schema format.
> 
> Added the io-channel-cells property, because it's already used by the

You mean #io-channel-cells?

> Nokia N900 device-tree and defines ad5820 as having only single output.
> 
> Acked-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Changes in v3:
> - Removed documentation of io-channel-cells property. Now it's 1:1 to
>   the original binding. The reference to it from the Nokia N900 dts
>   was removed in the -next.

Added or removed? I'm confused.

> - Link to v2: https://lore.kernel.org/r/20250314-b4-ad5820-dt-yaml-v2-1-287958c3c07c@ixit.cz
> 
> Changes in v2:
> - added MAINTAINERS entry for the binding
> - documented why io-channel-cells got added into the binding.
> - dropped io-channel-cells in required properties.
> - adjusted example indentation to 4 spaces.
> - Link to v1: https://lore.kernel.org/r/20250209203940.159088-1-david@ixit.cz
> ---
>  .../devicetree/bindings/media/i2c/ad5820.txt       | 28 ----------
>  .../devicetree/bindings/media/i2c/adi,ad5820.yaml  | 59 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  3 files changed, 60 insertions(+), 28 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ad5820.txt b/Documentation/devicetree/bindings/media/i2c/ad5820.txt
> deleted file mode 100644
> index 5764cbedf9b73387ad1bfa9acf99c643f959b84a..0000000000000000000000000000000000000000
> --- a/Documentation/devicetree/bindings/media/i2c/ad5820.txt
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -* Analog Devices AD5820 autofocus coil
> -
> -Required Properties:
> -
> -  - compatible: Must contain one of:
> -		- "adi,ad5820"
> -		- "adi,ad5821"
> -		- "adi,ad5823"
> -
> -  - reg: I2C slave address
> -
> -  - VANA-supply: supply of voltage for VANA pin
> -
> -Optional properties:
> -
> -   - enable-gpios : GPIO spec for the XSHUTDOWN pin. The XSHUTDOWN signal is
> -active low, a high level on the pin enables the device.
> -
> -Example:
> -
> -       ad5820: coil@c {
> -               compatible = "adi,ad5820";
> -               reg = <0x0c>;
> -
> -               VANA-supply = <&vaux4>;
> -               enable-gpios = <&msmgpio 26 GPIO_ACTIVE_HIGH>;
> -       };
> -
> diff --git a/Documentation/devicetree/bindings/media/i2c/adi,ad5820.yaml b/Documentation/devicetree/bindings/media/i2c/adi,ad5820.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..93349e7daf262fc8939f984fbe93cf064a0cbaf8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/adi,ad5820.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/adi,ad5820.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices AD5820 autofocus coil
> +
> +maintainers:
> +  - Pavel Machek <pavel@ucw.cz>
> +
> +description:
> +  The AD5820 is a current sink driver designed for precise control of
> +  voice coil motors (VCMs) in camera autofocus systems.
> +
> +allOf:
> +  - $ref: /schemas/iio/iio.yaml#

You have the ref, so #io-channel-cells is allowed, but you need to say 
what the value for it should be for *this* binding. IOW, you still need 
to list it explicitly.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,ad5820
> +      - adi,ad5821
> +      - adi,ad5823
> +
> +  reg:
> +    maxItems: 1
> +
> +  enable-gpios:
> +    maxItems: 1
> +    description:
> +      GPIO spec for the XSHUTDOWN pin. The XSHUTDOWN signal is active low,
> +      a high level on the pin enables the device.
> +
> +  VANA-supply:
> +    description: supply of voltage for VANA pin
> +
> +required:
> +  - compatible
> +  - reg
> +  - VANA-supply
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
> +        coil@c {
> +            compatible = "adi,ad5820";
> +            reg = <0x0c>;
> +
> +            enable-gpios = <&msmgpio 26 GPIO_ACTIVE_HIGH>;
> +            VANA-supply = <&vaux4>;
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index af3537005de35dfd0ded11bdc2b9c63e10c70e93..366ed4905fc9b32862a4fd665cf5f4e09fafc989 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17274,6 +17274,7 @@ M:	Pavel Machek <pavel@kernel.org>
>  M:	Sakari Ailus <sakari.ailus@iki.fi>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/adi,ad5820.yaml
>  F:	drivers/media/i2c/ad5820.c
>  F:	drivers/media/i2c/et8ek8
>  
> 
> ---
> base-commit: b425262c07a6a643ebeed91046e161e20b944164
> change-id: 20250314-b4-ad5820-dt-yaml-3220bf2f1e40
> 
> Best regards,
> -- 
> David Heidelberg <david@ixit.cz>
> 

