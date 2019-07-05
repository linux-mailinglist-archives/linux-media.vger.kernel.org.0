Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98B99605C0
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2019 14:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728302AbfGEMLi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jul 2019 08:11:38 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35044 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726505AbfGEMLi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Jul 2019 08:11:38 -0400
Received: by mail-pl1-f195.google.com with SMTP id w24so4533710plp.2
        for <linux-media@vger.kernel.org>; Fri, 05 Jul 2019 05:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fGg5cmQPJco2qB5UDLvFiWfaIFjGf3sdq62tG9ZVImE=;
        b=ZY6pJFD4rbKle44KkGiMoNj9hXi7Xp+EL6hAnQSSJhI4vj6R/BOzRackxznm0/aFcv
         QFV3qyiwYaTZc9ME3Si/B5tq4Y3u7/lcrSxK4RgaaYbcBNxgQjusG4U87YZYSX4+yjRB
         HODp5hO69Tm9qMuW+lCUF5+eNhfTRTbFkBxf6+lh1yb5JnTwvMDrtXrPWzb15JTKmp12
         QgIsxqLWyUEveXJq2Iyk2zXHQbyPUld9+MRTBl9TJX8uJTYq+dlP6K4v3DFYY6OVzzfy
         nnaQFsNGZJ8ERRO0BQ2e1s1K5w5RVN+nVn7Vfo4yjlmZthI+6En/Vz/WB1sQCzc4F94h
         Te+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fGg5cmQPJco2qB5UDLvFiWfaIFjGf3sdq62tG9ZVImE=;
        b=NyEvVzLMiImAp7ka7lDSJs5OVL3iK1zLsA4HoHFW4sSEtIoH4plXpvn2V1o4f5iZ6P
         ABkiZhlQBK/JvgztIco7kwWOPij+eQdcH0oE2bFpEFZDnXI4z79sshhlRkoEDoTx3Jnb
         UfODJUw34n0ZheWaZXzPP1M73bb8uw4S8Nbfu02qBTobEC+SROOUFzUxWA5feynD5Txi
         IG+Cg8uRQOH54M5a3UBTyaK/eT8l5KwnYGIXydx0kg1Mtlpc0h0yXSR9kPHhDI2AvJ9a
         QHx7xqrZtRjX9xgev8hoedGt+Kv+s39pqApZyzmsxNJFFnkWg1pRNhe6hoDtoVANFklC
         EM0A==
X-Gm-Message-State: APjAAAX05VueZVpmP+25DeUUG5iSo6y5XqHd1ixdoBtAPerb1oXFR9jN
        n14rWUzarLM9SX5DNaRGb8+MOGME
X-Google-Smtp-Source: APXvYqzsy1r0hgrfbmfcd/68Z1oyOkJvepWGSLGX0UsVBJP9RB1teHvNd3rCpUvJh7rDk5p2+nTgag==
X-Received: by 2002:a17:902:b603:: with SMTP id b3mr5302378pls.9.1562328697756;
        Fri, 05 Jul 2019 05:11:37 -0700 (PDT)
Received: from [10.0.2.15] ([122.163.64.117])
        by smtp.gmail.com with ESMTPSA id o16sm24507895pgi.36.2019.07.05.05.11.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jul 2019 05:11:37 -0700 (PDT)
Subject: Re: [PATCH 1/2] staging: media: sunxi: Change return type of
 cedrus_find_format()
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     maxime.ripard@bootlin.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org
References: <20190703081317.22795-1-nishkadg.linux@gmail.com>
 <20190705102603.GA1645@aptenodytes>
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
Message-ID: <e177ab7b-2e1d-536c-6b30-3fdb9ae0ff31@gmail.com>
Date:   Fri, 5 Jul 2019 16:41:26 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190705102603.GA1645@aptenodytes>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/07/19 3:56 PM, Paul Kocialkowski wrote:
> Hi,
> 
> On Wed 03 Jul 19, 13:43, Nishka Dasgupta wrote:
>> Change return type of cedrus_find_format to bool as it is only called
>> once, by a function whose return value is bool, and the return value of
>> cedrus_find_format is returned as-is at the call-site.
>> Issue found with Coccinelle.
> 
> The purpose of this function (although definitely under-used at this point),
> was to return the pointer to the element structure, not to indicate whether
> the format format is part of the list or not.
> 
> In spite of that, this change reduces the use case for the function, so I do
> not think it is beneficial, sorry.

Okay, thank you for the clarification.

Nishka

> Cheers,
> 
> Paul
> 
>> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
>> ---
>>   drivers/staging/media/sunxi/cedrus/cedrus_video.c | 11 ++++-------
>>   1 file changed, 4 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
>> index 9673874ece10..0ec31b9e0aea 100644
>> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
>> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
>> @@ -55,8 +55,8 @@ static inline struct cedrus_ctx *cedrus_file2ctx(struct file *file)
>>   	return container_of(file->private_data, struct cedrus_ctx, fh);
>>   }
>>   
>> -static struct cedrus_format *cedrus_find_format(u32 pixelformat, u32 directions,
>> -						unsigned int capabilities)
>> +static bool cedrus_find_format(u32 pixelformat, u32 directions,
>> +			       unsigned int capabilities)
>>   {
>>   	struct cedrus_format *fmt;
>>   	unsigned int i;
>> @@ -70,13 +70,10 @@ static struct cedrus_format *cedrus_find_format(u32 pixelformat, u32 directions,
>>   
>>   		if (fmt->pixelformat == pixelformat &&
>>   		    (fmt->directions & directions) != 0)
>> -			break;
>> +			return true;
>>   	}
>>   
>> -	if (i == CEDRUS_FORMATS_COUNT)
>> -		return NULL;
>> -
>> -	return &cedrus_formats[i];
>> +	return false;
>>   }
>>   
>>   static bool cedrus_check_format(u32 pixelformat, u32 directions,
>> -- 
>> 2.19.1
>>
> 

