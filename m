Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6AAE775FFB
	for <lists+linux-media@lfdr.de>; Wed,  9 Aug 2023 14:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbjHIM5t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Aug 2023 08:57:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbjHIM5s (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Aug 2023 08:57:48 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60F9E1FF9
        for <linux-media@vger.kernel.org>; Wed,  9 Aug 2023 05:57:47 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fbea14700bso57697365e9.3
        for <linux-media@vger.kernel.org>; Wed, 09 Aug 2023 05:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691585866; x=1692190666;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k3HCAasWYNZ9LIAV78A4uCkjkoES5nhFv19HRBaFI6k=;
        b=fX3JzYgvoKYGPBgcz0f+IYGmYExjSmBy3BOiiNf6s40id+N4R52jbkj181Dozf/GLc
         wNsVfZOBJTjDahe2Ls2wsyzmQ6LjZIxtAwMGM0WdP8Lk71sziB3Ri5fhoirK/civ4c/a
         m5EoiH1uQord24EXslz5SGXYNbuwJbTuZbRF/CgadyQ580EDQgzaVMNvHfW5U4ExtJ3F
         OkC7UF1KGDcU69sDJxYihx0i72Iy6WpXt8z+IZPnh3V79YNfbRkBMKoTRqlRVQEOSNl7
         WSLmb3aFcJncSprqNp+N5epGpECMQRca75BpiUd7y44DemZZPfJ5dMMBZcy5N1vV4Ovw
         FFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691585866; x=1692190666;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k3HCAasWYNZ9LIAV78A4uCkjkoES5nhFv19HRBaFI6k=;
        b=lQlno8AyhxdHJYs+jepHzY7I0UVCYrl6Net6OH89UGd8OgMlTinaGj2OssaL8yGjVA
         2G/EEjObIqXJvR0bmGFAqpB77JB0OzNJoAHu//HJ/mNx9K9mMyOf/XCAisuM5N5tFDPX
         MqgZUejkaTDXOG0uOnar92GCoyuQET55pDPf49XxA2cMbv8x8FEoGEqoWGEgnb4aAY2w
         AFGteLwaTNVRfmTD4hlt4CwcUUlwque0fafbeYO+QsCK8Fw9DwilFZYsh6oJhd6NwtvE
         uZ1cdkMzuqR7HInTAMQyofDB9dTROGRi/8EZiWcMrnxt6h857uMV9z4sDg9ccENys/T+
         sKmw==
X-Gm-Message-State: AOJu0YwVApJ0BKsCxwwcOKk10PRqQ52ZDm4Yw4Lxqd804BOF4I/vELjo
        yuWhS9l2IwuI17jfbkAaM8NlwQ==
X-Google-Smtp-Source: AGHT+IHedHvibQt77m5n/KV7nE497zImStSAb9zFe5FDYuP7zTmHWVEJ7Tma3hVOXsTr0kchK2up7g==
X-Received: by 2002:a5d:46ce:0:b0:317:6b92:26b5 with SMTP id g14-20020a5d46ce000000b003176b9226b5mr1723146wrs.23.1691585865844;
        Wed, 09 Aug 2023 05:57:45 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c17-20020adfe711000000b00317afc7949csm16574445wrm.50.2023.08.09.05.57.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 05:57:45 -0700 (PDT)
Message-ID: <6807f8c8-0503-cf79-7ef0-653ebafc81e3@linaro.org>
Date:   Wed, 9 Aug 2023 13:57:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/6] media: dt-bindings: Document SC8280XP/SM8350 Venus
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230731-topic-8280_venus-v1-0-8c8bbe1983a5@linaro.org>
 <20230731-topic-8280_venus-v1-1-8c8bbe1983a5@linaro.org>
 <84ab9380-2fb2-76f9-2eb9-71d9202718cc@linaro.org>
 <659e30a7-80f7-4fd8-af58-45505213a2ef@linaro.org>
 <ba40de82-b308-67b1-5751-bb2d95f2b8a5@linaro.org>
 <fa5dc696-6c67-49d0-b158-f1e3398813e2@linaro.org>
 <816359f7-ad4d-659f-db39-c971e1b1cd9a@linaro.org>
 <0feda32e-5430-4f35-b18a-7afce63a970c@linaro.org>
 <d09df249-cc6d-9708-bfa6-ae5cc7929697@linaro.org>
 <4bd04709-155f-4750-8638-e73b653b1482@linaro.org>
 <0cba0158-8a9f-68b6-6bb3-dab0272a5ce0@linaro.org>
 <15b545a2-14be-47ba-a665-8ae986a7f9cd@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <15b545a2-14be-47ba-a665-8ae986a7f9cd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/08/2023 13:15, Konrad Dybcio wrote:
>> Hmm.
>>
>> Well from earlier in the thread the question "why do we have these compat strings" is because we can have any combination of encoder/decoder assigned.
>>
>> If there's a cogent argument_still_  to be made to transition to some new way of assignment then fine so long as we don't break that basic flexibility.
>>
>> Though my own €0.02 is that a module parameter is more of a PITA than a compat string.
>>
>> OTOH I could make the argument, that the high probability is most people - probably all, just instantiate a single encoder and decoder and aren't aware of or using the inbuilt flexibility.
>>
>> @stan probably has the right idea what to do.
> Actually..
> 
> Has anybody tested this, ever, with the mainline driver?

I assume Stan has.

> Do we have anyone using this?
Can't say.

> Is anybody willing to maintain that, test for regressions and
> fix them in a reasonable amount of time?
> 
> 
> If we don't have at least 2x "yes" here, I don't think it makes sense
> to worry about it..

Hmm.

We decide if we are encoding or decoding when we init a session and the 
blocks are symmetrical. The hw blocks themselves are not bound to a 
particular encode/decode mode.

Having two parallel encoders or decoders is exactly the same effort as 
having a parallel encoder/decoder.

We don't test parallel encoding/decoding but we should. I'd not be 
surprised to find there are bugs but, that's not a reason to exclude 
rather to find and fix bugs.

---
bod
