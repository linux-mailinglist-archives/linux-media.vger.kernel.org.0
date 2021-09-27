Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8083418D8D
	for <lists+linux-media@lfdr.de>; Mon, 27 Sep 2021 03:45:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232343AbhI0BrL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Sep 2021 21:47:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230174AbhI0BrI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Sep 2021 21:47:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6018C061570
        for <linux-media@vger.kernel.org>; Sun, 26 Sep 2021 18:45:30 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14F9649A;
        Mon, 27 Sep 2021 03:45:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632707129;
        bh=mhdLDSXJ+vY7VuZ+AX7OqP0Qubwrsg5u/S47g4lvi8U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jQrqOdUCYnidVsMilj1Fd1g1XdqG1YBh7mq1V6dux6ZYj0lsnPv3nyM8LplFuQthA
         BFaYAgb0HXqUPxMV3U90cWrA8Ftgogn+vz/G9hpxcXMy+E1cvinE6CO/Fl5LSpv/JK
         Ir/UPbKEcjso50xB4U5XdZeWILM8aNmHQjuRHTlE=
Date:   Mon, 27 Sep 2021 04:45:23 +0300
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
Message-ID: <YVEiM5MHXvWK9dr/@pendragon.ideasonboard.com>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
 <20210830110116.488338-7-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210830110116.488338-7-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, Aug 30, 2021 at 02:00:46PM +0300, Tomi Valkeinen wrote:
> All suitable subdev ops are now passed either the TRY or the ACTIVE
> state by the v4l2 core. However, other subdrivers can still call the ops
> passing NULL as the state, implying the active case.
> 
> Thus all subdev drivers supporting active state need to handle the NULL
> state case.

Do they ? Can't we mandate that the callers pass the correct state ? Do
you think that would make the transition too difficult ?

The way I understand the issue, this would only be needed to facilitate
the transition. Is there a reason why the drivers you've ported (CAL &
co.) use v4l2_subdev_validate_and_lock_state() after completing the
transition, or is the correct state always passed by the caller ?

> Additionally, the subdev drivers usually need to lock the
> state.
> 
> Add two helper functions to easen the transition to centrally managed
> ACTIVE state. v4l2_subdev_validate_state() ensures that the state is not
> NULL, and v4l2_subdev_validate_and_lock_state() does the same and
> additionally locks the state.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  include/media/v4l2-subdev.h | 41 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 52a725281b23..2290b5025fc0 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1307,4 +1307,45 @@ void v4l2_subdev_lock_state(struct v4l2_subdev_state *state);
>   */
>  void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state);
>  
> +/**
> + * v4l2_subdev_validate_state() - Gets the TRY or ACTIVE subdev state
> + * @sd: subdevice
> + * @state: subdevice state as passed to the subdev op
> + *
> + * Subdev ops used to be sometimes called with NULL as the state for ACTIVE
> + * case. Even if the v4l2 core now passes proper state for both TRY and
> + * ACTIVE cases, a subdev driver may call an op in another subdev driver,
> + * passing NULL.
> + *
> + * This function can be used as a helper to get the state also for the ACTIVE
> + * case. The subdev driver that supports ACTIVE state can use this function
> + * as the first thing in its ops, ensuring that the state variable contains
> + * either the TRY or ACTIVE state.
> + */
> +static inline struct v4l2_subdev_state *
> +v4l2_subdev_validate_state(struct v4l2_subdev *sd,
> +			   struct v4l2_subdev_state *state)
> +{
> +	return state ? state : sd->state;
> +}

This doesn't seem to be used by the drivers you've ported, or by the
R-Car and GMSL patches from Jacopo. Do we need this function ?

> +
> +/**
> + * v4l2_subdev_validate_and_lock_state() - Gets locked TRY or ACTIVE subdev state
> + * @sd: subdevice
> + * @state: subdevice state as passed to the subdev op
> + *
> + * This is a helper function which does the same as v4l2_subdev_validate_state
> + * () except that it also locks the state.
> + */
> +static inline struct v4l2_subdev_state *
> +v4l2_subdev_validate_and_lock_state(struct v4l2_subdev *sd,
> +				    struct v4l2_subdev_state *state)
> +{
> +	state = state ? state : sd->state;
> +
> +	v4l2_subdev_lock_state(state);
> +
> +	return state;
> +}
> +
>  #endif

-- 
Regards,

Laurent Pinchart
