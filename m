Return-Path: <linux-media+bounces-32038-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACD7AAFC5F
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 16:06:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9640A3A88C6
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 14:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 872CD2528E5;
	Thu,  8 May 2025 14:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ATxvCOUt"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EF62528E2
	for <linux-media@vger.kernel.org>; Thu,  8 May 2025 14:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746713195; cv=none; b=FuBbvYwl6FNA2Tb7ACUdoddTEYwiewC41INny3txXszg66nmyRduF6pgC2Hsmd+WxaM4mjzvWl1nzsADLSPQxfJ94X9biTbmX914pgtTiMasT1NMC8Elqg2EtwUqj5QJyw0E5tPVN22ISq/xp6zUKgcDsdPOh21rT4kTGRdrhT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746713195; c=relaxed/simple;
	bh=kBdo3d/KoEhV9EUkuxZCI2cRaHqHBylhi7zJ+VTyZVc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=s568ccKV3txVcafmpo5k5RXvKGB0ttNCRcEWLKrSopVc04wAYyg8JnmXMb3lWEpvLiVW0Hjgk3aYkcTi1fyeRbu5zpjC9Pahc/GCJ1EfdgUuvV8aCCMKY//x6alq2rujSSh6LuCxDCssGDiJAgMGOztnmEyYogkK9KzL0H02HUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ATxvCOUt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746713193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5ebO/qCZ0JEZ4vqg1hdJ8oPvjXAfo3GcradBLxE67v8=;
	b=ATxvCOUtV8RBv4pXcvpAkAebc5o8mol9bgVWSYDC7YQHjx8j//CHX79vPQpLVxEXped3Pt
	JRsI0sQ6l5QbMRXNPHHqbYsT5BX1THz+TV8hq1F8Z3k505GvKh/EjxSO7f+d4AefKp6SR4
	pBRsyHdCGb8zU/sPF7sqn/VHo3cwSjg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-ZrqsdrY1O7KpeEmny0ylaQ-1; Thu, 08 May 2025 10:06:31 -0400
X-MC-Unique: ZrqsdrY1O7KpeEmny0ylaQ-1
X-Mimecast-MFC-AGG-ID: ZrqsdrY1O7KpeEmny0ylaQ_1746713191
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5fc013fb4easo1110513a12.0
        for <linux-media@vger.kernel.org>; Thu, 08 May 2025 07:06:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746713190; x=1747317990;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ebO/qCZ0JEZ4vqg1hdJ8oPvjXAfo3GcradBLxE67v8=;
        b=LzgjQKxI3wBiicsl0dVw7+lBun8ki5F/uqzEH2efYo89nn7Jgxe0fB1vhknjAhldgR
         +k3lnww3OREfZdZtQNuIMu2dWRZ/hOwAb4wOooS/FF+VVf8UgbV0eWH3mhwhvvYyIh20
         8xatrypXPrr5Aij7ecQyL9LKXUJ07t4ux7O0SaQk1weTj+Un95S0Lh+8gq8rB6W9ncoI
         GjSl9QTCUuoD2DUDWHsf4xZ9two+HjhCJGAvxBV1tSdRe0w+8c9eyLDOmsrqvqp2syRO
         o+Y9hqJakx3xzWLAbb/hHfbdH1pVRWVR1WX/m5FxUVHfOIk0MU/0vblzeT7Av3GUwFP8
         8eRw==
X-Forwarded-Encrypted: i=1; AJvYcCUkQyEc+/PutDJZQTjWcUlV8T6fatTMkBFZvnC6yhxgtS7M/HY1/LNim5rTghL5wa2bnf2Q7ShV9RSGWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRH/vAp1HZF6pMYm95o3bfOmPWiGU+8Vbv5veqMhQue0V/onWm
	15FkC0c/VqMxoqLza3FZCpS9LEbtCoTTmf+OQmZc59g7DQOjKrWz7E78kcu4/cPDZRH14oRguZR
	Tpw/BT+o86MAC2IO/Romya9LpsDT7sT1RqNTLDlH6UKjHDGwaiCXib0vXKR7J
