Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37C9E45E6B4
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 05:02:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237575AbhKZEFn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 23:05:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235574AbhKZEDk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 23:03:40 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EE53C0613F8
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 18:56:48 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8D71E340;
        Fri, 26 Nov 2021 03:56:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637895405;
        bh=2RaCXPod7ALQ3ToUUJ72WwPMl07B2VdWiLCSZ+kVric=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W9832/Uswc1KmWsVdh9SvFi5c4kBRQ9Dd4++vVsdaN4FETe3YD/gPxWcaM74Mp5A+
         gf9aW+k0QLWVUeZwpHyYsvQmccAR7nQV+6T+4P9p6SqNKhmNZrt/f3QkIR0PfXvdx9
         Rp+a1zQd5Hmqk4Au3rxCBpZxIqnCReBBdWP9ggr0=
Date:   Fri, 26 Nov 2021 04:56:22 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com
Subject: Re: [RFC PATCH 1/2] media: entity: Add support for ancillary links
Message-ID: <YaBM1oiwHIcSQehg@pendragon.ideasonboard.com>
References: <20211126001603.41148-1-djrscally@gmail.com>
 <20211126001603.41148-2-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211126001603.41148-2-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

Thank you for the patch.

On Fri, Nov 26, 2021 at 12:16:02AM +0000, Daniel Scally wrote:
> To describe in the kernel the connection between devices and their
> supporting peripherals (for example, a camera sensor and the vcm
> driving the focusing lens for it), add a new type of media link
> which connects two instances of struct media_entity.
> 
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> 
> I was tempted to 'fix' the spaces between # and define in
> include/uapi/linux/media.h but eventually decided they were probably deliberate
> but if that's not true I'd fix those too.
> 
>  drivers/media/mc/mc-entity.c | 30 ++++++++++++++++++++++++++++++
>  include/media/media-entity.h | 30 ++++++++++++++++++++++++++++++
>  include/uapi/linux/media.h   |  1 +
>  3 files changed, 61 insertions(+)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index f40f41977142..9c18b974e117 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -1032,3 +1032,33 @@ void media_remove_intf_links(struct media_interface *intf)
>  	mutex_unlock(&mdev->graph_mutex);
>  }
>  EXPORT_SYMBOL_GPL(media_remove_intf_links);
> +
> +struct media_link *media_create_ancillary_link(struct media_entity *primary,
> +					       struct media_entity *ancillary,
> +					       u32 flags)
> +{
> +	struct media_link *link;
> +
> +	link = media_add_link(&primary->links);
> +	if (!link)
> +		return ERR_PTR(-ENOMEM);
> +
> +	link->primary = primary;
> +	link->ancillary = ancillary;
> +	link->flags = flags | MEDIA_LNK_FL_ANCILLARY_LINK;
> +
> +	/* Initialize graph object embedded at the new link */
> +	media_gobj_create(primary->graph_obj.mdev, MEDIA_GRAPH_LINK,
> +			  &link->graph_obj);
> +
> +	return link;
> +}
> +EXPORT_SYMBOL_GPL(media_create_ancillary_link);
> +
> +void media_remove_ancillary_link(struct media_link *link)
> +{
> +	list_del(&link->list);
> +	media_gobj_destroy(&link->graph_obj);
> +	kfree(link);
> +}
> +EXPORT_SYMBOL_GPL(media_remove_ancillary_link);
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index fea489f03d57..400b864857ee 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -119,12 +119,16 @@ struct media_pipeline {
>   *		a pad. In that case, it represents the source pad.
>   * @intf:	Part of a union. Used only if the first object (gobj0) is
>   *		an interface.
> + * @primary:	Part of a union. Used only if the first object (gobj0) is
> + *		an entity and the link type is MEDIA_LNK_FL_ANCILLARY_LINK.
>   * @gobj1:	Part of a union. Used to get the pointer for the second
>   *		graph_object of the link.
>   * @sink:	Part of a union. Used only if the second object (gobj1) is
>   *		a pad. In that case, it represents the sink pad.
>   * @entity:	Part of a union. Used only if the second object (gobj1) is
>   *		an entity.
> + * @ancillary:	Part of a union. Used only if the second object (gobj1) is
> + *		an entity and the link type is MEDIA_LNK_FL_ANCILLARY_LINK.
>   * @reverse:	Pointer to the link for the reverse direction of a pad to pad
>   *		link.
>   * @flags:	Link flags, as defined in uapi/media.h (MEDIA_LNK_FL_*)
> @@ -137,11 +141,13 @@ struct media_link {
>  		struct media_gobj *gobj0;
>  		struct media_pad *source;
>  		struct media_interface *intf;
> +		struct media_entity *primary;
>  	};
>  	union {
>  		struct media_gobj *gobj1;
>  		struct media_pad *sink;
>  		struct media_entity *entity;
> +		struct media_entity *ancillary;
>  	};

Those unions are not very nice, but it's not your fault. I however
wonder if we couldn't just use the gobj0 and gobj1 fields, and avoid
adding primary and ancillary.

I'm sure we'll also nitpick on the names, especially when adding
documentation. The concept seems fine to me though.

>  	struct media_link *reverse;
>  	unsigned long flags;
> @@ -1104,6 +1110,30 @@ void media_remove_intf_links(struct media_interface *intf);
>   * it will issue a call to @operation\(@entity, @args\).
>   */
>  
> +/**
> + * media_create_ancillary_link() - creates a link between two entities
> + *
> + * @primary:	pointer to the primary %media_entity
> + * @ancillary:	pointer to the ancillary %media_entity
> + * @flags:	Link flags, as defined in
> + *		:ref:`include/uapi/linux/media.h <media_header>`
> + *		( seek for ``MEDIA_LNK_FL_*``)
> + *
> + *
> + * Valid values for flags:
> + *
> + * %MEDIA_LNK_FL_ENABLED
> + *   Indicates that the two entities are connected pieces of hardware that form
> + *   a single logical unit.
> + *
> + *   A typical example is a camera lens being linked to the sensor that it is
> + *   supporting.

Is there any use case for an ancillary link that wouldn't be enabled ?
Should the IMMUTABLE flag be set as well ?

> + */
> +struct media_link *
> +media_create_ancillary_link(struct media_entity *primary,
> +			    struct media_entity *ancillary,
> +			    u32 flags);
> +
>  #define media_entity_call(entity, operation, args...)			\
>  	(((entity)->ops && (entity)->ops->operation) ?			\
>  	 (entity)->ops->operation((entity) , ##args) : -ENOIOCTLCMD)
> diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
> index 200fa8462b90..afbae7213d35 100644
> --- a/include/uapi/linux/media.h
> +++ b/include/uapi/linux/media.h
> @@ -226,6 +226,7 @@ struct media_pad_desc {
>  #define MEDIA_LNK_FL_LINK_TYPE			(0xf << 28)
>  #  define MEDIA_LNK_FL_DATA_LINK		(0 << 28)
>  #  define MEDIA_LNK_FL_INTERFACE_LINK		(1 << 28)
> +#  define MEDIA_LNK_FL_ANCILLARY_LINK		(2 << 28)
>  
>  struct media_link_desc {
>  	struct media_pad_desc source;

-- 
Regards,

Laurent Pinchart
