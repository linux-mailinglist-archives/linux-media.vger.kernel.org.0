Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73C135089E9
	for <lists+linux-media@lfdr.de>; Wed, 20 Apr 2022 15:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379203AbiDTOBW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Apr 2022 10:01:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358948AbiDTOBV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Apr 2022 10:01:21 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6166B43497;
        Wed, 20 Apr 2022 06:58:35 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id t15so2132672oie.1;
        Wed, 20 Apr 2022 06:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3J/deNjz4TV2pRWGKN2ncjOCziukap0hi11YSuHGnJI=;
        b=EoRoQkXvtlz8PQiE1NbpGxOwgvcd1M5fYYx408tm93UBHzL2LaA9Hy45+sn0XAVjwA
         kmLNs8pn2VJjjv1F93FxMBWqYfSvwMFIYzo7obKa2OsrEljGM1jV7wiHaQkXk9Jz00Cu
         2nPfo1zPPF84IlFjRcqk927D0ACwYD0aIRrtlRSZbpdn4g8qrZdAh2GyQaMiBaDzuLWi
         qZjW+tk4LWwSSorSJVCgSIp7GPhKrhMwWKFKcrrwTexlQSI14VeAtKfOhTo0s/a8Uqvw
         bxM2BrO4EvfFhCuPc9F76DBtFGDMqyeiNLvRk8ZG11FSvcbs1Y3Luo6Us6Enjl7UPvvR
         mO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3J/deNjz4TV2pRWGKN2ncjOCziukap0hi11YSuHGnJI=;
        b=CCGX8mFUqH9Uht4Rm1xSOAXC9IV8HOfihC9PDA479Y1N5uBRLPTh2w7BLZGI7RMtKa
         bN5czqQTPQ0QmCqmTcSnzCU9WmvLvE4Y0dGhNWIttu2ifZ55efdA/O3mqcC8jOulcwz/
         X0t0RP3EU2GbIqMiBZFj4tcqlg2eGL5kSj7xwdSS3FRrm+Dfx6VLWaHfg48u676kZt6+
         elWonBgS8nr1MNtZaRmnFATJXIbWbb22LdMbQiOqKLxaoY7XmFJsmmB+31+td3/uxL0e
         kJAFOWUj5q9sFmA33ruW+ekCHJmjrwTqT3u0VB8j+EW1FHjESHV8AB7mGcOLh/y31O33
         lQag==
X-Gm-Message-State: AOAM530f4RQ6KtkF3LLZY0G9NHjR8jJr2AHjRyX215oErvWblTeG8kif
        6iTbQkWy/5eClrEf9kLwOLMueopvVLg=
X-Google-Smtp-Source: ABdhPJzDQ7EpaTzk5AAuCj1yB1IKJZodbDSg3nKIHHZELsqOeLJyxu+OiWW2NhoxCMKnvZrW4Bh59w==
X-Received: by 2002:a05:6808:1b28:b0:2da:51e0:d10a with SMTP id bx40-20020a0568081b2800b002da51e0d10amr1831530oib.186.1650463114570;
        Wed, 20 Apr 2022 06:58:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r81-20020acaf354000000b002ecf46e8016sm6252312oih.51.2022.04.20.06.58.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Apr 2022 06:58:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <76789333-bb0b-fcc2-6ba9-ab01c9aab62a@roeck-us.net>
Date:   Wed, 20 Apr 2022 06:58:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/5] media: v4l: ctrls: Add a control for temperature
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        linux-media@vger.kernel.org, alain.volmat@foss.st.com,
        hugues.fruchet@foss.st.com, sylvain.petinot@foss.st.com,
        dave.stevenson@raspberrypi.com, sakari.ailus@linux.intel.com,
        kieran.bingham@ideasonboard.com, linux-hwmon@vger.kernel.org,
        Ricardo Ribalda <ribalda@chromium.org>
