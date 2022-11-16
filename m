Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63D6362B567
	for <lists+linux-media@lfdr.de>; Wed, 16 Nov 2022 09:41:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233157AbiKPIlG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Nov 2022 03:41:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231221AbiKPIlF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Nov 2022 03:41:05 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF4EE7649
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 00:41:03 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id z24so20909987ljn.4
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 00:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WKomYKer6IOlk9OYfe5boHqcz5vQnMZP91+VjU1InXs=;
        b=PiCx6vsNVI7SDWgezB608eHhCA+k0s4gpaq1AKrZc0kACPWo4Y5httsoSQCemOQ61U
         0aEzgpG18FwegKJttHKCofkF91oyy3J+34SkXnOjqngczuSb7Uwr7Wad5YzzaJIz2NB0
         7CtQjgZCbZx9kZmSvp71WOtShTEuPO4DqUCVDkFkl0ZbEetKqZGfrdyCwECDcQTxx/Zo
         V35KmfdePRjk665M80p2CQGZd2gUQDogr8tvCJnuJQhBV1aYznNxQDg7UWx2eoVfSBqK
         ykh4uDE54/P84xIkP9n735SJy98srWqgr2VIRRHl4+4aaPSR5l/6Zmjp/DKn198jy4M2
         W90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WKomYKer6IOlk9OYfe5boHqcz5vQnMZP91+VjU1InXs=;
        b=ArwwY4j8ACdOSs2YRr1UYM1ZjiCJ0VaCJRikDJKKgrFoVR6WTyAPHm17cXUID3q4w/
         l9JWy38ZhEXXAx3fDpRiM4LU7OgarruZlHkTG6S9UNKi0W7FZlEDNs7rjrRVA5MuYNbq
         wVxRUdmcUK5BNlVr/Xq49ZKJnWDBXAog/P5YLxEfTbkCb/Yu647AefaHFbagjXeI9w/a
         WMxMRrlMlySM1260Xfwn5EqGPtfjT4xNfm0T1M8D6FNpgP06R7/MUyEt+P0VGfZdhkz6
         tcUFcdu5m2W2ydAEfGyPZ+sJ8irkvH6JhxIT0x9Qia+Z0svJ1fNy9vykxfFamB/NBLlD
         QTJA==
X-Gm-Message-State: ANoB5pmZtACHMfjoJfO+/fLGHyEBdxOCvfHaCXZ07UiwlrxJVI52vCqy
        xP+FnJo0X2mYXI0DhKzZkc+vbjZAKgmFQ4S+
X-Google-Smtp-Source: AA0mqf4cT0FBx2fYZ6Uuv4alEFnAQZG0XcvUwdJ+UFowytFx6EqlO7q4x5YZavMKV3/L/ZYA3Lmr+g==
X-Received: by 2002:a2e:bc05:0:b0:277:6c67:1a7f with SMTP id b5-20020a2ebc05000000b002776c671a7fmr7570639ljf.133.1668588061996;
        Wed, 16 Nov 2022 00:41:01 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m9-20020a197109000000b00497a61453a9sm2489209lfc.243.2022.11.16.00.41.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 00:41:01 -0800 (PST)
Message-ID: <65cd0bd4-a29a-d238-4e26-662172258eec@linaro.org>
Date:   Wed, 16 Nov 2022 09:41:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: Add IMX519 CMOS sensor
 binding
Content-Language: en-US
To:     lee <lee@arducam.com>, linux-media@vger.kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de,
        devicetree@vger.kernel.org
References: <20221116091819.00005eec@arducam.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221116091819.00005eec@arducam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/11/2022 02:18, lee wrote:
> Add YAML device tree binding for IMX519 CMOS image sensor, and
> the relevant MAINTAINERS entries.
> 
> Signed-off-by: Lee <lee@arducam.com>

That's surprising change... You must use your full legal name, as in
latin alphabet. Previously this was something else, so I have doubts. No
single names (like first name) or nicknames.

> ---
>  .../bindings/media/i2c/sony,imx519.yaml       | 107 ++++++++++++++++++
>  MAINTAINERS                                   |   8 ++
>  2 files changed, 115 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml
> 

Best regards,
Krzysztof

