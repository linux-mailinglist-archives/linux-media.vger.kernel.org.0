Return-Path: <linux-media+bounces-41851-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE09B45C82
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 17:26:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30B5816ADCD
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 15:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF4F32F7ABA;
	Fri,  5 Sep 2025 15:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cU1LdeyZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B8E1F418F;
	Fri,  5 Sep 2025 15:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757085846; cv=none; b=fs708CsDnWukVVLBC53GOuDzJe4yUMN+JZw9bzrMt+f04Q764tj5lv0TKcJgN5rJ8xiYATx5RtNfb8oaGw3qOS6T0uoe45ISgbuaYxEGR5/sltS/WNp3MmpOfY5fGrQMfSzprddxZFLa8xDk6mrtYgIxaSD/wuDogZrCtnXDB4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757085846; c=relaxed/simple;
	bh=/sijmUFm8G1WuzkQRTlfJtp+FcF4TiggUXmpwxx+kZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sx1LZqYqjtqAckN2B2Ch3OpjKiim3Xh7lnRhlC2Zyd1UJbyrmxIqDAu82nvn+0X3ulu3dSXJ+v515nCq5U96JrLIllk2N6y1wfiaIyvA/P7wHCE6m8IpJIePWYYK9vKhArsDGN3lRmx6LNPCbKjTRMJbPQNxp9z8qfhXhiIyZSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cU1LdeyZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53D72C4CEF1;
	Fri,  5 Sep 2025 15:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757085845;
	bh=/sijmUFm8G1WuzkQRTlfJtp+FcF4TiggUXmpwxx+kZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cU1LdeyZHfSl8xPbV0PfPKf2H6X03lfzr9p7BGn64aj3TO3vWSpgavdh0jZ0TYYcG
	 7W8gTd9zWsGyUo+YnUjuqCLYHdEMzuvldIsOtHSqI9hK4RNUbDXBZBILkQqZmLs9ra
	 LZDDogWSLKkB7CffL+LJE5IVzia1XjoSP36mbjB+rL7qd41CN34KZACl730DSxPeJ2
	 BBPGQC/ZZGN8/J0o49JB6K/ogxFJjkbi4gCoNGulbwRuW2Zx7McAVD5/qZTtYaVIa2
	 n4JnTnS6BxBlm1URVpSqFgAry6btlZSt8UhIZue/BewKUO4wKOGYwzEOjMhoco4ABy
	 6enOQBwivzAiw==
Date: Fri, 5 Sep 2025 10:24:04 -0500
From: Rob Herring <robh@kernel.org>
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Daniel Thompson <daniel.thompson@linaro.org>,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: leds: commonize leds property
Message-ID: <20250905152404.GB953718-robh@kernel.org>
References: <20250905-leds-v2-0-ed8f66f56da8@vinarskis.com>
 <20250905-leds-v2-2-ed8f66f56da8@vinarskis.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905-leds-v2-2-ed8f66f56da8@vinarskis.com>

On Fri, Sep 05, 2025 at 09:59:30AM +0200, Aleksandrs Vinarskis wrote:
> A number of existing schemas use 'leds' property to provide
> phandle-array of LED(s) to the consumer. Additionally, with the
> upcoming privacy-led support in device-tree, v4l2 subnode could be a
> LED consumer, meaning that all camera sensors should support 'leds'
> and 'led-names' property via common 'video-interface-devices.yaml'.
> 
> To avoid dublication, commonize 'leds' property from existing schemas
> to newly introduced 'led-consumer.yaml'.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
>  .../devicetree/bindings/leds/backlight/led-backlight.yaml          | 7 +------
>  Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml  | 6 +-----
>  .../devicetree/bindings/media/video-interface-devices.yaml         | 3 +++
>  3 files changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
> index f5554da6bc6c73e94c4a2c32b150b28351b25f16..5e19b4376715eeb05cb789255db209ed27f8822f 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
> +++ b/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
> @@ -18,17 +18,12 @@ description:
>  
>  allOf:
>    - $ref: common.yaml#
> +  - $ref: /schemas/leds/leds-consumer.yaml#

Drop.

>  
>  properties:
>    compatible:
>      const: led-backlight
>  
> -  leds:
> -    description: A list of LED nodes
> -    $ref: /schemas/types.yaml#/definitions/phandle-array
> -    items:
> -      maxItems: 1

You need to keep the property here:

leds: true

> -
>  required:
>    - compatible
>    - leds
> diff --git a/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml b/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
> index 8ed059a5a724f68389a1d0c4396c85b9ccb2d9af..b4f326e8822a3bf452b22f5b9fa7189696f760a4 100644
> --- a/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
> +++ b/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
> @@ -17,16 +17,12 @@ properties:
>    compatible:
>      const: leds-group-multicolor
>  
> -  leds:
> -    description:
> -      An aray of monochromatic leds
> -    $ref: /schemas/types.yaml#/definitions/phandle-array
> -
>  required:
>    - leds
>  
>  allOf:
>    - $ref: leds-class-multicolor.yaml#
> +  - $ref: /schemas/leds/leds-consumer.yaml#


Same comments in this one.

>  
>  unevaluatedProperties: false
>  
> diff --git a/Documentation/devicetree/bindings/media/video-interface-devices.yaml b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> index cf7712ad297c01c946fa4dfdaf9a21646e125099..1e25cea0ff71da2cfd1c7c4642713199f3542c0a 100644
> --- a/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> +++ b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> @@ -10,6 +10,9 @@ maintainers:
>    - Jacopo Mondi <jacopo@jmondi.org>
>    - Sakari Ailus <sakari.ailus@linux.intel.com>
>  
> +allOf:
> +  - $ref: /schemas/leds/leds-consumer.yaml#

This can be dropped. The user still has to define how many entries and 
what the values of led-names are.

> +
>  properties:
>    flash-leds:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
> 
> -- 
> 2.48.1
> 

