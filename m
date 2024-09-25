Return-Path: <linux-media+bounces-18561-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7D19864E7
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 18:35:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1139828A5C2
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 16:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79E7A446DC;
	Wed, 25 Sep 2024 16:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="X5cnVuBS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6D817C6C;
	Wed, 25 Sep 2024 16:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727282135; cv=none; b=j+c/Cj8ryVUD1rj1WBirTkZWBW5Fsg2uZ21I5r9fF3FLuaW2HQehdvD/DwoUpmsF4HNc+LUf+kyhG6erEC38MVUncKy99Hd8u7S/x1lBI7g38T6pyK7gyOwARkezkvTRlZsDjZrjoMeUTe8OMhVNJtV9Lu+mIlNkhZqkPaPYiMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727282135; c=relaxed/simple;
	bh=Q3RmVPYQcPObVzEZVk3QQKOostuHpCfMfDvpmifNeTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tQ5YLvWzjdJARO8ffdGWZMIOw/M4buYf+pA4ElMn1jWFFRn3qX8Fmkg3CL4MNl7ry8JPQUIAqrWRrM11HtwOphnUOlrg4BpyKbK+qb5AV5YmwIZY/bgts0uuvunDi8Gd6F3FhIb3fw/t06vrCp2i6m2cwW/cg6sJFOq/q8eDZqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=X5cnVuBS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 601377E2;
	Wed, 25 Sep 2024 18:34:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727282044;
	bh=Q3RmVPYQcPObVzEZVk3QQKOostuHpCfMfDvpmifNeTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X5cnVuBSZbHeuYFTXlPOknQFrlZ3ClEJtM5Yd7Xxt9kTksBDJ5vzBkgx6N2LOCxop
	 nO86oCTwo83lG5MO18IyPN7KGo4xW1hRdAGQz/fGCKpGXCjeQ6u77rVRXYJcaER2E2
	 yYgRUvrafrkkjy5xNv0/51kQ+ehxujunu/nOr7yc=
Date: Wed, 25 Sep 2024 19:35:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH 1/4] media: v4l2-subdev: Add cleanup macros for active
 state
Message-ID: <20240925163530.GC27666@pendragon.ideasonboard.com>
References: <20240917-scoped-state-v1-0-b8ba3fbe5952@ideasonboard.com>
 <20240917-scoped-state-v1-1-b8ba3fbe5952@ideasonboard.com>
 <20240924171736.GE30551@pendragon.ideasonboard.com>
 <9d150a98-5147-459f-8277-79e108ff6b30@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9d150a98-5147-459f-8277-79e108ff6b30@ideasonboard.com>

Hi Tomi,

