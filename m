Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0829C645613
	for <lists+linux-media@lfdr.de>; Wed,  7 Dec 2022 10:09:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbiLGJI7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Dec 2022 04:08:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbiLGJIp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Dec 2022 04:08:45 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E99E72CE30
        for <linux-media@vger.kernel.org>; Wed,  7 Dec 2022 01:08:41 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id x11so20153795ljh.7
        for <linux-media@vger.kernel.org>; Wed, 07 Dec 2022 01:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8WyD6+4TOtnUZ3buZrfTvZlmLnV/84EmqHh/FS/HaPA=;
        b=L51sXgM7Hxi4SbUu1GAGwaWH8+oChEaG+fH/OfL9hIiFxjSBSLXKFotpowsHk3SDhN
         p4cZ9Blp6YSzDOgACKD9avjX7BW17+aEsZ3QYKvjRXFuZp75GP7SmTGJDzFOnsShyeDj
         11UruWJXKsGl029Y26Lg4SX+I2DtKEoj5FTQFMCWtF3/Z1KuUX3gM0t7OuDl12x3tc+j
         /1IvglKFAGAeHBnwqkQne+a7jkoBQfQ6jVctZJsAT1zyYX5oj/Wev1yD4YvQfff/nUh8
         p//ZmuGEqWgyIBpjMAU1ix+krZXB5tg9XLOL6SGmrshHF3sfOrGuBANw9h9OADYmOT2g
         6cmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8WyD6+4TOtnUZ3buZrfTvZlmLnV/84EmqHh/FS/HaPA=;
        b=1vH5MOpQUVQPfqBaSaGt+pApxCZ2egEs5N7o9Ogb1O7yaoJ/SzQ/uly9DaM++ik0RS
         cD4I8Z2g1IOtk+65ytYnEyMyWav/kOkbT54tLrUaLF+f4td7qlewzpcGyXmzzxti/UQQ
         lm2tvtzx8vqaL7f5pHk1kMQzeH8VXABrx9I+CN9vEaaILNiYzGznrIh8fe1/dfObbXJp
         LCBbRJeBvYXP9Zgz56i1cVVCGLp9V+8qIa4OS0LypeNWexxr5qj6d/1eggpA37elwHUT
         ptFRVWYenQ7aGzlSqelkvAjNXShdyR1XkMhzMS7YXHjp6+YDst/gNi40IgW+CCnEZ/Kv
         P5yQ==
X-Gm-Message-State: ANoB5pmu+htQvXA0Z5l82vx4AfDvl/4IeIigK2HiSFCtJy5Qm2IRQSTL
        q10zCpIm8mjsNkvHCvXXYVEYWw==
X-Google-Smtp-Source: AA0mqf5csyV+ZQkovsgzCNVOH5rNxgnnX0/bj5YjAEE7jb/b2fXvUxMbfi0o2/X1/JDCViBzm8O8bg==
X-Received: by 2002:a2e:96d6:0:b0:279:dcde:84b2 with SMTP id d22-20020a2e96d6000000b00279dcde84b2mr7575311ljj.207.1670404120162;
        Wed, 07 Dec 2022 01:08:40 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id 142-20020a2e0994000000b00279a5b85791sm69308ljj.88.2022.12.07.01.08.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Dec 2022 01:08:39 -0800 (PST)
Message-ID: <ebd963e5-fc27-b70d-8cc4-b18978a5de39@linaro.org>
Date:   Wed, 7 Dec 2022 10:08:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 8/9] media: dt-bindings: nvidia,tegra-cec: convert to
 DT schema
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Joe Tessler <jrt@google.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Jeff Chase <jnchase@google.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
 <20221205151845.21618-9-krzysztof.kozlowski@linaro.org>
 <Y49vm34cwgilAA33@orome>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y49vm34cwgilAA33@orome>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/12/2022 17:36, Thierry Reding wrote:
> On Mon, Dec 05, 2022 at 04:18:44PM +0100, Krzysztof Kozlowski wrote:
>> Convert Nvidia Tegra HDMI CEC bindings to DT schema.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>  .../bindings/media/cec/nvidia,tegra-cec.yaml  | 58 +++++++++++++++++++
>>  .../devicetree/bindings/media/tegra-cec.txt   | 27 ---------
>>  MAINTAINERS                                   |  2 +-
>>  3 files changed, 59 insertions(+), 28 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/media/cec/nvidia,tegra-cec.yaml
>>  delete mode 100644 Documentation/devicetree/bindings/media/tegra-cec.txt
>>
>> diff --git a/Documentation/devicetree/bindings/media/cec/nvidia,tegra-cec.yaml b/Documentation/devicetree/bindings/media/cec/nvidia,tegra-cec.yaml
>> new file mode 100644
>> index 000000000000..9a4025ff7fad
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/cec/nvidia,tegra-cec.yaml
> 
> For consistency with other DT bindings on Tegra, it'd be good to name
> this nvidia,tegra114-cec.yaml since that's the first generation where
> this IP was added. Not a big deal, though.

Sure, I can rename it.

> 
>> @@ -0,0 +1,58 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/cec/nvidia,tegra-cec.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Nvidia Tegra HDMI CEC
> 
> Again, for consistency with other bindings, NVIDIA is the preferred
> spelling. It's not a big deal and could be fixed up in a subsequent
> patch, there are a few other cases where the alternative spelling has
> been used.
> 
> The rest looks okay, so either way:
> 
> Acked-by: Thierry Reding <treding@nvidia.com>

OK

Best regards,
Krzysztof

