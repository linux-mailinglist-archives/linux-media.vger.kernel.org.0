Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62D8E477381
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 14:47:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234678AbhLPNr4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 08:47:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234657AbhLPNr4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 08:47:56 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1E1FC06173F
        for <linux-media@vger.kernel.org>; Thu, 16 Dec 2021 05:47:55 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9BF63F6;
        Thu, 16 Dec 2021 14:47:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639662473;
        bh=TRUnIy1V8Hb6wqRU5b/YXb93HhVE/WfuueJs7jM+JBk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ffzmvHlDJL8qK26L8s9YlNnEAN6aiKxisUZqzHe87A3uqdvhBCfzCABcDCQUiMJCT
         xDB3m15s19xru0HfldJd3CG1uqQtr+gxhsDD8PxItbHFDO4odVHeebjWneZ3NTBl0q
         KYq+bp4Gk6mL6bxEwrnlu1PxOv29iyw3DF+EzxGc=
Date:   Thu, 16 Dec 2021 15:47:50 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v10 03/38] media: subdev: pass also the active state to
 subdevs from ioctls
Message-ID: <YbtDhrPV7PXxLC3n@pendragon.ideasonboard.com>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
 <20211130141536.891878-4-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211130141536.891878-4-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Tue, Nov 30, 2021 at 04:15:01PM +0200, Tomi Valkeinen wrote:
> At the moment when a subdev op is called, the TRY subdev state
> (subdev_fh->state) is passed as a parameter even for the ACTIVE case, or
> alternatively a NULL can be passed for ACTIVE case. This used to make
> sense, as the ACTIVE state was handled internally by the subdev drivers.
> 
> We now have a state for the ACTIVE case in a standard place, and can
> pass that also to the drivers. This patch changes the subdev ioctls to
> either pass the TRY or ACTIVE state to the subdev.
> 
> Unfortunately many drivers call ops from other subdevs, and implicitly
> pass NULL as the state, so this is just a partial solution. A coccinelle
> spatch could perhaps be created which fixes the drivers' subdev calls.
> 
> For all current upstream drivers this doesn't matter, as they do not
> expect to get a valid state for ACTIVE case. But future drivers which
> support multiplexed streaming and routing will depend on getting a state
> for both active and try cases.
> 
> For new drivers we can mandate that the pipelines where the drivers are
> used need to pass the state properly, or preferably, not call such
> subdev ops at all.

I'm not sure we can really get rid of all those calls, but I believe we
could at least provide wrapper functions that should be used instead,
and that will handle state management.

