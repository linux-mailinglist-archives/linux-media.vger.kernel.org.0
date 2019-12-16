Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 467BA120761
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 14:40:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727936AbfLPNje (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 08:39:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:47186 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727641AbfLPNje (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 08:39:34 -0500
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 121A620409;
        Mon, 16 Dec 2019 13:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576503573;
        bh=7SGMKiJuU0qvOnDKNSk19Hh1fTjIukPVmdPORtDYtmg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vfLGXmzS2aEJJUXCz87hGKfWnfKZK5c+nQN4ASKWZC/3ARcgJPTTGa+WMDjs1sCGz
         hAJOTeLNBGoTrgn63VcheYdOsnr3rihcQ7gSl17aXmp5oXdeYdin1sQ0wtwpLbkMPd
         gvnWCW7oIuMe3ciOPsbHGa/nr2xx6KpcjOQZK1DI=
Date:   Mon, 16 Dec 2019 14:39:31 +0100
From:   Maxime Ripard <mripard@kernel.org>
To:     Chen-Yu Tsai <wens@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 11/14] ARM: dts: sun8i: r40: Add device node for CSI0
Message-ID: <20191216133931.wliwn5woy3hstdg3@gilmour.lan>
References: <20191215165924.28314-1-wens@kernel.org>
 <20191215165924.28314-12-wens@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qmlybd2b72avx3db"
Content-Disposition: inline
In-Reply-To: <20191215165924.28314-12-wens@kernel.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--qmlybd2b72avx3db
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 16, 2019 at 12:59:21AM +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
>
> The CSI0 and CSI1 blocks are the same as found on the A20. However only
> CSI0 is supported upstream right now.
>
> Add a device node for CSI0 using the A20 compatible as a fallback, and
> the standard pinctrl options. Also add the MBUS interconnect.
>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  arch/arm/boot/dts/sun8i-r40.dtsi | 36 ++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r40.dtsi
> index 82ea0b5b0710..2d1e97cc4155 100644
> --- a/arch/arm/boot/dts/sun8i-r40.dtsi
> +++ b/arch/arm/boot/dts/sun8i-r40.dtsi
> @@ -180,6 +180,20 @@ nmi_intc: interrupt-controller@1c00030 {
>  			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>
> +		csi0: csi@1c09000 {
> +			compatible = "allwinner,sun8i-r40-csi0",
> +				     "allwinner,sun7i-a20-csi0";
> +			reg = <0x01c09000 0x1000>;
> +			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_BUS_CSI0>, <&ccu CLK_CSI_SCLK>,
> +				 <&ccu CLK_DRAM_CSI0>;
> +			clock-names = "bus", "isp", "ram";
> +			resets = <&ccu RST_BUS_CSI0>;
> +			interconnects = <&mbus 5>;
> +			interconnect-names = "dma-mem";
> +			status = "disabled";
> +		};
> +
>  		mmc0: mmc@1c0f000 {
>  			compatible = "allwinner,sun8i-r40-mmc",
>  				     "allwinner,sun50i-a64-mmc";
> @@ -355,6 +369,20 @@ clk_out_a_pin: clk-out-a-pin {
>  				function = "clk_out_a";
>  			};
>
> +			/omit-if-no-ref/
> +			csi0_8bits_pins: csi0-8bits-pins {
> +				pins = "PE0", "PE2", "PE3", "PE4", "PE5",
> +				       "PE6", "PE7", "PE8", "PE9", "PE10",
> +				       "PE11";
> +				function = "csi0";
> +			};
> +
> +			/omit-if-no-ref/
> +			csi0_mclk_pin: csi0-mclk-pin {
> +				pins = "PE1";
> +				function = "csi0";
> +			};
> +
>  			gmac_rgmii_pins: gmac-rgmii-pins {
>  				pins = "PA0", "PA1", "PA2", "PA3",
>  				       "PA4", "PA5", "PA6", "PA7",
> @@ -624,6 +652,14 @@ gmac_mdio: mdio {
>  			};
>  		};
>
> +		mbus: dram-controller@1c62000 {
> +			compatible = "allwinner,sun8i-r40-mbus";
> +			reg = <0x01c62000 0x1000>;
> +			clocks = <&ccu 155>;

We should export the clock too?

Maxime
>

--qmlybd2b72avx3db
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfeJEwAKCRDj7w1vZxhR
xX4mAP9raoaBd1QdA12eLJMz9YoIz/KDkCY7IQsU8z/3jU+6kAEA/VtzPoBPHD0K
JHbPLHhucKTZH4r3G5PLW3g/rkleMQA=
=CsA8
-----END PGP SIGNATURE-----

--qmlybd2b72avx3db--
