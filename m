Return-Path: <linux-media+bounces-5911-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEB1867208
	for <lists+linux-media@lfdr.de>; Mon, 26 Feb 2024 11:52:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C37E51C28F89
	for <lists+linux-media@lfdr.de>; Mon, 26 Feb 2024 10:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B448622626;
	Mon, 26 Feb 2024 10:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ac+BbRkf"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B21F208BC
	for <linux-media@vger.kernel.org>; Mon, 26 Feb 2024 10:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708944513; cv=none; b=DT0XR7L5cQWk6suuDfsLIg2MQk9qEfK6kL9fD3OHAqIeOkU4aXIHVJAsdjhzAL2IjM9r0DamsWfo7RxiiBUGykCSpyaTC4nNinNlOHmWVnpvqJJW1lSG4MoCRY7vHxxEn7whxbd172b9lCkKM5r8YbjJP9HmInv9A4EHxoyXMG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708944513; c=relaxed/simple;
	bh=acLFONxVsgOTr7U735zdjWOky1DA+WSRO0IbU4NPfOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qPAmjvxQTlMrbv4a/XAQlH5MRO8So2X6KtJJ2UyApOo6By/9NkUGoQcCnw0QDypQ3WhgrRnf12zpvTwLm2/Q9cxI5vmdx41uSShehmYwa1vbMgD06jy4XdQZ+uBSD7z1DC5Eqrhx4VeeBYjEFhrZG0q2JEXxsSGHTRnDE2/93NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ac+BbRkf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708944510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3WWbzeMEGRxSialS8tcKozQ9wwd4hRgUVyZjvYbLpxY=;
	b=Ac+BbRkfhyXMb5xLB/YrSyWmdNZerzdx4dtF52abpuXtjpIzGmR1Ct/QB67gp9zKMou3qE
	zA7O1xe3hPcP8WsPV1yzkNsvsgnRyG6h01YZEzkTDFe+ylk6j4b/64HoRzV09DJaTiGoQY
	GtaL/WM5HhV260Y6J9TF52IiQGLtoUI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-PZP6ZZw7OxShBL1eGChj2g-1; Mon, 26 Feb 2024 05:48:27 -0500
X-MC-Unique: PZP6ZZw7OxShBL1eGChj2g-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-56588555f0bso1070043a12.0
        for <linux-media@vger.kernel.org>; Mon, 26 Feb 2024 02:48:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708944506; x=1709549306;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3WWbzeMEGRxSialS8tcKozQ9wwd4hRgUVyZjvYbLpxY=;
        b=DkJB6NLllc6MClZg4oU0hnK8j+b5xWMukUY6j85E4xRFRa0yzbFl48v656nf/Re/mN
         Zcpx6nYy5VI8cKl+t8bJUyy1PQNlpVCPIiFmZ9xsmH7n/2MbvXtolW0nwDft7ixB8ChU
         iIp36xk6XTF60m/Ncifi3XXYhpzTIeHGc0tjLNtqNonujTFJ65wlrE+pAi7VGVvi1BRh
         nslM59CDrDFF6bMXxsHDUjfsIYpL8S7RlSYXYXBomzn1xB2Axmlucn2dH3S8B+sk+FY4
         hXDQXYEFdo9yquIAckmTq5bkHBzVPYCE4z3J6Awv3bjo+RIVUfSpJ0WLUftL9XYYtk6p
         Da6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWlwtqI/yZfxAuEJ7ZOSzW1XpT6g+zdYXlyoDtTIAxevm9ArjMjCKwhPbl96Qu4pnTuRXeBkt38XLGAo6QxVYjtA7zVZPXYNVX2fRA=
X-Gm-Message-State: AOJu0YyLP7EzgFwtMKYfmhyA21QTN1GLb8sN393sQEgeLqTcp0V9Mw4U
	TQ4bV6Q/PoU5XKejcB9uYmRr79Hu3m+TJ7/W81Yr1tF/gNnOvaDMv7BKo4rv6SdvZZHe1c9JLVc
	fl5zW5fTDo83uG4orq9rJxAidz4jPz4HCwWq6xkKcyVAK+Rg5jCyb0prBaD/mDz60tfcH
X-Received: by 2002:a17:906:1745:b0:a3e:7eb1:4bf6 with SMTP id d5-20020a170906174500b00a3e7eb14bf6mr4954343eje.2.1708944506482;
        Mon, 26 Feb 2024 02:48:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/DbS/FCtwKr1Rp5bCbvcrf2BitGmFkRtx+KUkSgHkve9ZbfaEcy17sRDczqZ/+/ba7QExmA==
X-Received: by 2002:a17:906:1745:b0:a3e:7eb1:4bf6 with SMTP id d5-20020a170906174500b00a3e7eb14bf6mr4954332eje.2.1708944506154;
        Mon, 26 Feb 2024 02:48:26 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id rf14-20020a1709076a0e00b00a4339b8b1bbsm1143238ejc.212.2024.02.26.02.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 02:48:25 -0800 (PST)
Message-ID: <1044283e-5059-421b-810b-f5f6938937cc@redhat.com>
Date: Mon, 26 Feb 2024 11:48:24 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: media: atomisp: Fix various formatting issues
 and remove unneccesary braces
Content-Language: en-US
To: Jonathan Bergh <bergh.jonathan@gmail.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240225120350.31226-1-bergh.jonathan@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240225120350.31226-1-bergh.jonathan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jonathan,

On 2/25/24 13:03, Jonathan Bergh wrote:
> This patch fixes the following formatting issues:
>  * Fix various misaligned * and */ in multiline block comments
>  * Remove unnecessary braces from single line conditional statements
>  * Remove repeated word "from" from comment
> 
> Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

(I'll apply this to my atomisp-branch the next time I'm working on that branch).

Regards,

Hans

> ---
>  drivers/staging/media/atomisp/pci/atomisp_cmd.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> index d0db2efe0045..5fa9918c8e1e 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -65,7 +65,8 @@
>   * At 15fps this means 133ms. We set the timeout a bit longer.
>   * Each flash driver is supposed to set its own timeout, but
>   * just in case someone else changed the timeout, we set it
> - * here to make sure we don't damage the flash hardware. */
> + * here to make sure we don't damage the flash hardware.
> + */
>  #define FLASH_TIMEOUT 800 /* ms */
>  
>  union host {
> @@ -1261,11 +1262,10 @@ int atomisp_gdc_cac(struct atomisp_sub_device *asd, int flag,
>  	}
>  
>  	asd->params.gdc_cac_en = !!*value;
> -	if (asd->params.gdc_cac_en) {
> +	if (asd->params.gdc_cac_en)
>  		asd->params.config.morph_table = asd->params.css_param.morph_table;
> -	} else {
> +	else
>  		asd->params.config.morph_table = NULL;
> -	}
>  	asd->params.css_update_params_needed = true;
>  	atomisp_update_capture_mode(asd);
>  	return 0;
> @@ -3035,8 +3035,8 @@ void atomisp_handle_parameter_and_buffer(struct atomisp_video_pipe *pipe)
>  }
>  
>  /*
> -* Function to configure ISP parameters
> -*/
> + * Function to configure ISP parameters
> + */
>  int atomisp_set_parameters(struct video_device *vdev,
>  			   struct atomisp_parameters *arg)
>  {
> @@ -3367,7 +3367,7 @@ int atomisp_fixed_pattern(struct atomisp_sub_device *asd, int flag,
>  		return 0;
>  	}
>  
> -	/* Add function to get black from from sensor with shutter off */
> +	/* Add function to get black from sensor with shutter off */
>  	return 0;
>  }
>  


