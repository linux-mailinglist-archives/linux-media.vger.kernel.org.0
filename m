Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55DCD163703
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 00:15:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727851AbgBRXPH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Feb 2020 18:15:07 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35458 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727635AbgBRXPG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Feb 2020 18:15:06 -0500
Received: by mail-ot1-f67.google.com with SMTP id r16so21334333otd.2;
        Tue, 18 Feb 2020 15:15:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=G4WNEhQO20vNtBJwI7oQMtpqp8OCtjLcIlARAY579Do=;
        b=WTH6j54BqdBaSzT+y1ao52Wn0APSvmvcAcgWBm/OpVPkRpEIuucAQZumAmSEGvxaqj
         61xLW3nCmucalCD9TMpBVWd3Oq4SrLg9waurxp8L0pewa2Riu7Po5CCu7thssF256O8O
         L3vIxVMcj50nRuNODVBeSyXcuaGvBVeLor+4c4hyk+WXahQ/9nuPmHYMwbF+uBuyVWXH
         y9XtPeHsErRdCuW96chNruZ4MhsbcDNWD5FpCvdafkbrMpDoQt0Oh1vpBm6AHq1yVplj
         Peb/ib1djfwukOZGVBHkMPCdmhoo+58zAgeSM9Y2FqDsgrJ3yOY7Ltc+rt140ZK2Jjej
         22Dw==
X-Gm-Message-State: APjAAAXYGLe/VJSQUksq6j6IRIM1iQgtPYN2IugUdpWUDIHNw35/+LM7
        WHsBd20UJvt+1E+Bl7U0Jw==
X-Google-Smtp-Source: APXvYqwW+XFF6Vp8UgFF8kVdHeUlJefeBvJgDBj4dBF+mFylUww+21EMO3di/ZeLcp2dJQvp5DyM+g==
X-Received: by 2002:a05:6830:1294:: with SMTP id z20mr17143801otp.60.1582067705428;
        Tue, 18 Feb 2020 15:15:05 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j13sm122236oii.14.2020.02.18.15.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 15:15:04 -0800 (PST)
Received: (nullmailer pid 27451 invoked by uid 1000);
        Tue, 18 Feb 2020 23:15:03 -0000
Date:   Tue, 18 Feb 2020 17:15:03 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, helen.koike@collabora.com, sboyd@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v3 3/6] dt-binding: tegra: Add VI and CSI bindings
Message-ID: <20200218231503.GA19099@bogus>
References: <1581704608-31219-1-git-send-email-skomatineni@nvidia.com>
 <1581704608-31219-4-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1581704608-31219-4-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Feb 14, 2020 at 10:23:25AM -0800, Sowjanya Komatineni wrote:
> Tegra contains VI controller which can support up to 6 MIPI CSI
> camera sensors.
> 
> Each Tegra CSI port from CSI unit can be one-to-one mapper to
> VI channel and can capture from an external camera sensor or
> from built-in test pattern generator.
> 
> This patch adds dt-bindings for Tegra VI and CSI.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  .../display/tegra/nvidia,tegra20-host1x.txt        | 55 ++++++++++++++++++----
>  1 file changed, 47 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> index 9999255ac5b6..3d0ed540a646 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> @@ -40,14 +40,24 @@ of the following host1x client modules:
>  
>    Required properties:
>    - compatible: "nvidia,tegra<chip>-vi"
> -  - reg: Physical base address and length of the controller's registers.
> +  - reg: Physical base address and length of the controller registers.
>    - interrupts: The interrupt outputs from the controller.
> -  - clocks: Must contain one entry, for the module clock.
> +  - clocks: Must contain an entry for the module clock "vi"
>      See ../clocks/clock-bindings.txt for details.
>    - resets: Must contain an entry for each entry in reset-names.
>      See ../reset/reset.txt for details.
> -  - reset-names: Must include the following entries:
> -    - vi
> +  - reset-names: Must include the entry "vi"
> +
> +  Tegra210 has CSI part of VI sharing same host interface and register
> +  space. So, VI device node should have CSI child node.
> +
> +  - csi: mipi csi interface to vi
> +
> +    Required properties:
> +    - compatible: "nvidia,tegra<chip>-csi"
> +    - reg: Physical base address and length of the controller registers.
> +    - clocks: Must contain entries csi, cilab, cilcd, cile clocks.
> +      See ../clocks/clock-bindings.txt for details.
>  
>  - epp: encoder pre-processor
>  
> @@ -310,12 +320,41 @@ Example:
>  		};
>  
>  		vi {
> -			compatible = "nvidia,tegra20-vi";
> -			reg = <0x54080000 0x00040000>;
> +			compatible = "nvidia,tegra210-vi";
> +			reg = <0x0 0x54080000 0x0 0x700>;
>  			interrupts = <0 69 0x04>;
> -			clocks = <&tegra_car TEGRA20_CLK_VI>;
> -			resets = <&tegra_car 100>;
> +			assigned-clocks = <&tegra_car TEGRA210_CLK_VI>;
> +			assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_C4_OUT0>;
> +			clocks = <&tegra_car TEGRA210_CLK_VI>;
> +			clock-names = "vi";
> +			resets = <&tegra_car 20>;
>  			reset-names = "vi";
> +
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +
> +			ranges = <0x0 0x54080808 0x0 0x54080808 0x0 0x2000>;
> +
> +			csi@0x54080838 {

Drop '0x'

> +				compatible = "nvidia,tegra210-csi";
> +				reg = <0x0 0x54080838 0x0 0x2000>;

Kind of odd that this address and ranges address are not the same. And 
also wrong that the size here exceeds the bounds of ranges.

Also, best practice is to make the child address 0 or relative to the 
parent.

> +				status = "disabled";

Don't show status in examples.

> +				assigned-clocks = <&tegra_car TEGRA210_CLK_CILAB>,
> +						  <&tegra_car TEGRA210_CLK_CILCD>,
> +						  <&tegra_car TEGRA210_CLK_CILE>;
> +				assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_P>,
> +							 <&tegra_car TEGRA210_CLK_PLL_P>,
> +							 <&tegra_car TEGRA210_CLK_PLL_P>;
> +				assigned-clock-rates = <102000000>,
> +						       <102000000>,
> +						       <102000000>;
> +				clocks = <&tegra_car TEGRA210_CLK_CSI>,
> +					 <&tegra_car TEGRA210_CLK_CILAB>,
> +					 <&tegra_car TEGRA210_CLK_CILCD>,
> +					 <&tegra_car TEGRA210_CLK_CILE>;
> +				clock-names = "csi", "cilab", "cilcd", "cile";
> +			};
> +
>  		};
>  
>  		epp {
> -- 
> 2.7.4
> 
