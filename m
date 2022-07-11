Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE919570829
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 18:18:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231872AbiGKQSH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 12:18:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231529AbiGKQSG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 12:18:06 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E641B7AC20
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 09:18:03 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 56381326;
        Mon, 11 Jul 2022 18:18:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657556281;
        bh=OAhFddREai6CI7QHgO6ac6AKDoro6dcJCWZL16c9jXs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ntSeYFy++CXEiuhgxjWeQAeR93slIOzZSezQKeoTvorD7kuzWq1G6pTsro7KIBJhh
         WIySOkr4qzJs/xgLoLXfHWU6jcWrp6JGi2acqKNQpyWHcV/dNHTAYiP2DeAXWZ6R/G
         7zEwh/N2TFTl3PfFCBAym5doK5jnPHq0VfLxOoT8=
Date:   Mon, 11 Jul 2022 19:17:34 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        paul.elder@ideasonboard.com, jacopo@jmondi.org
Subject: Re: [PATCH v2 1/2] media: entity: Add iterator for entity data links
Message-ID: <YsxNHubdOE/hKxl/@pendragon.ideasonboard.com>
References: <20220707224733.347899-1-djrscally@gmail.com>
 <20220707224733.347899-2-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220707224733.347899-2-djrscally@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

Thank you for the patch.

On Thu, Jul 07, 2022 at 11:47:32PM +0100, Daniel Scally wrote:
> Iterating over the links for an entity is a somewhat common need
> through the media subsystem, but generally the assumption is that
> they will all be data links. To meet that assumption add a new macro
> that iterates through an entity's links and skips non-data links.
> 
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes since v1 (suggested by Jacopo and Laurent):
> 
> 	- Simplified __media_entity_next_link()
> 	- Added the link_type param to __media_entity_next_link()
> 	- Moved __media_entity_next_link() to mc-entity.c rather than
> 	  media-entity.h
> 
>  drivers/media/mc/mc-entity.c | 16 ++++++++++++++++
>  include/media/media-entity.h | 29 +++++++++++++++++++++++++++++
>  2 files changed, 45 insertions(+)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 11f5207f73aa..a247d5679930 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -9,6 +9,7 @@
>   */
>  
>  #include <linux/bitmap.h>
> +#include <linux/list.h>
>  #include <linux/property.h>
>  #include <linux/slab.h>
>  #include <media/media-entity.h>
> @@ -1051,3 +1052,18 @@ struct media_link *media_create_ancillary_link(struct media_entity *primary,
>  	return link;
>  }
>  EXPORT_SYMBOL_GPL(media_create_ancillary_link);
> +
> +struct media_link *__media_entity_next_link(struct media_entity *entity,
> +					    struct media_link *link,
> +					    unsigned long link_type)
> +{
> +	link = link ? list_next_entry(link, list)
> +		    : list_first_entry(&entity->links, typeof(*link), list);
> +
> +	list_for_each_entry_from(link, &entity->links, list)
> +		if ((link->flags & MEDIA_LNK_FL_LINK_TYPE) == link_type)
> +			return link;
> +
> +	return NULL;
> +}
> +EXPORT_SYMBOL_GPL(__media_entity_next_link);
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index a9a1c0ec5d1c..903c9368c50d 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -1140,4 +1140,33 @@ struct media_link *
>  media_create_ancillary_link(struct media_entity *primary,
>  			    struct media_entity *ancillary);
>  
> +/**
> + * __media_entity_next_link() - iterate through a &media_entity's links,

s/iterate/Iterate/
s/,$//

> + *
> + * @entity:	pointer to the &media_entity
> + * @link:	pointer to a &media_link to hold the iterated values
> + * @link_type:	one of the MEDIA_LNK_FL_LINK_TYPE flags
> + *
> + * Return the next link against an entity matching a specific link type. This
> + * allows iteration through an entity's links whilst guaranteeing all of the
> + * returned links are of the given type.
> + */
> +struct media_link *__media_entity_next_link(struct media_entity *entity,
> +					    struct media_link *link,
> +					    unsigned long link_type);
> +
> +/**
> + * for_each_media_entity_data_link() - Iterate through an entity's data links
> + *
> + * @entity:	pointer to the &media_entity
> + * @link:	pointer to a &media_link to hold the iterated values
> + *
> + * Iterate over a &media_entity's data links
> + */
> +#define for_each_media_entity_data_link(entity, link)			\
> +	for (link = __media_entity_next_link(entity, NULL,		\
> +					     MEDIA_LNK_FL_DATA_LINK);	\
> +	     link;							\
> +	     link = __media_entity_next_link(entity, link,		\
> +					     MEDIA_LNK_FL_DATA_LINK))

Missing one blank line here.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  #endif

-- 
Regards,

Laurent Pinchart
