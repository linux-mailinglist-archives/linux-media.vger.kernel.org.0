Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 911766898C9
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 13:32:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233004AbjBCMcN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 07:32:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232989AbjBCMcL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 07:32:11 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B8FC7D6E1
        for <linux-media@vger.kernel.org>; Fri,  3 Feb 2023 04:32:02 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id u21so5039758edv.3
        for <linux-media@vger.kernel.org>; Fri, 03 Feb 2023 04:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ON3Sl99UT8ureqEDmbSEHsRNx7R9SA+QtKFoE+i2Oo=;
        b=lBVk3W/UyO+p9pLq07rPsBt3xO3mjw0/Q6FYYGvYul/Bl75Etx/NWDZziXRICISYS+
         OTpgs7RnubJ7HlWJC0ura+8mz9FMYhyJtqNMzTCWO2JnyWqdi1MN2f7Z1V894VlNIO9j
         p6xP5SK4SW/m915LCK+EHPwQmRVusS2IFDT0IeXhMnZtNgCAnMw8tmhPWIEyYIdUv45K
         MfEhOVerky/dQnDV5WkSyqaYpPz0oIOOZe/tvR90qdmUjlkcpH0RC+oQ0RS7bj+hAfwi
         09UGK7Kxldpb7n2Vkg8yK53NSa//2Amlqbdrp1X7BKt+6m7Qh9UtlZluuXWXIdj2S1eR
         xJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ON3Sl99UT8ureqEDmbSEHsRNx7R9SA+QtKFoE+i2Oo=;
        b=b4VwzSRCMgMvzeEesoZ/0Qxf5evGFPJ+7GMz1gF2SNqmLRY05I/7ir7uVBPvFV/94n
         XH5fDNW+a6xTUqW0MONxmbqESxZDB17/XMKzoIQEwGjR6x/hZ+AERTUGgsut+QGsAIST
         P29L0FF9vLS8hPV+1taH7QDxtbeqMwTGN6eVcSlu3oT5hneCK24XApAC/dARLf3tZYW0
         /dGbAUwPIUUtQdUlhhLYSp5P+axcHWlJXfu5fw5l3as7JVzM+RU/MrdOecQVM/Sjrffy
         sVv1d3ZrCgY7XD83FkqQos1DAUB8VZ6Zc4pY6JUX9Aa6F6bPdTcNuYlW8YqA8kzpyfrv
         OEHQ==
X-Gm-Message-State: AO0yUKW4UbjioiAE14Totwprt3N4il+HuT19fEwYRuilPBNq2XT8RTtk
        Y5iyVvrYNs+9p9iqPpFGFdeLQw==
X-Google-Smtp-Source: AK7set+mvfj95zLeSWmU5e5UDpt5MMre8u+osBvx7sTSxXMPwrd90oXq/vv0Ttley1PZsEGT2E4jxg==
X-Received: by 2002:a05:6402:298c:b0:4a8:452:55a4 with SMTP id eq12-20020a056402298c00b004a8045255a4mr5214933edb.17.1675427520772;
        Fri, 03 Feb 2023 04:32:00 -0800 (PST)
Received: from [10.7.1.2] ([82.180.148.111])
        by smtp.gmail.com with ESMTPSA id r17-20020a05640251d100b0046c7c3755a7sm1068634edd.17.2023.02.03.04.31.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 04:32:00 -0800 (PST)
Message-ID: <f3ccd7ad-0bbb-be39-c989-765552e2c6af@linaro.org>
Date:   Fri, 3 Feb 2023 13:31:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [EXT] Re: [PATCH v2 1/1] tee: new ioctl to a register tee_shm
 from a dmabuf file descriptor
To:     Etienne Carriere <etienne.carriere@linaro.org>,
        Olivier Masse <olivier.masse@nxp.com>
Cc:     "sumit.garg@linaro.org" <sumit.garg@linaro.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "fredgc@google.com" <fredgc@google.com>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        "afd@ti.com" <afd@ti.com>,
        "op-tee@lists.trustedfirmware.org" <op-tee@lists.trustedfirmware.org>,
        "jens.wiklander@linaro.org" <jens.wiklander@linaro.org>,
        "joakim.bech@linaro.org" <joakim.bech@linaro.org>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        Cyrille Fleury <cyrille.fleury@nxp.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        =?UTF-8?Q?Cl=c3=a9ment_Faure?= <clement.faure@nxp.com>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>
References: <20220812143055.12938-1-olivier.masse@nxp.com>
 <20220812143055.12938-2-olivier.masse@nxp.com>
 <30534fadb8172088eddef46ae71d87c167cbf32e.camel@nxp.com>
 <CAFA6WYOMCswgHHxsgc9Hgi7rmTPaZDqce=BixvYoFTfL0bTFDQ@mail.gmail.com>
 <PA4PR04MB75204E8D2B959893A04D55F388D69@PA4PR04MB7520.eurprd04.prod.outlook.com>
 <CAFA6WYPGT8xZnB1idcxcHT1bvM=0kwFssBQbn063-qg=czM-ZQ@mail.gmail.com>
 <CAN5uoS8XgvAKVwKHx-uOe3hAa4Jrd5FJt6xNOG5s-simkRND9w@mail.gmail.com>
 <c86d1a46af6e076038b3f0c2dd68213ff1e8b254.camel@nxp.com>
 <CAN5uoS-A8EovbnxvcXqiYHcy95d-PTYUZvnNr3=kf84AGkG8Kw@mail.gmail.com>
