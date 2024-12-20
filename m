Return-Path: <linux-media+bounces-23915-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEA59F93E6
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 15:05:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7DAF188FBC0
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 13:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F7F215786;
	Fri, 20 Dec 2024 13:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NL4T5tNa"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125E3CA4E
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 13:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734703173; cv=none; b=DnmgkjhUermaN/wqvHjlUHsyNgRFAziQNpW0aqo6NHkxY/gv+7RWauW741bjTmsKwYiNwtZVN5ypISB1qjD0tgqVx48Mp5drcbQQljGbG2HiQY4iqimETLWCrBUpVvODq249WBzHLNwO5ctbasWAKfd7bXbmfqhvveX07Wqq64I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734703173; c=relaxed/simple;
	bh=IQ1zYWzD8ojNXDAfGPNgT0HxV2LiKkKqGEIVVIbxVdM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G2hlXD5XNunCh5n63FHpGRi3cO8MkerAGXVD/RNiFszIvwgww7i3LKW6StYQQkVNNgoA8zg2HgL38gFY1Gv44Drt6X1LUKbjZU/8wIOdGZT3LWMsv8JRbTMvdzV/N7wMHRJZWMYZdbc4FeMpCcxH2Y0H1mfNX7J5P++dqL/70Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NL4T5tNa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734703171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+na884uw6ILndissaBBLvQa8n6oluS8w/DpajI232e4=;
	b=NL4T5tNaycEbk+rIfi0H9hJYQed4hey2DV2cKJbUSRkI1HVHgHtj6UxJwzMQ5Ffwji0nHT
	jc2GpM9lLvG8UQ5y+NNP+JRS2aStfg9v4R2JZG7vTR0SkS1cRn/XKVE7L7YI30TpPM8Q7F
	APsUJaxWi6S+DAxa9Cp4Jl0O+1/TCBM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-janUSvqFPaCS4O2suCWqLg-1; Fri, 20 Dec 2024 08:59:29 -0500
X-MC-Unique: janUSvqFPaCS4O2suCWqLg-1
X-Mimecast-MFC-AGG-ID: janUSvqFPaCS4O2suCWqLg
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-aa68fd5393cso37158466b.0
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 05:59:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734703168; x=1735307968;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+na884uw6ILndissaBBLvQa8n6oluS8w/DpajI232e4=;
        b=mpB1x5HXeDMoeajfIcnVYgwPQ7KJjWzhK/etOCiCTB8m6AJ1gBJpVH+eeWZIpyfGFr
         Z5RRTyvrju2sbWs/FKuLzP627vWpZrB3napSHGLRl+aBFuVrgSVsfl4bKxFoYsL9UWmH
         WKJRSKK+MGNVfYLwNksj/u0tzsvJ+s/KXwbhCsNrDPvUhCq2q7gDZ3unGv27dlJHcs/0
         wzH1Mz+kaZjhUOa182NMqEOMQkHHrZXRW4g24i20hQqwrKupw0LMesxqW2FhzP9+19tb
         oJG7eFdFMSJjmZL5N1z4ms46lrIrpLW4ossI98qXIMzFkXk0n1R8yuRIKB4sduhJIz2H
         khkw==
X-Forwarded-Encrypted: i=1; AJvYcCWm++kHewklFde10pmwZTDWmNX2F1T0k7cwrssbcLCadWVwbRQAOLho2VEJ8ViGwPfjHSIitsf+GNf8bQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YysW3YPIRoZ05CiCJlQWFhjykzsN1vKBy7+x/en/jUHKYek3jXi
	cqSekD+lHhY/UniIIOJQeBEwjnrHZfO1bnjImitj5+Tse58qpegy7hCBckpVSj8jpFhvuq/KZRU
	C8EQ4YFoHMvJ/ynhe3dl7V93GS+pN5vS4ZOWuNshGcp2Yzki1ttIjJDpFUznM
X-Gm-Gg: ASbGncs1Pi1zc90DOzBYO8C6PJOvtUxLrje4knCDRNk2IJdH+6QQFPZ9p2SWbhg5HWg
	I8xgwRn/0+altXi6x1r2apZ2z8ON/A9LzxzXOdqx0/KEh2Hmjdiz08vXe4nYwLCXV2JRoHjbdIu
	NSkBKOj0bM12fp+8ImhpFWACiAvgTKdprNILDggsi9n95oE3IoUv+1tAhCJt+VcN5EXVVdInwFR
	7heYgXrHjGTdmI1et430CqRP6trlcDjLgtWYxY52GQvzv0lWV5LH+3fPJeQX8/6ipgk8Owm99K7
	wqKYkNPSv2m7ONlt8j4Tr1T6XluhyUk+rilnIs0gHxX5XrrhNuml/6kJl36piGraqbTlO6DAYS+
	FbwBAd++Mf7qrWk93X7nSnVT9fTe/bVA=
X-Received: by 2002:a17:907:3f0f:b0:aa6:8b4a:4695 with SMTP id a640c23a62f3a-aac349d32eamr240684966b.31.1734703168299;
        Fri, 20 Dec 2024 05:59:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9d6RToFHHj2R3ADWoXU/nSA1Achj6c0Ye/xp38OBL2lclnQsNc+5cE8CHcVzBGGMWpd3JUA==
X-Received: by 2002:a17:907:3f0f:b0:aa6:8b4a:4695 with SMTP id a640c23a62f3a-aac349d32eamr240683466b.31.1734703167949;
        Fri, 20 Dec 2024 05:59:27 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e894f2esm181681366b.69.2024.12.20.05.59.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 05:59:27 -0800 (PST)
Message-ID: <a2fd753f-a999-4d17-b799-be4a6ece7bea@redhat.com>
Date: Fri, 20 Dec 2024 14:59:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] media: ov08x40: Properly turn sensor on/off when
 runtime-suspended
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jason Chen <jason.z.chen@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20241219134940.15472-1-hdegoede@redhat.com>
 <20241219134940.15472-2-hdegoede@redhat.com>
 <a2efc7e7-6e73-41b0-b8df-ae28175d7dda@linaro.org>
 <e3573352-f73e-43f5-8e21-6c313dc54057@redhat.com>
 <c9f237bc-40c6-4b41-a963-abac306458bd@linaro.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <c9f237bc-40c6-4b41-a963-abac306458bd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 20-Dec-24 2:51 PM, Bryan O'Donoghue wrote:
> On 20/12/2024 13:47, Hans de Goede wrote:
>>>>    }
>>>>    +static DEFINE_RUNTIME_DEV_PM_OPS(ov08x40_pm_ops, ov08x40_power_on,
>>>> +                 ov08x40_power_off, NULL);
>>>> +
>> Ugh I have on/off swapped here, second argument of the macro is the suspend
>> function so that should be ov08x40_power_off. IOW this should be:
>>
>> static DEFINE_RUNTIME_DEV_PM_OPS(ov08x40_pm_ops, ov08x40_power_off,
>>                  ov08x40_power_on, NULL);
>>
>> Can you give this a try with that change?
>>
>> Regards,
>>
>> Hans
> 
> Heh.
> 
> That'd do it, works now.

Great, thank you for testing!

This probably also explains why this series did not help to get the sensor
powered on on some x86 HP laptops...

I guess you are going to test the rest of the series and then provided
a Tested-by?

If yes then I'll wait with posting v2 until you're done testing.

Regards,

Hans




