Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26969605C5
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2019 14:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728152AbfGEMNT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jul 2019 08:13:19 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:34988 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726505AbfGEMNT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Jul 2019 08:13:19 -0400
Received: by mail-pg1-f196.google.com with SMTP id s27so4248190pgl.2
        for <linux-media@vger.kernel.org>; Fri, 05 Jul 2019 05:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jePOyDB+/BJqai65o/nniy/GmigQg37Te1D63738p1E=;
        b=JtlJfhOjR1la3EpAWrJCUcNV4oHwfD9FQubM6udvIOnuMNZ5uQpom0RPxotusXmHqm
         /7W3+ZerruZFxjPXXdsH5w5RvqPd3b1xaSL9W7Lf3ym0WRX2nM5yrjKiA28bEd6YUGrt
         NU3sZVP4+earPTO1vg2PCvVapr+lWxiawwFGRwzeVtOGW8cH+bKd46geULijeR+owSD7
         2fINXPA8ilMbwNs4q9tygYZTG8azh5u9Sz8/9npjs3I7DHcNJM6iv5GDXQtnBuzoj/PI
         5onvYs9savWSAkBlHPYoLmlgi5oxybS1sZIyOeKTbqUxyMT4MEjpUyaq9Q/Om6u60JZc
         3yBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jePOyDB+/BJqai65o/nniy/GmigQg37Te1D63738p1E=;
        b=UZT0l6R3J7ar9D05h/4eBIKeHwmf1Vv7k17cuhnvk2EB3htUq5J7lzyH3dDBoQ3d6h
         qE9MZOUjlvzusiQmscs9lWROCgrptqRXX8Gm2OeinkDem6fTv3Td0YQT3tTbM1q0JVbN
         mPACY/nLlukFvJigmZwFXkDI3whUgZmdw58EF5MU8587cqbiMDmc/jfMetMbo2AJWA9z
         i9frt+pWdgJP/1kwaCD/6/PJGI4vBuBUfKHF9vwQMn5wzRB9qf/LtE/C2LQnrwh23Amr
         w7ujEWc7C6kPEniaTzFg7VEWKWW/+o/8x1hafo8St9YQDJZ2yk9ItqCv3ATEbjDQyTlG
         kW5Q==
X-Gm-Message-State: APjAAAUYM9wthHZHQSFnYTFnDkKgEW9xcVxAEkX0JtWWi3S9Hm7TS4Sl
        fCzgySeC+qOPmDSBM+u4oc5bT5SC
X-Google-Smtp-Source: APXvYqy3i++VbGx86LnHqXfWM8gjGJRZBK1+vkUqx5LVHHUpUywmvMQXDo6JvqDrcbGPIIbM2HQ5uw==
X-Received: by 2002:a63:b904:: with SMTP id z4mr5103509pge.388.1562328799173;
        Fri, 05 Jul 2019 05:13:19 -0700 (PDT)
Received: from [10.0.2.15] ([122.163.64.117])
        by smtp.gmail.com with ESMTPSA id m9sm5693445pgr.24.2019.07.05.05.13.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jul 2019 05:13:18 -0700 (PDT)
Subject: Re: [PATCH 2/2] staging: media: sunxi: Replace function
 cedrus_check_format()
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     maxime.ripard@bootlin.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org
References: <20190703081317.22795-1-nishkadg.linux@gmail.com>
 <20190703081317.22795-2-nishkadg.linux@gmail.com>
 <20190705102650.GB1645@aptenodytes>
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
Message-ID: <1c5bd5a6-757e-2bce-6adf-6dafbf6956a6@gmail.com>
Date:   Fri, 5 Jul 2019 17:43:11 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190705102650.GB1645@aptenodytes>
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
>> Remove function cedrus_check_format as all it does is call
>> cedrus_find_format.
>> Rename cedrus_find_format to cedrus_check_format to maintain
>> compatibility with call sites.
>> Issue found with Coccinelle.
> 
> Maybe we could have a !! or a bool cast to make coccinelle happy here?

Coccinelle didn't flag the type mismatch, just the single-line 
functions. I could add the bool cast then?

Thanking you,
Nishka

> Cheers,
> 
> Paul
> 
>> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
>> ---
>>   drivers/staging/media/sunxi/cedrus/cedrus_video.c | 10 ++--------
>>   1 file changed, 2 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
>> index 0ec31b9e0aea..d5cc9ed04fd2 100644
>> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
>> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
>> @@ -55,8 +55,8 @@ static inline struct cedrus_ctx *cedrus_file2ctx(struct file *file)
>>   	return container_of(file->private_data, struct cedrus_ctx, fh);
>>   }
>>   
>> -static bool cedrus_find_format(u32 pixelformat, u32 directions,
>> -			       unsigned int capabilities)
>> +static bool cedrus_check_format(u32 pixelformat, u32 directions,
>> +				unsigned int capabilities)
>>   {
>>   	struct cedrus_format *fmt;
>>   	unsigned int i;
>> @@ -76,12 +76,6 @@ static bool cedrus_find_format(u32 pixelformat, u32 directions,
>>   	return false;
>>   }
>>   
>> -static bool cedrus_check_format(u32 pixelformat, u32 directions,
>> -				unsigned int capabilities)
>> -{
>> -	return cedrus_find_format(pixelformat, directions, capabilities);
>> -}
>> -
>>   static void cedrus_prepare_format(struct v4l2_pix_format *pix_fmt)
>>   {
>>   	unsigned int width = pix_fmt->width;
>> -- 
>> 2.19.1
>>
> 

