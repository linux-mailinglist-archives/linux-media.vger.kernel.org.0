Return-Path: <linux-media+bounces-14220-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CE5919F98
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 08:52:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCBE81F22DF6
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 06:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89F713FBA5;
	Thu, 27 Jun 2024 06:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tPK8kltT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73E93D3A9
	for <linux-media@vger.kernel.org>; Thu, 27 Jun 2024 06:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719471171; cv=none; b=bv+aXCSAjgPfzpQ0AKJIEzkDo2R52dFTwwX574OOOn7zZKC2D+PCTZxqMgeCtVJYvYPk9B2EiHoJ6skv13kqUPq9Ji0zo2NiToOkiSnOQLPvarRqR2hKiPtfZv4dJoXTZQKzoyXlGJZsM/FERylNCJVFBdmptp82vUjA0+ngDas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719471171; c=relaxed/simple;
	bh=g1+4Dn3TABxPNYoG2FfngX7PnDFlJEznAygoQ55Xboc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=LN8TRtCwFbvgADZtbp2vOxd5CJlLg1gjLRy0cELV49ZwVxDRgWtfsacy9teslinjgIVtV2zrtGJjo8A5LcJjfiL/HdjrhmBDDkheShd4GUCuBM7Fyva3Zw1Yh8/6Ti2M7YlVxcpq821yAnejh4ybjXlqcz30nmNapcdWTdenHMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tPK8kltT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63750C2BBFC;
	Thu, 27 Jun 2024 06:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719471170;
	bh=g1+4Dn3TABxPNYoG2FfngX7PnDFlJEznAygoQ55Xboc=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=tPK8kltT8fglCf5o1gECSjoFaKS7otuBMKIapmN3r5gVKemyyA1nmT4svOAjxIFju
	 Njv4TCwzdipPVzHHrz4J8VnCVqbL8Zbl2q3g8zDyVNuWSN+xIVZubSsdGUi3Ah5/Ea
	 6e4+EOrlr6ORGfj/gLFS4QvTc7yRhNmxJGkcRupzvaCvIpsmY61lcKRsvUFaIjOpN/
	 faK5zmRtjW1mSi6K/xIhp0TeWDf5IJj8lS6v6Jo6nkTyjLtkndz774oE0J6ziMl9SH
	 c4sO8qRd8elly/mqcoSzm5o8qgNVbUioDvKjrQTP/2q6+5BtoUu6P50rvuUxxkbkPu
	 lWPViQ9d+nypA==
Message-ID: <308624fd-f62f-47fe-a615-69df0a8d270d@kernel.org>
Date: Thu, 27 Jun 2024 08:52:47 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: dt-bindings: Add Sony IMX728
To: Spencer Hill <shill@d3engineering.com>, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240626211529.2068473-1-shill@d3engineering.com>
 <20240626211529.2068473-3-shill@d3engineering.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240626211529.2068473-3-shill@d3engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/06/2024 23:15, Spencer Hill wrote:
> Add bindings for Sony IMX728.
> 
> Signed-off-by: Spencer Hill <shill@d3engineering.com>

Since this was not tested, limited review follows:

> ---
>  .../bindings/media/i2c/sony,imx728.yaml       | 78 +++++++++++++++++++

Bindings are before users.

>  MAINTAINERS                                   |  9 +++
>  2 files changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml
> new file mode 100644
> index 000000000000..613042ab5abe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/sony,imx728.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony IMX728 Camera Sensor
> +
> +maintainers:
> +  - Spencer Hill <shill@d3engineering.com>
> +
> +description: |-

Do not need '|-' unless you need to preserve formatting.

> +  Sony IMX728 camera sensor.

That's duplicating title. Say something more about hardware or just drop.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - sony,imx728
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: inck
> +
> +  xclr-gpios:
> +    maxItems: 1
> +    description:
> +      Specifier for the GPIO connected to the XCLR (System Reset) pin.
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: ../video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        clock-frequency = <400000>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        camera@1a {
> +            compatible = "sony,imx728";
> +            reg = <0x1a>;
> +
> +            clocks = <&fixed_clock>;
> +            clock-names = "inck";
> +
> +            xclr-gpios = <&gpio4 17 GPIO_ACTIVE_LOW>;
> +
> +            port {
> +                camera1: endpoint {
> +                    remote-endpoint = <&vin1a_ep>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ef6be9d95143..34fde35eb0bd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20589,6 +20589,15 @@ T:     git git://linuxtv.org/media_tree.git
>  F:     Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
>  F:     drivers/media/i2c/imx415.c
> 
> +SONY IMX728 SENSOR DRIVER
> +M:     Spencer Hill <shill@d3engineering.com>
> +L:     linux-media@vger.kernel.org
> +S:     Maintained
> +T:     git git://linuxtv.org/media_tree.git

Drop this T:. You do not maintain that git tree so it is already covered
by subsystem entry.

> +F:     Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml
> +F:     drivers/media/i2c/imx728.c

.[ch] or *



Best regards,
Krzysztof


