Return-Path: <linux-media+bounces-30355-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AFDA90403
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 15:14:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C7018A13A4
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 13:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48FAA1BC07A;
	Wed, 16 Apr 2025 13:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VNbDxygC"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28A81B6D06
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 13:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809231; cv=none; b=VqTMU9lhNX/UvQiFXw9ht/MdVF8qvCkl0Ec6CON8F81uZRaF6zqzqKecdFnOJJSJmdD29zysVZPl1rPjYg3Fqz8cda37Zb3rrnoPdp9qt4rjQ9XzWlGaPlF9a1tbeb2yOBFujF5YT++4IQgU22Vq2mlu/CQ9AaSojqaikAR3S0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809231; c=relaxed/simple;
	bh=lmQ3ldP6CSiTlt7gNT7Czweqs9nShQBciErirXg2GpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Be/HxHHU/3oE/sqcCBfcEueiH/tO01HfAj+Ajg/Aso3cnCdCtT+poeM3F+jzhGmqCouEn1Loe22NDR9WpPDoFWjZHLqzyRyZVMtQ31HOJPljKQ+Zo/sFQydHDU8tYIEQJcvsZU5VVeLdMygIDdm3De7zAZmpXoNgTzTVFZTWMIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VNbDxygC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744809228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/f/vmYf/s2VSyVk3glayhF5GWaqEY9eUDhM5oTeVHKo=;
	b=VNbDxygCLB6qG7xNbOLuQc6eZFDShxgW1c8+024mwvIEerSh6vGqA1GCFvK/Ofwi1U1ava
	KmnBXXbNZnsHZ+LK6tPNanmVudHNWEY9zJjNYsQVx55g9AlCoBbUMMhEZzAMf+bdtgAvw7
	NDcvD2unIOqzChWxiLEyZZT7Rq85gp4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-hiiYNjvFNTqYMDqtIWwKsg-1; Wed, 16 Apr 2025 09:13:47 -0400
X-MC-Unique: hiiYNjvFNTqYMDqtIWwKsg-1
X-Mimecast-MFC-AGG-ID: hiiYNjvFNTqYMDqtIWwKsg_1744809226
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5e5c1bb6a23so756720a12.0
        for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 06:13:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744809226; x=1745414026;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/f/vmYf/s2VSyVk3glayhF5GWaqEY9eUDhM5oTeVHKo=;
        b=hAqKVmkEc4GFO289vxcZaRRmmKOFvgB1vDtTf5vyXpeE/8MWJYR+QsfjqRebfNxEzN
         RLETZJ4MtU3BZ8pEzB1ivi/ZBHrCsbV1P+U2GmRuQA/r+FgMv6qd7hIuWWN3NLY0UF2I
         7/M7BOC6IyZbiJQHuj03ciYhFM0G09ST6EvW9TAukHxXsz/TJRPuPSJUHDO3g3I5gvEg
         lzM7krgf8OJ2BZr1lVxd1/ABgTwXoSVFYUZFU3sPnVPfwBXhMMH2Nsm7bj2iqiKmDlIX
         SMoyktjsUX1ftLTCK4XJJ+VRVlUjp3umLKC95wDGczP4tvaWp0s6iaVvRiY7Me8Ajco1
         yU0A==
X-Forwarded-Encrypted: i=1; AJvYcCXqE5iVl5ZW9ayWtp7dgtbEhYYbkgjL5oL6bKv1hgNpJk5WAIHi9eECXI6OUoeWRwwHPoLfbHvMC0+JAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeHhvEWue7qja7c01StkxT/p7odXPDg8pTw8YFTo4yomaWihxV
	IcSjaeEIkWAEQOYsx9HCwtJwWkQfvNneLS+771OC/CLM3OCWIsyEU1pzR+BGCMIvLJ/tXsdTI0+
	r+zrfD4Iz/BGVSzXN64kK+J2USKvUC/em+AIsUc7xHRRLD4/y0kdFQKsrWz+q
