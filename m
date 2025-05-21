Return-Path: <linux-media+bounces-33033-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF5FABF8F2
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 17:12:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E63A37B0713
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 15:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF3731E25F2;
	Wed, 21 May 2025 15:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ja8+gXFI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339451DEFFC;
	Wed, 21 May 2025 15:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747840338; cv=none; b=m+AMXp2c0RR9Cj2wdq5VfdQNGx/8Qi6kg+6+hE93MueHhOFFhOJ/Vi2FZPEqlS1F2Zl9WxF+QLK3b+A4DhpjIDmH57REVkULCd9DS9mTC6V9vyyDYcrlgHwvINxXKP+G4IM/GofOHmpTF2akFNHAZK/jdIVgvkai7/GajcyDRng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747840338; c=relaxed/simple;
	bh=lBxYD/sxdLohBQL8cWaUPlf5GpBoIKjD4XqJjlAAIHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y8QhN2Z+AtJxKIIwX21R+9czU2G/jg2J5PvBT9mLJrPesaAfneNZWchnaJKOHd3/BrLZ2VnoSO0Z9Z4Opmpuzhmd2TWGTjNyEJ7witJdOdOA/WptruvwKgFnHYzEp/hD18QlaOJnVPdAthKgLuR/lF2YhkXCbNI+bNB4YoQ09Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ja8+gXFI; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-551fe46934eso2099433e87.1;
        Wed, 21 May 2025 08:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747840334; x=1748445134; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=78yUaku+TH3kluaZNv1nUHa1ojNV1Bp7GzsWKhmIOkM=;
        b=Ja8+gXFIKawuDN9dhrBANBiWGT3QQ6v/aqKFGfEfz8fk0EhIVNwHGzSbf7010qHjA4
         Jb/O4iSa5kKjdZRhDcmYBHjlF78Jh+zB42QMXRLKnWW2nhX89+X6yDNjj2DZKKFRVRcs
         4Eg0iuhXwqRgBEVjOafuPkJ2M3CgBPqH/LLn2TuxLdaXwIg3MUVFDxR8Saf3P9buQQxc
         yAlc0WC7Mc8+x89SirQISyN9589z9DYiC0Jt2s9SayzjKkHReQUQhltmdrhpjnr93UbA
         cslnFNuK797F0EnTx4Q4WtVBT2kUCRgVplGKeEUBuwcMSfasbVH4GzuYpQynl6Kpim3/
         zGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747840334; x=1748445134;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=78yUaku+TH3kluaZNv1nUHa1ojNV1Bp7GzsWKhmIOkM=;
        b=T1mnq2JRLZUghIfcpIEJPGl5GAvh7rD+1OJYptyKY321brX3UmQyLsBGyymSYrHZxr
         SER4PpryWAXuP1F0fMY/lkc9y1ehTMZNxfgi/HoYpKKpWABsAonr97tz8Nc+OADrApb/
         ogaFjhWbJ+SrPc7IHXgMfLiOzorh2xd4QepFZLXXM5hPHrNb11UwTqGc9ayBe3Q/EAIY
         vYTTjbFGMEno3X5omrKFJ3HJAFZd07tY08sUrPqKEVHB/mXHgQegD+CY1+D7jaVQ+rD1
         DhtQRdBIXUDK+O9onE5oaL2xHDSr5hMdrUbT72AHWN2psHf9c0TBOh2TStPYHGQ2i08p
         TFsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnMBky76LvFIu/oyTg4g7YXC+o1H49LMloct7yHOnIOH7fl7r/bwGno87M6gdi4ej1ojOfYHLwax/r8x0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTjG/8S4+nK36XmzHkIwiWrpkTVMsFpig0VuUajjtaexsjQgqj
	7u7k4hdZcTOh2tlSxoz60sU7X1H7oZrAVSLifAFdvW4r7RaKbziTuju5
