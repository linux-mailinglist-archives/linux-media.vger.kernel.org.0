Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F00144191AE
	for <lists+linux-media@lfdr.de>; Mon, 27 Sep 2021 11:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233700AbhI0JlD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Sep 2021 05:41:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233685AbhI0JlC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Sep 2021 05:41:02 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41AD7C061575
        for <linux-media@vger.kernel.org>; Mon, 27 Sep 2021 02:39:25 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A783BB91;
        Mon, 27 Sep 2021 11:39:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632735563;
        bh=IuOqba0jpNco9Zr12LqgXu+7CfWTlHzBm8UWndypjqs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M0/NJjeFNokYSTFfUbhit2ATswv6DkVN+MQ1aTK3wqTgOxdJ4/fD2T5ASTtNiNhA4
         t1bvbvXPS3t5CMlATvP6xB+I2u80MXP1ag8Dx0uTszPejSOQh6niaSWPlUM4Qa9I/e
         gXX7P/ipmSzTgE3+DxzSFdyCJiMRdjiiGC0NxVVM=
Date:   Mon, 27 Sep 2021 12:39:17 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [PATCH v8 02/36] media: subdev: add active state to struct
 v4l2_subdev
Message-ID: <YVGRRfea+YaijluM@pendragon.ideasonboard.com>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
 <20210830110116.488338-3-tomi.valkeinen@ideasonboard.com>
 <20210915094403.cazj7bjampnes4ba@uno.localdomain>
 <8e322af6-c010-f906-f733-6d3f770a48fc@ideasonboard.com>
 <f0f4bc4b-7594-28ab-8e8a-2819ce82df47@ideasonboard.com>
 <20210916080802.rznseum57gniplqp@uno.localdomain>
 <627ede43-090f-7440-57ed-fde9bc55fa5d@ideasonboard.com>
 <YVEJJWLv9fyG1Tw7@pendragon.ideasonboard.com>
 <8b8d3bc4-80a0-e901-e417-20e0c8b7a4c6@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b8d3bc4-80a0-e901-e417-20e0c8b7a4c6@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Mon, Sep 27, 2021 at 10:05:12AM +0300, Tomi Valkeinen wrote:
