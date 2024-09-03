Return-Path: <linux-media+bounces-17466-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10757969B44
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 13:12:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBF882834C0
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 11:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49AA81A42A2;
	Tue,  3 Sep 2024 11:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dhuX4kJ4"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D32E1A0BF4
	for <linux-media@vger.kernel.org>; Tue,  3 Sep 2024 11:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725361939; cv=none; b=PrkO1JolzxDrfY/BWgvbLr9XlDnO2vJb/K+cnV9eXqlZjVqAQfiUN8ub3CdHC2yps2WxPYI2KP5jY98LfAq456EVFhWruEHqv/r+xPqLHLV2nHHsOQIdmMfsQoiEAoshbui6nbHlV9PdoBQr70xFVokgwr+9lVQxOsmYq/IG/rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725361939; c=relaxed/simple;
	bh=aDkHQTiJHsUOr/r43kZ/bHVNW8bGCrSVVztLhlOY6Yw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nCOtzZLKePPybp0jZ2CZ2/1eDoJCoBP3NOgzpDUTgXp4GHQEagvNi7baeeNh13k1XF5tyL+eSIRTgVyC4A0U5/43SZeONFFi60GgFoXWRu5Cxt7/1m3cbkinFEjzqaUGbCi95J9+jrhX3xXrcPsbEaU5bxATKIhkMrQdMCaWLV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dhuX4kJ4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725361937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hcgpHeqU4fyIC2RN61Bm9ZusM/pGlZZW2D5uDcUK9tM=;
	b=dhuX4kJ4/wbCJ+gCklZQeaB0PVtW4RYEFFMtNBuMX9uGoqQnZ6jBTOT0am/PpEhwiU5fAi
	Zroc2O7wSvUFnlkxFDw4zAxytUtcYPyzrW1yEEg4ndG0xFXwEYQYedEuf0LOuuR1oie8kI
	Fff+FlLKtvGntCIuJcZsgfatAfAb5ts=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-VTI80VFkMseIPw9aDtCF9w-1; Tue, 03 Sep 2024 07:12:16 -0400
X-MC-Unique: VTI80VFkMseIPw9aDtCF9w-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a86a64eef91so203290066b.0
        for <linux-media@vger.kernel.org>; Tue, 03 Sep 2024 04:12:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725361935; x=1725966735;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hcgpHeqU4fyIC2RN61Bm9ZusM/pGlZZW2D5uDcUK9tM=;
        b=Nqs1WvzqEsuHn98PMXgTavsNMU0+vrloJkfgQgbkbkrkCRHN/gtsj+5j5z79q95U+K
         +2M/QcmU/suF5DetkqtP8rYhFox+76+njsYvkmGbYhSWPDuvrL2rqzvCqhn8WyfbOgV0
         cyM2ZM/Y4mCl6lp96+UXPPTb6qqlIsqD4Zp7tkCjjkS1R7AJ5hqqvocUuggIIB01OrK2
         MSLoJdS30i0Gxt9qH4XieqciY9Kpeh/1lmzMpX+7e2T0K09X3PLlVPEcEwMgPDUL1tir
         n31mEFuFSt/kiRGIxjy2Hb+mJuWwhblI7Ctro24p553vQIuLYPTuvOfVMnFG/UtqJWoB
         5+7w==
X-Forwarded-Encrypted: i=1; AJvYcCU1ln4bnpvjmh1JWES/7ruxW1Sy4OrgpToESquEQ+nI9VcDsGto0NbhXzdLhJ2+I5xrlV/7R9defkMnxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZBLxY+kZaONo4LvORsPripnubrbrKv/wMXYSdZBi727vu0fIx
	dPP0NnVEgncrww/Wu/wUoq2i7Uj68Vmq72I2mqFreAvjL4dHh0fmof+6N1OJGL2WXbcL6GH6KtO
	Ki9Vz3T9ctTjFEViJgBy2m3/6IfyGdA8Lwd1Qfe2aG9B82c+JRUOX9LkzlGmH
X-Received: by 2002:a05:6402:3594:b0:5c2:4d90:988 with SMTP id 4fb4d7f45d1cf-5c24d900c96mr6961310a12.32.1725361934836;
        Tue, 03 Sep 2024 04:12:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEC8ca8n48qlFPZ2nXFuyCPnsw0jl8kVkKeLy5v50dAxq6/0LMgqwYtjTwSaNJRKTNv+3+3Gg==
X-Received: by 2002:a05:6402:3594:b0:5c2:4d90:988 with SMTP id 4fb4d7f45d1cf-5c24d900c96mr6961279a12.32.1725361934217;
        Tue, 03 Sep 2024 04:12:14 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c24ce9fdd8sm3727189a12.92.2024.09.03.04.12.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 04:12:13 -0700 (PDT)
Message-ID: <18ff79c7-a2b0-43f7-be6c-396ed1df29be@redhat.com>
Date: Tue, 3 Sep 2024 13:12:12 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: atomisp: Improve binary finding debug logging
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, Kate Hsuan <hpa@redhat.com>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20240902095229.59059-1-hdegoede@redhat.com>
 <20240902095229.59059-3-hdegoede@redhat.com>
 <ZtWpi7_S5d7NZx61@smile.fi.intel.com>
 <a3363c07-6595-450d-abe0-c1ff4a3e9955@redhat.com>
 <CAHp75VfZEjq+ep_5yjTr+-mPi5F3XurWDrt2tNUX+PW5k-HkJg@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VfZEjq+ep_5yjTr+-mPi5F3XurWDrt2tNUX+PW5k-HkJg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 9/3/24 12:30 PM, Andy Shevchenko wrote:
> On Tue, Sep 3, 2024 at 12:27 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 9/2/24 2:03 PM, Andy Shevchenko wrote:
>>> On Mon, Sep 02, 2024 at 11:52:29AM +0200, Hans de Goede wrote:
> 
> ...
> 
>>>> -static int __ia_css_binary_find(struct ia_css_binary_descr *descr,
>>>> -                            struct ia_css_binary *binary) {
>>>> +int ia_css_binary_find(struct ia_css_binary_descr *descr,
>>>> +                   struct ia_css_binary *binary)
>>>
>>> ...for example, in this case you touched both lines, so making them a single
>>> line just reduces the future churn.
>>
>> Ack, fixed in my media-atomisp branch.
> 
> (Actually there are more opportunities like this that I haven't
> commented on in the previous reply. I hope you have already found them
> and fixed accordingly)

Yes I've gone over the entire patch and made lines longer to avoid
needing multiple lines where possible.

Regards,

Hans


