Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43DF11FD0F5
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2020 17:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbgFQP3B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jun 2020 11:29:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726761AbgFQP3B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jun 2020 11:29:01 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB8B0C06174E
        for <linux-media@vger.kernel.org>; Wed, 17 Jun 2020 08:29:00 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id 9so3381489ljv.5
        for <linux-media@vger.kernel.org>; Wed, 17 Jun 2020 08:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=1Jejmo94fRTO1Nf1cVg0JuCnL5f+D9dWyuhEwNHgCto=;
        b=gY47oZ/8jima8hUgUvS22+dJJei29tpxOsnOiPUZvVHgsyecPh2PTpPiLADhqB3Jy5
         5/NenTMuy6Nl2vx9Q8QROcfdisNAjpQ9p34cZO62xjsALFzTU4fha+2KofoRMxNOQOqg
         DiAcYTTRXXb670mowm0u3QboQESmHolMamxDRpdtyH4CZnYoLSrPH8KuXiNb+KbyrLLW
         ewFNkks7MX7ehYZpE+bGL7f7mbexgh1Lz+7ExQxlZEyj/fsgV7ok3HInwVNQ5evC/pkC
         DJ3NDSCThgh3hCpJM6Wdwh0sAwKhXHQnNcDnRD0pBDBbU3sVBT6641DWRWA8L8rhJIZ8
         GIhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=1Jejmo94fRTO1Nf1cVg0JuCnL5f+D9dWyuhEwNHgCto=;
        b=Frm0wY+H1zh3fgQxwoqHEWDK0vSE0yqqf2Bh2+ebRWQQ4h+VHbt3wkhBFGq0YLAzyz
         0cobW48K20TubULFiUvV7Lg8n2BzT08I2QgGnLCHrutyaI7/AAbwoQ1gL4cNJG7Yvcjf
         OOTJtjM8rWpNm5Vn/vVPd9Rm6pbh5cZOk/3Tyl0cqQOGewgQEesubidRXZupwZfaqz0U
         ttBH3f4duhvrhD0XYa2l2BfXQJY4AS87ChvgDUK23w7jZAr0P8gC+pB/4eiprMjWz5xI
         iAt9vMw7WPMvQbKdBzF8GpV+g4Cz1dceoD9p8/23ldW7c/yu/zlJV0M8wFpPuZUBQkB0
         Q89A==
X-Gm-Message-State: AOAM531fkvNR0eJm/V0BxZ6vzj00XRa3pqvckwweesgzThtbV2h0uQ6U
        0pJi9HK8MUgOKrZ6SZUeqKAHyw==
X-Google-Smtp-Source: ABdhPJxXi/cFo9WQlsVNHaUWqnJ0fClcBL3sHMCXkne5vzOfMKrvXNH95dUMzNIUva44CRMzuHPocg==
X-Received: by 2002:a2e:2202:: with SMTP id i2mr4444744lji.199.1592407739045;
        Wed, 17 Jun 2020 08:28:59 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id b10sm32549lfi.20.2020.06.17.08.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 08:28:58 -0700 (PDT)
Date:   Wed, 17 Jun 2020 17:28:57 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Michael Rodin <mrodin@de.adit-jv.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, michael@rodin.online,
        efriedrich@de.adit-jv.com, erosca@de.adit-jv.com,
        Steve Longerbeam <steve_longerbeam@mentor.com>
Subject: Re: [PATCH] media: rcar-vin: Move media_device_register to async
 completion
Message-ID: <20200617152857.GA2936315@oden.dyn.berto.se>
References: <1592328696-84533-1-git-send-email-mrodin@de.adit-jv.com>
 <20200617105646.GB2850317@oden.dyn.berto.se>
 <20200617151537.GB88066@vmlxhi-121.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200617151537.GB88066@vmlxhi-121.adit-jv.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

