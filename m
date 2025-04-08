Return-Path: <linux-media+bounces-29661-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D0740A814B9
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 20:35:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F12B47B242A
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 18:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7FAE23ED72;
	Tue,  8 Apr 2025 18:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="eJ/pDATx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F368F23E355
	for <linux-media@vger.kernel.org>; Tue,  8 Apr 2025 18:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744137289; cv=none; b=HCJFV6nPlpzr2gEybQyTcCbHXyvpXE+Nq1bBfPxuQyhHjOA1P9iF4x9w8UH/HWvB1V3cWjdntHZZrZFwPAiA2zRT2Q+8cD2jWEytSn99xN4Qs1SzB8VpHxY3DbyfQPC9xEFqnFHWOByUBr/+tko9v72jiTgyk0Py7Ik3jJT3EyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744137289; c=relaxed/simple;
	bh=xITh2gFEFUTwWXLn9kVObVg1+6mqJchucQoh/pEO96g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ciEwi5pTE7BhixHvnsaDn0vGupmxGbmxbyQZEs4BwO0bEwoygdskBpOyZsTO2NGwAcqapVHfAHfPn0tBRZrcMUtMps7SVadkDPDk9M2iBjFRMmXoRygNXyURGJg3tmBUZBmVCHYxEaR7DMmWcISCT9dRo5JavNbZS5f/sFgILEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=eJ/pDATx; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1744137280;
 bh=jH8n5W9FtQCucqwn7kk9UM2XjlBjxjzZZRg7DH4uLLE=;
 b=eJ/pDATx7FPKw/jg+ZIx+YJLmO0z4r9Z0OKt7BXpbiaGvxgnrzY6k8EQLCNxPQxmE4Cn7QbWP
 3G1VLKsX4Q6WDRstXU0H0+/JXGa8Acs8KfZ/7heaQbJcPq1cen/lKBK9sAcbqryw3Qk89kmuzLi
 2oa0Z8BFdV6nM+JqaUODyAEfUGXINUTAEuFMABRHRTX6Wrddk9rNLTGteEhgsTA4CR69mVLEYcM
 skJjdJCAAia3ZNyg3tadXHryuAdBpy2GpdD7ieoqFgQy1pJv5l/+uVg8YMilU1U/D1ZMIYbINug
 jnaCzhKcKBS+aqwmUZUXfsbCQquLZOersQoMr6ZKp1yA==
X-Forward-Email-ID: 67f56c38b078e0f2662e7659
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.0.1
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <c73a32b0-cc58-4d07-a0e5-719e5434adc3@kwiboo.se>
Date: Tue, 8 Apr 2025 20:34:23 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] arm64: dts: rockchip: Add rkvdec2 Video Decoder on
 rk3588(s)
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Niklas Cassel <cassel@kernel.org>, Alexey Charkov <alchark@gmail.com>,
 Dragan Simic <dsimic@manjaro.org>, Jianfeng Liu <liujianfeng1994@gmail.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
 Dmitry Perchanov <dmitry.perchanov@intel.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20250325213303.826925-1-detlev.casanova@collabora.com>
 <20250325213303.826925-7-detlev.casanova@collabora.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250325213303.826925-7-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Detlev,

