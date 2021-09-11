Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E53CA4074A6
	for <lists+linux-media@lfdr.de>; Sat, 11 Sep 2021 04:33:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235184AbhIKCeW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Sep 2021 22:34:22 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:53763 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235128AbhIKCeV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Sep 2021 22:34:21 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id 44C92580D36;
        Fri, 10 Sep 2021 22:32:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 10 Sep 2021 22:32:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=9
        wn7RP7Sux9NYgDDcEExp5Udsa+3BvnVWNaKgQ+xtco=; b=C54qrA6kMQY/5XFcT
        HMkZjs6lh0FZRguVrhwIIxrnEospagqHftUvoYjDpwCm52GukttO6NgXCKLjCWd4
        IPQ3HnUc0sspZBvEeG11N3NxPIxPAELxHPmDPkzwN3D+a7y2U4Ymnf6kKO0tEzpv
        /T/jlT9JM4ZHHQMfm51jRmmRJM+2NUJGu+dVVMSR/EnecBMYkKm0Ot+TNRo2fmM3
        8Ss6bNrbFwpdFdmjxPq8cgRIepxZ9WZcFZMurqPQFuOCLKhn7jkwsw3i+L/oBHvd
        YQXYsWdsYjxJCqUVq1BUAVjMV41QYSVZ4zuYmE114hVUuAozGtptkODL8ggpSKn9
        XLh9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=9wn7RP7Sux9NYgDDcEExp5Udsa+3BvnVWNaKgQ+xt
        co=; b=qtYIC427B9zI8tzmC3wd15AoaBFHpEDOC4H603KsCIB0FiBofs4wkvwg7
        uS9gkqjTxxsnurrBUh9uTLiFVU5y/AU2WqyvWkXFQhqXH9SSjNvCFrzXfYDv80zD
        Dbjd2JwpGgoW3IfzTZd41DZ0DI+/8emaVG65seFbSczgiZoiO7LGDmtkP61nGiNO
        q29dU+yrnOCwwDHmCcS1rC/Q004jB9wAxkp0Jvt6Aq4/6Pg9a5cQCOG0tJaXKWwm
        piUEidBdJvly9SUKPlltO/LYrX7RUGfolQSptC905Qh01jToxPFZNY+rO2jnFMQS
        5lAtst/0U/MIehzGvTp8tBGhbfKkA==
X-ME-Sender: <xms:UhU8YdLgdDXoWKC5WM2HQdQzOWdceZhNFSM4ZDIHW6NksC96cac9SQ>
    <xme:UhU8YZKBTmqsKcPVzbIpFt3Yxh47OT_TXobfh9KV4CulVI2nzLQsjQCI3W3wZXy7w
    JGzunryDsbkl61_ow>
X-ME-Received: <xmr:UhU8YVuvztFyxK92St4z7JM8euPi079MLna5__K8AbtHxfeDfOc6Zt95nHudd6fSdDF6DSaxsOn2at7cJ1owmDaQcN290xAoXC-DMGRMN1IRWRpVWg83Sp9V5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegvddgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepgfevffetleehffejueekvdekvdeitdehveegfeekheeuieeiueet
    uefgtedtgeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:UhU8YebXU91bKJe0VzOMREaX9RL4z3XY_MEMKJXqUxxdu3mFSIg-dA>
    <xmx:UhU8YUZV90hxitD4BKT3lUTXoRgZFq4zPto02grRmhBVZSp61WGIrw>
    <xmx:UhU8YSDPWhl62RYdMbH_U3KEA4Rr7McORTS2QeDVX2eLVn4djGBtdw>
    <xmx:VRU8YUMXGyMvhK50DVWRrnQwwYX_iPnsyiYrYSDrtx6K3yINWpvIZw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Sep 2021 22:32:49 -0400 (EDT)
Subject: Re: [PATCH 09/22] ARM: dts: sun8i: v3s: Add nodes for MIPI CSI-2
 support
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
References: <20210910184147.336618-1-paul.kocialkowski@bootlin.com>
 <20210910184147.336618-10-paul.kocialkowski@bootlin.com>
