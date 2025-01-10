Return-Path: <linux-media+bounces-24576-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 142EBA08A93
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 09:43:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17B1516824A
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 08:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6CB32080D2;
	Fri, 10 Jan 2025 08:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XicTXnpU"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4F81FF7DA
	for <linux-media@vger.kernel.org>; Fri, 10 Jan 2025 08:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736498611; cv=none; b=jAXyvZj45Agb/FM+lD1xUVSDSwufjiVGKHpv6WYmylIa1OPaKi5bvoIOdf14GN2iAGSbbXNQT+DNaAuoEnY8ITDT3FUygsN7K2ONewwZhQTMn5hUpd4VtO3cjZ1hTNk3X1fc/Bai4f7H9HV/HnJ8OFfBYWh3ndE3GOqt9X6DTUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736498611; c=relaxed/simple;
	bh=iqwtiK1EmeVYnhW/GPUZXCaNlybXxMTGTh4U8LymXoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZK+GbDs2tt8zvno6UG2PBQiY/Y5sSM6ZnH2KUFBo1WKDPhZE0ya7gGrR22AHWvhtthLe4bpEMhwEIyowRk8lp91dVORTcMT5Bjayc1+2MO28o9hiy+n+5Q+JZztbe3r8cmrZGPgaIJ8oI+rt1ngDA6NXOmE4LF5Plp1NKRjh8dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XicTXnpU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736498608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AwAaHj3wboM7saLgRPOMXwNzjUQJ4+6ZmF7WbXVOs6U=;
	b=XicTXnpUvq0Ol5L+oN851a0MF10hNre68K2fkvVrXr4mDZqUypp8EOliC46C3TJ6eVk42l
	GrGy8mgtBSqx1ti+2n+U8IJwEm8q0BVB8o+1fWB2K0KvjEXSDLE4gxAu4/lf+kT2pXFLKW
	Mm3YGp3w67DE5rDGQim/5ARcJMFiY+Y=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-GUX1cZOlNySpmqxFo7pKcg-1; Fri, 10 Jan 2025 03:43:27 -0500
X-MC-Unique: GUX1cZOlNySpmqxFo7pKcg-1
X-Mimecast-MFC-AGG-ID: GUX1cZOlNySpmqxFo7pKcg
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5d40c0c728aso1434866a12.2
        for <linux-media@vger.kernel.org>; Fri, 10 Jan 2025 00:43:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736498606; x=1737103406;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AwAaHj3wboM7saLgRPOMXwNzjUQJ4+6ZmF7WbXVOs6U=;
        b=NsOr4rJwWtcXOPBFuYUtWrz8ha6ZlDcKH4vfGA5m4A86xUWCv0wJCIOKsy/coOfnNc
         a+QLw4/T/CgYdIP+5EAZUlQToPVy1N97SQrHPiAeJJhBV1S4u4FXCKq9ijK1kZGyVSb/
         q5OKaY4FcRRvQiX6GnocHlZcai2Z7dJdQig8HNAuvqClivFCKcSHsNi1582y71RfSKjy
         w3ndzRcy5H8vrgVqrkUG1Qw2wu53mBvU0DqCI0cqVU1wZGLzvj9JwJI8m2Ykuvbec/xm
         ZDLCAmJsZPB7OEFevPjIcHeuPq6Dg2eJzYY70mr35al5JTp4LBW+UN7ZOB9AfmfnwvtM
         6ilQ==
X-Forwarded-Encrypted: i=1; AJvYcCW084qMml/0NuAgXo9jW2lOVwr2H1RNMA6lSLP6RyRqXGXc4BAkJ10+DjNqXyRvGDveKCA8SeR79u+ESg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgNjQYl47hciKlSiAZ1mI1KiSwlXT2p2hO46nrI+1S0/uTXEA0
	A5nj9fT62nh6n2+Uvp2YK///8OEigpDhnuvh6rbeb5nf/ARn7+QTtQ6s7sP8uxZ5tdYbxTWWbO5
	qCbHu5my8uCZOdkBpoVH13dk8K4/gnJSj3o3gTZQ+h6z/EEtOf7QN6YzOK3Va
