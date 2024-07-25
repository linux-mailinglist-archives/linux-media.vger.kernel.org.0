Return-Path: <linux-media+bounces-15328-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADF893BC96
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 08:36:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A2011F220CA
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 06:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 265C916D4C3;
	Thu, 25 Jul 2024 06:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZiOKlIWQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE4D1CA8A;
	Thu, 25 Jul 2024 06:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721889357; cv=none; b=e0MqbxnE+R0plcsg5BHkyLkaHkPHDRMWbjVNcs0hr0qqeGqBqDyelvPxEDEg0qf5wAguBoyfrcDhEZ6FTFeGvXe0IouFe5aXb7ceK+ROzbPBYPB4iC/o7sCM4coCeveRAJdr9CAwyf6rpGy7smSxZ5uRUimeUMyv5FNcQuqkZBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721889357; c=relaxed/simple;
	bh=e+vAu011Q2XaPgxR1bgL1eB2JgNr0fymJeAhB9c8ogo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZHRdLuA0952mGjn3Xgd53QoqO6f+Z7yGnEt/Spo2MZiiCKxmVVMsl0+zS0yAptKtSe4SxYUgD0I3ApEHt06srrlLJycxs/xtR54gvE4PifOwTx8Hb1ZZPXlgwZ4Le8vsHfSL/nKiMhTJWK1rInHGK+OXq1mN6YwlSScCn22P354=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZiOKlIWQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40BAEC116B1;
	Thu, 25 Jul 2024 06:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721889357;
	bh=e+vAu011Q2XaPgxR1bgL1eB2JgNr0fymJeAhB9c8ogo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZiOKlIWQVO8o6Db+DNWg6JtImhxpWRcPuL0iVEfgUaMNBq/HoHubwhNCdm5T3/Kup
	 nvZgJXHtgfMWyNJ5lNXIoSSUMSFeHuxaBxB066ViFXG7YAaQwSW1/GIXjZ2roPo1/r
	 aRJtMKv8emNFr2LlumDRvjIW+JpKeRwf81MOZAvx07SEX1bU6Hq/il0g6sFZbMk4oQ
	 KQYLMRxrEiUxZick4Mb+a4gNiS7YIdHnT5DOmnMozd4le1FSBuCJqNOH4re2JwtvrV
	 JTaEGv1nFBS1HvtnZeufMFnyRvp99GNEE78cEgBM0bScYXODE7NGPkSpuXCqycSS90
	 RLTgsWvPOR+vg==
Message-ID: <51099628-b820-45cc-8af5-5cfa604736a2@kernel.org>
Date: Thu, 25 Jul 2024 08:35:47 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] dt-bindings: media: Document bindings for HDMI RX
 Controller
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <80090f6e-7bc8-422a-bb2a-0c0a4abf32f0@yandex.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/07/2024 15:20, Johan Jonker wrote:
> 
>>
>> Where did you learn that? Having non-SoC specific generic fallback
>> compatibles is pretty much standard throughout the kernel. See for
>> example these RK3588 DesignWare compatibles:
>>
>> Synopsys Serial Controller:
>>     Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
>>     compatible = "rockchip,rk3588-uart", "snps,dw-apb-uart";
> 
> Compatible method #2:
> 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
> 
>>
>> Synopsys USB3 Controller:
>>     Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml
>>     compatible = "rockchip,rk3588-dwc3", "snps,dwc3";
> 
> Compatible method #2:
> 	{
> 		.compatible = "snps,dwc3"
> 	},
> 
>>
>> Synopsys Ethernet Controller:
>>     Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>     compatible = "rockchip,rk3588-gmac", "snps,dwmac-4.20a";
> 
> Compatible method #1:
> 	{ .compatible = "rockchip,rk3588-gmac", .data = &rk3588_ops },
> 
> 	    of_device_is_compatible(np, "snps,dwmac-4.20a") ||
> 
>>
>> Synsopsys SATA Controller:
>>     Documentation/devicetree/bindings/ata/rockchip,dwc-ahci.yaml
>>     compatible = "rockchip,rk3588-dwc-ahci", "snps,dwc-ahci"
> 
> Compatible method #2:
> 	{ .compatible = "snps,dwc-ahci", &ahci_dwc_plat },
> 
>>
>> It's also not specific to Synopsys (but RK3588 has a lot of Synopsys
>> design incl. the HDMI-RX IP currently worked on by Shreeya). Here
>> are some other examples:
>>
>> ARM Mali GPU:
>>     Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
>>     compatible = "rockchip,rk3588-mali", "arm,mali-valhall-csf";
> 
> Should be compatible method #2:
> 	{ .compatible = "rockchip,rk3588-mali" },
> 	{ .compatible = "arm,mali-valhall-csf" },
> 
> This is wrong!

Except that it is pointless and redundant, why is it wrong? You did not
bring any argument, except "will trigger 2 probes" which is clearly false.

> Each strings will trigger a probe.

What? That's not true.

> The string "rockchip,rk3588-mali" should be removed.
> 
> Review was done by Collabora people and without including the Rockchip mail list.
> https://patchwork.freedesktop.org/patch/msgid/20240229162230.2634044-12-boris.brezillon@collabora.com
> 
> Could someone look at this and test.

No need, just read how device matching and probing works...




Best regards,
Krzysztof


