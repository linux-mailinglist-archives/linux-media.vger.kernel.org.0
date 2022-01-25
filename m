Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE2E49BBBC
	for <lists+linux-media@lfdr.de>; Tue, 25 Jan 2022 20:04:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbiAYTEu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jan 2022 14:04:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbiAYTEs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jan 2022 14:04:48 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1307C06173E
        for <linux-media@vger.kernel.org>; Tue, 25 Jan 2022 11:04:47 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id x193so33032233oix.0
        for <linux-media@vger.kernel.org>; Tue, 25 Jan 2022 11:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xx6pPxDWusTyXDPmQQkkGMWNHJXpoVx/sQtpxlse54Q=;
        b=eL1XuwFOYuGbQjWefmXn6X59kcQdEJcCZ0aASe9nlq8PTeo3O0rnT1Qpn/1x7ivWkI
         4ZhaWoAqzBJr/lYrFFq3xNGF4BFcQ8zYx7O0jheGHTbCPf14s6Z18suZMXkvpRlglKY3
         lrfHLQSAHe4Zpg/wXlMH+melwJq2a6fGzyDvKR4QuygoxgypoukSjjY3xCXHtA8nyOKJ
         qMBZOZ9wR9cSVEkBdyyRJaddOaQqoix59xQlctEVoNA8U+kZLZ3VMwf1WUQrFJNo01Q8
         agr1KSTZTMyd4gRVquSgfyVDjQrkZDrKTVlDvOOcbYYVQF5F2y0VG7XVMwJGbPx1tlSt
         tlog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xx6pPxDWusTyXDPmQQkkGMWNHJXpoVx/sQtpxlse54Q=;
        b=xBXfcc7AwMBI59T5Qz9E20+gIBpEKWBOnh3ofwQwDcA0bPEwptvv+qXVCw2cMl4wDu
         VWWx86vW7UuUhwEG/qYNhgMa7K+NU6m0Q3BhhUYRx2MdWrNYeGEI7z1g6AuGUVYhSZX4
         XlHQXZt3nuoROmgAbB7ZghvhbEabp/mzo9z4oDvLdF9I9H20LlJQuM75zDwkYBXFXJn8
         dLQXQVX2U4lSAxL31GDWuPpbA7/s1DNPjGfOLeOQj6sFKcJDl/QEfZnwqmrLRSgPSPok
         Hn2CIZPX9+LoTUp9aNmfgq5+o0xIlHgCWcunWcWWWI3chz3oeFRS/BMxPwssHYkc/Ekh
         01nA==
X-Gm-Message-State: AOAM532nc4S0OK1QrNuEhIfWkdEfoEujZ6Sw+p7phBhT6smb6+98o16b
        7fuIczSCYR9zGNaQeCYJ0BHE9Q==
X-Google-Smtp-Source: ABdhPJxIP6+oD7gt9eH5+LFe++w9dIATHyaj+iBj28F054mPXWZGdYsjQk56Ug7nZcA1f6wMwrDeog==
X-Received: by 2002:a05:6808:1b06:: with SMTP id bx6mr1656291oib.176.1643137486631;
        Tue, 25 Jan 2022 11:04:46 -0800 (PST)
Received: from eze-laptop ([186.122.18.78])
        by smtp.gmail.com with ESMTPSA id l18sm8138754otv.49.2022.01.25.11.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 11:04:45 -0800 (PST)
Date:   Tue, 25 Jan 2022 16:04:38 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-media@vger.kernel.org, aford@beaconembedded.com,
        cphealy@gmail.com, kernel test robot <lkp@intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH V4 07/11] arm64: dts: imx8mq: Enable both G1 and G2 VPU's
 with vpu-blk-ctrl
Message-ID: <YfBJxmgwLGbVqGba@eze-laptop>
References: <20220125171129.472775-1-aford173@gmail.com>
 <20220125171129.472775-8-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220125171129.472775-8-aford173@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 25, 2022 at 11:11:24AM -0600, Adam Ford wrote:
> With the Hantro G1 and G2 now setup to run independently, update
> the device tree to allow both to operate.  This requires the
> vpu-blk-ctrl node to be configured.  Since vpu-blk-ctrl needs
> certain clock enabled to handle the gating of the G1 and G2
> fuses, the clock-parents and clock-rates for the various VPU's
> to be moved into the pgc_vpu because they cannot get re-parented
> once enabled, and the pgc_vpu is the highest in the chain.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>

