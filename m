Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02BE4698DF5
	for <lists+linux-media@lfdr.de>; Thu, 16 Feb 2023 08:43:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbjBPHn0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Feb 2023 02:43:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbjBPHnY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Feb 2023 02:43:24 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B627C3B0C8
        for <linux-media@vger.kernel.org>; Wed, 15 Feb 2023 23:43:23 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id fj20so1598936edb.1
        for <linux-media@vger.kernel.org>; Wed, 15 Feb 2023 23:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QEv4RdIHEpDaWeBFegn1AIUItJy/VoOsMaUUrqvBXCU=;
        b=k7aWom532xJ/30+zDgsqJJX76SQkXkZtbxr8YNDZmbHS+YnaT42ZbsOOIC7vVQBnv5
         DMsra1lUcGPO8yrKJfyZDicLqz+lJ9lFUMRnbKvzLbHFz0EHAu2nHhoz8EFt9OlDQLCD
         PQB460/2BpGHjycMyD8gUtHlaaiEm5xgRYl26uYcKW3pdfEuZ1VabVXxbYQu4dQRH3hk
         mZPN9JNFpMpIfmLLaoMbQnzvND9pKi0zbFoLHKZsLFTUygC7tPJajCk1n/IJkj0yah+R
         OqRv9JWCaI66jx+TXSP4OTzLlBREUGMV1jFU+eUfC0LAzK6pOVDEQrEi4QYYBTxwiMDn
         kYFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QEv4RdIHEpDaWeBFegn1AIUItJy/VoOsMaUUrqvBXCU=;
        b=TEgFjUzJdQOselIzIMNNdyR3Px7j2lde6NFsHFgSLTWVVA4E8vQPcllmb5sPv5GDmX
         thHKfTpyTC+wKhwrjYVU9nzLk+I5RHaOTaIbDkw6VqXzb5vGvEdWn3lFDFoIFBIQzs9i
         /1yq6TLl4y/kGM5s6XYYEnZAYGouJJlFXb0jv8HJkVLiFGN4VUrDLn9ZQIpyNdZOLkTc
         I2QcbEPnCzoPHBU41VXp4YoVbt7yfAWFNWueTojB3mARqJgU3AMsCp4KNK3ubRx89IYR
         babka6oOpkFL8/bnXRKsJQr5SkDgeg2G6oQVe53eILHc9/oTGGNfYjLnLHvrnbgUMnSL
         7YZA==
X-Gm-Message-State: AO0yUKWugV7Bqc4fUBH0NiGaDl34IAWmKQeEiciHDdpIKlzBN6KCmh2C
        zmL34y7jDRzFJQbBFoq88D71Pg==
X-Google-Smtp-Source: AK7set8/RcSVp1Ks4xKsgRqCz0Cn6Io0l8WY0JgK7Ri1oa6rCnWQ76Zx+p6/KdCczrxk8uzSbkIcNA==
X-Received: by 2002:aa7:ca51:0:b0:4ab:2423:e310 with SMTP id j17-20020aa7ca51000000b004ab2423e310mr4864653edt.28.1676533402212;
        Wed, 15 Feb 2023 23:43:22 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y42-20020a50bb2d000000b004ab1f97ca2csm423318ede.60.2023.02.15.23.43.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 23:43:21 -0800 (PST)
Message-ID: <d811956d-fcef-c196-3953-7ef7bd4dc372@linaro.org>
Date:   Thu, 16 Feb 2023 08:43:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 5/7] media: dt-bindings: samsung,exynos4212-is: convert
 to dtschema
To:     Rob Herring <robh@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230214104508.51955-1-krzysztof.kozlowski@linaro.org>
 <20230214104508.51955-6-krzysztof.kozlowski@linaro.org>
 <20230215205317.GA529822-robh@kernel.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230215205317.GA529822-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/02/2023 21:53, Rob Herring wrote:
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  ranges: true
>> +
>> +  '#size-cells':
>> +    const: 1
> 
> Normally this is next to #address-cells.

I kept alphabetical sorting, but I can move this with ranges close to
the reg/address-cells.

> 
>> +
>> +patternProperties:
>> +  "^pmu@[0-9a-f]+$":
>> +    type: object
>> +    additionalProperties: false
>> +    description:
>> +      Node representing the SoC's Power Management Unit (duplicated with the
>> +      correct PMU node in the SoC).
>> +
>> +    properties:
>> +      reg:
>> +        maxItems: 1
>> +
>> +    required:
>> +      - reg
>> +
>> +  "^i2c-isp@[0-9a-f]+$":
>> +    type: object
>> +    $ref: /schemas/i2c/i2c-controller.yaml#
>> +    unevaluatedProperties: false
>> +      #additionalProperties: false
> 
> ??

Indeed, some debug code...

Best regards,
Krzysztof

