Return-Path: <linux-media+bounces-8992-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 046E689EFEA
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 12:36:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87B421F230DD
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 10:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6868B1598EF;
	Wed, 10 Apr 2024 10:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TZpU+PyV"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3439F159216
	for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 10:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712745336; cv=none; b=RPLGMtAHYg8tBepGPMfV/IJPyUcoRRe+kkj8W9KLmxv0zqKK9h8gsJ7t19MT2qf+UzHSM9jUwEzeDcfJT09Mh0+/BJnIw2xkNhzQyCWfmpJJENLEZQiSH0S42k1CpCL83MbAW3UOgJT8UL/BkQLmsYOFB+hxadIqB7UXhbdNqPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712745336; c=relaxed/simple;
	bh=rmoFoakUhj6+msUlbauZkAYDvK64i2LrXOHiREfUozo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PaUVSSPRJ9A/emAHooHhFvnkxBmFCIe1ZUfKmfwlgN3/JTLfbapVSsovJ+N9k/ck90wAr+UfOihpjn5YtpiW6W13bK9QSQVOEFNPxipWGBVJr3RTeF+8vc/EQA33WYUWrFFgHveFh2fdxXnKHv6Z/l9AlPBQ+PtdyA1NK6t0avE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TZpU+PyV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712745334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uYnQ58s+I6zMZkaWsRCCBmtK31C23SKzGz7dYRh7GvU=;
	b=TZpU+PyV86BomVfYhoJmjVlvmNYQni23yWo/qzlZGKeP979mqO6GJgg9wZRKMcmlkoIUJR
	SdyxP6HJeqDoSpqHlFDSqtwp1dEQ7QhVu8792gLJXw1T2k/fleJ8kHyYdCvZy7aqVJPeLV
	P9kRVJH0tUtXKOrnSSID6hAoAc/JLRQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-ktwNgdPxMjWe4Wgo3UmmuA-1; Wed, 10 Apr 2024 06:35:32 -0400
X-MC-Unique: ktwNgdPxMjWe4Wgo3UmmuA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a450265c7b6so318026666b.0
        for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 03:35:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712745331; x=1713350131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uYnQ58s+I6zMZkaWsRCCBmtK31C23SKzGz7dYRh7GvU=;
        b=I9iV7Uff5+FO8BU/aTB9SAAvclwrGv/PUdd8Kyj/UGwurWR2kWjQsAOmCHDach+GE2
         nBPV/jA1vWXQcsKYT+F/pVT3IDnTtGzmPfI2o9SfYv2zRo9iqTlNqYelAiwB44TjNS8Q
         PiqpXDz9Gq7M20sKkApyGOgXpcKkslJEPHmRN3zhdi/RuyBdcKV/lH6yxre4HYG/Ms0i
         6la4pbA/o5G19D7e48ecKEFm1wpkDuFdAyJH85i5OaFSrjSn3K0xEJdVjngxzOzx6AqY
         26wvXNPQbLVY/nEfENYTTaGNru8ZVcQV4tpINaRvpHSh89RtkgzuJ0BuQqoij4psEHdu
         BGcg==
X-Forwarded-Encrypted: i=1; AJvYcCUFr1wU3eD5Q5RvZHp2F+IJR4IeaKGj9v7QoBDHdGs3oIK9CUdGhQC18uWeTbgts5qG5e+mbOrk1bGPrhJhRhDA8MNP0lfpbXNAV5k=
X-Gm-Message-State: AOJu0YyqhnfWfn2PGfOJPbqfR59eXzPHeMCjFMXbZ7Kx6FKn5Ey5KNDS
	Tnyadx1/NBdw0Qo9b/iVlxbf5n0fOmTsjxtNvFsVjLN+iKzyYpn98XQn3cRqdItd48kImvQdLfR
	2u74/nad6/Gva4hB4x0t0ZRmuIvNrZ77l6RrtYcyIYRZnHi65hSdckQjRaZ0Q
