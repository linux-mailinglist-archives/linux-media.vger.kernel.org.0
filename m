Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D99340C384
	for <lists+linux-media@lfdr.de>; Wed, 15 Sep 2021 12:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232139AbhIOKSY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Sep 2021 06:18:24 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:53971 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231940AbhIOKSX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Sep 2021 06:18:23 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id EA2466000D;
        Wed, 15 Sep 2021 10:17:00 +0000 (UTC)
Date:   Wed, 15 Sep 2021 12:17:47 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [PATCH v8 04/36] media: subdev: pass also the active state to
 subdevs from ioctls
Message-ID: <20210915101747.edpyp6k4sos7jh66@uno.localdomain>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
 <20210830110116.488338-5-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210830110116.488338-5-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi

On Mon, Aug 30, 2021 at 02:00:44PM +0300, Tomi Valkeinen wrote:
> At the moment when a subdev op is called, the TRY subdev state
> (subdev_fh->state) is passed as a parameter even for ACTIVE case, or
> alternatively a NULL can be passed for ACTIVE case. This used to make
> sense, as the ACTIVE state was handled internally by the subdev drivers.
>
> We now have a state for ACTIVE case in a standard place, and can pass
> that alto to the drivers. This patch changes the subdev ioctls to either
> pass the TRY or ACTIVE state to the subdev.
>
> Unfortunately many drivers call ops from other subdevs, and implicitly
> pass NULL as the state, so this is just a partial solution. A coccinelle
> spatch could perhaps be created which fixes the drivers' subdev calls.
>
> For all current upstream drivers this doesn't matter, as they do not
> expect to get a valid state for ACTIVE case. But future drivers which
> support multiplexed streaming and routing will depend on getting a state
> for both active and try cases, and the simplest way to avoid this
> problem is to introduce a helper function, used by the new drivers,
> which makes sure the driver has either the TRY or ACTIVE state. This
> helper will be introduced in a follow-up patch.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 73 +++++++++++++++++++++++----
>  1 file changed, 63 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 04ad319fb150..b3637cddca58 100644
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

Why this additional indirection layer ?

v4l2_subdev_get_active_state(struct v4l2_subdev *sd)
{
    return sd->state;
}

I understand you want to have the core to fish the 'right' state for
the drivers, but this then requires to protect against bridge drivers
calling an op through v4l2_subdev_call() with a NULL state by using
one more indirection like

	state = v4l2_subdev_validate_state(sd, state);

        static inline struct v4l2_subdev_state *
        v4l2_subdev_validate_state(struct v4l2_subdev *sd,
                                   struct v4l2_subdev_state *state)
        {
                return state ? state : sd->state;
        }

Which I very much don't like as it implicitly changes what state the
driver receives to work-around a design flaw (the fact that even if
the core tries to, there's no gurantee state is valid).

If feel like it would be much simpler if:

1) The core passes in a state which always come from the fh (the
   try_state) when it do_ioctl()

2) Drivers use their 'active' states embedded in the subdev or the
   'try' state passed in as parameter and decide
   which one to use based on the context. It's a pattern we have
   everywere already when using the per-fh try formats

	switch (which) {
	case V4L2_SUBDEV_FORMAT_TRY:
		return v4l2_subdev_get_try_format(&sd, sd_state, pad);
	case V4L2_SUBDEV_FORMAT_ACTIVE:
		return &sd->fmt;
	default:
		return NULL;
	}

I liked the idea to have the core pass in a state without the driver
having to care where it comes from, but it requires too many
indirections and implicities like the above shown
v4l2_subdev_validate_state().

One middle-ground could be to have the core pass in the 'correct' state as it
does in your series, and default it to sd->state if a bridge driver
calls an op through v4l2_subdev_call() with a NULL state, as the
format is implicitly ACTIVE in that case.

This ofc requires the state to be embedded (ie it's always there) and
that state-aware drivers to have properly initialized it, but that's a
given.

Nonetheless, this considerations do not defeat the purpose of having a
'state', as currently we have

struct v4l2_subdev_state {
        struct v4l2_subdev_krouting; /* Use for TRY and ACTIVE */
        struct v4l2_stream_configs; /* Use for ACTIVE */
        struct v4l2_pad_configs; /* Used for TRY */
};

and v4l2_stream_configs is a super-set of v4l2_pad_configs

If we could get to

struct v4l2_subdev_state {
        struct v4l2_subdev_krouting; /* Use for TRY and ACTIVE */
        struct v4l2_stream_configs; /* Use for TRY and ACTIVE */
};

This could turn out to be pretty neat, as it allows 'new' drivers to
maintain their current formats and routings in a subdev 'state'
instead of scattering those information in the driver-wide structure
as they currently do for formats, crops and whatnot. This can ofc go
on top.


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
> --
> 2.25.1
>
