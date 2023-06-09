Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D90D5729D23
	for <lists+linux-media@lfdr.de>; Fri,  9 Jun 2023 16:42:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240813AbjFIOmK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jun 2023 10:42:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231960AbjFIOmI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jun 2023 10:42:08 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C5D2E43
        for <linux-media@vger.kernel.org>; Fri,  9 Jun 2023 07:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686321727; x=1717857727;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nIWVdSJQqI/OT+LWVsadoTEyGQvPflXBGTz/WwoxnBQ=;
  b=NS5SEl8fmhFZqCwkZUGSdwPsgG4ogws3Mxx9GhFfYfGlElWlBJJePMOz
   Jlj4WuAD/MNlR9Ls27XUHF6L8g1pQ7MDLi/RqjqYNNxhIU3t6pKptmAov
   dBhRVC52QRsdQlOECh7CA9exhBGtUzBRIdW3uss5aZKjPOrzT02hHV/W/
   8XH+Yls4IG/CazFfV4oghTxo3nQjGfTUGSGELknuZZLG3sdJR44SMxx11
   uSVrOtrSX6s50EVxOfPl5gGfi53YHur6ip8Nrfcx25FSQWrvQULOczKs4
   gYvR6IU+Tnj5PP0mCFGVzVl6F3Rurt/VLXgpKqUbu9R9whE2vbOxnHQRr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="360095234"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; 
   d="scan'208";a="360095234"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 07:41:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="957176582"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; 
   d="scan'208";a="957176582"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 07:41:45 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 4CF6511F76F;
        Fri,  9 Jun 2023 17:41:43 +0300 (EEST)
Date:   Fri, 9 Jun 2023 14:41:43 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [RFC 4/7] media: mc: Check pad flag validity
Message-ID: <ZIM6J8HtGJXqV4C8@kekkonen.localdomain>
References: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
 <20230505215257.60704-5-sakari.ailus@linux.intel.com>
 <20230602095821.GJ19463@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230602095821.GJ19463@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 02, 2023 at 12:58:21PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Sat, May 06, 2023 at 12:52:54AM +0300, Sakari Ailus wrote:
> > Check the validity of pad flags on entity init. Exactly one of the flags
> > must be set.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/mc/mc-entity.c | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > index ed99160a2487..c1bc48c4d239 100644
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
> > @@ -210,6 +211,15 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
> >  	media_entity_for_each_pad(entity, iter) {
> >  		iter->entity = entity;
> >  		iter->index = i++;
> > +
> > +		if (hweight32(iter->flags & (MEDIA_PAD_FL_SINK |
> > +					     MEDIA_PAD_FL_SOURCE |
> > +					     MEDIA_PAD_FL_INTERNAL_SOURCE))
> > +		    != 1) {
> 
> I would add this check as patch 1/7 in this series, with FL_SINK an
> FL_SOURCE only, and then extend it in the patch where you introduce
> FL_INTERNAL_SOURCE.

Sounds reasonable.

> 
> > +			ret = -EINVAL;
> > +			break;
> > +		}
> > +
> >  		if (mdev)
> >  			media_gobj_create(mdev, MEDIA_GRAPH_PAD,
> >  					  &iter->graph_obj);
> > @@ -218,7 +228,7 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
> >  	if (mdev)
> >  		mutex_unlock(&mdev->graph_mutex);
> >  
> > -	return 0;
> > +	return ret;
> >  }
> >  EXPORT_SYMBOL_GPL(media_entity_pads_init);
> >  
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Sakari Ailus
