Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1086A2A1D72
	for <lists+linux-media@lfdr.de>; Sun,  1 Nov 2020 11:54:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbgKAKyo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Nov 2020 05:54:44 -0500
Received: from gloria.sntech.de ([185.11.138.130]:46494 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726145AbgKAKyn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 1 Nov 2020 05:54:43 -0500
Received: from p57b773f8.dip0.t-ipconnect.de ([87.183.115.248] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1kZB0P-00032L-1l; Sun, 01 Nov 2020 11:54:37 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     linux-media@vger.kernel.org,
        Helen Koike <helen.koike@collabora.com>
Cc:     devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        robh+dt@kernel.org, kernel@collabora.com, hverkuil-cisco@xs4all.nl,
        dafna.hirschfeld@collabora.com, mark.rutland@arm.com,
        karthik.poduval@gmail.com, eddie.cai.linux@gmail.com,
        jbx6244@gmail.com, zhengsq@rock-chips.com, robin.murphy@arm.com
Subject: Re: [PATCH v6 8/9] arm64: dts: rockchip: add isp0 node for rk3399
Date:   Sun, 01 Nov 2020 11:54:36 +0100
Message-ID: <25468331.GQUMHoxoIT@phil>
In-Reply-To: <20201020193850.1460644-9-helen.koike@collabora.com>
References: <20201020193850.1460644-1-helen.koike@collabora.com> <20201020193850.1460644-9-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Dienstag, 20. Oktober 2020, 21:38:49 CET schrieb Helen Koike:
> From: Shunqian Zheng <zhengsq@rock-chips.com>
> 
> RK3399 has two ISPs, but only isp0 was tested.
> Add isp0 node in rk3399 dtsi
> 
> Verified with:
> make ARCH=arm64 dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> 
> Signed-off-by: Shunqian Zheng <zhengsq@rock-chips.com>
> Signed-off-by: Jacob Chen <jacob2.chen@rock-chips.com>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>

looks good, and I'd like to apply this one after the drivers/media-patches
of this series got applied.


Thanks
Heiko



> 
> ---
> 
> Changes in v6:
> - Add status = "disabled" in the isp0 node
> ---
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 26 ++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> index ada724b12f014..af5f8e2c5e64d 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> @@ -1723,6 +1723,32 @@ vopb_mmu: iommu@ff903f00 {
>  		status = "disabled";
>  	};
>  
> +	isp0: isp0@ff910000 {
> +		compatible = "rockchip,rk3399-cif-isp";
> +		reg = <0x0 0xff910000 0x0 0x4000>;
> +		interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks = <&cru SCLK_ISP0>,
> +			 <&cru ACLK_ISP0_WRAPPER>,
> +			 <&cru HCLK_ISP0_WRAPPER>;
> +		clock-names = "isp", "aclk", "hclk";
> +		iommus = <&isp0_mmu>;
> +		phys = <&mipi_dphy_rx0>;
> +		phy-names = "dphy";
> +		power-domains = <&power RK3399_PD_ISP0>;
> +		status = "disabled";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +	};
> +
>  	isp0_mmu: iommu@ff914000 {
>  		compatible = "rockchip,iommu";
>  		reg = <0x0 0xff914000 0x0 0x100>, <0x0 0xff915000 0x0 0x100>;
> 




