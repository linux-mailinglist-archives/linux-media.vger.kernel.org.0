Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED89154E57
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2020 22:50:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727509AbgBFVt4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Feb 2020 16:49:56 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:35937 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbgBFVt4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Feb 2020 16:49:56 -0500
Received: by mail-pj1-f66.google.com with SMTP id gv17so12795pjb.1;
        Thu, 06 Feb 2020 13:49:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rLHr9RkGPW2j2XQRzleEq5XgRf6xszSSLPZxWj4wwdQ=;
        b=TNfKDmob8zK8gBVpftfEL0XJhSAS9qQmRvggNoWraApLqX/8e20VDHhZeD/RGC6cb9
         bEcu0c22U2RAF0dYIN+vk+4VcUKlq+Wcqfx0h+SA64vD3B7aigXx7b7KxcIsCwPqEe5P
         ehmSuk5cQK6D3NqWqmMZmG1AFyAMGsygGeluz0tyqf4riU8qV3GgyqMoL8Shdvn5hEd+
         TLJweBslDFF/shjzqFB+xaCe2xFE8/NwYyFMwPEBWCoE9IZ5+/6qztg21Pz5fsjhxF0z
         Kje8vGJaeV5rX4DSva5kWMBiznxbfgZHHcNAV19TbQDmIHs1ta6S/+4AOg7LOI+4RuO6
         LMjA==
X-Gm-Message-State: APjAAAX9rniwNUEVNwzFruTD0vsfmKbhqEkPRZ3Do8jLWPK+EpNFOGgJ
        4OrgBVZWQmmcWKszdk09bQ==
X-Google-Smtp-Source: APXvYqwkwapEilpTs36vHDOSSgYgt04Nnz3fqFepzi44J73hw88iaNQ98Bk3mxxDhgjhBse4LxyTew==
X-Received: by 2002:a17:902:9a4c:: with SMTP id x12mr5937233plv.297.1581025795514;
        Thu, 06 Feb 2020 13:49:55 -0800 (PST)
Received: from rob-hp-laptop (63-158-47-182.dia.static.qwest.net. [63.158.47.182])
        by smtp.gmail.com with ESMTPSA id 84sm350093pgg.90.2020.02.06.13.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 13:49:55 -0800 (PST)
Received: (nullmailer pid 7220 invoked by uid 1000);
        Thu, 06 Feb 2020 21:49:53 -0000
Date:   Thu, 6 Feb 2020 14:49:53 -0700
From:   Rob Herring <robh@kernel.org>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, helen.koike@collabora.com, sboyd@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 3/6] dt-binding: tegra: Add VI and CSI bindings
Message-ID: <20200206214953.GA4995@bogus>
References: <1580937806-17376-1-git-send-email-skomatineni@nvidia.com>
 <1580937806-17376-4-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1580937806-17376-4-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 05, 2020 at 01:23:23PM -0800, Sowjanya Komatineni wrote:
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

Thierry is working on converting this to schema, so you'll need to 
coordinate.

Rob

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
> +				compatible = "nvidia,tegra210-csi";
> +				reg = <0x0 0x54080838 0x0 0x2000>;
> +				status = "disabled";
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
