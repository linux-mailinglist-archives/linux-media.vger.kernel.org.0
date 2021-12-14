Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1180473E51
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 09:39:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231873AbhLNIjA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Dec 2021 03:39:00 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:52869 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbhLNIjA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Dec 2021 03:39:00 -0500
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 1019F24000C;
        Tue, 14 Dec 2021 08:38:56 +0000 (UTC)
Date:   Tue, 14 Dec 2021 09:39:50 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v10 26/38] media: add V4L2_SUBDEV_CAP_MPLEXED
Message-ID: <20211214083950.yfp6ss6hdsjejtla@uno.localdomain>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
 <20211130141536.891878-27-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211130141536.891878-27-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Tue, Nov 30, 2021 at 04:15:24PM +0200, Tomi Valkeinen wrote:
> Add a subdev capability flag to expose to userspace if a subdev supports
> multiplexed streams.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 4 +++-
>  include/uapi/linux/v4l2-subdev.h      | 3 +++
>  2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 2053fe1cd67d..721148e35624 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -419,7 +419,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>
>  		memset(cap->reserved, 0, sizeof(cap->reserved));
>  		cap->version = LINUX_VERSION_CODE;
> -		cap->capabilities = ro_subdev ? V4L2_SUBDEV_CAP_RO_SUBDEV : 0;
> +		cap->capabilities =
> +			(ro_subdev ? V4L2_SUBDEV_CAP_RO_SUBDEV : 0) |
> +			((sd->flags & V4L2_SUBDEV_FL_MULTIPLEXED) ? V4L2_SUBDEV_CAP_MPLEXED : 0);

I had been suggested to go for:

	bool ro_subdev = test_bit(V4L2_FL_SUBDEV_RO_DEVNODE, &vdev->flags);

when introducing V4L2_SUBDEV_CAP_RO_SUBDEV.

To me it doesn't make much difference

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
   j

>
>  		return 0;
>  	}
> diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> index 658106f5b5dc..d91ab6f22fa7 100644
> --- a/include/uapi/linux/v4l2-subdev.h
> +++ b/include/uapi/linux/v4l2-subdev.h
> @@ -188,6 +188,9 @@ struct v4l2_subdev_capability {
>  /* The v4l2 sub-device video device node is registered in read-only mode. */
>  #define V4L2_SUBDEV_CAP_RO_SUBDEV		0x00000001
>
> +/* The v4l2 sub-device supports multiplexed streams. */
> +#define V4L2_SUBDEV_CAP_MPLEXED			0x00000002
> +
>  /* Backwards compatibility define --- to be removed */
>  #define v4l2_subdev_edid v4l2_edid
>
> --
> 2.25.1
>
