Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79E1B2DF676
	for <lists+linux-media@lfdr.de>; Sun, 20 Dec 2020 19:27:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727300AbgLTS1P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Dec 2020 13:27:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726470AbgLTS1O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Dec 2020 13:27:14 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26C43C061282;
        Sun, 20 Dec 2020 10:26:34 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id m12so18403053lfo.7;
        Sun, 20 Dec 2020 10:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Dw4JPrP6acwrpZwuGGjt1P7HcEJMDGmCI8V3sWOk5Ic=;
        b=pT37pEqHrqcxmnPSmwxH9RNswp5aGcnhhkvGsin7xICzjgnixZn8OtcU68Lc88mq2F
         QeSH7/ZwBsEUnvTjmYhOv2U7rOCzN/Fwt5knsfkhL1k890q8dzOIpL+9Nub4xIEnFWiC
         I9BU8ipqTFV9wGpnkw3XaXsz9NPpZsKtXRALa5OlSF3SDGThfy0moA2TdgyGl0Q2nICC
         3592J56MExRzHJj3nzxSfQpzZ/eAcS7Tl2sO8BPDjAKnjOdLolp4Zdztugw7fu3gDLg1
         CNXQg+VpYtC8uFh8FVWXpKwvLIWY8ovV2QX09I5bwKez+3EBnhQsJkL28KhPfz9FOJY7
         l5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Dw4JPrP6acwrpZwuGGjt1P7HcEJMDGmCI8V3sWOk5Ic=;
        b=hYR+afoI65I6YHMMf0gsHQbHZDiYaFSjs5rOMTzydtt9aScedKZvda1iVWmsxvxbSj
         ljCx3KLSJdton58PkYvhejGYlyVuTGJrtYV1CAv+N+jDF51iMnub+KTgofkLcFB+aMrB
         +p3tspr95Ofrd0vI+PyzAXUayoJXR0XtLJNqwoFLPS8tej3F7qxuG/AM93qBTApl+hri
         dJ/e8FAzhKWrW0SZWmLkt8NS47YHby057nnlsdoztpxHMYNAVHjGbzYbhH7JGwJI7Qy8
         Cwu57PnYG+QwbO+aVoEa5drnf4fZsrLhaQHMl+WHCzHOC6OECwZYIwac3Dyiv6KFM9Pp
         VpVQ==
X-Gm-Message-State: AOAM531W0o33leY4afSWkFi+nLSbYSQhnn9Iy4yy1C34an+S/Z8LeeJJ
        K85fBroM+cLF5nkeY3uoc1ju8DJcWtE=
X-Google-Smtp-Source: ABdhPJwCPdrUxXmxfP01OJOvkTo9IkzknyisoOQ+UqFGkH2TZMJbXVFVbNUMFJk8uto6KAnZIThVbg==
X-Received: by 2002:ac2:59ce:: with SMTP id x14mr5133297lfn.545.1608488792261;
        Sun, 20 Dec 2020 10:26:32 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id p13sm1877788ljc.112.2020.12.20.10.26.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Dec 2020 10:26:31 -0800 (PST)
Subject: Re: [PATCH v2 07/48] dt-bindings: arm: tegra: Add binding for core
 power domain
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
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
 <20201217180638.22748-8-digetx@gmail.com> <20201219105720.GA5323@kozik-lap>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <cba644de-97fc-7249-31b5-d23e7e40634d@gmail.com>
Date:   Sun, 20 Dec 2020 21:26:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201219105720.GA5323@kozik-lap>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

19.12.2020 13:57, Krzysztof Kozlowski пишет:
> On Thu, Dec 17, 2020 at 09:05:57PM +0300, Dmitry Osipenko wrote:
>> All NVIDIA Tegra SoCs have a core power domain where majority of hardware
>> blocks reside. Add binding for the core power domain.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  .../arm/tegra/nvidia,tegra20-core-domain.yaml | 48 +++++++++++++++++++
>>  1 file changed, 48 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-core-domain.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-core-domain.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-core-domain.yaml
>> new file mode 100644
>> index 000000000000..f3d8fd2d8371
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-core-domain.yaml
>> @@ -0,0 +1,48 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/arm/tegra/nvidia,tegra20-core-domain.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: NVIDIA Tegra Core Power Domain
>> +
>> +maintainers:
>> +  - Dmitry Osipenko <digetx@gmail.com>
>> +  - Jon Hunter <jonathanh@nvidia.com>
>> +  - Thierry Reding <thierry.reding@gmail.com>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - nvidia,tegra20-core-domain
>> +      - nvidia,tegra30-core-domain
> 
> The file should be in bindings/power.
> Include also the power-domain.yaml schema.
> 
>> +
>> +  operating-points-v2:
>> +    description:
>> +      Should contain level, voltages and opp-supported-hw property.
>> +      The supported-hw is a bitfield indicating SoC speedo or process
>> +      ID mask.
>> +
>> +  "#power-domain-cells":
>> +    const: 0
>> +
>> +  power-supply:
>> +    description:
>> +      Phandle to voltage regulator connected to the SoC Core power rail.
>> +
>> +required:
>> +  - compatible
>> +  - operating-points-v2
>> +  - "#power-domain-cells"
>> +  - power-supply
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    core-domain {
> 
> power-domain (to follow schema and devicetree spec)

Thanks for the suggestion, I'll update it in v3.