On Tue, Sep 24, 2024 at 08:53:38PM +0300, Tomi Valkeinen wrote:
> On 24/09/2024 20:17, Laurent Pinchart wrote:
> > On Tue, Sep 17, 2024 at 05:09:29PM +0300, Tomi Valkeinen wrote:
> >> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >>
> >> Add cleanup macros for active state. These can be used to call
> >> v4l2_subdev_lock_and_get_active_state() and manage the unlocking either
> >> in unscoped or scoped fashion:
> >>
> >> This locks the state, gets it to the 'state' variable, and unlocks when
> >> exiting the surrounding scope:
> >>
> >> CLASS(v4l2_subdev_lock_and_get_active_state, state)(subdev);
> >>
> >> This does the same, but inside the given scope:
> >>
> >> scoped_v4l2_subdev_lock_and_get_active_state(subdev) {
> >> }
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >> ---
> >>   include/media/v4l2-subdev.h | 10 ++++++++++
> >>   1 file changed, 10 insertions(+)
> >>
> >> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> >> index bd235d325ff9..699007cfffd7 100644
> >> --- a/include/media/v4l2-subdev.h
> >> +++ b/include/media/v4l2-subdev.h
> >> @@ -8,6 +8,7 @@
> >>   #ifndef _V4L2_SUBDEV_H
> >>   #define _V4L2_SUBDEV_H
> >>   
> >> +#include <linux/cleanup.h>
> >>   #include <linux/types.h>
> >>   #include <linux/v4l2-subdev.h>
> >>   #include <media/media-entity.h>
> >> @@ -1854,6 +1855,15 @@ v4l2_subdev_lock_and_get_active_state(struct v4l2_subdev *sd)
> >>   	return sd->active_state;
> >>   }
> >>   
> >> +DEFINE_CLASS(v4l2_subdev_lock_and_get_active_state, struct v4l2_subdev_state *,
> >> +	     v4l2_subdev_unlock_state(_T),
> >> +	     v4l2_subdev_lock_and_get_active_state(sd), struct v4l2_subdev *sd);
> >> +
> >> +#define scoped_v4l2_subdev_lock_and_get_active_state(sd)              \
> >> +	for (CLASS(v4l2_subdev_lock_and_get_active_state, state)(sd), \
> >> +	     *done = NULL;                                            \
> >> +	     !done; done = (void *)1)
> > 
> > That a very long name :-S Could this be done using the scoped_guard()
> > macro instead ? For instance, with spinlocks you can do
> > 
> > 	scoped_guard(spinlock_irqsave, &dev->lock) {
> > 		...
> > 	}
> > 
> > It would be nice to be able to write
> > 
> > 	scoped_guard(v4l2_subdev_state, sd) {
> 
> This can be done but then you need to pass the state to it, not sd. Or 
> perhaps it would be possible to implicitly turn the sd into active 
> state, but I don't like that at all...
> 
> Or maybe:
> 
> scoped_guard(v4l2_subdev_state, v4l2_subdev_get_unlocked_active_state(sd))
> 
> Not very short either...

That's not very nice. Are there other examples in the kernel of
scoped_*() macros magically creating variables that are then used within
the scope ? I have a feeling we shouldn't do it here.

> > 		...
> > 	}
> > 
> > This being said, we would then end up with the state variable being
> > named scope, which wouldn't be great.
> 
> No, it wouldn't.
> 
> > This is actually one of my issues with the above macros, and especially
> > scoped_v4l2_subdev_lock_and_get_active_state(). It creates a local state
> > variable in the scope, which makes the code less readable in my opinion.
> 
> It's trivial to add a variable name there, as mentioned in the intro letter.
> 
> You mentioned the const/non-const state issue in the other email. I 
> wonder if some macro-magic could be done for that... Or we can always 
> just add "scoped_v4l2_subdev_lock_and_get_active_state_const()"! =)

And that's supposed to be an improvement ? :D

> Also, it's not like we have to use these _everywhere_. So maybe if you 
> want a const state, don't use the scoped or the class.

Looking at the rest of your series there are very few instances of
scoped_v4l2_subdev_lock_and_get_active_state(), so I'm tempted to simply
leave it out. When one writes

	scoped_guard(spinlock_irqsave, &dev->lock) {
	}

It's clear that you're locking the lock for the scope using
spinlock_irqsave. The scoped guard performs a scoped action on an
existing object. The V4L2 subdev active state is different, I don't
think scoped_guard() gives the right semantics.

> > We could keep the class and drop
> > scoped_v4l2_subdev_lock_and_get_active_state(). I think I would like to
> > shorten the class name then.
> > 
> > Another option is to use DEFINE_FREE() and __free() instead.
> 
> That can be added too. I had them, but I didn't consider them as useful 
> when I already added the class and scoped.
> 
> I have to say I don't particularly like the look of either the scoped or 
> the class, or even the free. But they're so useful wrt. error handling 
> that I don't care if the syntax annoys me =).

CLASS() is a bit better once we'll get used to it, as the name of the
variable is explicit. It however doesn't solve the const issue.
Furthermore, its semantics is meant to represent creation of an object
with automatic destruction when it leaves the scope, while with the
subdev active state you're not creating an object. That's why I think
that an explicit variable with a __free() annotation may be the best
option for this.

> Also, I think in theory one should always just use the scoped macro, 
> never the class. But as the scoped one adds indentation, in some cases 
> using the class keeps the code formatting nicer.

-- 
Regards,

Laurent Pinchart

