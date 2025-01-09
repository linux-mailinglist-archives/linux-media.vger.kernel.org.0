Return-Path: <linux-media+bounces-24549-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EB6A0822E
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 22:23:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FEC71680D0
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 21:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F74204087;
	Thu,  9 Jan 2025 21:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GIr+OgL4"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44884A1A
	for <linux-media@vger.kernel.org>; Thu,  9 Jan 2025 21:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736457830; cv=none; b=JYhmNuDhiEgT5SPgWNWhVovfXldhuqAkH4xnvbfUOBkry6jt94Sv/kbDK0J/nSVlYOEZ8Byb/SqHDnmw3nFFJNp5ceFTlGPyYioIpkKowxHexVMvtFsi/jM6ZeqJw2K3O9cx76G/Aga47JPEH8BIGcTLjjDdLDsoHuNKMwxLLVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736457830; c=relaxed/simple;
	bh=RWAaUgohiji2RhgD7BbVT46yhJMrGHnDfEQs8/CfMVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R7ZUcwpTE2OKH4Ibs9Ah4oArGwwpErS0lv9e3QJLrAyo3EvQ7ZS3ebwnXlNE5lVOzUEdbY8EK+0Pb7V/Z8LJvlZNKwV/EVVjNmDj2ESvInGg97XgI+Ur72OUzTwdGZxcGrRbh0kuJEpsL33MHrYtY8cDFUNB0mEDdqTF1KoNRVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GIr+OgL4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736457828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GZ+K7el8ZB0U9G6uMZHe3jBVjK66rDwmVD5oNqEQuz4=;
	b=GIr+OgL4Y88dkMGEO6p+rtpljW6z7zuxd+FN0iefpWXmE0gPEbmN6I5Lsp/GWa99/PRB90
	t3IN9Oo9mfRDv3sH0YvJtnc4gsZEPRPWTNCfxgydYmC7+/PCEJiOv0ug46EODjP9cxTQfJ
	nhldtyhIvbc2/KRcnEbhMbY7QeAm0lU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-Yj3G94DjO5ufNq-8dUTQNQ-1; Thu, 09 Jan 2025 16:23:46 -0500
X-MC-Unique: Yj3G94DjO5ufNq-8dUTQNQ-1
X-Mimecast-MFC-AGG-ID: Yj3G94DjO5ufNq-8dUTQNQ
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-aa67f18cb95so134018166b.1
        for <linux-media@vger.kernel.org>; Thu, 09 Jan 2025 13:23:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736457825; x=1737062625;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GZ+K7el8ZB0U9G6uMZHe3jBVjK66rDwmVD5oNqEQuz4=;
        b=Cf0C0cyFC9AU94/hiHIO3rzmXwsYvnQWaeM6S1d0f+AgUop4e0Qn97KOI+I9IYf23p
         Kcy9F7ASPT8F1iP7U+btL+PSEIfcnItkWGpoKYVQZ6lrNzD0PPtQxyWkiatVCskl6o7t
         LY8656q5cSCWQSLFDQD6LmYVqJmZS0oqU2CmasoV7sRJLlzLUldjQ4hRc8rNpNVNL6uo
         /qQ8csZlVba5kVVBDpedBc5Gazz4YfRfanLZDR+fPUy+WRN3i2Lv2MZI0Zz5l3FKG8W1
         nbGsp7usF+JibICtiriIYRzTBf1qNU8WV4h0fJ59ZjNB1UY2gdK+ct3vGX4YG3Q+9K41
         t7uA==
X-Forwarded-Encrypted: i=1; AJvYcCXN/Bwd4fd2MQvjYtYUNjyZRVSjafMKs5q2JJAI/rAIspXth6IWx8EPzFV4GvolkH8rS6YmhZegw8Dkyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZk3NlcPLuMls64aaV5VN0ZqzQHkf88YtUZuZ9pAECBdP4zhSS
	8AXc1NByhQGqshxiXVthvKptHj59YcBs14DYubMmEpvjoOtqAwEy4J9twFnumrSZwvfnIUiH4NF
	T+EQMEQr0segAPIFJGnTS8kcanWAinDdRD16WbJxe/mY3kst5HyGsyR/HaQiB
