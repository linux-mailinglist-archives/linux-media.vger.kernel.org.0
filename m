Return-Path: <linux-media+bounces-10865-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F328BCD82
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 14:11:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D06851F2373C
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 12:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06EBF143897;
	Mon,  6 May 2024 12:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hizm2dS6"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135F7143889
	for <linux-media@vger.kernel.org>; Mon,  6 May 2024 12:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714997474; cv=none; b=sPXpcQS+XigUEZyTMydELBRrxO2L89C5Z8wn56SVWbj0o2EVC/lA/LP1r0aDTwYn/rVpsio6YZq1DzO/+3J6FXXPalZZurv9jhdFzORdEW4Bk1tRdFwoSqLhaG6abLy6B0depiFLHXdm+cCsE5UGxn8Q8ny6abAWiBG6wzXQJ0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714997474; c=relaxed/simple;
	bh=hMaHou4gqCFuSSxSjTamh579wUtltQG2UlKG9gC+8FY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ns0kM8mo6HK1/9PCwvPz6Z0qo5L6YOA1f3oUWGbTmBJTjW6uhVAdv9LBwTW/hFhbjeZwzZ17fgbCpezut8kQuEPA2lC23lJaUOEDQXjf2fq8RLi0bhVuyNvheCfgLbqz+Qp8Tl3Z68K4vohUqGLSWqFbUCcRts1m/oXMVriwukA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hizm2dS6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714997472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WSfOAhrFUm53Kqin9+YfTRe0LHiAcFIiQAaaSKoiif8=;
	b=Hizm2dS6hKYoDQlDBdSDPIkBi55wp9uhmGe6AQne2GMVjCGxKJBhvMQK2fX7xC5lV3u8Ke
	EA3mGfJ+T0RH8AucaHl3Git8okk8+08KVqTn1dSQG0ZreayZmYmnKJPQn+3fCvMCw5OBsd
	hr7QuR0kJPOu+Cp6J4fE1n4W6CmDpxg=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-Ja5513xdOxinQ16phWRl_A-1; Mon, 06 May 2024 08:11:10 -0400
X-MC-Unique: Ja5513xdOxinQ16phWRl_A-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-51f0d924685so1787236e87.0
        for <linux-media@vger.kernel.org>; Mon, 06 May 2024 05:11:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714997469; x=1715602269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WSfOAhrFUm53Kqin9+YfTRe0LHiAcFIiQAaaSKoiif8=;
        b=gxexo8JL3a0PpQ9Xlvtin7JEf0/Gv0KTUMB6LAxpDt1TPUp4Eud30khXD40Ljq3WH0
         gVSLymglv9rBb8wlT1Crzvkf0kMuws/6k4sLl6fx8mL5iC81Ttz3yzIK6KVkxw1VCiwQ
         HLEHvLJWIFZece6d4raV5huwoykmn6S3HFQXVDAlELYN+PuRvWPaf7TN3gkDC8GVZGN1
         Id6v4phW5vKEki6SLNPD1mVAWdnq0a8hpgSYhVQVP5dWrg2KaggX9th+6q5sjy1o0Qkc
         G6p4Vt2xc1yhr8b3/Brc1zk+RW0+AbuL6sWIAVSLy2HeqSy9vgNzpqnkL0/Hv66pSu0p
         +zBw==
X-Forwarded-Encrypted: i=1; AJvYcCUMXrhlXlmJI/07mJnSq94lYf/5fDDnqI7CWeINy4nUAUrR6EmfRkqjGnym98wIa5fYVKCgrUNNArmAu4fD5TW000Ifjr5BCeTkAv8=
X-Gm-Message-State: AOJu0YzkLkt6ZQ52e7M1Huu0A7PtpMshe4hNRRhA+b7BzNg6+t/d2oFZ
	G7gT9afjCV0FS1a1i2iBLK9n2jFUrvAhOtX7S7XYIIQ0OTl8lHjzZ3utKwAkgUkM35p3faKihKY
	30UwqHL4c+jNSROnG34MS712rSHlv++PdnTAOmU83+UNjTYCSj5opk+YMkcpS
