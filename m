Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F333E70188D
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 19:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232006AbjEMRk6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 13:40:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230007AbjEMRkz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 13:40:55 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A2B6A3
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 10:40:52 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-965cc5170bdso1692852566b.2
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 10:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683999651; x=1686591651;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cJkS9slJmklM7XunVc+vQ7U7u2csweUih60apIjI7LE=;
        b=MezGkVdEt1HHBAeGnPtemGeswnbH1j75IsNQQ2Npnf/yotIKedgByWgQlp7ZBr3aHO
         WFH7FGIG6rUXkY/xgJQH8NZeCi6uPZRQhv/Xm2bVg45n2BXW6BbfJvsYO+xws6lNpir9
         CTLr/qLzI2xirw1VZTI6+lYJL+YSwvWkSHC+/Dje3TBReDAIHhCAPbDEkljTlrNO8JPX
         69RvbnsLEr8e0EjD0DVoIueHWhIgjecmmAP++AR9GYeIvNyD0cyEe0gbnJkvAvYQIh4D
         v0uBbqU4AZxepYRnyi2bHeqH95+NRSZ8xcRLlp+JVBYvrje6us8vn1QnNu9HSyHwQmGs
         XkhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683999651; x=1686591651;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cJkS9slJmklM7XunVc+vQ7U7u2csweUih60apIjI7LE=;
        b=AefGs2F/iCGoCY89P0coUezJJSMgYV1/3au4llfFnIZeYbBByXR60InQGO5X9oEgqZ
         YQyCwiyeawXgjjHWEyely7TWIkMx7dHyYuDp9btwiiRwkowyWLn/MZcdMKwMzCBOPOUE
         WAUmLGWM8n+6ZpL4tvN0hBeqVoOUNrEg6RVH51dXn5vQdr3kyufBIBN6IrrVpZb6FOol
         5ynLWzNiOGYz/6e5CbOR4zuNkcc+mM2i3uyhjteEjZjVC6M0jXXNTzEoLA0eXJVn0Cn2
         BhUwQWi64vWn7Gvc9OEIsyj0nj87+xbf53FOW4WQDOejRvsdNxQc5fsJyYSUYxbDxS6R
         cuQg==
X-Gm-Message-State: AC+VfDwqBAlyHQ9u9wCoO/md82imeB3fZQmUEsqWSKbajN3eHEQLol1X
        /Eedqf2VB3/a7B0dGugcYxlnLQe4XsxGP4uzoXropA==
X-Google-Smtp-Source: ACHHUZ7vVU6PDv1p8Zrs8ou3CnykHHpDsjSPe3H+1wK9/4gEap7UdmtYnyBeJSVv7QviTVEEXg5A2g==
X-Received: by 2002:a17:907:8a14:b0:94f:6218:191f with SMTP id sc20-20020a1709078a1400b0094f6218191fmr28232228ejc.52.1683999650744;
        Sat, 13 May 2023 10:40:50 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bc2d:23f8:43c2:2aed? ([2a02:810d:15c0:828:bc2d:23f8:43c2:2aed])
        by smtp.gmail.com with ESMTPSA id y18-20020a170906525200b0094f7acbafe0sm7119764ejm.177.2023.05.13.10.40.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 May 2023 10:40:50 -0700 (PDT)
Message-ID: <a4917239-c0f3-11eb-5ac5-c8d6599a076e@linaro.org>
Date:   Sat, 13 May 2023 19:40:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Patch v7] dt-bindings: media: s5p-mfc: convert bindings to
 json-schema
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        'Aakarsh Jain' <aakarsh.jain@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc:     m.szyprowski@samsung.com, andrzej.hajda@intel.com,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        ezequiel@vanguardiasur.com.ar, jernej.skrabec@gmail.com,
        benjamin.gaignard@collabora.com, krzysztof.kozlowski+dt@linaro.org,
        stanimir.varbanov@linaro.org, dillon.minfei@gmail.com,
        david.plowman@raspberrypi.com, mark.rutland@arm.com,
        robh+dt@kernel.org, krzk+dt@kernel.org, andi@etezian.org,
        aswani.reddy@samsung.com, pankaj.dubey@samsung.com
References: <CGME20230328114738epcas5p475b8fa1d1e86bbb86d004afe365e0259@epcas5p4.samsung.com>
 <20230328114729.61436-1-aakarsh.jain@samsung.com>
 <ad96f28a-7b2d-a58b-50fb-648063ed0b18@linaro.org>
 <000001d983eb$e0692280$a13b6780$@samsung.com>
 <525d7b15-ffbd-22d9-7ad5-0a0ff7290620@linaro.org>
 <000101d985a9$79de0160$6d9a0420$@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <000101d985a9$79de0160$6d9a0420$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13/05/2023 16:44, Alim Akhtar wrote:
