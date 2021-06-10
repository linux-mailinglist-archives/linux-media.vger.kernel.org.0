Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC35E3A3184
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 18:56:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231644AbhFJQ5z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 12:57:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231624AbhFJQ5y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 12:57:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9274DC061574;
        Thu, 10 Jun 2021 09:55:58 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09E5DE54;
        Thu, 10 Jun 2021 18:55:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623344157;
        bh=GpnEUfnUehNSutll94TI3og6H2oBHYqXXECVQlCa9rU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s1ChskmaK+exBcfVUcNviVStvd/XVpamA7Iwa2hxtGN4jaSUzsG7D9+a39So2qBq2
         n9gFpYw4ZT8fR/jHCOE6qXcTFaMnOcFP63p2/tnTyyo+Jawn2N39FsK+UwWougH33/
         BaSCdKIFg/r3vvUCWvQ4OZa8JJQB8XIVLIPxDpj0=
Date:   Thu, 10 Jun 2021 19:55:38 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Subject: Re: [PATCH v9 14/22] media: uvcvideo: Check controls flags before
 accessing them
Message-ID: <YMJECjaaoqDWmnPL@pendragon.ideasonboard.com>
References: <20210326095840.364424-1-ribalda@chromium.org>
 <20210326095840.364424-15-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210326095840.364424-15-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Fri, Mar 26, 2021 at 10:58:32AM +0100, Ricardo Ribalda wrote:
> We can figure out if reading/writing a set of controls can fail without
> accessing them by checking their flags.
> 
> This way we can honor the API closer:
> 
> If an error is found when validating the list of controls passed with
> VIDIOC_G_EXT_CTRLS, then error_idx shall be set to ctrls->count to
> indicate to userspace that no actual hardware was touched.
> 
> Fixes v4l2-compliance:
> Control ioctls (Input 0):
> 		warn: v4l2-test-controls.cpp(765): g_ext_ctrls(0) invalid error_idx 0
>                 fail: v4l2-test-controls.cpp(645): invalid error index write only control
>         test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
> 
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 22 ++++++++++++++++++
>  drivers/media/usb/uvc/uvc_v4l2.c | 39 ++++++++++++++++++++++++++++----
>  drivers/media/usb/uvc/uvcvideo.h |  2 ++
>  3 files changed, 58 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 929e70dff11a..24fd5afc4e4f 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1046,6 +1046,28 @@ static int uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
>  	return 0;
>  }
>  
> +int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
> +			   bool read)
> +{
> +	struct uvc_control_mapping *mapping;
> +	struct uvc_control *ctrl;
> +
> +	if (__uvc_query_v4l2_class(chain, v4l2_id, 0) >= 0)
> +		return -EACCES;
> +
> +	ctrl = uvc_find_control(chain, v4l2_id, &mapping);
> +	if (!ctrl)
> +		return -EINVAL;
> +
> +	if (!(ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) && read)
> +		return -EACCES;
> +
> +	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR) && !read)
> +		return -EACCES;
> +
> +	return 0;
> +}
> +
>  static const char *uvc_map_get_name(const struct uvc_control_mapping *map)
>  {
>  	const char *name;
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 28ccaa8b9e42..a3ee1dc003fc 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -991,6 +991,26 @@ static int uvc_ioctl_query_ext_ctrl(struct file *file, void *fh,
>  	return 0;
>  }
>  
> +static int uvc_ctrl_check_access(struct uvc_video_chain *chain,
> +				 struct v4l2_ext_controls *ctrls,
> +				 unsigned long ioctl)
> +{
> +	struct v4l2_ext_control *ctrl = ctrls->controls;
> +	unsigned int i;
> +	int ret = 0;
> +
> +	for (i = 0; i < ctrls->count; ++ctrl, ++i) {
> +		ret = uvc_ctrl_is_accessible(chain, ctrl->id,
> +					    ioctl == VIDIOC_G_EXT_CTRLS);
> +		if (ret)
> +			break;
> +	}
> +
> +	ctrls->error_idx = ioctl == VIDIOC_TRY_EXT_CTRLS ? i : ctrls->count;
> +
> +	return ret;
> +}
> +
>  static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
>  				 struct v4l2_ext_controls *ctrls)
>  {
> @@ -1000,6 +1020,10 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
>  	unsigned int i;
>  	int ret;
>  
> +	ret = uvc_ctrl_check_access(chain, ctrls, VIDIOC_G_EXT_CTRLS);
> +	if (ret < 0)
> +		return ret;
> +
>  	if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL) {
>  		for (i = 0; i < ctrls->count; ++ctrl, ++i) {
>  			struct v4l2_queryctrl qc = { .id = ctrl->id };
> @@ -1036,13 +1060,17 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
>  
>  static int uvc_ioctl_s_try_ext_ctrls(struct uvc_fh *handle,
>  				     struct v4l2_ext_controls *ctrls,
> -				     bool commit)
> +				     unsigned long ioctl)
>  {
>  	struct v4l2_ext_control *ctrl = ctrls->controls;
>  	struct uvc_video_chain *chain = handle->chain;
>  	unsigned int i;
>  	int ret;
>  
> +	ret = uvc_ctrl_check_access(chain, ctrls, ioctl);
> +	if (ret < 0)
> +		return ret;
> +
>  	ret = uvc_ctrl_begin(chain);
>  	if (ret < 0)
>  		return ret;
> @@ -1051,14 +1079,15 @@ static int uvc_ioctl_s_try_ext_ctrls(struct uvc_fh *handle,
>  		ret = uvc_ctrl_set(handle, ctrl);
>  		if (ret < 0) {
>  			uvc_ctrl_rollback(handle);
> -			ctrls->error_idx = commit ? ctrls->count : i;
> +			ctrls->error_idx = ioctl == VIDIOC_S_EXT_CTRLS ?
> +						    ctrls->count : i;
>  			return ret;
>  		}
>  	}
>  
>  	ctrls->error_idx = 0;
>  
> -	if (commit)
> +	if (ioctl == VIDIOC_S_EXT_CTRLS)
>  		return uvc_ctrl_commit(handle, ctrls->controls, ctrls->count);
>  	else
>  		return uvc_ctrl_rollback(handle);
> @@ -1069,7 +1098,7 @@ static int uvc_ioctl_s_ext_ctrls(struct file *file, void *fh,
>  {
>  	struct uvc_fh *handle = fh;
>  
> -	return uvc_ioctl_s_try_ext_ctrls(handle, ctrls, true);
> +	return uvc_ioctl_s_try_ext_ctrls(handle, ctrls, VIDIOC_S_EXT_CTRLS);
>  }
>  
>  static int uvc_ioctl_try_ext_ctrls(struct file *file, void *fh,
> @@ -1077,7 +1106,7 @@ static int uvc_ioctl_try_ext_ctrls(struct file *file, void *fh,
>  {
>  	struct uvc_fh *handle = fh;
>  
> -	return uvc_ioctl_s_try_ext_ctrls(handle, ctrls, false);
> +	return uvc_ioctl_s_try_ext_ctrls(handle, ctrls, VIDIOC_TRY_EXT_CTRLS);
>  }
>  
>  static int uvc_ioctl_querymenu(struct file *file, void *fh,
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index dc20021f7ee0..9471c342a310 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -902,6 +902,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
>  
>  int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
>  int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
> +int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
> +			   bool read);
>  
>  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>  		      struct uvc_xu_control_query *xqry);

-- 
Regards,

Laurent Pinchart
