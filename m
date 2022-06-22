Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC865546BC
	for <lists+linux-media@lfdr.de>; Wed, 22 Jun 2022 14:11:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357390AbiFVJKp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jun 2022 05:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357240AbiFVJKD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jun 2022 05:10:03 -0400
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E42CD3A196
        for <linux-media@vger.kernel.org>; Wed, 22 Jun 2022 02:09:03 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 0C9171C0012;
        Wed, 22 Jun 2022 09:09:00 +0000 (UTC)
Date:   Wed, 22 Jun 2022 11:08:59 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, paul.elder@ideasonboard.com
Subject: Re: [PATCH 1/2] media: media-entity.h: Add iterator for entity data
 links
Message-ID: <20220622090859.xdmi5aldtqihgjve@uno.localdomain>
References: <20220621163457.766496-1-djrscally@gmail.com>
 <20220621163457.766496-2-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220621163457.766496-2-djrscally@gmail.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan

On Tue, Jun 21, 2022 at 05:34:56PM +0100, Daniel Scally wrote:
> Iterating over the links for an entity is a somewhat common need
> through the media subsystem, but generally the assumption is that
> they will all be data links. To meet that assumption add a new macro
> that iterates through an entity's links and skips non-data links.

Do you foresee usages of a similar iterator but for ancillary (or
interface) links ?

In that case you could add a 'link_type' flag to
__media_entity_next_data_link

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

Isn't this a bit too much for inlining ? Also I heard many times that
it's not worth anymore trying to outsmart the compiler and inline is
discouraged in most cases ? (and it kind of makes sense to me, but I
sometimes wonder if that's some form of cargo cult..)

> +__media_entity_next_data_link(struct media_entity *entity,
> +			      struct media_link *pos)
> +{
> +	if (!pos) {
> +		list_for_each_entry(pos, &entity->links, list)

nit: coding style requires you to have braces

------------------------------------------------------------------------------
from Documentation/process/coding-style.rst:
Also, use braces when a loop contains more than a single simple statement:

.. code-block:: c

	while (condition) {
		if (test)
			do_something();
	}
------------------------------------------------------------------------------

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
> +
> +	return NULL;

I wonder if the same could be achieved with list_for_each_entry_from() ?

	pos = pos ? list_next_entry(pos, list)
		  : list_first_entry(&entity->links, typeof(*pos), list);

        list_for_each_entry_from(pos, ...) {
                if (...)
                        return pos;

        }

        return NULL;

If I'm not mistaken the two versions are functionally equivalent..

The iterator seems a good idea. Do you plan to use it for
"media: rkisp1: Don't create data links for non-sensor subdevs" too,
or changing the list of subdevs to iterate is enough there ?

Thanks
   j

> +}
> +
> +#define for_each_media_entity_data_link(entity, pos)		\
> +	for (pos = __media_entity_next_data_link(entity, NULL);	\
> +	     pos;						\
> +	     pos = __media_entity_next_data_link(entity, pos))
> +
>  /**
>   * gobj_to_entity - returns the struct &media_entity pointer from the
>   *	@gobj contained on it.
> --
> 2.25.1
>
