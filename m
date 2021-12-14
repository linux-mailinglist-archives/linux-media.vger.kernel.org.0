Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97C59473E53
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 09:40:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbhLNIkb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Dec 2021 03:40:31 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:40183 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbhLNIkb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Dec 2021 03:40:31 -0500
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id F36FA1C0003;
        Tue, 14 Dec 2021 08:40:26 +0000 (UTC)
Date:   Tue, 14 Dec 2021 09:41:20 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v10 25/38] media: add V4L2_SUBDEV_FL_MULTIPLEXED
Message-ID: <20211214084120.4sfzpwpw3pti5nwy@uno.localdomain>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
 <20211130141536.891878-26-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211130141536.891878-26-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Tue, Nov 30, 2021 at 04:15:23PM +0200, Tomi Valkeinen wrote:
> Add subdev flag V4L2_SUBDEV_FL_MULTIPLEXED. It is used to indicate that
> the subdev supports the new API with multiplexed streams (routing,
> stream configs).
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  include/media/v4l2-subdev.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index a82fc74f4646..45861bcdccf5 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -892,6 +892,17 @@ struct v4l2_subdev_internal_ops {
>   * should set this flag.
>   */
>  #define V4L2_SUBDEV_FL_HAS_EVENTS		(1U << 3)
> +/*
> + * Set this flag if this subdev supports multiplexed streams. This means
> + * that the driver supports routing and handles the stream parameter in its
> + * v4l2_subdev_pad_ops handlers. More specifically, this means:
> + *
> + * - Centrally managed active state is enabled
> + * - Legacy pad config is _not_ supported (state->pads)

Does this still apply after pad config has been replaced by try states ?

Otherwise
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
   j

> + * - Routing ioctls are available
> + * - Multiple streams per pad are supported
> + */
> +#define V4L2_SUBDEV_FL_MULTIPLEXED		(1U << 4)
>
>  struct regulator_bulk_data;
>
> --
> 2.25.1
>