X-Gm-Gg: ASbGnctUevOkEUZBSEJWQJkxGoojnxhC4R/VuhEe4VhwJRMaJEZPnNFDfcE7XIXUDZv
	47XI/+NnNEGI80Hxw+KapQEC21PVvH4vPcYzAaNkGNgZR0Ft7580Ey/sMdO1ViW1zEjvs4oD5Ie
	WFwLyPulIZGylaXZCWoQr0qeiXLE3ucmB/Zmwf5YewTBWxdKcFL/Rd/AQqPpcOaof6T7qPLsnrU
	0HL88tcwkLYcVTEfw2TYppSe0Qa5HxBaLd+Pke6fUpOcS9LuFf3Ajka68WsT7qupuRqPT6nD8/N
	WMOQiCVmiG2bLYEs1DgqXAmZhiH3hVHW0xalgyI39yKMJ8Chq4LQkSUzR7g5P7HugbecmB44cUh
	27WuoWLPdhib8KBr4jHFLqgtLwjeHka4=
X-Received: by 2002:a17:906:7950:b0:aa6:7933:8b2f with SMTP id a640c23a62f3a-ab2ab16a302mr361662766b.9.1736457824743;
        Thu, 09 Jan 2025 13:23:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZjTVvpTlqj+ITMDSP1DcjKTFSHGSzKklwAX+lgFsVWmr7N/LfE1npnjtO34XeljH2ORcKyA==
X-Received: by 2002:a17:906:7950:b0:aa6:7933:8b2f with SMTP id a640c23a62f3a-ab2ab16a302mr361660566b.9.1736457824323;
        Thu, 09 Jan 2025 13:23:44 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9649939sm104445966b.182.2025.01.09.13.23.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 13:23:42 -0800 (PST)
Message-ID: <d807cb98-40d0-41ea-8f7e-9ae51b05822f@redhat.com>
Date: Thu, 9 Jan 2025 22:23:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/10] media: ov08x40: Add missing
 ov08x40_identify_module() call on stream-start
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jason Chen <jason.z.chen@intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20241220144130.66765-1-hdegoede@redhat.com>
 <20241220144130.66765-9-hdegoede@redhat.com>
 <Z3_7TAXXUlqkUcwY@kekkonen.localdomain>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Z3_7TAXXUlqkUcwY@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9-Jan-25 5:37 PM, Sakari Ailus wrote:
> Hi Hans,
> 
> On Fri, Dec 20, 2024 at 03:41:28PM +0100, Hans de Goede wrote:
>> The driver might skip the ov08x40_identify_module() on probe() based on
>> the acpi_dev_state_d0() check done in probe().
>>
>> If the ov08x40_identify_module() call is skipped on probe() it should
>> be done on the first stream start. Add the missing call.
>>
>> Note ov08x40_identify_module() will only do something on its first call,
>> subsequent calls are no-ops.
>>
>> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> I'll add:
> 
> Fixes: b1a42fde6e07 ("media: ov08x40: Avoid sensor probing in D0 state")
> Cc: stable@vger.kernel.org

Sounds good, thank you.

That is when you say "I'll add", you mean you'll add those tags
while merging this series, right ?

Or do you want me to the tags in a v3 series?

Regards,

Hans





> 
>> ---
>>  drivers/media/i2c/ov08x40.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
>> index 39430528f54f..7d00740222c1 100644
>> --- a/drivers/media/i2c/ov08x40.c
>> +++ b/drivers/media/i2c/ov08x40.c
>> @@ -1973,6 +1973,10 @@ static int ov08x40_set_stream(struct v4l2_subdev *sd, int enable)
>>  		if (ret < 0)
>>  			goto err_unlock;
>>  
>> +		ret = ov08x40_identify_module(ov08x);
>> +		if (ret)
>> +			goto err_rpm_put;
>> +
>>  		/*
>>  		 * Apply default & customized values
>>  		 * and then start streaming.
> 


