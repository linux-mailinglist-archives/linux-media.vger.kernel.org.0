Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57F98772E23
	for <lists+linux-media@lfdr.de>; Mon,  7 Aug 2023 20:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbjHGStx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Aug 2023 14:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbjHGStw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Aug 2023 14:49:52 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 875DC1722
        for <linux-media@vger.kernel.org>; Mon,  7 Aug 2023 11:49:50 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4fe3b86cec1so7472901e87.2
        for <linux-media@vger.kernel.org>; Mon, 07 Aug 2023 11:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691434189; x=1692038989;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ANJrSzigMzExVLvsu3j6MzENM2rPGAVorWV6tHk2GIk=;
        b=uL0sECQYsbK7JFK4H1/ljyGNuN5ibi9wDDeG8f9DH41y5P0nXsRIs9+wKMKJUo4i4W
         hDpxoRYt6FPh1cPK1MDvTaMtNGojDQoGlVVHD1osmi1BrGgJfVvaOQMkPVV3hAVUVwLj
         FXS9iY2jVoXTjohkXYjGuKOgNlluvOW6+NO+ABJLJCo7oO5j6XBGaUxJ1jUdcMXAFBQy
         mJM0KXxguL3ygP7l+BIAgBl/i1FhkK3QofX/V/JG9aUQ8Ktung/bdu/F52E2D5CZSLxV
         PDzBhIbm1NBAwPZJOqSCuLJcZn5Mt4PeycfyS9DK7cCgKWqzXLg7LYuayBOPX3+M8j2l
         lTpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691434189; x=1692038989;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ANJrSzigMzExVLvsu3j6MzENM2rPGAVorWV6tHk2GIk=;
        b=OiVm6D6bY38uxS2jUOod+DC5IaHf4P1b6Oxtco1zYZ3VCFPNZNZGYDjwHF/5TI4kIi
         jn5mNwUPVsZtEnEyk1F4Spb/GP9dYQVPoy0qQTzUKvqJECoat8USOEDVvEL66tuhL0+u
         t7sZu38HQ2GiUtFxN7An1kOg/sye7qkxAddnceVfOxeWvfzVeWBwaSgtsVJnCm9JoER9
         uGcpKtX980RLw45H8ntqszJ9b8q0UtKMiBwiwUbIvHreuc42IW1huxpJdof42hM2Z5Mu
         21oICywofwd/AYlgrqZbruvGZyHuuQGO0L/0LYofgonuEJXNLIOXh+s7GN2zzldx6V6z
         tbUw==
X-Gm-Message-State: AOJu0YxsO8G2Gb5hgxpyoYpzEZ3liEKb0R6GuzTn/JcRqqBogX+9cbpi
        AACqRtwrI79TT96rAP1yILgVJg==
X-Google-Smtp-Source: AGHT+IEBYUFD1GyWGnzrl974YHGuuRe2ad8TfqmmHLiXPw4P1nA1F5rU0Qazh3uQCDzBe/sCly7Aqg==
X-Received: by 2002:a05:6512:2102:b0:4f8:7734:8dd2 with SMTP id q2-20020a056512210200b004f877348dd2mr5989987lfr.53.1691434188709;
        Mon, 07 Aug 2023 11:49:48 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m13-20020a7bca4d000000b003fa96fe2bd9sm15787933wml.22.2023.08.07.11.49.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Aug 2023 11:49:48 -0700 (PDT)
Message-ID: <d09df249-cc6d-9708-bfa6-ae5cc7929697@linaro.org>
Date:   Mon, 7 Aug 2023 19:49:47 +0100
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
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <0feda32e-5430-4f35-b18a-7afce63a970c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07/08/2023 19:45, Konrad Dybcio wrote:
> That can be taken care of with match data.
> 
> Konrad

Well perhaps.

I'm just sticking my oar in, to elucidate.

The compat sub-nodes aren't just a random choice with no logic. They 
exist to select between what you assign the blocks to be, encoder, 
decoder or any admixture thereof.

A functionality we want to maintain.

---
bod