X-Gm-Gg: ASbGncsLSLARZG2XFKk3GFW2i+YD5Eoy21lI7JZcKm5p9SBAAQS3xC2Va9BSWwLGmtG
	aIqWPEuoamnQsaLeP7pkgllurouPh5i84BE06YL9ATWnFkANYZJzl3Gy4tFwjh0wuFA/KYbuN+N
	WLseMWvIsVxL91K7i7ZMo0etv/OlGjZDSlAARtst7hstVNL6IhAmI4GhD1296nBln2x4ibVGlCw
	7XhtQqQ6GnATgf6ILP5BspZLVJ5oYnevFCjYekFqSTeapjIS7hxifEw+D/CKPnJfgayuiW9reUj
	Ukl2DmlaIYDeqOPMmZ6pk5NKgEo+9bNg9O2DSPwoBLRLm7BlnirxCexFLFv4toJVpNgTdNHM7vL
	DYGwqCCno1y94FTh92+/qDm2McYYecN09fPKcY1BNJPHPs2/YotA64xIZGHJfDdiY+aMyO1QYt3
	cPTdLLvt2nWyOS
X-Google-Smtp-Source: AGHT+IE9nd0GLoOgLFJQSLE1qR86a3SC8JADuKGwq7KtdwEH8Z7iFSIf3vIA5YyerQWwhQK4eZ1fzQ==
X-Received: by 2002:a05:6512:2251:b0:54f:bc96:72dc with SMTP id 2adb3069b0e04-550e752d995mr7692943e87.26.1747840333818;
        Wed, 21 May 2025 08:12:13 -0700 (PDT)
Received: from ?IPV6:2001:14ba:53:1500:e8f4:97c2:d311:5b15? (2001-14ba-53-1500-e8f4-97c2-d311-5b15.rev.dnainternet.fi. [2001:14ba:53:1500:e8f4:97c2:d311:5b15])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7018123sm2871400e87.140.2025.05.21.08.12.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 08:12:13 -0700 (PDT)
Message-ID: <2099f0bf-fee7-4037-9e49-2b4bd8e507c8@gmail.com>
Date: Wed, 21 May 2025 18:12:11 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] docs: Improve grammar, formatting in Video4Linux
To: Jonathan Corbet <corbet@lwn.net>, mchehab@kernel.org,
 ribalda@chromium.org, hverkuil@xs4all.nl, hljunggr@cisco.com,
 dave.jiang@intel.com, jgg@ziepe.ca, saeedm@nvidia.com,
 Jonathan.Cameron@huawei.com, ilpo.jarvinen@linux.intel.com,
 mario.limonciello@amd.com, W_Armin@gmx.de, mpearson-lenovo@squebb.ca
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
References: <20250517132711.117618-1-hannelotta@gmail.com>
 <20250517132711.117618-2-hannelotta@gmail.com>
 <871psml4t7.fsf@trenco.lwn.net>
Content-Language: en-US
From: =?UTF-8?B?SGFubmUtTG90dGEgTcOkZW5ww6TDpA==?= <hannelotta@gmail.com>
In-Reply-To: <871psml4t7.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

