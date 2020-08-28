Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C11F255DF5
	for <lists+linux-media@lfdr.de>; Fri, 28 Aug 2020 17:37:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbgH1Pgz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Aug 2020 11:36:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29986 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726052AbgH1Pgu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Aug 2020 11:36:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1598629008;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=90baatzSPBpORTYvIrGD2xeuQLVBCo5SpxPsADar6cc=;
        b=cY9YdZC8q+Lx/HkcgXcR3Dopnz76bIN1N221AK3n3XBJSbPJMb7w+iBadQEBkBmfNr89EP
        bm7H8EFsiyZTP46Un4zNoGhBaRGdYddJNp/eLh5ct1ScHOcyn3k4l1IKczRW0af2KgZfur
        Vq/R1TdMn8rz45evMlLiQOEVKXZBYmI=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-8qmuJxkwOUOw1Fr5ZTT5aA-1; Fri, 28 Aug 2020 11:36:47 -0400
X-MC-Unique: 8qmuJxkwOUOw1Fr5ZTT5aA-1
Received: by mail-qk1-f198.google.com with SMTP id t10so1242723qke.11
        for <linux-media@vger.kernel.org>; Fri, 28 Aug 2020 08:36:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=90baatzSPBpORTYvIrGD2xeuQLVBCo5SpxPsADar6cc=;
        b=J4S12lWfpKFICa/TrllFd8fI4AHq80Wj31X0wLA5ADuhQG24dwY3Eno4AbwfhHwCdB
         8Q7nAsT+G5ptmHxCEsaSYVupLfxT+47Quz7myTjAgfbRnJ5xcdhQkABJKABhhJMZ6OYU
         xqq7cwIqYV4Tnp2t+oUxbSqtfupaClvO9Oqrnix+cvYpdf9mcpNIUklMPtpCoXSDsqMf
         jLWj3CbNeK+ziDdmG2NonTUEudQ3qQiA4yGPEtYacHA58mgXNRlVkeyT4SSXdHbx3Pvu
         rHtVUozhBiTZBi+zkKX3UwmrrJGy8xYgA5cEKtthBE25Owq7PpZhWcKuvTvhSXd3bfze
         U9kw==
X-Gm-Message-State: AOAM531SLR+8ogey6RZ1crYMxVWv4j/L1+Yn97/FYZizdqjTsmuJh9+N
        To3zWEEJBDBl4l2kbbf61QK8BHj4opsXfmS1Qq6Ub8qwHiShH3os58Nv+hBqMcsoQVTAGTAWOBg
        Cht7IhpUMz+9tkqjU4h3QHaA=
X-Received: by 2002:a37:2747:: with SMTP id n68mr1704424qkn.176.1598629006498;
        Fri, 28 Aug 2020 08:36:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoB5eKwE3Dt2wDr4pX5sS6NGxMfZLnhKR9BLUmh6g1fCcYwnzpg+4LvBZtX7Iehhbd+ES20Q==
X-Received: by 2002:a37:2747:: with SMTP id n68mr1704402qkn.176.1598629006231;
        Fri, 28 Aug 2020 08:36:46 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id j74sm1111465qke.7.2020.08.28.08.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2020 08:36:45 -0700 (PDT)
Subject: Re: [PATCH] media: ov7670: check status of ov7670_read
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        linux-media@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Huckleberry <nhuck15@gmail.com>
References: <20200828145518.26324-1-trix@redhat.com>
 <CAKwvOd=S=aw6KoRvzhUMi4fR799kaPwAKoigjuR9fS-JSYSGPA@mail.gmail.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <db41a471-b5cd-6ffe-c24f-ba14d9125920@redhat.com>
Date:   Fri, 28 Aug 2020 08:36:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAKwvOd=S=aw6KoRvzhUMi4fR799kaPwAKoigjuR9fS-JSYSGPA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 8/28/20 8:13 AM, Nick Desaulniers wrote:
> On Fri, Aug 28, 2020 at 7:55 AM <trix@redhat.com> wrote:
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
> Indeed, it looks like gain is only valid if the return value from
> ov7670_read() is >= 0.  Would it be simpler to just initialize gain to
> 0 in ov7670_g_gain?

It looks like ov7670_read() subroutines both convert > 0 returns to 0.

Setting gain, and similar cases, to 0 means it is ok the setting side effect.  maybe it would be ok if this was a void return or there was some known poison value.  I did not look into that.  There are other routines that are more than a simple get() and i wanted to use the same fix for all of them.

yeah on clang static analysis making it into kbuild!  I have been doing these fixes for a couple of months.  with a just-built clang, i run 'scan-build make randomconfig', 'scan-build make', then run scan-view on the html.  the randomconfig accounts for the very scattered fixes i have posted.  generally i would say kernel is doing pretty well, maybe 20 to 1 false to real problems.

Tom

>
> Side question; I'm super happy to see someone sending patches for
> things identified by clang's static analyzer.  I'm curious, Tom, how
> did you run it?  Did you use the recently landed in kbuild-next
> support for the make target `make clang-analyzer`?
>
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
>>         ret =  ov7670_write(sd, REG_HSTART, (hstart >> 3) & 0xff);
>>         ret += ov7670_write(sd, REG_HSTOP, (hstop >> 3) & 0xff);
>>         ret += ov7670_read(sd, REG_HREF, &v);
>> +       if (ret)
>> +               return ret;
>>         v = (v & 0xc0) | ((hstop & 0x7) << 3) | (hstart & 0x7);
>>         msleep(10);
>>         ret += ov7670_write(sd, REG_HREF, v);
>> @@ -938,6 +940,8 @@ static int ov7670_set_hw(struct v4l2_subdev *sd, int hstart, int hstop,
>>         ret += ov7670_write(sd, REG_VSTART, (vstart >> 2) & 0xff);
>>         ret += ov7670_write(sd, REG_VSTOP, (vstop >> 2) & 0xff);
>>         ret += ov7670_read(sd, REG_VREF, &v);
>> +       if (ret)
>> +               return ret;
>>         v = (v & 0xf0) | ((vstop & 0x3) << 2) | (vstart & 0x3);
>>         msleep(10);
>>         ret += ov7670_write(sd, REG_VREF, v);
>> @@ -1460,6 +1464,8 @@ static int ov7670_g_gain(struct v4l2_subdev *sd, __s32 *value)
>>         unsigned char gain;
>>
>>         ret = ov7670_read(sd, REG_GAIN, &gain);
>> +       if (ret)
>> +               return ret;
>>         *value = gain;
>>         return ret;
>>  }
>> @@ -1470,11 +1476,14 @@ static int ov7670_s_gain(struct v4l2_subdev *sd, int value)
>>         unsigned char com8;
>>
>>         ret = ov7670_write(sd, REG_GAIN, value & 0xff);
>> +       if (ret)
>> +               return ret;
>>         /* Have to turn off AGC as well */
>> -       if (ret == 0) {
>> -               ret = ov7670_read(sd, REG_COM8, &com8);
>> -               ret = ov7670_write(sd, REG_COM8, com8 & ~COM8_AGC);
>> -       }
>> +       ret = ov7670_read(sd, REG_COM8, &com8);
>> +       if (ret)
>> +               return ret;
>> +       ret = ov7670_write(sd, REG_COM8, com8 & ~COM8_AGC);
>> +
>>         return ret;
>>  }
>>
>> --
>> 2.18.1
>>
>

