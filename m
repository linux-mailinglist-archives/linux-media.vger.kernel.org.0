Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAA6A474D6A
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 22:57:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234919AbhLNV5f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Dec 2021 16:57:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbhLNV5e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Dec 2021 16:57:34 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 493B2C061574
        for <linux-media@vger.kernel.org>; Tue, 14 Dec 2021 13:57:34 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id i8-20020a7bc948000000b0030db7b70b6bso17233956wml.1
        for <linux-media@vger.kernel.org>; Tue, 14 Dec 2021 13:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=7YJ+ljj1RaWfI86h1NNp1sy5kcUAz6TRY4lpXHIm590=;
        b=jEj68GIUWk6SAxvn8GBqi3+IEv/7DcVqiX78UpBqIVP1ujexjJAiLzXgAXQIQzmh5j
         ijTUTqKvd0tRwPc+txvyzcqtEVRvHA1SFsFVcbWy4MefTXaddvrMPTq4QetpOn197l8i
         77045qNnxDQ7dyLKEMPGS0yFLjdX23R7nM00iSHNCWp2xyUY2Ns6Uour2dW/6ZsbEzZ2
         cvHx8QjDE3Ev5OU+Q61Esf3JKF2BvxomAJUTpa9TjPFS7xfrBxHKDQAszD5xytb2DkTK
         7JfOCio8ucrxv49lQpBAlktzbfiS3lIgwxMFbcAfo8o1BcI0Oyb77vXcGCO9A27mQ2Od
         Z0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=7YJ+ljj1RaWfI86h1NNp1sy5kcUAz6TRY4lpXHIm590=;
        b=YgvAcoibUBNjdk57nIq2cAq20E6b/lV10tLYkNp21HpjMAPCgkoiaDFodHuTt0qMSC
         spa5lsEb3z59hBOajCcOfksy2mcsB8JMpl9l7Ng4RQWg/JnhMOXxrGerLSUEHncxBFYo
         Yt2HOfLwO5tHFWpxkz2DOIkLme9lgGcgnI0WsGFvIjH+jj2gprEo2Eh2ZUDhVtjstUXA
         5QkbFrY0TnUgHXXbVbDPFNJFZjG91cEPZqirsdm96SQcngYRwOKkM2CfjU8Fvo8QF9uY
         xlk36ssPSvSo/w5Uo0w52zxv+2tyBjYLz/qW27/LjFG6eTBUYOIvF+AboiepWhYWiYgx
         xfUQ==
X-Gm-Message-State: AOAM533dnzcU68hMPYgCoHhaTloiFeDG3RuCMnx2QajXp0zWUSSNwelX
        WvC/xFFTnImVLYXpNz8COao=
X-Google-Smtp-Source: ABdhPJyaSPsIQZhh6L34VjD2TkAj8QlbYf4PtdfjFgjjfBh6QLjO1zAaAAeCHFn/VsaukUcoa5nJ0Q==
X-Received: by 2002:a05:600c:2dc8:: with SMTP id e8mr1737087wmh.189.1639519052880;
        Tue, 14 Dec 2021 13:57:32 -0800 (PST)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id n1sm136774wrc.54.2021.12.14.13.57.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Dec 2021 13:57:32 -0800 (PST)
Subject: Re: [PATCH 2/5] media: entity: Add link_type() helper
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        sakari.ailus@linux.intel.com, hanlinchen@chromium.org,
        tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
References: <20211213232849.40071-1-djrscally@gmail.com>
 <20211213232849.40071-3-djrscally@gmail.com>
 <YbkSkjEKagLDeIm7@pendragon.ideasonboard.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <5dbd888e-7a7c-bd16-9208-cf26ddeeb950@gmail.com>
Date:   Tue, 14 Dec 2021 21:57:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YbkSkjEKagLDeIm7@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On 14/12/2021 21:54, Laurent Pinchart wrote:
> Hi Daniel,
>
> Thank you for the patch.
>
> On Mon, Dec 13, 2021 at 11:28:46PM +0000, Daniel Scally wrote:
>> Now we have three types of media link, printing the right name during
>> debug output is slightly more complicated. Add a helper function to
>> make it easier.
>>
>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>> ---
>> Changes since the rfc:
>>
>> 	- new patch
>>
>>  drivers/media/mc/mc-entity.c | 18 +++++++++++++++---
>>  1 file changed, 15 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
>> index f40f41977142..d79eb88bc167 100644
>> --- a/drivers/media/mc/mc-entity.c
>> +++ b/drivers/media/mc/mc-entity.c
>> @@ -60,6 +60,20 @@ static inline const char *intf_type(struct media_interface *intf)
>>  	}
>>  };
>>  
>> +static inline const char *link_type(struct media_link *link)
> This could be named link_type_name() to avoid confusion with a function
> that would return the link type.


Probably yeah - I'll do that in v2

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>


Thank you

>
>> +{
>> +	switch (link->flags & MEDIA_LNK_FL_LINK_TYPE) {
>> +	case MEDIA_LNK_FL_DATA_LINK:
>> +		return "data";
>> +	case MEDIA_LNK_FL_INTERFACE_LINK:
>> +		return "interface";
>> +	case MEDIA_LNK_FL_ANCILLARY_LINK:
>> +		return "ancillary";
>> +	default:
>> +		return "unknown";
>> +	}
>> +}
>> +
>>  __must_check int __media_entity_enum_init(struct media_entity_enum *ent_enum,
>>  					  int idx_max)
>>  {
>> @@ -107,9 +121,7 @@ static void dev_dbg_obj(const char *event_name,  struct media_gobj *gobj)
>>  
>>  		dev_dbg(gobj->mdev->dev,
>>  			"%s id %u: %s link id %u ==> id %u\n",
>> -			event_name, media_id(gobj),
>> -			media_type(link->gobj0) == MEDIA_GRAPH_PAD ?
>> -				"data" : "interface",
>> +			event_name, media_id(gobj), link_type(link),
>>  			media_id(link->gobj0),
>>  			media_id(link->gobj1));
>>  		break;
