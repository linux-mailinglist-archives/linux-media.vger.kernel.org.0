Return-Path: <linux-media+bounces-13735-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7FC90F22B
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 17:29:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E44F9283BAC
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 15:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E0C143865;
	Wed, 19 Jun 2024 15:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="FnRnQHlO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E78146D53
	for <linux-media@vger.kernel.org>; Wed, 19 Jun 2024 15:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718810975; cv=none; b=Ao3JSn/JEIdx2ZwuGGJPFEj73toKq2ImE184SaqEO02iCxqG+zirro61s3g1i/OrNOz4dhnwztHJaH54M2JYwueHc9pHKbDUhRkiHRVwYlwh2L8VrWa2Kc/zHDdKTDN2eB4Vz9o1DVj1iS8fUWKMuHamF8tDyrNF4MqMWKsA5Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718810975; c=relaxed/simple;
	bh=3DOUHGeNOX9DuUmm9cMJvAgdKDoHnyXCG179JBOCf5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fztrAU8xroxI6gOkeHmNbMkyFfFMeFrfxRgIzGW1q7JXaGHFY4SMx0qIt/Sq/QnNLtlge7MFk2S7D1QSJaxCS2T6IMKVop2XcdcOyL486MMR/AeJAj2A0/FyIIl3+TZFFEMJ0fawbETyU/19tK5TSFm852q0QdV1EIEXZtIPrLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=FnRnQHlO; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1718810947;
 bh=3g8jW5fl7Zb/rz0sp50oVlg57OmKTGVmhH6/Ni0PVpE=;
 b=FnRnQHlOu32EysE34JWg9sDiTktz0BnHzXRvtD0FDduz09GmJZBN0c3ekKpzfUuPNETvI9pi0
 IetRJ/hZwWCrBMoGAYqjUUZxWkNcU5ojgHpO2snBsF5IFjIg6QJXHGrLZyf3rtL9a9zqIzEIBK5
 xNB5tAsZ2lbSoGSGfHkxtyYiGk2Tep/nAQ+rqiYSdPuF2tvXMWyn2vfgs3Kqw9yD6oPE89NNMpy
 /UEVjLKruZJjOqhRlR4rl/F+DjiIK6ajC1zZyGx/1N7AOVwaM7eTjIpB59aGecnG3+KTEmjuN62
 l8H3vYI9Zri+y9jdiR6B4UZp57a70BGUkj8Gnf9ibnFQ==
Message-ID: <6e5ddd5c-340d-4474-a490-427a82db4a97@kwiboo.se>
Date: Wed, 19 Jun 2024 17:28:53 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: rockchip: Add rkvdec2 Video Decoder on
 rk3588(s)
To: Detlev Casanova <detlev.casanova@collabora.com>
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
 <benjamin.gaignard@collabora.com>, Alex Bee <knaerzche@gmail.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240619150029.59730-1-detlev.casanova@collabora.com>
 <20240619150029.59730-5-detlev.casanova@collabora.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20240619150029.59730-5-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 6672f93b4c60bf9a671bfbb1

Hi Detlev,

On 2024-06-19 16:57, Detlev Casanova wrote:
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
> +	};

This is still missing the iommus, please add the iommus, they should be
supported/same as the one used for e.g. VOP2:

  compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";

The VOP2 MMUs does have one extra mmu_cfg_mode flag in AUTO_GATING,
compared to the VDPU381 MMUs, however only the AV1D MMU should be
special on RK3588.

Please add the iommus :-)

Regards,
Jonas

>  };
>  
>  #include "rk3588s-pinctrl.dtsi"


