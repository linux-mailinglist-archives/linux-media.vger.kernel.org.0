Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CEF84AA3F5
	for <lists+linux-media@lfdr.de>; Sat,  5 Feb 2022 00:06:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376312AbiBDXGC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Feb 2022 18:06:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229760AbiBDXGB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Feb 2022 18:06:01 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D3F5DF930B2
        for <linux-media@vger.kernel.org>; Fri,  4 Feb 2022 15:06:00 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id k18so13890317wrg.11
        for <linux-media@vger.kernel.org>; Fri, 04 Feb 2022 15:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=VE76ipq2N/4vlARbAOYMWYxZrYWj/oJNjGZNINk9m+Q=;
        b=mhQYKT99y1X8MwIoKkVsH0RKNylKifAR1kLUeAYC58nWaSsqzEV1LsoY/hNk4Q6LAI
         meB3j+s4sK1j1TYuXmFdvvrSiz0gAs21yuXMB5K+3DgsUNVOAFJ4ngLTd1w1Ogrychvi
         94o1GhKFeItnGqufk4rayFcYq4hKzl8dId7q950xciaKn4tPGu62QB+56jkROqBgAn8v
         6j5J9Ot9PkDg9FEgAk3eF5NnyMysHqBW3gkLPoGY9yFPTJ2o/gV0KUwmhjSUofsD5fll
         TxVPMI+8jBCcqvdNxIOkOHv/KZk/dBTgrp8368/Dwtun5zg4OKZUAfPSr3KXSAcEcWnA
         1V2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VE76ipq2N/4vlARbAOYMWYxZrYWj/oJNjGZNINk9m+Q=;
        b=40aS8Ru1hpV8Kcd099p+HpW7EOIdIeB6vCOjwbGB2J3H3WnWjtfl11YHjTCyOPMmj5
         umYGzg4BLdUrkn3IaKCc4GHPDLjGNSHMDhKLKKGZEURgq6jx+KndjSxqYVBgJ0L/1mDr
         FgDu69wpDnWXeBawregO0G3dW/rCBnlVP/5lA4Zxaxgbogmjh0Z+5lwHCv8eBXSmVmZC
         onbDx6Jua1JYEost90yhQhguhzwcG1IIvYtABhCZDkUu4y35YirNzwz20m45yjVBlBkW
         H0DkLyYHvlwtGPP1hxyrtDkiXHBqqJm0dJy/sxSz86JRW5RzhM/p5CjhCL/Uli+/ppwK
         Tagg==
X-Gm-Message-State: AOAM531TZ2Qg2LQ0YANsxDXJz2W7oOTeywXwYYE7So1xPpMtMkGZpmM3
        bl3gcpspLlPIqZViTQUR210=
X-Google-Smtp-Source: ABdhPJzwpphGjrpQhFj3lgdrNdkaTxKUQhaXH0GRKyiTPa0h4cVPjDhkW22eH9NOnZE5/bMdm09S6g==
X-Received: by 2002:a5d:5601:: with SMTP id l1mr878699wrv.455.1644015958683;
        Fri, 04 Feb 2022 15:05:58 -0800 (PST)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id q13sm2421351wrm.58.2022.02.04.15.05.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Feb 2022 15:05:58 -0800 (PST)
Message-ID: <fab9d907-680a-e0e7-420b-3af8d9701c8c@gmail.com>
Date:   Fri, 4 Feb 2022 23:05:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH RESEND] media: i2c: Fix pixel array positions in ov8865
Content-Language: en-US
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
References: <20220203213344.863433-1-djrscally@gmail.com>
 <YfzsGpgmEh12OJNm@aptenodytes>
From:   Daniel Scally <djrscally@gmail.com>
In-Reply-To: <YfzsGpgmEh12OJNm@aptenodytes>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul

On 04/02/2022 09:04, Paul Kocialkowski wrote:
> Hi Daniel,
>
> On Thu 03 Feb 22, 21:33, Daniel Scally wrote:
>> The ov8865's datasheet gives the pixel array as 3296x2528, and the
>> active portion as the centre 3264x2448. This makes for a top offset
>> of 40 and a left offset of 16, not 32 and 80.
> Yep that makes better sense to me!
>
> Could you also invert the lines so we have left first, matching
> width being defined first in other instances?


Sure thing - I'll post another shortly

>
> Thanks!
>
> Paul
>
>> Fixes: acd25e220921 ("media: i2c: Add .get_selection() support to ov8865")
>>
>> Reported-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>> ---
>>
>> Apologies; sent to the wrong list initially
>>
>>  drivers/media/i2c/ov8865.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
>> index d9d016cfa9ac..53e21ae8e886 100644
>> --- a/drivers/media/i2c/ov8865.c
>> +++ b/drivers/media/i2c/ov8865.c
>> @@ -457,8 +457,8 @@
>>  
>>  #define OV8865_NATIVE_WIDTH			3296
>>  #define OV8865_NATIVE_HEIGHT			2528
>> -#define OV8865_ACTIVE_START_TOP			32
>> -#define OV8865_ACTIVE_START_LEFT		80
>> +#define OV8865_ACTIVE_START_TOP			40
>> +#define OV8865_ACTIVE_START_LEFT		16
>>  #define OV8865_ACTIVE_WIDTH			3264
>>  #define OV8865_ACTIVE_HEIGHT			2448
>>  
>> -- 
>> 2.25.1
>>
