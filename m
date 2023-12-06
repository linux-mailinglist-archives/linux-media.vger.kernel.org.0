Return-Path: <linux-media+bounces-1717-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CB1806A3A
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 09:59:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99D581C209AE
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 08:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C62619BDD;
	Wed,  6 Dec 2023 08:58:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77F71A710;
	Wed,  6 Dec 2023 08:58:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1200C433C8;
	Wed,  6 Dec 2023 08:58:49 +0000 (UTC)
Message-ID: <9ff761e0-380e-4e4b-ad82-b945a8155cc2@xs4all.nl>
Date: Wed, 6 Dec 2023 09:58:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] media: v4l2-subdev: Add which field to struct
 v4l2_subdev_frame_interval
Content-Language: en-US, nl
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Akinobu Mita <akinobu.mita@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Scally
 <djrscally@gmail.com>, Hans de Goede <hansg@kernel.org>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Leon Luo <leonl@leopardimaging.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Paul Elder <paul.elder@ideasonboard.com>, Pavel Machek <pavel@ucw.cz>,
 Philipp Zabel <p.zabel@pengutronix.de>, Ricardo Ribalda
 <ribalda@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Steve Longerbeam <slongerbeam@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-tegra@vger.kernel.org
References: <20231205140810.22368-1-laurent.pinchart@ideasonboard.com>
 <20231205140810.22368-2-laurent.pinchart@ideasonboard.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231205140810.22368-2-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/12/2023 15:08, Laurent Pinchart wrote:
> Due to a historical mishap, the v4l2_subdev_frame_interval structure
> is the only part of the V4L2 subdev userspace API that doesn't contain a
> 'which' field. This prevents trying frame intervals using the subdev
> 'TRY' state mechanism.
> 
> Adding a 'which' field is simple as the structure has 8 reserved fields.
> This would however break userspace as the field is currently set to 0,
> corresponding to V4L2_SUBDEV_FORMAT_TRY, while the corresponding ioctls
> currently operate on the 'ACTIVE' state. We thus need to add a new
> subdev client cap, V4L2_SUBDEV_CLIENT_CAP_WHICH_INTERVAL, to indicate
> that userspace is aware of this new field.
> 
> All drivers that implement the subdev .get_frame_interval() and
> .set_frame_interval() operations are updated to return -EINVAL when
> operating on the TRY state, preserving the current behaviour.
> 
> While at it, fix a bad copy&paste in the documentation of the struct
> v4l2_subdev_frame_interval_enum 'which' field.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de> # for imx-media
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  .../media/v4l/vidioc-subdev-g-client-cap.rst  |  5 ++++
>  .../v4l/vidioc-subdev-g-frame-interval.rst    | 17 ++++++++-----
>  drivers/media/i2c/adv7180.c                   |  3 +++
>  drivers/media/i2c/et8ek8/et8ek8_driver.c      |  6 +++++
>  drivers/media/i2c/imx214.c                    |  3 +++
>  drivers/media/i2c/imx274.c                    |  6 +++++
>  drivers/media/i2c/max9286.c                   |  6 +++++
>  drivers/media/i2c/mt9m111.c                   |  6 +++++
>  drivers/media/i2c/mt9m114.c                   |  6 +++++
>  drivers/media/i2c/mt9v011.c                   |  6 +++++
>  drivers/media/i2c/mt9v111.c                   |  6 +++++
>  drivers/media/i2c/ov2680.c                    |  3 +++
>  drivers/media/i2c/ov5640.c                    |  6 +++++
>  drivers/media/i2c/ov5648.c                    |  3 +++
>  drivers/media/i2c/ov5693.c                    |  3 +++
>  drivers/media/i2c/ov6650.c                    |  6 +++++
>  drivers/media/i2c/ov7251.c                    |  6 +++++
>  drivers/media/i2c/ov7670.c                    |  4 +++
>  drivers/media/i2c/ov772x.c                    |  6 +++++
>  drivers/media/i2c/ov8865.c                    |  3 +++
>  drivers/media/i2c/ov9650.c                    |  6 +++++
>  drivers/media/i2c/s5c73m3/s5c73m3-core.c      |  6 +++++
>  drivers/media/i2c/s5k5baf.c                   |  6 +++++
>  drivers/media/i2c/tvp514x.c                   |  4 +++
>  drivers/media/v4l2-core/v4l2-subdev.c         | 25 ++++++++++++-------
>  .../media/atomisp/i2c/atomisp-gc0310.c        |  3 +++
>  .../media/atomisp/i2c/atomisp-gc2235.c        |  3 +++
>  .../media/atomisp/i2c/atomisp-mt9m114.c       |  3 +++
>  .../media/atomisp/i2c/atomisp-ov2722.c        |  3 +++
>  drivers/staging/media/imx/imx-ic-prp.c        |  6 +++++
>  drivers/staging/media/imx/imx-ic-prpencvf.c   |  6 +++++
>  drivers/staging/media/imx/imx-media-csi.c     |  6 +++++
>  drivers/staging/media/imx/imx-media-vdic.c    |  6 +++++
>  drivers/staging/media/tegra-video/csi.c       |  3 +++
>  include/uapi/linux/v4l2-subdev.h              | 13 ++++++++--
>  35 files changed, 192 insertions(+), 17 deletions(-)
> 

<snip>

> diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> index f0fbb4a7c150..cc2717f734e7 100644
> --- a/include/uapi/linux/v4l2-subdev.h
> +++ b/include/uapi/linux/v4l2-subdev.h
> @@ -116,13 +116,15 @@ struct v4l2_subdev_frame_size_enum {
>   * @pad: pad number, as reported by the media API
>   * @interval: frame interval in seconds
>   * @stream: stream number, defined in subdev routing
> + * @which: interval type (from enum v4l2_subdev_format_whence)
>   * @reserved: drivers and applications must zero this array
>   */
>  struct v4l2_subdev_frame_interval {
>  	__u32 pad;
>  	struct v4l2_fract interval;
>  	__u32 stream;
> -	__u32 reserved[8];
> +	__u32 which;
> +	__u32 reserved[7];
>  };
>  
>  /**
> @@ -133,7 +135,7 @@ struct v4l2_subdev_frame_interval {
>   * @width: frame width in pixels
>   * @height: frame height in pixels
>   * @interval: frame interval in seconds
> - * @which: format type (from enum v4l2_subdev_format_whence)
> + * @which: interval type (from enum v4l2_subdev_format_whence)
>   * @stream: stream number, defined in subdev routing
>   * @reserved: drivers and applications must zero this array
>   */
> @@ -241,6 +243,13 @@ struct v4l2_subdev_routing {
>   */
>  #define V4L2_SUBDEV_CLIENT_CAP_STREAMS		(1ULL << 0)
>  
> +/*
> + * The client is aware of the struct v4l2_subdev_frame_interval which field. If
> + * this is not set (which is the default), the which field is forced to
> + * V4L2_SUBDEV_FORMAT_ACTIVE by the kernel.
> + */
> +#define V4L2_SUBDEV_CLIENT_CAP_WHICH_INTERVAL	(1U << 1)

1U -> 1ULL

I also think that the define should be renamed to _CAP_INTERVAL_WHICH.
I keep reading "WHICH_INTERVAL" as "Which interval?" :-)

Also, you generally first put the structure before the field name,
so INTERVAL_WHICH feels much more logical to me.

Or possibly: INTERVAL_USES_WHICH, which is even more descriptive.

Regards,

	Hans

> +
>  /**
>   * struct v4l2_subdev_client_capability - Capabilities of the client accessing
>   *					  the subdev


