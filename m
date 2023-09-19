Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 008917A5F6B
	for <lists+linux-media@lfdr.de>; Tue, 19 Sep 2023 12:24:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231376AbjISKYo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Sep 2023 06:24:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230504AbjISKYn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Sep 2023 06:24:43 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D88AE8
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 03:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695119078; x=1726655078;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VQlzUWfEIC4dF5w7dC/jVBda80kw2U1PIANOYLHi0hU=;
  b=JnmDJ4dgQsumns6VIH4pyrsTuMrVHF2YkD/uN7jDy05EwMip33U56ZDn
   RSiqFitPZVhIwd4DS8PCVi4CKPLsA7BGs5i8sd7k0gEY/q30ysch6QBTe
   Qu6rRQkCqsbHocqApQw2ViTqB3jUrk6bgyjk0zwv8CskhWzsXbtoUjEb7
   Jl1W1iODWgWZDuBn8to38pc1awr+rqD56vF/lfdcI0ELKj77LE3W8lLKq
   a8pOZ7k3SBMbNgv2yVpwPJIVEUfp9lb9Dg+gGZUi9ZUCh3dXSTi3vKL/j
   IcHA3wO1kSdkwFOntpPUd9UvJ58KRzeOjpMCY68oFWEk37wdRexxsmMwh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="379806451"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="379806451"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 03:24:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="811675489"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="811675489"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 03:24:35 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id A05C5120BE5;
        Tue, 19 Sep 2023 13:24:32 +0300 (EEST)
Date:   Tue, 19 Sep 2023 10:24:32 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: Re: [PATCH v2 12/12] media: mc: Check pad flag validity
Message-ID: <ZQl24DaMGeQSTPRa@kekkonen.localdomain>
References: <20230918125138.90002-1-sakari.ailus@linux.intel.com>
 <20230918125138.90002-13-sakari.ailus@linux.intel.com>
 <20230918134802.GH28874@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918134802.GH28874@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for the review.

On Mon, Sep 18, 2023 at 04:48:02PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Mon, Sep 18, 2023 at 03:51:38PM +0300, Sakari Ailus wrote:
> > Check the validity of pad flags on entity init. Exactly one of the flags
> > must be set.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/mc/mc-entity.c | 20 ++++++++++++++++++--
> >  1 file changed, 18 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > index 83468d4a440b..38d5bbae33d7 100644
> > --- a/drivers/media/mc/mc-entity.c
> > +++ b/drivers/media/mc/mc-entity.c
> > @@ -195,8 +195,9 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
> >  			   struct media_pad *pads)
> >  {
> >  	struct media_device *mdev = entity->graph_obj.mdev;
> > -	struct media_pad *iter;
> > +	struct media_pad *iter, *iter2;
> >  	unsigned int i = 0;
> > +	int ret = 0;
> >  
> >  	if (num_pads >= MEDIA_ENTITY_MAX_PADS)
> >  		return -E2BIG;
> > @@ -210,15 +211,30 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
> >  	media_entity_for_each_pad(entity, iter) {
> >  		iter->entity = entity;
> >  		iter->index = i++;
> > +
> > +		if (hweight32(iter->flags & (MEDIA_PAD_FL_SINK |
> > +					     MEDIA_PAD_FL_SOURCE)) != 1) {
> > +			ret = -EINVAL;
> > +			break;
> > +		}
> > +
> >  		if (mdev)
> >  			media_gobj_create(mdev, MEDIA_GRAPH_PAD,
> >  					  &iter->graph_obj);
> >  	}
> >  
> > +	if (ret && mdev) {
> > +		media_entity_for_each_pad(entity, iter2) {
> > +			if (iter2 == iter)
> > +				break;
> > +			media_gobj_destroy(&iter->graph_obj);
> 
> Wrong iterator.
> 
> Instead of using a second iterator, which can be error-prone as shown
> here, how about breaking when !iter->graph_obj.mdev, which indicates an
> uninitialized object ?

media_gobj_destroy() is actually a no-op if it hasn't been initialised
(created).

It'd be still cleaner to make the pad flag checks first and only then call
media_gobj_create() on them. But if someone needs something more in the
future, then that doesn't mix as well anymore.

Both are fine IMO.

> 
> > +		}
> > +	}
> > +
> >  	if (mdev)
> >  		mutex_unlock(&mdev->graph_mutex);
> >  
> > -	return 0;
> > +	return ret;
> >  }
> >  EXPORT_SYMBOL_GPL(media_entity_pads_init);
> >  
> 

-- 
Regards,

Sakari Ailus
