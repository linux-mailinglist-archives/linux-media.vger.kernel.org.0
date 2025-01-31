Return-Path: <linux-media+bounces-25494-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E85A24170
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 18:00:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26CB41886826
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 17:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 589371EE7D6;
	Fri, 31 Jan 2025 17:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VnHGv+XQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3331EC00C
	for <linux-media@vger.kernel.org>; Fri, 31 Jan 2025 16:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738342800; cv=none; b=UJDOITsR9xDLsEe5RSP1Jj+4JwriL8JDVcUz5KRIhbraQhp30MtqH9DBdpLq501kqXpRRKg1nqmrRRM8MtPbfZEYyrK22SvcG8Nw3v/okxUQLLzPQaFC1pMU8N/DSzEUpdI23QT72xl/QC39KhYrO0KFhfg4UEHEDD9yXT2LUng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738342800; c=relaxed/simple;
	bh=7M7k9qHyU+pUpTcbwQKRuqx3/l7OpNefxmhR/KUi1vw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cljMbDGRfprBG7Hb6UYc/GBorqDxkPyXS5qDdPW6DSgVhKjUzDhIvjfwmD7ibZkq33p50BUStLV4wZBfeYTF2MpFrd/faAF/lzYVQhjfpNolTS+tbQIybXYiJ0uYvVnNdhjBc4VbohXPJ+lCAuWvRW/eqsNF5opX3B6+KfMh/zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VnHGv+XQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D2908465;
	Fri, 31 Jan 2025 17:58:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738342728;
	bh=7M7k9qHyU+pUpTcbwQKRuqx3/l7OpNefxmhR/KUi1vw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VnHGv+XQGY4h3NalHj9Q7SEAFhwH/KQ3vNq/EGUM0KZECWngbn7yTDYBqRqLSbRpj
	 0n1zrLfZiHG6iFCyCrw5O1N5xYPE+FweQq1k63xJJNQux4coQfy9DOzc+U3TFPnCEe
	 19RIe7Rc+gIWNzDvuJiwKLrC7vGZ67taIrFbzm/g=
Date: Fri, 31 Jan 2025 18:59:54 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: linux-media@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>,
	Tomasz Sikora <sikora.tomus@gmail.com>, hverkuil-cisco@xs4all.nl,
	kernel-dev@igalia.com, mchehab@kernel.org,
	syzbot+0584f746fde3d52b4675@syzkaller.appspotmail.com,
	syzbot+dd320d114deb3f5bb79b@syzkaller.appspotmail.com
Subject: Re: [PATCH] Revert "media: uvcvideo: Require entities to have a
 non-zero unique ID"
Message-ID: <20250131165954.GG26841@pendragon.ideasonboard.com>
References: <Z4aeK4Ct7L/9kR2H@quatroqueijos.cascardo.eti.br>
 <20250114200045.1401644-1-cascardo@igalia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250114200045.1401644-1-cascardo@igalia.com>

Hi Thadeu,

Thank you for the patch.

On Tue, Jan 14, 2025 at 05:00:45PM -0300, Thadeu Lima de Souza Cascardo wrote:
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

Cc: stable@vger.kernel.org
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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

-- 
Regards,

Laurent Pinchart

