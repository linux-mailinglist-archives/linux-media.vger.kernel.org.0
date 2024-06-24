Return-Path: <linux-media+bounces-14027-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E9791460A
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 11:17:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C193D1C20826
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 09:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A621130A54;
	Mon, 24 Jun 2024 09:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="InnWyQQh"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6107E2C95
	for <linux-media@vger.kernel.org>; Mon, 24 Jun 2024 09:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719220647; cv=none; b=rP0umI+fJwB1jXRftMUkLNjmmUNMGy9QoOwUcNAhlykrqcK3qgwsDqGPkC2nViyqAVhsJAkvtu9W1F/N7XW13PL9jCyP1WkXPyTSILabnSsV/cNqCH0gZEb8jmNwxJ0jataJmOF7bBkDDKVKMRReuS00re8ivQizwTJrTld485Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719220647; c=relaxed/simple;
	bh=+uqWxqydGNV60BGVNbNUNrlX212BiEPpsR3/wls/bNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RGuc6y/4Z5M6KKXH4/vleg7cjWxWDoLCywl+1FnPN7qTIECIM+gKqaP93Dd1BfTbwgGNH5xb9BpxpxCApasjqw85jeaUptUh6RMH3E2R1fTPupVBSLgY08/knfHal5M7wJUjARGnKuZOCQXDFoE1k656WN7w5fdl4mrQFWBQK9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=InnWyQQh; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1719220615;
 bh=V0z8fSGygfWQrGgys3mw+zwRnCICw2KPF1UnM/mzsfM=;
 b=InnWyQQh9+bvjqeFYz1ea3PKSuz8nwZBn/Q20R/qxh3p/0m1wX0pkaTfUpuDxZxTMPdzveMYW
 0SEc+h23QFDnzGjmPq+BlCBnQ5kMUXZom62ViJ0OOwARXJ1daJCdnqsqAPc+gGotl4Bxz95beqX
 3dTDRRPHQY6MoA/yD+m/i071Xq/e/ltbndp1b7D4NwdH0K+t/6nTt13Z8NyK+/ipPkMtsdz06uu
 h0ZYm0TP1Sj9SjelMufc8hJYj4dRNLz2Bk/Hb4jlYWSyFuTtLaG7CKvvyzNfBW8WG+60eNYW5+N
 OjCZm/yC36tiZbNnDAlZ8C9PwATkUo3qZVS5AGKH25IQ==
Message-ID: <156b5aaf-8b9a-46b9-82c2-d7e32f4899f5@kwiboo.se>
Date: Mon, 24 Jun 2024 11:16:33 +0200
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
 <052f2ea7-2ded-4d39-a513-3a47fee1bf02@gmail.com>
 <e6e2e0f1-0b16-4a3d-ae7b-be5a04d7902b@kwiboo.se> <5790441.DvuYhMxLoT@arisu>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <5790441.DvuYhMxLoT@arisu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 6679397778c9998650f049d1

Hi Detlev and Alex,

