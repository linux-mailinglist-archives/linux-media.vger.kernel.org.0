Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5710342C78
	for <lists+linux-media@lfdr.de>; Sat, 20 Mar 2021 12:46:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbhCTLpw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Mar 2021 07:45:52 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:58353 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230176AbhCTLp0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Mar 2021 07:45:26 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id NW0sldpNT4XAGNW0vlQ9jJ; Sat, 20 Mar 2021 08:27:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616225233; bh=PBhLflZ/8/O2+7mODlnn1WAfyTmnPRSFYDvLrds2jBw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=mlx3OUjm/MGAiY+3BIr9Am3jApFxraUJT+unHZy4ZlKl+9osUiMc9SRl0q9PZUKlz
         l9yZ/csxPrb99donp+BXH46aQh6IYL+3gV8s/cSIgl6N/KceE5ZxhJzfmivleIBN6m
         uooOVINI1MkNSR/vr6npKX0sR4VaU96yL9b7VaXV94wcPPMOls5kmBcHfIn9lONzVK
         mveP/UITLp4ZibMgkPvWimxRTacZn5Hl0+EeReMO/NpX9ABvzGLpXZFqqW1VDTzCGL
         Rl+MrndB86kX/6oFW6ZIZSY6ONcXF+nMnUC9YWZgcLJDuFni+G+UdvWvSwxSbKTrpJ
         UZK2OQn8jNmfQ==
Subject: Re: [PATCH v8 15/19] media: uvcvideo: Set error_idx during
 ctrl_commit errors
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
References: <20210319170906.278238-1-ribalda@chromium.org>
 <20210319170906.278238-16-ribalda@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <e39dd9b3-7af1-28a3-0a2b-0969a2aba751@xs4all.nl>
Date:   Sat, 20 Mar 2021 08:27:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210319170906.278238-16-ribalda@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMHx8dx0xQh5/aCEXL9gUt9N4a5215T4kOXiAFkOJ5VXqDjMDknEWxCl2A3Av/TldLMb7k0NcJ4QjPa52axgVYAxMb3R2LuY3NWr6EomKa/mYVXKE0hN
 L8sAtie/+9Ty5aWHrRzi8Yo/JZRLs1q78tPW34hGTuWbAgCuNHwN6x4NdH07IQkxnygSH8OSrn/nzaFjv/JkJHoBT2RP32SglniW8dNL0+dCU+IGDZAgCxnQ
 ulDWJTVV6JYWiSvVn5zTJhIOW1duhsyXXb5NLt56izb54SD6rB2dBRV40pTgL2ee+iPT9Eax4f3ablQauDoMrYiE1b3ek7O9VDafKhKFuUfuJHhlJICsI26x
 Pja1+vWCmORNIWwmmqz9Bt8tHcvFyFaNXMg8m+lTbyfTwxzmZ7SP2nl20viZWW5BUHicqDdj
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/03/2021 18:09, Ricardo Ribalda wrote:
> If we have an error setting a control, return the affected control in
> the error_idx field.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 42 ++++++++++++++++++++++++++------
>  drivers/media/usb/uvc/uvc_v4l2.c |  2 +-
>  drivers/media/usb/uvc/uvcvideo.h | 10 +++-----
>  3 files changed, 40 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 24fd5afc4e4f..bcebf9d1a46f 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1586,7 +1586,7 @@ int uvc_ctrl_begin(struct uvc_video_chain *chain)
>  }
>  
>  static int uvc_ctrl_commit_entity(struct uvc_device *dev,
> -	struct uvc_entity *entity, int rollback)
> +	struct uvc_entity *entity, int rollback, struct uvc_control **err_ctrl)
>  {
>  	struct uvc_control *ctrl;
>  	unsigned int i;
> @@ -1628,31 +1628,59 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
>  
>  		ctrl->dirty = 0;
>  
> -		if (ret < 0)
> +		if (ret < 0) {
> +			if (err_ctrl)
> +				*err_ctrl = ctrl;
>  			return ret;
> +		}
>  	}
>  
>  	return 0;
>  }
>  
> +static int uvc_ctrl_find_ctrlidx(struct uvc_entity *entity,
> +				 struct v4l2_ext_controls *ctrls,
> +				 struct uvc_control *uvc_control)
> +{
> +	struct uvc_control_mapping *mapping;
> +	struct uvc_control *ctrl_found;
> +	unsigned int i;
> +
> +	if (!entity)
> +		return ctrls->count;
> +
> +	for (i = 0; i < ctrls->count; i++) {
> +		__uvc_find_control(entity, ctrls->controls[i].id, &mapping,
> +				   &ctrl_found, 0);
> +		if (uvc_control == ctrl_found)
> +			return i;
> +	}
> +
> +	return ctrls->count;
> +}
> +
>  int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
> -		      const struct v4l2_ext_control *xctrls,
> -		      unsigned int xctrls_count)
> +		      struct v4l2_ext_controls *ctrls)
>  {
>  	struct uvc_video_chain *chain = handle->chain;
> +	struct uvc_control *err_ctrl;
>  	struct uvc_entity *entity;
>  	int ret = 0;
>  
>  	/* Find the control. */
>  	list_for_each_entry(entity, &chain->entities, chain) {
> -		ret = uvc_ctrl_commit_entity(chain->dev, entity, rollback);
> +		ret = uvc_ctrl_commit_entity(chain->dev, entity, rollback,
> +					     &err_ctrl);
>  		if (ret < 0)
>  			goto done;
>  	}
>  
>  	if (!rollback)
> -		uvc_ctrl_send_events(handle, xctrls, xctrls_count);
> +		uvc_ctrl_send_events(handle, ctrls->controls, ctrls->count);
>  done:
> +	if (ret < 0 && ctrls)
> +		ctrls->error_idx = uvc_ctrl_find_ctrlidx(entity, ctrls,
> +							 err_ctrl);
>  	mutex_unlock(&chain->ctrl_mutex);
>  	return ret;
>  }
> @@ -2110,7 +2138,7 @@ int uvc_ctrl_restore_values(struct uvc_device *dev)
>  			ctrl->dirty = 1;
>  		}
>  
> -		ret = uvc_ctrl_commit_entity(dev, entity, 0);
> +		ret = uvc_ctrl_commit_entity(dev, entity, 0, NULL);
>  		if (ret < 0)
>  			return ret;
>  	}
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index a3ee1dc003fc..8d8b12a4db34 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1088,7 +1088,7 @@ static int uvc_ioctl_s_try_ext_ctrls(struct uvc_fh *handle,
>  	ctrls->error_idx = 0;
>  
>  	if (ioctl == VIDIOC_S_EXT_CTRLS)
> -		return uvc_ctrl_commit(handle, ctrls->controls, ctrls->count);
> +		return uvc_ctrl_commit(handle, ctrls);
>  	else
>  		return uvc_ctrl_rollback(handle);
>  }
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 9471c342a310..0313b30f0cea 100644
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

