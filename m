Return-Path: <linux-media+bounces-24701-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DC0A0C0BD
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 19:51:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41230167F1B
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 18:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60F441C461F;
	Mon, 13 Jan 2025 18:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qF7lBPri"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EF91C07C9
	for <linux-media@vger.kernel.org>; Mon, 13 Jan 2025 18:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736794272; cv=none; b=nxuc7+1bq+cHb/9PIHCnaSQ2LUFDuKQfZ0+KThmdBj/eiS4+3tC+gfKszzzNXj67eHBSQc5qxCYalIvYgX+AOKf18vTqA1LKcbQuKKwuUTn8GwBG9DgFuTfg3wgeVdNOFyapPQqawXNtYlWz/h6jHzDzkawtM+PfFeb1/8rNKjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736794272; c=relaxed/simple;
	bh=Ku5MQx/JGSKDt/q3+6nrf/2vIBqg6odC+A0vjFo+9aU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MBPP/9ItebfTqnGj/HeAwkhmDhGAaK5KoCTmeaz6wxhxJO8sqmCaaTsMNlcz6zUTPNZAfu4hQWVv74ZREejLhDDfNvulUt2E0kEnDAVdXzG+H2vlXMhMGeE1PM2bqhBXcSJfueBqW0EWhkNWSzkXQWpLNdJpVOLoFKgJhz1F8B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qF7lBPri; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F3B3250;
	Mon, 13 Jan 2025 19:50:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736794206;
	bh=Ku5MQx/JGSKDt/q3+6nrf/2vIBqg6odC+A0vjFo+9aU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qF7lBPriIFHAzeK5l+TrJVC25FkWyR/O5+FPJAa2Eq4XNCJLBZSmYl87xhRdsgiDS
	 Qrp+1SHxzYFfYTgvxSY9VSH1hYEo36tjLwbWhv1lvP6vZS9fwPBEESDhfd30iKfeg6
	 B7a6PVTX0RsgynxEb2iHn//dTj7uOcASXlMs8p9g=
Date: Mon, 13 Jan 2025 20:50:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: Tomasz Sikora <sikora.tomus@gmail.com>, hverkuil-cisco@xs4all.nl,
	kernel-dev@igalia.com, linux-media@vger.kernel.org,
	mchehab@kernel.org, ribalda@chromium.org,
	syzbot+0584f746fde3d52b4675@syzkaller.appspotmail.com,
	syzbot+dd320d114deb3f5bb79b@syzkaller.appspotmail.com
Subject: Re: [PATCH v3 1/1] media: uvcvideo: require entities to have a
 non-zero unique ID
Message-ID: <20250113185059.GA30724@pendragon.ideasonboard.com>
References: <CADBf=5nJVddk-yPVw3T5GH9JEPOxnO8McPJHaxtnPBvLCnp42Q@mail.gmail.com>
 <Z3u2vHFVPYTmCnwj@quatroqueijos.cascardo.eti.br>
 <CADBf=5nS8_cQvG3mRnXe_MGYmFMh=Myf_eptPqN9hgNMu73Wjg@mail.gmail.com>
 <Z36ad0OxZBnQ0Kxx@quatroqueijos.cascardo.eti.br>
 <20250108153637.GE32541@pendragon.ideasonboard.com>
 <Z36gMvN0XxfXwE82@quatroqueijos.cascardo.eti.br>
 <CADBf=5m0WVMJbVfDvpFdqoYdKj=nT+mOW=D-Q2MJJ=TCbsTMuQ@mail.gmail.com>
 <Z3+pQ/xVdpiE/1GN@quatroqueijos.cascardo.eti.br>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z3+pQ/xVdpiE/1GN@quatroqueijos.cascardo.eti.br>

On Thu, Jan 09, 2025 at 07:47:31AM -0300, Thadeu Lima de Souza Cascardo wrote:
> On Wed, Jan 08, 2025 at 11:14:28PM +0100, Tomasz Sikora wrote:
> > Hello,
> > you right
> > I have in dmsg (line 1228):
> > [   12.981124] usb 3-2: Failed to create links for entity 5
> > [   12.981126] usb 3-2: Failed to register entities (-22).
> > 
> > full output in my log.
> 
> Thanks, Tomasz.
> 
> Can you test the attached fix? It should still keep the warning about the
> multiple units with the same ID, but now it would not return an error nor
> warn when registering the entities.
> 
> Cascardo.

> From f771f5c4657ed25ae36784bf13992ddbee3161e6 Mon Sep 17 00:00:00 2001
> From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> Date: Thu, 9 Jan 2025 07:37:41 -0300
> Subject: [PATCH RFC] media: uvcvideo: restore support for non-compliant devices
> 
> Some real-world devices have multiple units with the same ID. When creating
> their media entities, it would lead to warnings and failure to create such
> entities. However, the V4L2 devices would still be created and work.
> 
> Restore their support, but still warn about the multiple units with the
> same ID. Avoid the failure in navigating through the chain by storing

What's "the failure" here ?

> pointers to the entities instead of only their IDs.

Missing SoB and Fixes tags.

