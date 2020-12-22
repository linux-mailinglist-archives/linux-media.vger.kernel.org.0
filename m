Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BF012E0356
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 01:15:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726361AbgLVAPm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Dec 2020 19:15:42 -0500
Received: from mail-ot1-f50.google.com ([209.85.210.50]:44989 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbgLVAPm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Dec 2020 19:15:42 -0500
Received: by mail-ot1-f50.google.com with SMTP id f16so10425491otl.11;
        Mon, 21 Dec 2020 16:15:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CZCTVp7dSrXEn5R6AF0sfezyGRuCo+PRxp9JIcTZ/OQ=;
        b=q0zSgVD9VF/uxyNks99qK/Q7DAfaj2ywzxRn5u4ufTSV4IF2noXNN9e21qu6W+PQ4P
         1oDkWSsocv9jobZeVPyISgaZ3n/t5CPrkwaF70GwaVk8EkHx9E+NlBVKfNyRi6ntj//1
         aKh9DM2ydRu5AZ7M08Af13X6SEy34ocHuEBPGF42umWoMe39WoK4GN/Yh7zYGm2r/GMp
         kpiPFY/ww7cbdisuQH2pMZNTTczOkzWzX4jI4WlF+kgo93qh/891vtUBrWq/u53FILhU
         YXAT2CNnGvK44E9mQsiNx1KvXXyZJ7+bAXBKio5/yfNLBXSpOjoqBROV9TyWOrAGi1lC
         QNUQ==
X-Gm-Message-State: AOAM532K9PjiM4F0AxUHzrG87FIK7BSLfhGtcWzOD383HlrhYrQmf/T7
        l8vgGjTkCvdATI6B6AGwd/VGxHt90g==
X-Google-Smtp-Source: ABdhPJzwI6oFeOVHPaze1aIeGaY36Y4EuT1YpNmyFUot22+xHR7ZIZmRzD/T0REyCMYip94Hk4WIlw==
X-Received: by 2002:a9d:63c6:: with SMTP id e6mr13808424otl.326.1608596100596;
        Mon, 21 Dec 2020 16:15:00 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id m7sm971797ool.29.2020.12.21.16.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 16:14:59 -0800 (PST)
Received: (nullmailer pid 901351 invoked by uid 1000);
        Tue, 22 Dec 2020 00:14:57 -0000
Date:   Mon, 21 Dec 2020 17:14:57 -0700
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 06/48] dt-bindings: clock: tegra: Document clocks
 sub-node
Message-ID: <20201222001457.GA891962@robh.at.kernel.org>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-7-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201217180638.22748-7-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 17, 2020 at 09:05:56PM +0300, Dmitry Osipenko wrote:
> Document "clocks" sub-node which describes Tegra SoC clocks that require
> a higher voltage of the core power domain in order to operate properly on
> a higher rates.

Seems like an odd reason to have a bunch of child nodes. It very much 
seems like a problem you'd need to solve after you design the binding 
which should be fixed within the kernel.

This is also above my threshold for 'convert to schema' first...

> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/clock/nvidia,tegra20-car.txt     | 26 +++++++++++++++++++
>  .../bindings/clock/nvidia,tegra30-car.txt     | 26 +++++++++++++++++++
>  2 files changed, 52 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
> index 6c5901b503d0..353354477785 100644
> --- a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
> +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
> @@ -19,6 +19,16 @@ Required properties :
>    In clock consumers, this cell represents the bit number in the CAR's
>    array of CLK_RST_CONTROLLER_RST_DEVICES_* registers.
>  
> +Optional child sub-node "clocks" should contain nodes matching the clocks
> +on the Tegra SoC. Refer to Tegra TRM for mode details on the clock nodes.
> +
> +Required properties :
> +- compatible : Should be "nvidia,tegra20-clock".
> +- operating-points-v2: See ../bindings/opp/opp.txt for details.
> +- clocks : Should contain clock which corresponds to the node.
> +- power-domains: Phandle to a power domain node as described by generic
> +                 PM domain bindings.
> +
>  Example SoC include file:
>  
>  / {
> @@ -27,6 +37,22 @@ Example SoC include file:
>  		reg = <0x60006000 0x1000>;
>  		#clock-cells = <1>;
>  		#reset-cells = <1>;
> +
> +		clocks {
> +			hdmi {
> +				compatible = "nvidia,tegra20-clock";
> +				operating-points-v2 = <&hdmi_opp_table>;
> +				clocks = <&tegra_car TEGRA20_CLK_HDMI>;
> +				power-domains = <&domain>;
> +			};
> +
> +			pll_m {
> +				compatible = "nvidia,tegra20-clock";
> +				operating-points-v2 = <&pll_m_opp_table>;
> +				clocks = <&tegra_car TEGRA20_CLK_PLL_M>;
> +				power-domains = <&domain>;
> +			};
> +		};
>  	};
>  
>  	usb@c5004000 {
> diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra30-car.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra30-car.txt
> index 63618cde12df..bc7bbdaa9d3f 100644
> --- a/Documentation/devicetree/bindings/clock/nvidia,tegra30-car.txt
> +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra30-car.txt
> @@ -19,6 +19,16 @@ Required properties :
>    In clock consumers, this cell represents the bit number in the CAR's
>    array of CLK_RST_CONTROLLER_RST_DEVICES_* registers.
>  
> +Optional child sub-node "clocks" should contain nodes matching the clocks
> +on the Tegra SoC. Refer to Tegra TRM for mode details on the clock nodes.
> +
> +Required properties :
> +- compatible : Should be "nvidia,tegra30-clock".
> +- operating-points-v2: See ../bindings/opp/opp.txt for details.
> +- clocks : Should contain clock which corresponds to the node.
> +- power-domains: Phandle to a power domain node as described by generic
> +                 PM domain bindings.
> +
>  Example SoC include file:
>  
>  / {
> @@ -31,6 +41,22 @@ Example SoC include file:
>  
>  	usb@c5004000 {
>  		clocks = <&tegra_car TEGRA30_CLK_USB2>;
> +
> +		clocks {
> +			hdmi {
> +				compatible = "nvidia,tegra30-clock";
> +				operating-points-v2 = <&hdmi_opp_table>;
> +				clocks = <&tegra_car TEGRA30_CLK_HDMI>;
> +				power-domains = <&domain>;
> +			};
> +
> +			pll_m {
> +				compatible = "nvidia,tegra30-clock";
> +				operating-points-v2 = <&pll_m_opp_table>;
> +				clocks = <&tegra_car TEGRA30_CLK_PLL_M>;
> +				power-domains = <&domain>;
> +			};
> +		};
>  	};
>  };
>  
> -- 
> 2.29.2
> 
