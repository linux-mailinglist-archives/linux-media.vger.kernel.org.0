Return-Path: <linux-media+bounces-15366-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3400693D958
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2024 21:56:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A680B1F23ECE
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2024 19:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D47731304A2;
	Fri, 26 Jul 2024 19:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="BVw4wawU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [167.172.40.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCE821364
	for <linux-media@vger.kernel.org>; Fri, 26 Jul 2024 19:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=167.172.40.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722023754; cv=none; b=JqWBntfAp2AlvFPhBvK2893hqfIfwixqlEe1zQRwwG6mu9WDhH73fJfsnowcu/oMXvqSIAU3+nllAViwVHKPUFsK41tooui2LG0wXuf75QDLonqsqPnx/CiVQXFnSGIOjMdhZgt/5txEBNytEHYjgAnzrZorHygQAqpIWRCMx58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722023754; c=relaxed/simple;
	bh=jUxzW/eISqOpiBVr30pQZVVtykzlvo8h4zWQeImEN0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=txxkWzGlRVAS5MfCIZ5n/fU6HJ94DdxXXzlMqdWs1/PFD3OZzqPUdAbCgFxFdz8AGPf7l7X+b1Vgr3ZCUv2bWPrlxpFFuqt+4J1307ShGlQt1OrInjYy289ksp9/O7z+x0zDb4XjGMmqcae7K1axVcLGne1VLGXaF+xVAWZ+hGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=BVw4wawU; arc=none smtp.client-ip=167.172.40.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1722023716;
 bh=8Q1Sz4i2dNHc/6tQGm+set8ubAONMQllV0779TpuRX0=;
 b=BVw4wawUSz+IG9WCwJYQB9sbPZyyzROf5y1sbPxY9sTTbSL0lKK/gg0LsTS0WOtC6kPUR1m32
 lM/kHoYPrr6j7OqmM0Z8UbX3ueDi0U+zJtSciNo3IazzU4xgAd0XFu09ndpoMf40YLpslHggoGo
 bGR0pYnZ6f6NnPdWu4+ahd8Q1AHHUJbqTaQWO/KklRS4tw0GIW9qox/NyUDYn+Rn38QveNMFw0T
 i9fX2aHXXqoK75987PrPV4DNsNp/wTPF6dIMIDoc8LNDlu/OPKWqhz5nAE29lP+Io4zw+VuHWrK
 92FV6go6mB6xPJFhbBdw8Z/SNIaDpX+mGGKE49NRPsow==
Message-ID: <fd35532b-d69e-49bc-a46e-61a7b6a93971@kwiboo.se>
Date: Fri, 26 Jul 2024 21:55:07 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: rockchip: Add rkvdec2 Video Decoder on
 rk3588(s)
To: Detlev Casanova <detlev.casanova@collabora.com>, Alex Bee
 <knaerzche@gmail.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>, Dragan Simic
 <dsimic@manjaro.org>, Diederik de Haas <didi.debian@cknow.org>, Andy Yan
 <andy.yan@rock-chips.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Almeida <daniel.almeida@collabora.com>, Paul Kocialkowski
 <paul.kocialkowski@bootlin.com>, Nicolas Dufresne
 <nicolas.dufresne@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240619150029.59730-1-detlev.casanova@collabora.com>
 <4356151.ejJDZkT8p0@arisu> <689aec72-f777-4122-a332-02009fbf0b3b@kwiboo.se>
 <6070053.DvuYhMxLoT@arisu>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <6070053.DvuYhMxLoT@arisu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 167.172.40.54
X-ForwardEmail-ID: 66a3ff22df62d509e165a502

Hi Detlev,

