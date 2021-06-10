Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5C7D3A31AC
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 19:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbhFJRHl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 13:07:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbhFJRHk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 13:07:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1096C061574;
        Thu, 10 Jun 2021 10:05:43 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 501A68D4;
        Thu, 10 Jun 2021 19:05:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623344742;
        bh=hC0zTkxGKY1Fw6li2Kpb85k/zv0nOvbkNQ3leiAXUj8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Pie8zyexvtxtKATK9Ab2IYb2am5Tu2xAoKAdvTOBr6frSZUCIH82CzVwBipfHpxfW
         +oTXl6jykxn2e/IGxWzJ1q6bF/0lyc6fIQpwH/zPiIoH0wy6szQFNHcUGrr3OTlAE0
         XBhs9OXxv4jC744phIJ6L8rWlwHBL5li/5WWRaII=
Date:   Thu, 10 Jun 2021 20:05:23 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Subject: Re: [PATCH v9 15/22] media: uvcvideo: Set error_idx during
 ctrl_commit errors
Message-ID: <YMJGU65navuuEjnA@pendragon.ideasonboard.com>
References: <20210326095840.364424-1-ribalda@chromium.org>
 <20210326095840.364424-16-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210326095840.364424-16-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Fri, Mar 26, 2021 at 10:58:33AM +0100, Ricardo Ribalda wrote:
> If we have an error setting a control, return the affected control in
> the error_idx field.
> 
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
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

s/uvc_ctrl_find_ctrlidx/uvc_ctrl_find_ctrl_idx/

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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

-- 
Regards,

Laurent Pinchart
