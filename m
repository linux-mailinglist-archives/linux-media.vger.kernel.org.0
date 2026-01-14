Return-Path: <linux-media+bounces-50649-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FCFD1D1E2
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 09:31:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FC35302412F
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 08:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A74C937F729;
	Wed, 14 Jan 2026 08:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UqOCUZKI"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59BB37C0FF;
	Wed, 14 Jan 2026 08:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768379444; cv=none; b=fUiPVGF/MvpvmbjsBaPrZn3tUb4IRBYTeojketHe8z7KarhBgh+KTZI3IAnK+5gs3IGHydEe/7Fc+3NHz98u5MhMdGKW9Z8wzvk05em+pGC3fLaIgbsgYc3NAsGmyja2CTcJzdOnIHTHSjFxZsr0y8lDWMKEfF5O74EAESppizM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768379444; c=relaxed/simple;
	bh=6Opzup4huWOVoyyhvbZgVxbNuOQx1MtphG0eLK8H5FQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=oUKX3qKmpUluB5nw+JgU0ZOn/8ZqMN+W7FlLig59Sqr2LGkF7eO5XTKcUaNObcMJxcI0S27PZtyVZEXG79Nrj1ULAStJJ8wMYpYHAfcGqSkSPvwYcQ2r+EIV54cNoocXrL3XmOBMjISm5HXX+hSM6xJIhEF0Kh1QE0i+1NnPBlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UqOCUZKI; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768379436;
	bh=6Opzup4huWOVoyyhvbZgVxbNuOQx1MtphG0eLK8H5FQ=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=UqOCUZKI7QlXcw4E7dI5M17GpiCq9utWKzJ1gnCh1ADEc1mshNXqbYkAQ2rUbl7i6
	 2d1pzddVFjj6Umd5BtqhN7qo8kxnfHXzf9TlDEA8a2EdTjSqZR7WbhVuBx+MYXyZrT
	 ZtSYIdo1hSki0DzVob+FcpnKKSTxXZf50J+E6/ZxixPrtUVsw6W5Rjm4MulSh9KaDT
	 XaZ25JPNV8tdyga9aTIzcufy8lGA9Y+Uv0xMrJyv7LCdgtUtdW2T2Rrg1KBaK7fOxR
	 d3GjNFNGX3pFGOe9bJYyylNb+FPFRWqK52D0ZScbk82DCUf/z8eEsBIoKIRkpr+ag3
	 jBU3ed9eHmtDg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 62E8117E13C3;
	Wed, 14 Jan 2026 09:30:36 +0100 (CET)
Message-ID: <cafdbc5c-7c65-48cb-8115-5b5467bf8e2b@collabora.com>
Date: Wed, 14 Jan 2026 09:30:35 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: Fix I2C bus node names in examples
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Tianping Fang <tianping.fang@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20260114081322.53411-2-krzysztof.kozlowski@oss.qualcomm.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260114081322.53411-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 14/01/26 09:13, Krzysztof Kozlowski ha scritto:
> I2C bus node names are expected to be just "i2c", if there is just one
> such node in given example.  Replace remaining bad examples with
> scripted:
> 
>    git grep -l '\si2c[0-9] {' Documentation/devicetree/ | xargs sed -i -e 's/i2c[0-9] {/i2c {/'
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> 
> Like Rob's commit 20a72af11f41 ("dt-bindings: Fix SPI and I2C bus node
> names in examples"). I checked also for SPI.
> 
> Rebased on Rob's tree - can you pick it up directly? Applies also on
> linux-next, so I do not expect conflicts.
> ---
>   .../bindings/embedded-controller/lenovo,yoga-c630-ec.yaml       | 2 +-
>   Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml   | 2 +-
>   Documentation/devicetree/bindings/usb/ite,it5205.yaml           | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-c630-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-c630-ec.yaml
> index a029b38e8dc0..c88fbd6ad940 100644
> --- a/Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-c630-ec.yaml
> +++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-c630-ec.yaml
> @@ -50,7 +50,7 @@ additionalProperties: false
>   examples:
>     - |+
>       #include <dt-bindings/interrupt-controller/irq.h>
> -    i2c1 {
> +    i2c {
>           clock-frequency = <400000>;
>   
>           #address-cells = <1>;
> diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> index a89f740214f7..dffd23ca4839 100644
> --- a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> @@ -95,7 +95,7 @@ examples:
>       #include <dt-bindings/gpio/gpio.h>
>       #include <dt-bindings/media/video-interfaces.h>
>   
> -    i2c0 {
> +    i2c {
>           #address-cells = <1>;
>           #size-cells = <0>;
>   
> diff --git a/Documentation/devicetree/bindings/usb/ite,it5205.yaml b/Documentation/devicetree/bindings/usb/ite,it5205.yaml
> index 889710733de5..045fcb41ac4b 100644
> --- a/Documentation/devicetree/bindings/usb/ite,it5205.yaml
> +++ b/Documentation/devicetree/bindings/usb/ite,it5205.yaml
> @@ -49,7 +49,7 @@ additionalProperties: false
>   examples:
>     - |
>       #include <dt-bindings/interrupt-controller/irq.h>
> -    i2c2 {
> +    i2c {
>           #address-cells = <1>;
>           #size-cells = <0>;
>   


