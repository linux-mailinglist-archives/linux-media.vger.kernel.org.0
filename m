Return-Path: <linux-media+bounces-25196-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 296E0A1A1ED
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 11:34:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BA3D188DA33
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 10:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D675A20D4E5;
	Thu, 23 Jan 2025 10:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GY5YKxSc"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B235F186A
	for <linux-media@vger.kernel.org>; Thu, 23 Jan 2025 10:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737628493; cv=none; b=N+jgeTAfC7JptPD0z9Rei3MSGzro2mRWYaCVSdyE/Utyo8GKCOJ8Ya+1l/eMYP5GWPJrmg821oagaZBiBDoRQ3HevfwH5jNYbOxM/JR1sjXSamhjakM5ctd67jeXrfGzWsBS7764Lo5gGBKT63GmFlw4QLpOc0FXTv64yT3sMeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737628493; c=relaxed/simple;
	bh=xGmn/s1NYn/2DwZQOXBwgeCltyV3BM3lfNGbJrfjw64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L376jotKM0Erjc7X+dlQ8C8+Y9QLTz8tT1mPBXWQf1mOm+qTLPpKjE9jDusy00UFIZttK5npNL4/xxHtuAS8wPr3vB/LrGUAmrjppcoWjnELG7HMj+vq+mGfmP+YtuibbJRVgNgQPt5Rcyq7py6SaJdvAN2Qim+zOe25SoFnrgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GY5YKxSc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737628490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IZVLsQzG9IiY5wfHiBu4HoaOzxRqbQDPg5ueHLOV0oE=;
	b=GY5YKxSchvn34PUFss0OL2VFu38ttQDvwLukmEqL4F1s+mgKtUYVma5zl/N+eYD0+i+0nE
	UWDkni1svPrukHrh/YPqW94OUr3jsMLxJ0cxDbt6eHdsnGZLzXSb8QqJ4chf3MW6RrWs/3
	W3KN3zGcbMi8ZhpLlAMZTNYa1WTXRLY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-505-efs_yqx7PDyGBignDByQtA-1; Thu, 23 Jan 2025 05:34:48 -0500
X-MC-Unique: efs_yqx7PDyGBignDByQtA-1
X-Mimecast-MFC-AGG-ID: efs_yqx7PDyGBignDByQtA
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5d3f4cbbbbcso934396a12.1
        for <linux-media@vger.kernel.org>; Thu, 23 Jan 2025 02:34:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737628487; x=1738233287;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IZVLsQzG9IiY5wfHiBu4HoaOzxRqbQDPg5ueHLOV0oE=;
        b=PBzFKDlNgsDgDBrpsYh/hn9MNrZs0fhasMvDXt3RBNxFIExNWXvqoCPL4jlNX26oV0
         5wPti8/Kbc3er10TTSSm2h8Zy3ac9KKWjoqh/gqzTdS8nXaapOddENO2EKxtP98CI+fw
         1AsfR3Yccm4rjl6eEy55alS4e+Dpr81PwrmnrtpdSPzMTOCwY7yJFfTmX5FfO1xaIQUU
         HT5iTe9pPQMbuPXyT207tOvgArRa6/bwckiJ6t1UNpbnAsyyqPph3KG2Albs9ujrfLd4
         GplV3zShbwp9yP12ScSgHk7twP9ncJ5i3BoTMYEPgBae7daHJXd9A489laCauXNDejGN
         E8Fg==
X-Forwarded-Encrypted: i=1; AJvYcCXLEY1kaFLI01wD8HrNMVWBDWC3P2+rfiLAL21yKXLLI0U6y8S7bHcu+CCfmwNrFvnVZ8D4loeBmK6v9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhnoHs4sZ76We6ibAtJUgnaq1xEl2gRUImL/f7Gw+saSViUpiT
	Ze+LLqSy7Qpp+sPqB+9mAeZ/VYF7V+fFEatUlnS7ky4uwyLvbXG2cDUOIHbvLwcIOvy5QGKsQ+0
	31PXrNAeoTWTvlrDz+GJq4V/gPCZ642XKApqNJTvMmAvEPUxjAJFoY02yiwml
