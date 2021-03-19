Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02A1A341789
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 09:34:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234298AbhCSIeK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 04:34:10 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:39229 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234076AbhCSIdl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 04:33:41 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id NAZalKpEOGEYcNAZdlR2Ia; Fri, 19 Mar 2021 09:33:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616142818; bh=xrFX+gOu7fwg+Xp0ozjcVh1n7ueqHwsaz9fCyG90Now=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=MWZbGMbs6KbSUTnf2BRmSdVdebwJlMHLNqnSZloeZHJKWszfkJs4jWM3vrhbVdu5z
         WhnqWjLbXDfJuTKv7WW6bBh4HqOrYeiIjcTwxSCsKPVoWuSkcA2zD0uuK9+fNE5h/4
         FXHd2y+lzgV8v1TjclRw63ecVuaTQEZfWH1+pebUSboHQ1vuTcdwU50gi/1g6VfYr0
         spNfOqQpQTxQCe+1IbZXnb8SbMP2Rn1rTrSZaPamb35O5devSzeFW2rT9VHfPF1j6S
         gKpwE3Za6qhF4VHX8Ltj/1lv5rs9tnGfBP/g/in7T2YqJiRJb0CQTZdM/07lYSXwEo
         dMsdP47+WZtrg==
Subject: Re: [PATCH v7 15/17] media: uvcvideo: Refactor __uvc_ctrl_commit
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
References: <20210318202928.166955-1-ribalda@chromium.org>
 <20210318202928.166955-16-ribalda@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <0aa1e1cb-063e-73d8-1fca-ca089029f1f9@xs4all.nl>
Date:   Fri, 19 Mar 2021 09:33:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210318202928.166955-16-ribalda@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfFD59upNXiLXzKMbwO6D6AD/usBKuvKSzlu6p92JiSiXNEWqdI6vDn0hfC2FJUyVj0oRCF/NCy1abDpqTFUN3M9ZUvxdpJjYJIf6BEpVYrQ33L5kt+Rt
 Hr538y1pHRz2Swl92x5NAcJ0Xb1elxG+Fpilj/+P27FL/he/An6CWtUhBBHkCVAoWBiAey5KdPegw4fWHy+8jhG4ePX6mcwsqqpXciRIRlgC6xJWpxioQCrb
 8BoU4uESZcCf5zortYCkrZjnvgKQg5GjgqNTfsjgTw5lkVA5YM8eh2rns6YIunK8OqOw/QkdvgT0ma8CCdnhBPGsgahzXeiXdfXRfgY/mkV5WOzBAZEfpd9U
 vb+SbID8+lHJwEiSSRcra1q8I1Gvb3hogtuZg/7YDT2sNsPC6v/BdTgAGrT530hL7wfXhdCl
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/03/2021 21:29, Ricardo Ribalda wrote:
> Take a v4l2_ext_controls instead of an array of controls, this way we
> can access the error_idx in future changes.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c |  5 ++---
>  drivers/media/usb/uvc/uvc_v4l2.c |  8 ++++++--
>  drivers/media/usb/uvc/uvcvideo.h | 10 ++++------
>  3 files changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 1ec8333811bc..fb8155ca0c0d 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1664,8 +1664,7 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
>  }
>  
>  int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
> -		      const struct v4l2_ext_control *xctrls,
> -		      unsigned int xctrls_count)
> +		      struct v4l2_ext_controls *ctrls)
>  {
>  	struct uvc_video_chain *chain = handle->chain;
>  	struct uvc_entity *entity;
> @@ -1679,7 +1678,7 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
>  	}
>  
>  	if (!rollback)
> -		uvc_ctrl_send_events(handle, xctrls, xctrls_count);
> +		uvc_ctrl_send_events(handle, ctrls->controls, ctrls->count);
>  done:
>  	mutex_unlock(&chain->ctrl_mutex);
>  	return ret;
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index ddebdeb5a81b..ea2c41b04664 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1025,6 +1025,10 @@ static int uvc_ioctl_s_ctrl(struct file *file, void *fh,
>  	struct uvc_fh *handle = fh;
>  	struct uvc_video_chain *chain = handle->chain;
>  	struct v4l2_ext_control xctrl;
> +	struct v4l2_ext_controls ctrls = {
> +		.count = 1,
> +		.controls = &xctrl,
> +	};

Rather than creating this extra ctrls struct, I think this can be simplified by just
removing uvc_ioctl_s_ctrl and uvc_ioctl_g_ctrl altogether. The v4l2-ioctl.c source
will call vidioc_g/s_ext_ctrls if the driver doesn't provide vidioc_g/s_ctrl ops.

Let's just simplify this by adding another patch before this one that just removes
uvc_ioctl_s_ctrl and uvc_ioctl_g_ctrl.

Otherwise this patch looks good.

Regards,

	Hans

>  	int ret;
>  
>  	ret = uvc_ctrl_is_accessible(chain, ctrl->id, VIDIOC_S_CTRL);
> @@ -1045,7 +1049,7 @@ static int uvc_ioctl_s_ctrl(struct file *file, void *fh,
>  		return ret;
>  	}
>  
> -	ret = uvc_ctrl_commit(handle, &xctrl, 1);
> +	ret = uvc_ctrl_commit(handle, &ctrls);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -1149,7 +1153,7 @@ static int uvc_ioctl_s_try_ext_ctrls(struct uvc_fh *handle,
>  	ctrls->error_idx = 0;
>  
>  	if (ioctl == VIDIOC_S_EXT_CTRLS)
> -		return uvc_ctrl_commit(handle, ctrls->controls, ctrls->count);
> +		return uvc_ctrl_commit(handle, ctrls);
>  	else
>  		return uvc_ctrl_rollback(handle);
>  }
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index a93aeedb5499..4e7b6da3c6d2 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -887,17 +887,15 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
>  
>  int uvc_ctrl_begin(struct uvc_video_chain *chain);
>  int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
> -		      const struct v4l2_ext_control *xctrls,
> -		      unsigned int xctrls_count);
> +		      struct v4l2_ext_controls *ctrls);
>  static inline int uvc_ctrl_commit(struct uvc_fh *handle,
> -				  const struct v4l2_ext_control *xctrls,
> -				  unsigned int xctrls_count)
> +				  struct v4l2_ext_controls *ctrls)
>  {
> -	return __uvc_ctrl_commit(handle, 0, xctrls, xctrls_count);
> +	return __uvc_ctrl_commit(handle, 0, ctrls);
>  }
>  static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
>  {
> -	return __uvc_ctrl_commit(handle, 1, NULL, 0);
> +	return __uvc_ctrl_commit(handle, 1, NULL);
>  }
>  
>  int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
> 

