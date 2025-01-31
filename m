Return-Path: <linux-media+bounces-25490-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5831A240E4
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 17:42:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7509716A652
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 16:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B907B1F2C21;
	Fri, 31 Jan 2025 16:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fPa8SsDG"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B331F2382
	for <linux-media@vger.kernel.org>; Fri, 31 Jan 2025 16:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738341356; cv=none; b=nZ2W985so45Sw5PKGZZQxZhQ/zAk7uElI56USEWOz/t+YQ1OWhbM/0TTYUWP4q+gFgYZs3pKKWep3hpVj56SFKPh0RZf3TSNoGc54+Kmn1XhWfJut7tvjJipzULD8haU1C0+pYZBbPIFttvTuZoVeTi5414iTk9bW+JTPjq86YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738341356; c=relaxed/simple;
	bh=1UEYbcQJ+r4bTe14Orc7DT07FHZPCZcxq6AhkCGtMiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sA8mt0oL+mJjrssteK6YRxU3vBg/0dwWzCs+yd3gti273d+KlGqLmJ9c64eg4XQNwGaohmlOEr33kP2Qxi4PLNmuR1c02DNntIow4PFwZSrAgBMp6AQv/vfD2CbqivQI3F8r3Malf8tiYP985qVc68NDdqIEl+vj5Ryl6tuCdp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fPa8SsDG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738341352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qm129Etaddz+4rIOGdNyfIIC42hk9hBHTgPUVAOL4FE=;
	b=fPa8SsDGMAZ2Tvim0Hs5pSndhqNRCcbdmJKNvvbt7lpsi2Wd2XbhYKwKck4auhdo2Ytzc6
	mLMoJFj6PzFR1K6yaV3qUZ52EWDy8vaqDxsgVC/7/WH2NBwuB+jNLS3tr2TT8+hnYd0oeJ
	H/YBdgWwOvVVHWXkuY51yBc3DvFSyZ0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-p-ft4plMPsSq6kXKpHxt7g-1; Fri, 31 Jan 2025 11:35:50 -0500
X-MC-Unique: p-ft4plMPsSq6kXKpHxt7g-1
X-Mimecast-MFC-AGG-ID: p-ft4plMPsSq6kXKpHxt7g
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3862f3ccf4fso959904f8f.0
        for <linux-media@vger.kernel.org>; Fri, 31 Jan 2025 08:35:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738341349; x=1738946149;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qm129Etaddz+4rIOGdNyfIIC42hk9hBHTgPUVAOL4FE=;
        b=Wtl7iptD9+IcVOwY8teFqPFiVtoUvVscFWCoAWmATIa3PX2bdHKc4GTzdiN5sHckMY
         9wAPuYCudO/clNLPoEqd8P/H6p9Yl+yituuwyCovfPaYg9laif/cbVoaiqIwMw4HsSHr
         oPuKwFMu3LAdwivh1TjXdLu7aOCmvf+LFcyCcleldukw/zSDs6c67W5YnxDpmplAEEYI
         Xp64z18vfXB9UmzJcjmzV2SWzhQYX7Kac/8QZK1pec/ibZIE+HpfbG4EOWSAPTrlQQ28
         t9NETAxhBsRRuEI5ToRZsQiwWdjE+7UPHPeK3t6DUQa/kfwE0ivWFVy3HuEE8CfB3hNp
         LEeg==
X-Forwarded-Encrypted: i=1; AJvYcCXm/Xa9BkuP2Mk8NSbKzHKLmr7TCD/5eeJ7/E6yiROW+CzT8OnZRvSAY1kWcf/TjbRsZwnWBf1QlxHdXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUJj+as39fl8H8VvU4dyythmbI8KrsjLk9ABjAdAGFPrGMTtxi
	A8dQwNwcS4W2vymaQlIDykyQo+c8eFmpuxsa3PorUH3qgs7WIMhwOkEmCFWsEXl4VOhTTmEq8Xo
	1x8SQYfj32G62tTw8H1sLmwNQp5l6qjo1T9/1/uc8JpdDqCBVq1EYVN8uDhmQ
X-Gm-Gg: ASbGncuTaOmMSb9n3bwV+LtqQU3/fnnqmSvppwMOG0YouMbPgnpybDZzfmzWDNLMxNB
	gTXLMOXgSTSzYXZ6BX2UJJfZmRP9aGV18bAeZdRbUIIqC2DZyy7qmsV29uzJ1bvQkFb9kJctIA3
	Sl4hlriThjte9Q5xdTnVdtaBoh0yNQcS/JWMASGheyqJFg9UHa/tpKmMPcv1WaxiMMiY8Akc8Te
	+x5QLLXHCcKrysRHXIFDvhlc6apLRN2fLL6gkGV6khmyXOMRBFWJ6zBzaD0FamwuvrEwHhi+2Bx
	wRWenA==
