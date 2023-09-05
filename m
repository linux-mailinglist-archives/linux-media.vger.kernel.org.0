Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF6AF79259C
	for <lists+linux-media@lfdr.de>; Tue,  5 Sep 2023 18:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234969AbjIEQBl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Sep 2023 12:01:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354642AbjIENNm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Sep 2023 09:13:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6169819B
        for <linux-media@vger.kernel.org>; Tue,  5 Sep 2023 06:13:38 -0700 (PDT)
Received: from pendragon.ideasonboard.com (ftip006315900.acc1.colindale.21cn-nte.bt.net [81.134.214.249])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 66865AF2;
        Tue,  5 Sep 2023 15:12:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1693919530;
        bh=ksayXxUa2+lacoJ4g+XjOm9Nmjf3T6rHQdfbdu97Fb4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HYfZjWP9NeQ51fZIXl0+/BYF09EiHxu0xYErZpPMSUEF1VMjf1DjSAFQbyTCejrSg
         7ofXREsZV0ROF5ZHHGNJVOzUbK5sytQUitx7pEUkJ4qnJWDjV1lEQyZh+Edh1n2mCf
         nWdML5MHS6/ptYZofIuOkAgqMbrCaaal0HWmgqCA=
Date:   Tue, 5 Sep 2023 16:13:49 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: Re: [PATCH v3 02/10] media: mc: Check pad flag validity
Message-ID: <20230905131349.GG11700@pendragon.ideasonboard.com>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-3-sakari.ailus@linux.intel.com>
 <lk7muh5ptwxfyujwwr7mon4tw23bexgvgtx4rfju34fycgl7xb@fzor6lkcvem6>
 <ZNnqq2dCHmPQ8yIs@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZNnqq2dCHmPQ8yIs@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 14, 2023 at 08:49:47AM +0000, Sakari Ailus wrote:
> On Thu, Aug 10, 2023 at 03:54:40PM +0200, Jacopo Mondi wrote:
> > On Tue, Aug 08, 2023 at 10:55:30AM +0300, Sakari Ailus wrote:
> > > Check the validity of pad flags on entity init. Exactly one of the flags
> > > must be set.
> > >
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  drivers/media/mc/mc-entity.c | 11 ++++++++++-
> > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > > index 83468d4a440b..4991281dcccc 100644
> > > --- a/drivers/media/mc/mc-entity.c
> > > +++ b/drivers/media/mc/mc-entity.c
> > > @@ -197,6 +197,7 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
> > >  	struct media_device *mdev = entity->graph_obj.mdev;
> > >  	struct media_pad *iter;
> > >  	unsigned int i = 0;
> > > +	int ret = 0;
> > >
> > >  	if (num_pads >= MEDIA_ENTITY_MAX_PADS)
> > >  		return -E2BIG;
> > > @@ -210,6 +211,14 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
> > >  	media_entity_for_each_pad(entity, iter) {
> > >  		iter->entity = entity;
> > >  		iter->index = i++;
> > > +
> > > +		if (hweight32(iter->flags & (MEDIA_PAD_FL_SINK |
> > > +					     MEDIA_PAD_FL_SOURCE))
> > > +		    != 1) {
> > 
> > Fits on the previous line, if you like it
> 
> Not quite.

The '!= 1) {' does. unless you want to lower the line length limit to 73
or less :-)

> > > +			ret = -EINVAL;
> > > +			break;
> > 
> > Now that we can interrupt the for loop earlier, do you need to cleanup
> > objects appended to the mdev list with the media_gobj_create() call here below ?
> 
> Nice find. I'll fix this for v4.
> 
> > > +		}
> > > +
> > >  		if (mdev)
> > >  			media_gobj_create(mdev, MEDIA_GRAPH_PAD,
> > >  					  &iter->graph_obj);
> > > @@ -218,7 +227,7 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
> > >  	if (mdev)
> > >  		mutex_unlock(&mdev->graph_mutex);
> > >
> > > -	return 0;
> > > +	return ret;
> > >  }
> > >  EXPORT_SYMBOL_GPL(media_entity_pads_init);
> > >

-- 
Regards,

Laurent Pinchart
