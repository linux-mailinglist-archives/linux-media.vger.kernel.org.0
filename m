Return-Path: <linux-media+bounces-32036-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87013AAFC2A
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 15:56:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C37C3BA58B
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 13:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CA8622D793;
	Thu,  8 May 2025 13:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cjYb4tRx"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD1722A7E8
	for <linux-media@vger.kernel.org>; Thu,  8 May 2025 13:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746712606; cv=none; b=BMSr/tymMC8ZBeRzgj/+6eeVSTmBLmJhySLLjrIFrjXmLeRQZ8Af9fSuSHpyGC5gtH8kNkaFyb7PVbmLejo1cdj5e608+W6kjDG4T7SYQT7vW77rpQFaWTRUbB6XYeEyQoIbDBFzvkmSvR3Ru3Q5dik/ubgaUXZwucULhsOHuo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746712606; c=relaxed/simple;
	bh=c6C0IDh8jGfLHYAmrhCgs46oNWjgnTtyZ8KVsxZOoT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LHai0TqboktyQG5glPpWRNfijx1DFSIPLC5QK6fTFgs1htHxtNycZ0pbiPjo8jhhzNncjBuDQrMP7FM5MRYbwK8X3ZEkvfTnKFR83VwoLfsjKvGXnRPoH5WmcDcfMlYijDFgv+u0hqJGSsZzopivRhWKaSIzG6zX/626fyErark=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cjYb4tRx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746712604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4T8aqjWnvUph2fimAuP0M4LAoZzE8Kq74Pp22qiTivI=;
	b=cjYb4tRxQ39lG7WnJY0VcN3C3IwaAHpH4UaAGRNVLYN8mylRw5u2LEfG3Sx1XwQ9faIgRc
	dtqM5WA0cJz7T1ARkr7Jv7eQ/TTARPDADmkSv0MH7UPFufiT4gt4nA/4yBiHct5YlXPu3j
	iEa6UskiaQ+7vChcHIgNMuZZayx8fTs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-417-JCPWBDKzOu-NdGaNkPwihA-1; Thu, 08 May 2025 09:56:42 -0400
X-MC-Unique: JCPWBDKzOu-NdGaNkPwihA-1
X-Mimecast-MFC-AGG-ID: JCPWBDKzOu-NdGaNkPwihA_1746712602
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-acb8f9f58ebso81265666b.2
        for <linux-media@vger.kernel.org>; Thu, 08 May 2025 06:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746712601; x=1747317401;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4T8aqjWnvUph2fimAuP0M4LAoZzE8Kq74Pp22qiTivI=;
        b=G2I1636uOfzteIEnEzl4s+PZ1DQcUr+ESakGM0kaDdIkzjB/gs5ktrXxbTPlrh94xF
         bSWzIk6dHDdzBbarNlD4xSeyUmn2YD2nGTRd0SBEydyRKw67sZ9U+tQBDp47A5msTRcN
         wBHdoZWbXmIDK3qD/8O5KZNI8EeQiAZSBWwENnNByvTX4zMJXzAAMAbvyeXl5VrFiYHb
         u+QR8nuLNwJuWDsjmmtlXg3GJY3HUBvZV6n+i4P/6hTXAx8kGMdY9URduwHpYRt8RwkA
         VF8s5HfmUeG7fnX/jsu3y6FTn864rYZm9o7j6qD20kkObV63q4mg+TJ12KuC7yO6f84b
         T82A==
X-Forwarded-Encrypted: i=1; AJvYcCW5HcvdBc0rb6Fvib0TNu2O7UEye7nvWlbmVT4+5unNFDSc8sGyDKn1+uEGQ593vjvmnems7LWv3qLafw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAPvUFkTndNPJRPuaIiHT3gJh1p78xF26NzyJDoC9/sj3p1sBr
	+2FjG5qoEe+C3IAtXtY8pekWbMnn5vxVmyAy3JLdLnBOZeZhBYEk/diu09qVe7f1/38QFy1mItN
	/KkZRFYbuI7SGnoNF+XMjk6cLnbBN+qPmF+Z5ODqZh9pP0/AWxMmEyrIJw86O
