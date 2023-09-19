Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 170F17A5FC1
	for <lists+linux-media@lfdr.de>; Tue, 19 Sep 2023 12:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230287AbjISKhi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Sep 2023 06:37:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230203AbjISKhh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Sep 2023 06:37:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 064A3E8
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 03:37:30 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 991D6842;
        Tue, 19 Sep 2023 12:35:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695119752;
        bh=y8/Lbns80HCvzHCSKXUesLd9sYWbBm+YUWh7zHw3IHg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T8uzJxufZW45YgFMzzDB+pTcXWwjZ1AaxrY6rd6dwmIaCY37G428ynSH+ugPji9oX
         PBEUFalA1o2uQE8ZVdnQTcwcywtcETKU2InDrpOGM4f0GXTXLz3LzkRetJB4GLyAkZ
         n55/IDDh0XPEmtTv6DNU7p/rlBrBqRdNxiG5CWO4=
Date:   Tue, 19 Sep 2023 13:37:41 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: Re: [PATCH v2 12/12] media: mc: Check pad flag validity
Message-ID: <20230919103741.GA1505@pendragon.ideasonboard.com>
References: <20230918125138.90002-1-sakari.ailus@linux.intel.com>
 <20230918125138.90002-13-sakari.ailus@linux.intel.com>
 <20230918134802.GH28874@pendragon.ideasonboard.com>
 <ZQl24DaMGeQSTPRa@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZQl24DaMGeQSTPRa@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 19, 2023 at 10:24:32AM +0000, Sakari Ailus wrote:
> On Mon, Sep 18, 2023 at 04:48:02PM +0300, Laurent Pinchart wrote:
> > On Mon, Sep 18, 2023 at 03:51:38PM +0300, Sakari Ailus wrote:
> > > Check the validity of pad flags on entity init. Exactly one of the flags
> > > must be set.
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  drivers/media/mc/mc-entity.c | 20 ++++++++++++++++++--
> > >  1 file changed, 18 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > > index 83468d4a440b..38d5bbae33d7 100644
> > > --- a/drivers/media/mc/mc-entity.c
> > > +++ b/drivers/media/mc/mc-entity.c
> > > @@ -195,8 +195,9 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
> > >  			   struct media_pad *pads)
> > >  {
> > >  	struct media_device *mdev = entity->graph_obj.mdev;
> > > -	struct media_pad *iter;
> > > +	struct media_pad *iter, *iter2;
> > >  	unsigned int i = 0;
> > > +	int ret = 0;
> > >  
> > >  	if (num_pads >= MEDIA_ENTITY_MAX_PADS)
> > >  		return -E2BIG;
> > > @@ -210,15 +211,30 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
> > >  	media_entity_for_each_pad(entity, iter) {
> > >  		iter->entity = entity;
> > >  		iter->index = i++;
> > > +
> > > +		if (hweight32(iter->flags & (MEDIA_PAD_FL_SINK |
> > > +					     MEDIA_PAD_FL_SOURCE)) != 1) {
> > > +			ret = -EINVAL;
> > > +			break;
> > > +		}
> > > +
> > >  		if (mdev)
> > >  			media_gobj_create(mdev, MEDIA_GRAPH_PAD,
> > >  					  &iter->graph_obj);
> > >  	}
> > >  
> > > +	if (ret && mdev) {
> > > +		media_entity_for_each_pad(entity, iter2) {
> > > +			if (iter2 == iter)
> > > +				break;
> > > +			media_gobj_destroy(&iter->graph_obj);
> > 
> > Wrong iterator.
> > 
> > Instead of using a second iterator, which can be error-prone as shown
> > here, how about breaking when !iter->graph_obj.mdev, which indicates an
> > uninitialized object ?
> 
> media_gobj_destroy() is actually a no-op if it hasn't been initialised
> (created).

I'm fine calling it unconditionally too.

> It'd be still cleaner to make the pad flag checks first and only then call
> media_gobj_create() on them. But if someone needs something more in the
> future, then that doesn't mix as well anymore.
> 
> Both are fine IMO.
> 
> > > +		}
> > > +	}
> > > +
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