On 2025-03-25 22:22, Detlev Casanova wrote:
> Add the rkvdec2 Video Decoder to the RK3588s devicetree.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> index c3abdfb04f8f4..636c287b94e0a 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> @@ -1237,6 +1237,70 @@ vepu121_3_mmu: iommu@fdbac800 {
>  		#iommu-cells = <0>;
>  	};
>  
> +	vdec0: video-decoder@fdc38000 {

All other Rockchip decoder/encoder nodes use the video-codec nodename,
e.g. see the av1d related node below. Is there any special reason why
this cannot follow that pattern for nodename consistency?

This was something I tried to bring up in v3 [1], however only the reg
range part was addressed in v4.

My main concern is that I want to send an updated U-Boot RK3582 support
series [2][3] that will need to mark one or both of the two rkvdec cores
as status=fail depending on a value in OTP. This is done in a DT fixup
and uses the nodename for simplicity.

[1] https://lore.kernel.org/r/311770c3-d3ea-4650-ae11-7c278e043d0a@kwiboo.se/
[2] https://patchwork.ozlabs.org/patch/2020972/
[3] https://github.com/Kwiboo/u-boot-rockchip/commit/0d748524aa67ce0debdb87c6e4a0df0f041b1618

> +		compatible = "rockchip,rk3588-vdec";
> +		reg = <0x0 0xfdc38000 0x0 0x100>,
> +		      <0x0 0xfdc38100 0x0 0x500>,
> +		      <0x0 0xfdc38600 0x0 0x100>;
> +		reg-names = "link", "function", "cache";
> +		interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks = <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>, <&cru CLK_RKVDEC0_CA>,
> +			 <&cru CLK_RKVDEC0_CORE>, <&cru CLK_RKVDEC0_HEVC_CA>;
> +		clock-names = "axi", "ahb", "cabac", "core", "hevc_cabac";
> +		assigned-clocks = <&cru ACLK_RKVDEC0>, <&cru CLK_RKVDEC0_CORE>,
> +				  <&cru CLK_RKVDEC0_CA>, <&cru CLK_RKVDEC0_HEVC_CA>;
> +		assigned-clock-rates = <800000000>, <600000000>,
> +				       <600000000>, <1000000000>;
> +		iommus = <&vdec0_mmu>;
> +		power-domains = <&power RK3588_PD_RKVDEC0>;
> +		resets = <&cru SRST_A_RKVDEC0>, <&cru SRST_H_RKVDEC0>, <&cru SRST_RKVDEC0_CA>,
> +			 <&cru SRST_RKVDEC0_CORE>, <&cru SRST_RKVDEC0_HEVC_CA>;
> +		reset-names = "axi", "ahb", "cabac", "core", "hevc_cabac";
> +		sram = <&vdec0_sram>;
> +	};
> +
> +	vdec0_mmu: iommu@fdc38700 {
> +		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
> +		reg = <0x0 0xfdc38700 0x0 0x40>, <0x0 0xfdc38740 0x0 0x40>;
> +		interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks = <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>;
> +		clock-names = "aclk", "iface";
> +		power-domains = <&power RK3588_PD_RKVDEC0>;
> +		#iommu-cells = <0>;
> +	};
> +
> +	vdec1: video-decoder@fdc40000 {

Same here :)

Regards,
Jonas

> +		compatible = "rockchip,rk3588-vdec";
> +		reg = <0x0 0xfdc40000 0x0 0x100>,
> +		      <0x0 0xfdc40100 0x0 0x500>,
> +		      <0x0 0xfdc40600 0x0 0x100>;
> +		reg-names = "link", "function", "cache";
> +		interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks = <&cru ACLK_RKVDEC1>, <&cru HCLK_RKVDEC1>, <&cru CLK_RKVDEC1_CA>,
> +			 <&cru CLK_RKVDEC1_CORE>, <&cru CLK_RKVDEC1_HEVC_CA>;
> +		clock-names = "axi", "ahb", "cabac", "core", "hevc_cabac";
> +		assigned-clocks = <&cru ACLK_RKVDEC1>, <&cru CLK_RKVDEC1_CORE>,
> +				  <&cru CLK_RKVDEC1_CA>, <&cru CLK_RKVDEC1_HEVC_CA>;
> +		assigned-clock-rates = <800000000>, <600000000>,
> +				       <600000000>, <1000000000>;
> +		iommus = <&vdec1_mmu>;
> +		power-domains = <&power RK3588_PD_RKVDEC1>;
> +		resets = <&cru SRST_A_RKVDEC1>, <&cru SRST_H_RKVDEC1>, <&cru SRST_RKVDEC1_CA>,
> +			 <&cru SRST_RKVDEC1_CORE>, <&cru SRST_RKVDEC1_HEVC_CA>;
> +		reset-names = "axi", "ahb", "cabac", "core", "hevc_cabac";
> +		sram = <&vdec1_sram>;
> +	};
> +
> +	vdec1_mmu: iommu@fdc40700 {
> +		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
> +		reg = <0x0 0xfdc40700 0x0 0x40>, <0x0 0xfdc40740 0x0 0x40>;
> +		interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks = <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>;
> +		clock-names = "aclk", "iface";
> +		power-domains = <&power RK3588_PD_RKVDEC0>;
> +		#iommu-cells = <0>;
> +	};
> +
>  	av1d: video-codec@fdc70000 {
>  		compatible = "rockchip,rk3588-av1-vpu";
>  		reg = <0x0 0xfdc70000 0x0 0x800>;
> @@ -2883,6 +2947,16 @@ system_sram2: sram@ff001000 {
>  		ranges = <0x0 0x0 0xff001000 0xef000>;
>  		#address-cells = <1>;
>  		#size-cells = <1>;
> +
> +		vdec0_sram: codec-sram@0 {
> +			reg = <0x0 0x78000>;
> +			pool;
> +		};
> +
> +		vdec1_sram: codec-sram@78000 {
> +			reg = <0x78000 0x77000>;
> +			pool;
> +		};
>  	};
>  
>  	pinctrl: pinctrl {


