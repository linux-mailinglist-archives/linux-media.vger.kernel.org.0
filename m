Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CEC86FFF26
	for <lists+linux-media@lfdr.de>; Fri, 12 May 2023 05:01:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239813AbjELDB2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 May 2023 23:01:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239487AbjELDBZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 May 2023 23:01:25 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08C9B1B4
        for <linux-media@vger.kernel.org>; Thu, 11 May 2023 20:01:23 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f42c86543bso27628835e9.3
        for <linux-media@vger.kernel.org>; Thu, 11 May 2023 20:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683860481; x=1686452481;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wNH+qT+d278L8EuW7+gJj57wNou4ngN3N+y41xL0bJg=;
        b=bsfwLbTBcF81MZeJ5Eya6UvNOwMn6NFXp1BWVwwh6WeMzLswrcetweYtitBfRV1LJp
         kqX1FbImeeNtFUS04GbjkFfj/YrFVwqRF22Cyq/SdOkfCAGbnve4GGykWMnzo47LnOdm
         QvCC2CjXm+ApHY7cqpoa+x4BDadq1gxPbpKZ9g9/6EEUnO4eZ+EbAr68dvWhfyEIWhnF
         pkCRdkTN03AuRWSyXUi540JrbEbX+n5fQ4tYV+ZClNXxeloLqkJ5vRHPjCWzExCU3Lda
         uhi0Ezs/upGKHHkPNC1JGdxg58qYjfkQGIweMuDMJF2hL387Ypfxq8HN5yvW1aAq9hnv
         QI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683860481; x=1686452481;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wNH+qT+d278L8EuW7+gJj57wNou4ngN3N+y41xL0bJg=;
        b=Ts0I9EgUJsFqmzjg1IPvPXbiZNmRDgYigkHJaE2XXWo6gegjLQyaKcOekF8N/Q3561
         iqI0oxkrSMakPjYUPbAaI/2gEh9TMULvbCZ11sJLI7Z2c3y1ix9t2PQqDd7gY4bNe8+f
         s365b8miDbZ/o0kVgVrXckF+cQ3UdJnc6BiFDX6xinhsJ5h9vqzNQXZHicd0ptcokGK/
         hOT9uEBOwnV5tic790Fg+jIsbC9lDG5RwSC8a0E6z4aD3If5hak1CbbMBFVUCesNXjRE
         n1l1bBHsdVjg46p9s9Sx5qICctI+J/GFHLljbIgUOuZrF0Hahc6quV8I4UZjmawzN+FR
         B4Vg==
X-Gm-Message-State: AC+VfDy+yOeSifNH3tiOkdDTer45/D9im9s4AG7wUHuJaCKU9JHSRlup
        /07Yl6biUiwgPn+HWs/swD/zJQ==
X-Google-Smtp-Source: ACHHUZ44za2uY/t0ZeDVI7Cub+JKSvmiDla/DY0bj3D5erE9BCthF8KD3B45b2eRZNuru7kPL/TL5Q==
X-Received: by 2002:a5d:6149:0:b0:306:2fd1:a929 with SMTP id y9-20020a5d6149000000b003062fd1a929mr15785049wrt.7.1683860481429;
        Thu, 11 May 2023 20:01:21 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id w12-20020a05600c474c00b003f07ef4e3e0sm14458610wmo.0.2023.05.11.20.01.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 20:01:20 -0700 (PDT)
Message-ID: <f9904e82-4756-2add-3c7e-e019ce966515@linaro.org>
Date:   Fri, 12 May 2023 04:01:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 00/18] Venus QoL / maintainability fixes
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        stable@vger.kernel.org
References: <20230228-topic-venus-v2-0-d95d14949c79@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230228-topic-venus-v2-0-d95d14949c79@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04/05/2023 09:00, Konrad Dybcio wrote:
> Tested on 8250, but pretty please test it on your boards too!

What's the definition of test here ?

I ran this

ffplay -codec:video h264_v4l2m2m FantasticFour-ROTSS.mp4

and this

ffplay -codec:video vp8_v4l2m2m /mnt/big-buck-bunny_trailer.webm

on db410c with no errors. Then again I applied and disapplied the 8x8 
264 fix to that branch and saw no discernable difference so I'm not very 
confident we have good coverage.

@Stan @Vikash could you give some suggested tests for coverage here ?

@Konrad - get a db410c !

My superficial first-pass on this series looks good but, before giving a 
Tested-by here, I think we should define a set of coverage tests, run 
them - the upper end on sm8250 and lower end msm8916 "makes sense to me"

20? different gstreamer tests at different formats and different sizes 
on our selected platforms db410c, rb5, rb3 I have - also an 820 I 
haven't booted and an enforce sdm660.

Which tests will we use to validate this series and subsequent series to 
ensure we don't have more regressions ?

---
bod
