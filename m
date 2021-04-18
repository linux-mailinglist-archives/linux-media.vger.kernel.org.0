Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9CCF363713
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 19:52:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232195AbhDRRxY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Apr 2021 13:53:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbhDRRxY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Apr 2021 13:53:24 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C65B9C06174A
        for <linux-media@vger.kernel.org>; Sun, 18 Apr 2021 10:52:55 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E9F94AB;
        Sun, 18 Apr 2021 19:52:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618768373;
        bh=h6Lzyq2+FSMnkl/GK0oNy0ZtOoxv3un1fDkud/mi//E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ACdeDLMwkzx3LGdP6BrmEds2gqYJiKizgNj13SraIyE/ZBiZYMe1nol2JM5UWWnwL
         +zh6kQ4i7Hk+uBnhg5o+09z6+HPSFvRmsvLJAoyzQ4B3Nyn2WZlBjI9rSo72VpElBE
         VxP5au9KWcmzCzt+Xpyxy4SfqxMD98YblasFIG4s=
Date:   Sun, 18 Apr 2021 20:52:50 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v5 05/24] media: entity: Add iterator helper for entity
 pads
Message-ID: <YHxx8hv1Am4K9kq6@pendragon.ideasonboard.com>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
 <20210415130450.421168-6-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210415130450.421168-6-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi and Jacopo,

Thank you for the patch.

On Thu, Apr 15, 2021 at 04:04:31PM +0300, Tomi Valkeinen wrote:
> From: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> Add an iterator helper to easily cycle through all pads in an entity and
> use it in media-entity and media-device code where appropriate.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/mc/mc-device.c | 13 ++++++-------
>  drivers/media/mc/mc-entity.c | 11 ++++++-----
>  include/media/media-entity.h | 12 ++++++++++++
>  3 files changed, 24 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> index 9e56d2ad6b94..704ef1360eba 100644
> --- a/drivers/media/mc/mc-device.c
> +++ b/drivers/media/mc/mc-device.c
> @@ -581,7 +581,7 @@ static void __media_device_unregister_entity(struct media_entity *entity)
>  	struct media_device *mdev = entity->graph_obj.mdev;
>  	struct media_link *link, *tmp;
>  	struct media_interface *intf;
> -	unsigned int i;
> +	struct media_pad *iter;
>  
>  	ida_free(&mdev->entity_internal_idx, entity->internal_idx);
>  
> @@ -597,8 +597,8 @@ static void __media_device_unregister_entity(struct media_entity *entity)
>  	__media_entity_remove_links(entity);
>  
>  	/* Remove all pads that belong to this entity */
> -	for (i = 0; i < entity->num_pads; i++)
> -		media_gobj_destroy(&entity->pads[i].graph_obj);
> +	media_entity_for_each_pad(entity, iter)
> +		media_gobj_destroy(&iter->graph_obj);
>  
>  	/* Remove the entity */
>  	media_gobj_destroy(&entity->graph_obj);
> @@ -617,7 +617,7 @@ int __must_check media_device_register_entity(struct media_device *mdev,
>  					      struct media_entity *entity)
>  {
>  	struct media_entity_notify *notify, *next;
> -	unsigned int i;
> +	struct media_pad *iter;
>  	int ret;
>  
>  	if (entity->function == MEDIA_ENT_F_V4L2_SUBDEV_UNKNOWN ||
> @@ -646,9 +646,8 @@ int __must_check media_device_register_entity(struct media_device *mdev,
>  	media_gobj_create(mdev, MEDIA_GRAPH_ENTITY, &entity->graph_obj);
>  
>  	/* Initialize objects at the pads */
> -	for (i = 0; i < entity->num_pads; i++)
> -		media_gobj_create(mdev, MEDIA_GRAPH_PAD,
> -			       &entity->pads[i].graph_obj);
> +	media_entity_for_each_pad(entity, iter)
> +		media_gobj_create(mdev, MEDIA_GRAPH_PAD, &iter->graph_obj);
>  
>  	/* invoke entity_notify callbacks */
>  	list_for_each_entry_safe(notify, next, &mdev->entity_notify, list)
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 401fddf320e7..830841e0cd28 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -198,7 +198,8 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
>  			   struct media_pad *pads)
>  {
>  	struct media_device *mdev = entity->graph_obj.mdev;
> -	unsigned int i;
> +	struct media_pad *iter;
> +	unsigned int i = 0;
>  
>  	if (num_pads >= MEDIA_ENTITY_MAX_PADS)
>  		return -E2BIG;
> @@ -209,12 +210,12 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
>  	if (mdev)
>  		mutex_lock(&mdev->graph_mutex);
>  
> -	for (i = 0; i < num_pads; i++) {
> -		pads[i].entity = entity;
> -		pads[i].index = i;
> +	media_entity_for_each_pad(entity, iter) {
> +		iter->entity = entity;
> +		iter->index = i++;
>  		if (mdev)
>  			media_gobj_create(mdev, MEDIA_GRAPH_PAD,
> -					&entity->pads[i].graph_obj);
> +					&iter->graph_obj);
>  	}
>  
>  	if (mdev)
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index 2d45344ca527..52b1a1cab57a 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -1102,3 +1102,15 @@ void media_remove_intf_links(struct media_interface *intf);
>  	 (entity)->ops->operation((entity) , ##args) : -ENOIOCTLCMD)
>  
>  #endif
> +
> +/**
> + * media_entity_for_each_pad - Iterate on all pads in an entity
> + * @entity: The entity the pads belong to
> + * @iter: The iterator pad

I would name the variable pad, here and in the code above.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> + *
> + * Iterate on all pads in a media entity.
> + */
> +#define media_entity_for_each_pad(entity, iter)			\
> +	for (iter = (entity)->pads;				\
> +	     iter < &(entity)->pads[(entity)->num_pads];	\
> +	     ++iter)

-- 
Regards,

Laurent Pinchart