> However, if an existing subdev driver is changed to support multiplexed
> streams, the driver has to consider cases where its ops will be called
> with NULL state. The problem can easily be solved by using the
> v4l2_subdev_validate_and_lock_state() helper, introduced in a follow up
> patch.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 73 +++++++++++++++++++++++----
>  1 file changed, 63 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index de160140d63b..3289875d9ec1 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -353,6 +353,53 @@ const struct v4l2_subdev_ops v4l2_subdev_call_wrappers = {
>  EXPORT_SYMBOL(v4l2_subdev_call_wrappers);
>  
>  #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> +
> +static struct v4l2_subdev_state *
> +subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
> +		       unsigned int cmd, void *arg)
> +{
> +	u32 which;
> +
> +	switch (cmd) {
> +	default:
> +		return NULL;
> +
> +	case VIDIOC_SUBDEV_G_FMT:
> +	case VIDIOC_SUBDEV_S_FMT: {
> +		which = ((struct v4l2_subdev_format *)arg)->which;
> +		break;
> +	}
> +	case VIDIOC_SUBDEV_G_CROP:
> +	case VIDIOC_SUBDEV_S_CROP: {
> +		which = ((struct v4l2_subdev_crop *)arg)->which;
> +		break;
> +	}
> +	case VIDIOC_SUBDEV_ENUM_MBUS_CODE: {
> +		which = ((struct v4l2_subdev_mbus_code_enum *)arg)->which;
> +		break;
> +	}
> +	case VIDIOC_SUBDEV_ENUM_FRAME_SIZE: {
> +		which = ((struct v4l2_subdev_frame_size_enum *)arg)->which;
> +		break;
> +	}
> +
> +	case VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL: {
> +		which = ((struct v4l2_subdev_frame_interval_enum *)arg)->which;
> +		break;
> +	}
> +
> +	case VIDIOC_SUBDEV_G_SELECTION:
> +	case VIDIOC_SUBDEV_S_SELECTION: {
> +		which = ((struct v4l2_subdev_selection *)arg)->which;
> +		break;
> +	}
> +	}
> +
> +	return which == V4L2_SUBDEV_FORMAT_TRY ?
> +			     subdev_fh->state :
> +			     v4l2_subdev_get_active_state(sd);
> +}
> +
>  static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  {
>  	struct video_device *vdev = video_devdata(file);
> @@ -360,8 +407,11 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  	struct v4l2_fh *vfh = file->private_data;
>  	struct v4l2_subdev_fh *subdev_fh = to_v4l2_subdev_fh(vfh);
>  	bool ro_subdev = test_bit(V4L2_FL_SUBDEV_RO_DEVNODE, &vdev->flags);
> +	struct v4l2_subdev_state *state;
>  	int rval;
>  
> +	state = subdev_ioctl_get_state(sd, subdev_fh, cmd, arg);
> +
>  	switch (cmd) {
>  	case VIDIOC_SUBDEV_QUERYCAP: {
>  		struct v4l2_subdev_capability *cap = arg;
> @@ -484,7 +534,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  
>  		memset(format->reserved, 0, sizeof(format->reserved));
>  		memset(format->format.reserved, 0, sizeof(format->format.reserved));
> -		return v4l2_subdev_call(sd, pad, get_fmt, subdev_fh->state, format);
> +		return v4l2_subdev_call(sd, pad, get_fmt, state, format);
>  	}
>  
>  	case VIDIOC_SUBDEV_S_FMT: {
> @@ -495,7 +545,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  
>  		memset(format->reserved, 0, sizeof(format->reserved));
>  		memset(format->format.reserved, 0, sizeof(format->format.reserved));
> -		return v4l2_subdev_call(sd, pad, set_fmt, subdev_fh->state, format);
> +		return v4l2_subdev_call(sd, pad, set_fmt, state, format);
>  	}
>  
>  	case VIDIOC_SUBDEV_G_CROP: {
> @@ -509,7 +559,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  		sel.target = V4L2_SEL_TGT_CROP;
>  
>  		rval = v4l2_subdev_call(
> -			sd, pad, get_selection, subdev_fh->state, &sel);
> +			sd, pad, get_selection, state, &sel);
>  
>  		crop->rect = sel.r;
>  
> @@ -531,7 +581,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  		sel.r = crop->rect;
>  
>  		rval = v4l2_subdev_call(
> -			sd, pad, set_selection, subdev_fh->state, &sel);
> +			sd, pad, set_selection, state, &sel);
>  
>  		crop->rect = sel.r;
>  
> @@ -542,7 +592,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  		struct v4l2_subdev_mbus_code_enum *code = arg;
>  
>  		memset(code->reserved, 0, sizeof(code->reserved));
> -		return v4l2_subdev_call(sd, pad, enum_mbus_code, subdev_fh->state,
> +		return v4l2_subdev_call(sd, pad, enum_mbus_code, state,
>  					code);
>  	}
>  
> @@ -550,7 +600,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  		struct v4l2_subdev_frame_size_enum *fse = arg;
>  
>  		memset(fse->reserved, 0, sizeof(fse->reserved));
> -		return v4l2_subdev_call(sd, pad, enum_frame_size, subdev_fh->state,
> +		return v4l2_subdev_call(sd, pad, enum_frame_size, state,
>  					fse);
>  	}
>  
> @@ -575,7 +625,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  		struct v4l2_subdev_frame_interval_enum *fie = arg;
>  
>  		memset(fie->reserved, 0, sizeof(fie->reserved));
> -		return v4l2_subdev_call(sd, pad, enum_frame_interval, subdev_fh->state,
> +		return v4l2_subdev_call(sd, pad, enum_frame_interval, state,
>  					fie);
>  	}
>  
> @@ -584,7 +634,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  
>  		memset(sel->reserved, 0, sizeof(sel->reserved));
>  		return v4l2_subdev_call(
> -			sd, pad, get_selection, subdev_fh->state, sel);
> +			sd, pad, get_selection, state, sel);
>  	}
>  
>  	case VIDIOC_SUBDEV_S_SELECTION: {
> @@ -595,7 +645,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  
>  		memset(sel->reserved, 0, sizeof(sel->reserved));
>  		return v4l2_subdev_call(
> -			sd, pad, set_selection, subdev_fh->state, sel);
> +			sd, pad, set_selection, state, sel);
>  	}
>  
>  	case VIDIOC_G_EDID: {
> @@ -829,10 +879,13 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad,
>  	if (is_media_entity_v4l2_subdev(pad->entity)) {
>  		struct v4l2_subdev *sd =
>  			media_entity_to_v4l2_subdev(pad->entity);
> +		struct v4l2_subdev_state *state;
> +
> +		state = v4l2_subdev_get_active_state(sd);
>  
>  		fmt->which = V4L2_SUBDEV_FORMAT_ACTIVE;
>  		fmt->pad = pad->index;
> -		return v4l2_subdev_call(sd, pad, get_fmt, NULL, fmt);
> +		return v4l2_subdev_call(sd, pad, get_fmt, state, fmt);
>  	}
>  
>  	WARN(pad->entity->function != MEDIA_ENT_F_IO_V4L,

-- 
Regards,

Laurent Pinchart
