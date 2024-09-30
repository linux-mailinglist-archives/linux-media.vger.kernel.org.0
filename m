Return-Path: <linux-media+bounces-18768-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B24D989CC2
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 10:28:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F88A283C68
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 08:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8022917839C;
	Mon, 30 Sep 2024 08:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dUxsQlhC"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1AB176AC5
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 08:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727684880; cv=none; b=Otb54F4wNLxvXnaSgEHk96lCLxI9omo1EONgHnFiQTDuA1uCPc0rlnGOqXUCiyuEkrtP/khTBxA6NoYhokVvR3NbDRdJcFzehkHbsHAU7tr/XmdNPZJjDAIg8wHacW7lnyRm6vLZgiQRngRRn/Nzuo3wPD+YrEb2xK8CrwJ9BVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727684880; c=relaxed/simple;
	bh=/KD4yic1tli4acL5VBbKB1+MQngCqbT0zGDn7ckq8Ig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cN7BJgYwSKO2gWNq/fGKjYfeuL27nEAyB5A+uX0hbN192Mje9V7GQd3w68HdvLH/T2uAwr/07ObaQP7U5JIabZzIv1h3zxUv41XWntuilxXzrl/72ala9oOkolf3eDaLZ84gUPXUiMQW+hri3gLr9yNs5ePMiVHu9MR/2D6YyGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dUxsQlhC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727684877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sDU+RimjAAL3vNJr/8wALHfm0p2c+7kTQQWyP5C3KLU=;
	b=dUxsQlhCynyC+4v+WfjPiKiswazxGxRLuL2OCBXiS+65Lz/bqQwqKV0jASCtQYQQ5LV0ky
	ORzXRoRAym+Na197eWsIXX3j9zmol9p/hnXs5mZWVniTqW2TMwdQulZbvx+19nQXr85x65
	vTG0Dq/A1fn+x3hS1pdRytOeY58l1m0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-LGpnI6khMUCMdEtOrae9UA-1; Mon, 30 Sep 2024 04:27:55 -0400
X-MC-Unique: LGpnI6khMUCMdEtOrae9UA-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5c87a33e5bfso4024198a12.2
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 01:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727684874; x=1728289674;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sDU+RimjAAL3vNJr/8wALHfm0p2c+7kTQQWyP5C3KLU=;
        b=AUFuvZBIPwRE0KT+Gy2qpQZQen8A35QmBhRZvzSFW6XX/rrx1GUv3KenbGXQqIXV5x
         KzmmptJXoadnvi0QssQEa5uhfD83fLPIZqlO/NvIp2AayRfwzgsH1s2SzZ/AtnQLYjzl
         eEpbVpZwFSTEUPkKYJH7dT/l0YM7myAn0gRqNORtKXTB5X+9+7cxljM4GkUyRYooOYrp
         ECQYuH8tFVsc9ss7UDkYiCH48odHMKI9+SafFctBA2ZzMVqPfshByYkfb4nBFCZQWHNj
         0MTaL4ILRHCGjXc7gEpzsda6qMS+WbtNXP6Epr6xb03+kYObtmmj3D8nRqNRil1P0pp1
         YQnQ==
X-Gm-Message-State: AOJu0YyecIbyZI6dbbgGt/JkFleQYePJVOdn6gnaTxw45GMcRJQyUxqN
	z9uWjqKzsxS2TyCL9vcgXe+dIa/d0U14NNau0eElGJP7z+WzBXe72dq8O6dJC2EkwpKmptsBNx1
	1bCkqAvH/QbeYYbU3j/0sCXHfOmtID0Gh8tR9jPIAXuxzP/+S69wd9ZHZRC4i
X-Received: by 2002:a17:906:dc92:b0:a93:c2b1:738f with SMTP id a640c23a62f3a-a93c4ab15ffmr1095638166b.64.1727684874217;
        Mon, 30 Sep 2024 01:27:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOA2SnqaGeHXSaIOulX3uQDWKXvptoCf9oRU/ysVfNevdX1YHCxCHWYLJbVMXdwwUmeF1lig==