X-Gm-Gg: ASbGncvWKiYjbXptiNDcCJ2iDo+6hW0CxrYuujvADM46/ISiPPhaCLSqrNEeEU16nqp
	kmPnImH4IeuC10MPbUz5Zp0aKDVx8T+6W1FA2S11IqqmQQzHWS2n/ZJcwfWUyp8DayY+eN3YOMT
	iBfuFAWztwgX+jhZEO2nE7IHbxB2fEzzuxxaLEf0E6aiujHPGRZM+1Zex4ihdBatJu/lrPMW3bQ
	X5+rhm4GcBhEZWAIUgzaVOGGJV8BgXLeXxU5c0RGUBK5i9TgrIQvUULIjleHb6wgfXQ14RjAOIf
	QvW9s7imMC3oCqUrOPi4hgaXeTsqxSXk9nt5NmId+Ky6XZdVkd4BLdmamcGHpCQslqUh21MvvRl
	CxoJGGH3Sdu9CTnl26IENi/TwBlNdbxpcqCelEPjE9Eezv1w=
X-Received: by 2002:a05:6402:520e:b0:5cf:420a:9 with SMTP id 4fb4d7f45d1cf-5db7d2e8ff7mr24571337a12.5.1737628487518;
        Thu, 23 Jan 2025 02:34:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFsh1EGqUxMNy5n5/COxOInUEa5II+lUWsEduN5sVOi+U6vzFfN0r8UpfHY9qmdGdIE0fEHdw==
X-Received: by 2002:a05:6402:520e:b0:5cf:420a:9 with SMTP id 4fb4d7f45d1cf-5db7d2e8ff7mr24571324a12.5.1737628487134;
        Thu, 23 Jan 2025 02:34:47 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:f271:322f:26b0:6eb5? (2001-1c00-2a07-3a01-f271-322f-26b0-6eb5.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:f271:322f:26b0:6eb5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dbcfb8ff37sm4548192a12.72.2025.01.23.02.34.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 02:34:46 -0800 (PST)
Message-ID: <9ff0c16e-aa9f-455c-aa51-57ec11a6cbf2@redhat.com>
Date: Thu, 23 Jan 2025 11:34:45 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] platform/x86: int3472: Call "reset" GPIO "enable"
 for INT347E
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniel Scally <djrscally@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil@xs4all.nl, linux-media@vger.kernel.org
References: <20250122104344.245128-1-sakari.ailus@linux.intel.com>
 <Z5Eh-mX-RiWw9giI@smile.fi.intel.com> <Z5IIkM1i1MV42uvh@kekkonen.localdomain>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Z5IIkM1i1MV42uvh@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 23-Jan-25 10:14 AM, Sakari Ailus wrote:
> Hi Andy,
> 
> On Wed, Jan 22, 2025 at 06:51:06PM +0200, Andy Shevchenko wrote:
>> On Wed, Jan 22, 2025 at 12:43:44PM +0200, Sakari Ailus wrote:
>>> The DT bindings for ov7251 specify "enable" GPIO (xshutdown in
>>> documentation) but the int3472 indiscriminately provides this as a "reset"
>>> GPIO to sensor drivers. Take this into account by assigning it as "enable"
>>> with active high polarity for INT347E devices, i.e. ov7251. "reset" with
>>> active low polarity remains the default GPIO name for other devices.
>>
>> ...
>>
>>> +/**
>>> + * struct int3472_gpio_map - Map GPIOs to whatever is expected by the
>>> + * sensor driver (as in DT bindings)
>>> + * @hid: The ACPI HID of the device without the instance number e.g. i2c-INT347E
>>
>> W/o "i2c-" part.
>>
>>> + * @type_from: The GPIO type from ACPI ?SDT
>>> + * @type_to: The assigned GPIO type, typically same as type_from
>>
>> @type_from
> 
> Agreed.
> 
>>
>>> + * @func: The function, e.g. "enable"
>>
>> Should we speak in terms of GPIOLIB, like connection ID ?
> 
> That rename should be done in the entire driver probably then. I can post a
> patch if Hans agrees, after this one.

Yes renaming func to con_id makes sense, but that should indeed be
a separate change in a follow-up patch.

Regards,

Hans



