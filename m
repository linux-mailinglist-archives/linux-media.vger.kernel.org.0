Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2F9A25807A
	for <lists+linux-media@lfdr.de>; Mon, 31 Aug 2020 20:12:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728913AbgHaSMb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Aug 2020 14:12:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29988 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729503AbgHaSMD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Aug 2020 14:12:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1598897521;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=R674/72dzH0s8wu0q77/o8Nko89CHzZBE+f9ohuJkc0=;
        b=egHM9anVIRRhUxeBtMmAlY+jVs1veaqWvrOi5OL05bw+tPwAz1cQZk8lMKgEMRiXBqIQ6r
        JKwU0+LsTv8FMZipxplJLuPOX21fvIJgSZSpUzryvwiNzu2KyJKGmEAU5LpQp4C/Pj8M1P
        He+Z52tv6vdftpDsdc4V/tqv3mUJA5c=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-JP7ekmV8M82-E5yE8DKw5w-1; Mon, 31 Aug 2020 14:11:59 -0400
X-MC-Unique: JP7ekmV8M82-E5yE8DKw5w-1
Received: by mail-io1-f69.google.com with SMTP id v10so4663476iot.6
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2020 11:11:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=R674/72dzH0s8wu0q77/o8Nko89CHzZBE+f9ohuJkc0=;
        b=O0lIt1rbB7NbWJGtWfbFlsX2KdmT7tInrD880xtZxAMn6VN3OZ+oUeqyEmWpvsee19
         f+aE37Cg9SkbU+79nR8SMTRbmIHRU4ddZRB4mZ53HnClMKnz6KkLXMuuy348psTBnqAN
         5SmJ9NFSZdyvk6PIiD7j/UzYUoNvE0vVQZ81v13+rf1B1chlpIs6sg6IGvYe0J7XqF3I
         OhcMm7HGIpRf6QG2Sh4SB4KDjTFEABHVytEBThyQLtOSUUTWkfwzdsMhcTfKMYunebeY
         vS/4RjdJuFvpQg7uwhL7fmOhOQcg1L2W8BnVPuPl9Sb1jY1k8htnk208nWFZ0wB+rj8y
         hwTQ==
X-Gm-Message-State: AOAM533SbqDzFvS3EwYaquntoM9FOGI4BaVSySYFf1T8ww0uPEZT5JAd
        NQF5gov4ewO/FsKyq4XeAvEGih6f7Wl9l+eBFXIEzyjCD8z2AYcozH1Mq/N/KfBMvJQGY6C9HjJ
        FAu/iCE7Efvbb/ieiexY5yh4=
X-Received: by 2002:a92:cd0c:: with SMTP id z12mr2310935iln.95.1598897519246;
        Mon, 31 Aug 2020 11:11:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQnv2fWHOPseIkHEUWf3rehvfnqBXk0m4BeVGmJn1hPjW7PLrM3iOz+bnxyXwgsl/vzs1PFA==
X-Received: by 2002:a92:cd0c:: with SMTP id z12mr2310915iln.95.1598897519033;
        Mon, 31 Aug 2020 11:11:59 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id u4sm4405350iol.17.2020.08.31.11.11.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2020 11:11:58 -0700 (PDT)
Subject: Re: [PATCH] media: tc358743: initialize variable
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     matrandg@cisco.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        p.zabel@pengutronix.de, Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20200830163043.10317-1-trix@redhat.com>
 <CAKwvOdkvY62xVKQcVHxMTpskO=bB2sxwiOQb+TGF0-oU2Q6unA@mail.gmail.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <23bc7c20-f736-a8fb-b89c-c9039380e55b@redhat.com>
Date:   Mon, 31 Aug 2020 11:11:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAKwvOdkvY62xVKQcVHxMTpskO=bB2sxwiOQb+TGF0-oU2Q6unA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 8/31/20 10:31 AM, Nick Desaulniers wrote:
> On Sun, Aug 30, 2020 at 9:30 AM <trix@redhat.com> wrote:
>> From: Tom Rix <trix@redhat.com>
>>
>> clang static analysis flags this error
>>
>> tc358743.c:1468:9: warning: Branch condition evaluates
>>   to a garbage value
>>         return handled ? IRQ_HANDLED : IRQ_NONE;
>>                ^~~~~~~
>> handled should be initialized to false.
>>
>> Fixes: d747b806abf4 ("[media] tc358743: add direct interrupt handling")
>> Signed-off-by: Tom Rix <trix@redhat.com>
> I'm guessing there was more to the report that says that `handled`
> isn't necessarily initialized along any of the paths within
> tc358743_isr()?  But you should fix this for all callers of
> tc358743_isr(), such as tc358743_work_i2c_poll(), not just
> tc358743_irq_handler().

Interesting. The static analyzer did not catch this.

I will take another.

Thanks

Tom

>> ---
>>  drivers/media/i2c/tc358743.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
>> index a03dcab5ce61..c724bd1591de 100644
>> --- a/drivers/media/i2c/tc358743.c
>> +++ b/drivers/media/i2c/tc358743.c
>> @@ -1461,7 +1461,7 @@ static int tc358743_isr(struct v4l2_subdev *sd, u32 status, bool *handled)
>>  static irqreturn_t tc358743_irq_handler(int irq, void *dev_id)
>>  {
>>         struct tc358743_state *state = dev_id;
>> -       bool handled;
>> +       bool handled = false;
>>
>>         tc358743_isr(&state->sd, 0, &handled);
>>
>> --
>> 2.18.1
>>
>

