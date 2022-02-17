Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F359C4B9995
	for <lists+linux-media@lfdr.de>; Thu, 17 Feb 2022 08:05:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234123AbiBQHFN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Feb 2022 02:05:13 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbiBQHFM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Feb 2022 02:05:12 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A4A419C3D
        for <linux-media@vger.kernel.org>; Wed, 16 Feb 2022 23:04:58 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77E5C25B;
        Thu, 17 Feb 2022 08:04:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645081496;
        bh=r9tpRoCDP+G7SA2huocAEnqPR2m3RJz4hstfhmtKw7g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vPmtZ/XNVwSoH6QrGmS/xwQMFdbUDRRlR+J9g29dlYzfWZR0Kxr03Q+Zpja8J8nSp
         thwJYKHzuZgn7vjKRSqQ7E4JTEa2Bdg8O6YqVx6FGBAnMj5BrB7JgdIUzgmNQxbGIN
         JwgR1DDbBilkcPZgdf8Kl1xg3WHTsyhJkELoTWxQ=
Date:   Thu, 17 Feb 2022 09:04:48 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v4 5/7] media: subdev: Add
 v4l2_subdev_lock_and_return_state()
Message-ID: <Yg3zkC02kiQkNl3W@pendragon.ideasonboard.com>
References: <20220216130049.508664-1-tomi.valkeinen@ideasonboard.com>
 <20220216130049.508664-6-tomi.valkeinen@ideasonboard.com>
 <Yg1u4zdEGtN7wydB@pendragon.ideasonboard.com>
 <5732ebe7-ab4d-4407-a8f8-600bdcff651c@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5732ebe7-ab4d-4407-a8f8-600bdcff651c@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_FILL_THIS_FORM_SHORT,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Thu, Feb 17, 2022 at 06:05:18AM +0200, Tomi Valkeinen wrote:
> On 16/02/2022 23:38, Laurent Pinchart wrote:
> > On Wed, Feb 16, 2022 at 03:00:47PM +0200, Tomi Valkeinen wrote:
> >> All suitable subdev ops are now passed either the TRY or the ACTIVE
> >> state by the v4l2 core. However, other subdev drivers can still call the
> >> ops passing NULL as the state, implying the active case.
> >>
> >> For all current upstream drivers this doesn't matter, as they do not
> >> expect to get a valid state for ACTIVE case. But future drivers which
> >> support multiplexed streaming and routing will depend on getting a state
> >> for both active and try cases.
> >>
> >> For new drivers we can mandate that the pipelines where the drivers are
> >> used need to pass the state properly, or preferably, not call such
> >> subdev ops at all.
> >>
> >> However, if an existing subdev driver is changed to support multiplexed
> >> streams, the driver has to consider cases where its ops will be called
> >> with NULL state. The problem can easily be solved by using the
> >> v4l2_subdev_lock_and_return_state() helper, introduced here.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >> ---
> >>   include/media/v4l2-subdev.h | 38 +++++++++++++++++++++++++++++++++++++
> >>   1 file changed, 38 insertions(+)
> >>
> >> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> >> index 8d089a2dbd32..84c02488d53f 100644
> >> --- a/include/media/v4l2-subdev.h
> >> +++ b/include/media/v4l2-subdev.h
> >> @@ -1278,6 +1278,44 @@ void v4l2_subdev_lock_state(struct v4l2_subdev_state *state);
> >>    */
> >>   void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state);
> >>   
> >> +/**
> >> + * v4l2_subdev_lock_and_return_state() - Gets locked try or active subdev state
> >> + * @sd: subdevice
> >> + * @state: subdevice state as passed to the subdev op
> >> + *
> >> + * Due to legacy reasons, when subdev drivers call ops in other subdevs they use
> >> + * NULL as the state parameter, as subdevs always used to have their active
> >> + * state stored privately.
> >> + *
> >> + * However, newer state-aware subdev drivers, which store their active state in
> >> + * a common place, subdev->active_state, expect to always get a proper state as
> >> + * a parameter.
> >> + *
> >> + * These state-aware drivers can use v4l2_subdev_lock_and_return_state() instead
> >> + * of v4l2_subdev_lock_state(). v4l2_subdev_lock_and_return_state() solves the
> >> + * issue by using subdev->active_state in case the passed state is NULL.
> >> + *
> >> + * This is a temporary helper function, and should be removed when we can ensure
> >> + * that all drivers pass proper state when calling other subdevs.
> >> + */
> >> +static inline struct v4l2_subdev_state *
> >> +v4l2_subdev_lock_and_return_state(struct v4l2_subdev *sd,
> >> +				  struct v4l2_subdev_state *state)
> >> +{
> >> +	if (state)
> >> +		return state;
> >> +
> >> +	dev_notice_once(sd->dev,
> >> +		"The provided state is NULL. Adjusting to the subdev active state.\n"
> >> +		"Please consider porting your driver to the new state management API.\n");
> >> +
> >> +	state = sd->active_state;
> >> +
> >> +	v4l2_subdev_lock_state(state);
> > 
> > This looks strange, if the state parameter is not NULL then you don't
> > lock the state, otherwise you do. How is the caller of this function
> > expected to unlock the state ? I'm tempted to drop this helper and push
> > harder for porting drivers to the new API.
> 
> Indeed, I didn't think it through. Handling this with the new locking 
> model is a bit more difficult. The driver could do something like this:
> 
> static int my_subdev_op(sd, _state)
> {
> 	state = _state ? _state : v4l2_subdev_lock_active_state();
> 
> 	...
> 
> 	if (!_state)
> 		v4l2_subdev_unlock_state(state);
> 
> 	return 0;
> }
> 
> But hiding that behind a helper is not so easy.
> 
> Perhaps it is better to drop this, and change the calling subdev drivers 
> to use the v4l2_subdev_call_state_active() helper.

I think that would be better, yes.

-- 
Regards,

Laurent Pinchart
