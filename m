Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BE092DD84F
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 19:30:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730429AbgLQS3I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 13:29:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729857AbgLQS3I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 13:29:08 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAC81C06138C
        for <linux-media@vger.kernel.org>; Thu, 17 Dec 2020 10:28:27 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id 91so27565480wrj.7
        for <linux-media@vger.kernel.org>; Thu, 17 Dec 2020 10:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3Eimbv4irvb06uulzwdmbgzbH0hXJUaf7zvbDZ2yAOw=;
        b=MBoNO+HzZQn1d2jk1/V+kBAn+RuX+Bgjf4yAuTECCPwo9pr5m6PA59e8a2suZD2rZj
         WQK6VoGzqsqLLXsUPVSeZCJtfpqNYYeWHwu0WtzcCHrnA0iTZqPKBNzusky0oGwcuPWI
         vxgZfG5PORMcS69Xl3gppSuianH953hu/LhmBsqsDfxzq0DrtWc4KMCBFbV4Zl+Tdl+j
         XQwoV7n4jnAiYy/9txHOHHP967uVhDMXq6PpvemH0tcgRkKhqHfeQLEuECTmp6B3Jlgd
         6Fh5JlgWumnZnWlQKc+PhZd7mWDSwAf3QNa4hWd6frVbAITao8rEW0tIt4LVEW+PWtB+
         D1YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3Eimbv4irvb06uulzwdmbgzbH0hXJUaf7zvbDZ2yAOw=;
        b=a4dF9JSCfuxOSBLqB/sonUGFuXBW487TUYXWp1qwkfejBZM2wYNvREBYhjKIPP/85A
         /OApm7JRB3J6yNcwi/ljnYtJ6613Iq6qVQN5Bye8Mo2NYt5bYkdYgcmnXgSQjSoPLmA6
         FDBP4u4bAdk9nGeZswMoebTEkNjtGmx48xBYd+uy5oCBrtqcEFQGgNsE22SFPnr/MFLq
         onpnK7cHKJGbkwbTkHAcZkoiIL62xE2Ra8S44R+YvYKm/RFldEXWk9AqtZ/+Jh57wBAo
         +QYl2Y8UHlL11zVFNghuYIOAzfQoA/TFXawzJie+wuWqs1sto0GBVn1SPMWVCiWkZ+cu
         bgDg==
X-Gm-Message-State: AOAM531IgR75BqgKJvbmIyTn8wjDv8hvILGkylFNZJcMj2m4+i1OzIfG
        BRgkadxqqwlAAGd3nQyHJyiipQ==
X-Google-Smtp-Source: ABdhPJzKbCCGpt8ELmmFbxdiuj0VOZ+HkKMKFTm6vWFFlnL6Ebt+3D8mHpr+ALmo4+wr+vg26zHlzQ==
X-Received: by 2002:adf:ebd2:: with SMTP id v18mr115947wrn.322.1608229706152;
        Thu, 17 Dec 2020 10:28:26 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:ccb6:ce78:2bcd:4ead? ([2a01:e34:ed2f:f020:ccb6:ce78:2bcd:4ead])
        by smtp.googlemail.com with ESMTPSA id q1sm9831416wrj.8.2020.12.17.10.28.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Dec 2020 10:28:25 -0800 (PST)
Subject: Re: [PATCH v2 47/48] ARM: tegra: ventana: Support CPU voltage scaling
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
 <20201217180638.22748-48-digetx@gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <91139f8b-0b83-dd8a-ba53-8e7a499e6344@linaro.org>
Date:   Thu, 17 Dec 2020 19:28:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201217180638.22748-48-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/12/2020 19:06, Dmitry Osipenko wrote:
> Enable CPU voltage scaling and thermal throttling on Tegra20 Ventana board.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/arm/boot/dts/tegra20-ventana.dts | 40 ++++++++++++++++++++++++++-
>  1 file changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/tegra20-ventana.dts b/arch/arm/boot/dts/tegra20-ventana.dts
> index 14ace2ef749c..c2d9f38960bc 100644
> --- a/arch/arm/boot/dts/tegra20-ventana.dts
> +++ b/arch/arm/boot/dts/tegra20-ventana.dts
> @@ -2,8 +2,10 @@
>  /dts-v1/;
>  
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/thermal/thermal.h>
>  #include "tegra20.dtsi"
>  #include "tegra20-cpu-opp.dtsi"
> +#include "tegra20-cpu-opp-microvolt.dtsi"
>  
>  / {
>  	model = "NVIDIA Tegra20 Ventana evaluation board";
> @@ -527,9 +529,10 @@ ldo_rtc {
>  			};
>  		};
>  
> -		temperature-sensor@4c {
> +		nct1008: temperature-sensor@4c {
>  			compatible = "onnn,nct1008";
>  			reg = <0x4c>;
> +			#thermal-sensor-cells = <1>;
>  		};
>  	};
>  
> @@ -615,10 +618,13 @@ clk32k_in: clock@0 {
>  
>  	cpus {
>  		cpu0: cpu@0 {
> +			cpu-supply = <&vdd_cpu>;
>  			operating-points-v2 = <&cpu0_opp_table>;
> +			#cooling-cells = <2>;
>  		};
>  
>  		cpu@1 {
> +			cpu-supply = <&vdd_cpu>;
>  			operating-points-v2 = <&cpu0_opp_table>;
>  		};
>  	};
> @@ -717,4 +723,36 @@ sound {
>  			 <&tegra_car TEGRA20_CLK_CDEV1>;
>  		clock-names = "pll_a", "pll_a_out0", "mclk";
>  	};
> +
> +	thermal-zones {
> +		cpu-thermal {
> +			polling-delay-passive = <1000>; /* milliseconds */
> +			polling-delay = <5000>; /* milliseconds */
> +
> +			thermal-sensors = <&nct1008 1>;
> +
> +			trips {
> +				trip0: cpu-alert0 {
> +					/* start throttling at 50C */
> +					temperature = <50000>;
> +					hysteresis = <200>;

Did you mean <2000> ?

> +					type = "passive";
> +				};
> +
> +				trip1: cpu-crit {
> +					/* shut down at 60C */
> +					temperature = <60000>;
> +					hysteresis = <2000>;

I think you can drop the hysteresis here, when the critical temperature
is reached, there is an emergency shutdown.

50°C and 60°C sound very low values, no ?

> +					type = "critical";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&trip0>;
> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;

You should add all CPUs here.

> +				};
> +			};
> +		};
> +	};
>  };
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
