Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E2F79B3E7
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2019 17:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436572AbfHWPvW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 11:51:22 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:43032 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436570AbfHWPvW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 11:51:22 -0400
Received: by mail-lf1-f66.google.com with SMTP id c19so7455991lfm.10
        for <linux-media@vger.kernel.org>; Fri, 23 Aug 2019 08:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=c0jihdx+9pIsDhMUnwWxd5RgGSmywWM1YY3X7RdKEII=;
        b=bnPK7TDD2iixrAyCNpHY7nk3eZ1VgKhma55JC+aqyzd0cv+yWmVkPL3i1jPlk/3AnY
         0CbpzjZtVHpyMVRfER7Tw5hPopVCwphN6+6salPBwbaRrV7RQs6EjIy86/YIuVJYqt1/
         I3AZf36iFQI2LHt2ATVb0mYC7H0xcbmn+3f2Qm9GEs5NQN+TVELRstAH3w79YRJ+fz6i
         mLYxSCmqjS7tHRK3Wca9l0GlSkTA8HvIqX5NgKyJmjr7IidUSeiZ1Ld1fBwUMrKc9dZV
         cfxfPaRPjSu8vz/+pGNiOGnxvXcrnGCZ8Yorui9j431RraNmDwV4GC1KeCxIgHMXbeS5
         OEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=c0jihdx+9pIsDhMUnwWxd5RgGSmywWM1YY3X7RdKEII=;
        b=X6+zJlIh441vRcFWB34dGT0qrGrdMdG8uwbee2P6nOeDnSbTc3SSaMAvRq5Kxu3aWl
         xg8tCK1FUXDC5NtDebIe6m7dv0rWx57Z1tPs5/yiss2bdFykgW4z4q92dyiS2a1iiTr/
         kv3VoXCdsMXZy0lcYVgox0drrYto8kdKz1YMZTGWKA9tnBGEm7+glAjAUywzszbpB1S8
         RM4/667JN6YY2rqRekbkN2KKG1xdEPLHz7R/PdjY6CbEFYHcQiqi2iaRybMEIdV6ocUn
         CYsAkljJVOk8/k70ghWWg++ca1w2/FJRC6Jutx1LiE2DnX4NTOZu/ZdeyyXyBx3XeNA/
         Gsqg==
X-Gm-Message-State: APjAAAVLB7pqxyRrZ2ATjzF8hG7zmhRwGv1bRe9noPmt1cz8mDTUKwTJ
        ASMw73syq2X2m/xBV2NsPEG25g==
X-Google-Smtp-Source: APXvYqyK0UO+n3n75wo+gE5IghCPaEK7YucPn0UKAnyKPS7EW/YAjWwWUoNQGAj9u9Vd7/0Fs1Zvgg==
X-Received: by 2002:a19:dc14:: with SMTP id t20mr3274439lfg.182.1566575478748;
        Fri, 23 Aug 2019 08:51:18 -0700 (PDT)
Received: from localhost (h-177-236.A463.priv.bahnhof.se. [217.31.177.236])
        by smtp.gmail.com with ESMTPSA id f18sm712801ljj.60.2019.08.23.08.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2019 08:51:18 -0700 (PDT)
Date:   Fri, 23 Aug 2019 17:51:17 +0200
From:   Niklas Soderlund <niklas.soderlund@ragnatech.se>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: bindings: video-interfaces: Update the example
Message-ID: <20190823155117.GF28351@bigcity.dyn.berto.se>
References: <20190822210433.767-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190822210433.767-1-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thanks for your patch.

