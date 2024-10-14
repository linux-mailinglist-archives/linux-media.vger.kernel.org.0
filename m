Return-Path: <linux-media+bounces-19606-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAFA99C9BF
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 14:11:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3DCF2816DD
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 12:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08DA41A08A0;
	Mon, 14 Oct 2024 12:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WtwRALY4"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F075F1A00EC
	for <linux-media@vger.kernel.org>; Mon, 14 Oct 2024 12:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728907869; cv=none; b=VlRWkBb/w+TYgju0WJt019wI105CDQrrAIsX9vsVgvaOUGL5+WHW0tM48LEAiEPDuAAgvWzq1tJTSTJBLfFoQ5/o0weFmuyf4cxx1/jvlXF3jgSW8LlwJ+zrYC5WKui1YMBZQevMvjy/ZZCxI5oAbJ1OmsFXOr3JbeuXCik+XVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728907869; c=relaxed/simple;
	bh=KQCJ9q56BBbfdQKgw4ihkVxs0x2/I55BBLAghYrpX90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dnsZ6CjxycmJiiWImwQQ2Eaftm45pkL0EVjRLJLy+mcjSWbHp9mKs2nwTgGOQak+YB3FC1KbPnv4H9O236Rx8j3Y8MsnLb9ZJDzxvGvKQDtIP71BTjfZ1wYsU8caFRiVXlHZTGTa4BdJgz3utPQTonJvL34p7L5EW47i+Gu/Hyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WtwRALY4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728907867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TMrcBLoHcbOcsNGZvKHjw3mzkIxPzPRSPIevwpJyyDM=;
	b=WtwRALY4uGdkl8FJVeftr9EHniDTr3stoUxon7GJBnPHS6Lm4IgJw+dT4GkZG7OpzUBO2Z
	Cbe6G1xwBFYMrw+oDYY6/99xuB3Dx+vwhlOMtt5yHMx8/5vxd3dBu34CepgcreOVD20+3N
	+KJmEhxhb+sGlE1jt2QmqEN1dTLLkBA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-vMe8DeFFNaeMr5iDfY8EPg-1; Mon, 14 Oct 2024 08:11:05 -0400
X-MC-Unique: vMe8DeFFNaeMr5iDfY8EPg-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5c9217064f6so3279010a12.3
        for <linux-media@vger.kernel.org>; Mon, 14 Oct 2024 05:11:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728907864; x=1729512664;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TMrcBLoHcbOcsNGZvKHjw3mzkIxPzPRSPIevwpJyyDM=;
        b=eCHcYv6SDLx5Bcgw0x3P7C34z0/IaAUb5yvlWP2f0n/+aalHYNo8vabrbx4arGcVOG
         GsNjt23ovkK22ZbWM/S0QDBAtvS7Ke6Ozm1Hx/QIeI8aEEov+z4Lgnci1VN8+yEp8AKn
         9fye1YY/ZQ7xFg3icXocYjbsIU+3/NQorTR/Nn/iUfLGfqOgkVX5SYoeZmaQQ5PKVBQS
         BReeaSoo/DmyA5HlCtUTLsaVOUQuIpioXOox7n4iUjf5+9PFRNvCzRIDY5Kb3BeuwaXG
         Z1YxkBIBFodBZ0nleNEDSdK4dkBAKOp6hrpVLxHZa3y+rSEyb5/isbQbYah7oyQ9Exor
         KAEw==
X-Forwarded-Encrypted: i=1; AJvYcCWHjlEdL1ApOMEPQo23P03qVm3xB1YHqjBOTvMLH18RB6THpPSsmx37jbg2zfyRERsH5pSc7GrHSeMMeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTNaJ9ZMmfJblW+zHj4fX8SGKZDsD7VKTR8iTa9wODdMTstnxZ
	Ny+5YThpqPKNyJQwhoCZS9p0e+yv5MOo5duodDOB6PS2m5UaJMUaPKcclfJUzjFqZDSdFZs9RGy
	WvLg0wu8R3PJ8RgC8LDLNdUr+ZI6mUgizm2RnBfRaGnA3bOlyyXg4t7fKOsv3
X-Received: by 2002:a05:6402:1e8b:b0:5c8:79fa:2e4f with SMTP id 4fb4d7f45d1cf-5c948d764e2mr7749839a12.32.1728907864472;
        Mon, 14 Oct 2024 05:11:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9Gw1WbyJBhpULtWclfN+Pi3l+xn2/n0R+iwGpkgC206e/Yof/bHj86HZ1izzH7Sl6E16Gtg==
X-Received: by 2002:a05:6402:1e8b:b0:5c8:79fa:2e4f with SMTP id 4fb4d7f45d1cf-5c948d764e2mr7749820a12.32.1728907864033;
        Mon, 14 Oct 2024 05:11:04 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c937293cf4sm4883762a12.80.2024.10.14.05.11.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 05:11:03 -0700 (PDT)
Message-ID: <925c9bc3-18c8-4e16-9ec4-904cf77706de@redhat.com>
Date: Mon, 14 Oct 2024 14:11:02 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] media: atomisp: mt9m114: Add missing mutex_init()
 call
To: Andy Shevchenko <andy@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 Robert Mast <rn.mast@zonnet.nl>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20241013154056.12532-1-hdegoede@redhat.com>
 <20241013154056.12532-4-hdegoede@redhat.com>
 <Zw0BIPSWN_vR48xf@smile.fi.intel.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Zw0BIPSWN_vR48xf@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 14-Oct-24 1:31 PM, Andy Shevchenko wrote:
> On Sun, Oct 13, 2024 at 05:40:55PM +0200, Hans de Goede wrote:
>> The input_lock was not being initialized, fix this.
>>
>> Also switch to devm_kzalloc() for the main driver data struct, so that
>> devm_mutex_init() can be used for this.
> 
> ...
> 
>>  		ret = mt9m114_s_config(&dev->sd, client->irq, pdata);
>>  	if (!pdata || ret) {
> 
> Hmm... What is the ret value when no pdata is provided?

0, so this error-exit leaves the driver bound (pre-existing problem)

The error handling in the probe function is quite foobar in general,
but I just wanted to get the driver working as a POC / to have
a known working setup before focusing on using the other driver
since that is the way forward.

Regards,

Hans




> 
>>  		v4l2_device_unregister_subdev(&dev->sd);
>> -		kfree(dev);
>>  		return ret;
>>  	}
> 
> ...
> 
>>  	ret = atomisp_register_i2c_module(&dev->sd, pdata);
>>  	if (ret) {
>>  		v4l2_device_unregister_subdev(&dev->sd);
>> -		kfree(dev);
>>  		/* Coverity CID 298095 - return on error */
> 
> This comment is useless. But it seems we tend to drop this code completely in
> the future.
> 
>>  		return ret;
>>  	}
> 