X-Gm-Gg: ASbGncvs5qT4YGwak2omt7cZv2A580EMNmDKA3qAqCy1be7dBrF54WNLefpZJhRT6zK
	mhesrIevr+DjpSq2VUMq2klX5cC7oA6Zn83LmYTzd9V1iuM39JWOijpMpa/buShyn37YXkSq6CJ
	zE2AaD+NzNl+26AnvnCzZrZk3brCsr/UDhUPOUQjkneNOtiAK4mAwPwG9aOo09O2fhv5M+QK/eQ
	ZvGXjkZOnH6TxyhmheZpyv1in1p0QvXoDBWcTl9GZJjZzio78ReK2yZurLnXn6bgZCirC/MJVG+
	csXuE+OCyyzd8HokpPQSNsutmxMSwvPkXj8k199BZ0EM46jADC6DxBG2g73IFLQM+ihw2vz4X+j
	clDlFNDemBmKjZcWxpBw13VKk4CVdaQOHsTg65F8iALgIQy4Y/5XIYKbdr8W2fA==
X-Received: by 2002:a17:907:1b18:b0:acb:52cb:415f with SMTP id a640c23a62f3a-ad1e8dbe8eemr783521366b.48.1746713190593;
        Thu, 08 May 2025 07:06:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjk0Ylim6P8bbYmFioBSZ3Y8jszu127kHRxjA4923VyGRj8RfhDIcxpEg4n97baRRqmai8mg==
X-Received: by 2002:a17:907:1b18:b0:acb:52cb:415f with SMTP id a640c23a62f3a-ad1e8dbe8eemr783514766b.48.1746713189971;
        Thu, 08 May 2025 07:06:29 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad214d24f07sm11348966b.93.2025.05.08.07.06.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:06:28 -0700 (PDT)
Message-ID: <1a5cca5a-4bb1-4ac5-aefc-b1ef0e693914@redhat.com>
Date: Thu, 8 May 2025 16:06:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] media: atomisp: Switch to int3472 driver sensor GPIO
 mapping code
From: Hans de Goede <hdegoede@redhat.com>
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
 <f8a321cc-2545-4048-a257-56c3c5dd03b3@redhat.com>
Content-Language: en-US, nl
In-Reply-To: <f8a321cc-2545-4048-a257-56c3c5dd03b3@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 8-May-25 3:56 PM, Hans de Goede wrote:
> Hi,
> 
> On 8-May-25 3:48 PM, Ilpo Järvinen wrote:
>> On Thu, 8 May 2025, Hans de Goede wrote:
>>> On 8-May-25 10:34 AM, Andy Shevchenko wrote:
>>>> On Wed, May 7, 2025 at 9:48 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>>
>>>>> Replace the duplicate code for calling the special Intel camera sensor GPIO
>>>>> type _DSM (79234640-9e10-4fea-a5c1-b5aa8b19756f) and mapping GPIOs to
>>>>> the sensor with a call to int3472_discrete_parse_crs() from the int3472
>>>>> driver.
>>>>>
>>>>> Besides avoiding code duplication the int3472 version of the code also
>>>>> supports more features, like mapping the powerdown GPIO to a regulator on
>>>>> the mt9m114 which is necessary to make the camera on the Asus T100TA work.
>>>>
>>>> ...
>>>>
>>>> Don't you need the Kconfig(s) update to have proper dependencies all
>>>> over these cases?
>>>
>>> Yes I do, I thought about doing this already but forgot to actually
>>> do it, thank you for catching this.
>>>
>>> When I've some time for it I'll prepare a v2 of just this patch
>>> addressing this and your s/then/than/ remark.
>>>
>>> Since you and Sakari are happy with them patches 1-5 can be picked up
>>> and merged by Ilpo as is, so I do not plan to send a v2 of those.
>>
>> Thanks for the quick reviews.
>>
>> I took patch 1-5 into the review-ilpo-next branch with one typo in 
>> change log fixed (reser -> reset).
> 
> Great, thank you!

Ilpo, I just noticed that Sakari typod his Reviewed-by, it reads:

Reviwed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

and this is also how the tag looks in review-ilpo-next now.
so missing an 'e' you probably will want to fix this.

Also Sakari gave an Acked-by for patch 6/6, but since he did so
in a reply to the cover letter all 5 (1-5) patches now have:

Reviwed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

so besides adding the missing 'e' you probably will also want
to drop the entire Acked-by.

Regards,

Hans