X-Received: by 2002:adf:f504:0:b0:38b:e109:1e0d with SMTP id ffacd0b85a97d-38c520b6629mr8874385f8f.49.1738341349149;
        Fri, 31 Jan 2025 08:35:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHsBhNbIn9OHO2tNdKTaPdrhkvSW8n4L4/gOoAL7i5dXy1MVBan02R/nudzR6jkxk5VrtDCeQ==
X-Received: by 2002:adf:f504:0:b0:38b:e109:1e0d with SMTP id ffacd0b85a97d-38c520b6629mr8874357f8f.49.1738341348721;
        Fri, 31 Jan 2025 08:35:48 -0800 (PST)
Received: from [10.1.19.242] ([82.146.96.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b57ccsm5101657f8f.79.2025.01.31.08.35.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 08:35:47 -0800 (PST)
Message-ID: <1c952ee3-08bc-4a0a-b7f7-c1b7910e33f9@redhat.com>
Date: Fri, 31 Jan 2025 17:35:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "media: uvcvideo: Require entities to have a
 non-zero unique ID"
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 linux-media@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomasz Sikora <sikora.tomus@gmail.com>, hverkuil-cisco@xs4all.nl,
 kernel-dev@igalia.com, mchehab@kernel.org,
 syzbot+0584f746fde3d52b4675@syzkaller.appspotmail.com,
 syzbot+dd320d114deb3f5bb79b@syzkaller.appspotmail.com
References: <Z4aeK4Ct7L/9kR2H@quatroqueijos.cascardo.eti.br>
 <20250114200045.1401644-1-cascardo@igalia.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250114200045.1401644-1-cascardo@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 14-Jan-25 21:00, Thadeu Lima de Souza Cascardo wrote:
> This reverts commit 3dd075fe8ebbc6fcbf998f81a75b8c4b159a6195.
> 
> Tomasz has reported that his device, Generalplus Technology Inc. 808 Camera,
> with ID 1b3f:2002, stopped being detected:
> 
> $ ls -l /dev/video*
> zsh: no matches found: /dev/video*
> [    7.230599] usb 3-2: Found multiple Units with ID 5
> 
> This particular device is non-compliant, having both the Output Terminal
> and Processing Unit with ID 5. uvc_scan_fallback, though, is able to build
> a chain. However, when media elements are added and uvc_mc_create_links
> call uvc_entity_by_id, it will get the incorrect entity,
> media_create_pad_link will WARN, and it will fail to register the entities.
> 
> In order to reinstate support for such devices in a timely fashion,
> reverting the fix for these warnings is appropriate. A proper fix that
> considers the existence of such non-compliant devices will be submitted in
> a later development cycle.
> 
> Reported-by: Tomasz Sikora <sikora.tomus@gmail.com>
> Fixes: 3dd075fe8ebb ("media: uvcvideo: Require entities to have a non-zero unique ID")
> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>

Since no other fix has been found in a timely matter lets move forward with
this fix:

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans





> ---
>  drivers/media/usb/uvc/uvc_driver.c | 70 ++++++++++++------------------
>  1 file changed, 27 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index b3c8411dc05c..9febd2375636 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -775,27 +775,14 @@ static const u8 uvc_media_transport_input_guid[16] =
>  	UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
>  static const u8 uvc_processing_guid[16] = UVC_GUID_UVC_PROCESSING;
>  
> -static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
> -					       u16 id, unsigned int num_pads,
> -					       unsigned int extra_size)
> +static struct uvc_entity *uvc_alloc_entity(u16 type, u16 id,
> +		unsigned int num_pads, unsigned int extra_size)
>  {
>  	struct uvc_entity *entity;
>  	unsigned int num_inputs;
>  	unsigned int size;
>  	unsigned int i;
>  
> -	/* Per UVC 1.1+ spec 3.7.2, the ID should be non-zero. */
> -	if (id == 0) {
> -		dev_err(&dev->udev->dev, "Found Unit with invalid ID 0.\n");
> -		return ERR_PTR(-EINVAL);
> -	}
> -
> -	/* Per UVC 1.1+ spec 3.7.2, the ID is unique. */
> -	if (uvc_entity_by_id(dev, id)) {
> -		dev_err(&dev->udev->dev, "Found multiple Units with ID %u\n", id);
> -		return ERR_PTR(-EINVAL);
> -	}
> -
>  	extra_size = roundup(extra_size, sizeof(*entity->pads));
>  	if (num_pads)
>  		num_inputs = type & UVC_TERM_OUTPUT ? num_pads : num_pads - 1;
> @@ -805,7 +792,7 @@ static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
>  	     + num_inputs;
>  	entity = kzalloc(size, GFP_KERNEL);
>  	if (entity == NULL)
> -		return ERR_PTR(-ENOMEM);
> +		return NULL;
>  
>  	entity->id = id;
>  	entity->type = type;
> @@ -917,10 +904,10 @@ static int uvc_parse_vendor_control(struct uvc_device *dev,
>  			break;
>  		}
>  
> -		unit = uvc_alloc_new_entity(dev, UVC_VC_EXTENSION_UNIT,
> -					    buffer[3], p + 1, 2 * n);
> -		if (IS_ERR(unit))
> -			return PTR_ERR(unit);
> +		unit = uvc_alloc_entity(UVC_VC_EXTENSION_UNIT, buffer[3],
> +					p + 1, 2*n);
> +		if (unit == NULL)
> +			return -ENOMEM;
>  
>  		memcpy(unit->guid, &buffer[4], 16);
>  		unit->extension.bNumControls = buffer[20];
> @@ -1029,10 +1016,10 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  			return -EINVAL;
>  		}
>  
> -		term = uvc_alloc_new_entity(dev, type | UVC_TERM_INPUT,
> -					    buffer[3], 1, n + p);
> -		if (IS_ERR(term))
> -			return PTR_ERR(term);
> +		term = uvc_alloc_entity(type | UVC_TERM_INPUT, buffer[3],
> +					1, n + p);
> +		if (term == NULL)
> +			return -ENOMEM;
>  
>  		if (UVC_ENTITY_TYPE(term) == UVC_ITT_CAMERA) {
>  			term->camera.bControlSize = n;
> @@ -1088,10 +1075,10 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  			return 0;
>  		}
>  
> -		term = uvc_alloc_new_entity(dev, type | UVC_TERM_OUTPUT,
> -					    buffer[3], 1, 0);
> -		if (IS_ERR(term))
> -			return PTR_ERR(term);
> +		term = uvc_alloc_entity(type | UVC_TERM_OUTPUT, buffer[3],
> +					1, 0);
> +		if (term == NULL)
> +			return -ENOMEM;
>  
>  		memcpy(term->baSourceID, &buffer[7], 1);
>  
> @@ -1110,10 +1097,9 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  			return -EINVAL;
>  		}
>  
> -		unit = uvc_alloc_new_entity(dev, buffer[2], buffer[3],
> -					    p + 1, 0);
> -		if (IS_ERR(unit))
> -			return PTR_ERR(unit);
> +		unit = uvc_alloc_entity(buffer[2], buffer[3], p + 1, 0);
> +		if (unit == NULL)
> +			return -ENOMEM;
>  
>  		memcpy(unit->baSourceID, &buffer[5], p);
>  
> @@ -1133,9 +1119,9 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  			return -EINVAL;
>  		}
>  
> -		unit = uvc_alloc_new_entity(dev, buffer[2], buffer[3], 2, n);
> -		if (IS_ERR(unit))
> -			return PTR_ERR(unit);
> +		unit = uvc_alloc_entity(buffer[2], buffer[3], 2, n);
> +		if (unit == NULL)
> +			return -ENOMEM;
>  
>  		memcpy(unit->baSourceID, &buffer[4], 1);
>  		unit->processing.wMaxMultiplier =
> @@ -1162,10 +1148,9 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  			return -EINVAL;
>  		}
>  
> -		unit = uvc_alloc_new_entity(dev, buffer[2], buffer[3],
> -					    p + 1, n);
> -		if (IS_ERR(unit))
> -			return PTR_ERR(unit);
> +		unit = uvc_alloc_entity(buffer[2], buffer[3], p + 1, n);
> +		if (unit == NULL)
> +			return -ENOMEM;
>  
>  		memcpy(unit->guid, &buffer[4], 16);
>  		unit->extension.bNumControls = buffer[20];
> @@ -1305,10 +1290,9 @@ static int uvc_gpio_parse(struct uvc_device *dev)
>  		return dev_err_probe(&dev->udev->dev, irq,
>  				     "No IRQ for privacy GPIO\n");
>  
> -	unit = uvc_alloc_new_entity(dev, UVC_EXT_GPIO_UNIT,
> -				    UVC_EXT_GPIO_UNIT_ID, 0, 1);
> -	if (IS_ERR(unit))
> -		return PTR_ERR(unit);
> +	unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
> +	if (!unit)
> +		return -ENOMEM;
>  
>  	unit->gpio.gpio_privacy = gpio_privacy;
>  	unit->gpio.irq = irq;