X-Gm-Gg: ASbGnctzV+nYNvlCMYU2QiFrq2SowY/ypRA7z6/K78xsXd5Jp7aYlgLkJSOFj5YwRqZ
	Nnz2WsXU9nvlOcj6sYmGUvgVNT4zTGVf8jR5qyeLKvzsAizH+cc5h7nHOTmnq4X0NxdlBwY/5tL
	rjERON+egWU30lJ0VzGuJxKwNJwYWSqHSTQFcOCnbOORhWxtjU+UBgB3bbWUIhhmvrmCuy5WohK
	eWiN/7GCJg2a97poFU00wGwLze/EgkBMa771ueaWXWkUZJHyWEb58wctmp9UY7ueFkZowPb+peK
	lifDlNeA82me+49bN+LVuHoW+79AFrtlHFeT2IXRHd9bbpixrVunJ1M6akw+3sHJMHT4BDwrHg+
	EpQRhX/moJ+2whBs+EI77lVbA4DY87X78btrgWTbJnLdfcdcFIdLp3O0KtVQB8w==
X-Received: by 2002:a05:6402:34d6:b0:5e0:8a34:3b5c with SMTP id 4fb4d7f45d1cf-5f4b8195b45mr1422250a12.0.1744809226366;
        Wed, 16 Apr 2025 06:13:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3beiNBlh8dSqUfqg891F37XG78wGXh7xlDvWXrW5bC+SXcgNFeW0EHdb7CFeltdKYO7q5SQ==
X-Received: by 2002:a05:6402:34d6:b0:5e0:8a34:3b5c with SMTP id 4fb4d7f45d1cf-5f4b8195b45mr1422214a12.0.1744809225937;
        Wed, 16 Apr 2025 06:13:45 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f505728sm8711170a12.64.2025.04.16.06.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 06:13:45 -0700 (PDT)
Message-ID: <02ec820b-4f2f-492d-a9e8-b028adae7747@redhat.com>
Date: Wed, 16 Apr 2025 15:13:44 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] platform/x86: int3472: Add handshake pin support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Dan Scally <djrscally@gmail.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Hao Yao <hao.yao@intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Duane <duanek@chorus.net>,
 platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
References: <20250402202510.432888-1-hdegoede@redhat.com>
 <20250402202510.432888-9-hdegoede@redhat.com>
 <CAHp75VcJcPAEi2dhVnOL6Um78VEwT9DsvC+h20ZHZ0kdoPH--Q@mail.gmail.com>
 <cb7b67c0-e68c-408c-a0aa-c6a862590c52@redhat.com>
 <CAHp75Vfa6FHMx71tUqcXKxyOwdVCiRLiRp9Zs+-4Sj8CpyOTPA@mail.gmail.com>
 <CAHp75VdVbcMo+2ctJcax1t0Gp-eN=bycZFWPMzinmo_=Z1e_3w@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VdVbcMo+2ctJcax1t0Gp-eN=bycZFWPMzinmo_=Z1e_3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 16-Apr-25 3:09 PM, Andy Shevchenko wrote:
> On Wed, Apr 16, 2025 at 4:09 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>> On Wed, Apr 16, 2025 at 2:06 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>> On 2-Apr-25 10:56 PM, Andy Shevchenko wrote:
>>>> On Wed, Apr 2, 2025 at 11:25 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
> ...
> 
>>>>>                         if (ret)
>>>>>                                 err_msg = "Failed to map regulator to sensor\n";
>>>>>
>>>>> +                       break;
>>>>> +               case INT3472_GPIO_TYPE_HANDSHAKE:
>>>>> +                       /* Setups using a handshake pin need 25 ms enable delay */
>>>>> +                       ret = skl_int3472_register_regulator(int3472, gpio,
>>>>> +                                                            25 * USEC_PER_MSEC,
>>>>> +                                                            con_id, NULL);
>>>>> +                       if (ret)
>>>>> +                               err_msg = "Failed to map regulator to sensor\n";
>>>>
>>>> A copy and paste mistake? Yes, I know that they are both represented
>>>> as regulators, but don't we want a bit of uniqueness in the messages?
>>>
>>> I actually did this on purpose to allow the compiler to use a single string
>>> for these saving some space. The difference of which case we hit should be clear
>>> from the earlier printed (dbg) message printed above the switch-case.
>>
>> I understand the idea, but if debug messages are off, how do we know
>> that? Or err_msg here is also a debug leveled one?
> 
> FWIW, you may use "... %s ...", regulator->name (maybe, I haven't
> checked) or similar, so the format string is the same.

That is a good idea, since I've already send out v3, I'll do so for v4.

But first I'll give you some time to review the unreviewed / modified
patches in v3, so that v4 can hopefully be the last version.

Regards,

Hans



