Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDB0141AA1C
	for <lists+linux-media@lfdr.de>; Tue, 28 Sep 2021 09:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239447AbhI1Hym (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Sep 2021 03:54:42 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:32898 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239287AbhI1Hym (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Sep 2021 03:54:42 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D91153F1;
        Tue, 28 Sep 2021 09:53:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632815582;
        bh=flHZNFpHfN+2jpIPfCCVbmKLFdZra/8AXhgQN9TUzBQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kXjp3w5FSVkBf6L3c6LNqyXnew1QO84pSZLDh8Hu35B+WdVVYM9fkk2CdEoJvzaB+
         6Jy7ZIMRUrx2yj4Xj6AmD5EzZARb0SMSG/JdOIZj7oavf4shuD2I0phmeZzLxzjAsl
         JIY7KyBWeeFqi1UI3i66xv2O+VD0SEllvnR2EUj4=
Date:   Tue, 28 Sep 2021 10:52:53 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [PATCH v8 06/36] media: subdev: Add
 v4l2_subdev_validate(_and_lock)_state()
Message-ID: <YVLJ1cWBhK8CRJoB@pendragon.ideasonboard.com>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
 <20210830110116.488338-7-tomi.valkeinen@ideasonboard.com>
 <YVEiM5MHXvWK9dr/@pendragon.ideasonboard.com>
 <fdb7faf3-337c-28aa-081d-75d317c418d5@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fdb7faf3-337c-28aa-081d-75d317c418d5@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Tue, Sep 28, 2021 at 08:02:18AM +0300, Tomi Valkeinen wrote:
> On 27/09/2021 04:45, Laurent Pinchart wrote:
> > On Mon, Aug 30, 2021 at 02:00:46PM +0300, Tomi Valkeinen wrote:
> >> All suitable subdev ops are now passed either the TRY or the ACTIVE
> >> state by the v4l2 core. However, other subdrivers can still call the ops
> >> passing NULL as the state, implying the active case.
> >>
> >> Thus all subdev drivers supporting active state need to handle the NULL
> >> state case.
> > 
> > Do they ? Can't we mandate that the callers pass the correct state ? Do
> > you think that would make the transition too difficult ?
> 
> That would limit the use of the new drivers. E.g. the sensor driver I'm 
> using works fine with CAL & co. without handling the NULL, but then the 
> sensor driver couldn't be used with "old" drivers.

I'm tempted to say that would be a good thing as it would accelerate the
transition :-)

> > The way I understand the issue, this would only be needed to facilitate
> > the transition. Is there a reason why the drivers you've ported (CAL &
> > co.) use v4l2_subdev_validate_and_lock_state() after completing the
> > transition, or is the correct state always passed by the caller ?
> 
> The drivers I'm using only call non-state-aware ops in the other 
> subdevs, so they should work fine without validate.
> 
> I think it's safer to just use the validate versions for now. They're 
> trivial to convert to non-validate versions later.
> 
> We could just do the validate implicitly while locking the state, but it 
> would make the code a bit odd:
> 
> state = v4l2_subdev_lock_state(state);
> 
> After the transition we want to do just:
> 
> v4l2_subdev_lock_state(state);
> 
> Or we could do v4l2_subdev_lock_state() with a macro, which changes the 
> state variable, but... I think I'd rather have it clear and obvious with 
> v4l2_subdev_validate_and_lock_state().
> 
> >> Additionally, the subdev drivers usually need to lock the
> >> state.
> >>
> >> Add two helper functions to easen the transition to centrally managed
> >> ACTIVE state. v4l2_subdev_validate_state() ensures that the state is not
> >> NULL, and v4l2_subdev_validate_and_lock_state() does the same and
> >> additionally locks the state.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >> ---
> >>   include/media/v4l2-subdev.h | 41 +++++++++++++++++++++++++++++++++++++
> >>   1 file changed, 41 insertions(+)
> >>
> >> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> >> index 52a725281b23..2290b5025fc0 100644
> >> --- a/include/media/v4l2-subdev.h
> >> +++ b/include/media/v4l2-subdev.h
> >> @@ -1307,4 +1307,45 @@ void v4l2_subdev_lock_state(struct v4l2_subdev_state *state);
> >>    */
> >>   void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state);
> >>   
> >> +/**
> >> + * v4l2_subdev_validate_state() - Gets the TRY or ACTIVE subdev state
> >> + * @sd: subdevice
> >> + * @state: subdevice state as passed to the subdev op
> >> + *
> >> + * Subdev ops used to be sometimes called with NULL as the state for ACTIVE
> >> + * case. Even if the v4l2 core now passes proper state for both TRY and
> >> + * ACTIVE cases, a subdev driver may call an op in another subdev driver,
> >> + * passing NULL.
> >> + *
> >> + * This function can be used as a helper to get the state also for the ACTIVE
> >> + * case. The subdev driver that supports ACTIVE state can use this function
> >> + * as the first thing in its ops, ensuring that the state variable contains
> >> + * either the TRY or ACTIVE state.
> >> + */
> >> +static inline struct v4l2_subdev_state *
> >> +v4l2_subdev_validate_state(struct v4l2_subdev *sd,
> >> +			   struct v4l2_subdev_state *state)
> >> +{
> >> +	return state ? state : sd->state;
> >> +}
> > 
> > This doesn't seem to be used by the drivers you've ported, or by the
> > R-Car and GMSL patches from Jacopo. Do we need this function ?
> 
> Probably not. If you need to validate, you most likely will lock the 
> state right afterwards, so v4l2_subdev_validate_and_lock_state should be 
> enough.

-- 
Regards,

Laurent Pinchart