The commit message should explain why this is better than reverting
3dd075fe8ebb ("media: uvcvideo: Require entities to have a non-zero
unique ID"). I'm wondering if a revert with a clean fix on top may not
be easier to review.

> ---
>  drivers/media/usb/uvc/uvc_driver.c | 16 +++++++++++-----
>  drivers/media/usb/uvc/uvc_entity.c |  4 +++-
>  drivers/media/usb/uvc/uvcvideo.h   |  1 +
>  3 files changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 1a22364f7da9..dd81067f8d30 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -791,10 +791,8 @@ static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
>  	}
>  
>  	/* Per UVC 1.1+ spec 3.7.2, the ID is unique. */
> -	if (uvc_entity_by_id(dev, id)) {
> -		dev_err(&dev->udev->dev, "Found multiple Units with ID %u\n", id);
> -		return ERR_PTR(-EINVAL);
> -	}
> +	if (uvc_entity_by_id(dev, id))
> +		dev_warn(&dev->udev->dev, "Found multiple Units with ID %u\n", id);
>  
>  	extra_size = roundup(extra_size, sizeof(*entity->pads));
>  	if (num_pads)
> @@ -802,7 +800,7 @@ static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
>  	else
>  		num_inputs = 0;
>  	size = sizeof(*entity) + extra_size + sizeof(*entity->pads) * num_pads
> -	     + num_inputs;
> +	     + num_inputs + sizeof(struct uvc_entity *) * num_inputs;
>  	entity = kzalloc(size, GFP_KERNEL);
>  	if (entity == NULL)
>  		return ERR_PTR(-ENOMEM);
> @@ -840,6 +838,7 @@ static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
>  
>  	entity->bNrInPins = num_inputs;
>  	entity->baSourceID = (u8 *)(&entity->pads[num_pads]);
> +	entity->source_entities = (struct uvc_entity **)(&entity->baSourceID[num_inputs]);
>  
>  	return entity;
>  }
> @@ -1503,6 +1502,7 @@ static int uvc_scan_chain_forward(struct uvc_video_chain *chain,
>  				}
>  
>  				forward->baSourceID[0] = source->id;
> +				forward->source_entities[0] = source;
>  			}
>  
>  			list_add_tail(&forward->chain, &chain->entities);
> @@ -1586,6 +1586,8 @@ static int uvc_scan_chain_backward(struct uvc_video_chain *chain,
>  				return -EINVAL;
>  			}
>  
> +			entity->source_entities[i] = term;
> +
>  			uvc_dbg_cont(PROBE, " %d", term->id);
>  
>  			list_add_tail(&term->chain, &chain->entities);
> @@ -1620,6 +1622,8 @@ static int uvc_scan_chain_backward(struct uvc_video_chain *chain,
>  		return -EINVAL;
>  	}
>  
> +	(*_entity)->source_entities[0] = entity;
> +
>  	*_entity = entity;
>  	return 0;
>  }
> @@ -1783,6 +1787,7 @@ static int uvc_scan_fallback(struct uvc_device *dev)
>  			goto error;
>  
>  		prev->baSourceID[0] = entity->id;
> +		prev->source_entities[0] = entity;
>  		prev = entity;
>  	}
>  
> @@ -1790,6 +1795,7 @@ static int uvc_scan_fallback(struct uvc_device *dev)
>  		goto error;
>  
>  	prev->baSourceID[0] = iterm->id;
> +	prev->source_entities[0] = iterm;
>  
>  	list_add_tail(&chain->list, &dev->chains);
>  
> diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
> index cc68dd24eb42..7f42292b7fde 100644
> --- a/drivers/media/usb/uvc/uvc_entity.c
> +++ b/drivers/media/usb/uvc/uvc_entity.c
> @@ -36,7 +36,9 @@ static int uvc_mc_create_links(struct uvc_video_chain *chain,
>  		if (!(entity->pads[i].flags & MEDIA_PAD_FL_SINK))
>  			continue;
>  
> -		remote = uvc_entity_by_id(chain->dev, entity->baSourceID[i]);
> +		remote = entity->source_entities[i];
> +		if (remote == NULL)
> +			remote = uvc_entity_by_id(chain->dev, entity->baSourceID[i]);

That looks worrying. Why would source_entities[i] be NULL ?

Devices with bad descriptors can lead to crashes, and it's important to
harden the code. Just warning about duplicate ideas and adding a
source_entities array that may or may not point to the right source (and
could point to NULL) doesn't seem to go in the right direction.

Other options include adding a device-specific quirk that overrides the
incorrect entity IDs, or, possibly better, implementing a heuristic to
fix those automatically.

>  		if (remote == NULL || remote->num_pads == 0)
>  			return -EINVAL;
>  
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 07f9921d83f2..a4ee79e4e85b 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -239,6 +239,7 @@ struct uvc_entity {
>  
>  	u8 bNrInPins;
>  	u8 *baSourceID;
> +	struct uvc_entity **source_entities;
>  
>  	int (*get_info)(struct uvc_device *dev, struct uvc_entity *entity,
>  			u8 cs, u8 *caps);

-- 
Regards,

Laurent Pinchart

