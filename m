Return-Path: <linux-media+bounces-8998-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F4289F016
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 12:41:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2CDC285BE4
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 10:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C7D15921C;
	Wed, 10 Apr 2024 10:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fNYEm0ek"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E8C15921D
	for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 10:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712745681; cv=none; b=ieyNSjWQpKerY4Yc+2UaeFWipbBfJiqC1HDGuNyr1KI9SaRMBytzll1UVkd/BlBF9ycaSs//Jd3fl5pJv1Ff5tzzuDlKKhRRlai77T1wK/bA75m/csouid91HPaiOvsrRndGrEDKsc23fGEI1ieIZS77ioIX5yjtzs3msitjNc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712745681; c=relaxed/simple;
	bh=wx6wi8yCPz7bbedzJAtXAmz1WN/tIuP0sowM0cLJaO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pbyZbxWucDM804z4Zw/lTqmKYv3NzG6tLJUyWTN3k/TtWRLMvIz0rU9/oCnq1S0h1ZzgQg9eY7bzWKpzzxSGUZLJ+xZzEZO8rHQimAih59gKq44CL3dOSqx864zJOyB3L1RH/0OzEv5k59wy480IPYptWAzExOEKEPb6oxYgdEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fNYEm0ek; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712745679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LLYUOsiCK89ppriD2/U9aWZQKaEkdNaVp3Rv912e/iQ=;
	b=fNYEm0ek/omkDcN2Bd2CYSL5ZqlRVj+aqjJG1FCvd6DpdqAzYqCmaiOI3VZj49wyPe5e+a
	+I+bM6mhSt3BSZjUdb3PADmD2+qseWX7xiSb8bi9Ow+W8j+zSgci8U8NFyWSvC+m+JVuwK
	GSO5UC7fW2NNiytKFlVJSTnRt8csw1o=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-YQG7cHDhNxmEJeo_L2LWMA-1; Wed, 10 Apr 2024 06:41:17 -0400
X-MC-Unique: YQG7cHDhNxmEJeo_L2LWMA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a5198c1a6f4so317165166b.3
        for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 03:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712745676; x=1713350476;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LLYUOsiCK89ppriD2/U9aWZQKaEkdNaVp3Rv912e/iQ=;
        b=LN9eyV5QGA1WhGzexRgwaaF0uF01tg7Y6m2g/zBYNlcfJHvfDOoRBvDchcIgwLzBc4
         94tN0TN28omHuG+XRW6SAdbK4IVTnfkSN7mtjL0yZLj9YgXwSvwnU/afZF7QzQe6cC9O
         vJ7UG97IPHsP9pJEKEl0R7/aekxa/tEZXVoZQmzKDTyOSThYrcqd+w5jXVmBey8KLnYl
         lGE0sPf897egLgE+xoTN3u629nTL6nXg6s4KQWnP/uoW0j+Ixk78O20QOR+6qOuE8Xsl
         bkEJZj6RQ3rUSHo4Z50uxhfeuXXIDRogI/SlxJBinzlw4HR1Rf028anY9HexlwODaUc2
         rw3g==
X-Forwarded-Encrypted: i=1; AJvYcCV2axMXRMq9OryProZM9WlbXbvCJ2CxnQUHNyQOnzdQpE4tBhA6shkDGfG+xL5HrfzmowQIYB/htvjwpzjn+tXKqI7N4wXjL+rUBJs=
X-Gm-Message-State: AOJu0YwfBu0pB4Xj5wiFJrNGt44cBUIKAjA9IhKURpAypzKlw8RfKlgO
	2k4KpzJBdX3qpnKVqH0MN4pv+Mtj3Ibcri1pMwdmEZasA9yU9l8zrAPkAAdbV4KoZ4NCa7YZ5nC
	8knhwC92LrixNVeHc41vSLA7n3vXhvSY3HWUjO2jt+iG8UIeo1FWUQtjAhYud1OCHso4Q
X-Received: by 2002:a17:907:2ce3:b0:a4e:8c9d:a724 with SMTP id hz3-20020a1709072ce300b00a4e8c9da724mr1807517ejc.69.1712745676123;
        Wed, 10 Apr 2024 03:41:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsq1n8hzJjx1qsuq6HCtVmCpRcsDxAqj3z/woUl7oARPWIpHpyA+Ro8wjU6p3J9OHQCuuPFg==
X-Received: by 2002:a17:907:2ce3:b0:a4e:8c9d:a724 with SMTP id hz3-20020a1709072ce300b00a4e8c9da724mr1807499ejc.69.1712745675912;
        Wed, 10 Apr 2024 03:41:15 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ld10-20020a170906f94a00b00a51cded71f6sm4408050ejb.104.2024.04.10.03.41.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 03:41:15 -0700 (PDT)
Message-ID: <282cc68b-3730-4e8c-94cb-e4013159fad2@redhat.com>
Date: Wed, 10 Apr 2024 12:41:14 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_v1_1/2=5D_media=3A_atomisp=3A_Put_PMIC_dev?=
 =?UTF-8?Q?ice_after_getting_its_I=C2=B2C_address?=
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240326202813.1425431-1-andriy.shevchenko@linux.intel.com>
 <20240326202813.1425431-2-andriy.shevchenko@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240326202813.1425431-2-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 3/26/24 9:27 PM, Andy Shevchenko wrote:
> We don't use the PMIC I²C client device after getting its address.
> Drop the reference to it. We do not expect device to disappear
> as it should be taken care by the OpRegion drivers.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thank you for your patch.

I have merged this in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this patch will be included in my next
pull-request to Mauro (to media subsystem maintainer)

Regards,

Hans



> ---
>  .../media/atomisp/pci/atomisp_gmin_platform.c       | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> index 139ad7ad1dcf..80aa2211cdc3 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> @@ -497,16 +497,19 @@ static u8 gmin_get_pmic_id_and_addr(struct device *dev)
>  	if (pmic_id)
>  		return pmic_i2c_addr;
>  
> -	if (gmin_i2c_dev_exists(dev, PMIC_ACPI_TI, &power))
> +	if (gmin_i2c_dev_exists(dev, PMIC_ACPI_TI, &power)) {
>  		pmic_id = PMIC_TI;
> -	else if (gmin_i2c_dev_exists(dev, PMIC_ACPI_AXP, &power))
> +	} else if (gmin_i2c_dev_exists(dev, PMIC_ACPI_AXP, &power)) {
>  		pmic_id = PMIC_AXP;
> -	else if (gmin_i2c_dev_exists(dev, PMIC_ACPI_CRYSTALCOVE, &power))
> +	} else if (gmin_i2c_dev_exists(dev, PMIC_ACPI_CRYSTALCOVE, &power)) {
>  		pmic_id = PMIC_CRYSTALCOVE;
> -	else
> +	} else {
>  		pmic_id = PMIC_REGULATOR;
> +		return 0;
> +	}
>  
> -	pmic_i2c_addr = power ? power->addr : 0;
> +	pmic_i2c_addr = power->addr;
> +	put_device(&power->dev);
>  	return pmic_i2c_addr;
>  }
>  


