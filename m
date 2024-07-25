Return-Path: <linux-media+bounces-15329-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D42893BC9E
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 08:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5943285AAD
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 06:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1AC316D4EB;
	Thu, 25 Jul 2024 06:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d2MVeVms"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440DB5589A;
	Thu, 25 Jul 2024 06:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721889525; cv=none; b=hE4XIRSEfLMr2Cmb8JgCz4Kvh0VyIB62NiD4TCdcArkS8BK3DvVwMa6jvPd8Jrbc8hpS71BSiBU5txfMIYP38rSYqtodTmUkFnJ4hTdigHy14EPTLbJZURDBmssHSeUzE2anoQUHjCcZMvxa4XRaSZcEur0P8q991FB6BRmLED0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721889525; c=relaxed/simple;
	bh=4z3M5ra6xij8S/0Mc5OaE/VUO1NbdtcoPBuP6rQ5rSU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=E310ZZFlnhGpVS02CsCDB5m8yAKCYgxwZcG6CwCTfFRhlhKWa0Dyqpx3TecMJ7v5zj65iQNOghHcLTPVDOT33PW2mRDLrv95rjbaigWBOgYcJKsQjInywNeez74cTYWFPnTVENDHV50h88o4yzX5ApgWTwJVyvDM+/t1n9N8Jl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d2MVeVms; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BB37C116B1;
	Thu, 25 Jul 2024 06:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721889525;
	bh=4z3M5ra6xij8S/0Mc5OaE/VUO1NbdtcoPBuP6rQ5rSU=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=d2MVeVmsZsHr2CSWLEkZn+GcfRyuymWiQ4JexLn+9yvvRvmhd32sxM+qvFakuyObE
	 IGTCtdYQnD1gjN9DmHj2CSM1MxEiG/crDkW2lqSr/WuHi/J/AkNRhBwiTL4jpM8hJX
	 aFCo6H9ulpte5pCJzxpn1nSFW8nf5F8laQhfTFugga7Q53wzTNWU5z68huP9Oh/imC
	 grDqS6BGbDsMUoZibw3Ch+K0cSl9UUfElRkQVuGL5unJEAXkDQWrHVj/14ihn0mEyk
	 C4MGdRZfrBZfbwJaERuOUcly6uEaCxwcD8vguk0tvnEfHd1zvtyxC+gbS+dBzrczCX
	 XIdwUF0DW2gGg==
Message-ID: <b632acf8-ead0-49d4-bf98-1701949ec13a@kernel.org>
Date: Thu, 25 Jul 2024 08:38:34 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] dt-bindings: media: Document bindings for HDMI RX
 Controller
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Johan Jonker <jbx6244@yandex.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Shreeya Patel <shreeya.patel@collabora.com>, heiko@sntech.de,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, jose.abreu@synopsys.com, nelson.costa@synopsys.com,
 shawn.wen@rock-chips.com, nicolas.dufresne@collabora.com,
 hverkuil@xs4all.nl, hverkuil-cisco@xs4all.nl, kernel@collabora.com,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
References: <20240719124032.26852-1-shreeya.patel@collabora.com>
 <20240719124032.26852-3-shreeya.patel@collabora.com>
 <c926b73e-9ee7-4c4f-9c06-761929425468@yandex.com>
 <3328a8-669e6400-1-609f7800@94177214>
 <ae3f574a-256f-4ced-a371-a26255024750@yandex.com>
 <6nzakkvpfodztxh6jnxlhknd7x7ni6agwpguxyqd6gcncedp53@vsk5mnaayfqs>
 <80090f6e-7bc8-422a-bb2a-0c0a4abf32f0@yandex.com>
 <51099628-b820-45cc-8af5-5cfa604736a2@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <51099628-b820-45cc-8af5-5cfa604736a2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/07/2024 08:35, Krzysztof Kozlowski wrote:
> On 24/07/2024 15:20, Johan Jonker wrote:
>>
>>>
>>> Where did you learn that? Having non-SoC specific generic fallback
>>> compatibles is pretty much standard throughout the kernel. See for
>>> example these RK3588 DesignWare compatibles:
>>>
>>> Synopsys Serial Controller:
>>>     Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
>>>     compatible = "rockchip,rk3588-uart", "snps,dw-apb-uart";
>>
>> Compatible method #2:
>> 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
>>
>>>
>>> Synopsys USB3 Controller:
>>>     Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml
>>>     compatible = "rockchip,rk3588-dwc3", "snps,dwc3";
>>
>> Compatible method #2:
>> 	{
>> 		.compatible = "snps,dwc3"
>> 	},
>>
>>>
>>> Synopsys Ethernet Controller:
>>>     Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>>     compatible = "rockchip,rk3588-gmac", "snps,dwmac-4.20a";
>>
>> Compatible method #1:
>> 	{ .compatible = "rockchip,rk3588-gmac", .data = &rk3588_ops },
>>
>> 	    of_device_is_compatible(np, "snps,dwmac-4.20a") ||
>>
>>>
>>> Synsopsys SATA Controller:
>>>     Documentation/devicetree/bindings/ata/rockchip,dwc-ahci.yaml
>>>     compatible = "rockchip,rk3588-dwc-ahci", "snps,dwc-ahci"
>>
>> Compatible method #2:
>> 	{ .compatible = "snps,dwc-ahci", &ahci_dwc_plat },
>>
>>>
>>> It's also not specific to Synopsys (but RK3588 has a lot of Synopsys
>>> design incl. the HDMI-RX IP currently worked on by Shreeya). Here
>>> are some other examples:
>>>
>>> ARM Mali GPU:
>>>     Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
>>>     compatible = "rockchip,rk3588-mali", "arm,mali-valhall-csf";
>>
>> Should be compatible method #2:
>> 	{ .compatible = "rockchip,rk3588-mali" },
>> 	{ .compatible = "arm,mali-valhall-csf" },
>>
>> This is wrong!
> 
> Except that it is pointless and redundant, why is it wrong? You did not
> bring any argument, except "will trigger 2 probes" which is clearly false.
> 
>> Each strings will trigger a probe.
> 
> What? That's not true.

Although if you meant "any string will trigger one probe in total", then
it would be true, so maybe that's what you meant.

But then - what's wrong with this (except needless redundancy)? You did
not bring any argument but keep calling more than once "wrong". So what
is wrong?

Best regards,
Krzysztof


