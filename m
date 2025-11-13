Return-Path: <linux-media+bounces-47022-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63465C5A46A
	for <lists+linux-media@lfdr.de>; Thu, 13 Nov 2025 23:06:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2FE03AA21E
	for <lists+linux-media@lfdr.de>; Thu, 13 Nov 2025 21:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F056F3254A9;
	Thu, 13 Nov 2025 21:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wfuPMeFz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD49283CB1;
	Thu, 13 Nov 2025 21:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763071164; cv=none; b=L6MaVYL7YYM1C4E9k+jR7iagOxwQVYMp077MkioTr9vbyetmBiG6+wxoBG5k01CxzCWPGk5zprAPEyfYRLINf+INfKXaIPUcFDscwdfXXcK0zPnwPhS0QTQRBcWjI2jna9BnFTXMbyz5VQtZuP8THvWx5Gzo5zLv3k4r8K5JwbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763071164; c=relaxed/simple;
	bh=cSx18/G4VFXR/jJKmxu9rD6Y8jNdKwnge41HMadjcmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RRSfPhGRe2jnYbZ4jUjDxc6IsQirdWKYMb/1KJXZZBagJ3kKC6bBmVv7rnl0VWUSTUHab0tab8JeDiF30yiIfg5F8E/y88CQ+js10ZHFso+z1VgkypXqvFkqrASa7ZgUh+tJImGv7mbw7dxpJt4jxJWk5VFS0r+k9sLfrWj8ls8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wfuPMeFz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-165-222.bb.dnainternet.fi [82.203.165.222])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id AEBB85B2;
	Thu, 13 Nov 2025 22:57:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763071040;
	bh=cSx18/G4VFXR/jJKmxu9rD6Y8jNdKwnge41HMadjcmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wfuPMeFzMxayCNGVO2IuNZSfvoCyqOkqnUEFNH4QjwN56LhQsmBdicxDySLFvVdVg
	 pZCJFI88NDDW+21y2pSqnMyQk+r8gzwHHUWrtCJyTcS1tKPGp2/YFys8NmgbOMH9UM
	 ky3U1hZs5f1Bd8oCQ8jT4gY7yKl2DptFNztRS4C8=
Date: Thu, 13 Nov 2025 23:59:09 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, Yunke Cao <yunkec@google.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Fix support for
 V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX
Message-ID: <20251113215909.GG9135@pendragon.ideasonboard.com>
References: <20251028-uvc-fix-which-v1-1-a7e6b82672a3@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251028-uvc-fix-which-v1-1-a7e6b82672a3@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Tue, Oct 28, 2025 at 05:55:10PM +0000, Ricardo Ribalda wrote:
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
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 11 +++++++++--
>  drivers/media/usb/uvc/uvc_v4l2.c |  9 ++++++---
>  drivers/media/usb/uvc/uvcvideo.h |  2 +-
>  3 files changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 2905505c240c060e5034ea12d33b59d5702f2e1f..2f7d5cdd18e072a47fb5906da0f847dd449911b4 100644
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
> @@ -1442,14 +1442,21 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
>  	s32 val;
>  	int ret;
>  	int i;
> +	bool is_which_min_max = (ioctl == VIDIOC_G_EXT_CTRLS &&

Is the ioctl check needed, given that this function will be called with
which set to V4L2_CTRL_WHICH_CUR_VAL if ioctl is not VIDIOC_G_EXT_CTRLS
?

> +				 (which == V4L2_CTRL_WHICH_MIN_VAL ||
> +				  which == V4L2_CTRL_WHICH_MAX_VAL));

Let's move this up to have longer lines first.

>  
>  	if (__uvc_query_v4l2_class(chain, v4l2_id, 0) >= 0)
> -		return -EACCES;
> +		return is_which_min_max ? -EINVAL : -EACCES;
>  
>  	ctrl = uvc_find_control(chain, v4l2_id, &mapping);
>  	if (!ctrl)
>  		return -EINVAL;
>  
> +	if ((!(ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX) ||
> +	     !(ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN)) && is_which_min_max)

Please put MIN before MAX.

Do we have to bundle min and max, or could we handle them separately ?
Something like

	if ((which == V4L2_CTRL_WHICH_MIN_VAL &&
	     !(ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN)) ||
	    (which == V4L2_CTRL_WHICH_M1X_VAL &&
	    !(ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX)))
		return -EINVAL;

> +		return -EINVAL;
> +
>  	if (ioctl == VIDIOC_G_EXT_CTRLS)
>  		return uvc_ctrl_is_readable(ctrls->which, ctrl, mapping);
>  
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 9e4a251eca88085a1b4e0e854370015855be92ee..d5274dc94da3c60f1f4566b307dd445f30c4f45f 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -765,6 +765,7 @@ static int uvc_ioctl_query_ext_ctrl(struct file *file, void *priv,
>  
>  static int uvc_ctrl_check_access(struct uvc_video_chain *chain,
>  				 struct v4l2_ext_controls *ctrls,
> +				 u32 which,

This fits on the previous line.

>  				 unsigned long ioctl)
>  {
>  	struct v4l2_ext_control *ctrl = ctrls->controls;
> @@ -772,7 +773,8 @@ static int uvc_ctrl_check_access(struct uvc_video_chain *chain,
>  	int ret = 0;
>  
>  	for (i = 0; i < ctrls->count; ++ctrl, ++i) {
> -		ret = uvc_ctrl_is_accessible(chain, ctrl->id, ctrls, ioctl);
> +		ret = uvc_ctrl_is_accessible(chain, ctrl->id, ctrls, which,
> +					     ioctl);
>  		if (ret)
>  			break;
>  	}
> @@ -806,7 +808,7 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *priv,
>  		which = V4L2_CTRL_WHICH_CUR_VAL;
>  	}
>  
> -	ret = uvc_ctrl_check_access(chain, ctrls, VIDIOC_G_EXT_CTRLS);
> +	ret = uvc_ctrl_check_access(chain, ctrls, which, VIDIOC_G_EXT_CTRLS);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -840,7 +842,8 @@ static int uvc_ioctl_s_try_ext_ctrls(struct uvc_fh *handle,
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

-- 
Regards,

Laurent Pinchart

