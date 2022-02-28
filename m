Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 768AB4C65BB
	for <lists+linux-media@lfdr.de>; Mon, 28 Feb 2022 10:34:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234320AbiB1JdM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Feb 2022 04:33:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231855AbiB1JdK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Feb 2022 04:33:10 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1A0B5F8E
        for <linux-media@vger.kernel.org>; Mon, 28 Feb 2022 01:32:31 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CE178478;
        Mon, 28 Feb 2022 10:32:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646040749;
        bh=WvdrPg8ogCxoe4raLgUO+7yXQ0iApW32imrtBVoB5cE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nI6PDaHtoStc2NFR5J7EzA7rw/AywwPRd/j0pVM2AG3OI018Jb4hXiZZwiFB1hhwM
         bJ32YArHgBaQC505Prqhj2TMxgtdrklyGpmokFGwD0ADtPcHoHD4vpRM91Yhqa5USK
         WtqeLG4u00ZKd8uURPGv/723sv3OQDlsjlJ1HpxA=
Date:   Mon, 28 Feb 2022 11:32:17 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v4 6/7] media: subdev: add v4l2_subdev_call_state_active()
Message-ID: <YhyWoafRSK4Vtpwd@pendragon.ideasonboard.com>
References: <20220216130049.508664-1-tomi.valkeinen@ideasonboard.com>
 <20220216130049.508664-7-tomi.valkeinen@ideasonboard.com>
 <71751dde-a0f6-898e-a7d3-e509afb67fed@xs4all.nl>
 <fb84036b-fa25-48b8-e0f5-2d1296fbdb59@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fb84036b-fa25-48b8-e0f5-2d1296fbdb59@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 28, 2022 at 10:10:00AM +0100, Hans Verkuil wrote:
> On 2/28/22 09:59, Hans Verkuil wrote:
> > On 2/16/22 14:00, Tomi Valkeinen wrote:
> >> Add v4l2_subdev_call_state_active() macro to help calling subdev ops
> >> that take a subdev state as a parameter.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > 
> > Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> Hmm, after reading Laurent's comments I also think I was a bit too hasty.
> It should either be moved to a v4l2-subdev-legacy.h header (are there other
> legacy functions that could be moved there as well?)

I think so (I'll need to have a look though), and I expect there will be
more in the future in any case :-)

> or it should have 'legacy'
> or something like that in the name.
> 
> >> ---
> >>  include/media/v4l2-subdev.h | 31 +++++++++++++++++++++++++++++++
> >>  1 file changed, 31 insertions(+)
> >>
> >> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> >> index 84c02488d53f..0db61203c8d9 100644
> >> --- a/include/media/v4l2-subdev.h
> >> +++ b/include/media/v4l2-subdev.h
> >> @@ -1359,6 +1359,37 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
> >>  		__result;						\
> >>  	})
> >>  
> >> +/**
> >> + * v4l2_subdev_call_state_active - call an operation of a v4l2_subdev which
> >> + *				   takes state as a parameter, passing the
> >> + *				   subdev its active state.
> >> + *
> >> + * @sd: pointer to the &struct v4l2_subdev
> >> + * @o: name of the element at &struct v4l2_subdev_ops that contains @f.
> >> + *     Each element there groups a set of callbacks functions.
> >> + * @f: callback function to be called.
> >> + *     The callback functions are defined in groups, according to
> >> + *     each element at &struct v4l2_subdev_ops.
> >> + * @args: arguments for @f.
> >> + *
> >> + * This is similar to v4l2_subdev_call(), except that this version can only be
> >> + * used for ops that take a subdev state as a parameter. The macro will get the
> >> + * active state and lock it before calling the op, and unlock it after the
> >> + * call.
> >> + */
> >> +#define v4l2_subdev_call_state_active(sd, o, f, args...)		\
> >> +	({								\
> >> +		int __result;						\
> >> +		struct v4l2_subdev_state *state;			\
> >> +		state = v4l2_subdev_get_active_state(sd);		\
> >> +		if (state)						\
> >> +			v4l2_subdev_lock_state(state);			\
> >> +		__result = v4l2_subdev_call(sd, o, f, state, ##args);	\
> >> +		if (state)						\
> >> +			v4l2_subdev_unlock_state(state);		\
> >> +		__result;						\
> >> +	})
> >> +
> >>  /**
> >>   * v4l2_subdev_has_op - Checks if a subdev defines a certain operation.
> >>   *

-- 
Regards,

Laurent Pinchart
