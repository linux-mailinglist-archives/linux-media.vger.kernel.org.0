Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD3C045EC32
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 12:06:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231463AbhKZLJu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 06:09:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53998 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236757AbhKZLHt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 06:07:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637924677;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PLyZJ/AaEoLJS4Y455x8SJ7yKc0pdu3aqxjVQr46JsM=;
        b=XeoHliIuoJ6KuXTjY4pZujco40dUPEgNXrqWIo3REXkg4QWWUA/ykKiL2dxnsMn5Eu9NDe
        9WK5Dl8LP4f2j7XmV0AXUE4aHE17KzlCmCq9uuNygzjXbiYWZWsZji/h+ZDsIN8kle+bNL
        Hnjdb5DoqCQLpj1gflildcfoeA3A1R4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-ae2idG5DPneSRET55ubo2Q-1; Fri, 26 Nov 2021 06:04:35 -0500
X-MC-Unique: ae2idG5DPneSRET55ubo2Q-1
Received: by mail-ed1-f72.google.com with SMTP id d13-20020a056402516d00b003e7e67a8f93so7792572ede.0
        for <linux-media@vger.kernel.org>; Fri, 26 Nov 2021 03:04:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=PLyZJ/AaEoLJS4Y455x8SJ7yKc0pdu3aqxjVQr46JsM=;
        b=2htSBaGQeCcjvxgd5YPV/dHiYRfgAjvqQDHRcP48VdtqRfJt/YG4MHtU1KlSPtWTx8
         omOGTnlLf1qB799i4VXs5mzf6FzhX65KLiKCnlVqp48xAV3dtSNOj8ZdtekAmNhtP1w1
         ZncLn6IJ9wZPG8NPGrQeDzHpPhhTIrFnHdioJOLzgjW/gnJ9g8CU3tQC9NvGIiL5eBPj
         jl7rlD/luq2pk9jGKNr+eJz8ihSG/ork9E9x0hf4T9cCm8CfuvxI0FWPJiHf7fGKyuvV
         88bv+Ur+/KHXIj4iYKbb/I1n6drXQUCZoTvgMnZdvBsUVgLrehF9K2U52R/93UEt6q+Q
         bJ5g==
X-Gm-Message-State: AOAM531EHX+DwQEYzGW1kl0r/eDxhogdVfYP1THyBMIr8uzthXIOeMIM
        uyT06RTkI5ZICuZqPNjzIrmsb4mQu31uo3mWsK79XE3jZKkhgRnZHo6TnetZNj1CVrygZK1UmPM
        m6cL8JImHts+zZ8Tr1QH2YRs=
X-Received: by 2002:a17:906:f894:: with SMTP id lg20mr37919120ejb.33.1637924674391;
        Fri, 26 Nov 2021 03:04:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzwTasiO8omzeCbaeI5uoRRCxDkVRL4+MYYOR+4cyeFGl23XgH78nQwzf9Ldj0XBhGpaH+q9g==
X-Received: by 2002:a17:906:f894:: with SMTP id lg20mr37919106ejb.33.1637924674244;
        Fri, 26 Nov 2021 03:04:34 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id qa7sm3020878ejc.64.2021.11.26.03.04.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Nov 2021 03:04:33 -0800 (PST)
Message-ID: <d2412ec4-c51c-08b1-81f6-34da6857cfd6@redhat.com>
Date:   Fri, 26 Nov 2021 12:04:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] media: i2c: ov5648: Fix lockdep error
Content-Language: en-US
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
References: <20211125203156.825539-1-hdegoede@redhat.com>
 <YaCyKYgMwDK4hlNv@aptenodytes>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YaCyKYgMwDK4hlNv@aptenodytes>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 11/26/21 11:08, Paul Kocialkowski wrote:
> Hi Hans,
> 
> On Thu 25 Nov 21, 21:31, Hans de Goede wrote:
>> ov5648_state_init() calls ov5648_state_mipi_configure() which uses
>> __v4l2_ctrl_s_ctrl[_int64](). This means that sensor->mutex (which
>> is also sensor->ctrls.handler.lock) must be locked before calling
>> ov5648_state_init().
>>
>> ov5648_state_mipi_configure() is also used in other places where
>> the lock is already held so it cannot be changed itself.
>>
>> Note this is based on an identical (tested) fix for the ov8865 driver,
>> this has only been compile-tested.
> 
> Good catch, thanks!
> 
> Though I think it would look slightly better to have the lock in the
> ov5648_state_init function itself rather than in the probe.

Ack, that makes sense. I will send a v2 with this change.

Regards,

Hans



>> Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/media/i2c/ov5648.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
>> index 947d437ed0ef..9f24bdccf50f 100644
>> --- a/drivers/media/i2c/ov5648.c
>> +++ b/drivers/media/i2c/ov5648.c
>> @@ -2546,7 +2546,9 @@ static int ov5648_probe(struct i2c_client *client)
>>  	if (ret)
>>  		goto error_mutex;
>>  
>> +	mutex_lock(&sensor->mutex);
>>  	ret = ov5648_state_init(sensor);
>> +	mutex_unlock(&sensor->mutex);
>>  	if (ret)
>>  		goto error_ctrls;
>>  
>> -- 
>> 2.33.1
>>
> 

