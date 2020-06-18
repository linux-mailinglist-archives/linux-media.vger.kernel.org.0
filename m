Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEE421FF94A
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 18:33:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731442AbgFRQdG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jun 2020 12:33:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726928AbgFRQdB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jun 2020 12:33:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0039C06174E;
        Thu, 18 Jun 2020 09:33:00 -0700 (PDT)
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 69639F9;
        Thu, 18 Jun 2020 18:32:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592497979;
        bh=2XvQ8lvtBFX1pJ2c3Ah8gJn3/nzxKE0ahnvb5kGEzMw=;
        h=Reply-To:Subject:To:References:From:Date:In-Reply-To:From;
        b=ZxFQaEp93WPr15dt/79iXKzoPACINSOR1HfYDu1LRHbuHf0AnkECpRXSr3qLYHxPh
         MHcq3+GImmRvLxF2eDYZHLE4rxYuDbhrDB670lLeN1ax6BEdhJodZmEzJQ/m/TqVZS
         78vbL2crwVkmpPgvjY/7CgwLXAHY38u1S3/5Z6+U=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v5 9/9] arm64: dts: renesas: salvator: add a connection
 from adv748x codec (HDMI input) to the R-Car SoC
To:     Alex Riesen <alexander.riesen@cetitec.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1585852001.git.alexander.riesen@cetitec.com>
 <90f2c14fcbe5d06eefdaeadbe8a6efc8c91523f3.1585852001.git.alexander.riesen@cetitec.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <fd19ca3c-e815-499e-0c46-0a4e2684b6b9@ideasonboard.com>
Date:   Thu, 18 Jun 2020 17:32:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <90f2c14fcbe5d06eefdaeadbe8a6efc8c91523f3.1585852001.git.alexander.riesen@cetitec.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alex,

