Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F34D16A5CC7
	for <lists+linux-media@lfdr.de>; Tue, 28 Feb 2023 17:09:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbjB1QJF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Feb 2023 11:09:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbjB1QJE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Feb 2023 11:09:04 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 406D31499A
        for <linux-media@vger.kernel.org>; Tue, 28 Feb 2023 08:09:03 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id t11so13929263lfr.1
        for <linux-media@vger.kernel.org>; Tue, 28 Feb 2023 08:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677600541;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JNvO5e3u+7eCvYpL2ndFdFKbFrDn2HG9Ge5MkD8Klws=;
        b=W95gy/E2QikoBCEclZmrNzX8NqOhU3Kur9lLj7lltxCtcKJ9OijjXT3fKS1rb8Cxzr
         BZK9ET1fr5QIN6hWZHIgj1Iee+QsdOLrdfIqayXsCv3wuE+u18RB9GX16a70vOSVmJtW
         0VCIvo0APDNLKCR4BDo1uRQc5F9NHECExymqpEm2iF70hlHAlF3dIQsuqlxw0Z6G5T/J
         EmE5D2ANFd296DzvhXThqarUlDw9eCN7EPiHZHzcFHJzgpECC4AgrAPpo+t7hG0aD+jS
         1ah28ynA5FIUOMzhDfqiYHlhp6NBRvATvgvafZqm1eVOk7OoNZHWiAL4tII5JdZinZc9
         P/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677600541;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JNvO5e3u+7eCvYpL2ndFdFKbFrDn2HG9Ge5MkD8Klws=;
        b=JSIOoCm1Rmt0QfJbP5zhSvr6LiA1xApo6rto3vSbu/pKhVlZCACg2dNfzWlIM69xNK
         tQ/H0RWU87G/wz6ryA94BTlmeVY6VguU5K7DGhNXsEaTkTaK/L38CGlK6k3IgFpCMrQC
         HMGVgqC5PeDOJvfOPpqx/GYXUtb3V3oT9Ltr6rjsyNOwxJ//puvQdsI6Qsy4ZzsWXmwU
         vcju4npI3Px9lkDkKURZ+oUe/u4TRBbzSjjeOaER8LRbY0xL44mRjFie23BCP09JZKfL
         AG+WiNkR/5WJCwVsRZXCVsDvT/ifOGCfx7pR29FVjqFYLb7dMzd8TCmLuH3qfbBulZzp
         8F/Q==
X-Gm-Message-State: AO0yUKXMKYfCs2glePEyD4qzfs3ZsFYEGTRf69QN2yICY+4hjWD90/wx
        Bo09ujYcorCCdECxc0mV97XpqQ==
X-Google-Smtp-Source: AK7set8npvfpONOaNtGpbVGxu5PKfiHa4cp8WjlSaVn1UmhsI/m4GhHWN0xSaXHZGJ7llkL9ObTN7w==
X-Received: by 2002:ac2:4c0f:0:b0:4cb:1189:285c with SMTP id t15-20020ac24c0f000000b004cb1189285cmr1010331lfq.10.1677600541547;
        Tue, 28 Feb 2023 08:09:01 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id b1-20020a056512218100b004db3e445f1fsm1391872lft.97.2023.02.28.08.09.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 08:09:01 -0800 (PST)
Message-ID: <0c522cb9-023b-63e1-dc48-3c0e82c2c7a8@linaro.org>
Date:   Tue, 28 Feb 2023 17:08:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 12/18] media: venus: firmware: Correct IS_V6() checks
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>
References: <20230228-topic-venus-v1-0-58c2c88384e9@linaro.org>
 <20230228-topic-venus-v1-12-58c2c88384e9@linaro.org>
 <cb71bea2-088b-d4e9-b143-be9421b92c78@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <cb71bea2-088b-d4e9-b143-be9421b92c78@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 28.02.2023 16:48, Bryan O'Donoghue wrote:
> On 28/02/2023 15:24, Konrad Dybcio wrote:
>> -    if (IS_V6(core))
>> +    /*
>> +     * This may sound counter-intuitive, but when there's no TZ, we gotta
>> +     * do things that it would otherwise do for us, such as initializing
>> +     * the hardware at a very basic level.
>> +     * */
> 
> Suggest "When there is no TZ we have got to initialize hardware in-lieu of TZ" as an example.
> 
> Either way please drop that "gotta" - I ain't gonna ACK such a butchering of the language.
Gotta do what you gotta do.. :P I can reword it.

Konrad
> 
> Then
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