On 2024-07-26 17:26, Detlev Casanova wrote:
> Hi Jonas !
> 
> On Thursday, June 27, 2024 6:39:36 P.M. EDT Jonas Karlman wrote:
>> Hi Datlev,
>>
>> On 2024-06-27 22:56, Detlev Casanova wrote:
>>> Hi Jonas,
>>>
>>> On Monday, June 24, 2024 5:16:33 A.M. EDT Jonas Karlman wrote:
>>>> Hi Detlev and Alex,
>>>>
>>>> On 2024-06-20 15:31, Detlev Casanova wrote:
>>>>> Hi Jonas, Alex,
>>>>>
>>>>> On Wednesday, June 19, 2024 2:06:40 P.M. EDT Jonas Karlman wrote:
>>>>>> Hi Alex,
>>>>>>
>>>>>> On 2024-06-19 19:19, Alex Bee wrote:
>>>>>>> Am 19.06.24 um 17:28 schrieb Jonas Karlman:
>>>>>>>> Hi Detlev,
>>>>>>>>
>>>>>>>> On 2024-06-19 16:57, Detlev Casanova wrote:
>>>>>>>>> Add the rkvdec2 Video Decoder to the RK3588s devicetree.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
>>>>>>>>> ---
>>>>>>>>>
>>>>>>>>>   arch/arm64/boot/dts/rockchip/rk3588s.dtsi | 50
>>>>>>>>>   +++++++++++++++++++++++
>>>>>>>>>   1 file changed, 50 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
>>>>>>>>> b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi index
>>>>>>>>> 6ac5ac8b48ab..7690632f57f1 100644
>>>>>>>>> --- a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
>>>>>>>>> +++ b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
>>>>>>>>> @@ -2596,6 +2596,16 @@ system_sram2: sram@ff001000 {
>>>>>>>>>
>>>>>>>>>   		ranges = <0x0 0x0 0xff001000 0xef000>;
>>>>>>>>>   		#address-cells = <1>;
>>>>>>>>>   		#size-cells = <1>;
>>>>>>>>>
>>>>>>>>> +
>>>>>>>>> +		vdec0_sram: rkvdec-sram@0 {
>>>>>>>>> +			reg = <0x0 0x78000>;
>>>>>>>>> +			pool;
>>>>>>>>> +		};
>>>>>>>>> +
>>>>>>>>> +		vdec1_sram: rkvdec-sram@1 {
>>>>>>>>> +			reg = <0x78000 0x77000>;
>>>>>>>>> +			pool;
>>>>>>>>> +		};
>>>>>>>>>
>>>>>>>>>   	};
>>>>>>>>>   	
>>>>>>>>>   	pinctrl: pinctrl {
>>>>>>>>>
>>>>>>>>> @@ -2665,6 +2675,46 @@ gpio4: gpio@fec50000 {
>>>>>>>>>
>>>>>>>>>   			#interrupt-cells = <2>;
>>>>>>>>>   		
>>>>>>>>>   		};
>>>>>>>>>   	
>>>>>>>>>   	};
>>>>>>>>>
>>>>>>>>> +
>>>>>>>>> +	vdec0: video-decoder@fdc38100 {
>>>>>>>>> +		compatible = "rockchip,rk3588-vdec";
>>>>>>>>> +		reg = <0x0 0xfdc38100 0x0 0x500>;
>>>>>>>>> +		interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH 0>;
>>>>>>>>> +		clocks = <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>,
>>>>>
>>>>> <&cru
>>>>>
>>>>>>>>> CLK_RKVDEC0_CA>, +			 <&cru
>>>>>
>>>>> CLK_RKVDEC0_CORE>, <&cru
>>>>>
>>>>>>>>> CLK_RKVDEC0_HEVC_CA>;
>>>>>>>>> +		clock-names = "axi", "ahb", "cabac", "core",
>>>>>
>>>>> "hevc_cabac";
>>>>>
>>>>>>>>> +		assigned-clocks = <&cru ACLK_RKVDEC0>, <&cru
>>>>>
>>>>> CLK_RKVDEC0_CORE>,
>>>>>
>>>>>>>>> +				  <&cru CLK_RKVDEC0_CA>, <&cru
>>>>>
>>>>> CLK_RKVDEC0_HEVC_CA>;
>>>>>
>>>>>>>>> +		assigned-clock-rates = <800000000>, <600000000>,
>>>>>>>>> +				       <600000000>, <1000000000>;
>>>>>>>>> +		resets = <&cru SRST_A_RKVDEC0>, <&cru SRST_H_RKVDEC0>,
>>>>>
>>>>> <&cru
>>>>>
>>>>>>>>> SRST_RKVDEC0_CA>, +			 <&cru
>>>>>
>>>>> SRST_RKVDEC0_CORE>, <&cru
>>>>>
>>>>>>>>> SRST_RKVDEC0_HEVC_CA>;
>>>>>>>>> +		reset-names = "rst_axi", "rst_ahb", "rst_cabac",
>>>>>>>>> +			      "rst_core", "rst_hevc_cabac";
>>>>>>>>> +		power-domains = <&power RK3588_PD_RKVDEC0>;
>>>>>>>>> +		sram = <&vdec0_sram>;
>>>>>>>>> +		status = "okay";
>>>>>>>>> +	};
>>>>>>>>> +
>>>>>>>>> +	vdec1: video-decoder@fdc40100 {
>>>>>>>>> +		compatible = "rockchip,rk3588-vdec";
>>>>>>>>> +		reg = <0x0 0xfdc40100 0x0 0x500>;
>>>>>>>>> +		interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH 0>;
>>>>>>>>> +		clocks = <&cru ACLK_RKVDEC1>, <&cru HCLK_RKVDEC1>,
>>>>>
>>>>> <&cru
>>>>>
>>>>>>>>> CLK_RKVDEC1_CA>, +			 <&cru
>>>>>
>>>>> CLK_RKVDEC1_CORE>, <&cru
>>>>>
>>>>>>>>> CLK_RKVDEC1_HEVC_CA>;
>>>>>>>>> +		clock-names = "axi", "ahb", "cabac", "core",
>>>>>
>>>>> "hevc_cabac";
>>>>>
>>>>>>>>> +		assigned-clocks = <&cru ACLK_RKVDEC1>, <&cru
>>>>>
>>>>> CLK_RKVDEC1_CORE>,
>>>>>
>>>>>>>>> +				  <&cru CLK_RKVDEC1_CA>, <&cru
>>>>>
>>>>> CLK_RKVDEC1_HEVC_CA>;
>>>>>
>>>>>>>>> +		assigned-clock-rates = <800000000>, <600000000>,
>>>>>>>>> +				       <600000000>, <1000000000>;
>>>>>>>>> +		resets = <&cru SRST_A_RKVDEC1>, <&cru SRST_H_RKVDEC1>,
>>>>>
>>>>> <&cru
>>>>>
>>>>>>>>> SRST_RKVDEC1_CA>, +			 <&cru
>>>>>
>>>>> SRST_RKVDEC1_CORE>, <&cru
>>>>>
>>>>>>>>> SRST_RKVDEC1_HEVC_CA>;
>>>>>>>>> +		reset-names = "rst_axi", "rst_ahb", "rst_cabac",
>>>>>>>>> +			      "rst_core", "rst_hevc_cabac";
>>>>>>>>> +		power-domains = <&power RK3588_PD_RKVDEC1>;
>>>>>>>>> +		sram = <&vdec1_sram>;
>>>>>>>>> +		status = "okay";
>>>>>>>>> +	};
>>>>>>>>
>>>>>>>> This is still missing the iommus, please add the iommus, they should
>>>>>>>> be
>>>>>>>>
>>>>>>>> supported/same as the one used for e.g. VOP2:
>>>>>>>>    compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
>>>>>>>>
>>>>>>>> The VOP2 MMUs does have one extra mmu_cfg_mode flag in AUTO_GATING,
>>>>>>>> compared to the VDPU381 MMUs, however only the AV1D MMU should be
>>>>>>>> special on RK3588.
>>>>>>>>
>>>>>>>> Please add the iommus :-)
>>>>>>>
>>>>>>> When looking add the vendor DT/iommu driver I'm seeing serval quirks
>>>>>>> applied for vdec's iommus. Since it's rightly frowned upon adding such
>>>>>>> boolean-quirk-properties to upstream devicetrees, we'd at least need
>>>>>>> additional (fallback-) compatibles, even if it works with the iommu
>>>>>>> driver
>>>>>>> as is (what I doubt, but haven't tested). We need to be able to apply
>>>>>>> those
>>>>>>> quirks later without changing the devicetree (as usual) and I'm sure
>>>>>>> RK
>>>>>>> devs haven't added these quirks for the personal amusement.
>>>>>>
>>>>>> Based on what I investigated the hw should work similar, and the quirks
>>>>>> mostly seem related to optimizations and sw quirks, like do not zap
>>>>>> each
>>>>>> line, keep it alive even when pm runtime say it is not in use and other
>>>>>> quirks that seem to be more of sw nature on how to best utilize the hw.
>>>>>
>>>>> I did some testing with the IOMMU but unfortunately, I'm only getting
>>>>> page
>>>>> fault errors. This may be something I'm doing wrong, but it clearly
>>>>> needs
>>>>> more investigation.
>>>>
>>>> I re-tested and the addition of sram seem to now cause page faults, the
>>>> sram also need to be mapped in the iommu.
>>>>
>>>> However, doing more testing revealed that use of iommu present the same
>>>> issue as seen with hevc on rk3399, after a fail fluster tests continue
>>>> to fail until a reset.
>>>>
>>>> Seeing how this issue was very similar I re-tested on rk3399 without
>>>> iommu and cma=1G and could observe that there was no longer any need to
>>>> reset after a failed test. Interestingly the score also went up from
>>>> 135 to 137/147.
>>>>
>>>> Digging some more revealed that the iommu also is reset during the
>>>> internal rkvdec soft reset on error, leaving the iommu with dte_addr=0
>>>> and paging in disabled state.
>>>>
>>>> Ensuring that the iommu was reconfigured after a failure fixed the issue
>>>> observed on rk3399 and I now also get 137/147 hevc fluster score using
>>>> the iommu.
>>>>
>>>> Will send out a rkvdec hevc v2 series after some more testing.
>>>>
>>>> Guessing there is a similar need to reconfigure iommu on rk3588, and my
>>>> initial tests also showed promising result, however more tests are
>>>> needed.
>>>
>>> I did some testing with the IOMMU. The good news is that it now works with
>>> the SRAM.
>>
>> Great, I did not look into SRAM at all, just replaced sram prop with iommus
>> for my tests, so great that you found a way to make it work with the iommu
>> :-)
>>> I am also able to hack the iommu driver to force a reset in case of an
>>> error in the decoder. I'm not sure how to implement that with the IOMMU
>>> kernel API though.
>>
>> I am planning on sending something along the way of this as an RFC:
>>
>> https://github.com/Kwiboo/linux-rockchip/compare/6da640232631...bf332524d880
>>
>> If we re-configure and re-enable the iommu just before next decoding run
>> after a decoding has failed seem to resolve any issue I have seen, have
>> mainly been tested with rkvdec and HEVC on RK3399/RK3328. On RK3588 this
>> also seemed to work, at least when I tested earlier this week.
>>
>>> Another issue is that resetting the iommu will drop all buffer addresses
>>> of
>>> other decoding contexts that may be running in parallel.
>>
>> I do not think we need/should reset the iommu, we just need to deal with
>> the fact that the rkvdec will reset and disable use of the mmu when it
>> reset itself.
>>
>>> I *think* that the downstream mpp remaps the buffers in the iommu for each
>>> frame, but I'm not sure about that either.
>>
>> As long as a frame can be decoded correctly, the mmu config seem to continue
>> to be valid and next frame can be decoded.
>>
>>> So running fluster with `-j 1` gives me the expected 129/135 passed tests,
>>> but `-j 8` will start failing all tests after the first fail (well, first
>>> fail because of decoder error).
>>
>> This was the main issue blocking rkvdec hevc, just re-confgure the mmu
>> after a frame fails to decode seem to resolve this issue.
>>
>> Biggest issue at the moment is how to properly signal iommu subsystem that
>> it should re-configure, I may have abused the flush_iotlb_all ops, since
>> that seemed closest existing hook.
>>
>> Will send an RFC to linux-iommu to collect input on how to best signal
>> iommu subsystem that the mmu has been reset by an external event and now
>> need to be re-configured.
> 
> Do you mind if I go ahead and send your iommu flush_iotlb_all patch upstream to 
> start the discussion ? I'd love for this patch set to move along and that's 
> kind of a blocker right now.

Sorry for the delay, will try to get something on list this weekend or
early next week.

I have reworked our LibreELEC FFmpeg v4l2-request patches [1] to help
test the iommu change for rkvdec1 hevc, and have now patches that should
be more upstreamable.

Testing the iommu flush with hevc on rkvdec1 has shown that the iommu
change seem to work for most part, however there was still situations
when parallel jobs and/or threads was used with fluster that some
unrelated tests could fail, with a single job it improved hevc score to
137 of 145, so it is an improvement but for perfect multi-stream
decoding hard-reset handling may also be needed in future.

Also running fluster VP9 test suite also cause my RK3399 board to freeze
with a kernel panic in iommu irq handler, have not yet tried to dig any
deeper, if it is an old issue or a new issue due to the new iommu flush.

[1] https://github.com/FFmpeg/FFmpeg/compare/master...Kwiboo:FFmpeg:v4l2request-2024-v2

Regards,
Jonas

> 
> Detlev.
> 
> 


