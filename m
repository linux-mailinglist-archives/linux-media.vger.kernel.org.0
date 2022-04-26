Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0A135101F8
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 17:34:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352373AbiDZPhj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 11:37:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348287AbiDZPhh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 11:37:37 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA2C315978E
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 08:34:29 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id 79so20399159iou.7
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 08:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=OpyzjXJnk6eqe+VGPz2+jQbpqiOOVBobzQ0e/23Nzu0=;
        b=T9Fq/3c78FVVT1NuUKe/2UR+75umKo8M9qSNKdM6PZeYY2RzIiBKLLuj2Rxw/EuMnZ
         OCPMdrkPC3guaLiEAadVHyqUs69hMy4WbUxCbp1ZGSIxSmCA+p4kwhK/yZDPFBRtHsTr
         ptHR3sN82ZQ5yC59YnCoAp7jpJwv1VJHjjvt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OpyzjXJnk6eqe+VGPz2+jQbpqiOOVBobzQ0e/23Nzu0=;
        b=5Qz7hbYQ/PRQTJrd4VkHetzdA9WPP/C9Sc0RGIvsz77N8s/gEkc5iQlZaQFgh9giHp
         A8ym6bP3LcT4l7I7sJec+mJkcfwbYokcBNTKPSp/Jvj/Jzq6OMJMJ7esepxhTFa4+otk
         4747ukFbBIQnpwmuzMk9jFMsc+7Cjrqukio4WGSUc1CpxiXUv4D/MKqvcRTYXZMvi8WQ
         Cwbk3l6FytmDDkKYx6K6TOpcdq0YMipBN9Zl+Nj4MJNbE3NNe2MsOtjZS7JsHycLerfb
         vZ7ltDus8FKNs1OymA4piNYJdD6Ht1sTsYokVSmE5WJ5B2Rw3z3wYerOULvX8v5VLiWu
         LpMg==
X-Gm-Message-State: AOAM530+fk+rdymNfXjDS2uD907ejBPQhIzsJIyDOfTwoV/pr17w4nNM
        9AwLTCyohEwj1paY4ueowz7t4A==
X-Google-Smtp-Source: ABdhPJw9h4gM3l6CtupC/f3zfezm+mc5VNR/F8cvn/HttlJlzk/VDKwV16ujjCclml42Zq7QEbODsQ==
X-Received: by 2002:a05:6e02:1d04:b0:2cc:4c42:9b99 with SMTP id i4-20020a056e021d0400b002cc4c429b99mr8843144ila.168.1650987269319;
        Tue, 26 Apr 2022 08:34:29 -0700 (PDT)
Received: from [192.168.1.128] ([71.205.29.0])
        by smtp.gmail.com with ESMTPSA id x9-20020a6bda09000000b006545a38b1acsm9416979iob.47.2022.04.26.08.34.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Apr 2022 08:34:28 -0700 (PDT)
Subject: Re: [PATCH v6] media: vimc: get pixformat info from v4l2_format_info
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        "Carlos E. C. Barbosa" <climacobarbosacee@gmail.com>,
        Helen Koike <helen.koike@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20220311111657.56038-1-barbosa.carlos.ec@gmail.com>
 <3665efc7-0b47-1adf-5639-93229af04e95@xs4all.nl>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <07f415c4-addb-73e8-6604-60e7eeb63abf@linuxfoundation.org>
Date:   Tue, 26 Apr 2022 09:34:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <3665efc7-0b47-1adf-5639-93229af04e95@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Carlos,

On 4/26/22 3:02 AM, Hans Verkuil wrote:
> Hi Carlos,
> 
> On 11/03/2022 12:16, Carlos E. C. Barbosa wrote:
>> Removes overlapping structures
>>
>> Repurposes vimc_pix_map to strictly mapping formats, making it
>> a local structure.
>>
>> Replaces all of its functions and remaps the calls to the matching
>> v4l2_format_info.
>>
>> ---
>>
>> Changes in v6:
>> - replace all vimc_pix_map returning functions with v4l2_format_info
>>    ones (as previously suggested by Dafna)
>> - adds is_on_table functions to verify support (to be used only when
>>    no other info is required)
>>
>> Changes in v5:
>> - .bayer member was removed and replaced by v4l2 functions calls
>>
>> Changes in v4:
>> - Unused variables were removed
>>
>> Changes in v3:
>> - Change declaration order of variables and some minor style changes
>>
>> Changes in v2:
>> - Const qualifiers are not removed
>> - Bayer flag is kept
>> - Unnecessary changes are not made anymore
>>
>> v4l2-compliance -m /dev/media0 output:
>> https://pastebin.com/BRjMP3wP
>>
>> Signed-off-by: Carlos E. C. Barbosa <barbosa.carlos.ec@gmail.com>
> 
> Your Signed-off-by should go before the '---'.
> 
> Also, it doesn't match your 'From' email.
> 
> Regards,
> 
> 	Hans
> 
>
Sorry for the delay on this. In addition to Han's comments,
please provide more information in your commit log on the
changes and how they help in more detail. Are these changes
fix any problems you may have found.

thanks,
-- Shuah