On 2020-06-17 17:15:37 +0200, Michael Rodin wrote:
> Hi Niklas and Steve,
> 
> On Wed, Jun 17, 2020 at 12:56:46PM +0200, Niklas Söderlund wrote:
> > Hi Michael and Steve,
> > 
> > On 2020-06-16 19:31:36 +0200, Michael Rodin wrote:
> > > From: Steve Longerbeam <steve_longerbeam@mentor.com>
> > > 
> > > The media_device is registered during driver probe, before async
> > > completion, so it is possible for .link_notify to be called before
> > > all devices are bound.
> > > 
> > > Fix this by moving media_device_register() to rvin_group_notify_complete().
> > > This ensures that all devices are now bound (the rcar-csi2 subdevices and
> > > and video capture devices) before .link_notify can be called.
> > 
> > I'm curious to what situation created the need for this change. I'm 
> > currently trying to take the VIN driver in the opposite direction [1] 
> > with the end goal of registering video devices at probe time and then 
> > allow the media graph to populate as devices becomes available.
> 
> It looks like almost all platform drivers call media_device_register() in
> the completion callback. From my understaning it is necessary to ensure
> that all subdevices are bound and all links are created before the user
> can enable any link (which would trigger link_notify callback execution)
> and set formats. If I am not mistaken, Steve could observe an "OOPS" or
> at least it is theoretically possible.

If an OOPS have been observed I would be interested to see it. That way 
we can fix the OOPS and keep the media graph registration where it is 
today.

> 
> Actually I found that this patch alone is not enough even if it is correct,
> because we also have to register the media device in rvin_parallel_notify_complete()
> in case if there is only a parallel video input device attached.
> 
> > My reason for this is that we could have a functional pipeline inside 
> > the graph even if it's not complete. This came out of the GMSL work done
> > a while pack where I had a faulty camera that would prevent the other 7 
> > in the system to function.
> 
> I agree that if a probe of a faulty subdevice fails, this should not affect
> functionality of the other attached subdevices. The "complete" callback of
> the async notifier is probably not executed in this case, so I guess, we
> would have to register the media device in the "bound" callback after the first
> subdevice has been probed? Otherwise there is not much sense to have video
> capture devices, which are not connected to any source.

Calling it in the bound callback is mostly the same as it is today, as 
link_notify could then be called when not all entities are in the graph.  
In fact even if we where tp move the media device registration to the t
complete callback we have this problem if any of the subdevices are 
unbound. Then we are back to the state with a registerd media device 
where not all entities are present.

I think the solution here is to address the issue (if any) in the 
link_notify callback when the graph is not fully populated.

> 
> (Delayed) population of the media graph after media device registration
> sounds also like a requirement for device tree overlay support, which would
> also be a nice feature.
> 
> > 1. [PATCH 0/5] media-device: Report if graph is complete
> > 
> > > 
> > > Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
> > > Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
> > > ---
> > >  drivers/media/platform/rcar-vin/rcar-core.c | 14 ++++++--------
> > >  1 file changed, 6 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> > > index 7440c89..e70f83b 100644
> > > --- a/drivers/media/platform/rcar-vin/rcar-core.c
> > > +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> > > @@ -253,7 +253,6 @@ static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin)
> > >  	struct media_device *mdev = &group->mdev;
> > >  	const struct of_device_id *match;
> > >  	struct device_node *np;
> > > -	int ret;
> > >  
> > >  	mutex_init(&group->lock);
> > >  
> > > @@ -266,7 +265,6 @@ static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin)
> > >  	vin_dbg(vin, "found %u enabled VIN's in DT", group->count);
> > >  
> > >  	mdev->dev = vin->dev;
> > > -	mdev->ops = &rvin_media_ops;
> > >  
> > >  	match = of_match_node(vin->dev->driver->of_match_table,
> > >  			      vin->dev->of_node);
> > > @@ -278,11 +276,7 @@ static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin)
> > >  
> > >  	media_device_init(mdev);
> > >  
> > > -	ret = media_device_register(&group->mdev);
> > > -	if (ret)
> > > -		rvin_group_cleanup(group);
> > > -
> > > -	return ret;
> > > +	return 0;
> > >  }
> > >  
> > >  static void rvin_group_release(struct kref *kref)
> > > @@ -688,6 +682,8 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
> > >  		return ret;
> > >  	}
> > >  
> > > +	vin->group->mdev.ops = &rvin_media_ops;
> > > +
> > >  	/* Register all video nodes for the group. */
> > >  	for (i = 0; i < RCAR_VIN_NUM; i++) {
> > >  		if (vin->group->vin[i] &&
> > > @@ -736,8 +732,10 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
> > >  		}
> > >  	}
> > >  	mutex_unlock(&vin->group->lock);
> > > +	if (ret)
> > > +		return ret;
> > >  
> > > -	return ret;
> > > +	return media_device_register(&vin->group->mdev);
> > >  }
> > >  
> > >  static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
> > > -- 
> > > 2.7.4
> > > 
> > 
> > -- 
> > Regards,
> > Niklas Söderlund
> 
> -- 
> Best Regards,
> Michael

-- 
Regards,
Niklas Söderlund