It doesn't seem correct to have the Reported-by on this commit.

Thanks,
Ezequiel

> Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> index 2df2510d0118..549b2440f55d 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -737,7 +737,21 @@ pgc_gpu: power-domain@5 {
>  					pgc_vpu: power-domain@6 {
>  						#power-domain-cells = <0>;
>  						reg = <IMX8M_POWER_DOMAIN_VPU>;
> -						clocks = <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
> +						clocks = <&clk IMX8MQ_CLK_VPU_DEC_ROOT>,
> +							 <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
> +							 <&clk IMX8MQ_CLK_VPU_G2_ROOT>;
> +						assigned-clocks = <&clk IMX8MQ_CLK_VPU_G1>,
> +								  <&clk IMX8MQ_CLK_VPU_G2>,
> +								  <&clk IMX8MQ_CLK_VPU_BUS>,
> +								  <&clk IMX8MQ_VPU_PLL_BYPASS>;
> +						assigned-clock-parents = <&clk IMX8MQ_VPU_PLL_OUT>,
> +									 <&clk IMX8MQ_VPU_PLL_OUT>,
> +									 <&clk IMX8MQ_SYS1_PLL_800M>,
> +									 <&clk IMX8MQ_VPU_PLL>;
> +						assigned-clock-rates = <600000000>,
> +								       <600000000>,
> +								       <800000000>,
> +								       <0>;
>  					};
>  
>  					pgc_disp: power-domain@7 {
> @@ -1457,30 +1471,31 @@ usb3_phy1: usb-phy@382f0040 {
>  			status = "disabled";
>  		};
>  
> -		vpu: video-codec@38300000 {
> -			compatible = "nxp,imx8mq-vpu";
> -			reg = <0x38300000 0x10000>,
> -			      <0x38310000 0x10000>,
> -			      <0x38320000 0x10000>;
> -			reg-names = "g1", "g2", "ctrl";
> -			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "g1", "g2";
> +		vpu_g1: video-codec@38300000 {
> +			compatible = "nxp,imx8mq-vpu-g1";
> +			reg = <0x38300000 0x10000>;
> +			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>;
> +			power-domains = <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G1>;
> +		};
> +
> +		vpu_g2: video-codec@38310000 {
> +			compatible = "nxp,imx8mq-vpu-g2";
> +			reg = <0x38310000 0x10000>;
> +			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk IMX8MQ_CLK_VPU_G2_ROOT>;
> +			power-domains = <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G2>;
> +		};
> +
> +		vpu_blk_ctrl: blk-ctrl@38320000 {
> +			compatible = "fsl,imx8mq-vpu-blk-ctrl";
> +			reg = <0x38320000 0x100>;
> +			power-domains = <&pgc_vpu>, <&pgc_vpu>, <&pgc_vpu>;
> +			power-domain-names = "bus", "g1", "g2";
>  			clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
> -				 <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
> -				 <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
> -			clock-names = "g1", "g2", "bus";
> -			assigned-clocks = <&clk IMX8MQ_CLK_VPU_G1>,
> -					  <&clk IMX8MQ_CLK_VPU_G2>,
> -					  <&clk IMX8MQ_CLK_VPU_BUS>,
> -					  <&clk IMX8MQ_VPU_PLL_BYPASS>;
> -			assigned-clock-parents = <&clk IMX8MQ_VPU_PLL_OUT>,
> -						 <&clk IMX8MQ_VPU_PLL_OUT>,
> -						 <&clk IMX8MQ_SYS1_PLL_800M>,
> -						 <&clk IMX8MQ_VPU_PLL>;
> -			assigned-clock-rates = <600000000>, <600000000>,
> -					       <800000000>, <0>;
> -			power-domains = <&pgc_vpu>;
> +				 <&clk IMX8MQ_CLK_VPU_G2_ROOT>;
> +			clock-names = "g1", "g2";
> +			#power-domain-cells = <1>;
>  		};
>  
>  		pcie0: pcie@33800000 {
> -- 
> 2.32.0
> 
