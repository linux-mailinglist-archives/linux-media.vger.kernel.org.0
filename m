Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2779A284D73
	for <lists+linux-media@lfdr.de>; Tue,  6 Oct 2020 16:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbgJFORR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Oct 2020 10:17:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22251 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725906AbgJFORQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 6 Oct 2020 10:17:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601993835;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JhLZhQb3+y6eB2aR8dzGqs7Nd3D3OpNsxn6FaEOC/B0=;
        b=ap27CmW9485TL1uRpr0Wv4dJ2aJnHQTOZI6dcCFWzy8jEonQqnSurURlPgMoEJ1NXaQRob
        x+WRnWT/N8Y3jCxbfLDMqi/XYgVC0uS30bW+2G835Pil1ltFFODvqnlJE75tEZuRWCa8gx
        ZGqw3lg2NCSzGhLdgtQnOau3O8ypTZo=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-wuRsAop-M_69SsXB3dPIHg-1; Tue, 06 Oct 2020 10:17:13 -0400
X-MC-Unique: wuRsAop-M_69SsXB3dPIHg-1
Received: by mail-qv1-f70.google.com with SMTP id y2so8222549qvs.14
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2020 07:17:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=JhLZhQb3+y6eB2aR8dzGqs7Nd3D3OpNsxn6FaEOC/B0=;
        b=gZkOaIhPzz7+19tKlhZy9s73JXKcP6Jnal+6x+FPm/gJ9T7zt5jtFdeoMroaa9iGBO
         Vg5212QHkhVbaxW0nyBameDfxxoP9Y6zc/OQfce3maiTMGuqZluNC50BFHRB2KA2k/5G
         Nswu+ECDgqDYIjrPbhRy0kZn50WWmsZOxXoScgR13FOXItFgbJY63PvNVTmDU9KwHcY3
         0SheG0u1eT104Bivc+q8I1jbh5k7/MHO15BIwL7C+iTgXq1F1XbHqkgYSMnTnGgFzPBp
         23mfxc4m8nsjnVZe8p9DnMYHP1128WUUEXyQ4OgPeVdTHAckzTZ4m0ur3eSh5nFELwLp
         tU1w==
X-Gm-Message-State: AOAM530B3eJra9zLKxvJcfWKJ8jVJmJM8rySmKTOmUqZSTIM4+7/98vC
        POuqnqJqZiyHHcPgM0CA8Io2GDmA5wtm9e7a7pvLK1fEz56NJfGkKU0+0f0R4ll42N8mPs9QhEF
        nePO5syGnPJ9g0BnvrgpMeXc=
X-Received: by 2002:a37:5145:: with SMTP id f66mr5142002qkb.299.1601993832785;
        Tue, 06 Oct 2020 07:17:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUSqEiEH7YBQAtV1vnjzeCQgciC3SYxxwZQIl+PhhsLf3/7kDYv9cTPfeUHJWTP0ggGOmWPw==
X-Received: by 2002:a37:5145:: with SMTP id f66mr5141966qkb.299.1601993832487;
        Tue, 06 Oct 2020 07:17:12 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id a66sm2453737qkc.52.2020.10.06.07.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2020 07:17:11 -0700 (PDT)
Subject: Re: [PATCH] media: ov7670: check status of ov7670_read
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     corbet@lwn.net, mchehab@kernel.org, natechancellor@gmail.com,
        ndesaulniers@google.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200828145518.26324-1-trix@redhat.com>
 <20201006124148.GC5682@valkosipuli.retiisi.org.uk>