References: <20220415111845.27130-1-benjamin.mugnier@foss.st.com>
 <20220415111845.27130-3-benjamin.mugnier@foss.st.com>
 <d4c868d5ef05f338bdc2237d9b9304077d268c8b.camel@ndufresne.ca>
 <3a4fad80-b16a-3780-a0f7-41dd6c80689e@roeck-us.net>
 <Yl8jF1KLzP6YO6t+@pendragon.ideasonboard.com>
 <1c700e5b-5bf2-f0eb-78f3-12290fd88234@roeck-us.net>
 <dec71c79-3141-8dcf-6d37-8495f4b7c7e9@foss.st.com>
 <YmAI3QVSPMq3mR7E@pendragon.ideasonboard.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <YmAI3QVSPMq3mR7E@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 4/20/22 06:21, Laurent Pinchart wrote:
> Hi Benjamin,
> 
> On Wed, Apr 20, 2022 at 03:01:18PM +0200, Benjamin Mugnier wrote:
>> On 20/04/2022 00:04, Guenter Roeck wrote:
>>> On 4/19/22 14:01, Laurent Pinchart wrote:
>>>> On Tue, Apr 19, 2022 at 12:28:06PM -0700, Guenter Roeck wrote:
>>>>> On 4/19/22 11:24, Nicolas Dufresne wrote:
>>>>>> Hi,
>>>>>>
>>>>>> adding linux-hwmon in CC for a wider feedback.
>>>>>>
>>>>>> Le vendredi 15 avril 2022 à 13:18 +0200, Benjamin Mugnier a écrit :
>>>>>>> Add V4L2_CID_TEMPERATURE control to get temperature from sensor in
>>>>>>> celsius as a volatile and read-only control, and its documentation.
>>>>>>> Useful to monitor thermals from v4l controls for sensors that support
>>>>>>> this.
>>>>>>
>>>>>> Any justification to expose a temperature sensor outside of the dedicated kernel
>>>>>> API hwmon ? I know if may makes it harder to use, as the sensor isn't bound to
>>>>>> the camera driver, and also the sensor may not work if the camera is not
>>>>>> streaming. But in the end, the API in hwmon does not look that complex, and is
>>>>>> perhaps more precise ?
>>
>> This sensor is able to read the temperature even if not streaming.
>>
>>>>>>
>>>>>> All in all, I think we need a strong justification to implement a custom
>>>>>> thermometer interface, something described here and documented with care to
>>>>>> prevent abuse. I would also see opinion from folks outside of the linux-media,
>>>>>> hence why I have CCed hwmon mailing list.
>>>>>
>>>>> All I can say is that this seems to be odd and a bit outside the scope of
>>>>> v4l2. I would have expected the vgxy61 driver to register a hwmon device
>>>>> instead.
>>>>
>>>> I don't have a definitive opinion yet, but as Nicolas raised the issue
>>>> by pushing towards hwmon, I'll offer counter-arguments for the sake of
>>>> it :-)
>>>>
>>>> The temperature sensor in the imaging sensor is used to measure the die
>>>> temperature, in order to tune the noise and spectral response model of
>>>> the imaging sensor. It's thus not a generic-purpose temperature sensor.
>>>> If the feature were to be exposed through hwmon, userspace would need to
>>>> associate an hwmon device to the imaging sensor V4L2 subdev (we have a
>>>> way to do so through the MC API, it doesn't support hwmon at this point,
>>>> but I suppose it could be added). There are also various constraints
>>>> that tie the temperature reading to the imaging side, it could be that
>>>> the temperature would only be readable while capturing frames. That's
>>>> probably possible to handle too but returning an error from the
>>>> temperature read.
>>>>
>>>> Code-wise, both the driver and userspace would be more complex, for very
>>>> little practical gain (I don't dispute a theorical gain).
>>>>
>>>
>>> All I can say is - not my subsystem, not my call to make. If you say this
>>> is special and is better handled in V4L2, I'll take you by your word.
>>>
>>> Guenter
>>>
>>
>> I'll happily implement whatever conclusion we make here.
>>
>> I could also drop this control for the first iteration of the driver,
>> and come back later once a consensus is reached.
> 
> That would work too. By the way, what are your use cases for the
> temperature sensor ? Have you added the control for the sake of
> completeness, or do you have use cases ?
> 

You provided a use case above. Are you saying you made it up ?
Still fine with me, your call, just wondering.

Guenter
