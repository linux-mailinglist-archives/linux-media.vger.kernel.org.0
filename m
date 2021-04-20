Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B4FC3657C8
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 13:42:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231309AbhDTLm3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 07:42:29 -0400
Received: from mga12.intel.com ([192.55.52.136]:40557 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230491AbhDTLm2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 07:42:28 -0400
IronPort-SDR: 8OVaaaaYhxgJyGoC9Cg4EiCfyO+6j7nZfTKI0BsVfvlk2QEkWySGzAB+dVyk32J+ZoNAfgFzne
 otpjuT4DiSDQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9959"; a="174975919"
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; 
   d="scan'208";a="174975919"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 04:41:57 -0700
IronPort-SDR: K1gtYQI6Md7Vt6G2duGb2nwnOXCmw6lKKQmPjJ7HZNMBDFaTfTlwzNANMq9rgXBY18GrJ8GRFO
 0fOms9A8YJGg==
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; 
   d="scan'208";a="420376145"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 04:41:55 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 42714202EC;
        Tue, 20 Apr 2021 14:41:53 +0300 (EEST)
Date:   Tue, 20 Apr 2021 14:41:53 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v5 11/24] media: entity: Skip link validation for pads to
 which there is no route to
Message-ID: <20210420114153.GM3@paasikivi.fi.intel.com>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
 <20210415130450.421168-12-tomi.valkeinen@ideasonboard.com>
 <YHx1E3AWm2mzD4Gs@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YHx1E3AWm2mzD4Gs@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sun, Apr 18, 2021 at 09:06:11PM +0300, Laurent Pinchart wrote:
> Hi Tomi and Sakari,
> 
> Thank you for the patch.
> 
> There's an extra "to" in the subject line.
> 
> On Thu, Apr 15, 2021 at 04:04:37PM +0300, Tomi Valkeinen wrote:
> > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > 
> > Links are validated along the pipeline which is about to start streaming.
> > Not all the pads in entities that are traversed along that pipeline are
> > part of the pipeline, however. Skip the link validation for such pads,
> > and while at there rename "other_pad" to "local_pad" to convey the fact
> > the route to be checked is internal to the entity.
> 
> Both "pad" and "local_pad" are local. I would have kept the "other_pad"

The pad that in the remote entity is not local. The other one could be
called remote_pad though.

> variable name.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

> 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/media/mc/mc-entity.c | 13 +++++++++----
> >  1 file changed, 9 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > index 28d7fd254c77..fe6cb743c85c 100644
> > --- a/drivers/media/mc/mc-entity.c
> > +++ b/drivers/media/mc/mc-entity.c
> > @@ -482,12 +482,17 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
> >  		bitmap_fill(has_no_links, entity->num_pads);
> >  
> >  		list_for_each_entry(link, &entity->links, list) {
> > -			struct media_pad *other_pad =
> > +			struct media_pad *local_pad =
> >  				link->sink->entity == entity ?
> >  				link->sink : link->source;
> >  
> > +			/* Ignore pads to which there is no route. */
> > +			if (!media_entity_has_route(entity, pad->index,
> > +						    local_pad->index))
> > +				continue;
> > +
> >  			/* Mark that a pad is connected by a link. */
> > -			bitmap_clear(has_no_links, other_pad->index, 1);
> > +			bitmap_clear(has_no_links, local_pad->index, 1);
> >  
> >  			/*
> >  			 * Pads that either do not need to connect or
> > @@ -496,13 +501,13 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
> >  			 */
> >  			if (!(pad->flags & MEDIA_PAD_FL_MUST_CONNECT) ||
> >  			    link->flags & MEDIA_LNK_FL_ENABLED)
> > -				bitmap_set(active, other_pad->index, 1);
> > +				bitmap_set(active, local_pad->index, 1);
> >  
> >  			/*
> >  			 * Link validation will only take place for
> >  			 * sink ends of the link that are enabled.
> >  			 */
> > -			if (link->sink != other_pad ||
> > +			if (link->sink != local_pad ||
> >  			    !(link->flags & MEDIA_LNK_FL_ENABLED))
> >  				continue;
> >  
> 

-- 
Sakari Ailus