X-Received: by 2002:a17:907:7f88:b0:a4e:146c:ff09 with SMTP id qk8-20020a1709077f8800b00a4e146cff09mr1571288ejc.7.1712745331567;
        Wed, 10 Apr 2024 03:35:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEl/DgE8lML4A21OOZtzpiFdYYtgIOsGkpz5Iu44RPGGo4g+/OgXBdiq8ILcRIkcBjkwrdv0g==
X-Received: by 2002:a17:907:7f88:b0:a4e:146c:ff09 with SMTP id qk8-20020a1709077f8800b00a4e146cff09mr1571263ejc.7.1712745330852;
        Wed, 10 Apr 2024 03:35:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id cw23-20020a170906c79700b00a51bf5932aesm5274595ejb.28.2024.04.10.03.35.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 03:35:30 -0700 (PDT)
Message-ID: <c9741df0-6c12-4ff5-90b4-5a13f0bd9b51@redhat.com>
Date: Wed, 10 Apr 2024 12:35:29 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] media: atomisp: Replace open-coded
 i2c_find_device_by_fwnode()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240326202813.1425431-1-andriy.shevchenko@linux.intel.com>
 <20240326202813.1425431-3-andriy.shevchenko@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240326202813.1425431-3-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andy,

Thank you for the patch.

On 3/26/24 9:27 PM, Andy Shevchenko wrote:
> gmin_i2c_dev_exists() is using open-coded variant of
> i2c_find_device_by_fwnode(). Replace it with a corresponding call.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> index 80aa2211cdc3..b7c477280986 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> @@ -394,12 +394,10 @@ static struct i2c_client *gmin_i2c_dev_exists(struct device *dev, char *name,
>  	if (!adev)
>  		return NULL;
>  
> -	d = bus_find_device_by_acpi_dev(&i2c_bus_type, adev);
> +	d = get_device(acpi_get_first_physical_node(adev));
>  	acpi_dev_put(adev);
> -	if (!d)
> -		return NULL;
>  
> -	*client = i2c_verify_client(d);
> +	*client = i2c_find_device_by_fwnode(dev_fwnode(d));
>  	put_device(d);
>  
>  	dev_dbg(dev, "found '%s' at address 0x%02x, adapter %d\n",

If we are ging to simplify this I think the change should be:

From ea66d15b9a72fcb8baf22a2ff059f2b842a91b67 Mon Sep 17 00:00:00 2001
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Wed, 10 Apr 2024 12:32:11 +0200
Subject: [PATCH] media: atomisp: Replace open-coded
 i2c_find_device_by_fwnode()

gmin_i2c_dev_exists() is using open-coded variant of
i2c_find_device_by_fwnode(). Replace it with a corresponding call.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Directly use the ACPI fwnode through acpi_fwnode_handle(adev) instead
  of first calling acpi_get_first_physical_node(adev)
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 804ffff245f3..ed6214327ce5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -394,14 +394,11 @@ static struct i2c_client *gmin_i2c_dev_exists(struct device *dev, char *name,
 	if (!adev)
 		return NULL;
 
-	d = bus_find_device_by_acpi_dev(&i2c_bus_type, adev);
+	*client = i2c_find_device_by_fwnode(acpi_fwnode_handle(adev));
 	acpi_dev_put(adev);
-	if (!d)
+	if (!*client)
 		return NULL;
 
-	*client = i2c_verify_client(d);
-	put_device(d);
-
 	dev_dbg(dev, "found '%s' at address 0x%02x, adapter %d\n",
 		(*client)->name, (*client)->addr, (*client)->adapter->nr);
 	return *client;
-- 
2.44.0

Note I added a:

	if (!*client)
		return NULL;

To fix a bug in the original code where the dev_dbg() arguments
are dereferencing a potential NULL *client ptr.

I'm going to merge this variant into my media-atomisp branch
instead of the orignal.

Regards,

Hans




