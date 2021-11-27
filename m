Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 476FA45FFFD
	for <lists+linux-media@lfdr.de>; Sat, 27 Nov 2021 16:53:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349276AbhK0P4Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Nov 2021 10:56:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351065AbhK0PyO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Nov 2021 10:54:14 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7DF5C0613ED
        for <linux-media@vger.kernel.org>; Sat, 27 Nov 2021 07:49:43 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id l16so25620736wrp.11
        for <linux-media@vger.kernel.org>; Sat, 27 Nov 2021 07:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=o7zClZEkfKlSYafiuTkKczg5s3NAbP1eM/hEt1Zsmsg=;
        b=HYfIEQl1obgXccQ6Y99XNm1aGEdW62UyfacT0dcWWljXeF2rX2V6Dg6jhADP0kV+Cw
         IGM43dwAJ5RKkV/Fe9Px8cKlea85DXSAGK5aShsquYqzgdYVMgfewMURCSVuF0fa87ln
         ypeRsp9KanenZr7544KS/UW7s8QgU456RgdaPzduOoP9H3Dc7F39zbTZRHYUDyDa30iI
         aGo8nd4+duQrMMp1Sxt+j/zx/YiFUmv7Fy8TcSHm0JJ9OkEhVgQF4SpIfXLcYsJ+J2zj
         UV4FJ+pzbc2UNz2nY39ziNSlZfVARYuHQd3QL7PkyARkBoR3i6bTz98M5Lq7hHg7K+Qj
         tH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=o7zClZEkfKlSYafiuTkKczg5s3NAbP1eM/hEt1Zsmsg=;
        b=vJYPRsFb/JlWcVo9eBTBLoTGsM9I4TEf4Krw9hgzt+/r4av6uhmwQB5WY9ZO52HCoG
         uB75AYqwOrSUCkficDF4SKxk+27x5CpqLykcJpfYSvJJ0lJ528f+Z+VuvDmE+9tBeH+J
         TBLpcC3LilLP1NpiQNQ/d1gL1pjYUqE39qfmQGJkjBlpfAa/QHCxN01FY+8SCRwz+Lqw
         lUDtbtmattztxF8VdKZYR5FJguUVzUFbUatZxHhFP0vy8nmO3A5wogTmcAgFFboEqa4u
         STIar5yKxtLbqUYS7/1zyC4sIlGUsakgmKlwr+9/hDP3pi0yqlXC91naa++AuVElma3O
         jkmw==
X-Gm-Message-State: AOAM533dONABpo05apYMtUGi5B080Tnm9h0hygGD1JRAfjIZXf2mQToD
        sLDyEOISoRGIzaaYlN4sZ4o6pw==
X-Google-Smtp-Source: ABdhPJxFWiyIuyBoujmvAS8tsLWJuXu11V7/B5woU0UMQjlSnVK6GVQN8puDY7LPv26CGiqmz2wefw==
X-Received: by 2002:a5d:58c5:: with SMTP id o5mr22470068wrf.15.1638028182503;
        Sat, 27 Nov 2021 07:49:42 -0800 (PST)
Received: from localhost (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.gmail.com with ESMTPSA id y142sm9608342wmc.40.2021.11.27.07.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 07:49:42 -0800 (PST)
Date:   Sat, 27 Nov 2021 16:49:41 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] media: rcar-vin: Breakout media link creation
Message-ID: <YaJTlR9DXTxe7tQe@bismarck.dyn.berto.se>
References: <20211020200225.1956048-1-niklas.soderlund+renesas@ragnatech.se>
 <20211020200225.1956048-3-niklas.soderlund+renesas@ragnatech.se>
 <20211104164306.ia33awmr5rcnnxtg@uno.localdomain>
 <YYwG8/4qeOuV7cDG@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YYwG8/4qeOuV7cDG@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Laurent,

Thanks for your review.

On 2021-11-10 19:52:51 +0200, Laurent Pinchart wrote:
> Hello,
> 
> On Thu, Nov 04, 2021 at 05:43:06PM +0100, Jacopo Mondi wrote:
> > On Wed, Oct 20, 2021 at 10:02:24PM +0200, Niklas Söderlund wrote:
> > > In preparation of creating more links to allow for full Virtual Channel
> > > routing within the CSI-2 block break out the link creation logic to a
> > > helper function as the logic will grow in future work.
> 
> Are links the right option, should we switch to subdev internal routing
> configuration ?

