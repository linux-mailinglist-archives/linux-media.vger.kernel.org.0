Return-Path: <linux-media+bounces-23747-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F46C9F70CB
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 00:28:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 337F616E243
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 23:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E62AD1FD7AD;
	Wed, 18 Dec 2024 23:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iLEzePIo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B277E1FD780;
	Wed, 18 Dec 2024 23:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734564457; cv=none; b=L9BAwPPuUa9gjxNPBFqRklEuvenhvNmlKwQX4qM+wq7tIP/+G9YYlLL0ySYPrUUe8+lmDgyP/s/6FCWMiusZvrauDw5r7kViJOrlEmtqgmGsek62TwKPQLploW4dzfYzLrk/+qo9blyl/4otSSz/4O1qoJ2htYBt3Ohf+QCwW6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734564457; c=relaxed/simple;
	bh=NxXP8W3gzG+QaCQQhgvQMSKOHlCXLXhPaqAm+Z3zNpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YM+2lq2OiioL1u7RLH/ujstCPHSGMFfulO8tkqQf6MSUboJNd5t0kkaMgczZNiUYjqyXMC27Mm+3BHhdlvUKfuTOxE4HecjZEaSZzIzXy8igCK05/dhWCc3hDG91NOKy725fn0Komk2Tnn4903zJs9es6iYSXA6uphc85pD72Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iLEzePIo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0086D163;
	Thu, 19 Dec 2024 00:26:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734564416;
	bh=NxXP8W3gzG+QaCQQhgvQMSKOHlCXLXhPaqAm+Z3zNpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iLEzePIouL53elAt+fMENmiMX7GzefKt5BoICaf05sbVbuGs4XABS7CL3w12+mBvk
	 2/QJRd6f7mtTZGZvxndSeyIZ75k+nlDDZfSmdgN2b0P9jna6l2Toj9tfYDtrPpJ5sS
	 c+rlNDYmT6y3pmPHsNJypLTZj+TDuj2eFxhOH6oA=
Date: Thu, 19 Dec 2024 01:27:30 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Filter hw errors while enumerating
 controls
Message-ID: <20241218232730.GF5518@pendragon.ideasonboard.com>
References: <20241213-uvc-eaccess-v1-1-62e0b4fcc634@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241213-uvc-eaccess-v1-1-62e0b4fcc634@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Fri, Dec 13, 2024 at 11:21:02AM +0000, Ricardo Ribalda wrote:
> To implement VIDIOC_QUERYCTRL, we need to read from the hardware all the
> values that were not cached previously. If that read fails, we used to
> report back the error to the user.
> 
> Unfortunately this does not play nice with userspace. When they are
> enumerating the contols, the only expect an error when there are no
> "next" control.
> 
> This is probably a corner case, and could be handled in userspace, but
> both v4l2-ctl and yavta fail to enumerate all the controls if we return
> then -EIO during VIDIOC_QUERYCTRL. I suspect that there are tons of
> userspace apps handling this wrongly as well.
> 
> This patch get around this issue by ignoring the hardware errors and
> always returning 0 if a control exists.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Hi 2*Hans and Laurent!
> 
> I came around a device that was listing just a couple of controls when
> it should be listing much more.
> 
> Some debugging latter I found that the device was returning -EIO when
> all the focal controls were read.

Was it transient and random errors, or does the device always fail for
those controls ?

> This could be solved in userspace.. but I suspect that a lot of people
> has copied the implementation of v4l-utils or yavta.
> 
> What do you think of this workaround?

Pretending that the control could be queried is problematic. We'll
return invalid values to the user, I don't think that's a good idea. If
the problematic device always returns error for focus controls, we could
add a quirk, and extend the uvc_device_info structure to list the
controls to ignore.

Another option would be to skip over controls that return -EIO within
the kernel, and mark those controls are broken. I think this could be
done transparently for userspace, the first time we try to populate the
cache for such controls, a -EIO error would mark the control as broken,
and from a userspace point of view it wouldn't be visible through as
ioctl.