From:   Tom Rix <trix@redhat.com>
Message-ID: <75462c9b-afc0-aeb7-018a-573db59192f4@redhat.com>
Date:   Tue, 6 Oct 2020 07:17:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201006124148.GC5682@valkosipuli.retiisi.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 10/6/20 5:41 AM, Sakari Ailus wrote:
> Hi Tom,
>
> On Fri, Aug 28, 2020 at 07:55:18AM -0700, trix@redhat.com wrote:
>> From: Tom Rix <trix@redhat.com>
>>
>> clang static analysis flags this representative problem
>>
>> drivers/media/i2c/ov7670.c:1463:9: warning: Assigned
>>   value is garbage or undefined
>>         *value = gain;
>>                ^ ~~~~
>>
>> gain is set by a successful call to ov7670_read()
>>
>> So check that ov7670_read() is successful.
>>
>> The remaining static analysis problems are false positives.
>> There appears to be a limitation with checking the
>> aggregated returns.
>>
>> Signed-off-by: Tom Rix <trix@redhat.com>
>> ---
>>  drivers/media/i2c/ov7670.c | 17 +++++++++++++----
>>  1 file changed, 13 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov7670.c b/drivers/media/i2c/ov7670.c
>> index b42b289faaef..001d4b09db72 100644
>> --- a/drivers/media/i2c/ov7670.c
>> +++ b/drivers/media/i2c/ov7670.c
>> @@ -929,6 +929,8 @@ static int ov7670_set_hw(struct v4l2_subdev *sd, int hstart, int hstop,
>>  	ret =  ov7670_write(sd, REG_HSTART, (hstart >> 3) & 0xff);
>>  	ret += ov7670_write(sd, REG_HSTOP, (hstop >> 3) & 0xff);
>>  	ret += ov7670_read(sd, REG_HREF, &v);
>> +	if (ret)
>> +		return ret;
> Thanks for the patch.
>
> While the patch fixes a bug, could you also fix adding the return values?
> These are valid error codes to begin with, but it makes no sense to add
> them together.

Yes. That is a problem, a general problem with this file.

I count 10+

I'll see if fixing the general problem also fixes this problem.

Tom

>
>>  	v = (v & 0xc0) | ((hstop & 0x7) << 3) | (hstart & 0x7);
>>  	msleep(10);
>>  	ret += ov7670_write(sd, REG_HREF, v);
>> @@ -938,6 +940,8 @@ static int ov7670_set_hw(struct v4l2_subdev *sd, int hstart, int hstop,
>>  	ret += ov7670_write(sd, REG_VSTART, (vstart >> 2) & 0xff);
>>  	ret += ov7670_write(sd, REG_VSTOP, (vstop >> 2) & 0xff);
>>  	ret += ov7670_read(sd, REG_VREF, &v);
>> +	if (ret)
>> +		return ret;
>>  	v = (v & 0xf0) | ((vstop & 0x3) << 2) | (vstart & 0x3);
>>  	msleep(10);
>>  	ret += ov7670_write(sd, REG_VREF, v);
>> @@ -1460,6 +1464,8 @@ static int ov7670_g_gain(struct v4l2_subdev *sd, __s32 *value)
>>  	unsigned char gain;
>>  
>>  	ret = ov7670_read(sd, REG_GAIN, &gain);
>> +	if (ret)
>> +		return ret;
>>  	*value = gain;
>>  	return ret;
>>  }
>> @@ -1470,11 +1476,14 @@ static int ov7670_s_gain(struct v4l2_subdev *sd, int value)
>>  	unsigned char com8;
>>  
>>  	ret = ov7670_write(sd, REG_GAIN, value & 0xff);
>> +	if (ret)
>> +		return ret;
>>  	/* Have to turn off AGC as well */
>> -	if (ret == 0) {
>> -		ret = ov7670_read(sd, REG_COM8, &com8);
>> -		ret = ov7670_write(sd, REG_COM8, com8 & ~COM8_AGC);
>> -	}
>> +	ret = ov7670_read(sd, REG_COM8, &com8);
>> +	if (ret)
>> +		return ret;
>> +	ret = ov7670_write(sd, REG_COM8, com8 & ~COM8_AGC);
>> +
>>  	return ret;
>>  }
>>  

