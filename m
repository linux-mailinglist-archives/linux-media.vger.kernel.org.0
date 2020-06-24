Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45320207628
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 16:54:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404009AbgFXOyb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 10:54:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404000AbgFXOy2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 10:54:28 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D369FC061573
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2020 07:54:26 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id s1so2915968ljo.0
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2020 07:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=UvdVkukB4v6pJHs3wM26SQ3ySNLoRLpv1KxPyWDhY1Y=;
        b=AjjEgFuNdk7hTDHZipXvQ8Eo1tQO8RhNrOo8v6X65Pu8sRwX5GqMM81pSx/+CfotL1
         HLk+nz2FUJ5VswmAvKu2b0ydW+RRYdbtyg3zJOjEts+tieqhnAZ9WwYbnwrJR7P4+ngB
         oVU2jd7ZFt/WJ/t7fwGMYMKBxJ7vXoFIk15krrBIxWTqj8KgHRZU2kruldyfHBRZYNSh
         c63bc6tf0H/WrmojDDpIuLVt3xW9q27s2u/qdfuKIMhUJH4As7gaW/DZ4Pm/ciyqWmlS
         r8W0uPMO3GxxAL3aJA/wBzrFFjhTSNTBEBgicHvaWfjEil9sG6GrGGLoxcd1cDrE+T8t
         M/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=UvdVkukB4v6pJHs3wM26SQ3ySNLoRLpv1KxPyWDhY1Y=;
        b=aMjPgoFrzHHg6288o6hzVQdfpCsdnEqXj4t3/NonS3MNklxH20fzVqJggIGOCCJDaG
         zrKewlZOhDXv+rZpVf+8uQRSDOgPLctOItEXekB1C2K7QttmYlnty3RvS8jNeRIwj2rn
         5m7eiaNhEZ3JX5W5pLF7sQ9NOAeyWmfaxzoNz8wI/LHFE1++aBhCOGCInYHJR/VcQQm6
         Fl9TDKzjid5ba1TXxcIi7UIkoS0BbUq878FhmFLT8PnpIbrHq4cY/EK+EBkEMxmPGYb8
         ZtR9JjEDnSjrdqeJw3ejo5/JLIE9wlTqKEbfpPeCrW8YKysr5RLLwX05dxee+D5q6YRC
         TU2A==
X-Gm-Message-State: AOAM53109HpGn/ELmt0ZnK7H32koll7/KM1tCBNpqfDQROgG1tC5DyJv
        5IvF+f6CoZH0yvuPXUzdo0hdOg==
X-Google-Smtp-Source: ABdhPJxSdSFQ0XlSLVXpLeaY4R+JTYfToQsKL8BdtfwpzOdvtWfjZicEBNxu2lz4AUXjIaAFmCp3YQ==
X-Received: by 2002:a2e:3314:: with SMTP id d20mr14154391ljc.359.1593010465220;
        Wed, 24 Jun 2020 07:54:25 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id k22sm5232608lfg.69.2020.06.24.07.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 07:54:24 -0700 (PDT)
Date:   Wed, 24 Jun 2020 16:54:23 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Michael Rodin <mrodin@de.adit-jv.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, michael@rodin.online,
        efriedrich@de.adit-jv.com, erosca@de.adit-jv.com,
        Steve Longerbeam <steve_longerbeam@mentor.com>
Subject: Re: [PATCH] media: rcar-vin: Move media_device_register to async
 completion
Message-ID: <20200624145423.GA1595450@oden.dyn.berto.se>
References: <1592328696-84533-1-git-send-email-mrodin@de.adit-jv.com>
 <20200617105646.GB2850317@oden.dyn.berto.se>
 <20200617151537.GB88066@vmlxhi-121.adit-jv.com>
 <20200617152857.GA2936315@oden.dyn.berto.se>
 <427325ff-e21f-91fd-6236-6d1f6615ca41@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <427325ff-e21f-91fd-6236-6d1f6615ca41@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 2020-06-24 15:31:01 +0200, Hans Verkuil wrote:
> On 17/06/2020 17:28, Niklas Söderlund wrote:
> > Hi Michael,
> > 
> > On 2020-06-17 17:15:37 +0200, Michael Rodin wrote:
> >> Hi Niklas and Steve,
> >>
> >> On Wed, Jun 17, 2020 at 12:56:46PM +0200, Niklas Söderlund wrote:
> >>> Hi Michael and Steve,
> >>>
> >>> On 2020-06-16 19:31:36 +0200, Michael Rodin wrote:
> >>>> From: Steve Longerbeam <steve_longerbeam@mentor.com>
> >>>>
> >>>> The media_device is registered during driver probe, before async
> >>>> completion, so it is possible for .link_notify to be called before
> >>>> all devices are bound.
> >>>>
> >>>> Fix this by moving media_device_register() to rvin_group_notify_complete().
> >>>> This ensures that all devices are now bound (the rcar-csi2 subdevices and
> >>>> and video capture devices) before .link_notify can be called.
> >>>
> >>> I'm curious to what situation created the need for this change. I'm 
> >>> currently trying to take the VIN driver in the opposite direction [1] 
> >>> with the end goal of registering video devices at probe time and then 
> >>> allow the media graph to populate as devices becomes available.
> >>
> >> It looks like almost all platform drivers call media_device_register() in
> >> the completion callback. From my understaning it is necessary to ensure
> >> that all subdevices are bound and all links are created before the user
> >> can enable any link (which would trigger link_notify callback execution)
> >> and set formats. If I am not mistaken, Steve could observe an "OOPS" or
> >> at least it is theoretically possible.
> > 
> > If an OOPS have been observed I would be interested to see it. That way 
> > we can fix the OOPS and keep the media graph registration where it is 
> > today.
> > 
> >>
> >> Actually I found that this patch alone is not enough even if it is correct,
> >> because we also have to register the media device in rvin_parallel_notify_complete()
> >> in case if there is only a parallel video input device attached.
> >>
> >>> My reason for this is that we could have a functional pipeline inside 
> >>> the graph even if it's not complete. This came out of the GMSL work done
> >>> a while pack where I had a faulty camera that would prevent the other 7 
> >>> in the system to function.
> >>
> >> I agree that if a probe of a faulty subdevice fails, this should not affect
> >> functionality of the other attached subdevices. The "complete" callback of
> >> the async notifier is probably not executed in this case, so I guess, we
> >> would have to register the media device in the "bound" callback after the first
> >> subdevice has been probed? Otherwise there is not much sense to have video
> >> capture devices, which are not connected to any source.
> > 
> > Calling it in the bound callback is mostly the same as it is today, as 
> > link_notify could then be called when not all entities are in the graph.  
> > In fact even if we where tp move the media device registration to the t
> > complete callback we have this problem if any of the subdevices are 
> > unbound. Then we are back to the state with a registerd media device 
> > where not all entities are present.
> > 
> > I think the solution here is to address the issue (if any) in the 
> > link_notify callback when the graph is not fully populated.
> 
> As I have mentioned in other threads in this mailinglist (e.g.
> https://www.spinics.net/lists/linux-media/msg171067.html), this is part
> of a bigger problem: what to do if only part of a graph comes up, or
> a part disappears. Today this is not supported.
> 
> It is certainly desirable to support this, but I want to see an RFC first
> detailing the interaction with userspace. And remember that today the
> expectation of applications is that device nodes are only created if all
> components of the device probed successfully.
> 
> My preference is that rcar-vin is first changed to conform to current
> expectations (i.e. /dev/mediaX is only registered at async completion).

I do not object to first making rcar-vin behave in this way. However for 
that work to be truly useful it should also solve what happens with all 
video, subdevices and media devices in the scenario where one device of 
the graph is unbound after complete have been called and how they can 
reregisterd if the graph becomes complete again.

If I understand things correctly the idea is to register video and 
subdevices at the time complete is called. However I'm unsure what is 
suppose to happen when unbound is called, shall all video and subdevices 
of the graph then be unregistered? Currently this happens for video 
devices in rcar-vin but it has a huge drawback, if the device that was 
unbound is rebound and complete() is called a second time the kernel 
prints big warnings on newer kernels and crashes in older. This is due 
to the kref involved in the V4L2 core. Also I'm unaware of how one could 
unregister all subdevies if another subdev in the graph is removed.

Figuring this out would make me happy as it's been a pet problem of mine 
for many years. I also think making this work could help in the 
discussion on how we can build partial initialization on top.

> 
> After a proper discussion on how to handle partial initialization and
> after we have a good plan, then this can be implemented in rcar-vin.
> 
> Note that I really want to support partial initialization, but I want
> to see an RFC with a proper analysis and proposal first.
> 
> Regards,
> 
> 	Hans
> 
> > 
> >>
> >> (Delayed) population of the media graph after media device registration
> >> sounds also like a requirement for device tree overlay support, which would
> >> also be a nice feature.
> >>
> >>> 1. [PATCH 0/5] media-device: Report if graph is complete
> >>>
> >>>>
> >>>> Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
> >>>> Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
> >>>> ---
> >>>>  drivers/media/platform/rcar-vin/rcar-core.c | 14 ++++++--------
> >>>>  1 file changed, 6 insertions(+), 8 deletions(-)
> >>>>
> >>>> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> >>>> index 7440c89..e70f83b 100644
> >>>> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> >>>> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> >>>> @@ -253,7 +253,6 @@ static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin)
> >>>>  	struct media_device *mdev = &group->mdev;
> >>>>  	const struct of_device_id *match;
> >>>>  	struct device_node *np;
> >>>> -	int ret;
> >>>>  
> >>>>  	mutex_init(&group->lock);
> >>>>  
> >>>> @@ -266,7 +265,6 @@ static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin)
> >>>>  	vin_dbg(vin, "found %u enabled VIN's in DT", group->count);
> >>>>  
> >>>>  	mdev->dev = vin->dev;
> >>>> -	mdev->ops = &rvin_media_ops;
> >>>>  
> >>>>  	match = of_match_node(vin->dev->driver->of_match_table,
> >>>>  			      vin->dev->of_node);
> >>>> @@ -278,11 +276,7 @@ static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin)
> >>>>  
> >>>>  	media_device_init(mdev);
> >>>>  
> >>>> -	ret = media_device_register(&group->mdev);
> >>>> -	if (ret)
> >>>> -		rvin_group_cleanup(group);
> >>>> -
> >>>> -	return ret;
> >>>> +	return 0;
> >>>>  }
> >>>>  
> >>>>  static void rvin_group_release(struct kref *kref)
> >>>> @@ -688,6 +682,8 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
> >>>>  		return ret;
> >>>>  	}
> >>>>  
> >>>> +	vin->group->mdev.ops = &rvin_media_ops;
> >>>> +
> >>>>  	/* Register all video nodes for the group. */
> >>>>  	for (i = 0; i < RCAR_VIN_NUM; i++) {
> >>>>  		if (vin->group->vin[i] &&
> >>>> @@ -736,8 +732,10 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
> >>>>  		}
> >>>>  	}
> >>>>  	mutex_unlock(&vin->group->lock);
> >>>> +	if (ret)
> >>>> +		return ret;
> >>>>  
> >>>> -	return ret;
> >>>> +	return media_device_register(&vin->group->mdev);
> >>>>  }
> >>>>  
> >>>>  static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
> >>>> -- 
> >>>> 2.7.4
> >>>>
> >>>
> >>> -- 
> >>> Regards,
> >>> Niklas Söderlund
> >>
> >> -- 
> >> Best Regards,
> >> Michael
> > 
> 

-- 
Regards,
Niklas Söderlund
