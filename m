Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0CF07072FA
	for <lists+linux-media@lfdr.de>; Wed, 17 May 2023 22:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbjEQUZU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 May 2023 16:25:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbjEQUZS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 May 2023 16:25:18 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BE6183F0
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 13:25:15 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2ac80ed7f26so13208021fa.1
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 13:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684355113; x=1686947113;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gm3y2wIKXeo4RLdtNri9QzjjhdM2vmdYj4Pt4IbNgeQ=;
        b=T3UU2KsQKVP7jzVL0YJ9F+QUdQsuiP1YJmhRbdmpoDAZBtYZASegDO0CGJ0SlOQoSV
         QPRQHD4KchB4UXReT/BvncaFoxApXXHWzVtWBhaoUjuo3CS+p7rA8pGgi7wf9Wp+I25y
         T4S/NQWlvOnp3aCcfBuhKbAc2ieIsaLhnYe5plu4ClZNDqAxFD44i65ORMH9CgV9W0Ph
         g10aUdmJ70+dVSaJGtvYNKLL2DuJCN7CHlaFmxHCK+PvM5QRy7vgJu4IYlI3KuPkhUMM
         OU4hByTHiiULBMS8WrbdWQl+QcsQfv8sCqp/FN985t56olljbCVr7pjrINH+/m5AtsO4
         HQ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684355113; x=1686947113;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gm3y2wIKXeo4RLdtNri9QzjjhdM2vmdYj4Pt4IbNgeQ=;
        b=e7dvMtQgRjq9MkV57hZaMUL8spw9D/QJ5IUIUyn79ZAmjyr/sMBEFlGGWa7wG5Mr5K
         IBwUydBe0uwN3fV9KUfUNRadHmnYMFMzbCf74/PlXQS9jBgspg+FSuI0ApXHMfUBp0n5
         4VU62kch9ruxzz9olwPzsaxpyUdzziCnCZNsg0VYo5dglNl/BNBmfvzWPfFt2pjR44oI
         86C7GgxPSAJ5afZKD8Ys7hqK/1+/keYg9Hux+w4cPUPlZWoj/o2alkymzYZ6sD90LE4U
         G1Lhz2RXsJqEC3epFwkjbUGOjiwnQdFZvBatmtAnqUeKDS2tl+2RoA8BsV3BoWD2JbPp
         emnw==
X-Gm-Message-State: AC+VfDySfp1kqJSChAOVGpgtv2ECYRd0cnx8HPiHiyuU2hX3VLl+U1QJ
        E7raXHn7jn9NNrXVJaZsretK3paC+PnvMGDWc1s=
X-Google-Smtp-Source: ACHHUZ7R9mpYrHl5GpfD2kyel38ZdFHESzb8buFCHSAUaVXx3wxYh2W6X5t0lDlBw2zfZpGSaAA/NA==
X-Received: by 2002:a2e:999a:0:b0:2ae:d269:5a1e with SMTP id w26-20020a2e999a000000b002aed2695a1emr5041062lji.21.1684355113248;
        Wed, 17 May 2023 13:25:13 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id y5-20020a2e95c5000000b002addbc16a54sm2021760ljh.41.2023.05.17.13.25.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 13:25:12 -0700 (PDT)
Message-ID: <13f7055b-8ec2-68c3-06a4-d650f76c0ac2@linaro.org>
Date:   Wed, 17 May 2023 22:25:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 00/18] Venus QoL / maintainability fixes
Content-Language: en-US
To:     Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
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
 <f9904e82-4756-2add-3c7e-e019ce966515@linaro.org>
 <049c7e3e-eaf2-0253-bf5b-83b9e8f949ab@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <049c7e3e-eaf2-0253-bf5b-83b9e8f949ab@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 16.05.2023 14:57, Vikash Garodia wrote:
> 
> On 5/12/2023 8:31 AM, Bryan O'Donoghue wrote:
>> On 04/05/2023 09:00, Konrad Dybcio wrote:
>>> Tested on 8250, but pretty please test it on your boards too!
>>
>> What's the definition of test here ?
>>
>> I ran this
>>
>> ffplay -codec:video h264_v4l2m2m FantasticFour-ROTSS.mp4
>>
>> and this
>>
>> ffplay -codec:video vp8_v4l2m2m /mnt/big-buck-bunny_trailer.webm
>>
>> on db410c with no errors. Then again I applied and disapplied the 8x8 264 fix to
>> that branch and saw no discernable difference so I'm not very confident we have
>> good coverage.
>>
>> @Stan @Vikash could you give some suggested tests for coverage here ?
> 
> I could think of below test aspects for this series
> 1. Suspend Resume
> 2. Concurrency test
> 3. Module load -> video usecase -> module unload -> module load -> video
> usecase. This would ensure video firmware is reloaded and functional.
> 4. Video playback and encode for all supported resolution and codecs.
> 5. In general, video playback with more test content.
> 
> I would be testing the series with stability test suite on CrOS. That would be
> either on sc7180 or sc7280 setup.
> 
> Konrad, you can post the new version as one patch needs to be dropped. Test can
> be done on the new version. There are few patches in the series pending review,
> which can be done in parallel.
Sure, working on it!

Konrad
> 
> -Vikash
> 
>>
>> @Konrad - get a db410c !
>>
>> My superficial first-pass on this series looks good but, before giving a
>> Tested-by here, I think we should define a set of coverage tests, run them - the
>> upper end on sm8250 and lower end msm8916 "makes sense to me"
>>
>> 20? different gstreamer tests at different formats and different sizes on our
>> selected platforms db410c, rb5, rb3 I have - also an 820 I haven't booted and an
>> enforce sdm660.
>>
>> Which tests will we use to validate this series and subsequent series to ensure
>> we don't have more regressions ?
>>
>> ---
>> bod
