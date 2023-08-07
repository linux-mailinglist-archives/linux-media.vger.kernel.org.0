Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 935DA772E72
	for <lists+linux-media@lfdr.de>; Mon,  7 Aug 2023 21:05:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230345AbjHGTFY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Aug 2023 15:05:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230060AbjHGTFX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Aug 2023 15:05:23 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CD131724
        for <linux-media@vger.kernel.org>; Mon,  7 Aug 2023 12:05:20 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-31781e15a0cso3829646f8f.3
        for <linux-media@vger.kernel.org>; Mon, 07 Aug 2023 12:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691435119; x=1692039919;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rvuFHndPak4ec42pS0cW4H6Y5ajhn2h6mKNTE3KKxxo=;
        b=Yem7gJdGf7Owrby1kKBGd9+PAvzP5GbKKVok+aWqs3yyLzIOop3idScyHOlMF+jgWm
         +LVRZenvKFPZJ4KmROoqVWBmj7pmmaqrC3KuivpqxrdHR/lf7lBn0/pjGhoFdLjFX7zz
         g7p4NChjrw4lnESiAtysoSSE01RIR7zeU/G6WZom2Pau1eYtg1UCz3kZgJrbma67e0GC
         Cp/w1NPBnFVG/ioGWQpSSkvWEZkde1SXDFe4OKMNjD2DbecUAHeWesRBbb5kgkRhoOcs
         QuAjeabAXCyEiAn8vBR9vX5EyX8nyT9mK/K+2FirUctKKsYr2HfPW/wMjSRBvWjzOmhW
         G3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691435119; x=1692039919;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rvuFHndPak4ec42pS0cW4H6Y5ajhn2h6mKNTE3KKxxo=;
        b=aED031BAxJifGDrEDy0uJaIu7pVw5lm6xuyBXRvbjDjerBWEz/gexsrTwSywZ/uDje
         g+GvgcQ5Ircr0zZiMZIfJ1Klw0QSPnUkjAi5H27qBNo3w/rkLZsWc6KCmYXUdX3WRb0y
         9pZaJIATIi8362vTyzgt7r3lZ5E0xSYk7FoCMZNk+lTvl7CB5PN/WyjXg0sba1wf1eaB
         oeFPYZj8/kSvvs60lwzkdyaEXxUDwnAuchMAINiWxGoYogFf0/7JrvMyjwfJgvZQkjjs
         UbDPwPDrqyuPQAXY/N3DsnHg9wOxIFhVRL7495Qwh0ibCrryMaA5XdX/S33kZLqalEhp
         u/yw==
X-Gm-Message-State: AOJu0YzJoh74okBfBAyT0fJ0IPhJOAsn6SJg1T2FC8Sm5TFIA+PCAfjP
        ZcB8f3rxrzCiXrDulNscDJKaoA==
X-Google-Smtp-Source: AGHT+IG0ZZxtP9emcBVJC5c2XbtqWNh1hbYL+45ShRzUzFbWLI69g4Y4soB3Co9c1GR/FTyRTROQ3w==
X-Received: by 2002:adf:fd47:0:b0:317:6681:e426 with SMTP id h7-20020adffd47000000b003176681e426mr5984372wrs.25.1691435118926;
        Mon, 07 Aug 2023 12:05:18 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id s1-20020adff801000000b00314417f5272sm11263527wrp.64.2023.08.07.12.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Aug 2023 12:05:18 -0700 (PDT)
Message-ID: <0cba0158-8a9f-68b6-6bb3-dab0272a5ce0@linaro.org>
Date:   Mon, 7 Aug 2023 20:05:17 +0100
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
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <4bd04709-155f-4750-8638-e73b653b1482@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07/08/2023 19:55, Konrad Dybcio wrote:
> On 7.08.2023 20:49, Bryan O'Donoghue wrote:
>> On 07/08/2023 19:45, Konrad Dybcio wrote:
>>> That can be taken care of with match data.
>>>
>>> Konrad
>>
>> Well perhaps.
>>
>> I'm just sticking my oar in, to elucidate.
>>
>> The compat sub-nodes aren't just a random choice with no logic. They exist to select between what you assign the blocks to be, encoder, decoder or any admixture thereof.
>>
>> A functionality we want to maintain.
> Surely something like a modparam would be more suitable here?
> 
> Konrad

Hmm.

Well from earlier in the thread the question "why do we have these 
compat strings" is because we can have any combination of 
encoder/decoder assigned.

If there's a cogent argument _still_ to be made to transition to some 
new way of assignment then fine so long as we don't break that basic 
flexibility.

Though my own €0.02 is that a module parameter is more of a PITA than a 
compat string.

OTOH I could make the argument, that the high probability is most people 
- probably all, just instantiate a single encoder and decoder and aren't 
aware of or using the inbuilt flexibility.

@stan probably has the right idea what to do.

---
bod
