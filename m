Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18A2574868F
	for <lists+linux-media@lfdr.de>; Wed,  5 Jul 2023 16:41:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232580AbjGEOlG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jul 2023 10:41:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232571AbjGEOlF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jul 2023 10:41:05 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1AE312A
        for <linux-media@vger.kernel.org>; Wed,  5 Jul 2023 07:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688568062; x=1720104062;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tIBBi2+Dqo7f3TbWPMBwsnjgDXZH9vAej8IF1zkNRY0=;
  b=H6iVgHOGsWmjQ/3u18NzF/DLSNVxMFOiG6i6u6UNb+hDdYRD1CzZuIAd
   hsSMAgubhpaXs0VbUqS6WS6Xt/vycVkG1NRHCaxVsPb96mfOJ6uNoaJ5M
   cOxJ/E52WUN/oqaSetLeZn9DVcBZrReQn0xOYZn+fwxo9UVSgeuLwuV38
   rY+38eAyf0SRu4e68PJZ1mu4Pvut1Nhz8bDqzQoPK/G8g79gaxg/uN3Gp
   AAf9aHMPJr8hLcdHs7mDqacACpt5SdYbgUR8aRTsNhtTufTbsEzUvcitp
   u827UXG+qUUlFL7GzxpmVAvTjA9Gwh8JoTnxtMfo6HOV/DLYIA5aWVjzI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="427042215"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="427042215"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 07:40:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="748759866"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="748759866"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 07:40:26 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 26AB112023C;
        Wed,  5 Jul 2023 17:40:24 +0300 (EEST)
Date:   Wed, 5 Jul 2023 14:40:24 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl
Subject: Re: [PATCH 1/7] media: mc: Check pad flag validity
Message-ID: <ZKWA2HduWzrO15UU@kekkonen.localdomain>
References: <20230630204338.126583-1-sakari.ailus@linux.intel.com>
 <20230630204338.126583-2-sakari.ailus@linux.intel.com>
 <wsb6xkn2inp7wrfld6txhv4lhtdsccgpdxhnnbwvjj5v575kxo@kqtwh7sn7txo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wsb6xkn2inp7wrfld6txhv4lhtdsccgpdxhnnbwvjj5v575kxo@kqtwh7sn7txo>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 03, 2023 at 09:53:14AM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Fri, Jun 30, 2023 at 11:43:32PM +0300, Sakari Ailus wrote:
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
> Fits on the previous line ?

Yes. Thanks!

> 
> > +			ret = -EINVAL;
> > +			break;
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
> > --
> > 2.39.2
> >

-- 
Sakari Ailus
