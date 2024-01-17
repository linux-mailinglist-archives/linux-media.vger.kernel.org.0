Return-Path: <linux-media+bounces-3820-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50962830911
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 16:04:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3DA81F25E63
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 15:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DC8521103;
	Wed, 17 Jan 2024 15:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yo5TGrK5"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E07210F4
	for <linux-media@vger.kernel.org>; Wed, 17 Jan 2024 15:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705503838; cv=none; b=ZwB6BTTRcB1a/rWbU7gRFE8IH13XdzPcPgOSMz4IYSZjJ2953E2DFOD796N9TGuvJYgnNlbDhxNHQkCAm7e0VgBploc3U84O4G4RsITV5vP07U8MgFJB7sSLZlRcLEWiSbeQvBMf86y5W62wbI446zH1bCPQL5u2LrseQvIg1Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705503838; c=relaxed/simple;
	bh=xYuQz0Pd75gqrVgkrtQSxGDqG38YM/aMVSfx6tJB02c=;
	h=DKIM-Signature:Received:X-MC-Unique:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Received:
	 X-Google-Smtp-Source:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding; b=Xy5HltFMo/dcTt5mfJ+/rRWy8/WMXOwBU+TQQJENTHCqIPr/Nz65HudjRh9/ZdHJzVE5fMKP91cbj9Wb5Fo4SUfvi7VBvSPYq0uheR8cbfi+k2zR3neFNdSIufQXYeY6QEawOsJsVGcwX1imgOWnAAII8RBqFW0HgD/On0bPDyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Yo5TGrK5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705503835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7xEOKQ2cADtebY6MDgz1EBt9G7IYPwEzgXwK3qQErjk=;
	b=Yo5TGrK5bTKoMLDVALTey/EXBYRhstFTmfYrrPSlOGvdf4Vdu2K5iI2mDoR8Lg11/weFZ0
	xGxZyZVpCIvMSY4+4SlpUJcYVttwE//1V6E927F/7L6xmecJy0Xj41yXICKT3D+90D9r6Y
	jcPKGlHcSfmx59h6jy3bOwx9fg3Zn8w=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-RdwhxGesN9m5eAq6P9wgKw-1; Wed, 17 Jan 2024 10:03:50 -0500
X-MC-Unique: RdwhxGesN9m5eAq6P9wgKw-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-50e91f9d422so10631034e87.2
        for <linux-media@vger.kernel.org>; Wed, 17 Jan 2024 07:03:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705503828; x=1706108628;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7xEOKQ2cADtebY6MDgz1EBt9G7IYPwEzgXwK3qQErjk=;
        b=B/9wx9cvY82MFfBbaE7Q5H9GR/GeVTL18yPdx/GJBHUsk0lihcJJTr46bZmOo/0TmM
         0RfOEM3fT91NI2sOpgog0NKMNOYkG2t+3n69y4zvcQjdaFdOaW43chIONwQh5DS/iO73
         IIcKyJuuOgc+POPI+QUeWsOhnWECKhZqT8mv6mIFX9hKejie18K/kp/55aFKzgkeh2yz
         LXjFM3rs0YNL0WulyEmgkqRsxIBDbFkyVwBwsTfKY88cSIJbjXaVD18spHNr+NPJDRiX
         YvqsYgaQaaVCbpmuUSAgX+sm6HazWbm6HxmAJjKyzLzeSTLvepWK1Jf0O6IwXQGzvNiO
         DE4A==
X-Gm-Message-State: AOJu0YwPcnrHa1GSx/EGF/HxHSf06AB9h3oPmWJVKRP7Hj9mULegtDdp
	sXNjd2IL07Y0FbD+DzaJSB6Jsrkg8btsUdJHf1zc4lErSlYlJhySrxeMxZiMVdsgxSh6mS+ZXjb
	XmRf9VDvGQzMT6aeFqRckRisCynTYc1I=
X-Received: by 2002:a05:6512:239c:b0:50b:e724:62a8 with SMTP id c28-20020a056512239c00b0050be72462a8mr5411234lfv.92.1705503828530;
        Wed, 17 Jan 2024 07:03:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZe3cAXqADxFpnYxMsfoWaEEgiQVKNAOZKNYD7H3jvGnNcrldnqDngzcm61ii4P0iTG9fdpA==
X-Received: by 2002:a05:6512:239c:b0:50b:e724:62a8 with SMTP id c28-20020a056512239c00b0050be72462a8mr5411222lfv.92.1705503828186;
        Wed, 17 Jan 2024 07:03:48 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l21-20020a056402029500b00559d4c6e81dsm989565edv.22.2024.01.17.07.03.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jan 2024 07:03:47 -0800 (PST)
Message-ID: <b635160f-c5de-44c1-8adb-b2bfcc08446b@redhat.com>
Date: Wed, 17 Jan 2024 16:03:46 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/15] media: atomisp: Replace atomisp_drvfs attr with
 using driver.dev_groups attr
Content-Language: en-US, nl
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20231231103057.35837-1-hdegoede@redhat.com>
 <20231231103057.35837-12-hdegoede@redhat.com>
 <CAHp75VfHN1gbWRX20PpWVevmA+P9E4GCdkG0vRYQQ_QZvWKUsQ@mail.gmail.com>
 <960cc0a6-6ef8-4a66-8f83-89e854b7b578@redhat.com>
 <CAHp75VeREE+DEuCiAyPQkMRe2ni7K+di1tSFG=vjW4EWeS6gPw@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VeREE+DEuCiAyPQkMRe2ni7K+di1tSFG=vjW4EWeS6gPw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On 1/2/24 22:23, Andy Shevchenko wrote:
> On Tue, Jan 2, 2024 at 1:30 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 1/2/24 01:33, Andy Shevchenko wrote:
>>> On Sun, Dec 31, 2023 at 12:31 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
> ...
> 
>>>> +static const struct attribute_group dbg_attr_group = {
>>>> +       .attrs = dbg_attrs,
>>>> +};
>>>>
>>>> +const struct attribute_group *dbg_attr_groups[] = {
>>>> +       &dbg_attr_group,
>>>> +       NULL
>>>> +};
>>>
>>> ATTRIBUTE_GROUPS()
>>
>> I deliberately wrote this out (had to write this out)
>> instead of using ATTRIBUTE_GROUPS() because ATTRIBUTE_GROUPS()
>> makes the groups variable static and here it gets used
>> in another file then where it is declared.
> 
> I see, but can it be refactored / does it make sense to refactor that
> it becomes visible only in one module?

The problem is that all the sysfs attr handling code lives
in its own .c file, where as the driver struct is in another
.c file, so we really need to access the list of
attribute-groups from another file then where the list is
declared, which makes the ATTRIBUTE_GROUPS() macro
unsuitable.

Regards,

Hans