X-Received: by 2002:a05:6512:3f21:b0:51f:5d1a:b320 with SMTP id y33-20020a0565123f2100b0051f5d1ab320mr8765216lfa.68.1714997469277;
        Mon, 06 May 2024 05:11:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEp4bcHitMTSdTCl9aCNeXV3I621ghOgDSk6RE5J+9JJSbX/V6SpGWsuuHMuUKGZd320jEJ5A==
X-Received: by 2002:a05:6512:3f21:b0:51f:5d1a:b320 with SMTP id y33-20020a0565123f2100b0051f5d1ab320mr8765187lfa.68.1714997468807;
        Mon, 06 May 2024 05:11:08 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id l12-20020a1709066b8c00b00a59c0ecd559sm2003340ejr.112.2024.05.06.05.11.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 May 2024 05:11:08 -0700 (PDT)
Message-ID: <d0821bab-be2e-4476-82e8-8b363a951e50@redhat.com>
Date: Mon, 6 May 2024 14:11:07 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
To: Maxime Ripard <mripard@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Lennart Poettering <mzxreary@0pointer.de>,
 Robert Mader <robert.mader@collabora.com>,
 Sebastien Bacher <sebastien.bacher@canonical.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Milan Zamazal <mzamazal@redhat.com>,
 Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <20240506-dazzling-nippy-rhino-eabccd@houat>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240506-dazzling-nippy-rhino-eabccd@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Maxime,

On 5/6/24 2:05 PM, Maxime Ripard wrote:
> Hi,
> 
> On Mon, May 06, 2024 at 01:49:17PM GMT, Hans de Goede wrote:
>> Hi dma-buf maintainers, et.al.,
>>
>> Various people have been working on making complex/MIPI cameras work OOTB
>> with mainline Linux kernels and an opensource userspace stack.
>>
>> The generic solution adds a software ISP (for Debayering and 3A) to
>> libcamera. Libcamera's API guarantees that buffers handed to applications
>> using it are dma-bufs so that these can be passed to e.g. a video encoder.
>>
>> In order to meet this API guarantee the libcamera software ISP allocates
>> dma-bufs from userspace through one of the /dev/dma_heap/* heaps. For
>> the Fedora COPR repo for the PoC of this:
>> https://hansdegoede.dreamwidth.org/28153.html
> 
> For the record, we're also considering using them for ARM KMS devices,
> so it would be better if the solution wasn't only considering v4l2
> devices.
> 
>> I have added a simple udev rule to give physically present users access
>> to the dma_heap-s:
>>
>> KERNEL=="system", SUBSYSTEM=="dma_heap", TAG+="uaccess"
>>
>> (and on Rasperry Pi devices any users in the video group get access)
>>
>> This was just a quick fix for the PoC. Now that we are ready to move out
>> of the PoC phase and start actually integrating this into distributions
>> the question becomes if this is an acceptable solution; or if we need some
>> other way to deal with this ?
>>
>> Specifically the question is if this will have any negative security
>> implications? I can certainly see this being used to do some sort of
>> denial of service attack on the system (1). This is especially true for
>> the cma heap which generally speaking is a limited resource.
> 
> There's plenty of other ways to exhaust CMA, like allocating too much
> KMS or v4l2 buffers. I'm not sure we should consider dma-heaps
> differently than those if it's part of our threat model.

Ack.

>> But devices tagged for uaccess are only opened up to users who are 
>> physcially present behind the machine and those can just hit
>> the powerbutton, so I don't believe that any *on purpose* DOS is part of
>> the thread model. 
> 
> How would that work for headless devices?

The uaccess tag solution does not work for headless devices, but it
also should not hurt any headless scenarios.

Headless devices could use something like the video group solution
(dma_heap group?) which Raspberry Pi is using and them make sure that
any services which need access run as a user in that group.

This can co-exist with uaccess tags since those use ACLs not classic Unix
permissions.

Regards,

Hans



