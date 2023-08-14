Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3A0677B4F9
	for <lists+linux-media@lfdr.de>; Mon, 14 Aug 2023 11:01:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235064AbjHNJBD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Aug 2023 05:01:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237114AbjHNJAa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Aug 2023 05:00:30 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C10230C1
        for <linux-media@vger.kernel.org>; Mon, 14 Aug 2023 02:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692003609; x=1723539609;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F4y/717dLOWwf475pd76CFUkXQeFAYOnnTesNh9eGtk=;
  b=a4Ykrv+ItNLX5Kte8tw+UNkcanzb8zvUc/gxBnOaUQZQHyr7jo9KsJry
   3XCSa/8P65sk5qJEg1H+naDTW8lFqtLOtOk3yZUp9TvtRT04yE9eNTfxv
   2GjHN6c1VtkLMAmBC8gboFBYo/XANx2Ol7KGYLUBMyOwlvwZfRrU/GmGs
   CczTqqZ/oVrWPJa6MXxz+2JJ9+Jkc/fivEI2guwBny3l2yHUPPg87i4pc
   JFzxzd5IFAPChrpdr4H0aqZxK9WAiDs8b88Yvf2oxc5jxpmPkBYgCR0Ni
   +jU6DJr1cmobuKunwcTrgdKcTHuntQwQLx87ENBu8pLi3MnNG62YxvR2U
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="356958968"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="356958968"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 01:59:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="876878679"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 01:59:23 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 28B5E11FAE0;
        Mon, 14 Aug 2023 11:49:47 +0300 (EEST)
Date:   Mon, 14 Aug 2023 08:49:47 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: Re: [PATCH v3 02/10] media: mc: Check pad flag validity
Message-ID: <ZNnqq2dCHmPQ8yIs@kekkonen.localdomain>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-3-sakari.ailus@linux.intel.com>
 <lk7muh5ptwxfyujwwr7mon4tw23bexgvgtx4rfju34fycgl7xb@fzor6lkcvem6>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lk7muh5ptwxfyujwwr7mon4tw23bexgvgtx4rfju34fycgl7xb@fzor6lkcvem6>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Thu, Aug 10, 2023 at 03:54:40PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Tue, Aug 08, 2023 at 10:55:30AM +0300, Sakari Ailus wrote:
> > Check the validity of pad flags on entity init. Exactly one of the flags
> > must be set.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/mc/mc-entity.c | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > index 83468d4a440b..4991281dcccc 100644
> > --- a/drivers/media/mc/mc-entity.c
> > +++ b/drivers/media/mc/mc-entity.c
> > @@ -197,6 +197,7 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
> >  	struct media_device *mdev = entity->graph_obj.mdev;
> >  	struct media_pad *iter;
> >  	unsigned int i = 0;
> > +	int ret = 0;
> >
> >  	if (num_pads >= MEDIA_ENTITY_MAX_PADS)
> >  		return -E2BIG;
> > @@ -210,6 +211,14 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
> >  	media_entity_for_each_pad(entity, iter) {
> >  		iter->entity = entity;
> >  		iter->index = i++;
> > +
> > +		if (hweight32(iter->flags & (MEDIA_PAD_FL_SINK |
> > +					     MEDIA_PAD_FL_SOURCE))
> > +		    != 1) {
> 
> Fits on the previous line, if you like it

Not quite.

> 
> > +			ret = -EINVAL;
> > +			break;
> 
> Now that we can interrupt the for loop earlier, do you need to cleanup
> objects appended to the mdev list with the media_gobj_create() call here below ?

Nice find. I'll fix this for v4.

> 
> > +		}
> > +
> >  		if (mdev)
> >  			media_gobj_create(mdev, MEDIA_GRAPH_PAD,
> >  					  &iter->graph_obj);
> > @@ -218,7 +227,7 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
> >  	if (mdev)
> >  		mutex_unlock(&mdev->graph_mutex);
> >
> > -	return 0;
> > +	return ret;
> >  }
> >  EXPORT_SYMBOL_GPL(media_entity_pads_init);
> >

-- 
Kind regards,

Sakari Ailus
