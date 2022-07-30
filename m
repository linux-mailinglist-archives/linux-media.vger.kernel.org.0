Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94D05585A33
	for <lists+linux-media@lfdr.de>; Sat, 30 Jul 2022 13:12:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234045AbiG3LMT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Jul 2022 07:12:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbiG3LMS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Jul 2022 07:12:18 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDF4A15A29
        for <linux-media@vger.kernel.org>; Sat, 30 Jul 2022 04:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659179537; x=1690715537;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=20xx7nIY2t0GHJ6GIEPfVoLgxNRhlHIjwfgeRgtXUSU=;
  b=cLTdHORh0KO9drs8gq4aOAamfO+m2N1LS1MCBd4PJPT7Wpprkafouh3X
   +vLvTccmsLcyAwJVPkCApsC0YWtz/A5l3BqcJQrJxX4x/QQY4CERQKTkw
   oZOQVn+VrxaKSvzEzinD/HdFjnqaPgZsJtq7LD+L5ccyp4Lp+adkOfB68
   L9Tbdb+wzutuoV8VLXHTXIT+cjvfLr3gB7j1a58xo4RdftwjOCPAQVv/A
   sJlsqYUXQljEmUsnd/uCW2HLGSt5j3abANBoSfMrEvItf3N8+hJLVM83s
   JicHB4o4Fq60m9ULTgEC2E0CNKF83ItBH81zIsI/SOy/Fa2BZATv7JmYT
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10423"; a="375214187"
X-IronPort-AV: E=Sophos;i="5.93,203,1654585200"; 
   d="scan'208";a="375214187"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2022 04:12:17 -0700
X-IronPort-AV: E=Sophos;i="5.93,203,1654585200"; 
   d="scan'208";a="552004657"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2022 04:12:14 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id EABF6203C4;
        Sat, 30 Jul 2022 14:11:41 +0300 (EEST)
Date:   Sat, 30 Jul 2022 11:11:41 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v12 02/30] media: mc: entity: Add iterator helper for
 entity pads
Message-ID: <YuUR7eCOv/mqtji5@paasikivi.fi.intel.com>
References: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
 <20220727103639.581567-3-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727103639.581567-3-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

Thanks for the update!

On Wed, Jul 27, 2022 at 01:36:11PM +0300, Tomi Valkeinen wrote:
> From: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> Add an iterator helper to easily cycle through all pads in an entity and
> use it in media-entity and media-device code where appropriate.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/mc/mc-device.c | 13 ++++++-------
>  drivers/media/mc/mc-entity.c | 11 ++++++-----
>  include/media/media-entity.h | 12 ++++++++++++
>  3 files changed, 24 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> index b8176a3b76d3..25020d58eb06 100644
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
> @@ -610,7 +610,7 @@ int __must_check media_device_register_entity(struct media_device *mdev,
>  					      struct media_entity *entity)
>  {
>  	struct media_entity_notify *notify, *next;
> -	unsigned int i;
> +	struct media_pad *iter;
>  	int ret;
>  
>  	if (entity->function == MEDIA_ENT_F_V4L2_SUBDEV_UNKNOWN ||
> @@ -639,9 +639,8 @@ int __must_check media_device_register_entity(struct media_device *mdev,
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
> index 11f5207f73aa..35a1aa218c51 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -192,7 +192,8 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
>  			   struct media_pad *pads)
>  {
>  	struct media_device *mdev = entity->graph_obj.mdev;
> -	unsigned int i;
> +	struct media_pad *iter;
> +	unsigned int i = 0;
>  
>  	if (num_pads >= MEDIA_ENTITY_MAX_PADS)
>  		return -E2BIG;
> @@ -203,12 +204,12 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
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

I know it was wrongly aligned but fixing it would be nice here.

>  	}
>  
>  	if (mdev)
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index a9a1c0ec5d1c..6b6fea6a713e 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -315,6 +315,18 @@ struct media_entity {
>  	} info;
>  };
>  
> +/**
> + * media_entity_for_each_pad - Iterate on all pads in an entity
> + * @entity: The entity the pads belong to
> + * @iter: The iterator pad
> + *
> + * Iterate on all pads in a media entity.
> + */
> +#define media_entity_for_each_pad(entity, iter)			\
> +	for (iter = (entity)->pads;				\
> +	     iter < &(entity)->pads[(entity)->num_pads];	\
> +	     ++iter)

It'd be nice to align the backslashes.

> +
>  /**
>   * struct media_interface - A media interface graph object.
>   *

-- 
Kind regards,

Sakari Ailus