That is an interesting question I thought about it but decided against 
it, at lest for now. The design we have is that each source pad of the 
R-Car CSI-2 subdevice is fixed to a specific VC (source pad 0 -> VC0, 
source pad 1 - > VC1, etc). And with this patch we preserve this 
behavior.

Once we have the internal routing and multiplexed stream API upstream we 
can evolve this and still keep the API consistent. As a first step we 
expose the internal routing true the new API, read-only as that how it 
is implemented today and then on-top of that we can decide if we want to 
make it configurable from user-space, or not.

> 
> > > There is no functional change.
> > >
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > ---
> > >  drivers/media/platform/rcar-vin/rcar-core.c | 38 ++++++++++-----------
> > >  1 file changed, 18 insertions(+), 20 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> > > index bd960c348ba5228c..65ab66a072e9d635 100644
> > > --- a/drivers/media/platform/rcar-vin/rcar-core.c
> > > +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> > > @@ -909,6 +909,22 @@ static const struct media_device_ops rvin_csi2_media_ops = {
> > >  	.link_notify = rvin_csi2_link_notify,
> > >  };
> > >
> > > +static int rvin_csi2_add_route(struct rvin_group *group,
> > 
> > How about rvin_csi2_create_link() ?
> >
> > > +			       const struct rvin_group_route *route)
> > > +
> > > +{
> > > +	struct media_entity *source = &group->remotes[route->csi].subdev->entity;
> > > +	unsigned int source_idx = rvin_group_csi_channel_to_pad(route->channel);
> > > +	struct media_entity *sink = &group->vin[route->vin]->vdev.entity;
> > > +	struct media_pad *source_pad = &source->pads[source_idx];
> > > +	struct media_pad *sink_pad = &sink->pads[0];
> > > +
> >
> > And keep the comment here to re-state that if the linke existed
> > already is not a fatal error
> > 
> > Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> With those comments addressed,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > > +	if (media_entity_find_link(source_pad, sink_pad))
> > > +		return 0;
> > > +
> > > +	return media_create_pad_link(source, source_idx, sink, 0, 0);
> > > +}
> > > +
> > >  static int rvin_csi2_setup_links(struct rvin_dev *vin)
> > >  {
> > >  	const struct rvin_group_route *route;
> > > @@ -917,10 +933,6 @@ static int rvin_csi2_setup_links(struct rvin_dev *vin)
> > >  	/* Create all media device links between VINs and CSI-2's. */
> > >  	mutex_lock(&vin->group->lock);
> > >  	for (route = vin->info->routes; route->mask; route++) {
> > > -		struct media_pad *source_pad, *sink_pad;
> > > -		struct media_entity *source, *sink;
> > > -		unsigned int source_idx;
> > > -
> > >  		/* Check that VIN is part of the group. */
> > >  		if (!vin->group->vin[route->vin])
> > >  			continue;
> > > @@ -933,23 +945,9 @@ static int rvin_csi2_setup_links(struct rvin_dev *vin)
> > >  		if (!vin->group->remotes[route->csi].subdev)
> > >  			continue;
> > >
> > > -		source = &vin->group->remotes[route->csi].subdev->entity;
> > > -		source_idx = rvin_group_csi_channel_to_pad(route->channel);
> > > -		source_pad = &source->pads[source_idx];
> > > -
> > > -		sink = &vin->group->vin[route->vin]->vdev.entity;
> > > -		sink_pad = &sink->pads[0];
> > > -
> > > -		/* Skip if link already exists. */
> > > -		if (media_entity_find_link(source_pad, sink_pad))
> > > -			continue;
> > > -
> > > -		ret = media_create_pad_link(source, source_idx, sink, 0, 0);
> > > -		if (ret) {
> > > -			vin_err(vin, "Error adding link from %s to %s\n",
> > > -				source->name, sink->name);
> > > +		ret = rvin_csi2_add_route(vin->group, route);
> > > +		if (ret)
> > >  			break;
> > > -		}
> > >  	}
> > >  	mutex_unlock(&vin->group->lock);
> > >
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Kind Regards,
Niklas Söderlund
