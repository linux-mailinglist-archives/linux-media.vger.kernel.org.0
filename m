Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F69F2E0EC6
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 20:19:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727711AbgLVTRa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 14:17:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727691AbgLVTR3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 14:17:29 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB096C0613D3;
        Tue, 22 Dec 2020 11:16:48 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id a12so34531792lfl.6;
        Tue, 22 Dec 2020 11:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8LCUpi0Bv6VHRO4Owbo1wWhzpbnTDyEyoeExPvlxMpw=;
        b=vFetG7ZFiwo/yl2NVh6oxZB18mV9BShqVa3lTahkF2pbDbu5TcdQOVLTO9/MLdYMgq
         ooq3rs8c9z/DAR+8w42Ilbyxx83xu3+IFmczYSfH6ENb9n1NSjmJWRJkERDT1Mn7Nh08
         viagp2OH5JNp9vScykSOW3b1eELwwOeCGJKHk9bSrw3vI9f1Oe0sV7kdYwZ/GEYDeU/1
         sjMuyUiPHcViXdEjn92uDcql0QBnLolR1Q5Z+wcG75qtWKugSe4EDgBeaAWR7gBHBV1I
         24OG3co9a+ITHYeJZuGofzuBloji4Hh9BlFFjnWrNFKEJrcHVtx2QGEbFA50Clag2TUP
         ySFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8LCUpi0Bv6VHRO4Owbo1wWhzpbnTDyEyoeExPvlxMpw=;
        b=CVens5Pzuh25gYQrXm5bPAgKHE5qvul3uejJEQy4rjW28mCJco1ixCUUlpuLS8likv
         yzYlXZFrOSz6OJBj9qojQyafHfKSWleeDLb/RzpXAxuN33EgORjk/kDA1CrryI2bb5Tb
         KG1APizeuApjZ6+J+tI3+zBFxIB80OjxGZBlyBJBPcwOWGcurNSl5HKBpsHeM7fkJoqx
         zJEmci1o9ovx/SDQ+N3sIJnWHyDnxcbf37yaKKlGFw4mr9S2h2bso27NKUxJqlLsez/w
         fgbr9vLhPERc4+BACB9ppQn0gklguxsWUauuq8RC+AcbRJwuJot4ShHzGldJXlH46f7g
         gQ9g==
X-Gm-Message-State: AOAM530LIDuEhphsDwasj3BoKF5Eb9Pkip5/YNWXkcaPd0OJtmsJp9l7
        HRAAPlWTTAqfByyGsknx6lAMm8yen0M=
X-Google-Smtp-Source: ABdhPJzESFVQASn+ZGQhw50PNtNWOiEZe3+iV8slMZ9kttc1xtTyrnY0QBd85AxyTY+oYzyLIPm/3Q==
X-Received: by 2002:ac2:44ba:: with SMTP id c26mr9218189lfm.132.1608664607240;
        Tue, 22 Dec 2020 11:16:47 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id s25sm2944290ljo.106.2020.12.22.11.16.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Dec 2020 11:16:46 -0800 (PST)
Subject: Re: [PATCH v2 02/48] dt-bindings: memory: tegra30: emc: Replace core
 regulator with power domain
To:     Rob Herring <robh@kernel.org>
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
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-3-digetx@gmail.com>
 <20201221225405.GA723611@robh.at.kernel.org>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <048f9453-c57a-0e42-2684-327781435085@gmail.com>
Date:   Tue, 22 Dec 2020 22:16:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201221225405.GA723611@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

22.12.2020 01:54, Rob Herring пишет:
> On Thu, Dec 17, 2020 at 09:05:52PM +0300, Dmitry Osipenko wrote:
>> Power domain fits much better than a voltage regulator in regards to
>> a proper hardware description and from a software perspective as well.
>> Hence replace the core regulator with the power domain. Note that this
>> doesn't affect any existing DTBs because we haven't started to use the
>> regulator yet, and thus, it's okay to change it.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  .../bindings/memory-controllers/nvidia,tegra30-emc.yaml     | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
>> index 0a2e2c0d0fdd..7b4af9169b0b 100644
>> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
>> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
>> @@ -39,9 +39,9 @@ properties:
>>      description:
>>        Phandle of the Memory Controller node.
>>  
>> -  core-supply:
>> +  power-domains:
>>      description:
>> -      Phandle of voltage regulator of the SoC "core" power domain.
>> +      Phandle to the SoC "core" power domain.
> 
> power-domains needs to define how many (maxItems).

Okay, thanks.
