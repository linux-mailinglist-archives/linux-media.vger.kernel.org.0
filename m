Return-Path: <linux-media+bounces-48380-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D99B6CACC02
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 10:52:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 251783020157
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 09:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB32F2E7F3F;
	Mon,  8 Dec 2025 09:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PuMUtBkg"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F068C2D3EDE;
	Mon,  8 Dec 2025 09:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765187518; cv=none; b=uU6TXM1zHiLsWecn4UxfybJOTMdXyWUiBZ1cqbeaN+22M2FhX7hihtouuyFcVoAGenl0Y3Qd0U56WgsGthwY5pR8D4cPurY0TP9T6G8XsfZWiE1qNxDVFGVj2RBlIFuidcAWvJRnjJ43XFEMkd4T/KTi9cpYd8kIc6uGWAHArCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765187518; c=relaxed/simple;
	bh=Xw2iBNxEsfLHLYyj6T0lr2n/XtvbD3HgfDh5pPer8o8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IFbcFtO6zoPgiNRMYBsCshKDN/7oGxXmFA1IjeST9cjnmwpLYAZhUoVNxIA7Lh5KIhFUIShdjdyDL+11fwrjX4EqKok2gIvhXn8ebuDcT/dlt25hR7vOxRROW3wq3WFyFjKOUR4LiMobxymSfM2gqQPfwOOPd/gJ1qceUdYGCXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PuMUtBkg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5641C4CEF1;
	Mon,  8 Dec 2025 09:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765187517;
	bh=Xw2iBNxEsfLHLYyj6T0lr2n/XtvbD3HgfDh5pPer8o8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PuMUtBkgJmK2N/lYUA6rXhSho+XhXUj7z2cCr09/jqzhoWg5gDniMfiNROJfvZ1iy
	 TJe9IBxYz6Nbde9qN65QrmpsAZcXJo98IHbL/xQAk69hQk779zfA/ZlRNPF+rsUp8t
	 KElBdQ1B5xb6EUYbGrwOJ4lNFhgmNrZvzB5DAnLFi1v09+uADuZxwB9txGKuSWitS3
	 6MPzJYpbs8FaCfhDYflPXx4e8wPiezixCU3bAeDSCqoHw17BNiZzIQZOYGu+vaESMP
	 /vhDYRME776fHY8F066zFwnEI8NKdOCIzPdSexVIubRamIItNAfvC8Mrvg+JeU4hwd
	 0zcrDAdE8f+EA==
Message-ID: <d5691fc8-df8c-4c85-999c-ba6f848e64ed@kernel.org>
Date: Mon, 8 Dec 2025 10:51:53 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: uvcvideo: Fix support for
 V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>, Yunke Cao <yunkec@google.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20251119-uvc-fix-which-v2-1-67d1520d0ee8@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20251119-uvc-fix-which-v2-1-67d1520d0ee8@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 19-Nov-25 9:17 PM, Ricardo Ribalda wrote:
> The VIDIOC_G_EXT_CTRLS with which V4L2_CTRL_WHICH_(MIN|MAX)_VAL can only
> work for controls that have previously announced support for it.
> 
> This patch fixes the following v4l2-compliance error:
> 
>   info: checking extended control 'User Controls' (0x00980001)
>   fail: v4l2-test-controls.cpp(980): ret != EINVAL (got 13)
>         test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
> 
> Fixes: 39d2c891c96e ("media: uvcvideo: support V4L2_CTRL_WHICH_MIN/MAX_VAL")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

I've merged this into my local uvc/for-next branch which I will push out later
today.

Note: I've also rebased uvc/for-next on top of the latest media-committers/next
so this will be a forced push.

Regards,

Hans



