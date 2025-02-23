Return-Path: <linux-media+bounces-26692-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE7EA41058
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 18:04:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF52C170AF5
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 17:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AB5C146A7A;
	Sun, 23 Feb 2025 17:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="f4VCxMKV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A7A43ABC;
	Sun, 23 Feb 2025 17:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740330219; cv=none; b=ZAT70Fu+1fPOn5aQXhrU+2FvpB+QwtofI/5N1ceMKnB9+uGZ2IHNaTEgv9i8InLxKfhrcz8ydmcIjWUWbdoTvCorjXvvZmDPscZIXs8r2jWdi/oBPJewwonqBG4ICnYkAdWEM9mzootqVx4fyg855ANGXjFW1h1Q7DDv6UWZ2K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740330219; c=relaxed/simple;
	bh=i0P6xLz4Z1fz9eIAg8XOqhChSKv55yo8f1s1I9CQyyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HzohVr7vXqCiP8llezx72KZdyrPX4/ISzvy3Xspx074HTGsgG+hDNh6CSf3SsQvrIL+ukhDXtBBUa11UYM8B/uyAsn8IEasnowCK7nl+VIybn+pL+WMvSUnAajZjELb3I/gJvIyhXY/+PiY/fRkCQvCVrvHpmDDtzfy5k8FLrNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=f4VCxMKV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C61044DC;
	Sun, 23 Feb 2025 18:02:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740330131;
	bh=i0P6xLz4Z1fz9eIAg8XOqhChSKv55yo8f1s1I9CQyyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f4VCxMKVmE/9fUXOh4clBlQk4AM5B6Gx/5TnAZWpjs+u/QGjc1GJqpaf+tGNLFAul
	 d1URpHWMmqGyKsQrPqK1H6iK3mZxZDaP8zmoLcdvxD4R9MPm+JXRj88FXWSN6L3Gl1
	 qB8Pml7PmS48ii7Va6iTeLVc2sgofIEjJUuDS0DY=
Date: Sun, 23 Feb 2025 19:03:19 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] media: uvcvideo: Set V4L2_CTRL_FLAG_DISABLED during
 queryctrl errors
Message-ID: <20250223170319.GA2821@pendragon.ideasonboard.com>
References: <20250111-uvc-eaccess-v4-1-c7759bfd1bd4@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250111-uvc-eaccess-v4-1-c7759bfd1bd4@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Sat, Jan 11, 2025 at 09:57:21AM +0000, Ricardo Ribalda wrote:
> To implement VIDIOC_QUERYCTRL, we need to know the minimum, maximum,
> step and flags of the control. For some of the controls, this involves
> querying the actual hardware.
> 
> Some non-compliant cameras produce errors when we query them. Right now,
> we populate that error to userspace. When an error happens, the v4l2
> framework does not copy the v4l2_queryctrl struct to userspace. Also,
> userspace apps are not ready to handle any other error than -EINVAL.
> 
> One of the main usecases of VIDIOC_QUERYCTRL is enumerating the controls
> of a device. This is done using the V4L2_CTRL_FLAG_NEXT_CTRL flag. In
> that usecase, a non-compliant control will make it almost impossible to
> enumerate all controls of the device.
> 
> A control with an invalid max/min/step/flags is better than non being
> able to enumerate the rest of the controls.
> 
> This patch makes VIDIOC_QUERYCTRL return 0 in all the error cases
> different than -EINVAL, introduces a warning in dmesg so we can
> have a trace of what has happened and sets the V4L2_CTRL_FLAG_DISABLED.
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
> 
> Lots of good arguments in favor/against this patch in the v1. Please
> check!
> 
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
> --
> ---
> Changes in v4:
> - Display control name (Thanks Hans)
> - Link to v3: https://lore.kernel.org/r/20250107-uvc-eaccess-v3-1-99f3335d5133@chromium.org
> 
> Changes in v3:
> - Add a retry mechanism during error.

This needs to be explained in the commit message, including when/why it
helps, and why the retry count is 2.

> - Set V4L2_CTRL_FLAG_DISABLED flag.
> - Link to v2: https://lore.kernel.org/r/20241219-uvc-eaccess-v2-1-bf6520c8b86d@chromium.org
> 
> Changes in v2:
> - Never return error, even if we are not enumerating the controls
> - Improve commit message.
> - Link to v1: https://lore.kernel.org/r/20241213-uvc-eaccess-v1-1-62e0b4fcc634@chromium.org
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 43 ++++++++++++++++++++++++++++++++--------
>  1 file changed, 35 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 4e58476d305e..9d7812e8572d 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1280,6 +1280,8 @@ static u32 uvc_get_ctrl_bitmap(struct uvc_control *ctrl,
>  	return ~0;
>  }
>  
> +#define MAX_QUERY_RETRIES 2
> +
>  static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>  	struct uvc_control *ctrl,
>  	struct uvc_control_mapping *mapping,
> @@ -1305,19 +1307,44 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>  		__uvc_find_control(ctrl->entity, mapping->master_id,
>  				   &master_map, &master_ctrl, 0);
>  	if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
> +		unsigned int retries;
>  		s32 val;
> -		int ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
> -		if (ret < 0)
> -			return ret;
> +		int ret;
>  
> -		if (val != mapping->master_manual)
> -				v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
> +		for (retries = 0; retries < MAX_QUERY_RETRIES; retries++) {
> +			ret = __uvc_ctrl_get(chain, master_ctrl, master_map,
> +					     &val);
> +			if (ret >= 0)
> +				break;
> +		}
> +
> +		if (ret < 0) {
> +			dev_warn_ratelimited(&chain->dev->udev->dev,
> +					     "UVC non compliance: Error %d querying master control %x (%s)\n",
> +					      ret, master_map->id,
> +					      uvc_map_get_name(master_map));
> +		} else if (val != mapping->master_manual) {
> +			v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
> +		}
>  	}
>  
>  	if (!ctrl->cached) {
> -		int ret = uvc_ctrl_populate_cache(chain, ctrl);
> -		if (ret < 0)
> -			return ret;
> +		unsigned int retries;
> +		int ret;
> +
> +		for (retries = 0; retries < MAX_QUERY_RETRIES; retries++) {
> +			ret = uvc_ctrl_populate_cache(chain, ctrl);
> +			if (ret >= 0)
> +				break;
> +		}
> +
> +		if (ret < 0) {
> +			dev_warn_ratelimited(&chain->dev->udev->dev,
> +					     "UVC non compliance: Error %d populating cache of control %x (%s)\n",
> +					     ret, mapping->id,
> +					     uvc_map_get_name(mapping));
> +			v4l2_ctrl->flags |= V4L2_CTRL_FLAG_DISABLED;

Can we make the control permanently disabled ?

> +		}
>  	}
>  
>  	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_DEF) {
> 
> ---
> base-commit: c5aa327e10b194884a9c9001a751f6e4703bc3e3
> change-id: 20241213-uvc-eaccess-755cc061a360

-- 
Regards,

Laurent Pinchart

