Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5607E2FEA8
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2019 16:56:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727080AbfE3Ozw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 May 2019 10:55:52 -0400
Received: from vps.xff.cz ([195.181.215.36]:33506 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726512AbfE3Ozw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 May 2019 10:55:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1559228150; bh=4poS9dzXjZyZHVsMTWE55BoeyiNgM40bOoxh48wj2rQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CHfsdM4utd+EIvKv6wDe1J6SZi5pLvTw1w0fitol8/pxnTYF5o+BY8QJNpbVWCOpu
         fR2KJHmrElEorkXXaP+81G4vNKdJEt/LK3oBGT8SpVZbPIkes3vHjQNQDIoTseAMPZ
         67EvfWmInFdCaae5mTrHdcWX2SEAykrQfn4kwLKs=
Date:   Thu, 30 May 2019 16:55:50 +0200
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To:     =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 10/12] arm64: dts: allwinner: h6: Add IR receiver node
Message-ID: <20190530145550.amalnxmx7kpokykv@core.my.home>
Mail-Followup-To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20190528161440.27172-1-peron.clem@gmail.com>
 <20190528161440.27172-11-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190528161440.27172-11-peron.clem@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Clément,

On Tue, May 28, 2019 at 06:14:38PM +0200, Clément Péron wrote:
> Allwinner H6 IR is similar to A31 and can use same driver.
> 
> Add support for it.
> 
> Signed-off-by: Clément Péron <peron.clem@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> index 16c5c3d0fd81..649cbdfe452e 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> @@ -647,6 +647,25 @@
>  				pins = "PL0", "PL1";
>  				function = "s_i2c";
>  			};
> +
> +			r_ir_rx_pin: r-ir-rx-pin {
> +				pins = "PL9";
> +				function = "s_cir_rx";
> +			};
> +		};
> +
> +		r_ir: ir@7040000 {
> +				compatible = "allwinner,sun50i-h6-ir",
> +					     "allwinner,sun6i-a31-ir";
> +				reg = <0x07040000 0x400>;
> +				interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&r_ccu CLK_R_APB1_IR>,
> +					 <&r_ccu CLK_IR>;
> +				clock-names = "apb", "ir";
> +				resets = <&r_ccu RST_R_APB1_IR>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&r_ir_rx_pin>;
> +				status = "disabled";
>  		};

Please make a comment here, that this is known broken on some boards and may
result IRQ flood if enabled. Otherwise noone will know.

thanks,
	o.

>  		r_i2c: i2c@7081400 {
> -- 
> 2.20.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
