Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BDA8474D34
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 22:26:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232487AbhLNV0F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Dec 2021 16:26:05 -0500
Received: from mga02.intel.com ([134.134.136.20]:55134 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230268AbhLNV0F (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Dec 2021 16:26:05 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="226366724"
X-IronPort-AV: E=Sophos;i="5.88,206,1635231600"; 
   d="scan'208";a="226366724"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2021 13:25:50 -0800
X-IronPort-AV: E=Sophos;i="5.88,206,1635231600"; 
   d="scan'208";a="682225526"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2021 13:25:47 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 584A4200D3;
        Tue, 14 Dec 2021 23:25:45 +0200 (EET)
Date:   Tue, 14 Dec 2021 23:25:45 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        laurent.pinchart@ideasonboard.com, hanlinchen@chromium.org,
        tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: Re: [PATCH 4/5] media: entity: Add support for ancillary links
Message-ID: <YbkL2V24TFdA5KHx@paasikivi.fi.intel.com>
References: <20211213232849.40071-1-djrscally@gmail.com>
 <20211213232849.40071-5-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211213232849.40071-5-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On Mon, Dec 13, 2021 at 11:28:48PM +0000, Daniel Scally wrote:
> Add functions to create and destroy ancillary links, so that they
> don't need to be manually created by users.
> 
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes since the rfc:
> 
> 	- (Laurent) Set gobj0 and gobj1 directly instead of the other union
> 	members
> 	- (Laurent) Added MEDIA_LNK_FL_IMMUTABLE to the kerneldoc for the new
> 	create function
> 
>  drivers/media/mc/mc-entity.c | 30 ++++++++++++++++++++++++++++++
>  include/media/media-entity.h | 29 +++++++++++++++++++++++++++++
>  2 files changed, 59 insertions(+)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index aeddc3f6310e..4e39e100ea03 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -1052,3 +1052,33 @@ void media_remove_intf_links(struct media_interface *intf)
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
> +	link->gobj0 = &primary->graph_obj;
> +	link->gobj1 = &ancillary->graph_obj;
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
> index fea489f03d57..f7b1738cef88 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -1104,6 +1104,35 @@ void media_remove_intf_links(struct media_interface *intf);
>   * it will issue a call to @operation\(@entity, @args\).
>   */
>  
> +/**
> + * media_create_ancillary_link() - creates a link between two entities
> + *
> + * @primary:	pointer to the primary &media_entity
> + * @ancillary:	pointer to the ancillary &media_entity
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
> + *
> + * %MEDIA_LNK_FL_IMMUTABLE
> + *   Indicates that the link enabled state can't be modified at runtime. If
> + *   %MEDIA_LNK_FL_IMMUTABLE is set, then %MEDIA_LNK_FL_ENABLED must also be
> + *   set, since an immutable link is always enabled.

What's the use case for both of the flags?

I know the flags are there but what will they mean in practice for
ancillary links?

> + */
> +struct media_link *
> +media_create_ancillary_link(struct media_entity *primary,
> +			    struct media_entity *ancillary,
> +			    u32 flags);
> +
>  #define media_entity_call(entity, operation, args...)			\
>  	(((entity)->ops && (entity)->ops->operation) ?			\
>  	 (entity)->ops->operation((entity) , ##args) : -ENOIOCTLCMD)

-- 
Kind regards,

Sakari Ailus
