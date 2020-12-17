Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 392532DD8FF
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 20:03:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730692AbgLQTBq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 14:01:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728194AbgLQTBq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 14:01:46 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E92BC061794;
        Thu, 17 Dec 2020 11:01:05 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id y19so60198732lfa.13;
        Thu, 17 Dec 2020 11:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=81D+yHFMAabVlf+2tjVOZShdc9YBbXvn/2mHiBk65M8=;
        b=E4VCRRwgR/wwwJZ3vV67dTB9C325unQ0kkUOLNhfK3cB9Coik2iK9XFK1Mkl7Li7BV
         ljYTYh7ccCTr9J8kDePLB/tKR1Ax6UPYyQdMOfo9OtZ/RY/xHNsoRGtTqVGNhEX7lu9m
         t8h7XcmH+TqCHlqiQE0P/LB3C6qNwDVQ322flLSUavE6ycdJkAibg+I4vgFqgparDlys
         h7QAlaLgGU+0khcKtaPcZ0Q76U+UZCdJqQ1x4yDKGxpdTxxLf+bBwkyphA0AgxakdYTO
         m3wAoVXRlQtyAVWMhNILnhc1J6IakGhyInFhMSoa9IuwTqk4krYzDREl8VrcPFk8ZRZS
         A7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=81D+yHFMAabVlf+2tjVOZShdc9YBbXvn/2mHiBk65M8=;
        b=KsITVzItEO6a+NLQigAk5GKp0Vp5Hj6moc7VMuGPds32jT/e7wlUxmLifLwNUlNYt7
         whaPNansaEPv4zJIwepjCldJOtOKDaW+1MrFV5fB3XwZKRs9MiwcObXkygvKcrQzdMZP
         Uv3m0IUZtvQgdcXvO9Q8U5o1JeuEQpH4plmWxx4cUi40AEQKUBOiqCSPA45rjKgEEfXa
         wmcn0JWcnBs+5Lu5bnRDp8ZKS1BfvYjzjk+fv+f74+rKBnrdfgeOvwuW3CE4QrMt3nIc
         iO9TfdvM65DH2CPKMc6BpQGAM05G1g4ZmfOp9JA3epv2ndy9OvYtfGd4TOX9N5P2Ii1M
         xj5Q==
X-Gm-Message-State: AOAM5312h74r4ogfPJzv6wTp04zCYtaQrFGC0HnKKmlJ5uFqNl4qOF2/
        KsrCCEeBP+TnmxAKA/EXT0iS4cuNDP4=
X-Google-Smtp-Source: ABdhPJz2fbmlKJZp5mILGAenl01AxesjkvEREd6Ss2Woz35PQnzT59ZzuIIso9Jym8YQiMAeMBzqQw==
X-Received: by 2002:a2e:4c11:: with SMTP id z17mr323589lja.364.1608231663452;
        Thu, 17 Dec 2020 11:01:03 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id l1sm671498lfk.201.2020.12.17.11.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Dec 2020 11:01:02 -0800 (PST)
Subject: Re: [PATCH v2 47/48] ARM: tegra: ventana: Support CPU voltage scaling
 and thermal throttling
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b39ebfc1-42b3-1fa7-efe4-6ecbc8cfcb50@gmail.com>
Date:   Thu, 17 Dec 2020 22:01:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <91139f8b-0b83-dd8a-ba53-8e7a499e6344@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

17.12.2020 21:28, Daniel Lezcano пишет:
> On 17/12/2020 19:06, Dmitry Osipenko wrote:
>> Enable CPU voltage scaling and thermal throttling on Tegra20 Ventana board.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  arch/arm/boot/dts/tegra20-ventana.dts | 40 ++++++++++++++++++++++++++-
>>  1 file changed, 39 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/tegra20-ventana.dts b/arch/arm/boot/dts/tegra20-ventana.dts
>> index 14ace2ef749c..c2d9f38960bc 100644
>> --- a/arch/arm/boot/dts/tegra20-ventana.dts
>> +++ b/arch/arm/boot/dts/tegra20-ventana.dts
>> @@ -2,8 +2,10 @@
>>  /dts-v1/;
>>  
>>  #include <dt-bindings/input/input.h>
>> +#include <dt-bindings/thermal/thermal.h>
>>  #include "tegra20.dtsi"
>>  #include "tegra20-cpu-opp.dtsi"
>> +#include "tegra20-cpu-opp-microvolt.dtsi"
>>  
>>  / {
>>  	model = "NVIDIA Tegra20 Ventana evaluation board";
>> @@ -527,9 +529,10 @@ ldo_rtc {
>>  			};
>>  		};
>>  
>> -		temperature-sensor@4c {
>> +		nct1008: temperature-sensor@4c {
>>  			compatible = "onnn,nct1008";
>>  			reg = <0x4c>;
>> +			#thermal-sensor-cells = <1>;
>>  		};
>>  	};
>>  
>> @@ -615,10 +618,13 @@ clk32k_in: clock@0 {
>>  
>>  	cpus {
>>  		cpu0: cpu@0 {
>> +			cpu-supply = <&vdd_cpu>;
>>  			operating-points-v2 = <&cpu0_opp_table>;
>> +			#cooling-cells = <2>;
>>  		};
>>  
>>  		cpu@1 {
>> +			cpu-supply = <&vdd_cpu>;
>>  			operating-points-v2 = <&cpu0_opp_table>;
>>  		};
>>  	};
>> @@ -717,4 +723,36 @@ sound {
>>  			 <&tegra_car TEGRA20_CLK_CDEV1>;
>>  		clock-names = "pll_a", "pll_a_out0", "mclk";
>>  	};
>> +
>> +	thermal-zones {
>> +		cpu-thermal {
>> +			polling-delay-passive = <1000>; /* milliseconds */
>> +			polling-delay = <5000>; /* milliseconds */
>> +
>> +			thermal-sensors = <&nct1008 1>;
>> +
>> +			trips {
>> +				trip0: cpu-alert0 {
>> +					/* start throttling at 50C */
>> +					temperature = <50000>;
>> +					hysteresis = <200>;
> 
> Did you mean <2000> ?

The <200> is correct.

Please see this commit for example:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2b22393b27670b45a2c870bce3df6579efd9a86a

>> +					type = "passive";
>> +				};
>> +
>> +				trip1: cpu-crit {
>> +					/* shut down at 60C */
>> +					temperature = <60000>;
>> +					hysteresis = <2000>;
> 
> I think you can drop the hysteresis here, when the critical temperature
> is reached, there is an emergency shutdown.

Yes, perhaps you're right. Hysteresis doesn't make sense for a critical
trip. I'll improve it in the next revision, thanks.

> 50°C and 60°C sound very low values, no ?

Tegra20 CPU is very cold in comparison to later generations, it should
stay under 50°C even at a full load.

>> +					type = "critical";
>> +				};
>> +			};
>> +
>> +			cooling-maps {
>> +				map0 {
>> +					trip = <&trip0>;
>> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> 
> You should add all CPUs here.


All CPU cores are coupled on Tegra in regards to CPUFreq, hence I think
it won't make any difference if secondary CPU cores will be added here,
isn't it?
