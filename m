Return-Path: <linux-media+bounces-13833-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B283910932
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 17:01:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DDC11F23EB0
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 15:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A750A1AF687;
	Thu, 20 Jun 2024 15:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="eXIql/8Z"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5661D1AD9C9
	for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 15:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718895690; cv=none; b=h8lp03uYi3Urs0a0EpyWR62yF6J7LJLHnhsFrzzK4bbqngigVImptzKudzTx1HhZ2Mn09TZXtwQKkJ5QJLoJqbnZdW0fW776dY71f3P/VLCnQ7BWX3vTARu7OxO1/tXlycL3gNbqFDx9HFpmFEHPXpcIVnbpKShICxzLVdm8aa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718895690; c=relaxed/simple;
	bh=GVeOn2xdOEFI+aM+1f6+E6tbMdNuyMiU3KhFIESuj+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uyZe04VJDmdsjjA5WPcdjIPVxL+K1S5pFzJ6SzZ8l8ol5qiwAOF1Szfm3jpEoYAY/K4O+hoWCrdrnDNK6qFCLzmljXHps0K15RYd/wRSSyNyvIBpZN3PZL1IDK+YXL5sVqKEMAFV4qnYzG7O8VfGMPv90ua5W3mFB9Hh5dIlcyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=eXIql/8Z; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1718895660;
 bh=13pdcRskJFNi9XMxOGxfDEs3htWYtGPvGt7ceE5Lg0Y=;
 b=eXIql/8ZTuBT1dxVZxPaSQIqC7kn0zIBK2fXkrirx2CvMvjsNgvuDgVqkBhPjoA5p08Puj2Xb
 BhyQsOePA0/9ugdJNfrRGEROt3KNWkte/ROClbvW1L3myLT44fuY7hz06DaxttH60d3g1a0u/K3
 6gO37Fa2h6Q1Q4E4CJ7KFrFONc4iL6X3f7TASxg4kMSLgDKotZXnfx/b/3TIEYrk3ePB7UR5Y2R
 x5/wgQe3nOhucLMOvVsEoQYfDILDDBP2G37wCWi517YqcK0x3MiX1z7VRZz8J95VHqZAcFdOO2V
 /CS77qgr/4hJaabOg6V+vWY17iDNLhhm2A81Zv4TMRNA==
Message-ID: <311770c3-d3ea-4650-ae11-7c278e043d0a@kwiboo.se>
Date: Thu, 20 Jun 2024 17:00:49 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: rockchip: Add rkvdec2 Video Decoder on
 rk3588(s)
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
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
 linux-staging@lists.linux.dev
References: <20240620142532.406564-1-detlev.casanova@collabora.com>
 <20240620142532.406564-5-detlev.casanova@collabora.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20240620142532.406564-5-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 6674442892323c181dc311b2

Hi Detlev,

On 2024-06-20 16:19, Detlev Casanova wrote:
> Add the rkvdec2 Video Decoder to the RK3588s devicetree.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588s.dtsi | 48 +++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> index 6ac5ac8b48ab..9c44c99125b4 100644
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
> @@ -2665,6 +2675,44 @@ gpio4: gpio@fec50000 {
>  			#interrupt-cells = <2>;
>  		};
>  	};
> +
> +	vdec0: video-decoder@fdc38100 {

This and the vdec1 node should probably be added between

  pmu: power-management@fd8d8000

and

  av1d: video-codec@fdc70000

to follow reg order.

Also I am wondering if the nodes should be named

  video-codec@fdc38000

and

  video-codec@fdc40000

to match "1.1 Address Mapping" in TRM and the actual base address for
the VDPU381 IP and video-codec is used for other codec nodes.

> +		compatible = "rockchip,rk3588-vdec";
> +		reg = <0x0 0xfdc38100 0x0 0x500>;

For existing rkvdec1 devices the cache regs is also included in the
range, should cache regs also be included for rkvdec2?, e.g.:

  reg = <0x0 0xfdc38100 0x0 0x600>;

And maybe it also should include the link list regs, e.g.:

  reg = <0x0 0xfdc38000 0x0 0x700>;

or possible:

  reg = <0x0 0xfdc38000 0x0 0x100>,
        <0x0 0xfdc38100 0x0 0x500>,
        <0x0 0xfdc38600 0x0 0x100>;

Something like that may be a better description of the hw.

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

Do we need to include the rst prefix in the reset name?, does not look
like other DT/bindings normally include rst in their name.

> +		power-domains = <&power RK3588_PD_RKVDEC0>;
> +		sram = <&vdec0_sram>;
> +	};
> +
> +	vdec1: video-decoder@fdc40100 {

Same as above.

> +		compatible = "rockchip,rk3588-vdec";
> +		reg = <0x0 0xfdc40100 0x0 0x500>;

Same as above.

Regards,
Jonas

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
> +	};
>  };
>  
>  #include "rk3588s-pinctrl.dtsi"


