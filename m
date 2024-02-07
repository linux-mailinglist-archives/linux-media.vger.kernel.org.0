Return-Path: <linux-media+bounces-4796-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C010984C84B
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 11:08:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 772E12864AB
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 10:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C2E241EC;
	Wed,  7 Feb 2024 10:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Z1Pk5GCZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9161725601
	for <linux-media@vger.kernel.org>; Wed,  7 Feb 2024 10:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707300492; cv=none; b=DH9E/yJIqKHfby3ikRbLwK0EsRRL70MqoPQVXc0u2ZxmH5y1uOVd4BQfdPJpHUj+8ktCXLN4b+rDF1ehuMWHM81KTUmwGUgV8daQFRb1BC/gWxXkm+Hi5nfXfnLdyrG+XwiZJFxwgf6srLl2tk5Z2O6B2pn1oplNBWpFe+eNb60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707300492; c=relaxed/simple;
	bh=LIBAgFjIK5pNH9NWahlxj4MakrFjWDFL6XvopjqVxHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i+5R2TPa9fYAyZfxSJy84eiDuraxzalnhcyhjJhArszW9hfE8mRluhny7gbf+zkuAM6uRuIlo3yFSqpBcrvgqc5XzVineO6amEtd1vkLqyMuh+tmfxE7XTfqKZo5lIZqEGTb7aEi3Pn1ns9dDQZCuSeJRFOczCp3n7PFF3fdTOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Z1Pk5GCZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 11A27975;
	Wed,  7 Feb 2024 11:06:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707300405;
	bh=LIBAgFjIK5pNH9NWahlxj4MakrFjWDFL6XvopjqVxHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z1Pk5GCZx2ppkZsxWff6tOhMv/JdAHz+lHCQ4PXXFR9Y56RfP2Z8lPMYyUOR6hbRo
	 Vw+SVegu5J2P+2gY9o1p4xBKPt/1K7vl/p50wAxosdArl/XC6l68E2xB8zrw2sGO3b
	 ogTzBaVntSTRif/ZetnBmDb6PpXQyLkOdf7aijfk=
Date: Wed, 7 Feb 2024 12:08:10 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2 10/29] media: mc: Delete character device early
Message-ID: <20240207100810.GG23702@pendragon.ideasonboard.com>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-11-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231220103713.113386-11-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Dec 20, 2023 at 12:36:54PM +0200, Sakari Ailus wrote:
> The parent of the character device related to the media devnode is the
> media devnode. Thus the character device needs to be released before the
> media devnode's release function. Move it to unregistering of the media
> devnode, which mirrors adding the character device in conjunction with
> registering the media devnode.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/mc/mc-devnode.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
> index 7e22938dfd81..8bc7450ac144 100644
> --- a/drivers/media/mc/mc-devnode.c
> +++ b/drivers/media/mc/mc-devnode.c
> @@ -51,9 +51,6 @@ static void media_devnode_release(struct device *cd)
>  
>  	mutex_lock(&media_devnode_lock);
>  
> -	/* Delete the cdev on this minor as well */
> -	cdev_del(&devnode->cdev);
> -
>  	/* Mark device node number as free */
>  	clear_bit(devnode->minor, media_devnode_nums);

Should this be moved to media_devnode_unregister() too ? It can be done
in a separate patch.

>  
> @@ -270,6 +267,7 @@ void media_devnode_unregister(struct media_devnode *devnode)
>  	clear_bit(MEDIA_FLAG_REGISTERED, &devnode->flags);
>  	mutex_unlock(&media_devnode_lock);
>  
> +	cdev_del(&devnode->cdev);

I initially wondered if this could raise with the cdev access in
media_open(), as the media_devnode_lock is released just before calling
cdev_dev(), but my understanding is that the dev/open race is properly
handled in the cdev layer.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I wonder if a similar change in v4l2-dev.c would be beneficial.

>  	device_unregister(&devnode->dev);
>  }
>  

-- 
Regards,

Laurent Pinchart

