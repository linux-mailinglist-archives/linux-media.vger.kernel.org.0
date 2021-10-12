Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E842A42A679
	for <lists+linux-media@lfdr.de>; Tue, 12 Oct 2021 15:53:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236783AbhJLNzx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Oct 2021 09:55:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbhJLNzw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Oct 2021 09:55:52 -0400
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F179C061570
        for <linux-media@vger.kernel.org>; Tue, 12 Oct 2021 06:53:50 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id aIDymsGaWx7rIaIE1mMEgm; Tue, 12 Oct 2021 15:53:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1634046829; bh=YbFeruFfTg3JLiDQzViM6lmdGM656qVl0WX0HuScbj4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=iZxiptDLQ/X7VPosBqrPb6yS0aJK/ZqDF0iolLY1bQkBhSczzsBk+igFZI+iyVLJy
         rZVi2oZ2anVw4QoOvX2lkTbR7/t75l4uSqeFM5NhoNSb26s8LUH5AOvZll/kN9Qdrm
         iAQ1yjl+liVaWJoeSxZQ2OBmaxI0V/qZDuMsSWngFDGgEJU5HflT2mapv9u3Aoe4gO
         QgGBIk7w0a68no7Tviiign0M4YXdNAIyVMN104yACFutHP5TLNPyRue1VwFADP849l
         P6uwxnSBYggGG/mTmJKxbmxxY0rQ8uzQ1l4IXIakG1bPylC4srbheYUpjWrfDq/Ss4
         O+lfem4+Efsvg==
Subject: Re: [PATCH v9 03/36] media: subdev: pass also the active state to
 subdevs from ioctls
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <20211005085750.138151-4-tomi.valkeinen@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <c648cd7c-9808-bb8e-f153-c222b3f0d655@xs4all.nl>
Date:   Tue, 12 Oct 2021 15:53:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211005085750.138151-4-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfIeM5Hn0Trx09OoHXd4SQq5xrFxxLAM6aG93neuHKRrGzFw7eHQFsDJVVrK/Ag2fJtwkosN7xroaeCkWuuH0RJwGqeDoZxmGhLJdENQnH6j34DXgc704
 W5brlruP5pw3YxySfVM/Ylhl43o6qw7YKoKTQHlZ8WV+hTi/iHbpUyjtN2g0oh1H+ToSJtiWWfFlB8I4nL2BlU3XawkEh/+Aoe8HUm4ryuXkYYfAoynhL8pO
 W5ci+hpxXJ8eufnDiDgeIEFzFoNFvKGrJa/WwBHYIFwvW6eg9oIu5jKdckM/vZvhcGNh1cD5GZIsvSchhNB7o1oz964Luk8Vz7Cfnw20HPD3XfqhqNyJldyY
 hRmxLqJH0A/FFyZIk1cZAg0T4gSxeraS7QBo3P8e+WR2Xw70kFeXeZ9pCq5EfAlKmSF3uQ4vt7XBiuDwkRohrjPNEc5lE0ZEytfD0gfXAW/Daqp3+1hdrQ8K
 0V7u7SJVWkZ7IrmLrybZXdZgm0NcTE+lV6n0SA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/10/2021 10:57, Tomi Valkeinen wrote:
> At the moment when a subdev op is called, the TRY subdev state
> (subdev_fh->state) is passed as a parameter even for ACTIVE case, or

for -> for the

> alternatively a NULL can be passed for ACTIVE case. This used to make
> sense, as the ACTIVE state was handled internally by the subdev drivers.
> 
> We now have a state for ACTIVE case in a standard place, and can pass

for -> for the

> that alto to the drivers. This patch changes the subdev ioctls to either

alto -> also

> pass the TRY or ACTIVE state to the subdev.
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
> 
> However, if an existing subdev driver is changed to support multiplexed
> streams, the driver has to consider cases where its ops will be called
> with NULL state. The problem can easily be solved by using the
> v4l2_subdev_validate_and_lock_state() helper, introduced in a follow up
> patch.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

With those typos fixed:

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

	Hans

> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 73 +++++++++++++++++++++++----
>  1 file changed, 63 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index bcaf66a1e3d9..aa757cc28879 100644
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
> 

