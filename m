Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 088935548CF
	for <lists+linux-media@lfdr.de>; Wed, 22 Jun 2022 14:16:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242149AbiFVJQo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jun 2022 05:16:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241832AbiFVJQm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jun 2022 05:16:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D5BB62E1
        for <linux-media@vger.kernel.org>; Wed, 22 Jun 2022 02:16:41 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E7874DD;
        Wed, 22 Jun 2022 11:16:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655889399;
        bh=K/pJ9Qrk2GsNeHd6G1geUAMZc8ojC1kJCWF0ch5qirg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nUAhSnWud/cFG+5cu5/p8uRG1rQe0jFljsiZLZZTvmZHgBMrJAE4afnxJSilQeFib
         2J5aTOU7PMJPuxCNKnqaLkHdaozjkCRC3EVNY1JPksTZXaTtq/WDTZZzcirs6hJ89T
         KjF87QdaQMyB+lSSGhOAnR1L6h060zxZuack3bCY=
Date:   Wed, 22 Jun 2022 12:16:23 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        paul.elder@ideasonboard.com
Subject: Re: [PATCH 1/2] media: media-entity.h: Add iterator for entity data
 links
Message-ID: <YrLd5wN4C5Sb68YY@pendragon.ideasonboard.com>
References: <20220621163457.766496-1-djrscally@gmail.com>
 <20220621163457.766496-2-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220621163457.766496-2-djrscally@gmail.com>
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

On Tue, Jun 21, 2022 at 05:34:56PM +0100, Daniel Scally wrote:
> Iterating over the links for an entity is a somewhat common need
> through the media subsystem, but generally the assumption is that
> they will all be data links. To meet that assumption add a new macro
> that iterates through an entity's links and skips non-data links.
> 
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
>  include/media/media-entity.h | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index a9a1c0ec5d1c..b13f67f33508 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -550,6 +550,32 @@ static inline bool media_entity_enum_intersects(
>  				 min(ent_enum1->idx_max, ent_enum2->idx_max));
>  }
>  
> +static inline struct media_link *
> +__media_entity_next_data_link(struct media_entity *entity,
> +			      struct media_link *pos)

We could make this more dynamic by passing the link type as an argument,
adding more iteration macros for different link types in the future
would then be easier. Up to you.

> +{
> +	if (!pos) {
> +		list_for_each_entry(pos, &entity->links, list)
> +			if ((pos->flags & MEDIA_LNK_FL_LINK_TYPE) ==
> +			    MEDIA_LNK_FL_DATA_LINK)
> +				return pos;
> +
> +		return NULL;
> +	}
> +
> +	list_for_each_entry_continue(pos, &entity->links, list)
> +		if ((pos->flags & MEDIA_LNK_FL_LINK_TYPE) ==
> +		    MEDIA_LNK_FL_DATA_LINK)
> +			return pos;

This could be simplified to

	if (!pos)
		pos = list_entry(&entity->links, struct media_link, list);

	list_for_each_entry_continue(pos, &entity->links, list) {
		if ((pos->flags & MEDIA_LNK_FL_LINK_TYPE) ==
		    MEDIA_LNK_FL_DATA_LINK)
			return pos;
	}

> +
> +	return NULL;
> +}

This is a bit big for an inline function, could we move the
implementation to the .c file ?

> +
> +#define for_each_media_entity_data_link(entity, pos)		\

s/pos/link/ ?

> +	for (pos = __media_entity_next_data_link(entity, NULL);	\
> +	     pos;						\
> +	     pos = __media_entity_next_data_link(entity, pos))
> +

I'm afraid this needs documentation :-)
(https://lore.kernel.org/linux-media/20220301161156.1119557-13-tomi.valkeinen@ideasonboard.com/
can be used as an example)

>  /**
>   * gobj_to_entity - returns the struct &media_entity pointer from the
>   *	@gobj contained on it.

-- 
Regards,

Laurent Pinchart
