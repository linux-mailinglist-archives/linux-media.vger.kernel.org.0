Return-Path: <linux-media+bounces-13752-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 044F790F5B6
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 20:07:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A209A283658
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 18:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B218157E91;
	Wed, 19 Jun 2024 18:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="XPlySN/P"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1678157466
	for <linux-media@vger.kernel.org>; Wed, 19 Jun 2024 18:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718820429; cv=none; b=WDNRQ3+jvsfz3pq02xKLcjTLXhrfEEhISD5wpYGytzNXc+xjMLWJIVF/hge9g7jVggHuGHlP6XLqgb7SXpyKc9vnGNMwVAk239P8zf0sfBPJr5Dg0muKT2abzC1/r2Es2tbaw4TQ75O/ElTnIvuVsYjlGRFYs9EHyscjSBdtFao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718820429; c=relaxed/simple;
	bh=BkLHYQs4IK59lmPyJ6OiHr71hrKs+r7G898hHMuwO0g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ErcpbKxao5vaZbu0cJH9HwMBiHp9J6zYUwidfAeZolx5O7NevcnZJqr4h40ffikqsK1PgysVwkiRIjufjAYnTnJumAc7Rg/fbU2mqmaOOTk2JOZWD6VP/NTlM6peuIuUYkkbXJ4Obg/G/dST5u8QT7XGRzBD5GmnqZckj66sjO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=XPlySN/P; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1718820410;
 bh=XavrKDSs1iLysu/VoOW1lzmFXR6F1ISw3mOM/563aBs=;
 b=XPlySN/P0LWLFvOWOMQW2wRzXOYsLDAVjkBWJIDcdMEoI4bXhIaVR0Dv3Lc1thrBr0E8uDoCm
 9IPbtSRfGhOhLb0gx8p3eH0GNZ2VffBLZhHSvg76EsmEk0L2IC7cTs0mbolKd6GT22seXTiX5JA
 vBsLkkv1aBuwlQPYl3vxtCILM9baa05Agln+9IiF6ns1GAAFvdM5c08XcI6SC/QozgZBVDyr+Wq
 /8a8z4AKJeT5Fm2JMhNKRPDPS7YKsq8Ldr9AUrRFsf4C7VZzHy5ZEj9Hl7/dXRK1NtsGgzlDrRD
 LCDhz0pUWaHQ5GBcKASZAgE83/8VZY6TKDUvwgFrwNgA==
Message-ID: <e6e2e0f1-0b16-4a3d-ae7b-be5a04d7902b@kwiboo.se>
Date: Wed, 19 Jun 2024 20:06:40 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: rockchip: Add rkvdec2 Video Decoder on
 rk3588(s)
To: Alex Bee <knaerzche@gmail.com>, Detlev Casanova
 <detlev.casanova@collabora.com>
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
 <20240619150029.59730-5-detlev.casanova@collabora.com>
 <6e5ddd5c-340d-4474-a490-427a82db4a97@kwiboo.se>
 <052f2ea7-2ded-4d39-a513-3a47fee1bf02@gmail.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <052f2ea7-2ded-4d39-a513-3a47fee1bf02@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 66731e37e29fa10c39ba9bb6

Hi Alex,

