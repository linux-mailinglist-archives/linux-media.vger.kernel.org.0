Return-Path: <linux-media+bounces-13299-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4080B9096F8
	for <lists+linux-media@lfdr.de>; Sat, 15 Jun 2024 10:26:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5E872816EF
	for <lists+linux-media@lfdr.de>; Sat, 15 Jun 2024 08:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 017521BDD5;
	Sat, 15 Jun 2024 08:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="x4pKHQ8x"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D845A1863F
	for <linux-media@vger.kernel.org>; Sat, 15 Jun 2024 08:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718439956; cv=none; b=a9mNLRiAOHZ06GFtoI3mO//EQxFEjwWezrwRw7gkqCMp2q//tP3GaOl41NRIUEHqj+6TrS1cr0yRferRVAWMX/g4P0krCzr0m4wbAWCygPBV3o+EcqERcQ2nu1wplbc4Yx9YMgqZAAjRTCalWZpGl0L3h90uqZ0xx5+dR6fFmYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718439956; c=relaxed/simple;
	bh=RPVnhJfAcbOnu/iAuVsxIQIuS1yChCUbf4uGbhv50aI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iRugvZmw0XK387eIqTKr02fAKtoymTyfLcsJCKRsUdMQ+ZiLOIfj8F5UdYecPBVxub42f16+GYp5J0ip6lRPJk+yFKLzLdSigojgX9Ao+2SbMpyauH6L91sF84tQ/UGobnAoHmok8WpeBfqUKCW1o17IJPsCMyuhthRQATLGw3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=x4pKHQ8x; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1718439934;
 bh=EW7jvkwNl5KPdKEMQlw7NNrj1stNAcl0D/1kkAtbX9s=;
 b=x4pKHQ8xY4jG2m4ai/rW5ZXbsDn3QBmtALJi+WiuR4Fz4Weyu0kuskrVNAsce9CQ4pgLgcBmp
 JnXriXcuP18dwwfs2e51uanLqxEFSxN0U26zVBFTa6tY5BIIu5BhJnU2CbhuRr2HHwIOnFrwR28
 ZJL3Cm/zmz7mraYUKnVelMcRnC3iJAGPXtfBTasiPYn3ntsqo8CSLDukQ+rw+j0C++dF4NDPV9w
 eK5t9JKqMkx1P7rw36uqM8YNKgZ6fYadat6ssaWIM4F8bQrsxgnaC/eU4O3M0Rc3GgR6mjmYTnG
 1pj/NnJbD5j8U3iCSi/05NhRobCfDSHDfDhe9Zt0knvA==
Message-ID: <944c4296-8dd2-4ffd-b430-1839ff3a3ed2@kwiboo.se>
Date: Sat, 15 Jun 2024 10:25:27 +0200
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
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20240615015734.1612108-4-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 666d4ffdb23880544d1f1533

Hi Detlev,

On 2024-06-15 03:56, Detlev Casanova wrote:
> Add the rkvdec2 Video Decoder to the RK3588s devicetree.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  .../boot/dts/rockchip/rk3588-rock-5b.dts      |  4 ++++
>  .../boot/dts/rockchip/rk3588s-orangepi-5.dts  |  4 ++++
>  arch/arm64/boot/dts/rockchip/rk3588s.dtsi     | 19 +++++++++++++++++++
>  3 files changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> index c551b676860c..965322c24a65 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> @@ -503,6 +503,10 @@ &pwm1 {
>  	status = "okay";
>  };
>  
> +&rkvdec0 {
> +	status = "okay";
> +};

Enable of rkvdec0 should probably be split out from the patch that adds
the rkvdec0 node to soc dtsi.

Also why is rkvdec0 only enabled on rock-5b and orangepi-5?

> +
>  &saradc {
>  	vref-supply = <&avcc_1v8_s0>;
>  	status = "okay";
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
> index feea6b20a6bf..2828fb4c182a 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
> @@ -321,6 +321,10 @@ typec5v_pwren: typec5v-pwren {
>  	};
>  };
>  
> +&rkvdec0 {
> +	status = "okay";
> +};
> +
>  &saradc {
>  	vref-supply = <&avcc_1v8_s0>;
>  	status = "okay";
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> index 0fecbf46e127..09672636dcea 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> @@ -3034,6 +3034,9 @@ system_sram2: sram@ff001000 {
>  		ranges = <0x0 0x0 0xff001000 0xef000>;
>  		#address-cells = <1>;
>  		#size-cells = <1>;

Blank line is missing.

> +		rkvdec0_sram: rkvdec-sram@0 {
> +			reg = <0x0 0x78000>;
> +		};
>  	};
>  
>  	pinctrl: pinctrl {
> @@ -3103,6 +3106,22 @@ gpio4: gpio@fec50000 {
>  			#interrupt-cells = <2>;
>  		};
>  	};
> +
> +	rkvdec0: video-decoder@fdc38100 {
> +		compatible = "rockchip,rk3588-vdec2";
> +		reg = <0x0 0xfdc38100 0x0 0x500>;
> +		interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks = <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>, <&cru CLK_RKVDEC0_CORE>,
> +			 <&cru CLK_RKVDEC0_CA>, <&cru CLK_RKVDEC0_HEVC_CA>;
> +		clock-names = "axi", "ahb", "core",
> +			      "cabac", "hevc_cabac";
> +		assigned-clocks = <&cru ACLK_RKVDEC0>, <&cru CLK_RKVDEC0_CORE>,
> +				  <&cru CLK_RKVDEC0_CA>, <&cru CLK_RKVDEC0_HEVC_CA>;
> +		assigned-clock-rates = <800000000>, <600000000>,
> +				       <600000000>, <1000000000>;
> +		power-domains = <&power RK3588_PD_RKVDEC0>;

iommus and resets should probably be added.

> +		status = "disabled";
> +	};

The iommu node for rkvdec0_mmu seem to be missing, is it not required to
be able to use memory >4GiB as decoding buffers?

I would also consider adding the rkvdec1 node(s), if I am understanding
correctly they can both be used in a cluster or completely independent.

Also on RK3582/RK3583 one (or both) of the decoder cores may be marked
as bad, yet the remaining one can still be used independently. The idea
will be that bootloader fixup the DT and disabled/delete-node the bad
core(s).

Regards,
Jonas

>  };
>  
>  #include "rk3588s-pinctrl.dtsi"