> Without this patch:
> $ v4l2-ctl --list-ctrls
>                   auto_exposure 0x009a0901 (menu)   : min=0 max=3 default=3 value=3 (Aperture Priority Mode)
>          exposure_time_absolute 0x009a0902 (int)    : min=50 max=10000 step=1 default=166 value=166 flags=inactive
>      exposure_dynamic_framerate 0x009a0903 (bool)   : default=0 value=0
> region_of_interest_auto_control 0x009a1902 (bitmask): max=0x00000001 default=0x00000001 value=1
> 
> With this patch:
> $ v4l2-ctl --list-ctrls
>                   auto_exposure 0x009a0901 (menu)   : min=0 max=3 default=3 value=3 (Aperture Priority Mode)
>          exposure_time_absolute 0x009a0902 (int)    : min=50 max=10000 step=1 default=166 value=166 flags=inactive
>      exposure_dynamic_framerate 0x009a0903 (bool)   : default=0 value=0
> error 5 getting ext_ctrl Focus, Absolute
> error 5 getting ext_ctrl Focus, Automatic Continuous
>    region_of_interest_rectangle 0x009a1901 (unknown): type=107 value=unsupported payload type flags=has-payload
> region_of_interest_auto_control 0x009a1902 (bitmask): max=0x00000001 default=0x00000001 value=1
> 
> --
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 31 ++++++++++++++++++++++---------
>  1 file changed, 22 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 4fe26e82e3d1..a11048c9a105 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1283,7 +1283,8 @@ static u32 uvc_get_ctrl_bitmap(struct uvc_control *ctrl,
>  static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>  	struct uvc_control *ctrl,
>  	struct uvc_control_mapping *mapping,
> -	struct v4l2_queryctrl *v4l2_ctrl)
> +	struct v4l2_queryctrl *v4l2_ctrl,
> +	bool can_fail)
>  {
>  	struct uvc_control_mapping *master_map = NULL;
>  	struct uvc_control *master_ctrl = NULL;
> @@ -1307,17 +1308,28 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>  	if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
>  		s32 val;
>  		int ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
> -		if (ret < 0)
> -			return ret;
>  
> -		if (val != mapping->master_manual)
> -				v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
> +		if (ret < 0) {
> +			dev_warn_ratelimited(&chain->dev->udev->dev,
> +					     "UVC non compliance: Error %d querying master control %x\n",
> +					      ret, master_map->id);
> +			if (can_fail)
> +				return ret;
> +		} else if (val != mapping->master_manual) {
> +			v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
> +		}
>  	}
>  
>  	if (!ctrl->cached) {
>  		int ret = uvc_ctrl_populate_cache(chain, ctrl);
> -		if (ret < 0)
> -			return ret;
> +
> +		if (ret < 0) {
> +			dev_warn_ratelimited(&chain->dev->udev->dev,
> +					     "UVC non compliance: Error %d populating cache of control %x\n",
> +					     ret, mapping->id);
> +			if (can_fail)
> +				return ret;
> +		}
>  	}
>  
>  	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_DEF) {
> @@ -1420,7 +1432,8 @@ int uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>  			goto done;
>  	}
>  
> -	ret = __uvc_query_v4l2_ctrl(chain, ctrl, mapping, v4l2_ctrl);
> +	ret = __uvc_query_v4l2_ctrl(chain, ctrl, mapping, v4l2_ctrl,
> +				    !(v4l2_ctrl->id & V4L2_CTRL_FLAG_NEXT_CTRL));
>  done:
>  	mutex_unlock(&chain->ctrl_mutex);
>  	return ret;
> @@ -1513,7 +1526,7 @@ static void uvc_ctrl_fill_event(struct uvc_video_chain *chain,
>  {
>  	struct v4l2_queryctrl v4l2_ctrl;
>  
> -	__uvc_query_v4l2_ctrl(chain, ctrl, mapping, &v4l2_ctrl);
> +	__uvc_query_v4l2_ctrl(chain, ctrl, mapping, &v4l2_ctrl, true);
>  
>  	memset(ev, 0, sizeof(*ev));
>  	ev->type = V4L2_EVENT_CTRL;
> 
> ---
> base-commit: a7f5b36b34824415c28875d615c49a3cf5070615
> change-id: 20241213-uvc-eaccess-755cc061a360

-- 
Regards,

Laurent Pinchart