X-Gm-Gg: ASbGncvvSe46V0WJq4mho67m6ysWSEhvT74lYWxnhM731Q0CebIa49lbB+zKXaoV8or
	a/njDdxIYnzRCZKJLaUPm0YOwTI4UN1R9/MNVw0gTGyNEjiAiLSlVQSJOLFl3DrsB4KIMzLTnml
	ei+/thhHX4K/ikkWikEuhfHod8nlQRgOBuh9YH/ZhDO4nobAEiOGItho/mOq5rdjxrB32KViJ34
	X5DtoE9KLtcOM22dP4rpFRYDyn7NyXUTkVJONUmqZPh09ikit+bZWsNLYX3t4t9K6Ri2fhXpQ0z
	mihlK9GGdeDnGPYRTA+t+xBMfDwMl8jl37OzoB0xYQvNAfe1ZW+U7lb95XwDs+Ji87Eo9iviF9r
	HyB3eHoLeWuUZELNgVOkZulsn7svHibQ=
X-Received: by 2002:a05:6402:51c9:b0:5d3:ba42:e9e3 with SMTP id 4fb4d7f45d1cf-5d972e0e3a0mr24169524a12.13.1736498606142;
        Fri, 10 Jan 2025 00:43:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJfy1uYDkgSVxXWScIA/ARH2ydtjCcW90eq1J6W1kWSZUxtnEpeAeUnb6JfuPsSdp0Okmoeg==
X-Received: by 2002:a05:6402:51c9:b0:5d3:ba42:e9e3 with SMTP id 4fb4d7f45d1cf-5d972e0e3a0mr24169486a12.13.1736498605774;
        Fri, 10 Jan 2025 00:43:25 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95624e8sm143864566b.127.2025.01.10.00.43.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 00:43:25 -0800 (PST)
Message-ID: <a084ccf0-6b73-4e83-9310-59a618e82a28@redhat.com>
Date: Fri, 10 Jan 2025 09:43:24 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/10] media: ov08x40: Add missing
 ov08x40_identify_module() call on stream-start
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Jason Chen <jason.z.chen@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20241220144130.66765-1-hdegoede@redhat.com>
 <20241220144130.66765-9-hdegoede@redhat.com>
 <Z3_7TAXXUlqkUcwY@kekkonen.localdomain>
 <d807cb98-40d0-41ea-8f7e-9ae51b05822f@redhat.com>
 <Z4DKjLBGP_bZpHjq@kekkonen.localdomain>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Z4DKjLBGP_bZpHjq@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10-Jan-25 8:21 AM, Sakari Ailus wrote:
> Hi Hans,
> 
> On Thu, Jan 09, 2025 at 10:23:41PM +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 9-Jan-25 5:37 PM, Sakari Ailus wrote:
>>> Hi Hans,
>>>
>>> On Fri, Dec 20, 2024 at 03:41:28PM +0100, Hans de Goede wrote:
>>>> The driver might skip the ov08x40_identify_module() on probe() based on
>>>> the acpi_dev_state_d0() check done in probe().
>>>>
>>>> If the ov08x40_identify_module() call is skipped on probe() it should
>>>> be done on the first stream start. Add the missing call.
>>>>
>>>> Note ov08x40_identify_module() will only do something on its first call,
>>>> subsequent calls are no-ops.
>>>>
>>>> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>
>>> I'll add:
>>>
>>> Fixes: b1a42fde6e07 ("media: ov08x40: Avoid sensor probing in D0 state")
>>> Cc: stable@vger.kernel.org
>>
>> Sounds good, thank you.
>>
>> That is when you say "I'll add", you mean you'll add those tags
>> while merging this series, right ?
>>
>> Or do you want me to the tags in a v3 series?
> 
> No need for v3. Thanks!
> 
> Are there other patches not merged for the driver, besides this set? No?

Bryan was talking about a fix from him which also needs to be merged:

https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/f10539a3cbe5c072829b082683f0d1393a7e50dc

But I cannot find that in the lore archives.

Bryan, did you ever post that fix ?

Regards,

Hans



