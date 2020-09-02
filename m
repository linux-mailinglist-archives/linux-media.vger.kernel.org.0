Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC3D725AC68
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 15:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbgIBN5R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 09:57:17 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28037 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727771AbgIBNyZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Sep 2020 09:54:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599054863;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=khHWBwp27MCsDubL2xJ27QUZt+RhTFOMCjX1dXeN/NI=;
        b=IEUdGxKU3/CMUjYIh00FSyVp8SRIRIjSgi0TgzqzX+63ZHG6VCNZVs+DdpU26vm2Nl80TX
        jLsZHqkBY9knyBTHCnEoTxa4+x/hwH25Z7Y777f2xYOEG4+9YOPyVQHNn0ZRQvRUzpriRX
        i4UmFrS+AjQsX6hhpN6k2c3uOMH9XGQ=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-6F81LapAP8C3oMwQPZevRQ-1; Wed, 02 Sep 2020 09:54:22 -0400
X-MC-Unique: 6F81LapAP8C3oMwQPZevRQ-1
Received: by mail-il1-f197.google.com with SMTP id c11so2009346ilm.0
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2020 06:54:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=khHWBwp27MCsDubL2xJ27QUZt+RhTFOMCjX1dXeN/NI=;
        b=XoT7qdc8+VrhnjTtgqVaPUQ1p+cVJb91wDHhR1I01VLsus7XV5wdQnotPkLSmIwMfK
         DtabDG0RlNANjq6BP7cL6SiUaloNZj25VrtLOqyH5ZID2v+2B1p4LaMlYH9xA95butTX
         U2nVWPQGSZiWVubLzdsefMzwlubk+C2bZInipYoj2/G3yEjBtcctdPBMrcY1qFIoEdjG
         lEjYCeK//z2ovnvTAwMOG2I+b5SdX2LEVO7LTXUJYJ9G6MoVvEJSkgjPW/j95m+f29kE
         w4UsiZrX2baBEy/PXpnS+Lj3F6FyWi+Xa407qc+QC9/7wHpBe/MBEY/XgWB6ruLkFLqJ
         nTpQ==
X-Gm-Message-State: AOAM531RMhvEVciI02ds+MUala5R8E7Nfh7FyKzm+uupenRHEA4uqfHi
        RyHHQiYLaWAH5yO5iZBI5G4vGSFo8/Wr0akFYdcT/fdw+lZTzCbJ5LD4w9RT7AJcL/0Syd6Lb8d
        RlWFUtuxa6wSZGdYQX1jWRN0=
X-Received: by 2002:a05:6638:144:: with SMTP id y4mr3278098jao.61.1599054861763;
        Wed, 02 Sep 2020 06:54:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeD2EUIkJh6TIy2+yZpYkZPNXyrjZKyqORwp6a/S9dENeA/0Rke6kCSnDOJiOYPCEl37GvZA==
X-Received: by 2002:a05:6638:144:: with SMTP id y4mr3278076jao.61.1599054861531;
        Wed, 02 Sep 2020 06:54:21 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id z4sm2255690ilh.45.2020.09.02.06.54.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2020 06:54:21 -0700 (PDT)
Subject: Re: [PATCH] media: tc358743: initialize variable
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     matrandg@cisco.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        p.zabel@pengutronix.de, Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20200830163043.10317-1-trix@redhat.com>
 <CAKwvOdkvY62xVKQcVHxMTpskO=bB2sxwiOQb+TGF0-oU2Q6unA@mail.gmail.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <99da6454-2f40-1def-bfae-f82ae8ec0379@redhat.com>
Date:   Wed, 2 Sep 2020 06:54:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAKwvOdkvY62xVKQcVHxMTpskO=bB2sxwiOQb+TGF0-oU2Q6unA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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

tc358743_work_i2c_poll does not use handled, so in theory it could pass a null, however at least one of the subhandler, tc358743_cec_isr, does not check if null is passed in.

so i think that covers the callers.

i think initializing handler in tc358743_work_i2c_poll is a not needed since it is unused.  but the null check in tc358743_cec_isr needs to be done. i'll post that as a separate patch once this one settles.

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

