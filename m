Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C348719FADE
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 18:57:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729188AbgDFQ5h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 12:57:37 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:56416 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728690AbgDFQ5g (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 12:57:36 -0400
Received: from [IPv6:2804:431:e7cc:377d:dcf4:aab0:a7bd:9880] (unknown [IPv6:2804:431:e7cc:377d:dcf4:aab0:a7bd:9880])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D61B02962C1;
        Mon,  6 Apr 2020 17:57:34 +0100 (BST)
Subject: Re: [PATCH v2 3/3] ARM: dts: rockchip: add rk3288 ISP and DPHY
To:     Karthik Poduval <karthik.poduval@gmail.com>,
        linux-media@vger.kernel.org
References: <karthik.poduval@gmail.com>
 <20200406073017.19462-1-karthik.poduval@gmail.com>
 <20200406073017.19462-4-karthik.poduval@gmail.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <7d27bc51-681b-e426-3948-b94a182ca55c@collabora.com>
Date:   Mon, 6 Apr 2020 13:57:30 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200406073017.19462-4-karthik.poduval@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Karthik,

On 4/6/20 4:30 AM, Karthik Poduval wrote:
> ISP and DPHY device entries missing so add them.> 
> tested on tinkerbaord with ov5647 using command
> cam -c 1 -C -F cap
> 
> Reported-by: Karthik Poduval <karthik.poduval@gmail.com>

Please see my previous comment regarding this tag.

> Signed-off-by: Karthik Poduval <karthik.poduval@gmail.com>
> ---
>  arch/arm/boot/dts/rk3288.dtsi | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
> index 9beb662166aa..adea8189abd9 100644
> --- a/arch/arm/boot/dts/rk3288.dtsi
> +++ b/arch/arm/boot/dts/rk3288.dtsi
> @@ -247,6 +247,23 @@
>  		ports = <&vopl_out>, <&vopb_out>;
>  	};
>  
> +	isp: isp@ff910000 {
> +		compatible = "rockchip,rk3288-rkisp1";
> +		reg = <0x0 0xff910000 0x0 0x4000>;
> +		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru SCLK_ISP>, <&cru ACLK_ISP>,
> +			 <&cru HCLK_ISP>, <&cru PCLK_ISP_IN>,
> +			 <&cru SCLK_ISP_JPE>;
> +		clock-names = "clk_isp", "aclk_isp",
> +			      "hclk_isp", "pclk_isp_in",
> +			      "sclk_isp_jpe";
> +		assigned-clocks = <&cru SCLK_ISP>, <&cru SCLK_ISP_JPE>;
> +		assigned-clock-rates = <400000000>, <400000000>;

These two items are not in the bindings, are they required? Or should we modify the bindings?

> +		power-domains = <&power RK3288_PD_VIO>;
> +		iommus = <&isp_mmu>;
> +		status = "disabled";
> +	};
> +
>  	sdmmc: mmc@ff0c0000 {
>  		compatible = "rockchip,rk3288-dw-mshc";
>  		max-frequency = <150000000>;
> @@ -891,6 +908,14 @@
>  			status = "disabled";
>  		};
>  
> +		mipi_phy_rx0: mipi-phy-rx0 {
> +			compatible = "rockchip,rk3288-mipi-dphy-rx0";
> +			clocks = <&cru SCLK_MIPIDSI_24M>, <&cru PCLK_MIPI_CSI>;
> +			clock-names = "dphy-ref", "pclk";
> +			#phy-cells = <0>;
> +			status = "disabled";

According to the bindings you also need power-domains here.
hmm, now I wonder if it is required or bindings which needs to
be updated (to be verified).

Also, I would separate this in two patches.

fyi, I'm moving bindings out of staging https://patchwork.linuxtv.org/project/linux-media/list/?series=2103

Thanks,
Helen

> +		};
> +
>  		io_domains: io-domains {
>  			compatible = "rockchip,rk3288-io-voltage-domain";
>  			status = "disabled";
> 
