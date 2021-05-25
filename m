Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD2B2390CB6
	for <lists+linux-media@lfdr.de>; Wed, 26 May 2021 01:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230029AbhEYXGm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 19:06:42 -0400
Received: from gloria.sntech.de ([185.11.138.130]:54198 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229898AbhEYXGm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 19:06:42 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1llg6m-00071l-Fk; Wed, 26 May 2021 01:05:08 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, Alex Bee <knaerzche@gmail.com>
Cc:     Alex Bee <knaerzche@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH 07/10] ARM: dts: rockchip: add vpu node for RK322x
Date:   Wed, 26 May 2021 01:05:06 +0200
Message-ID: <4871345.LM0AJKV5NW@diego>
In-Reply-To: <20210525152225.154302-8-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com> <20210525152225.154302-8-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Dienstag, 25. Mai 2021, 17:22:22 CEST schrieb Alex Bee:
> The VPU IP block of RK322x is the same as RK3399 has and the driver can
> be used as-is.
> 
> Add the respective nodes to the device tree.
> 
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> ---
>  arch/arm/boot/dts/rk322x.dtsi | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/rk322x.dtsi b/arch/arm/boot/dts/rk322x.dtsi
> index c8095ede7d7a..62d1113b7804 100644
> --- a/arch/arm/boot/dts/rk322x.dtsi
> +++ b/arch/arm/boot/dts/rk322x.dtsi
> @@ -611,6 +611,18 @@ gpu: gpu@20000000 {
>  		status = "disabled";
>  	};
>  
> +	vpu: video-codec@20020000 {
> +		compatible = "rockchip,rk3228-vpu", "rockchip,rk3399-vpu";
> +		reg = <0x20020000 0x800>;
> +		interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI  9 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "vepu", "vdpu";
> +		clocks = <&cru ACLK_VPU>, <&cru HCLK_VPU>;
> +		clock-names = "aclk", "hclk";
> +		power-domains = <&power RK3228_PD_VPU>;
> +		iommus = <&vpu_mmu>;

NIT: [if you need to resend for other reasons] iommus before power-domains please

> +	};
> +
>  	vpu_mmu: iommu@20020800 {
>  		compatible = "rockchip,iommu";
>  		reg = <0x20020800 0x100>;
> @@ -619,7 +631,6 @@ vpu_mmu: iommu@20020800 {
>  		clock-names = "aclk", "iface";
>  		power-domains = <&power RK3228_PD_VPU>;
>  		#iommu-cells = <0>;
> -		status = "disabled";
>  	};
>  
>  	vdec_mmu: iommu@20030480 {
> 




