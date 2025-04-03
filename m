Return-Path: <linux-media+bounces-29310-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 434F7A7A104
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 12:31:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E53B6175008
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 10:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E47C24BBE3;
	Thu,  3 Apr 2025 10:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I4lcTVrj"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3481F24A077
	for <linux-media@vger.kernel.org>; Thu,  3 Apr 2025 10:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743676237; cv=none; b=PRVxNHRKNGnw8WntzqoXAd1Ij07ooltmNm3L4u3cKhcTbWj/eqE+7qFhlIsVGkRs6eP/Dm8uzZx2qxCRVmS/cA75hbwJQqHPu5jJpXwOBgX7OFJOASykU0eTEJwDdWR7H524Vn6tx6yiwNRmnYLMyUQ6HH4/4GKALASGDIjoL4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743676237; c=relaxed/simple;
	bh=A87vsOTWwajVpMpg+2YlIUmnDa0Xqny7rCqOBEabA3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HDEJYBZeTy5KnOIHsXqcy3U1a3hHG6DTSGOxNRq0EzvpLWevsVknlzWMDDmaEndctJaO09E3S1FJTSMbzfMUcMN8ttkWu1dAl3uGKNiu/CeXGGfkBbP0WshD8kHcNoHIlpQoeKABVpRK+belyLNnGHQyW/IitfSpAI4x2IhhneE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I4lcTVrj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743676234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LFaZWVh1B/vDvD3uNAiTMuyF5FuhAhhXz9cWcRghqMA=;
	b=I4lcTVrjXKOqxUdaBuxB2ZQmDas7PIcml3r8KFwpO8PdzZYHkHYx6oqU7VVIYFvu6W+Tae
	xlYtqcjaNaszOIQFQwY2dRKQm4lwZzYPSrRvPdVqPnimPsTjsQX26Ec/1YSpXXRguxhBe9
	DoYbYp/H9utbfcfncT2NbqdAIhOEy+Q=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-66CfFoaRPaquTJK6jjQQsw-1; Thu, 03 Apr 2025 06:30:33 -0400
X-MC-Unique: 66CfFoaRPaquTJK6jjQQsw-1
X-Mimecast-MFC-AGG-ID: 66CfFoaRPaquTJK6jjQQsw_1743676232
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac79e4764e5so67194966b.0
        for <linux-media@vger.kernel.org>; Thu, 03 Apr 2025 03:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743676231; x=1744281031;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LFaZWVh1B/vDvD3uNAiTMuyF5FuhAhhXz9cWcRghqMA=;
        b=tMbQUIczf37uFNygT9/vMI2noinvOJFmNI/gMk68p8U0qZXt1w2YgZlNRp+00FQ5qA
         cdy4fP7bK/o3WuTwEUfojmC44JpuFRiIsLodvv7M5juS+oBAc+6SupvnmyuVwWcQ3yl3
         y1iDQauOc9BhujBMbmLNiyUGGugOabFU9R0mbf0qclhNAD/Y2ayrV6Joe51ztszLOCae
         Odf6TFU05IVbde3+w4gEMOYe5UUeQM0oWh6Q72ZpzRlUBUKi7x6Ahrb2MZjSSGq3dTZr
         t/iucN9OaDsKA02fb6ZQOa/Q3c8QoWZasaetsnFJhULlKS/jG2xUWyiSpvIdBa2mK1m0
         4AfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvMDBIwiWVHRGr5TQegpnE7V2QvIPAySH0e8TgBdekKyMcgFAYD1jZINJpcREsjVoSWvN4m0xP/s4Xyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdDFDZHO0V7hkohk8dXCJS+1w8BMS0Wr4oJx9S7eo4g+EdxNl7
	Xd7saC02PZQ3khUP0RScrOT17EJ05gvcnE9kWHvW9yF/+Q69/ohMqoVU27joW9wi3Gk1jZAg5W6
	ePlrSLS59/SHPkwY9srrMrbIMnn5Thzj1dHxriPBom1LU1VDF16KYUAWrphXT
