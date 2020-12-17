Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED6D2DD969
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 20:38:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728197AbgLQTg5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 14:36:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbgLQTg5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 14:36:57 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93684C0617A7
        for <linux-media@vger.kernel.org>; Thu, 17 Dec 2020 11:36:16 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id d26so14526072wrb.12
        for <linux-media@vger.kernel.org>; Thu, 17 Dec 2020 11:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6oOm24In2gplgsGMpCabJu/CznURFMD1RnI7ZTKSVZA=;
        b=EYxCU38suOXjV47ydNpqlSUba1JRYG/aaI35yaJpn1UB+BtzvlRpADO93fzVKy4t36
         GXDLRzlEn1BYLHTJGeAeqCidRcIMChrWngyKaOn4n3Lo29932Dg9omdUJcjDTAwCVkgh
         ta58l29XjSHsRigG3HpDtBAEBVaBmuzih2JNgRoFRFYXa9bEBvBJ5hZC2Srp8gPI8mVa
         uxVtLO0NA79ZScJlXdTUzkgYBE8Tqjur0dClttztc+oLkYcGroJOHdhhPsrsjuIEAO0T
         /5F6Wcrc0LxkQR8X/uEnQJlAqKc4CbCNzPl9TN1TZtQafiA6+T03sTUGb4huYEgjoWFX
         KmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6oOm24In2gplgsGMpCabJu/CznURFMD1RnI7ZTKSVZA=;
        b=Y4GL2ar/YUsxnRtkucHWlN4CsafkIO0C4oCKVaLCmbxBEgKe9/sHkP/ZZ8tTDC0qbc
         yJX9lA0dm6ywiWNL+6NlpULrqE2Z1XlyN53VyeYqf6RQWryjEZ7zkSl3vYIh+2rE+PaM
         qkwHxui0XnipiF8S0EknLYQ92W1F/WF2R4es17u+98hVQWb4bJ9gt+tm5IS9iNi+Ae5H
         F+uQwmosDvYZwvUkVb7Dfu+cerr5SazkxCw1zH8pUoyfs1/Jqjwh0BhIOZugIvIXvxN6
         D8NJhb2uS6PRyhNtoWdSePgmQMqG9e1Wwez07bvbOSVQ1hOPDQZmx4Bce1X93r6+Zm8E
         fdmg==
X-Gm-Message-State: AOAM532uEqQYkKCRnY9jbiahZjd2fXtD2if+i0BRkZt6/0rYM1ESGYIJ
        GXxKWAdHkUqOBszKaDgtRc4vWQ==
X-Google-Smtp-Source: ABdhPJwHDhE2wDWtfE222MozA7wYeHiNXM83hTZa8A1agC08CnIBpdJflfgPV5DnqVW7VF1brOPhmg==
X-Received: by 2002:a5d:5146:: with SMTP id u6mr433624wrt.46.1608233775160;
        Thu, 17 Dec 2020 11:36:15 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:ccb6:ce78:2bcd:4ead? ([2a01:e34:ed2f:f020:ccb6:ce78:2bcd:4ead])
        by smtp.googlemail.com with ESMTPSA id o124sm6076543wmb.5.2020.12.17.11.36.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Dec 2020 11:36:14 -0800 (PST)
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
 <91139f8b-0b83-dd8a-ba53-8e7a499e6344@linaro.org>
 <b39ebfc1-42b3-1fa7-efe4-6ecbc8cfcb50@gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <776e0e84-e395-2bfb-f1ee-c34864b1cf16@linaro.org>
