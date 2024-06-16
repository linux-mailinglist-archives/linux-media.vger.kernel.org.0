Return-Path: <linux-media+bounces-13321-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2970909CC2
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 11:18:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7AF81C20A41
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 09:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A62CB184114;
	Sun, 16 Jun 2024 09:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="Ltf3uKcD"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [167.172.40.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A75516D4FB
	for <linux-media@vger.kernel.org>; Sun, 16 Jun 2024 09:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=167.172.40.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718529508; cv=none; b=rY2G/tSLUu/c9tJSXusB7oBNZGEqNlMdm230Us5HweSBfhHf9fuvK++KxZK3q/ndFD4t0NMhazgKDdYm+NircU2MDc2xfrPq1VeE1yBIa13dSWsADP0uJw2mjaWDf8P+gIPtJH6Zksv3XO/kdpr1Hl9twpZUQY8AL6OG4nla/gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718529508; c=relaxed/simple;
	bh=ag+2nKDejAdKP/tTF6EOOl6aEisffVKXG/FrSiyZcn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h+0GdSp4QPcVb56LX4hE/1X6+hnlrDXkjQ77Nn3Unj6PTo+goQ4eRgAbR6IeJSr30tzmJhI8xsBj5bFlsQWQuyNavwYMQD1xRDLUkceFuprK4ONbYDO57sWvGdqWGfK0vS89IgzQkqx8pHFCZoEZIu4JcB8jVEStrr/41wwdxc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=Ltf3uKcD; arc=none smtp.client-ip=167.172.40.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1718529464;
 bh=quuud/7bt9D8sRiX3GKp+NZMy2JyHR57uIHev3qjeFs=;
 b=Ltf3uKcDhpLdLINdUS93ApD3HN3oob/51s/ZiX/u/dVjy5WTI9cCiwS8+OFbKZkopaRX/IBXJ
 1lq3I1Z3kt4aLFg4NwUXDDLdNVhw8TXtYNtAQiTSElKV5uv565YcJoHEuf4RuSH53VbK5n0Vkov
 nD6vJXQW7KdJ6BhHDtCf2+DCjyN/x9yUH/2Xkr1RiXB6g81hs+4aOGVLjjdgSSBFDirxgCQzH1r
 ULoE1g8DQUFbLmGmttQbtsxsoVsEB/eCT4+HotfxIk4eTfG2qgASjEynF+Xeg9V0zuLVKa8TeOW
 jgiuzmCDClcKLm+QCVxNq39N/2ZWmBhOG5F5iNOsXCJw==
Message-ID: <f4c140a3-2b11-405c-bfd4-32e50180f6b7@kwiboo.se>
Date: Sun, 16 Jun 2024 11:17:31 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add rkvdec2 Video Decoder on
 rk3588(s)
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>, Dragan Simic
 <dsimic@manjaro.org>, Alexey Charkov <alchark@gmail.com>, Cristian
 Ciocaltea <cristian.ciocaltea@collabora.com>, Diederik de Haas
 <didi.debian@cknow.org>, Andy Yan <andy.yan@rock-chips.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev
References: <20240615015734.1612108-1-detlev.casanova@collabora.com>
 <20240615015734.1612108-4-detlev.casanova@collabora.com>
 <944c4296-8dd2-4ffd-b430-1839ff3a3ed2@kwiboo.se> <3666279.iZASKD2KPV@arisu>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <3666279.iZASKD2KPV@arisu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 167.172.40.54
X-ForwardEmail-ID: 666eadb2b23880544d1fe7f5

Hi Detlev,

On 2024-06-15 21:55, Detlev Casanova wrote:
> On Saturday, June 15, 2024 4:25:27 A.M. EDT Jonas Karlman wrote:
>> Hi Detlev,
>>
>> On 2024-06-15 03:56, Detlev Casanova wrote:
>>> Add the rkvdec2 Video Decoder to the RK3588s devicetree.
>>>
>>> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
>>> ---
>>>
>>>  .../boot/dts/rockchip/rk3588-rock-5b.dts      |  4 ++++
>>>  .../boot/dts/rockchip/rk3588s-orangepi-5.dts  |  4 ++++
>>>  arch/arm64/boot/dts/rockchip/rk3588s.dtsi     | 19 +++++++++++++++++++
>>>  3 files changed, 27 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
>>> b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts index
>>> c551b676860c..965322c24a65 100644
>>> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
>>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
>>> @@ -503,6 +503,10 @@ &pwm1 {
>>>
>>>  	status = "okay";
>>>  
>>>  };
>>>
>>> +&rkvdec0 {
>>> +	status = "okay";
>>> +};
>>
>> Enable of rkvdec0 should probably be split out from the patch that adds
>> the rkvdec0 node to soc dtsi.
> 
> Ack
> 
>> Also why is rkvdec0 only enabled on rock-5b and orangepi-5?
> 
> I only could test on those two but I can enable it on all rk3588 devices.

Because the decoder is an integrated part of the SoC the default should
probably be that the IP is enabled, i.e. no status prop required for the
vdec and related mmu nodes in rk3588s.dtsi.

> 
>>> +
>>>
>>>  &saradc {
>>>  
>>>  	vref-supply = <&avcc_1v8_s0>;
>>>  	status = "okay";
>>>
>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
>>> b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts index
>>> feea6b20a6bf..2828fb4c182a 100644
>>> --- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
>>> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
>>> @@ -321,6 +321,10 @@ typec5v_pwren: typec5v-pwren {
>>>
>>>  	};
>>>  
>>>  };
>>>
>>> +&rkvdec0 {
>>> +	status = "okay";
>>> +};
>>> +
>>>
>>>  &saradc {
>>>  
>>>  	vref-supply = <&avcc_1v8_s0>;
>>>  	status = "okay";
>>>
>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
>>> b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi index
>>> 0fecbf46e127..09672636dcea 100644
>>> --- a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
>>> +++ b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
>>> @@ -3034,6 +3034,9 @@ system_sram2: sram@ff001000 {
>>>
>>>  		ranges = <0x0 0x0 0xff001000 0xef000>;
>>>  		#address-cells = <1>;
>>>  		#size-cells = <1>;
>>
>> Blank line is missing.
>>
>>> +		rkvdec0_sram: rkvdec-sram@0 {
>>> +			reg = <0x0 0x78000>;
>>> +		};
>>>
>>>  	};
>>>  	
>>>  	pinctrl: pinctrl {
>>>
>>> @@ -3103,6 +3106,22 @@ gpio4: gpio@fec50000 {
>>>
>>>  			#interrupt-cells = <2>;
>>>  		
>>>  		};
>>>  	
>>>  	};
>>>
>>> +
>>> +	rkvdec0: video-decoder@fdc38100 {

To match prior generations the symbol should probably be called vdec0.

>>> +		compatible = "rockchip,rk3588-vdec2";
>>> +		reg = <0x0 0xfdc38100 0x0 0x500>;
>>> +		interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH 0>;
>>> +		clocks = <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>, 
> <&cru
>>> CLK_RKVDEC0_CORE>, +			 <&cru 
> CLK_RKVDEC0_CA>, <&cru
>>> CLK_RKVDEC0_HEVC_CA>;
>>> +		clock-names = "axi", "ahb", "core",
>>> +			      "cabac", "hevc_cabac";
>>> +		assigned-clocks = <&cru ACLK_RKVDEC0>, <&cru 
> CLK_RKVDEC0_CORE>,
>>> +				  <&cru CLK_RKVDEC0_CA>, <&cru 
> CLK_RKVDEC0_HEVC_CA>;
>>> +		assigned-clock-rates = <800000000>, <600000000>,
>>> +				       <600000000>, <1000000000>;
>>> +		power-domains = <&power RK3588_PD_RKVDEC0>;
>>
>> iommus and resets should probably be added.
>>
>>> +		status = "disabled";
>>> +	};
>>
>> The iommu node for rkvdec0_mmu seem to be missing, is it not required to
>> be able to use memory >4GiB as decoding buffers?
> 
> I need to check if the current rockchip iommu driver will work for this 
> decoder. I remember that the iommu code for AV1 was a bit different, not sure 
> about this rkvdec.

The device tree should describe the HW not what drivers are capable of.

If there are substantial differences in iommu IP a new compatible should
probably be added for that iommu.

> 
>> I would also consider adding the rkvdec1 node(s), if I am understanding
>> correctly they can both be used in a cluster or completely independent.
> 
> They can be used independently, yes. I'll add rkvdec1 for rk3588 devices 
> (rk3588s only has  1 core)

I do not think that is true, the rk3588s variant should also include two
decoder and two encoder cores.

However, the rk3582/rk3583 variants (rk3588s with one or more bad cores)
may have 0-2 cores working for the decoder and/or encoder.

E.g on my rk3582 boards I have following different ip-state in otp:
- 1 bad cpu core (ip-state: 10 00 00)
- 1 bad decoder core (ip-state: 00 80 00)
- 1 bad encoder core (ip-state: 00 00 04)

The general idea is that bootloader will disable or delete the offending
nodes in the device tree to correctly describe the HW for the OS.

Regards,
Jonas

> 
> Regards,
> Detlev.
> 
>> Also on RK3582/RK3583 one (or both) of the decoder cores may be marked
>> as bad, yet the remaining one can still be used independently. The idea
>> will be that bootloader fixup the DT and disabled/delete-node the bad
>> core(s).
>>
>> Regards,
>> Jonas
>>
>>>  };
>>>  
>>>  #include "rk3588s-pinctrl.dtsi"
> 