On 2024-06-19 19:19, Alex Bee wrote:
> 
> Am 19.06.24 um 17:28 schrieb Jonas Karlman:
>> Hi Detlev,
>>
>> On 2024-06-19 16:57, Detlev Casanova wrote:
>>> Add the rkvdec2 Video Decoder to the RK3588s devicetree.
>>>
>>> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
>>> ---
>>>   arch/arm64/boot/dts/rockchip/rk3588s.dtsi | 50 +++++++++++++++++++++++
>>>   1 file changed, 50 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
>>> index 6ac5ac8b48ab..7690632f57f1 100644
>>> --- a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
>>> +++ b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
>>> @@ -2596,6 +2596,16 @@ system_sram2: sram@ff001000 {
>>>   		ranges = <0x0 0x0 0xff001000 0xef000>;
>>>   		#address-cells = <1>;
>>>   		#size-cells = <1>;
>>> +
>>> +		vdec0_sram: rkvdec-sram@0 {
>>> +			reg = <0x0 0x78000>;
>>> +			pool;
>>> +		};
>>> +
>>> +		vdec1_sram: rkvdec-sram@1 {
>>> +			reg = <0x78000 0x77000>;
>>> +			pool;
>>> +		};
>>>   	};
>>>   
>>>   	pinctrl: pinctrl {
>>> @@ -2665,6 +2675,46 @@ gpio4: gpio@fec50000 {
>>>   			#interrupt-cells = <2>;
>>>   		};
>>>   	};
>>> +
>>> +	vdec0: video-decoder@fdc38100 {
>>> +		compatible = "rockchip,rk3588-vdec";
>>> +		reg = <0x0 0xfdc38100 0x0 0x500>;
>>> +		interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH 0>;
>>> +		clocks = <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>, <&cru CLK_RKVDEC0_CA>,
>>> +			 <&cru CLK_RKVDEC0_CORE>, <&cru CLK_RKVDEC0_HEVC_CA>;
>>> +		clock-names = "axi", "ahb", "cabac", "core", "hevc_cabac";
>>> +		assigned-clocks = <&cru ACLK_RKVDEC0>, <&cru CLK_RKVDEC0_CORE>,
>>> +				  <&cru CLK_RKVDEC0_CA>, <&cru CLK_RKVDEC0_HEVC_CA>;
>>> +		assigned-clock-rates = <800000000>, <600000000>,
>>> +				       <600000000>, <1000000000>;
>>> +		resets = <&cru SRST_A_RKVDEC0>, <&cru SRST_H_RKVDEC0>, <&cru SRST_RKVDEC0_CA>,
>>> +			 <&cru SRST_RKVDEC0_CORE>, <&cru SRST_RKVDEC0_HEVC_CA>;
>>> +		reset-names = "rst_axi", "rst_ahb", "rst_cabac",
>>> +			      "rst_core", "rst_hevc_cabac";
>>> +		power-domains = <&power RK3588_PD_RKVDEC0>;
>>> +		sram = <&vdec0_sram>;
>>> +		status = "okay";
>>> +	};
>>> +
>>> +	vdec1: video-decoder@fdc40100 {
>>> +		compatible = "rockchip,rk3588-vdec";
>>> +		reg = <0x0 0xfdc40100 0x0 0x500>;
>>> +		interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH 0>;
>>> +		clocks = <&cru ACLK_RKVDEC1>, <&cru HCLK_RKVDEC1>, <&cru CLK_RKVDEC1_CA>,
>>> +			 <&cru CLK_RKVDEC1_CORE>, <&cru CLK_RKVDEC1_HEVC_CA>;
>>> +		clock-names = "axi", "ahb", "cabac", "core", "hevc_cabac";
>>> +		assigned-clocks = <&cru ACLK_RKVDEC1>, <&cru CLK_RKVDEC1_CORE>,
>>> +				  <&cru CLK_RKVDEC1_CA>, <&cru CLK_RKVDEC1_HEVC_CA>;
>>> +		assigned-clock-rates = <800000000>, <600000000>,
>>> +				       <600000000>, <1000000000>;
>>> +		resets = <&cru SRST_A_RKVDEC1>, <&cru SRST_H_RKVDEC1>, <&cru SRST_RKVDEC1_CA>,
>>> +			 <&cru SRST_RKVDEC1_CORE>, <&cru SRST_RKVDEC1_HEVC_CA>;
>>> +		reset-names = "rst_axi", "rst_ahb", "rst_cabac",
>>> +			      "rst_core", "rst_hevc_cabac";
>>> +		power-domains = <&power RK3588_PD_RKVDEC1>;
>>> +		sram = <&vdec1_sram>;
>>> +		status = "okay";
>>> +	};
>> This is still missing the iommus, please add the iommus, they should be
>> supported/same as the one used for e.g. VOP2:
>>
>>    compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
>>
>> The VOP2 MMUs does have one extra mmu_cfg_mode flag in AUTO_GATING,
>> compared to the VDPU381 MMUs, however only the AV1D MMU should be
>> special on RK3588.
>>
>> Please add the iommus :-)
> When looking add the vendor DT/iommu driver I'm seeing serval quirks
> applied for vdec's iommus. Since it's rightly frowned upon adding such
> boolean-quirk-properties to upstream devicetrees, we'd at least need
> additional (fallback-) compatibles, even if it works with the iommu driver
> as is (what I doubt, but haven't tested). We need to be able to apply those
> quirks later without changing the devicetree (as usual) and I'm sure RK
> devs haven't added these quirks for the personal amusement.

Based on what I investigated the hw should work similar, and the quirks
mostly seem related to optimizations and sw quirks, like do not zap each
line, keep it alive even when pm runtime say it is not in use and other
quirks that seem to be more of sw nature on how to best utilize the hw.

> If Detlev says
> iommu is out of scope for this series (which is valid), I'd say it's fine
> to leave them out for now (as no binding exists) and the HW works
> (obviously) fine without them.

Sure, use of MMU can be added later.

Regards,
Jonas

> 
>> Regards,
>> Jonas
>>
>>>   };
>>>   
>>>   #include "rk3588s-pinctrl.dtsi"


