Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEFAE474DB1
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 23:06:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238272AbhLNWFv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Dec 2021 17:05:51 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45378 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238004AbhLNWFX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Dec 2021 17:05:23 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D7C1F8C4;
        Tue, 14 Dec 2021 23:05:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639519522;
        bh=huTBinLTuS+od4bsWj55GHvrZU08eIXohhfzClTn9Bo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WNd83bb5gxsh6w6/7dvAM2ODfOwsuQLMA33N9oLy63lXVNyeZbxrKyTQoSRxCVecf
         WMBI3g768TcYv5zz/J39O3lQh+Sh0uCLuwuPbvuArJ45KwGNWj70HI+KDjeTs55PT6
         2clxdfqmG+nQS8Rg2+6m6XymrG33gos/cPr5oToc=
Date:   Wed, 15 Dec 2021 00:05:20 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Daniel Scally <djrscally@gmail.com>, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org, hanlinchen@chromium.org,
        tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: Re: [PATCH 3/5] media: entity: Skip non-data links in graph iteration
Message-ID: <YbkVIMLq+9xFT/la@pendragon.ideasonboard.com>
References: <20211213232849.40071-1-djrscally@gmail.com>
 <20211213232849.40071-4-djrscally@gmail.com>
 <Ybixw0dIZyC6wQL4@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Ybixw0dIZyC6wQL4@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 14, 2021 at 05:01:23PM +0200, Sakari Ailus wrote:
> On Mon, Dec 13, 2021 at 11:28:47PM +0000, Daniel Scally wrote:
> > When iterating over the media graph, don't follow links that are not
> > pad-to-pad links.
> > 
> > Signed-off-by: Daniel Scally <djrscally@gmail.com>
> > ---
> > Changes since the rfc:
> > 
> > 	- new patch
> > 
> >  drivers/media/mc/mc-entity.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > index d79eb88bc167..aeddc3f6310e 100644
> > --- a/drivers/media/mc/mc-entity.c
> > +++ b/drivers/media/mc/mc-entity.c
> > @@ -325,6 +325,14 @@ static void media_graph_walk_iter(struct media_graph *graph)
> >  
> >  	link = list_entry(link_top(graph), typeof(*link), list);
> >  
> > +	/* If the link is not a pad-to-pad link, don't follow it */
> 
> This comment should mention data links, not pad-to-pad links.
> 
> Seems fine apart from this.
> 
> > +	if ((link->flags & MEDIA_LNK_FL_LINK_TYPE) != MEDIA_LNK_FL_DATA_LINK) {
> > +		link_top(graph) = link_top(graph)->next;
> > +		dev_dbg(entity->graph_obj.mdev->dev, "walk: skipping %s link\n",
> > +			link_type(link));

I would drop the debug message. The other messages in this function can
be useful to figure out why graph walk doesn't behave like expected
(reporting, for instance, that a disabled link is not traversed), but I
don't think there's much value in indicating we're skipping non-data
links.

With these issues addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > +		return;
> > +	}
> > +
> >  	/* The link is not enabled so we do not follow. */
> >  	if (!(link->flags & MEDIA_LNK_FL_ENABLED)) {
> >  		link_top(graph) = link_top(graph)->next;

-- 
Regards,

Laurent Pinchart
