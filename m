Return-Path: <linux-media+bounces-29325-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E83A7A365
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 15:09:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 572CE1897BB3
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 13:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE3424E011;
	Thu,  3 Apr 2025 13:07:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5C825776;
	Thu,  3 Apr 2025 13:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743685671; cv=none; b=HB/eu4lbTMpzc+DeTMvp7Y+24ZbuPdM0lLQMLvL9QEfqjiCLKIvddMg/BMJ4hNZImrM02fUQ9wDeGkRasb94gSGq1D+byxsCpX3Yme2XmgkV180i0laIYprX6FueMKjqQTo1pB9qqcAmA+72BLRxD50w+rj38/cCSGVu5qWimQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743685671; c=relaxed/simple;
	bh=imOouI80DKExOiz0/rm8iV6AqcOAOqJSQXN6MdEqJ44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G9i998n+zSx8cVTXzPSUynwIqfFikEt01TdBuU5m+t0iceXz8de4ymRtL6XwNtTtRvFOQedk/VVA3PkZ+ePqG48+4iSlUwqJ6UOJHA+dg+41onsbbMymwBd3agx9DQ7XeMZqCwnc0wy0NMj6LRBXR3kgFAgbJywK7SCOzljzJdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23BEAC4CEE3;
	Thu,  3 Apr 2025 13:07:48 +0000 (UTC)
Message-ID: <1c4b9f6c-eff5-4b83-bb4f-64e89e493f20@xs4all.nl>
Date: Thu, 3 Apr 2025 15:07:47 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] media: uvcvideo: Set V4L2_CTRL_FLAG_DISABLED during
 queryctrl errors
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250403-uvc-eaccess-v7-1-033d0c3d6368@chromium.org>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20250403-uvc-eaccess-v7-1-033d0c3d6368@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/04/2025 14:59, Ricardo Ribalda wrote:
> To implement VIDIOC_QUERYCTRL, we need to know the minimum, maximum,
> step and flags of the control. For some of the controls, this involves
> querying the actual hardware.
> 
> Some non-compliant cameras produce errors when we query them. These
> error can be triggered every time, sometimes, or when other controls do
> not have the "right value". Right now, we populate that error to userspace.
> When an error happens, the v4l2 framework does not copy the v4l2_queryctrl
> struct to userspace. Also, userspace apps are not ready to handle any
> other error than -EINVAL.
> 
> One of the main usecases of VIDIOC_QUERYCTRL is enumerating the controls
> of a device. This is done using the V4L2_CTRL_FLAG_NEXT_CTRL flag. In
> that usecase, a non-compliant control will make it almost impossible to
> enumerate all controls of the device.
> 
> A control with an invalid max/min/step/flags is better than non being
> able to enumerate the rest of the controls.
> 
> This patch:
> - Retries for an extra attempt to read the control, to avoid spurious
>   errors. More attempts do not seem to produce better results in the
>   tested hardware.
> - Makes VIDIOC_QUERYCTRL return 0 in all the error cases different than
>   -EINVAL.
> - Introduces a warning in dmesg so we can have a trace of what has happened
>   and sets the V4L2_CTRL_FLAG_DISABLED.
> - Makes sure we keep returning V4L2_CTRL_FLAG_DISABLED for all the next
>   attempts to query that control (other operations have the same
>   functionality as now).
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Hi 2*Hans and Laurent!
> 
> I came around a device that was listing just a couple of controls when
> it should be listing much more.
> 
> Some debugging later I found that the device was returning -EIO when
> all the focal controls were read.
> 
> Lots of good arguments in favor/against this patch in the v1. Please
> check!
> 
> Without this patch:
> $ v4l2-ctl --list-ctrls
> User Controls
> 
>                      brightness 0x00980900 (int)    : min=0 max=255 step=1 default=128 value=128
>                        contrast 0x00980901 (int)    : min=0 max=100 step=1 default=32 value=32
>                      saturation 0x00980902 (int)    : min=0 max=100 step=1 default=64 value=64
>                             hue 0x00980903 (int)    : min=-180 max=180 step=1 default=0 value=0
>         white_balance_automatic 0x0098090c (bool)   : default=1 value=1
>                           gamma 0x00980910 (int)    : min=90 max=150 step=1 default=120 value=120
>            power_line_frequency 0x00980918 (menu)   : min=0 max=2 default=2 value=2 (60 Hz)
>       white_balance_temperature 0x0098091a (int)    : min=2800 max=6500 step=1 default=4600 value=4600 flags=inactive
> 
> With this patch:
> $ v4l2-ctl --list-ctrls
> 
> User Controls
> 
>                      brightness 0x00980900 (int)    : min=0 max=255 step=1 default=128 value=128
>                        contrast 0x00980901 (int)    : min=0 max=100 step=1 default=32 value=32
>                      saturation 0x00980902 (int)    : min=0 max=100 step=1 default=64 value=64
>                             hue 0x00980903 (int)    : min=-180 max=180 step=1 default=0 value=0
>         white_balance_automatic 0x0098090c (bool)   : default=1 value=1
>                           gamma 0x00980910 (int)    : min=90 max=150 step=1 default=120 value=120
>            power_line_frequency 0x00980918 (menu)   : min=0 max=2 default=2 value=2 (60 Hz)
>       white_balance_temperature 0x0098091a (int)    : min=2800 max=6500 step=1 default=4600 value=4600 flags=inactive
>                       sharpness 0x0098091b (int)    : min=0 max=7 step=1 default=3 value=3
>          backlight_compensation 0x0098091c (int)    : min=0 max=2 step=1 default=1 value=1
> [   32.777643] usb 3-6: UVC non compliance: permanently disabling control 98091b (Sharpness), due to error -5

