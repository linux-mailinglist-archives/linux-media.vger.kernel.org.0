Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6B73478A63
	for <lists+linux-media@lfdr.de>; Fri, 17 Dec 2021 12:48:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233606AbhLQLsz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Dec 2021 06:48:55 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:37181 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230396AbhLQLsz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Dec 2021 06:48:55 -0500
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 06F7220000A;
        Fri, 17 Dec 2021 11:48:50 +0000 (UTC)
Date:   Fri, 17 Dec 2021 12:49:43 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH 5/6] media: subdev: Add
 v4l2_subdev_lock_and_return_state()
Message-ID: <20211217114943.ti7m7nnavdkpwrun@uno.localdomain>
References: <20211217111836.225013-1-tomi.valkeinen@ideasonboard.com>
 <20211217111836.225013-6-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211217111836.225013-6-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Fri, Dec 17, 2021 at 01:18:35PM +0200, Tomi Valkeinen wrote:
> All suitable subdev ops are now passed either the TRY or the ACTIVE
> state by the v4l2 core. However, other subdev drivers can still call the
> ops passing NULL as the state, implying the active case.
>
> For all current upstream drivers this doesn't matter, as they do not
> expect to get a valid state for ACTIVE case. But future drivers which
> support multiplexed streaming and routing will depend on getting a state
> for both active and try cases.
>
> For new drivers we can mandate that the pipelines where the drivers are
> used need to pass the state properly, or preferably, not call such
> subdev ops at all.
>
> However, if an existing subdev driver is changed to support multiplexed
> streams, the driver has to consider cases where its ops will be called
> with NULL state. The problem can easily be solved by using the
> v4l2_subdev_lock_and_return_state() helper, introduced here.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  include/media/v4l2-subdev.h | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 80cd0ffb60d1..4bc3cc04cc6e 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -8,6 +8,7 @@
>  #ifndef _V4L2_SUBDEV_H
>  #define _V4L2_SUBDEV_H
>
> +#include "linux/dev_printk.h"
>  #include <linux/types.h>
>  #include <linux/v4l2-subdev.h>
>  #include <media/media-entity.h>
> @@ -1321,4 +1322,38 @@ void v4l2_subdev_lock_state(struct v4l2_subdev_state *state);
>   */
>  void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state);
>
> +/**
> + * v4l2_subdev_lock_and_return_state() - Gets locked try or active subdev state
> + * @sd: subdevice
> + * @state: subdevice state as passed to the subdev op
> + *
> + * Due to legacy reasons, when subdev drivers call ops in other subdevs they use
> + * NULL as the state parameter, as subdevs always used to have their active
> + * state stored privately.
> + *
> + * However, newer state-aware subdev drivers, which store their active state in
> + * a common place, subdev->active_state, expect to always get a proper state as
> + * a parameter.
> + *
> + * These state-aware drivers can use v4l2_subdev_lock_and_return_state() instead
> + * of v4l2_subdev_lock_state(). v4l2_subdev_lock_and_return_state() solves the
> + * issue by using subdev->state in case the passed state is NULL.
> + *
> + * This is a temporary helper function, and should be removed when we can ensure
> + * that all drivers pass proper state when calling other subdevs.
> + */
> +static inline struct v4l2_subdev_state *
> +v4l2_subdev_lock_and_return_state(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state)
> +{
> +	if (!state)
> +		dev_notice_once(sd->dev, "source subdev should be ported to new state management\n");

I agree the message is improvable.
Maybe

		dev_notice_once(sd->dev, "The provided state is NULL. Adjusting to the subdev active state.\n");
		dev_notice_once(sd->dev, "Please consid er porting your driver to the new state management API.\n);

I don't mind multiple messages, other might.

Anyway, as long as we warn, I'm fine with this helper!

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

> +
> +	state = state ? state : sd->active_state;
> +
> +	v4l2_subdev_lock_state(state);
> +
> +	return state;
> +}
> +
>  #endif
> --
> 2.25.1
>