X-Gm-Gg: ASbGncsl5D3dBtdt4NQV1UjHAQc2fvkq4xAq2ZlA0IXGBcTpaFjeAYNxHWjEe7MrRVi
	1PBTArNF5q+NK5E4/hzT/2+1Jth4DEBj9MgCmDLrrsyVXKop5SqdBUowSqrNdC0gTdzcyC01MUI
	O0TB6IKDDDeEKVmci8dhS7RoM1dVkrCL0drrFzU57wF+NUj0a82c9+thJ4rpb8SEHu7+01NZD1z
	pjuVPhdTwMq7yR3nQWk+slxGe6rQkyIfC55bNKZ07biiP3fzQWvWD1uau3YIngjuTyr3SxoUXrq
	NZp7YbZS5pYMA1AOxTQzbfA2RqSNSCMsM/5GhNf8BoejSUd6dPYp4ltTdc/qaRtNveI7P1vXr8x
	dmLPlxlsMG9393sKc9bg5PTl3DMfT27fXlpIqVBJ8itEoVhOPWidD9/6n++O90o6tCA==
X-Received: by 2002:a17:907:7f1e:b0:ac3:1763:cc32 with SMTP id a640c23a62f3a-ac7bc163c0dmr161837466b.29.1743676231586;
        Thu, 03 Apr 2025 03:30:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuBAWbDhtW7KpMViYt5p4FT5O6qTEpEmkj/cytsL8+dhwpGg2RUhlad8kpcnRLKbu7xJhkOQ==
X-Received: by 2002:a17:907:7f1e:b0:ac3:1763:cc32 with SMTP id a640c23a62f3a-ac7bc163c0dmr161834166b.29.1743676231141;
        Thu, 03 Apr 2025 03:30:31 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c0186aebsm70086066b.158.2025.04.03.03.30.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 03:30:30 -0700 (PDT)
Message-ID: <37de4bf2-c6c1-4d16-9f04-c0d9152dfe7b@redhat.com>
Date: Thu, 3 Apr 2025 12:30:29 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] platform/x86: int3472: Add handshake pin support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Dan Scally <djrscally@gmail.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Hao Yao <hao.yao@intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Duane <duanek@chorus.net>,
 platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
References: <20250402202510.432888-1-hdegoede@redhat.com>
 <CAHp75VfxjYQ=RzeYUWP7gu=xJ=f1gH=VGXz_cBRqBvkfSH02ow@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VfxjYQ=RzeYUWP7gu=xJ=f1gH=VGXz_cBRqBvkfSH02ow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

Thank you for all the reviews.

On 2-Apr-25 11:02 PM, Andy Shevchenko wrote:
> On Wed, Apr 2, 2025 at 11:25 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> New Intel Meteor Lake based laptops with IPU6 cameras have a new type 0x12
>> pin defined in the INT3472 sensor companion device which describes
>> the sensor's GPIOs.
>>
>> This pin is primarily used on designs with a Lattice FPGA chip which is
>> capable of running the sensor independently of the main CPU for features
>> like presence detection. This pin needs to be driven high to make the FPGA
>> run the power-on sequence of the sensor. After driving the pin high
>> the FPGA "firmware" needs 25ms to comlpete the power-on sequence.
>>
>> This series implements support for this by modelling the handshake GPIO
>> as a GPIO driven 'dvdd' regulator with an enable-time of 25 ms, also see:
>>
>> https://lore.kernel.org/platform-driver-x86/59f672c3-6d87-4ec7-9b7f-f44fe2cce934@redhat.com/
>>
>> Patch   1   Is an unrelated cleanup which I had lying around
>> Patches 2-7 Prepare + Implement the handshake GPIO
>> Patch   8   Is a small patch adding some extra debugging to GPIO remapping
> 
> You meant patch 9 here, right?
> 
> Offtopic: I sent you a message asking about AtomISP patch queue
> status, but no answer. I understand that you are kinda very busy,
> still it seems we missed one cycle for the patches you already have in
> your queue. I haven't investigated where the bottle neck happened,
> though. Hence just asking what's the plan with them and other patches
> that are already in the mailing list (I have received at least two
> that I was Cc'ed on).

Yeah, I've been burried in work a bit, so this fall through the cracks.

I've some more bandwidth now and I have a mailfolder with all
the pending atomisp patches in there. I plan to start merging these
soon and to send out an atomisp pull-request for 6.15 well in time.

Regards,

Hans




