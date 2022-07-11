Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8025157098B
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 19:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231529AbiGKRyI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 13:54:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbiGKRyG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 13:54:06 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26EA632B81
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 10:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657562045; x=1689098045;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Sn+tREDp9OPABkn0L3sdk+qIfKrb07jv39YSCkkGtP0=;
  b=Cfe7fsL7CYQI7yKQZI3aVM4s8WuO7kHOWZQ3isa3kLC34aJz214J0+vf
   bi4vWJGRCdZfo5pPdmoFiqaNx2yeHQ9LFPAetlprAxSxkN7PJukR5gtL6
   BPWNYIEA3S74dAc/BFp+86JALDWc9nq2fkL/GwGHQv6c2D4aG6qDe7gm6
   mBJXZXUi/Cw3/BfyBJazo/d3eujhEXUBd7VYHiNm3wxtBGBbbtVQKiWYx
   PAGWMMXOMNgGtHQCWh+pl5dFPS+nAVWnvwvbP0gZwkCNCb/ttYFcPvq49
   KNPtTwCIOvAiw4Zpo2PRYXn7dO+NXzgBJktXiHWDHHJ4xUF7Q7ZrJuKtP
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="285473098"
X-IronPort-AV: E=Sophos;i="5.92,263,1650956400"; 
   d="scan'208";a="285473098"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2022 10:54:04 -0700
X-IronPort-AV: E=Sophos;i="5.92,263,1650956400"; 
   d="scan'208";a="592340632"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2022 10:54:03 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 38B3A20F61;
        Mon, 11 Jul 2022 20:54:01 +0300 (EEST)
Date:   Mon, 11 Jul 2022 17:54:01 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Daniel Scally <djrscally@gmail.com>, linux-media@vger.kernel.org,
        paul.elder@ideasonboard.com, jacopo@jmondi.org
Subject: Re: [PATCH v2 1/2] media: entity: Add iterator for entity data links
Message-ID: <YsxjuZ/74Jc+Etan@paasikivi.fi.intel.com>
References: <20220707224733.347899-1-djrscally@gmail.com>
 <20220707224733.347899-2-djrscally@gmail.com>
 <YsxNHubdOE/hKxl/@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YsxNHubdOE/hKxl/@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent, Daniel,

On Mon, Jul 11, 2022 at 07:17:34PM +0300, Laurent Pinchart wrote:
> Hi Daniel,
> 
> Thank you for the patch.
> 
> On Thu, Jul 07, 2022 at 11:47:32PM +0100, Daniel Scally wrote:
> > Iterating over the links for an entity is a somewhat common need
> > through the media subsystem, but generally the assumption is that
> > they will all be data links. To meet that assumption add a new macro
> > that iterates through an entity's links and skips non-data links.
> > 
> > Signed-off-by: Daniel Scally <djrscally@gmail.com>
> > ---
> > Changes since v1 (suggested by Jacopo and Laurent):
> > 
> > 	- Simplified __media_entity_next_link()
> > 	- Added the link_type param to __media_entity_next_link()
> > 	- Moved __media_entity_next_link() to mc-entity.c rather than
> > 	  media-entity.h
> > 
> >  drivers/media/mc/mc-entity.c | 16 ++++++++++++++++
> >  include/media/media-entity.h | 29 +++++++++++++++++++++++++++++
> >  2 files changed, 45 insertions(+)
> > 
> > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > index 11f5207f73aa..a247d5679930 100644
> > --- a/drivers/media/mc/mc-entity.c
> > +++ b/drivers/media/mc/mc-entity.c
> > @@ -9,6 +9,7 @@
> >   */
> >  
> >  #include <linux/bitmap.h>
> > +#include <linux/list.h>
> >  #include <linux/property.h>
> >  #include <linux/slab.h>
> >  #include <media/media-entity.h>
> > @@ -1051,3 +1052,18 @@ struct media_link *media_create_ancillary_link(struct media_entity *primary,
> >  	return link;
> >  }
> >  EXPORT_SYMBOL_GPL(media_create_ancillary_link);
> > +
> > +struct media_link *__media_entity_next_link(struct media_entity *entity,
> > +					    struct media_link *link,
> > +					    unsigned long link_type)
> > +{
> > +	link = link ? list_next_entry(link, list)
> > +		    : list_first_entry(&entity->links, typeof(*link), list);
> > +
> > +	list_for_each_entry_from(link, &entity->links, list)
> > +		if ((link->flags & MEDIA_LNK_FL_LINK_TYPE) == link_type)
> > +			return link;
> > +
> > +	return NULL;
> > +}
> > +EXPORT_SYMBOL_GPL(__media_entity_next_link);
> > diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> > index a9a1c0ec5d1c..903c9368c50d 100644
> > --- a/include/media/media-entity.h
> > +++ b/include/media/media-entity.h
> > @@ -1140,4 +1140,33 @@ struct media_link *
> >  media_create_ancillary_link(struct media_entity *primary,
> >  			    struct media_entity *ancillary);
> >  
> > +/**
> > + * __media_entity_next_link() - iterate through a &media_entity's links,
> 
> s/iterate/Iterate/
> s/,$//
> 
> > + *
> > + * @entity:	pointer to the &media_entity
> > + * @link:	pointer to a &media_link to hold the iterated values
> > + * @link_type:	one of the MEDIA_LNK_FL_LINK_TYPE flags
> > + *
> > + * Return the next link against an entity matching a specific link type. This
> > + * allows iteration through an entity's links whilst guaranteeing all of the
> > + * returned links are of the given type.
> > + */
> > +struct media_link *__media_entity_next_link(struct media_entity *entity,
> > +					    struct media_link *link,
> > +					    unsigned long link_type);
> > +
> > +/**
> > + * for_each_media_entity_data_link() - Iterate through an entity's data links
> > + *
> > + * @entity:	pointer to the &media_entity
> > + * @link:	pointer to a &media_link to hold the iterated values
> > + *
> > + * Iterate over a &media_entity's data links
> > + */
> > +#define for_each_media_entity_data_link(entity, link)			\
> > +	for (link = __media_entity_next_link(entity, NULL,		\
> > +					     MEDIA_LNK_FL_DATA_LINK);	\
> > +	     link;							\
> > +	     link = __media_entity_next_link(entity, link,		\
> > +					     MEDIA_LNK_FL_DATA_LINK))
> 
> Missing one blank line here.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Added with these addressed.

-- 
Sakari Ailus