On 2019-08-22 23:04:33 +0200, Jacopo Mondi wrote:
> The example provided by the video-interface.txt file uses compatible
> values for drivers which are have been removed a long time ago. To avoid
> generating confusion, replace the existing example with a new one using
> upstream maintained and more modern devices.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> ---
> This patch has been triggered by Simon's attempt to rename the bindings
> for the now removed soc-camera based sh-mobile-ceu device, which is used in
> this example:
> https://patchwork.kernel.org/patch/11101079/
> 
> As soon as that driver is not mentioned in the example anymore, its
> bindings documentation could be removed as well.
> ---
>  .../bindings/media/video-interfaces.txt       | 223 ++++++++++--------
>  1 file changed, 130 insertions(+), 93 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> index f884ada0bffc..cce80fd0ea13 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> @@ -153,123 +153,160 @@ Optional endpoint properties
>  Example
>  -------
> 
> -The example snippet below describes two data pipelines.  ov772x and imx074 are
> -camera sensors with a parallel and serial (MIPI CSI-2) video bus respectively.
> -Both sensors are on the I2C control bus corresponding to the i2c0 controller
> -node.  ov772x sensor is linked directly to the ceu0 video host interface.
> -imx074 is linked to ceu0 through the MIPI CSI-2 receiver (csi2). ceu0 has a
> -(single) DMA engine writing captured data to memory.  ceu0 node has a single
> -'port' node which may indicate that at any time only one of the following data
> -pipelines can be active: ov772x -> ceu0 or imx074 -> csi2 -> ceu0.
> -
> -	ceu0: ceu@fe910000 {
> -		compatible = "renesas,sh-mobile-ceu";
> -		reg = <0xfe910000 0xa0>;
> -		interrupts = <0x880>;
> -
> -		mclk: master_clock {
> -			compatible = "renesas,ceu-clock";
> -			#clock-cells = <1>;
> -			clock-frequency = <50000000>;	/* Max clock frequency */
> -			clock-output-names = "mclk";
> -		};
> +Te example snippet below describes two data pipelines connected to a video

s/Te/The/

> +DMA engine (VIN4) which has a direct parallel video bus connection to an HDMI
> +video decoder at port@0 and a data path to a CSI-2 receiver connected to an
> +image sensor (imx074) at port@1.
> 
> -		port {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> +The parallel HDMI video decoder links directly to the VIN input port 0, and the
> +bus configuration at both ends is specified in each endpoint.
> 
> -			/* Parallel bus endpoint */
> -			ceu0_1: endpoint@1 {
> -				reg = <1>;		/* Local endpoint # */
> -				remote = <&ov772x_1_1>;	/* Remote phandle */
> -				bus-width = <8>;	/* Used data lines */
> -				data-shift = <2>;	/* Lines 9:2 are used */
> +The imx074 sensor connects to the CSI-2 receiver and the MIPI CSI-2 serial bus
> +configuration is specified in the respective endpoints as well. The CSI-2
> +receiver is then linked to the DMA engine through a direct data path which does
> +not require any endpoint configuration.
> 
> -				/* If hsync-active/vsync-active are missing,
> -				   embedded BT.656 sync is used */
> -				hsync-active = <0>;	/* Active low */
> -				vsync-active = <0>;	/* Active low */
> -				data-active = <1>;	/* Active high */
> -				pclk-sample = <1>;	/* Rising */
> -			};
> +i2c0: i2c@e6500000 {
> +
> +	hdmi-decoder@4c {
> +		compatible = "adi,adv7612";
> +		reg = <0x4c>;
> 
> -			/* MIPI CSI-2 bus endpoint */
> -			ceu0_0: endpoint@0 {
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
>  				reg = <0>;
> -				remote = <&csi2_2>;
> +				adv7612_in: endpoint {
> +					remote-endpoint = <&hdmi_con_in>;
> +				};
>  			};
> -		};
> -	};
> 
> -	i2c0: i2c@fff20000 {
> -		...
> -		ov772x_1: camera@21 {
> -			compatible = "ovti,ov772x";
> -			reg = <0x21>;
> -			vddio-supply = <&regulator1>;
> -			vddcore-supply = <&regulator2>;
> -
> -			clock-frequency = <20000000>;
> -			clocks = <&mclk 0>;
> -			clock-names = "xclk";
> -
> -			port {
> -				/* With 1 endpoint per port no need for addresses. */
> -				ov772x_1_1: endpoint {
> +			port@2 {
> +				reg = <2>;
> +				adv7612_out: endpoint {
> +					bus-type = 5;
>  					bus-width = <8>;
> -					remote-endpoint = <&ceu0_1>;
> -					hsync-active = <1>;
> -					vsync-active = <0>; /* Who came up with an
> +					pclk-sample = <0>;
> +					hsync-active = <0>;
> +					vsync-active = <1>; /* Who came up with an
>  							       inverter here ?... */
> -					data-active = <1>;
> -					pclk-sample = <1>;
> +					remote-endpoint = <&vin4_digital_in>;
>  				};
>  			};
>  		};
> + 	};
> 
> -		imx074: camera@1a {
> -			compatible = "sony,imx074";
> -			reg = <0x1a>;
> -			vddio-supply = <&regulator1>;
> -			vddcore-supply = <&regulator2>;
> -
> -			clock-frequency = <30000000>;	/* Shared clock with ov772x_1 */
> -			clocks = <&mclk 0>;
> -			clock-names = "sysclk";		/* Assuming this is the
> -							   name in the datasheet */
> -			port {
> -				imx074_1: endpoint {
> -					clock-lanes = <0>;
> -					data-lanes = <1 2>;
> -					remote-endpoint = <&csi2_1>;
> -				};
> +
> +	imx074: camera@1a {
> +		compatible = "sony,imx074";
> +		reg = <0x1a>;
> +
> +		rotation = <180>; /* The camera is mounted upside down! */
> +
> +		/* With a single port, use 'port' and not 'ports'. */
> +		port {
> +			/* With 1 endpoint per port no need for addresses. */
> +			imx074_1: endpoint {
> +				bus-type = 4;
> +				/* If lane re-ordering is not supported, no
> +				   need to tell where the clock lane is! */
> +				/* clock-lanes = <0>; */
> +				/* But the number of data lanes is important! */
> +				data-lanes = <1 2>;
> +				remote-endpoint = <&csi20_in>;
>  			};
>  		};
>  	};
> +};
> 
> -	csi2: csi2@ffc90000 {
> -		compatible = "renesas,sh-mobile-csi2";
> -		reg = <0xffc90000 0x1000>;
> -		interrupts = <0x17a0>;
> +csi20: csi2@fea80000 {
> +	compatible = "renesas,r8a7795-csi2";
> +	reg = <0 0xfea80000 0 0x10000>;
> +	interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
> +	clocks = <&cpg CPG_MOD 714>;
> +	power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> +	resets = <&cpg 714>;

Do we need all reg, interrupts, clocks, power-domains and resets in the 
example?

> +
> +	ports {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> 
> -		port@1 {
> -			compatible = "renesas,csi2c";	/* One of CSI2I and CSI2C. */
> -			reg = <1>;			/* CSI-2 PHY #1 of 2: PHY_S,
> -							   PHY_M has port address 0,
> -							   is unused. */
> -			csi2_1: endpoint {
> -				clock-lanes = <0>;
> -				data-lanes = <2 1>;
> +		port@0 {
> +			reg = <0>;
> +
> +			csi20_in: endpoint {
> +				bus-type = 4;
> +				/* Use the same number of data lanes as the
> +				   one used by the remote endpoint! */

nit: Do this comment bring value, or is it confusing?

> +				data-lanes = <1 2>;
>  				remote-endpoint = <&imx074_1>;
>  			};
>  		};
> -		port@2 {
> -			reg = <2>;			/* port 2: link to the CEU */
> 
> -			csi2_2: endpoint {
> -				remote-endpoint = <&ceu0_0>;
> +		port@1 {
> +			reg = <1>;
> +
> +			/* Data path to the VIN4 DMA engine. */

Needed?

> +			csi20vin4: endpoint {
> +				remote-endpoint = <&vin4csi20>;
> +			};
> +		};
> +	};
> +};
> +
> +vin4: video@e6ef4000 {
> +	compatible = "renesas,vin-r8a7795";
> +	reg = <0 0xe6ef4000 0 0x1000>;
> +	interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +	clocks = <&cpg CPG_MOD 807>;
> +	power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> +	resets = <&cpg 807>;
> +	renesas,id = <4>;

Same comment as above, is all properties needed in the example?  
Specially renesas,id can be confusing as it's a driver specific binding 
needed to workaround a fun hardware design.

> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/* Parallel input port: HDMI decoder */
> +		port@0 {
> +			reg = <0>;
> +
> +			vin4_digital_in: endpoint {
> +				bus-type = 5;
> +				bus-width = <8>;	/* Used data lines */
> +				data-shift = <2>;	/* Lines 9:2 are used */
> +				data-active = <1>;	/* Active high */
> +				pclk-sample = <0>;	/* Falling */
> +				/* If hsync-active/vsync-active are missing,
> +				 * embedded BT.656 sync is used */

I feel if this comment is to be kept it should be expanded.

> +				hsync-active = <0>;
> +				vsync-active = <0>;
> +				remote-endpoint = <&adv7612_out>;
> +			};
> +		};
> +
> +
> +		/* Data path to the MIPI CSI-2 receiver. */
> +		port@1 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			reg =<1>;
> +
> +			/* Need endpoint numbers when multiple endpoints are
> +			   present. */

I think this can be dropped.

> +			vin4csi20: endpoint@0 {
> +				reg = <0>;
> +				remote-endpoint = <&csi20vin4>;
> +			};
> +
> +			/* Not connected in this example. */
> +			vin4csi41: endpoint@3 {
> +				reg = <3>;
> +				remote-endpoint = <&csi41vin4>;
>  			};
>  		};
>  	};
> +};
> --
> 2.22.0
> 

-- 
Regards,
Niklas S�derlund