From:   Samuel Holland <samuel@sholland.org>
Message-ID: <483288cb-d9fa-4581-7986-d15c4aa27769@sholland.org>
Date:   Fri, 10 Sep 2021 21:32:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210910184147.336618-10-paul.kocialkowski@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/10/21 1:41 PM, Paul Kocialkowski wrote:
> MIPI CSI-2 is supported on the V3s with an A31-based MIPI CSI-2 bridge
> controller. The controller uses a separate D-PHY, which is the same
> that is otherwise used for MIPI DSI, but used in Rx mode.
> 
> On the V3s, the CSI0 controller is dedicated to MIPI CSI-2 as it does
> not have access to any parallel interface pins.
> 
> Add all the necessary nodes (CSI0, MIPI CSI-2 bridge and D-PHY) to
> support the MIPI CSI-2 interface.
> 
> Note that a fwnode graph link is created between CSI0 and MIPI CSI-2
> even when no sensor is connected. This will result in a probe failure
> for the controller as long as no sensor is connected but this is fine
> since no other interface is available.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  arch/arm/boot/dts/sun8i-v3s.dtsi | 72 ++++++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi b/arch/arm/boot/dts/sun8i-v3s.dtsi
> index a77b63362a1d..ec7fa6459547 100644
> --- a/arch/arm/boot/dts/sun8i-v3s.dtsi
> +++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
> @@ -612,6 +612,34 @@ spi0: spi@1c68000 {
>  			#size-cells = <0>;
>  		};
>  
> +		csi0: camera@1cb0000 {
> +			compatible = "allwinner,sun8i-v3s-csi";
> +			reg = <0x01cb0000 0x1000>;
> +			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_BUS_CSI>,
> +				 <&ccu CLK_CSI1_SCLK>,
> +				 <&ccu CLK_DRAM_CSI>;
> +			clock-names = "bus", "mod", "ram";
> +			resets = <&ccu RST_BUS_CSI>;
> +			status = "disabled";
> +
> +			assigned-clocks = <&ccu CLK_CSI1_SCLK>;
> +			assigned-clock-parents = <&ccu CLK_PLL_ISP>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					csi0_in_mipi_csi2: endpoint {
> +						remote-endpoint = <&mipi_csi2_out_csi0>;
> +					};
> +				};
> +			};
> +		};
> +
>  		csi1: camera@1cb4000 {
>  			compatible = "allwinner,sun8i-v3s-csi";
>  			reg = <0x01cb4000 0x3000>;

All of the new nodes should be added above this one, to maintain unit
address order.

Regards,
Samuel

> @@ -637,5 +665,49 @@ gic: interrupt-controller@1c81000 {
>  			#interrupt-cells = <3>;
>  			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
>  		};
> +
> +		mipi_csi2: csi@1cb1000 {
> +			compatible = "allwinner,sun8i-v3s-mipi-csi2",
> +				     "allwinner,sun6i-a31-mipi-csi2";
> +			reg = <0x01cb1000 0x1000>;
> +			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_BUS_CSI>,
> +				 <&ccu CLK_CSI1_SCLK>;
> +			clock-names = "bus", "mod";
> +			resets = <&ccu RST_BUS_CSI>;
> +			status = "disabled";
> +
> +			phys = <&dphy>;
> +			phy-names = "dphy";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				mipi_csi2_in: port@0 {
> +					reg = <0>;
> +				};
> +
> +				mipi_csi2_out: port@1 {
> +					reg = <1>;
> +
> +					mipi_csi2_out_csi0: endpoint {
> +						remote-endpoint = <&csi0_in_mipi_csi2>;
> +					};
> +				};
> +			};
> +		};
> +
> +		dphy: d-phy@1cb2000 {
> +			compatible = "allwinner,sun6i-a31-mipi-dphy";
> +			reg = <0x01cb2000 0x1000>;
> +			clocks = <&ccu CLK_BUS_CSI>,
> +				 <&ccu CLK_MIPI_CSI>;
> +			clock-names = "bus", "mod";
> +			resets = <&ccu RST_BUS_CSI>;
> +			allwinner,direction = "rx";
> +			status = "disabled";
> +			#phy-cells = <0>;
> +		};
>  	};
>  };
> 

