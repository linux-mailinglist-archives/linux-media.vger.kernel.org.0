Return-Path: <linux-media+bounces-45233-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAE4BFBC85
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 14:09:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6627563CF6
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 12:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72DFD341644;
	Wed, 22 Oct 2025 12:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ksvjElMm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34263126BA;
	Wed, 22 Oct 2025 12:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761134946; cv=none; b=lbv2et1vo+SVqASnfAGZPBRpJwalbhu6L5CoYH/5DzD6r4WNiS1OOi3b7g0wDi35+CiQ4DGmExmz2XCD5NQodxSACq/p0xkVK0tM43WWSYLBpoNpm1CX2v3wJEh+5TisJfPTh0EuU3XUEdZfrDt7H+GMusUul45nHjlz+G5BHzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761134946; c=relaxed/simple;
	bh=ZwhqgodgvDxpBNdeOXB9Q9P2LbZErwotxNaIasBmTqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EWjF3lQnR4sGxKYWctUWo6W8jDzQ7ajcG9h4JHqQ18UgGk9e1EX8S2wVq15Zg1YErxIElhWINhIUulIyC67QczMFZ3Pc/yA4IPRVt3d8zgvo8InKuDlK0GzZZFb7HjjwPRQ9uHITXNJ6I7ucypJb4Th/Grb55Cmpj47Xt3bSc88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ksvjElMm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 77AFA83D;
	Wed, 22 Oct 2025 14:07:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761134836;
	bh=ZwhqgodgvDxpBNdeOXB9Q9P2LbZErwotxNaIasBmTqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ksvjElMmEgq2mrzAS1/SsUr+EyE9oGawbLR0RigDm8wONXO8StRIgExAdamgV+uPq
	 E19sf2pdHySUP7W6sBQmM5b8sTNm6RhqxvxsNH8VYsQ72TBdcmtmpYparyS6vtq9T9
	 RRaXbQ2t3Q32VpFvLQ9/U7+3423OLV+ZR5a+ZwZs=
Date: Wed, 22 Oct 2025 15:08:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Create a specific id namespace for
 output entities
Message-ID: <20251022120849.GD727@pendragon.ideasonboard.com>
References: <20251022-uvc-grandstream-laurent-v1-1-0925738a3484@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251022-uvc-grandstream-laurent-v1-1-0925738a3484@chromium.org>

On Wed, Oct 22, 2025 at 11:55:16AM +0000, Ricardo Ribalda wrote:
> Nothing can be connected from an output entity. Which means that no

s/output entity/output terminal. Same below.

Did you mean s/from an/to an/ ?

> other entity can reference an output entity as baSourceId.
> 

Some output terminals have controls, so we need to preserve their ID.
That's why my proposal only set the UVC_TERM_OUTPUT bit for the
*streaming* output terminals, not for all output terminals.

> Use this fact to move all the output entities to a different namespace
> id.
> 
> The output entities are usually named after the dev_name() of the usb
> device, so there should not be any uAPI change from this change.
> 
> Although with this change we can handle some id collisions
> automagically, change the logic of uvc_alloc_new_entity() to keep
> showing a warning when a camera has invalid descriptors. Hopefully this
> message will help vendors fix their invalid descriptors.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Hi, this patch fixes support for some devices with invalid USB
> descriptor.
> 
> It is orthogonal to:
> https://lore.kernel.org/linux-media/20251021184213.GC19043@pendragon.ideasonboard.com/T/#t
> 
> Some devices will be fixed by the other patch, other devices will be
> fixed by this. In my opinion is worth to land both patches.
> 
> Tested with GRANDSTREAM GUV3100 in a 6.6 kernel.
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index fb6afb8e84f00961f86fd8f840fba48d706d7a9a..40f8ae0df89e104992f5d55af3d3539dea3d146e 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -165,10 +165,14 @@ static struct uvc_entity *uvc_entity_by_reference(struct uvc_device *dev,
>  	return NULL;
>  }
>  
> +#define ENTITY_HARDWARE_ID(id) ((id) & ~UVC_TERM_OUTPUT)

This needs a UVC_ prefix, and should probably go to uvcvideo.h. You can
also & 0xff, as the UVC descriptors store IDs in 8-bit fields.

> +
>  static struct uvc_streaming *uvc_stream_by_id(struct uvc_device *dev, int id)
>  {
>  	struct uvc_streaming *stream;
>  
> +	id = ENTITY_HARDWARE_ID(id);
> +
>  	list_for_each_entry(stream, &dev->streams, list) {
>  		if (stream->header.bTerminalLink == id)
>  			return stream;
> @@ -810,10 +814,12 @@ static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
>  	}
>  
>  	/* Per UVC 1.1+ spec 3.7.2, the ID is unique. */
> -	if (uvc_entity_by_id(dev, id)) {
> -		dev_err(&dev->intf->dev, "Found multiple Units with ID %u\n", id);
> +	if (uvc_entity_by_id(dev, ENTITY_HARDWARE_ID(id)))
> +		dev_err(&dev->intf->dev, "Found multiple Units with ID %u\n",
> +			ENTITY_HARDWARE_ID(id));

It's not an error anymore if there's no collision of the full 16-bit ID,
right ? Should it be demoted to a dev_warn() ?

> +
> +	if (uvc_entity_by_id(dev, id))
>  		id = UVC_INVALID_ENTITY_ID;
> -	}
>  
>  	extra_size = roundup(extra_size, sizeof(*entity->pads));
>  	if (num_pads)
> @@ -969,6 +975,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  	struct usb_host_interface *alts = dev->intf->cur_altsetting;
>  	unsigned int i, n, p, len;
>  	const char *type_name;
> +	unsigned int id;
>  	u16 type;
>  
>  	switch (buffer[2]) {
> @@ -1107,8 +1114,16 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  			return 0;
>  		}
>  
> +		/*
> +		 * Nothing can be connected from an output terminal. To avoid
> +		 * entity-id's collisions in devices with invalid USB
> +		 * descriptors, move the output terminal id to its own
> +		 * namespace.
> +		 */
> +		id = buffer[3] | UVC_TERM_OUTPUT;
> +
>  		term = uvc_alloc_new_entity(dev, type | UVC_TERM_OUTPUT,
> -					    buffer[3], 1, 0);
> +					    id, 1, 0);
>  		if (IS_ERR(term))
>  			return PTR_ERR(term);
>  
> 
> ---
> base-commit: ea299a2164262ff787c9d33f46049acccd120672
> change-id: 20251022-uvc-grandstream-laurent-3f9abb8a0d5b

-- 
Regards,

Laurent Pinchart

