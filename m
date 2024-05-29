Return-Path: <linux-media+bounces-12164-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D738D3A77
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 17:16:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01E721C2403B
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 15:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AB571802B5;
	Wed, 29 May 2024 15:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eWmOcuRa"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33341746E
	for <linux-media@vger.kernel.org>; Wed, 29 May 2024 15:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716995754; cv=none; b=OHG6c01tu/9ZljpmpJVGXZSzPA8maxOlF6v7lZoyfdaLiYUygg6PePIh4okkCwxLsG3f5ewxAOqSD4jGQpY4O8gorPzfGugAZHjTg+os0xu0lNeGwrpaAUJiYEjisVRahA2X49QJK3alH8SAhefvrdgIb+hmHlZXfTyGtK0vdZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716995754; c=relaxed/simple;
	bh=WRJ9P8uMio+H5tef7YzpD6LIS3d726xNkjsqkACcOQQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NpzCFovEtL/QbZDeeuzmmxlyl/MlnqJ9SfUmQaXxcSfWxBznHTyt8ZDt/EqvqXjLtNCu34DeL/4yVKnb5/kGy1iUFpkMVk41su4QGGX/l13pG76lYfZp2gcnNKJ2INhde3jtYLTzsooCcEozzpkPJmniHsGN7jtTCh17lOrldW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eWmOcuRa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716995752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YJj0N9qxVcQvjL/C32R8iXU+bPiFmqBqHw0V+yGUuuM=;
	b=eWmOcuRakKQjzG9jkOsvMcrW5F9r+DVnuBMXjOK7JWjs/QFCGU3RJ2vvQDaZM0RETJciG8
	NJk/7kTPTuCEg09uG17IDnEvdUTQfJFxTTIsGt/fk0eb3of5Tgx3zoB111ktWU1qQYgB+j
	rMNoyQ/+g8BgZxyYVMlkkr/zA7/GCs4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-R1QZ-Sw1N-aasxtnjdJ37Q-1; Wed, 29 May 2024 11:15:50 -0400
X-MC-Unique: R1QZ-Sw1N-aasxtnjdJ37Q-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a6265d3cc76so121058466b.0
        for <linux-media@vger.kernel.org>; Wed, 29 May 2024 08:15:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716995749; x=1717600549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YJj0N9qxVcQvjL/C32R8iXU+bPiFmqBqHw0V+yGUuuM=;
        b=c+IPpXDLIx8x+gE12XHam/Y9fJs2xkwyzdvkbCUXF29HRb6UMZbb6g1nbtMoU3WBj/
         5qncdzTSDX3ENI2kXHcn3XWc3YsNsH2onUBtiAV3vspvFEb3zkCAcnZoKHtSA5b8EIsi
         x3XqDmbSaFOpMkjsFcydGW7K1XrN7QureK9gv08EOb8Qk86goNJDi+jpiBwlsuMd6obI
         KZNNwljMWO54cPpB4wJMufoQ+gP/4juY18FlJcsbg6ZYSIYs6mLjqiPHcK34nJIstrzE
         ALlRjmzhKVm8Gm7Y4fEIcjFbbbT6S43QDA4E0A2/kgEbMkBend/JmP6I2zVuqqnAL7KT
         QRNA==
X-Forwarded-Encrypted: i=1; AJvYcCXnRV9B83BKMjXTKSdqtUVFJrG6j3DZAmJ9DFECFEt85ZRkw7iDy/0ht8xx4Z1GO4BnJ9630hFoUzHU/YGITI71LmWhrcvHKXzn/gw=
X-Gm-Message-State: AOJu0YzmAqwoQG+FbK7SoyX/BZBJf1Is+bwYebxXsXVloDKdG0HA/Qe9
	ruO+Hv+ZB8HhN7fmob2pkEc59iUkWzZ5PoO14K94KwpyJlzn6/+QdIuqYd37/V3EDYzwrgfDT6a
	QfZEy+gRknBu6rSVtEtTwU3KHqv5XGI1mPFA7oI48L4HmNb+fmFZ6bmSVfz4D
X-Received: by 2002:a17:906:cc4d:b0:a59:ba2b:590b with SMTP id a640c23a62f3a-a62650118f2mr1002054166b.71.1716995749387;
        Wed, 29 May 2024 08:15:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBfQdnnvzdnxDYNpKfHPkp2qs4TrDJoAtAdmrMZ8sw3PrAleFD/8w6K1K/JnNatJUG8QC4mg==
X-Received: by 2002:a17:906:cc4d:b0:a59:ba2b:590b with SMTP id a640c23a62f3a-a62650118f2mr1002052366b.71.1716995748887;
        Wed, 29 May 2024 08:15:48 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a62dbdfca11sm438834566b.145.2024.05.29.08.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 08:15:47 -0700 (PDT)
Message-ID: <8107c1fa-0066-4b7f-b161-2cad1a9eba4e@redhat.com>
Date: Wed, 29 May 2024 17:15:47 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] media: v4l2-cci: Always assign *val
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>
References: <20240529151415.2910827-1-sakari.ailus@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240529151415.2910827-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/29/24 5:14 PM, Sakari Ailus wrote:
> Always assign *val to 0 in cci_read(). This has the benefit of not
> requiring initialisation of the variables data is read to using
> cci_read(). Once smatch is fixed, it could catch the use of uninitialised
> reads.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Tested-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/media/v4l2-core/v4l2-cci.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-cci.c b/drivers/media/v4l2-core/v4l2-cci.c
> index ee3475bed37f..1ff94affbaf3 100644
> --- a/drivers/media/v4l2-core/v4l2-cci.c
> +++ b/drivers/media/v4l2-core/v4l2-cci.c
> @@ -23,6 +23,15 @@ int cci_read(struct regmap *map, u32 reg, u64 *val, int *err)
>  	u8 buf[8];
>  	int ret;
>  
> +	/*
> +	 * TODO: Fix smatch. Assign *val to 0 here in order to avoid
> +	 * failing a smatch check on caller when the caller proceeds to
> +	 * read *val without initialising it on caller's side. *val is set
> +	 * to a valid value whenever this function returns 0 but smatch
> +	 * can't figure that out currently.
> +	 */
> +	*val = 0;
> +
>  	if (err && *err)
>  		return *err;
>  


