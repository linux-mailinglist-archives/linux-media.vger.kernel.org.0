Return-Path: <linux-media+bounces-3569-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC65682B012
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 14:57:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90B661F2134B
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 13:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2CCA3B198;
	Thu, 11 Jan 2024 13:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="goRd4aut"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D863AC10
	for <linux-media@vger.kernel.org>; Thu, 11 Jan 2024 13:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704981389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Drtd5A/+Ip1LcQCeFzUZf8VoybqTl9YZAc3HkV4qPE=;
	b=goRd4autyyFHByNcXBaF0FBvrph1d3wLnJnU7UKP7izB5aJrEqwBH8hdQm7nN/e2U3D2BL
	ftGJBzZUxeDfBMqfuR4eoxZ0NhzKIgm1JlIxlg+81XfCaxhY2TmTBGD1i2DCRtDEIQOFhL
	OC2JFkx029Jnj3qL0nBJJH2Hhnxz9O8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-1czo421hOomAmJ7eYyXIWg-1; Thu, 11 Jan 2024 08:56:28 -0500
X-MC-Unique: 1czo421hOomAmJ7eYyXIWg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a2c4e9cb449so46835666b.1
        for <linux-media@vger.kernel.org>; Thu, 11 Jan 2024 05:56:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704981387; x=1705586187;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Drtd5A/+Ip1LcQCeFzUZf8VoybqTl9YZAc3HkV4qPE=;
        b=txPVk7pzZtH9AEsSnV+2pfZC3ZcTDHRj/o8fELrT3SiQjy/E822sqHN+Li1EKi15Mp
         gEUOvtvapLbClwcuMkVyNYoPOp7iwnHKiK02IPlTAZinar8w3EAr2TY6YR8m0eSOFocr
         q3EId62SBKnekOt7LFc+z1/xfC1Dqm+8um1TeDq3quRRb8VBLYeVDgQ/kOzICaQH/2TX
         NY64PFf6ku0FFdFX31KOu1M5+mrMCp+ooceC+WtG2dKFSxyFO0dY2EvyUKt35e1f0GnT
         2Uj1wzP7ZhmfXDLfQN6IhAgCi2xD72SWmfexy+uBAteuzWBh8FtEVShYjcdXi02FjBpV
         drdQ==
X-Gm-Message-State: AOJu0YyLaHvG2/GHtpkmAuBFGouek9SGrFK6CzDCCJXNgPK//TotSE5J
	IIJJHj18SSeR/rlXQie3zdA4bWYVWlgf7KSJq3mQUqC8fq5OntJwY3Vy3BXnOKOlaZpXuKe8v3v
	+VRA+qijlXBJTOpQb4qAbvRV4hMtlpSY=
X-Received: by 2002:a17:906:40c2:b0:a28:c06d:a3c with SMTP id a2-20020a17090640c200b00a28c06d0a3cmr338335ejk.144.1704981387380;
        Thu, 11 Jan 2024 05:56:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3lYT0mvREHzTEnWC6amP++d44oPYwF1LCtLcsy41MW5xAfLswQ1AarBZtO5qfeGe9luBiJQ==
X-Received: by 2002:a17:906:40c2:b0:a28:c06d:a3c with SMTP id a2-20020a17090640c200b00a28c06d0a3cmr338330ejk.144.1704981387056;
        Thu, 11 Jan 2024 05:56:27 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id hx25-20020a170906847900b00a26ac57b951sm609136ejc.23.2024.01.11.05.56.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 05:56:26 -0800 (PST)
Message-ID: <bd0c8117-eec0-4fc3-a036-d0dfb078c1f8@redhat.com>
Date: Thu, 11 Jan 2024 14:56:25 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: v4l2: cci: print leading 0 on error
To: Julien Massot <julien.massot@collabora.com>
Cc: sakari.ailus@linux.intel.com, linux-media@vger.kernel.org
References: <20240111132003.2778044-1-julien.massot@collabora.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240111132003.2778044-1-julien.massot@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/11/24 14:20, Julien Massot wrote:
> In some error cases leading '0' for register address
> were missing.
> 
> Fixes: 613cbb91e9ce ("media: Add MIPI CCI register access helper functions")
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/media/v4l2-core/v4l2-cci.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-cci.c b/drivers/media/v4l2-core/v4l2-cci.c
> index 10005c80f43b..ee3475bed37f 100644
> --- a/drivers/media/v4l2-core/v4l2-cci.c
> +++ b/drivers/media/v4l2-core/v4l2-cci.c
> @@ -32,7 +32,7 @@ int cci_read(struct regmap *map, u32 reg, u64 *val, int *err)
>  
>  	ret = regmap_bulk_read(map, reg, buf, len);
>  	if (ret) {
> -		dev_err(regmap_get_device(map), "Error reading reg 0x%4x: %d\n",
> +		dev_err(regmap_get_device(map), "Error reading reg 0x%04x: %d\n",
>  			reg, ret);
>  		goto out;
>  	}
> @@ -131,7 +131,7 @@ int cci_write(struct regmap *map, u32 reg, u64 val, int *err)
>  
>  	ret = regmap_bulk_write(map, reg, buf, len);
>  	if (ret)
> -		dev_err(regmap_get_device(map), "Error writing reg 0x%4x: %d\n",
> +		dev_err(regmap_get_device(map), "Error writing reg 0x%04x: %d\n",
>  			reg, ret);
>  
>  out:


