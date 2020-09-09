Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A321B263794
	for <lists+linux-media@lfdr.de>; Wed,  9 Sep 2020 22:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728954AbgIIUkc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Sep 2020 16:40:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726414AbgIIUkb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Sep 2020 16:40:31 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 201FFC061573;
        Wed,  9 Sep 2020 13:40:31 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id x23so3555068wmi.3;
        Wed, 09 Sep 2020 13:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=sx9DxKNcCvmTYkO3aEWVaC2c0HdBPnZtG5c75JMGmnk=;
        b=cCjgWXD94wPoS66QQU9Z0vA15zknGbe0JEz39WrKjO9NLwCV2CaUItI9bor3duj6HD
         Ij1XN9gmTNyo7dk9OTp9orN1Lx/6TVIml6JOuYLtRkL3j2YPz7QeihVQ+w9F2gWtv0k6
         e5mmPDocAfHTE2wqhOs5JiL0IqPP1m75Qfv/gtsQmYGWxJ8681vNSmAkynXJsvH6D1CV
         HcCTTEQOOPsC0An4L2itudcRCEfME6GeevxNbJYE1UkMZPh3F/UZdSMA+fpaUWdvgDCw
         j/n5xvs4d4m0hf0Iz6jrWIpQD6TwSfYyBQKjf4uC6Yb7j1hKJr2gXlodnlW8jUaZIyYA
         mBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=sx9DxKNcCvmTYkO3aEWVaC2c0HdBPnZtG5c75JMGmnk=;
        b=Fe8yKJo2p1scMpKL2SmeZBGXoTZOxQAKzN9C5SQw3TnHf4zWAGwO1Gu/p9dB3BeaW4
         AP1cJDzWn716IbpajC0WFzc1mS3sPq+vWQy3+ugXvSaGpAeW9yq19pJf/4zo1BabEDfq
         JWpBft2m7yhd+VAUuWMfhQUcj+BWz5tFagQ3NtMK2SspfxYn2PnQEm7olprYbRKm97H6
         2xnS/z0uRXQB9bfqqAdGlDBX5ezd3MBuAc1nwvAcrOvtHt0JAcklDCS7H0q9PwarqCzL
         ipN10bJN2dNqxF9wKa9920jJshzlDEzZcB9IjMatQlgyn2WFPnycPuyO5TyI11aio8Kc
         WBHA==
X-Gm-Message-State: AOAM5311bWwnNHeioJfUEv1dWJ0X3lpx4AaCJWaibOnjC8WOXAqu6mSp
        30R2teQTAMdu+AdrFVK7UWiO7RCL/WQTY61f
X-Google-Smtp-Source: ABdhPJxhgwin1sWmTwPB9h9DSNs6VJcWjq8LSApL/5XdKL31gGO7kn6617oA79iPbpSgMQ3hMu0hpA==
X-Received: by 2002:a1c:c90d:: with SMTP id f13mr5290413wmb.25.1599684029611;
        Wed, 09 Sep 2020 13:40:29 -0700 (PDT)
Received: from [192.168.0.18] (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
        by smtp.gmail.com with ESMTPSA id f14sm5717285wrv.72.2020.09.09.13.40.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2020 13:40:29 -0700 (PDT)
Subject: Re: [PATCH] staging: media: atomisp: Use kvfree_sensitive in a few
 places
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     devel@driverdev.osuosl.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
References: <20200909195403.225084-1-alex.dewar90@gmail.com>
 <20200909200651.GB12635@kadam>
From:   Alex Dewar <alex.dewar90@gmail.com>
Message-ID: <e8204c7a-e0d1-3c08-3313-3435ae53fa8b@gmail.com>
Date:   Wed, 9 Sep 2020 21:40:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200909200651.GB12635@kadam>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-09-09 21:06, Dan Carpenter wrote:
> On Wed, Sep 09, 2020 at 08:53:50PM +0100, Alex Dewar wrote:
>> In the file pci/sh_css_params.c, there are a number of places where
>> memset+kvfree is used, where kvfree_sensitive could be used instead. Fix
>> these occurrences.
> This doesn't say *why* the commit is doing it.  There are two reasons:
> The worry with these is that the compiler could optimize away the memset
> because it sees the kfree().  Second using kvfree_sensitive() is more
> clear and readable.
Good point :)
>
>> Issue identified with Coccinelle.
>>
>> Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
>> ---
>>   .../staging/media/atomisp/pci/sh_css_params.c | 19 +++++++------------
>>   1 file changed, 7 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
>> index 2c67c23b3700..d1b5d6608d52 100644
>> --- a/drivers/staging/media/atomisp/pci/sh_css_params.c
>> +++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
>> @@ -4378,8 +4378,7 @@ ia_css_3a_statistics_free(struct ia_css_3a_statistics *me)
>>   	if (me) {
>>   		kvfree(me->rgby_data);
>>   		kvfree(me->data);
>> -		memset(me, 0, sizeof(struct ia_css_3a_statistics));
>> -		kvfree(me);
>> +		kvfree_sensitive(me, sizeof(struct ia_css_3a_statistics));
> I don't think ia_css_3a_statistics are sensitive at all.  What we're
> trying to protect are things like passwords.  Just delete the memset.
>
> Looking below, I don't think any of these are sensitive so just delete
> all the memsets.
This makes sense. I'll send a new patch. Thanks for the feedback!

Alex
>
> regards,
> dan carpenter
>