X-Received: by 2002:a17:906:dc92:b0:a93:c2b1:738f with SMTP id a640c23a62f3a-a93c4ab15ffmr1095636966b.64.1727684873884;
        Mon, 30 Sep 2024 01:27:53 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2946f78sm493359966b.110.2024.09.30.01.27.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 01:27:52 -0700 (PDT)
Message-ID: <8062d702-9426-408e-b3e5-3a33d81d2927@redhat.com>
Date: Mon, 30 Sep 2024 10:27:51 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: atomisp: Use max() macros
To: David Laight <David.Laight@ACULAB.COM>,
 'Ricardo Ribalda' <ribalda@chromium.org>, Benoit Parrot <bparrot@ti.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andy@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
References: <20240927-cocci-6-12-v1-0-a318d4e6a19d@chromium.org>
 <20240927-cocci-6-12-v1-3-a318d4e6a19d@chromium.org>
 <c183afe8986d444a8e777ae0b9bb9189@AcuMS.aculab.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <c183afe8986d444a8e777ae0b9bb9189@AcuMS.aculab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 29-Sep-24 11:34 PM, David Laight wrote:
> From: Ricardo Ribalda
>> Sent: 27 September 2024 10:42
>>
>> The max() macro produce nicer code and also fixes the following cocci
>> errors:
>>
>> drivers/staging/media/atomisp/pci/sh_css_frac.h:40:17-18: WARNING opportunity for max()
>> drivers/staging/media/atomisp/pci/sh_css_frac.h:50:17-18: WARNING opportunity for max()
>>
>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>> ---
>>  drivers/staging/media/atomisp/pci/sh_css_frac.h | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/media/atomisp/pci/sh_css_frac.h
>> b/drivers/staging/media/atomisp/pci/sh_css_frac.h
>> index 8ba65161f7a9..9642506d2388 100644
>> --- a/drivers/staging/media/atomisp/pci/sh_css_frac.h
>> +++ b/drivers/staging/media/atomisp/pci/sh_css_frac.h
>> @@ -37,7 +37,7 @@ static inline int sDIGIT_FITTING(int v, int a, int b)
>>  	int fit_shift = sFRACTION_BITS_FITTING(a) - b;
>>
>>  	v >>= sSHIFT;
> 
> IIRC right shifts of signed values are undefined.
> (C does not require a cpu to have a right shift that replicates the
> sign bit.)
> 
>> -	v >>= fit_shift > 0 ? fit_shift : 0;
>> +	v >>= max(fit_shift, 0);
> 
> If the shift isn't done the return value is garbage.
> So the code better not let it happen.
> In which case you might as well let the cpu generate a (different)
> random value - so delete the conditional.

Given the history of this code I would no be surprised if some
weird corner case actually relies on the check, so NACK for
dropping the conditional.

> 
>>
>>  	return clamp_t(int, v, sISP_VAL_MIN, sISP_VAL_MAX);
> 
> all three values seem to be 'int' - so no need for the _t variant
> and all the associated casts.

sDIGIT_FITTING() originally was a macro with a bunch of max() + min()
calls nested leading to it expanding to a lot of code after running it
through the pre-processor. When converting this to a static online to
choice was made to with clamp_t() to avoid the overhead of the extra
type checks in regular clamp().

Regards,

Hans




> 
>>  }
>> @@ -47,7 +47,7 @@ static inline unsigned int uDIGIT_FITTING(unsigned int v, int a, int b)
>>  	int fit_shift = uFRACTION_BITS_FITTING(a) - b;
>>
>>  	v >>= uSHIFT;
>> -	v >>= fit_shift > 0 ? fit_shift : 0;
>> +	v >>= max(fit_shift, 0);
>>
>>  	return clamp_t(unsigned int, v, uISP_VAL_MIN, uISP_VAL_MAX);
> 
> as above, but it is just min(v, iISP_VAL_MAX)
> 
> 	David
> 
>>  }
>>
>> --
>> 2.46.1.824.gd892dcdcdd-goog
>>
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)


