Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98BEB508D15
	for <lists+linux-media@lfdr.de>; Wed, 20 Apr 2022 18:20:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380497AbiDTQWp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Apr 2022 12:22:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380510AbiDTQWm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Apr 2022 12:22:42 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32213387A8;
        Wed, 20 Apr 2022 09:19:56 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id l9-20020a056830268900b006054381dd35so1421271otu.4;
        Wed, 20 Apr 2022 09:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=BcREumxihady40kAsqXjtYOYhBYxsHR0/lhVa2XISrI=;
        b=Fall6bVNmUjak3/c9cNqoP0Ds+o17tFk78uG2u9+e+N7i5hwjGhKvi3LD1u+kbIVps
         O7o3QYhlkyRFiWhWVoB7Eh284hQ/lONEmeEayNUJrcV++2XJMp9WxhBLfMCr/KEVDQZL
         sehAgQzMTII74ZHVTJZ5njja/TwebgN9mibynewvKPBjRvhNtNBc66GEAO8WHKHKsEs4
         g/TjB1klkqXxnQA3/KGs2cCmc3T96tArH9xNYK50MSDbmZQbYA8zIDcrMvizBLOcxmu7
         n+Ten2YOaan5xqjAXU4ZGTJUAcpCmT93qLc8YvNc+E7zrDCBthJW95WVm1uERT1b17lW
         3Csg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=BcREumxihady40kAsqXjtYOYhBYxsHR0/lhVa2XISrI=;
        b=Lp87sRQIDWqnvjs+spRTjVlKfgjGOBJPP0LdHDp2nRLGDJVmA6IK4kwct55QK3scsc
         qq+A7Qn9IbkVYbw/O3s+8fhiHwX/uNGCh45B9Dc6U54dBtI3Qv+RXJAdh97ZQEZCwT2H
         vDKhNWXpFSZVxDKvf5Tb3sd9qo23nxlLjwXOO16KR9GPiSG4KvmcgM5TrkdC1tM45ff6
         JUvefR8t0zPISxGI3mZn2bgAq8k6l0stkyyY0iJX/rOSDWDkYqBrHS/o84755Zw4helc
         kcA4VTa74nhp7HDN18dx39vsxn9Pmpqvck+MzEj3jiiSIl6dnyh0whMvqAAYxFsev91X
         QO6w==
X-Gm-Message-State: AOAM533IGpQqW/LJfl7hdAq/ReyeVYu0xMq00QPkS29xLIffM6Eb3QNM
        Vo/35Sh0mtWTgAweHYw0mXY=
X-Google-Smtp-Source: ABdhPJxVm6wBBiE1m0EVm4wdnJN/qMH3N+ahoOhWU3U68EX210f8sRmon/EJSPiuHhCUdEG4XtPBoA==
X-Received: by 2002:a9d:734a:0:b0:605:4d25:2e67 with SMTP id l10-20020a9d734a000000b006054d252e67mr5462918otk.258.1650471595579;
        Wed, 20 Apr 2022 09:19:55 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z2-20020a05683020c200b00604cd00f91esm5694700otq.44.2022.04.20.09.19.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Apr 2022 09:19:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <57bb64db-9273-0e52-cf6d-0c7ff172ddde@roeck-us.net>
Date:   Wed, 20 Apr 2022 09:19:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To:     Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
 <76789333-bb0b-fcc2-6ba9-ab01c9aab62a@roeck-us.net>
 <YmAXd5F2Rm/VDIb5@pendragon.ideasonboard.com>
 <8b8aa915-d08c-9cc6-fc01-2f062a79b078@foss.st.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 2/5] media: v4l: ctrls: Add a control for temperature
In-Reply-To: <8b8aa915-d08c-9cc6-fc01-2f062a79b078@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 4/20/22 08:19, Benjamin Mugnier wrote:
[ ... ]
>>
>> It's the two most common use cases for imaging sensor temperature
>> measurements that I know of. My question to Benjamin is if he has the
>> same and/or other use cases.
>>
> 
> Just like you said in a previous mail. This temperature sensor can be used to implement a retroactive loop from the host according to its value, such as noise correction for instance.
> We don't have anything in the Linux user space that implements this yet, this was in anticipation.
> So dropping it is fine, I will come back to it if need be ;)

When you implement this in userspace, you might want to consider situations
where the temperature is _not_ reported via media controls (which might
at least in theory happen if the temperature sensor is not part of the
v4l device), or for existing drivers with hwmon support
(drivers/media/i2c/video-i2c.c comes into mind).

Guenter