> ---
> Changes in v2, Thanks Laurent:
> - Remove redundant ioctl check
> - CodeStyle
> - Link to v1: https://lore.kernel.org/r/20251028-uvc-fix-which-v1-1-a7e6b82672a3@chromium.org
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 14 ++++++++++++--
>  drivers/media/usb/uvc/uvc_v4l2.c | 10 ++++++----
>  drivers/media/usb/uvc/uvcvideo.h |  2 +-
>  3 files changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 2905505c240c060e5034ea12d33b59d5702f2e1f..2738ef74c7373b185b67611da57610fd0b442080 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1432,7 +1432,7 @@ static bool uvc_ctrl_is_readable(u32 which, struct uvc_control *ctrl,
>   * auto_exposure=1, exposure_time_absolute=251.
>   */
>  int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
> -			   const struct v4l2_ext_controls *ctrls,
> +			   const struct v4l2_ext_controls *ctrls, u32 which,
>  			   unsigned long ioctl)
>  {
>  	struct uvc_control_mapping *master_map = NULL;
> @@ -1442,14 +1442,24 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
>  	s32 val;
>  	int ret;
>  	int i;
> +	/*
> +	 * There is no need to check the ioctl, all the ioctls except
> +	 * VIDIOC_G_EXT_CTRLS use which=V4L2_CTRL_WHICH_CUR_VAL.
> +	 */
> +	bool is_which_min_max = which == V4L2_CTRL_WHICH_MIN_VAL ||
> +				which == V4L2_CTRL_WHICH_MAX_VAL;
>  
>  	if (__uvc_query_v4l2_class(chain, v4l2_id, 0) >= 0)
> -		return -EACCES;
> +		return is_which_min_max ? -EINVAL : -EACCES;
>  
>  	ctrl = uvc_find_control(chain, v4l2_id, &mapping);
>  	if (!ctrl)
>  		return -EINVAL;
>  
> +	if ((!(ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN) ||
> +	     !(ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX)) && is_which_min_max)
> +		return -EINVAL;
> +
>  	if (ioctl == VIDIOC_G_EXT_CTRLS)
>  		return uvc_ctrl_is_readable(ctrls->which, ctrl, mapping);
>  
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 9e4a251eca88085a1b4e0e854370015855be92ee..30c160daed8cb057b31ec00d665107dfdf4be1dc 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -765,14 +765,15 @@ static int uvc_ioctl_query_ext_ctrl(struct file *file, void *priv,
>  
>  static int uvc_ctrl_check_access(struct uvc_video_chain *chain,
>  				 struct v4l2_ext_controls *ctrls,
> -				 unsigned long ioctl)
> +				 u32 which, unsigned long ioctl)
>  {
>  	struct v4l2_ext_control *ctrl = ctrls->controls;
>  	unsigned int i;
>  	int ret = 0;
>  
>  	for (i = 0; i < ctrls->count; ++ctrl, ++i) {
> -		ret = uvc_ctrl_is_accessible(chain, ctrl->id, ctrls, ioctl);
> +		ret = uvc_ctrl_is_accessible(chain, ctrl->id, ctrls, which,
> +					     ioctl);
>  		if (ret)
>  			break;
>  	}
> @@ -806,7 +807,7 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *priv,
>  		which = V4L2_CTRL_WHICH_CUR_VAL;
>  	}
>  
> -	ret = uvc_ctrl_check_access(chain, ctrls, VIDIOC_G_EXT_CTRLS);
> +	ret = uvc_ctrl_check_access(chain, ctrls, which, VIDIOC_G_EXT_CTRLS);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -840,7 +841,8 @@ static int uvc_ioctl_s_try_ext_ctrls(struct uvc_fh *handle,
>  	if (!ctrls->count)
>  		return 0;
>  
> -	ret = uvc_ctrl_check_access(chain, ctrls, ioctl);
> +	ret = uvc_ctrl_check_access(chain, ctrls, V4L2_CTRL_WHICH_CUR_VAL,
> +				    ioctl);
>  	if (ret < 0)
>  		return ret;
>  
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index ed7bad31f75ca474c1037d666d5310c78dd764df..d583425893a5f716185153a07aae9bfe20182964 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -786,7 +786,7 @@ int uvc_ctrl_get(struct uvc_video_chain *chain, u32 which,
>  		 struct v4l2_ext_control *xctrl);
>  int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
>  int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
> -			   const struct v4l2_ext_controls *ctrls,
> +			   const struct v4l2_ext_controls *ctrls, u32 which,
>  			   unsigned long ioctl);
>  
>  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
> 
> ---
> base-commit: c218ce4f98eccf5a40de64c559c52d61e9cc78ee
> change-id: 20251028-uvc-fix-which-c3ba1fb68ed5
> 
> Best regards,