On 02/04/2020 19:35, Alex Riesen wrote:
> As all known variants of the Salvator board have the HDMI decoder
> chip (the ADV7482) connected to the SSI4 on R-Car SoC, the ADV7482
> endpoint and the connection definitions are placed in the common board
> file.
> 
> For the same reason, the CLK_C clock line and I2C configuration (similar
> to the ak4613, on the same interface) are added into the common file.
> 
> Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
> 
> --
> 
> v5: Add dummy ssi4 node to the rcar sound card in r8a77961, as the
>     devices (Salvator-X 2nd version with R-Car M3 W+) also reference
>     salvator-common.dtsi.
>     Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> v2: Also add ssi4_ctrl pin group in the sound pins. The pins are
>     responsible for SCK4 (sample clock) WS4 and (word boundary input),
>     and are required for SSI audio input over I2S.
> 
>     The adv748x shall provide its own implementation of the output clock
>     (MCLK), connected to the audio_clk_c line of the R-Car SoC.
> 
>     If the frequency of the ADV748x MCLK were fixed, the clock
>     implementation were not necessary, but it does not seem so: the MCLK
>     depends on the value in a speed multiplier register and the input sample
>     rate (48kHz).
> 
>     Remove audio clock C from the clocks of adv7482.
> 
>     The clocks property of the video-receiver node lists the input
>     clocks of the device, which is quite the opposite from the
>     original intention: the adv7482 on Salvator X boards is a
>     provide of the MCLK clock for I2S audio output.
> 
>     Remove old definition of &sound_card.dais and reduce size of changes
>     in the Salvator-X specific device tree source.
> 
>     Declare video-receiver a clock producer, as the adv748x driver
>     implements the master clock used I2S audio output.
> 
>     Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> v2: The driver provides only MCLK clock, not the SCLK and LRCLK,
>     which are part of the I2S protocol.
> 
>     Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../boot/dts/renesas/r8a77950-salvator-x.dts  |  3 +-
>  arch/arm64/boot/dts/renesas/r8a77961.dtsi     |  1 +
>  .../boot/dts/renesas/salvator-common.dtsi     | 47 +++++++++++++++++--
>  3 files changed, 45 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dts
> index 2438825c9b22..e16c146808b6 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dts
> @@ -146,7 +146,8 @@ &sata {
>  &sound_card {
>  	dais = <&rsnd_port0	/* ak4613 */
>  		&rsnd_port1	/* HDMI0  */
> -		&rsnd_port2>;	/* HDMI1  */
> +		&rsnd_port2	/* HDMI1  */
> +		&rsnd_port3>;	/* adv7482 hdmi-in  */

Ah - that was confusing at first... but HDMI0 and HDMI1 are *outputs*,
where of course the adv7482 is an input ;-)


Otherwise, I can't spot anything else yet so:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

But I fear there may have been some churn around here, so it would be
good to see a rebase too.

--
Kieran



>  };
>  
>  &usb2_phy2 {
> diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> index be3824bda632..b79907beaf31 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> @@ -861,6 +861,7 @@ rcar_sound,src {
>  			rcar_sound,ssi {
>  				ssi0: ssi-0 { };
>  				ssi1: ssi-1 { };
> +				ssi4: ssi-4 { };
>  			};
>  		};
>  
> diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> index 98bbcafc8c0d..ead7f8d7a929 100644
> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> @@ -460,7 +460,7 @@ pca9654: gpio@20 {
>  		#gpio-cells = <2>;
>  	};
>  
> -	video-receiver@70 {
> +	adv7482_hdmi_in: video-receiver@70 {
>  		compatible = "adi,adv7482";
>  		reg = <0x70 0x71 0x72 0x73 0x74 0x75
>  		       0x60 0x61 0x62 0x63 0x64 0x65>;
> @@ -469,6 +469,7 @@ video-receiver@70 {
>  
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> +		#clock-cells = <0>; /* the MCLK for I2S output */
>  
>  		interrupt-parent = <&gpio6>;
>  		interrupt-names = "intrq1", "intrq2";
> @@ -510,6 +511,15 @@ adv7482_txb: endpoint {
>  				remote-endpoint = <&csi20_in>;
>  			};
>  		};
> +
> +		port@c {
> +			reg = <12>;
> +
> +			adv7482_i2s: endpoint {
> +				remote-endpoint = <&rsnd_endpoint3>;
> +				system-clock-direction-out;
> +			};
> +		};
>  	};
>  
>  	csa_vdd: adc@7c {
> @@ -684,7 +694,8 @@ sdhi3_pins_uhs: sd3_uhs {
>  	};
>  
>  	sound_pins: sound {
> -		groups = "ssi01239_ctrl", "ssi0_data", "ssi1_data_a";
> +		groups = "ssi01239_ctrl", "ssi0_data", "ssi1_data_a",
> +			 "ssi4_data", "ssi4_ctrl";
>  		function = "ssi";
>  	};
>  
> @@ -733,8 +744,8 @@ &rcar_sound {
>  	pinctrl-0 = <&sound_pins &sound_clk_pins>;
>  	pinctrl-names = "default";
>  
> -	/* Single DAI */
> -	#sound-dai-cells = <0>;
> +	/* multi DAI */
> +	#sound-dai-cells = <1>;
>  
>  	/* audio_clkout0/1/2/3 */
>  	#clock-cells = <1>;
> @@ -758,8 +769,19 @@ &rcar_sound {
>  		 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
>  		 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
>  		 <&audio_clk_a>, <&cs2000>,
> -		 <&audio_clk_c>,
> +		 <&adv7482_hdmi_in>,
>  		 <&cpg CPG_CORE CPG_AUDIO_CLK_I>;
> +	clock-names = "ssi-all",
> +		      "ssi.9", "ssi.8", "ssi.7", "ssi.6",
> +		      "ssi.5", "ssi.4", "ssi.3", "ssi.2",
> +		      "ssi.1", "ssi.0",
> +		      "src.9", "src.8", "src.7", "src.6",
> +		      "src.5", "src.4", "src.3", "src.2",
> +		      "src.1", "src.0",
> +		      "mix.1", "mix.0",
> +		      "ctu.1", "ctu.0",
> +		      "dvc.0", "dvc.1",
> +		      "clk_a", "clk_b", "clk_c", "clk_i";
>  
>  	ports {
>  		#address-cells = <1>;
> @@ -777,6 +799,21 @@ rsnd_endpoint0: endpoint {
>  				capture  = <&ssi1 &src1 &dvc1>;
>  			};
>  		};
> +		rsnd_port3: port@3 {
> +			reg = <3>;
> +			rsnd_endpoint3: endpoint {
> +				remote-endpoint = <&adv7482_i2s>;
> +
> +				dai-tdm-slot-num = <8>;
> +				dai-tdm-slot-width = <32>;
> +				dai-format = "left_j";
> +				mclk-fs = <256>;
> +				bitclock-master = <&adv7482_i2s>;
> +				frame-master = <&adv7482_i2s>;
> +
> +				capture = <&ssi4>;
> +			};
> +		};
>  	};
>  };
>  
> 

-- 
Regards
--
Kieran
