Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6646B1FD0A7
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2020 17:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgFQPPq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jun 2020 11:15:46 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:50328 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726494AbgFQPPq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jun 2020 11:15:46 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id E9EC03C057F;
        Wed, 17 Jun 2020 17:15:43 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 8p7emesp5isC; Wed, 17 Jun 2020 17:15:37 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id CA0AD3C00BA;
        Wed, 17 Jun 2020 17:15:37 +0200 (CEST)
Received: from vmlxhi-121.adit-jv.com (10.72.92.132) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 17 Jun
 2020 17:15:37 +0200
Date:   Wed, 17 Jun 2020 17:15:37 +0200
From:   Michael Rodin <mrodin@de.adit-jv.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
CC:     Michael Rodin <mrodin@de.adit-jv.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <michael@rodin.online>,
        <efriedrich@de.adit-jv.com>, <erosca@de.adit-jv.com>,
        Steve Longerbeam <steve_longerbeam@mentor.com>
Subject: Re: [PATCH] media: rcar-vin: Move media_device_register to async
 completion
Message-ID: <20200617151537.GB88066@vmlxhi-121.adit-jv.com>
References: <1592328696-84533-1-git-send-email-mrodin@de.adit-jv.com>
 <20200617105646.GB2850317@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200617105646.GB2850317@oden.dyn.berto.se>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.92.132]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas and Steve,

On Wed, Jun 17, 2020 at 12:56:46PM +0200, Niklas Söderlund wrote:
> Hi Michael and Steve,
> 
> On 2020-06-16 19:31:36 +0200, Michael Rodin wrote:
> > From: Steve Longerbeam <steve_longerbeam@mentor.com>
> > 
> > The media_device is registered during driver probe, before async
> > completion, so it is possible for .link_notify to be called before
> > all devices are bound.
> > 
> > Fix this by moving media_device_register() to rvin_group_notify_complete().
> > This ensures that all devices are now bound (the rcar-csi2 subdevices and
> > and video capture devices) before .link_notify can be called.
> 
> I'm curious to what situation created the need for this change. I'm 
> currently trying to take the VIN driver in the opposite direction [1] 
> with the end goal of registering video devices at probe time and then 
> allow the media graph to populate as devices becomes available.

It looks like almost all platform drivers call media_device_register() in
the completion callback. From my understaning it is necessary to ensure
that all subdevices are bound and all links are created before the user
can enable any link (which would trigger link_notify callback execution)
and set formats. If I am not mistaken, Steve could observe an "OOPS" or
at least it is theoretically possible.

Actually I found that this patch alone is not enough even if it is correct,
because we also have to register the media device in rvin_parallel_notify_complete()
in case if there is only a parallel video input device attached.

> My reason for this is that we could have a functional pipeline inside 
> the graph even if it's not complete. This came out of the GMSL work done
> a while pack where I had a faulty camera that would prevent the other 7 
> in the system to function.

I agree that if a probe of a faulty subdevice fails, this should not affect
functionality of the other attached subdevices. The "complete" callback of
the async notifier is probably not executed in this case, so I guess, we
would have to register the media device in the "bound" callback after the first
subdevice has been probed? Otherwise there is not much sense to have video
capture devices, which are not connected to any source.

(Delayed) population of the media graph after media device registration
sounds also like a requirement for device tree overlay support, which would
also be a nice feature.

> 1. [PATCH 0/5] media-device: Report if graph is complete
> 
> > 
> > Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
> > Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-core.c | 14 ++++++--------
> >  1 file changed, 6 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> > index 7440c89..e70f83b 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-core.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> > @@ -253,7 +253,6 @@ static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin)
> >  	struct media_device *mdev = &group->mdev;
> >  	const struct of_device_id *match;
> >  	struct device_node *np;
> > -	int ret;
> >  
> >  	mutex_init(&group->lock);
> >  
> > @@ -266,7 +265,6 @@ static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin)
> >  	vin_dbg(vin, "found %u enabled VIN's in DT", group->count);
> >  
> >  	mdev->dev = vin->dev;
> > -	mdev->ops = &rvin_media_ops;
> >  
> >  	match = of_match_node(vin->dev->driver->of_match_table,
> >  			      vin->dev->of_node);
> > @@ -278,11 +276,7 @@ static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin)
> >  
> >  	media_device_init(mdev);
> >  
> > -	ret = media_device_register(&group->mdev);
> > -	if (ret)
> > -		rvin_group_cleanup(group);
> > -
> > -	return ret;
> > +	return 0;
> >  }
> >  
> >  static void rvin_group_release(struct kref *kref)
> > @@ -688,6 +682,8 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
> >  		return ret;
> >  	}
> >  
> > +	vin->group->mdev.ops = &rvin_media_ops;
> > +
> >  	/* Register all video nodes for the group. */
> >  	for (i = 0; i < RCAR_VIN_NUM; i++) {
> >  		if (vin->group->vin[i] &&
> > @@ -736,8 +732,10 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
> >  		}
> >  	}
> >  	mutex_unlock(&vin->group->lock);
> > +	if (ret)
> > +		return ret;
> >  
> > -	return ret;
> > +	return media_device_register(&vin->group->mdev);
> >  }
> >  
> >  static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
> > -- 
> > 2.7.4
> > 
> 
> -- 
> Regards,
> Niklas Söderlund

-- 
Best Regards,
Michael
