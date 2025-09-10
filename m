Return-Path: <linux-media+bounces-42199-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF14CB5161B
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 13:50:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8351D467D3A
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 11:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44B9830F554;
	Wed, 10 Sep 2025 11:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fTUmsG5H"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871D12797B8;
	Wed, 10 Sep 2025 11:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757505030; cv=none; b=sjc/CwCaSr9FDbEo5vTCjz31+j4b/aBtkZc13UlbaW9Q93AFfRVvwEIE1w4mpR0NwGBFQFDkyfko1G6PrwrRKnfMTZx2SPrjTcXeh2KHdPt5ijFjOCmuIYrKYBKENH/KidWDGnLShiyuXGLV1NpbGhWjZ+0cYoQdSumTty950fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757505030; c=relaxed/simple;
	bh=Mqve2GlzuCnytDpGTk9tHKkadC70O5DHUUGd7vf/G5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S5Soh6kXA3ZNM8PUGzcedh0FF1UVR94qR7L1rSTqa6VAC9yUnkUrpB7DnEB3NuEjW6L144lyAyuCpX5v7cOw43URuPlNJWAUHfmr/Fng+rmKymwrR3mYyYE92ursXSGI2yIoTUEpJ6i/5MXZpdHXno1sHOZBypcu++85H1EE7TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fTUmsG5H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D60CC4CEF0;
	Wed, 10 Sep 2025 11:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757505030;
	bh=Mqve2GlzuCnytDpGTk9tHKkadC70O5DHUUGd7vf/G5w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fTUmsG5HDreIpInwmgyZdNcXNx2hqdqP6qfXcPywMRX9Hj1Ru3YkS7n6GPpXECYdz
	 mFiuMbqFopUta/wM3P2gMcyok8tOMih3woSxLB6BF5dYcTlFIdzJlt9VAM39M8INeW
	 q3WQNOdElVDgMoJIXXm6ods1NWvC8/TiEILn0nCvEgWsszNEZztNf4jjcr1RGZjb9V
	 Z+k17mqFFVTAB1oaWfdLYkNc80vZbv9dNAG4giobT4C0vwmBRkMbzG9jv4mvAhmjVB
	 T5bHSH4zByLazl7SvyqpVs6FmFz7CIkmWrgZR499DYw2K441qsihyB/+ffKFQcP/Yu
	 3lWFU8FQ008xw==
Message-ID: <c6c80870-386b-473d-b643-bcd64c86c692@kernel.org>
Date: Wed, 10 Sep 2025 13:50:23 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: leds: add generic LED consumer
 documentation
To: Aleksandrs Vinarskis <alex@vinarskis.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
 Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Daniel Thompson <danielt@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 threeway@gmail.com, Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20250910-leds-v4-0-1fc320488233@vinarskis.com>
 <20250910-leds-v4-1-1fc320488233@vinarskis.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20250910-leds-v4-1-1fc320488233@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Aleksandrs,

Thank you for your continued work on this.

One small remark below.

On 10-Sep-25 1:07 PM, Aleksandrs Vinarskis wrote:
> Introduce common generic led consumer binding, where consumer defines
> led(s) by phandle, as opposed to trigger-source binding where the
> trigger source is defined in led itself.
> 
> Add already used in some schemas 'leds' parameter which expects
> phandle-array. Additionally, introduce 'led-names' which could be used
> by consumers to map LED devices to their respective functions.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
>  .../devicetree/bindings/leds/leds-consumer.yaml    | 67 ++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-consumer.yaml b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..045b7a4fcd3bdcfb19a02fe4435b40445c168115
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-consumer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common leds consumer
> +
> +maintainers:
> +  - Aleksandrs Vinarskis <alex@vinarskis.com>
> +
> +description:
> +  Some LED defined in DT are required by other DT consumers, for example
> +  v4l2 subnode may require privacy or flash LED. Unlike trigger-source
> +  approach which is typically used as 'soft' binding, referencing LED
> +  devices by phandle makes things simpler when 'hard' binding is desired.
> +
> +  Document LED properties that its consumers may define.
> +
> +select: true
> +
> +properties:
> +  leds:
> +    oneOf:
> +      - type: object
> +      - $ref: /schemas/types.yaml#/definitions/phandle-array
> +        description:
> +          A list of LED device(s) required by a particular consumer.
> +        items:
> +          maxItems: 1
> +
> +  led-names:
> +    description:
> +      A list of device name(s). Used to map LED devices to their respective
> +      functions, when consumer requires more than one LED.
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/leds/common.h>
> +
> +    leds {
> +        compatible = "gpio-leds";
> +
> +        privacy_led: privacy-led {
> +            color = <LED_COLOR_ID_RED>;
> +            default-state = "off";
> +            function = LED_FUNCTION_INDICATOR;
> +            gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
> +        };
> +    };
> +
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      v4l2_node: camera@36 {
> +        reg = <0x36>;
> +
> +        leds = <&privacy_led>;
> +        led-names = "privacy-led";

This should probable be:

        led-names = "privacy";

Now without the "-led".

Regards,

Hans