On 2024-06-20 15:31, Detlev Casanova wrote:
> Hi Jonas, Alex,
> 
> On Wednesday, June 19, 2024 2:06:40 P.M. EDT Jonas Karlman wrote:
>> Hi Alex,
>>
>> On 2024-06-19 19:19, Alex Bee wrote:
>>> Am 19.06.24 um 17:28 schrieb Jonas Karlman:
>>>> Hi Detlev,
>>>>
>>>> On 2024-06-19 16:57, Detlev Casanova wrote:
>>>>> Add the rkvdec2 Video Decoder to the RK3588s devicetree.
>>>>>
>>>>> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
>>>>> ---
>>>>>
>>>>>   arch/arm64/boot/dts/rockchip/rk3588s.dtsi | 50 +++++++++++++++++++++++
>>>>>   1 file changed, 50 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
>>>>> b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi index
>>>>> 6ac5ac8b48ab..7690632f57f1 100644
>>>>> --- a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
>>>>> +++ b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
>>>>> @@ -2596,6 +2596,16 @@ system_sram2: sram@ff001000 {
>>>>>
>>>>>   		ranges = <0x0 0x0 0xff001000 0xef000>;
>>>>>   		#address-cells = <1>;
>>>>>   		#size-cells = <1>;
>>>>>
>>>>> +
>>>>> +		vdec0_sram: rkvdec-sram@0 {
>>>>> +			reg = <0x0 0x78000>;
>>>>> +			pool;
>>>>> +		};
>>>>> +
>>>>> +		vdec1_sram: rkvdec-sram@1 {
>>>>> +			reg = <0x78000 0x77000>;
>>>>> +			pool;
>>>>> +		};
>>>>>
>>>>>   	};
>>>>>   	
>>>>>   	pinctrl: pinctrl {
>>>>>
>>>>> @@ -2665,6 +2675,46 @@ gpio4: gpio@fec50000 {
>>>>>
>>>>>   			#interrupt-cells = <2>;
>>>>>   		
>>>>>   		};
>>>>>   	
>>>>>   	};
>>>>>
>>>>> +
>>>>> +	vdec0: video-decoder@fdc38100 {
>>>>> +		compatible = "rockchip,rk3588-vdec";
>>>>> +		reg = <0x0 0xfdc38100 0x0 0x500>;
>>>>> +		interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH 0>;
>>>>> +		clocks = <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>, 
> <&cru
>>>>> CLK_RKVDEC0_CA>, +			 <&cru 
> CLK_RKVDEC0_CORE>, <&cru
>>>>> CLK_RKVDEC0_HEVC_CA>;
>>>>> +		clock-names = "axi", "ahb", "cabac", "core", 
> "hevc_cabac";
>>>>> +		assigned-clocks = <&cru ACLK_RKVDEC0>, <&cru 
> CLK_RKVDEC0_CORE>,
>>>>> +				  <&cru CLK_RKVDEC0_CA>, <&cru 
> CLK_RKVDEC0_HEVC_CA>;
>>>>> +		assigned-clock-rates = <800000000>, <600000000>,
>>>>> +				       <600000000>, <1000000000>;
>>>>> +		resets = <&cru SRST_A_RKVDEC0>, <&cru SRST_H_RKVDEC0>, 
> <&cru
>>>>> SRST_RKVDEC0_CA>, +			 <&cru 
> SRST_RKVDEC0_CORE>, <&cru
>>>>> SRST_RKVDEC0_HEVC_CA>;
>>>>> +		reset-names = "rst_axi", "rst_ahb", "rst_cabac",
>>>>> +			      "rst_core", "rst_hevc_cabac";
>>>>> +		power-domains = <&power RK3588_PD_RKVDEC0>;
>>>>> +		sram = <&vdec0_sram>;
>>>>> +		status = "okay";
>>>>> +	};
>>>>> +
>>>>> +	vdec1: video-decoder@fdc40100 {
>>>>> +		compatible = "rockchip,rk3588-vdec";
>>>>> +		reg = <0x0 0xfdc40100 0x0 0x500>;
>>>>> +		interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH 0>;
>>>>> +		clocks = <&cru ACLK_RKVDEC1>, <&cru HCLK_RKVDEC1>, 
> <&cru
>>>>> CLK_RKVDEC1_CA>, +			 <&cru 
> CLK_RKVDEC1_CORE>, <&cru
>>>>> CLK_RKVDEC1_HEVC_CA>;
>>>>> +		clock-names = "axi", "ahb", "cabac", "core", 
> "hevc_cabac";
>>>>> +		assigned-clocks = <&cru ACLK_RKVDEC1>, <&cru 
> CLK_RKVDEC1_CORE>,
>>>>> +				  <&cru CLK_RKVDEC1_CA>, <&cru 
> CLK_RKVDEC1_HEVC_CA>;
>>>>> +		assigned-clock-rates = <800000000>, <600000000>,
>>>>> +				       <600000000>, <1000000000>;
>>>>> +		resets = <&cru SRST_A_RKVDEC1>, <&cru SRST_H_RKVDEC1>, 
> <&cru
>>>>> SRST_RKVDEC1_CA>, +			 <&cru 
> SRST_RKVDEC1_CORE>, <&cru
>>>>> SRST_RKVDEC1_HEVC_CA>;
>>>>> +		reset-names = "rst_axi", "rst_ahb", "rst_cabac",
>>>>> +			      "rst_core", "rst_hevc_cabac";
>>>>> +		power-domains = <&power RK3588_PD_RKVDEC1>;
>>>>> +		sram = <&vdec1_sram>;
>>>>> +		status = "okay";
>>>>> +	};
>>>>
>>>> This is still missing the iommus, please add the iommus, they should be
>>>>
>>>> supported/same as the one used for e.g. VOP2:
>>>>    compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
>>>>
>>>> The VOP2 MMUs does have one extra mmu_cfg_mode flag in AUTO_GATING,
>>>> compared to the VDPU381 MMUs, however only the AV1D MMU should be
>>>> special on RK3588.
>>>>
>>>> Please add the iommus :-)
>>>
>>> When looking add the vendor DT/iommu driver I'm seeing serval quirks
>>> applied for vdec's iommus. Since it's rightly frowned upon adding such
>>> boolean-quirk-properties to upstream devicetrees, we'd at least need
>>> additional (fallback-) compatibles, even if it works with the iommu driver
>>> as is (what I doubt, but haven't tested). We need to be able to apply
>>> those
>>> quirks later without changing the devicetree (as usual) and I'm sure RK
>>> devs haven't added these quirks for the personal amusement.
>>
>> Based on what I investigated the hw should work similar, and the quirks
>> mostly seem related to optimizations and sw quirks, like do not zap each
>> line, keep it alive even when pm runtime say it is not in use and other
>> quirks that seem to be more of sw nature on how to best utilize the hw.
> 
> I did some testing with the IOMMU but unfortunately, I'm only getting page 
> fault errors. This may be something I'm doing wrong, but it clearly needs more 
> investigation.

I re-tested and the addition of sram seem to now cause page faults, the
sram also need to be mapped in the iommu.

However, doing more testing revealed that use of iommu present the same
issue as seen with hevc on rk3399, after a fail fluster tests continue
to fail until a reset.

Seeing how this issue was very similar I re-tested on rk3399 without
iommu and cma=1G and could observe that there was no longer any need to
reset after a failed test. Interestingly the score also went up from
135 to 137/147.

Digging some more revealed that the iommu also is reset during the
internal rkvdec soft reset on error, leaving the iommu with dte_addr=0
and paging in disabled state.

Ensuring that the iommu was reconfigured after a failure fixed the issue
observed on rk3399 and I now also get 137/147 hevc fluster score using
the iommu.

Will send out a rkvdec hevc v2 series after some more testing.

Guessing there is a similar need to reconfigure iommu on rk3588, and my
initial tests also showed promising result, however more tests are
needed.

Regards,
Jonas

> 
>>> If Detlev says
>>> iommu is out of scope for this series (which is valid), I'd say it's fine
>>> to leave them out for now (as no binding exists) and the HW works
>>> (obviously) fine without them.
>>
>> Sure, use of MMU can be added later.
> 
> I'd rather go for that for now. I'll add that IMMU support is missing in the 
> TODO file.
> 
>> Regards,
>> Jonas
>>
>>>> Regards,
>>>> Jonas
>>>>
>>>>>   };
>>>>>   
>>>>>   #include "rk3588s-pinctrl.dtsi"
> 