Date:   Thu, 17 Dec 2020 20:36:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b39ebfc1-42b3-1fa7-efe4-6ecbc8cfcb50@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/12/2020 20:01, Dmitry Osipenko wrote:
> 17.12.2020 21:28, Daniel Lezcano пишет:
>> On 17/12/2020 19:06, Dmitry Osipenko wrote:
>>> Enable CPU voltage scaling and thermal throttling on Tegra20 Ventana board.
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>>  arch/arm/boot/dts/tegra20-ventana.dts | 40 ++++++++++++++++++++++++++-
>>>  1 file changed, 39 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm/boot/dts/tegra20-ventana.dts b/arch/arm/boot/dts/tegra20-ventana.dts
>>> index 14ace2ef749c..c2d9f38960bc 100644
>>> --- a/arch/arm/boot/dts/tegra20-ventana.dts
>>> +++ b/arch/arm/boot/dts/tegra20-ventana.dts
>>> @@ -2,8 +2,10 @@
>>>  /dts-v1/;
>>>  
>>>  #include <dt-bindings/input/input.h>
>>> +#include <dt-bindings/thermal/thermal.h>
>>>  #include "tegra20.dtsi"
>>>  #include "tegra20-cpu-opp.dtsi"
>>> +#include "tegra20-cpu-opp-microvolt.dtsi"
>>>  
>>>  / {
>>>  	model = "NVIDIA Tegra20 Ventana evaluation board";
>>> @@ -527,9 +529,10 @@ ldo_rtc {
>>>  			};
>>>  		};
>>>  
>>> -		temperature-sensor@4c {
>>> +		nct1008: temperature-sensor@4c {
>>>  			compatible = "onnn,nct1008";
>>>  			reg = <0x4c>;
>>> +			#thermal-sensor-cells = <1>;
>>>  		};
>>>  	};
>>>  
>>> @@ -615,10 +618,13 @@ clk32k_in: clock@0 {
>>>  
>>>  	cpus {
>>>  		cpu0: cpu@0 {
>>> +			cpu-supply = <&vdd_cpu>;
>>>  			operating-points-v2 = <&cpu0_opp_table>;
>>> +			#cooling-cells = <2>;
>>>  		};
>>>  
>>>  		cpu@1 {
>>> +			cpu-supply = <&vdd_cpu>;
>>>  			operating-points-v2 = <&cpu0_opp_table>;
>>>  		};
>>>  	};
>>> @@ -717,4 +723,36 @@ sound {
>>>  			 <&tegra_car TEGRA20_CLK_CDEV1>;
>>>  		clock-names = "pll_a", "pll_a_out0", "mclk";
>>>  	};
>>> +
>>> +	thermal-zones {
>>> +		cpu-thermal {
>>> +			polling-delay-passive = <1000>; /* milliseconds */
>>> +			polling-delay = <5000>; /* milliseconds */
>>> +
>>> +			thermal-sensors = <&nct1008 1>;
>>> +
>>> +			trips {
>>> +				trip0: cpu-alert0 {
>>> +					/* start throttling at 50C */
>>> +					temperature = <50000>;
>>> +					hysteresis = <200>;
>>
>> Did you mean <2000> ?
> 
> The <200> is correct.
> 
> Please see this commit for example:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2b22393b27670b45a2c870bce3df6579efd9a86a

Ok, thanks for the pointer.

>>> +					type = "passive";
>>> +				};
>>> +
>>> +				trip1: cpu-crit {
>>> +					/* shut down at 60C */
>>> +					temperature = <60000>;
>>> +					hysteresis = <2000>;
>>
>> I think you can drop the hysteresis here, when the critical temperature
>> is reached, there is an emergency shutdown.
> 
> Yes, perhaps you're right. Hysteresis doesn't make sense for a critical
> trip. I'll improve it in the next revision, thanks.
> 
>> 50°C and 60°C sound very low values, no ?
> 
> Tegra20 CPU is very cold in comparison to later generations, it should
> stay under 50°C even at a full load.

Interesting, thanks.

>>> +					type = "critical";
>>> +				};
>>> +			};
>>> +
>>> +			cooling-maps {
>>> +				map0 {
>>> +					trip = <&trip0>;
>>> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>>
>> You should add all CPUs here.
> 
> 
> All CPU cores are coupled on Tegra in regards to CPUFreq, hence I think
> it won't make any difference if secondary CPU cores will be added here,
> isn't it?

The explanation is in the description of commit ef4734500407ce4d


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