So why isn't 'flags=disabled' listed with the sharpness control above?

Looking at the v4l2-ctl code I think it should just skip the 'sharpness' control and
not list it at all. I'm actually not so sure that is the right thing to do.

So try with this patch for v4l2-ctl:

diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index 5b953cbd..41739294 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -824,8 +824,6 @@ static int print_control(int fd, struct v4l2_query_ext_ctrl &qctrl, bool show_me
 	memset(&ctrl, 0, sizeof(ctrl));
 	memset(&ext_ctrl, 0, sizeof(ext_ctrl));
 	memset(&ctrls, 0, sizeof(ctrls));
-	if (qctrl.flags & V4L2_CTRL_FLAG_DISABLED)
-		return 1;
 	if (qctrl.type == V4L2_CTRL_TYPE_CTRL_CLASS) {
 		printf("\n%s\n\n", qctrl.name);
 		return 1;

Regards,

	Hans

> 
> Camera Controls
> 
>                   auto_exposure 0x009a0901 (menu)   : min=0 max=3 default=3 value=3 (Aperture Priority Mode)
>          exposure_time_absolute 0x009a0902 (int)    : min=2 max=1250 step=1 default=156 value=156 flags=inactive
>      exposure_dynamic_framerate 0x009a0903 (bool)   : default=0 value=0
>                         privacy 0x009a0910 (bool)   : default=0 value=0 flags=read-only
>    region_of_interest_rectangle 0x009a1901 (unknown): type=107 value=unsupported payload type flags=has-payload
>   region_of_interest_auto_ctrls 0x009a1902 (bitmask): max=0x00000001 default=0x00000001 value=1
> 
> Emulating error with:
> +       if (cs == UVC_PU_SHARPNESS_CONTROL && query == UVC_GET_MAX) {
> +               printk(KERN_ERR "%s:%d %s\n", __FILE__, __LINE__, __func__);
> +               return -EIO;
> +       }
> In uvc_query_ctrl()
> ---
> Changes in v7:
> - Only retry on -EIO (Thanks Hans).
> - Add comment for retry (Thanks Hans).
> - Rebase patch
> - Check master_map->disabled before reading the master control.
> - Link to v6: https://lore.kernel.org/r/20250310-uvc-eaccess-v6-1-bf4562f7cabd@chromium.org
> 
> Changes in v6:
> - Keep returning V4L2_CTRL_FLAG_DISABLED in future control queries.
> - Link to v5: https://lore.kernel.org/r/20250224-uvc-eaccess-v5-1-690d73bcef28@chromium.org
> 
> Changes in v5:
> - Explain the retry in the commit message (Thanks Laurent).
> - Link to v4: https://lore.kernel.org/r/20250111-uvc-eaccess-v4-1-c7759bfd1bd4@chromium.org
> 
> Changes in v4:
> - Display control name (Thanks Hans)
> - Link to v3: https://lore.kernel.org/r/20250107-uvc-eaccess-v3-1-99f3335d5133@chromium.org
> 
> Changes in v3:
> - Add a retry mechanism during error.
> - Set V4L2_CTRL_FLAG_DISABLED flag.
> - Link to v2: https://lore.kernel.org/r/20241219-uvc-eaccess-v2-1-bf6520c8b86d@chromium.org
> 
> Changes in v2:
> - Never return error, even if we are not enumerating the controls
> - Improve commit message.
> - Link to v1: https://lore.kernel.org/r/20241213-uvc-eaccess-v1-1-62e0b4fcc634@chromium.org
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 53 ++++++++++++++++++++++++++++++++++------
>  drivers/media/usb/uvc/uvcvideo.h |  2 ++
>  2 files changed, 47 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index cbf19aa1d82374a08cf79b6a6787fa348b83523a..b41fed364d54aefd7da72c47197cf9d9e3c1b176 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1483,14 +1483,28 @@ static u32 uvc_get_ctrl_bitmap(struct uvc_control *ctrl,
>  	return ~0;
>  }
>  
> +/*
> + * Maximum retry count to avoid spurious errors with controls. Increase this
> + * value does no seem to produce better results in the tested hardware.
> + */
> +#define MAX_QUERY_RETRIES 2
> +
>  static int __uvc_queryctrl_boundaries(struct uvc_video_chain *chain,
>  				      struct uvc_control *ctrl,
>  				      struct uvc_control_mapping *mapping,
>  				      struct v4l2_query_ext_ctrl *v4l2_ctrl)
>  {
>  	if (!ctrl->cached) {
> -		int ret = uvc_ctrl_populate_cache(chain, ctrl);
> -		if (ret < 0)
> +		unsigned int retries;
> +		int ret;
> +
> +		for (retries = 0; retries < MAX_QUERY_RETRIES; retries++) {
> +			ret = uvc_ctrl_populate_cache(chain, ctrl);
> +			if (ret != -EIO)
> +				break;
> +		}
> +
> +		if (ret)
>  			return ret;
>  	}
>  
> @@ -1567,6 +1581,7 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>  {
>  	struct uvc_control_mapping *master_map = NULL;
>  	struct uvc_control *master_ctrl = NULL;
> +	int ret;
>  
>  	memset(v4l2_ctrl, 0, sizeof(*v4l2_ctrl));
>  	v4l2_ctrl->id = mapping->id;
> @@ -1587,18 +1602,29 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>  		__uvc_find_control(ctrl->entity, mapping->master_id,
>  				   &master_map, &master_ctrl, 0, 0);
>  	if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
> +		unsigned int retries;
>  		s32 val;
>  		int ret;
>  
>  		if (WARN_ON(uvc_ctrl_mapping_is_compound(master_map)))
>  			return -EIO;
>  
> -		ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
> -		if (ret < 0)
> -			return ret;
> +		for (retries = 0; retries < MAX_QUERY_RETRIES; retries++) {
> +			ret = __uvc_ctrl_get(chain, master_ctrl, master_map,
> +					     &val);
> +			if (ret != -EIO)
> +				break;
> +		}
>  
> -		if (val != mapping->master_manual)
> -			v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
> +		if (ret < 0) {
> +			dev_warn_ratelimited(&chain->dev->udev->dev,
> +					     "UVC non compliance: Error %d querying master control %x (%s)\n",
> +					     ret, master_map->id,
> +					     uvc_map_get_name(master_map));
> +		} else {
> +			if (val != mapping->master_manual)
> +				v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
> +		}
>  	}
>  
>  	v4l2_ctrl->elem_size = uvc_mapping_v4l2_size(mapping);
> @@ -1613,7 +1639,18 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>  		return 0;
>  	}
>  
> -	return __uvc_queryctrl_boundaries(chain, ctrl, mapping, v4l2_ctrl);
> +	ret = __uvc_queryctrl_boundaries(chain, ctrl, mapping, v4l2_ctrl);
> +	if (ret && !mapping->disabled) {
> +		dev_warn(&chain->dev->udev->dev,
> +			 "UVC non compliance: permanently disabling control %x (%s), due to error %d\n",
> +			 mapping->id, uvc_map_get_name(mapping), ret);
> +		mapping->disabled = true;
> +	}
> +
> +	if (mapping->disabled)
> +		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_DISABLED;
> +
> +	return 0;
>  }
>  
>  int uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index b4ee701835fc016474d2cd2a0b67b2aa915c1c60..8e3753896d42baddcc2192057e8c5786ddd79fa8 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -134,6 +134,8 @@ struct uvc_control_mapping {
>  	s32 master_manual;
>  	u32 slave_ids[2];
>  
> +	bool disabled;
> +
>  	const struct uvc_control_mapping *(*filter_mapping)
>  				(struct uvc_video_chain *chain,
>  				struct uvc_control *ctrl);
> 
> ---
> base-commit: 4e82c87058f45e79eeaa4d5bcc3b38dd3dce7209
> change-id: 20250403-uvc-eaccess-8f3666151830
> 
> Best regards,