Content-Language: en-US
From:   Jerome Forissier <jerome.forissier@linaro.org>
In-Reply-To: <CAN5uoS-A8EovbnxvcXqiYHcy95d-PTYUZvnNr3=kf84AGkG8Kw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2/3/23 12:37, Etienne Carriere wrote:
> Hell all,
> 
> +jerome f.
> 
> On Fri, 3 Feb 2023 at 12:01, Olivier Masse <olivier.masse@nxp.com> wrote:
>>
>> On jeu., 2023-02-02 at 10:58 +0100, Etienne Carriere wrote:
>>> Caution: EXT Email
>>>
>>> On Thu, 2 Feb 2023 at 09:35, Sumit Garg <sumit.garg@linaro.org>
>>> wrote:
>>>> Hi Cyrille,
>>>>
>>>> Please don't top post as it makes it harder to follow-up.
>>>>
>>>> On Thu, 2 Feb 2023 at 13:26, Cyrille Fleury <cyrille.fleury@nxp.com
>>>>> wrote:
>>>>> Hi Sumit, all
>>>>>
>>>>> Upstream OP-TEE should support registering a dmabuf since a
>>>>> while, given how widely dmabuf is used in Linux for passing
>>>>> buffers around between devices.
>>>>>
>>>>> Purpose of the new register_tee_shm ioctl is to allow OPTEE to
>>>>> use memory allocated from the exiting linux dma buffer. We don't
>>>>> need to have secure dma-heap up streamed.
>>>>>
>>>>> You mentioned secure dma-buffer, but secure dma-buffer is a dma-
>>>>> buffer, so the work to be done for secure or "regular" dma
>>>>> buffers by the register_tee_shm ioctl is 100% the same.
>>>>>
>>>>> The scope of this ioctl is limited to what existing upstream dma-
>>>>> buffers are:
>>>>>         -> sharing buffers for hardware (DMA) access across
>>>>> multiple device drivers and subsystems, and for synchronizing
>>>>> asynchronous hardware access.
>>>>>        -> It means continuous memory only.
>>>>>
>>>>> So if we reduce the scope of register tee_shm to exiting dma-
>>>>> buffer area, the current patch does the job.
>>>>
>>>> Do you have a corresponding real world use-case supported by
>>>> upstream
>>>> OP-TEE? AFAIK, the Secure Data Path (SDP) use-case is the one
>>>> supported in OP-TEE upstream but without secure dmabuf heap [1]
>>>> available, the new ioctl can't be exercised.
>>>>
>>>> [1] https://github.com/OP-TEE/optee_test/blob/master/host/xtest/sdp_basic.h#L15
>>>
>>> OP-TEE has some SDP test taht can exercice SDP: 'xtest
>>> regression_1014'.
>>> https://github.com/OP-TEE/optee_test/blob/3.20.0/host/xtest/regression_1000.c#L1256
>>>
>>> The test relies on old staged ION + local secure dmabuf heaps no more
>>> maintained, so this test is currently not functional.
>>> If we upgrade the test to mainline dmabuf alloc means, and apply the
>>> change discussed here, we should be able to regularly test SDP in
>>> OP-TEE project CI.
>>> The part to update is the userland allocation of the dmabuf:
>>> https://github.com/OP-TEE/optee_test/blob/3.20.0/host/xtest/sdp_basic.c#L91
>>>
>>>
>>
>> the test was already updated to support secure dma heap with Kernel
>> version 5.11 and higher. the userland allocation could be find here:
>> https://github.com/OP-TEE/optee_test/blob/3.20.0/host/xtest/sdp_basic.c#L153
>>
> 
> Oh, right. So fine, optee_test is ready for the new flavor of secure
> buffer fd's.
> 
> 
>> This upgrade need a Linux dma-buf patch:
>> https://lore.kernel.org/all/20220805154139.2qkqxwklufjpsfdx@000377403353/T/
> 
> @Jens, @Jerome, do we want to pick the 2 necessary Linux patches in
> our Linux kernel fork (github.com/linaro-swg/linux.git) to exercise
> SDP in our CI and be ready if dma-buf secure heaps (ref right above)
> is accepted and merged in mainline kernel?.

How would that help? I mean, when the kernel patches are merged and if
things break we can make the necessary adjustments in the optee_test app
or whatever, but in the meantime I don't see much point. I suppose the
people who are actively developing the patches do make sure it works with
OP-TEE ;-)

Regards,
-- 
Jerome
