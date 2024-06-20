Return-Path: <linux-media+bounces-13782-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B29F91016A
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 12:24:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 727631C2103F
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 10:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF97C1AAE0E;
	Thu, 20 Jun 2024 10:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DAH3/g6C"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D05D1A8C04;
	Thu, 20 Jun 2024 10:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718879091; cv=none; b=a7RkS8fOhF5Geov2xiAbJT6OV6dyyysVp6w8PhS/BdpfnQD/lIzceDLplAQZ5opKmIJVPsXEAVgHbXE4nG6Sg1dPiQHccr3Ww9YScv5LMSKzQ4vBwIwtdR/a5Y3DC+45bHSdRhPyhPr0usdo+Zkp8t8OIBKfmvzb1cRTe1PtXKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718879091; c=relaxed/simple;
	bh=V/mGbbKZbujOtZFWTQj3ShrU4q2VeQqYjy/tEpPe/EQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MaQ+mGl82ge5+FeQtgSbr6f85ifUlHpykATkCDvOnbSVfspwNQi0ZpjrN1GfQzDghje0BPTbxDM29yYIyFIXxRUBC/qZPjy0TNEdt8jmPDw2W+aWIbrg4X23VakaQ4E7tfxkCSalijJsOecNOLzh+VmxJwLyxsZewGWq7hzai9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DAH3/g6C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F9E0C2BD10;
	Thu, 20 Jun 2024 10:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718879090;
	bh=V/mGbbKZbujOtZFWTQj3ShrU4q2VeQqYjy/tEpPe/EQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DAH3/g6C3rXFP/0p/DiQbo3TQlhf5gIpg4KYgGs0LPUBW5uWSGfkEJjsFj+fcBM+0
	 io6AgYmDT620GqYXQUQj3JIJd8yy/iZZd6w5cYBjW7kjWVOh4w5UuJeb9V0SgSS0PQ
	 LkNdn6Sh74DiGug/fsW9vay1NG7ACuHWKXz2VEzDo9UBJOQ2FOPM5sXstjeBEHOnBR
	 jyuuLh44yLyOCHxk0+M07iWUX/nbzhAueDNkUz+8x7VmxLtRY03QaNvgh+KJWng5vJ
	 MWs19QsIi57O5BGm00gjmdPHLh4oJInzMMm1DZwfeuP3fiqyLUNP5KtzoWqPaSo9FJ
	 0+IBxFgyinnlw==
Message-ID: <9601672b-3288-4eff-a295-1892ef8df0aa@kernel.org>
Date: Thu, 20 Jun 2024 12:24:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: rockchip: Add rkvdec2 Video Decoder on
 rk3588(s)
To: Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Diederik de Haas <didi.debian@cknow.org>,
 Andy Yan <andy.yan@rock-chips.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Alex Bee <knaerzche@gmail.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev
References: <20240619150029.59730-1-detlev.casanova@collabora.com>
 <20240619150029.59730-5-detlev.casanova@collabora.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240619150029.59730-5-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/06/2024 16:57, Detlev Casanova wrote:
> Add the rkvdec2 Video Decoder to the RK3588s devicetree.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588s.dtsi | 50 +++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> index 6ac5ac8b48ab..7690632f57f1 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> @@ -2596,6 +2596,16 @@ system_sram2: sram@ff001000 {
>  		ranges = <0x0 0x0 0xff001000 0xef000>;
>  		#address-cells = <1>;
>  		#size-cells = <1>;
> +
> +		vdec0_sram: rkvdec-sram@0 {
> +			reg = <0x0 0x78000>;
> +			pool;
> +		};
> +
> +		vdec1_sram: rkvdec-sram@1 {
> +			reg = <0x78000 0x77000>;
> +			pool;
> +		};
>  	};
>  
>  	pinctrl: pinctrl {
> @@ -2665,6 +2675,46 @@ gpio4: gpio@fec50000 {
>  			#interrupt-cells = <2>;
>  		};
>  	};
> +
> +	vdec0: video-decoder@fdc38100 {
> +		compatible = "rockchip,rk3588-vdec";
> +		reg = <0x0 0xfdc38100 0x0 0x500>;
> +		interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks = <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>, <&cru CLK_RKVDEC0_CA>,
> +			 <&cru CLK_RKVDEC0_CORE>, <&cru CLK_RKVDEC0_HEVC_CA>;
> +		clock-names = "axi", "ahb", "cabac", "core", "hevc_cabac";
> +		assigned-clocks = <&cru ACLK_RKVDEC0>, <&cru CLK_RKVDEC0_CORE>,
> +				  <&cru CLK_RKVDEC0_CA>, <&cru CLK_RKVDEC0_HEVC_CA>;
> +		assigned-clock-rates = <800000000>, <600000000>,
> +				       <600000000>, <1000000000>;
> +		resets = <&cru SRST_A_RKVDEC0>, <&cru SRST_H_RKVDEC0>, <&cru SRST_RKVDEC0_CA>,
> +			 <&cru SRST_RKVDEC0_CORE>, <&cru SRST_RKVDEC0_HEVC_CA>;
> +		reset-names = "rst_axi", "rst_ahb", "rst_cabac",
> +			      "rst_core", "rst_hevc_cabac";
> +		power-domains = <&power RK3588_PD_RKVDEC0>;
> +		sram = <&vdec0_sram>;
> +		status = "okay";

Should not be needed. Where did you disable it?

> +	};
> +
> +	vdec1: video-decoder@fdc40100 {
> +		compatible = "rockchip,rk3588-vdec";
> +		reg = <0x0 0xfdc40100 0x0 0x500>;
> +		interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks = <&cru ACLK_RKVDEC1>, <&cru HCLK_RKVDEC1>, <&cru CLK_RKVDEC1_CA>,
> +			 <&cru CLK_RKVDEC1_CORE>, <&cru CLK_RKVDEC1_HEVC_CA>;
> +		clock-names = "axi", "ahb", "cabac", "core", "hevc_cabac";
> +		assigned-clocks = <&cru ACLK_RKVDEC1>, <&cru CLK_RKVDEC1_CORE>,
> +				  <&cru CLK_RKVDEC1_CA>, <&cru CLK_RKVDEC1_HEVC_CA>;
> +		assigned-clock-rates = <800000000>, <600000000>,
> +				       <600000000>, <1000000000>;
> +		resets = <&cru SRST_A_RKVDEC1>, <&cru SRST_H_RKVDEC1>, <&cru SRST_RKVDEC1_CA>,
> +			 <&cru SRST_RKVDEC1_CORE>, <&cru SRST_RKVDEC1_HEVC_CA>;
> +		reset-names = "rst_axi", "rst_ahb", "rst_cabac",
> +			      "rst_core", "rst_hevc_cabac";
> +		power-domains = <&power RK3588_PD_RKVDEC1>;
> +		sram = <&vdec1_sram>;
> +		status = "okay";

Should not be needed. Where did you disable it?



Best regards,
Krzysztof