> On 27/09/2021 02:58, Laurent Pinchart wrote:
> > On Thu, Sep 16, 2021 at 12:36:33PM +0300, Tomi Valkeinen wrote:
> >> On 16/09/2021 11:08, Jacopo Mondi wrote:
> >>> On Thu, Sep 16, 2021 at 09:52:42AM +0300, Tomi Valkeinen wrote:
> >>>> On 16/09/2021 09:17, Tomi Valkeinen wrote:
> >>>>> On 15/09/2021 12:44, Jacopo Mondi wrote:
> >>>>>> On Mon, Aug 30, 2021 at 02:00:42PM +0300, Tomi Valkeinen wrote:
> >>>>>>> Add a new 'state' field to struct v4l2_subdev to which we can store the
> >>>>>>> active state of a subdev. This will place the subdev configuration into
> >>>>>>> a known place, allowing us to use the state directly from the v4l2
> >>>>>>> framework, thus simplifying the drivers.
> >>>>>>>
> >>>>>>> We also add v4l2_subdev_alloc_state() and v4l2_subdev_free_state(),
> >>>>>>> which need to be used by the drivers that support subdev state in struct
> >>>>>>> v4l2_subdev.
> >>>>>>>
> >>>>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >>>>>>> ---
> >>>>>>>     drivers/media/v4l2-core/v4l2-subdev.c | 21 ++++++++++++++++
> >>>>>>>     include/media/v4l2-subdev.h           | 36 +++++++++++++++++++++++++++
> >>>>>>>     2 files changed, 57 insertions(+)
> >>>>>>>
> >>>>>>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c
> >>>>>>> b/drivers/media/v4l2-core/v4l2-subdev.c
> >>>>>>> index 26a34a8e3d37..e1a794f69815 100644
> >>>>>>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> >>>>>>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> >>>>>>> @@ -943,3 +943,24 @@ void v4l2_subdev_notify_event(struct
> >>>>>>> v4l2_subdev *sd,
> >>>>>>>         v4l2_subdev_notify(sd, V4L2_DEVICE_NOTIFY_EVENT, (void *)ev);
> >>>>>>>     }
> >>>>>>>     EXPORT_SYMBOL_GPL(v4l2_subdev_notify_event);
> >>>>>>> +
> >>>>>>> +int v4l2_subdev_alloc_state(struct v4l2_subdev *sd)
> >>>>>>> +{
> >>>>>>> +    struct v4l2_subdev_state *state;
> >>>>>>> +
> >>>>>>> +    state = v4l2_alloc_subdev_state(sd);
> >>>>
> >>>> Replying to this again, as the second email didn't actually cover all the
> >>>> topics...
> >>>>
> >>>>>> So, I think this is one source of confusion about init_cfg.
> >>>>>>
> >>>>>> v4l2_alloc_subdev_state() calls init_cfg() and 'state-aware' driver
> >>>>>> are now supposed to allocate their state by calling
> >>>>>> v4l2_subdev_alloc_state(), in the same way as the core does for the
> >>>>>> file-handle ones.
> >>>>>>
> >>>>>> This will lead to init_cfg to be called for the 'active' (ie owned by
> >>>>>> the subdev) state, and then you need to add context to the state (by
> >>>>>> adding a 'which' field) to know what state you're dealing with.
> >>>>>>
> >>>>>> According to the init_cfg() documentation
> >>>>>>
> >>>>>>     * @init_cfg: initialize the pad config to default values
> >>>>>>
> >>>>>> the op has to be called in order to initialize the per-file-handle
> >>>>>> context, not the active one.
> >>>>>
> >>>>> I have missed updating the documentation there =).
> >>>>
> >>>> The documentation above doesn't imply per-file-handle context or TRY case,
> >>>> afaics. It just says "initialize state to default". Unless "pad config"
> >>>> always means TRY, which I think it doesn't as the drivers have internally
> >>>> been using pad configs.
> >>>
> >>> If they do, they would have the 'active' pad_configs  allocated or
> >>> embedded somewhere in their driver structures, they would not receive
> >>> it as parameter. Or have I missed where the core is capable of fishing
> >>> the 'right' pad_configs ? I think the same should happen for state.
> >>
> >> Yes, that is correct. I was just saying that the documentation doesn't
> >> say that init_cfg is only used for the TRY case, even if that has been
> >> the case in practice.
> >>
> >>>> But it's true that so far init_cfg has only been called for TRY case, and
> >>>> perhaps that's enough of a reason to keep it so.
> >>>>
> >>>>>> I would rather just embed 'struct v4l2_subdev_state' in 'struct
> >>>>>> v4l2_subdev', have the core going through the
> >>>>>
> >>>>> Why would embedding the state change anything?
> >>>>>
> >>>>>> 'v4l2_subdev_alloc_state()' to initialize the per-fh state, but have
> >>>>>> drivers initialize their own state at probe time. If they need for
> >>>>>> some reason to access their 'active' state at init_cfg() time, they
> >>>>>> caan fish it from their subdev.
> >>>>>>
> >>>>>> If I'm not mistaken this will remove the need to have a which filed in
> >>>>>> the state, as I think the 'context' should be inferred from the
> >>>>>> 'which' argument embedded in the ops-specific structures, and not held
> >>>>>> in the state itself.
> >>>>
> >>>> It's true that the state's which field is mainly (probably only) needed for
> >>>> handling the init_cfg. It could be solved in other ways too:
> >>>>
> >>>> - New subdev op to initialize active state
> >>>> - New subdev op which gets 'which' as a parameter, to initialize both states
> >>>> (state-aware drivers wouldn't need to implement the old init_cfg)
> >>>> - Coccinelle to change init_cfg to get the which as a parameter
> >>>>
> >>>> Without doing any deep thinking, the middle one sounds best to me.
> >>>
> >>> Isn't it simpler if you just don't call init_cfg for the 'active'
> >>> state ? Driver will initialize them at probe time and that's it, then
> >>> you can remove 'which' from the state (and from routing tables too if I'm
> >>> not mistaken).
> >>
> >> Routing needs the 'which' similarly to other config structs, like
> >> v4l2_subdev_format.
> >>
> >> I did a quick implementation for the second case, which allows me to
> >> remove 'which' from the state.
> >>
> >> As for "simpler"... Both ways have pros and cons. I'm my mind this new
> >> way is simpler.
> >>
> >> Afaics, in the end (i.e. after doing the v4l2_subdev_call change), the
> >> only bigger difference is how the state-aware drivers implement their
> >> ops. With my approach, they get the correct state and that's it. With
> >> your approach, they need to use a helper function (or do it manually) to
> >> get the state based on 'which'.
> > 
> > I'd like to propose a third approach (or at least I believe it's a third
> > one). I agree with Jacopo that the state structure should not have a
> > which field, that's a layering violation. The state is a state,
> > regardless of whether it holds TRY or ACTIVE data. What are the current
> > blockers that would prevent that ?
> 
> Oh, I agree with that too. I didn't add the 'which' field to state 
> because I thought it's good =). It is supposed to be temporary solution. 
> init_cfg() is the issue here.
> 
> It think I had these options:
> 
> - Change init_cfg() to take 'which' as a parameter
> - Change init_cfg() implementations to not use 'which'
> - Add new version for new drivers, init_cfg_state() or such, which 
> either gets the which as a parameter or doesn't use which.
> - Add 'which' to state.
> 
> I chose the fourth one as it's a very small change, and can be removed 
> easily in the future when the underlying problem is solved.
> 
> > However, I think .init_cfg() should be used to initialize *all* states,
> > both TRY and ACTIVE. That will simplify driver implementation (but
> > centralizing the initialization in a single place) and ensure that the
> > default value for the ACTIVE state always matches the default value for
> > the TRY state, which I think is important.
> 
> I agree.