On 5/18/25 11:08, Jonathan Corbet wrote:
> Thanks for working to improve our documentation!
> 
> Hanne-Lotta Mäenpää <hannelotta@gmail.com> writes:
> 
>> Fix typos, punctuation and improve grammar and formatting
>> in documentation for Video4Linux (V4L).
>>
>> Signed-off-by: Hanne-Lotta Mäenpää <hannelotta@gmail.com>
>> ---
>>   .../userspace-api/media/v4l/biblio.rst        |  8 ++---
>>   .../media/v4l/dev-sliced-vbi.rst              |  4 +--
>>   .../media/v4l/ext-ctrls-fm-rx.rst             | 15 ++++------
>>   .../media/v4l/ext-ctrls-fm-tx.rst             | 29 +++++++------------
>>   .../media/v4l/pixfmt-srggb12p.rst             |  4 +--
>>   .../media/v4l/pixfmt-srggb14p.rst             |  2 +-
>>   6 files changed, 25 insertions(+), 37 deletions(-)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/biblio.rst b/Documentation/userspace-api/media/v4l/biblio.rst
>> index 35674eeae20d..c3f7c466e287 100644
>> --- a/Documentation/userspace-api/media/v4l/biblio.rst
>> +++ b/Documentation/userspace-api/media/v4l/biblio.rst
>> @@ -53,7 +53,7 @@ ISO 13818-1
>>   
>>   :title:     ITU-T Rec. H.222.0 | ISO/IEC 13818-1 "Information technology --- Generic coding of moving pictures and associated audio information: Systems"
>>   
>> -:author:    International Telecommunication Union (http://www.itu.ch), International Organisation for Standardisation (http://www.iso.ch)
>> +:author:    International Telecommunication Union (http://www.itu.ch), International Organization for Standardization (http://www.iso.ch)
> 
> Please do not "fix" the use of either British or American spellings;
> both are explicitly just fine for kernel docs.

Okay, good to know. The ISO name is spelled in two different ways on 
this documentation page:

https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/biblio.html

Making them consistent with the official English spelling, which is 
mentioned on ISO's website, was my reason to change this.

At any rate, I can leave this change out of the patch.

> 
>>   .. _mpeg2part2:
>>   
>> @@ -63,7 +63,7 @@ ISO 13818-2
>>   
>>   :title:     ITU-T Rec. H.262 | ISO/IEC 13818-2 "Information technology --- Generic coding of moving pictures and associated audio information: Video"
>>   
>> -:author:    International Telecommunication Union (http://www.itu.ch), International Organisation for Standardisation (http://www.iso.ch)
>> +:author:    International Telecommunication Union (http://www.itu.ch), International Organization for Standardization (http://www.iso.ch)
>>   
>>   .. _itu470:
>>   
>> @@ -131,7 +131,7 @@ ITU H.265/HEVC
>>   
>>   :title:     ITU-T Rec. H.265 | ISO/IEC 23008-2 "High Efficiency Video Coding"
>>   
>> -:author:    International Telecommunication Union (http://www.itu.ch), International Organisation for Standardisation (http://www.iso.ch)
>> +:author:    International Telecommunication Union (http://www.itu.ch), International Organization for Standardization (http://www.iso.ch)
>>   
>>   .. _jfif:
>>   
>> @@ -150,7 +150,7 @@ ITU-T.81
>>   ========
>>   
>>   
>> -:title:     ITU-T Recommendation T.81 "Information Technology --- Digital Compression and Coding of Continous-Tone Still Images --- Requirements and Guidelines"
>> +:title:     ITU-T Recommendation T.81 "Information Technology --- Digital Compression and Coding of Continuous-Tone Still Images --- Requirements and Guidelines"
>>   
>>   :author:    International Telecommunication Union (http://www.itu.int)
>>   
>> diff --git a/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst b/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
>> index 42cdb0a9f786..96e0e85a822c 100644
>> --- a/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
>> +++ b/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
>> @@ -48,7 +48,7 @@ capabilities, and they may support :ref:`control` ioctls.
>>   The :ref:`video standard <standard>` ioctls provide information vital
>>   to program a sliced VBI device, therefore must be supported.
>>   
>> -.. _sliced-vbi-format-negotitation:
>> +.. _sliced-vbi-format-negotiation:
>>   
>>   Sliced VBI Format Negotiation
>>   =============================
>> @@ -377,7 +377,7 @@ Sliced VBI Data in MPEG Streams
>>   
>>   If a device can produce an MPEG output stream, it may be capable of
>>   providing
>> -:ref:`negotiated sliced VBI services <sliced-vbi-format-negotitation>`
>> +:ref:`negotiated sliced VBI services <sliced-vbi-format-negotiation>`
>>   as data embedded in the MPEG stream. Users or applications control this
>>   sliced VBI data insertion with the
>>   :ref:`V4L2_CID_MPEG_STREAM_VBI_FMT <v4l2-mpeg-stream-vbi-fmt>`
>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-fm-rx.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-fm-rx.rst
>> index b6cfc0e823d2..565157709911 100644
>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-fm-rx.rst
>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-fm-rx.rst
>> @@ -35,7 +35,7 @@ FM_RX Control IDs
>>       description of the correct character encoding for Programme Service
>>       name strings. Also from RDS specification, PS is usually a single
>>       eight character text. However, it is also possible to find receivers
>> -    which can scroll strings sized as 8 x N characters. So, this control
>> +    which can scroll strings sized as 8 x N characters. Therefore this control
> 
> This kind of change just seems like churn that isn't really improving
> the content?

The content is good already. Here, it is a bit more formal to use the 
word therefore, since this is technical documentation, and the word so
is considered more appropriate for informal contexts.

I can leave this change out of the patch series.

> 
>>       must be configured with steps of 8 characters. The result is it must
>>       always contain a string with size multiple of 8.
>>   
>> @@ -49,7 +49,7 @@ FM_RX Control IDs
>>       Radio Text strings depends on which RDS Block is being used to
>>       transmit it, either 32 (2A block) or 64 (2B block). However, it is
>>       also possible to find receivers which can scroll strings sized as 32
>> -    x N or 64 x N characters. So, this control must be configured with
>> +    x N or 64 x N characters. Therefore this control must be configured with
>>       steps of 32 or 64 characters. The result is it must always contain a
>>       string with size multiple of 32 or 64.
>>   
>> @@ -64,17 +64,12 @@ FM_RX Control IDs
>>       broadcasts speech. If the transmitter doesn't make this distinction,
>>       then it will be set.
>>   
>> -``V4L2_CID_TUNE_DEEMPHASIS``
>> -    (enum)
>> -
>> -enum v4l2_deemphasis -
>> +``V4L2_CID_TUNE_DEEMPHASIS (enum)``
>>       Configures the de-emphasis value for reception. A de-emphasis filter
>>       is applied to the broadcast to accentuate the high audio
>>       frequencies. Depending on the region, a time constant of either 50
>> -    or 75 useconds is used. The enum v4l2_deemphasis defines possible
>> -    values for de-emphasis. Here they are:
>> -
>> -
>> +    or 75 microseconds is used. The enum v4l2_deemphasis defines possible
>> +    values for de-emphasis. They are:
>>   
>>   .. flat-table::
>>       :header-rows:  0
>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-fm-tx.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-fm-tx.rst
>> index 04c997c9a4c3..aa509039bd27 100644
>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-fm-tx.rst
>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-fm-tx.rst
>> @@ -41,7 +41,7 @@ FM_TX Control IDs
>>       description of the correct character encoding for Programme Service
>>       name strings. Also from RDS specification, PS is usually a single
>>       eight character text. However, it is also possible to find receivers
>> -    which can scroll strings sized as 8 x N characters. So, this control
>> +    which can scroll strings sized as 8 x N characters. Therefore this control
>>       must be configured with steps of 8 characters. The result is it must
>>       always contain a string with size multiple of 8.
>>   
>> @@ -55,7 +55,7 @@ FM_TX Control IDs
>>       E of :ref:`iec62106`. The length of Radio Text strings depends on
>>       which RDS Block is being used to transmit it, either 32 (2A block)
>>       or 64 (2B block). However, it is also possible to find receivers
>> -    which can scroll strings sized as 32 x N or 64 x N characters. So,
>> +    which can scroll strings sized as 32 x N or 64 x N characters. Therefore
>>       this control must be configured with steps of 32 or 64 characters.
>>       The result is it must always contain a string with size multiple of
>>       32 or 64.
>> @@ -94,8 +94,8 @@ FM_TX Control IDs
>>   
>>   ``V4L2_CID_RDS_TX_ALT_FREQS (__u32 array)``
>>       The alternate frequencies in kHz units. The RDS standard allows for
>> -    up to 25 frequencies to be defined. Drivers may support fewer
>> -    frequencies so check the array size.
>> +    up to 25 frequencies to be defined. Because drivers may support fewer
>> +    frequencies, check the array size.
> 
> Here too, I'm not sure I see the value in this kind of change.

Similar reason here regarding formal wording.

Again, I can send in a version 2 without this change.

> 
> Thanks,
> 
> jon

Thank you for reviewing so quickly!

Best regards,

Hanne-Lotta Mäenpää