X-Gm-Gg: ASbGncvAI6ZnLHvsiTOrzrxg1T+r8sPnKKm9J1Ko2LEfhsGeRTed8wkB7GhGP5FMToO
	lh854vQ6My64r8rK21OYrHPOF8Dm9JM/lWWRXkIxk7u7p3bCuS/Qi8/FXxHhHKYPmEjmv62XJ8N
	Nr6d8efcym/vYpjnLyllLmZ/NLdec+3fM0NUphUDIgFq39Bg7t917jNPBKBZPvWo+O+5mjlAz7M
	8OMEIqxywrR6XMgbKPmhJJ3k+qEqOd+WQjHRJlBsx2qAlHoCTApD1i/kR9M+182+AFYvuR7f6Q+
	zwVDblPvQag6tK4gQ0l1J9ZF/ZedcaRwmpLE7A39V9zCTBcOW6gF/x866UJybK5Lp4M+lzDubiW
	qXpz0SFRFh4Wpmdap0RnaXWcU7387uod8N3Bp10gp+Qz/OAR314w+rFSn4TMRLA==
X-Received: by 2002:a17:907:181a:b0:acb:9769:364c with SMTP id a640c23a62f3a-ad1fe6c087fmr295870266b.21.1746712601580;
        Thu, 08 May 2025 06:56:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHONZfcA79C9YJCxJXm9PYVFvyZiVs0xzW0M3ZiHJd3VPv1yoYEcXa7Qpf6U9oWkZRVxppOhg==
X-Received: by 2002:a17:907:181a:b0:acb:9769:364c with SMTP id a640c23a62f3a-ad1fe6c087fmr295867766b.21.1746712601203;
        Thu, 08 May 2025 06:56:41 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189146d4dsm1096324666b.15.2025.05.08.06.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 06:56:40 -0700 (PDT)
Message-ID: <f8a321cc-2545-4048-a257-56c3c5dd03b3@redhat.com>
Date: Thu, 8 May 2025 15:56:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] media: atomisp: Switch to int3472 driver sensor GPIO
 mapping code
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Andy Shevchenko <andy@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 platform-driver-x86@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20250507184737.154747-1-hdegoede@redhat.com>
 <20250507184737.154747-7-hdegoede@redhat.com>
 <CAHp75Vc0UZOXbfhjeq1XCAwt-2SX-SGOYomHhEfvx5HuXaxf1g@mail.gmail.com>
 <6d5a5cc2-a7b1-4032-82cd-0250f345dca9@redhat.com>
 <a8a6257d-854f-62c2-dd63-c3d2cbab31a5@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <a8a6257d-854f-62c2-dd63-c3d2cbab31a5@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 8-May-25 3:48 PM, Ilpo Järvinen wrote:
> On Thu, 8 May 2025, Hans de Goede wrote:
>> On 8-May-25 10:34 AM, Andy Shevchenko wrote:
>>> On Wed, May 7, 2025 at 9:48 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> Replace the duplicate code for calling the special Intel camera sensor GPIO
>>>> type _DSM (79234640-9e10-4fea-a5c1-b5aa8b19756f) and mapping GPIOs to
>>>> the sensor with a call to int3472_discrete_parse_crs() from the int3472
>>>> driver.
>>>>
>>>> Besides avoiding code duplication the int3472 version of the code also
>>>> supports more features, like mapping the powerdown GPIO to a regulator on
>>>> the mt9m114 which is necessary to make the camera on the Asus T100TA work.
>>>
>>> ...
>>>
>>> Don't you need the Kconfig(s) update to have proper dependencies all
>>> over these cases?
>>
>> Yes I do, I thought about doing this already but forgot to actually
>> do it, thank you for catching this.
>>
>> When I've some time for it I'll prepare a v2 of just this patch
>> addressing this and your s/then/than/ remark.
>>
>> Since you and Sakari are happy with them patches 1-5 can be picked up
>> and merged by Ilpo as is, so I do not plan to send a v2 of those.
> 
> Thanks for the quick reviews.
> 
> I took patch 1-5 into the review-ilpo-next branch with one typo in 
> change log fixed (reser -> reset).

Great, thank you!

Regards,

Hans



