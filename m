Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A098F2DD852
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 19:30:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730980AbgLQS3t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 13:29:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730132AbgLQS3s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 13:29:48 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCAD8C061285
        for <linux-media@vger.kernel.org>; Thu, 17 Dec 2020 10:29:01 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id c5so23913255wrp.6
        for <linux-media@vger.kernel.org>; Thu, 17 Dec 2020 10:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=q8aRgUoihX8Avz9ruuy2QvIzzYrzaxUTGheCXawpxLo=;
        b=xl1+B8fgQHVTz0DkWK6xdRV/uEVFC82QHBw49Alo1pZRQNVZfyPx/dg+9bxRxn3y5j
         wOqiffyVmnYbj1EgpecnWAs09QIW7EF/7NIcncaJdZmmY7+vczFoazIVy/Eg+65pjOtM
         gbZSGEAdgwAa1cWspO2xP3t3GCTb/mkxr1zZPv3grz2TSux4ttuJEbJVzOWrxUZiqiYa
         EyespBuebZDUnKpi2lIbacdsmhJeRja5SjUmsnxUg4sTGmUV//8S1eWH9DFS0ELLtHED
         LuXIIy4cz1c19ZN2cy4JbGpV1+1UqvirDLHJkG8A4GrB16/yngcSjT40kjaVP9H2ytUQ
         kfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=q8aRgUoihX8Avz9ruuy2QvIzzYrzaxUTGheCXawpxLo=;
        b=hHgYOiFo/4Y0o8gMB8GTFpQ5sdA9aRbjgHoUttjtFFdN94FApNhWEAq/lmmehIsyyb
         H1Vus/q1dh/ZRNa9AtRrDiTxvX+TKdSCAKjvo2grmvh65i+TJppOeSJ1jw5VethGecpz
         IQIFUQIGIw7vWhVv7yGYKQl/DjoG6Jv+pxlw2OpZo2nkMUi/BQNhm5lnH/JUSsGv2275
         WvvgfsSfQi0zI7YAEFH4Q0Ak7oFq3oaADgatcoLY51uu//c6rKpfGC1yz8R709FHd6Ke
         RNpVyTmLNhM2sH6ZCYz+D5evSFeW+c5RDR+fF08zswrg8BWE5Iap7rByqiU7Vm6UcpaQ
         3kBA==
X-Gm-Message-State: AOAM530oJmVLBUm+l6900AIy6fhxqVxRlLPtLLa9IMlsm8GFzU3/2noF
        rqFdQT9XIT/t3dVITZr2iBvd+w==
X-Google-Smtp-Source: ABdhPJzsRtqGVStuVvpkZl1+aZoPEJq0l19ZzD3Ifm+FDKdUgsJB+PBHx04WPNMgDSSCFiYkBdKpYg==
X-Received: by 2002:a5d:61ca:: with SMTP id q10mr144253wrv.124.1608229740327;
        Thu, 17 Dec 2020 10:29:00 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:ccb6:ce78:2bcd:4ead? ([2a01:e34:ed2f:f020:ccb6:ce78:2bcd:4ead])
        by smtp.googlemail.com with ESMTPSA id f7sm15260897wmc.1.2020.12.17.10.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Dec 2020 10:28:59 -0800 (PST)
Subject: Re: [PATCH v2 48/48] ARM: tegra: cardhu: Support CPU voltage scaling
 and thermal throttling
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-49-digetx@gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <c0cb782a-bd26-917a-8f39-db8b6f460472@linaro.org>
Date:   Thu, 17 Dec 2020 19:28:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201217180638.22748-49-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/12/2020 19:06, Dmitry Osipenko wrote:
> Enable CPU voltage scaling and thermal throttling on Tegra30 Cardhu board.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

Same comments as 47/48



>  arch/arm/boot/dts/tegra30-cardhu.dtsi | 61 ++++++++++++++++++++++++++-
>  1 file changed, 60 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
> index d74c9ca78a7f..08c0ea4e6228 100644
> --- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
> +++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
> @@ -1,6 +1,9 @@
>  // SPDX-License-Identifier: GPL-2.0
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/thermal/thermal.h>
>  #include "tegra30.dtsi"
> +#include "tegra30-cpu-opp.dtsi"
> +#include "tegra30-cpu-opp-microvolt.dtsi"
>  
>  /**
>   * This file contains common DT entry for all fab version of Cardhu.
> @@ -339,12 +342,13 @@ ldo8_reg: ldo8 {
>  			};
>  		};
>  
> -		temperature-sensor@4c {
> +		nct1008: temperature-sensor@4c {
>  			compatible = "onnn,nct1008";
>  			reg = <0x4c>;
>  			vcc-supply = <&sys_3v3_reg>;
>  			interrupt-parent = <&gpio>;
>  			interrupts = <TEGRA_GPIO(CC, 2) IRQ_TYPE_LEVEL_LOW>;
> +			#thermal-sensor-cells = <1>;
>  		};
>  
>  		vdd_core: tps62361@60 {
> @@ -438,6 +442,29 @@ clk32k_in: clock@0 {
>  		#clock-cells = <0>;
>  	};
>  
> +	cpus {
> +		cpu0: cpu@0 {
> +			cpu-supply = <&vddctrl_reg>;
> +			operating-points-v2 = <&cpu0_opp_table>;
> +			#cooling-cells = <2>;
> +		};
> +
> +		cpu@1 {
> +			cpu-supply = <&vddctrl_reg>;
> +			operating-points-v2 = <&cpu0_opp_table>;
> +		};
> +
> +		cpu@2 {
> +			cpu-supply = <&vddctrl_reg>;
> +			operating-points-v2 = <&cpu0_opp_table>;
> +		};
> +
> +		cpu@3 {
> +			cpu-supply = <&vddctrl_reg>;
> +			operating-points-v2 = <&cpu0_opp_table>;
> +		};
> +	};
> +
>  	panel: panel {
>  		compatible = "chunghwa,claa101wb01";
>  		ddc-i2c-bus = <&panelddc>;
> @@ -617,6 +644,38 @@ sound {
>  					 <&tegra_car TEGRA30_CLK_EXTERN1>;
>  	};
>  
> +	thermal-zones {
> +		cpu-thermal {
> +			polling-delay-passive = <1000>; /* milliseconds */
> +			polling-delay = <5000>; /* milliseconds */
> +
> +			thermal-sensors = <&nct1008 1>;
> +
> +			trips {
> +				trip0: cpu-alert0 {
> +					/* throttle at 57C until temperature drops to 56.8C */
> +					temperature = <57000>;
> +					hysteresis = <200>;
> +					type = "passive";
> +				};
> +
> +				trip1: cpu-crit {
> +					/* shut down at 60C */
> +					temperature = <60000>;
> +					hysteresis = <2000>;
> +					type = "critical";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&trip0>;
> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
> +		};
> +	};
> +
>  	gpio-keys {
>  		compatible = "gpio-keys";
>  
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
