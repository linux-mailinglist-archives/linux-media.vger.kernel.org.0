Return-Path: <linux-media+bounces-14526-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA60923BC5
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 12:48:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54BF01C23F89
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 10:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B79C1591E0;
	Tue,  2 Jul 2024 10:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lsya2XoA"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DC351004
	for <linux-media@vger.kernel.org>; Tue,  2 Jul 2024 10:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719917289; cv=none; b=Pt9ET+FyORfLTv+Z9LsEShfYldQsI9ldRTWEhHYdVFA0O/7LrgMokWQ1npWLWoqWeJ7aZaf4J8Px7eFoWKSYnLuY7jgY3NDFPAWTh2VlFbCT3zYuPZUtEqTZjYFjaM9aXs4NUlaOTh5nljeUoVprA2C1BEdj+wsFxcMqlmEyFJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719917289; c=relaxed/simple;
	bh=lmx62mmNzlzKSDmqFAsrE6aHOd8QVU/K+YKTTXWRB5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=katYiVjzBkaM1JHX1ixobAc84ik0uJiJrsAe2aQePpsw5wEF++NGqBqIMgHtmetnO8rhLFrMmdOr1+r8PIcwNo5ITsrrm4Px0YRy+GkrR6qOFl5/u9wYM77PJvJ2lT7OA9Jj58x1Azrcbe4/Z1s6xgyLQzUaKQFHV7rTmDTmq/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lsya2XoA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719917287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ddUEaynzSPdLAUSnF0X54jX92vwScTAP/nJccagtVuQ=;
	b=Lsya2XoAEarfhPdFErFEJYU5YpyP+rzOocN6sjixB6KqCXM6KXLFxePEKliiuKY4g1+zZZ
	7JLqyhlh/DFmGtCka05bEjU17wyzmx26vNyppZhVDIPdyw8/3BAsC1jLpHkrqaISo9AkOn
	J2ZC3SHtbgc3mMTv3a4gGPHBIuvZs4s=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-pJ0zwMiYOWqvY5mmXk29Ig-1; Tue, 02 Jul 2024 06:48:05 -0400
X-MC-Unique: pJ0zwMiYOWqvY5mmXk29Ig-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a729da8fbf1so642814566b.1
        for <linux-media@vger.kernel.org>; Tue, 02 Jul 2024 03:48:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719917284; x=1720522084;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ddUEaynzSPdLAUSnF0X54jX92vwScTAP/nJccagtVuQ=;
        b=xTGDAKrBXxvL/tmuiPGcTxTQ6NZX6UNaeeCTrAbzy6N0DM0FA6SJ3hnWLDZkO5Mu/E
         6cnQgduLdmaZe6uNM70s2rdUjFYpCP2ptos0ve5rA9ZsiU4F31nUcUM7iO0pKyZh8x70
         u/EvJkymQsnClL9wDT22YGolBQKcuhNqClsuwXVhLU/QH83GBhORXKPFcO/UNA1eFDK4
         kx7N4ng5l+xX9Dy7y7izOsHfIvxvy3NHmre7aFSuCfUNFblUpRiVv1kxuWZ4c4SA02UU
         A7HsxWjR217P+kZ1F6rnjYf45cx1C7EQFrCY5AZSV/BQlvTvjYqBnBQorRmDY6I24NsA
         wl3g==
X-Gm-Message-State: AOJu0YzNJj1B+V2trf5KKMzfnJYkJOoj3rlDyQeHRG8DhtG8edCj6yDu
	ZHHganz+9ddDCnsFy0lm5OptgVQd5UZzDqmvan27x7fmKv/01woHPAtVZ2txTxH9YPOxLvWVFwa
	U99G1FBGUA/Tficqas4BPNG20ZTY5+vq1rTii8BbZdI7UAV4QTSNfYTlTNZb4
X-Received: by 2002:a17:907:3da9:b0:a75:21d3:1f4d with SMTP id a640c23a62f3a-a7521d3206dmr548042466b.31.1719917284255;
        Tue, 02 Jul 2024 03:48:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEE9MGT5mfjPY4ZOeg9i4J0MDWtNu/bF0+BnklR5EGx7o+JjjoMwvIos8X+tp+XXuVLWJRdfQ==
X-Received: by 2002:a17:907:3da9:b0:a75:21d3:1f4d with SMTP id a640c23a62f3a-a7521d3206dmr547931666b.31.1719917254270;
        Tue, 02 Jul 2024 03:47:34 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58614d507d2sm5446929a12.64.2024.07.02.03.47.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 03:47:33 -0700 (PDT)
Message-ID: <bc52402d-8ebe-4096-9a8e-94fac8747bd7@redhat.com>
Date: Tue, 2 Jul 2024 12:47:33 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: atomisp: add missing MODULE_DESCRIPTION() macros
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20240610-md-drivers-staging-media-atomisp-i2c-v1-1-c7b63464fae5@quicinc.com>
 <be4544a3-ac67-4d4c-b00b-0e2e47a7522a@quicinc.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <be4544a3-ac67-4d4c-b00b-0e2e47a7522a@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jeff,

On 6/26/24 6:37 PM, Jeff Johnson wrote:
> On 6/10/2024 5:34 PM, Jeff Johnson wrote:
>> make allmodconfig && make W=1 C=1 reports:
>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/media/atomisp/i2c/atomisp-mt9m114.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.o
>>
>> Add the missing invocations of the MODULE_DESCRIPTION() macro.
>>
>> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>> ---
>>  drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c | 1 +
>>  drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c          | 1 +
>>  2 files changed, 2 insertions(+)
>>
>> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c b/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c
>> index 7a20d918a9d5..3499353f8ea5 100644
>> --- a/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c
>> +++ b/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c
>> @@ -207,4 +207,5 @@ module_init(init_msrlisthelper);
>>  module_exit(exit_msrlisthelper);
>>  
>>  MODULE_AUTHOR("Jukka Kaartinen <jukka.o.kaartinen@intel.com>");
>> +MODULE_DESCRIPTION("Helper library to load, parse and apply large register lists");
>>  MODULE_LICENSE("GPL");
>> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
>> index 23b1001c2a55..918ea4fa9f6b 100644
>> --- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
>> +++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
>> @@ -1614,4 +1614,5 @@ static struct i2c_driver mt9m114_driver = {
>>  module_i2c_driver(mt9m114_driver);
>>  
>>  MODULE_AUTHOR("Shuguang Gong <Shuguang.gong@intel.com>");
>> +MODULE_DESCRIPTION("Aptina mt9m114 sensor support module");
>>  MODULE_LICENSE("GPL");
>>
>> ---
>> base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
>> change-id: 20240610-md-drivers-staging-media-atomisp-i2c-18a7a4f883eb
>>
> 
> Following up to see if anything else is needed from me. Hoping to see this in
> linux-next so I can remove it from my tracking spreadsheet :)

This has already been merged in media-staging (the media's tree for-next)
by Hans Verkuil:

https://git.linuxtv.org/media_stage.git/log/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c

Regards,

Hans




