Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5D973FBDFC
	for <lists+linux-media@lfdr.de>; Mon, 30 Aug 2021 23:12:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237384AbhH3VM7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 17:12:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236566AbhH3VM6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 17:12:58 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B673DC061575;
        Mon, 30 Aug 2021 14:12:03 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a25so34024151ejv.6;
        Mon, 30 Aug 2021 14:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=r14IiUeFZsOa+p44jC0mJ6Q1pyznNHnGwx/JXCHjfMU=;
        b=U9eeA+tpY9hAdaxImu/QageaS5SOYiXQ0IClfAZDAQ9YmF/AVksSLDwVIcGUYtLfV2
         9UgHpkNh3bLECyFovm+bzkkRyizWNofxP/KKyhQFohWoY4QXbxiYUftmcxbrXuCkP3Yc
         HeMI8Pz8a7gdORWLHcmDnNMQF4QJ4CxRz4QPlzHF7W8RLHbnwv7K3kXVfNeTgt6i5Xsc
         onQq/dTvuYn6Pqps01hbfwnQF++BUO0SizEY+SpAkJoO/YVeMh0BaN2vXk0RmMJpwemV
         Nxcufx7sgM6IJD1Feob/2Zhr1ciXAhBg7CWdpYUSHjUiRdxEKRPTExSlTjFepP005nKG
         vCxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=r14IiUeFZsOa+p44jC0mJ6Q1pyznNHnGwx/JXCHjfMU=;
        b=DbL7XRyItztS/Tm8WgIOGBCAksteTfMEpFDPr2A44dZQmzEMyJvJdSRFgt16uGKvQX
         ho04UJ1yp92TMlS8LQXi4aYWQ80GYiMvkYjcVt6glDtpS3j4HirwXWhDJmfdLSGwyGS9
         cmuOx1llJPuU+FpHw5cP1gru377EZx1QxWc/3WzTQV3rDryco45xvB/FVgcqxK/1XmvE
         uYUt7DieZBPYvUiVeoJSL8rcgGK7kLv1/AO6TvxuOGM0Sa8v1dJWXFxBXIdZ3sb5GbJo
         fip9AZvg1g2ynL5YJvPnhmLhIRzGiwuMBOOFsm9ubw+/h4hL4J5BVADmpYvMPsi9E0Zr
         cPtQ==
X-Gm-Message-State: AOAM530DZ5CnMAGQ1gT6CnYn9l9Zx9lqLhZG4s+y7bwQGqSOLXr0AXKw
        eWsqInHEhk0cElV/kJO1wyw46b/InpeZ2A2D
X-Google-Smtp-Source: ABdhPJwYEmJoPiRFTWYAuDsvHNKG/YGAhFBEJdj8AsW1rXIr/Au3+LJksV7du9M4yA9hD0PBaeNBdw==
X-Received: by 2002:a17:906:a044:: with SMTP id bg4mr27248742ejb.312.1630357922315;
        Mon, 30 Aug 2021 14:12:02 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id p8sm7215142ejo.2.2021.08.30.14.12.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Aug 2021 14:12:01 -0700 (PDT)
Subject: Re: [PATCH v1 5/5] arm64: dts: rockchip: add mipi-dphy-tx1rx1 for
 rk3399
To:     Mikhail Rudenko <mike.rudenko@gmail.com>,
        linux-phy@lists.infradead.org
Cc:     linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Marc Zyngier <maz@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Elaine Zhang <zhangqing@rock-chips.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Robin Murphy <robin.murphy@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210830180758.251390-1-mike.rudenko@gmail.com>
 <20210830180758.251390-6-mike.rudenko@gmail.com>
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <ac38a6ce-19f6-8d30-6070-55b78cc082e2@gmail.com>
Date:   Mon, 30 Aug 2021 23:12:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210830180758.251390-6-mike.rudenko@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mikhail,

On 8/30/21 8:07 PM, Mikhail Rudenko wrote:
> Add DT node for RX mode of RK3399 TX1RX1 D-PHY.
> 
> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> index 3871c7fd83b0..2e4513275a87 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> @@ -1902,6 +1902,21 @@ mipi1_in_vopl: endpoint@1 {
>  		};
>  	};
>  
> +	mipi_dphy_tx1rx1: mipi-dphy-tx1rx1@ff968000 {
> +		compatible = "rockchip,rk3399-mipi-dphy-tx1rx1";
> +		reg = <0x0 0xff968000 0x0 0x8000>;

> +		clocks = <&cru SCLK_MIPIDPHY_REF>,
> +			<&cru SCLK_DPHY_TX1RX1_CFG>,
> +			<&cru PCLK_VIO_GRF>,
> +			<&cru PCLK_MIPI_DSI1>;
> +		clock-names = "dphy-ref", "dphy-cfg",
> +			"grf", "dsi";

Could you fix the alignment a bit with extra spaces?

> +		rockchip,grf = <&grf>;
> +		power-domains = <&power RK3399_PD_VIO>;

Sort in alphabetical order.

> +		#phy-cells = <0>;
> +		status = "disabled";
> +	};
> +
>  	edp: edp@ff970000 {
>  		compatible = "rockchip,rk3399-edp";
>  		reg = <0x0 0xff970000 0x0 0x8000>;
> 
