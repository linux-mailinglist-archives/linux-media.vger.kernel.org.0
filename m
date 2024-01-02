Return-Path: <linux-media+bounces-3161-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF435821AF4
	for <lists+linux-media@lfdr.de>; Tue,  2 Jan 2024 12:30:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 267AD28315E
	for <lists+linux-media@lfdr.de>; Tue,  2 Jan 2024 11:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B712E544;
	Tue,  2 Jan 2024 11:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="antb9SW0"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A89E554
	for <linux-media@vger.kernel.org>; Tue,  2 Jan 2024 11:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704195024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YA2sEJqc+eoyhMOBnoo4ckR0PWGURW4RmLd8t+uinbw=;
	b=antb9SW0pES5saDqGPGHATcGPDk9b0mZJJIvAOqySPfbWnsx9tZny2iUPRU+8Dh55HIJqn
	lMGM1aUk7uJDibeaj5lN0oFIZI1DXbCNqQYku72/MaNl/f5wBy1KoYz1N35jkzVzDTbv1G
	i5+gkVJxdl4G1BB1upCHn1mTEIezzhI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-lJi6QAQ2OFe_6hjmJ81Hkw-1; Tue, 02 Jan 2024 06:30:23 -0500
X-MC-Unique: lJi6QAQ2OFe_6hjmJ81Hkw-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5560cd16f03so1092672a12.2
        for <linux-media@vger.kernel.org>; Tue, 02 Jan 2024 03:30:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704195021; x=1704799821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YA2sEJqc+eoyhMOBnoo4ckR0PWGURW4RmLd8t+uinbw=;
        b=HAIqmbUUSNhwN6SkFj/+ompwze7oFqDJnigQl56m6S+8CRtb64hlxT7YZPwsYMRKZQ
         XTMp5ROq2uWDuPltvUlcF0Kgl5CAtQAGlWwEuJSCILCZhkiHkEGgoKlaPUS3FOXA1euh
         uUZVUSLktFlyhNK2UDuJpFFHwl5dbgtmalWMJB5KNcb7+OgKPb6o8QEd5UV5bSdXNaFZ
         eSG1K8pVkO4VimdRmYn68E6lHjZaaMd9k2e/stZaDMZNRm6w+6pEAsdLWx3s7N7dcTVb
         Gby5M+HnkGwcHmR8FbXRBYqGnSdgF3HEzbAhzZq+sjXxe2jcSspHt8zAs0GE6myatNem
         2Cyg==
X-Gm-Message-State: AOJu0YwS5PEriuP3r5oGmsMQmcasH9pJzlhWIvVH00DNowON6mTKOmEo
	ZbFtWv89zOlRzKOVWuaDPfpm3kgLh20nZIoBjKF3/gBO08AH2bh7F+bCYFyc5eHSENoH1O5cHal
	yJFY0enZk/Lf5LprS7zsFPOqmiuZtWK/njHZrBBY=
X-Received: by 2002:a17:906:108d:b0:a26:e013:947f with SMTP id u13-20020a170906108d00b00a26e013947fmr7159380eju.76.1704195021578;
        Tue, 02 Jan 2024 03:30:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGoP3XZvu8pZ0HNlZf3eVhDWP6+U4nXBF/z+n8jYdA9QLgK5YDAZovWly7vUNZsun4qUgJiw==
X-Received: by 2002:a17:906:108d:b0:a26:e013:947f with SMTP id u13-20020a170906108d00b00a26e013947fmr7159367eju.76.1704195021219;
        Tue, 02 Jan 2024 03:30:21 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id zr16-20020a170907711000b00a26af905229sm10757454ejb.29.2024.01.02.03.30.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 03:30:20 -0800 (PST)
Message-ID: <960cc0a6-6ef8-4a66-8f83-89e854b7b578@redhat.com>
Date: Tue, 2 Jan 2024 12:30:19 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/15] media: atomisp: Replace atomisp_drvfs attr with
 using driver.dev_groups attr
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20231231103057.35837-1-hdegoede@redhat.com>
 <20231231103057.35837-12-hdegoede@redhat.com>
 <CAHp75VfHN1gbWRX20PpWVevmA+P9E4GCdkG0vRYQQ_QZvWKUsQ@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VfHN1gbWRX20PpWVevmA+P9E4GCdkG0vRYQQ_QZvWKUsQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

Thank you for all the reviews.

I don't see anything really problematic in your review,
so I hope that Mauro will honor my pull-request and
then I'll fix the small remarks in some follow-up patches.

One remark regarding your review of this patch below:

On 1/2/24 01:33, Andy Shevchenko wrote:
> On Sun, Dec 31, 2023 at 12:31 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> sysfs attributes preferably should not be manually be registered but
>> instead the driver.groups / driver.dev_groups driver struct members
>> should be used to have the driver core handle this in a race free
>> manner.
>>
>> Using driver.groups would be the most direct replacement for
>> driver_[add|remove]_file, but some of the attributes actually need access
> 
> ..._file()
> 
>> to the struct atomisp_device (*), so as part of modernizing this part of
>> the atomisp driver this change also makes the sysfs attribute device
>> attributes instead of driver attributes.
>>
>> *) Before this change accessing these attributes without the driver having
>> bound would result in a NULL pointer deref, this commit fixes this.
> 
> ...
> 
>> +       if (dbglvl < 1 || dbglvl > 9)
> 
> in_range() ?

ack.

> 
>>                 return -ERANGE;
> 
> ...
> 
>> +static const struct attribute_group dbg_attr_group = {
>> +       .attrs = dbg_attrs,
>> +};
>>
>> +const struct attribute_group *dbg_attr_groups[] = {
>> +       &dbg_attr_group,
>> +       NULL
>> +};
> 
> ATTRIBUTE_GROUPS()

I deliberately wrote this out (had to write this out)
instead of using ATTRIBUTE_GROUPS() because ATTRIBUTE_GROUPS()
makes the groups variable static and here it gets used
in another file then where it is declared.

> 
> ...
> 
>> +#include <linux/sysfs.h>
> 
> But why? You can use forward declaration, no?

True, I'll fix this up in a follow-up patch.

> 
>> +extern const struct attribute_group *dbg_attr_groups[];
> 


Regards,

Hans