That's the second option from you list above, right ?

As ACTIVE state support is opt-in, it seems to me that we won't need to
mass-fix drivers as part of this series if we go for this option. Am I
missing something ?

> > When it comes to calling v4l2_subdev_alloc_state() in drivers, I also
> > agree with Jacopo, I'm not extremely fond of it. This should be
> > automatic, drivers shouldn't have to care about allocating the ACTIVE
> > state. However, I also agree with Tomi that there's no real place to do
> > this today. I think we need to restructure subdev initialization, which
> > currently has very few rules. This could take the form, for instance, of
> 
> I agree with your agreeings above too.
> 
> > 1. calling v4l2_subdev_init() as an early subdev init function
> > 2. setting fields of v4l2_subdev manually
> > 3. initializing the media_entity embedded in the subdev
> > 4. calling a new "initialization finalization" function that will
> >     initialize the state embedded in v4l2_subdev (as opposed to
> >     allocating it dynamically as done today)
> 
> Why is the allocated/embedded relevant? The drivers won't know which one 
> is used.

Embedding will lower the number of allocations. On the other hand, as
replied to another patch in this series, allocating the state
dynamically may be better short term, so I'm OK with that.

> > That's the simplest option as it really ressembles what we do today, and
> > would more or less only require embedded the state in v4l2_subdev and
> > renaming v4l2_subdev_alloc_state() to v4l2_subdev_init_done() (or
> > similar, that's likely not a great name).
> 
> Yes. But I don't see embedding relevant. So we could just rename 
> v4l2_subdev_alloc_state() and we should be there.
> 
> > A more intrusive change would restructure the subdev initialization
> > further, by handling the media_entity initialization transparently
> > (which would require passing more arguments to v4l2_subdev_init(),
> > probably creating a new version of that function). That's more complex
> > and I think it's out of scope for this series, but it may still be
> > useful to keep the long term goal in mind to try and align with the
> > direction.
> 
> Yes, there are many things that can be improved further. But in the 
> context of this series, I'd like to keep the improvements such that they 
> require no changes to the existing drivers.

I'd propose minmizing the need of such changes, but not ruling them out
completely in case the gain is worth the pain. Of course it largely
depends who gets the gain and who's inflicted the pain ;-)

-- 
Regards,

Laurent Pinchart
