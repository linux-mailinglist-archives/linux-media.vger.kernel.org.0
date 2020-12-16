Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E24C02DB7BB
	for <lists+linux-media@lfdr.de>; Wed, 16 Dec 2020 01:16:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725790AbgLPAQL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Dec 2020 19:16:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41454 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725550AbgLPAQK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Dec 2020 19:16:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1608077684;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xRFUtbRbVHAPYmIqUZy/cSKapSSOng2O0tF1oLpP9Zk=;
        b=WNaPO1HSap0drsGX+cFcHNkjmmmbhbR4o3JFREZrKURNlC7Qw7Yn8zIJ3z2jnAMsKQv0mJ
        gbloynxmeDP2QV+6mYffNie3mAO5Y0POYzmjUbY0NAilU8CEhvOOHjOyX10R/zGMAB13fk
        tuSG1edQTu5qdXXtcZF8f8bEnh+Xv6U=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34--b7HhcRNPoyMpjbZXxyXQg-1; Tue, 15 Dec 2020 19:14:42 -0500
X-MC-Unique: -b7HhcRNPoyMpjbZXxyXQg-1
Received: by mail-oi1-f197.google.com with SMTP id n9so4619881oic.15
        for <linux-media@vger.kernel.org>; Tue, 15 Dec 2020 16:14:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=xRFUtbRbVHAPYmIqUZy/cSKapSSOng2O0tF1oLpP9Zk=;
        b=OkVxp3LLmP0rxAlYUoEmaNTEmikU8sTrI9sAMBbu3UNoOFf/L3KHHe9m855HrWCI6X
         7xPexTqnN4BB+MQllqnU1eC1nXcZAdPXNR12lwoB/TsF4rvgUPAo95UNTn6in+Pp3x9B
         3vHu3QEBP5u4J+MOZQo1bH9Y2xkEVW3LgvmQGXO80vsztYngvKM4SdhiDD868YLiYaXj
         NnVREzTKs+PLU1QXZ/y65NgCPJ+39rtFGAkO4SsXvawRrQPEXBel8QzKE8dPRbLE81ub
         S5I3+UkCvTLDGgwELaC2EBLx6t5BuEmPPIh+MboEM1rj3reKMfHETSmFnwokFsqDnMZd
         3W3A==
X-Gm-Message-State: AOAM532hjGLPUDP4OIlOpSnZYddz7rxTVR0L5m/FKsCBKWEr5LVB3ZVO
        lVkMTBkXW2J8DSIDqP7Er4veE+gPXGMJSFMu52r4hFvn1s2Sn7ageF/Dgh9pGW7vNuYWPbJbG3I
        Ji7GqPYPg7Lg5WfCHYZTmXhM=
X-Received: by 2002:aca:b707:: with SMTP id h7mr742923oif.46.1608077681678;
        Tue, 15 Dec 2020 16:14:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDeSqadY1k98PdlhcV2LTuTatlgnzMFiInq9cb7PnkSNMUJD3RfxUutcmT/C+V7IenHOiMoA==
X-Received: by 2002:aca:b707:: with SMTP id h7mr742917oif.46.1608077681492;
        Tue, 15 Dec 2020 16:14:41 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id j126sm33761oib.13.2020.12.15.16.14.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Dec 2020 16:14:40 -0800 (PST)
Subject: Re: [PATCH] [media] radio-si470x: remove h from printk format
 specifier
To:     Joe Perches <joe@perches.com>, hverkuil@xs4all.nl,
        mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201215213327.2091597-1-trix@redhat.com>
 <75eb199376d65f2c2b4c746ca9be8cfc9f774453.camel@perches.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <1fc711e8-93e8-0d30-9198-2b73eccbee4f@redhat.com>
Date:   Tue, 15 Dec 2020 16:14:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <75eb199376d65f2c2b4c746ca9be8cfc9f774453.camel@perches.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 12/15/20 2:07 PM, Joe Perches wrote:
> On Tue, 2020-12-15 at 13:33 -0800, trix@redhat.com wrote:
>> From: Tom Rix <trix@redhat.com>
>>
>> See Documentation/core-api/printk-formats.rst.
>>
>> commit cbacb5ab0aa0 ("docs: printk-formats: Stop encouraging use of unnecessary %h[xudi] and %hh[xudi]")
>>
>> Standard integer promotion is already done and %hx and %hhx is useless
>> so do not encourage the use of %hh[xudi] or %h[xudi].
> []
>> diff --git a/drivers/media/radio/si470x/radio-si470x-i2c.c b/drivers/media/radio/si470x/radio-si470x-i2c.c
> []
>> @@ -410,7 +410,7 @@ static int si470x_i2c_probe(struct i2c_client *client)
>>  			radio->registers[DEVICEID], radio->registers[SI_CHIPID]);
>>  	if ((radio->registers[SI_CHIPID] & SI_CHIPID_FIRMWARE) < RADIO_FW_VERSION) {
>>  		dev_warn(&client->dev,
>> -			"This driver is known to work with firmware version %hu,\n",
>> +			"This driver is known to work with firmware version %u,\n",
>>  			RADIO_FW_VERSION);
>>  		dev_warn(&client->dev,
>>  			"but the device has firmware version %hu.\n",
> Tom?  Do you know why your script missed this %hu?

Boooo..

I am making an assumption that there is only string.

Let me fix that and resend.

Thanks for catching the problem,

Tom

>
> btw: this would probably better as a single line something like:
>
> 		dev_warn(&client->dev,
> 			 "Firmware version: %u is older than known working version %u\n",
> 			 radio->registers[SI_CHIPID] & SI_CHIPID_FIRMWARE
> 			 RADIO_FW_VERSION);
>
> Also a few lines above is:
>
> 	dev_info(&client->dev, "DeviceID=0x%4.4hx ChipID=0x%4.4hx\n",
> 			radio->registers[DEVICEID], radio->registers[SI_CHIPID])
>
> and these %4.4hx uses are also not changed by this patch.
>
>