> Hi Krzysztof,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Saturday, May 13, 2023 3:03 PM
>> To: Aakarsh Jain <aakarsh.jain@samsung.com>; linux-arm-
>> kernel@lists.infradead.org; linux-media@vger.kernel.org; linux-
>> kernel@vger.kernel.org; devicetree@vger.kernel.org
>> Cc: m.szyprowski@samsung.com; andrzej.hajda@intel.com;
>> mchehab@kernel.org; hverkuil-cisco@xs4all.nl;
>> ezequiel@vanguardiasur.com.ar; jernej.skrabec@gmail.com;
>> benjamin.gaignard@collabora.com; krzysztof.kozlowski+dt@linaro.org;
>> stanimir.varbanov@linaro.org; dillon.minfei@gmail.com;
>> david.plowman@raspberrypi.com; mark.rutland@arm.com;
>> robh+dt@kernel.org; krzk+dt@kernel.org; andi@etezian.org;
>> alim.akhtar@samsung.com; aswani.reddy@samsung.com;
>> pankaj.dubey@samsung.com
>> Subject: Re: [Patch v7] dt-bindings: media: s5p-mfc: convert bindings to json-
>> schema
>>
>> On 11/05/2023 11:34, Aakarsh Jain wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Krzysztof Kozlowski [mailto:krzysztof.kozlowski@linaro.org]
>>>> Sent: 28 March 2023 20:06
>>>> To: Aakarsh Jain <aakarsh.jain@samsung.com>; linux-arm-
>>>> kernel@lists.infradead.org; linux-media@vger.kernel.org; linux-
>>>> kernel@vger.kernel.org; devicetree@vger.kernel.org
>>>> Cc: m.szyprowski@samsung.com; andrzej.hajda@intel.com;
>>>> mchehab@kernel.org; hverkuil-cisco@xs4all.nl;
>>>> ezequiel@vanguardiasur.com.ar; jernej.skrabec@gmail.com;
>>>> benjamin.gaignard@collabora.com; krzysztof.kozlowski+dt@linaro.org;
>>>> stanimir.varbanov@linaro.org; dillon.minfei@gmail.com;
>>>> david.plowman@raspberrypi.com; mark.rutland@arm.com;
>>>> robh+dt@kernel.org; krzk+dt@kernel.org; andi@etezian.org;
>>>> alim.akhtar@samsung.com; aswani.reddy@samsung.com;
>>>> pankaj.dubey@samsung.com
>>>> Subject: Re: [Patch v7] dt-bindings: media: s5p-mfc: convert bindings
>>>> to json- schema
>>>>
>>>> On 28/03/2023 13:47, Aakarsh Jain wrote:
>>>>> Convert s5p-mfc bindings to DT schema format using json-schema.
>>>>>
>>>>> Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
>>>>> ---
>>>>> changes since v6:
>>>>
>>>> This is a friendly reminder during the review process.
>>>>
>>>> It looks like you received a tag and forgot to add it.
>>>>
>>>> If you do not know the process, here is a short explanation:
>>>> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
>>>> versions. However, there's no need to repost patches *only* to add
>>>> the tags. The upstream maintainer will do that for acks received on
>>>> the version they apply.
>>>>
>>>> https://protect2.fireeye.com/v1/url?k=03601d03-62eb0848-0361964c-
>>>> 74fe485fb305-ca0023b5279dd925&q=1&e=9490b51d-9547-4566-bb76-
>>>>
>> 8c1401745ae1&u=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv5.17%2Fs
>>>> ource%2FDocumentation%2Fprocess%2Fsubmitting-patches.rst%23L540
>>>>
>>>> If a tag was not added on purpose, please state why and what changed.
>>>>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>
>>>
>>> Hi Krzysztof,
>>>
>>> I don’t see this patch in linux-next. It's been more than a month now.
>>> Please let me know if any other changes required.
>>
>> I already provided you review tag.
> Thanks for your review.
> The question was more on, if you will pick up this patch via your tree or this will go via Rob's or Media tree.
> I will prefer if this goes via your tree.

Generic recommendation is that all device-related bindings go via their
subsystem, so in this case via media tree. I see in patchwork it is
still in new state, so maybe was forgotten. OK, let me grab it.

Best regards,
Krzysztof

