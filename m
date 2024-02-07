Return-Path: <linux-media+bounces-4821-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E337784CC7C
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 15:18:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A032B286E4C
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 14:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 850D97C095;
	Wed,  7 Feb 2024 14:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Qr+xbpFP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AB17604B
	for <linux-media@vger.kernel.org>; Wed,  7 Feb 2024 14:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707315501; cv=none; b=M/8OmyeLo9AUz/2QXCxB+WdeJByTo4JcYTd1AfoVKE7LBOkPfqFU43rh5GY7FgedqdMPxG2EDBAUngyupb3dKOFeAT42b0rG2MvpD/sjewHvc8EbU72yxbMgY0yYifxzF8ukU57pPRYa8LpR+EQh6Jmu2eDwHp+SQM3exb3IaXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707315501; c=relaxed/simple;
	bh=kNUL30QR530rA2OjWjT50RNL9g6lcZb1ca8nqL+V30E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YG9wA/x0YGVTzlolTFEfT1OQKGK5S+JIQ65IYV52a36eEou2w0v8fQujl6jisW57JqFAoqD4Fm29Ogz4OS3aKp1+zXWMkMVdI/XgqEJ7HXNTPn0aT/9k5MId/vigST1V3DSffRihVFKXhcrMwJmfN2ryEndd/RzoFyMd/MECHCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Qr+xbpFP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC951975;
	Wed,  7 Feb 2024 15:16:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707315414;
	bh=kNUL30QR530rA2OjWjT50RNL9g6lcZb1ca8nqL+V30E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qr+xbpFP+ZLzyqXP2bOku8pnibq2v7+mHYRTFI3KXsvYuIBzZ5XgPzJGfCZYHERMF
	 c6KJ1vMre398n4KUWay99tXJAQAY9FcufdoBPXlVR2aOPNPVd4R4ZZlFeRdgHACdPV
	 bhpIByFzGarwUw8ZBlp1RuzahOaX+R7nz7BwVm+I=
Date: Wed, 7 Feb 2024 16:18:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2 18/29] media: mc: Postpone graph object removal until
 free
Message-ID: <20240207141820.GP23702@pendragon.ideasonboard.com>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-19-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231220103713.113386-19-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Dec 20, 2023 at 12:37:02PM +0200, Sakari Ailus wrote:
> The media device itself will be unregistered based on it being unbound and
> driver's remove callback being called. The graph objects themselves may
> still be in use; rely on the media device release callback to release
> them.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Acked-by: Hans Verkuil <hans.verkuil@cisco.com>
> ---
>  drivers/media/mc/mc-device.c | 53 +++++++++++++++++-------------------
>  1 file changed, 25 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> index bbc233e726d2..10426c2796b6 100644
> --- a/drivers/media/mc/mc-device.c
> +++ b/drivers/media/mc/mc-device.c
> @@ -702,8 +702,33 @@ EXPORT_SYMBOL_GPL(media_device_unregister_entity_notify);
>  
>  static void __media_device_release(struct media_device *mdev)
>  {
> +	struct media_entity *entity;
> +	struct media_entity *next;
> +	struct media_interface *intf, *tmp_intf;
> +	struct media_entity_notify *notify, *nextp;
> +
>  	dev_dbg(mdev->dev, "Media device released\n");

No need for locking ? I suppose we can't reach this point if someone
else has a reference to the media device. A comment to mention it would
be nice.

>  
> +	/* Remove all entities from the media device */
> +	list_for_each_entry_safe(entity, next, &mdev->entities, graph_obj.list)
> +		__media_device_unregister_entity(entity);

Should the __media_device_unregister_entity() function be renamed to
__media_device_remove_entity() (in a separate patch) ? Same for
__media_device_unregister_entity_notify().

> +
> +	/* Remove all entity_notify callbacks from the media device */
> +	list_for_each_entry_safe(notify, nextp, &mdev->entity_notify, list)
> +		__media_device_unregister_entity_notify(mdev, notify);
> +
> +	/* Remove all interfaces from the media device */
> +	list_for_each_entry_safe(intf, tmp_intf, &mdev->interfaces,
> +				 graph_obj.list) {
> +		/*
> +		 * Unlink the interface, but don't free it here; the
> +		 * module which created it is responsible for freeing
> +		 * it
> +		 */
> +		__media_remove_intf_links(intf);
> +		media_gobj_destroy(&intf->graph_obj);
> +	}
> +
>  	ida_destroy(&mdev->entity_internal_idx);
>  	mdev->entity_internal_idx_max = 0;
>  	media_graph_walk_cleanup(&mdev->pm_count_walk);
> @@ -787,42 +812,14 @@ EXPORT_SYMBOL_GPL(__media_device_register);
>  
>  void media_device_unregister(struct media_device *mdev)
>  {
> -	struct media_entity *entity;
> -	struct media_entity *next;
> -	struct media_interface *intf, *tmp_intf;
> -	struct media_entity_notify *notify, *nextp;
> -
>  	if (mdev == NULL)
>  		return;
>  
>  	mutex_lock(&mdev->graph_mutex);
> -
> -	/* Check if mdev was ever registered at all */
>  	if (!media_devnode_is_registered(&mdev->devnode)) {
>  		mutex_unlock(&mdev->graph_mutex);

Unless I'm mistaken we don't need to lock the graph mutext to test this,
so I think you can drop locking completely here.

>  		return;
>  	}
> -
> -	/* Remove all entities from the media device */
> -	list_for_each_entry_safe(entity, next, &mdev->entities, graph_obj.list)
> -		__media_device_unregister_entity(entity);
> -
> -	/* Remove all entity_notify callbacks from the media device */
> -	list_for_each_entry_safe(notify, nextp, &mdev->entity_notify, list)
> -		__media_device_unregister_entity_notify(mdev, notify);
> -
> -	/* Remove all interfaces from the media device */
> -	list_for_each_entry_safe(intf, tmp_intf, &mdev->interfaces,
> -				 graph_obj.list) {
> -		/*
> -		 * Unlink the interface, but don't free it here; the
> -		 * module which created it is responsible for freeing
> -		 * it
> -		 */
> -		__media_remove_intf_links(intf);
> -		media_gobj_destroy(&intf->graph_obj);
> -	}
> -
>  	mutex_unlock(&mdev->graph_mutex);
>  
>  	device_remove_file(&mdev->devnode.dev, &dev_attr_model);

-- 
Regards,

Laurent Pinchart

