Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4755B3F4269
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 01:40:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233176AbhHVXl1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Aug 2021 19:41:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229969AbhHVXl0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Aug 2021 19:41:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30DF7C061575;
        Sun, 22 Aug 2021 16:40:45 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A5BBE4A3;
        Mon, 23 Aug 2021 01:40:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1629675643;
        bh=WV6CUoKtKPNTO37eAv9So3B3tYUu9tZ/uxw3Yf1fpls=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nqbeyIhAzGFeZuafXR1UZEhLv+iihuUOYb3ATs0x6o4zYhz0q6M8r+fPlyjUQHtMC
         Gyly7cs92MJTsZ+a5U0GqNAMW7SHJ8KOb4BMh7Kg6+xHLF/hajFA9F/LMeKHPttecu
         VKcuiOmNcRTWmUgaVSPhLgLsTmMePdrio0FEetCg=
Date:   Mon, 23 Aug 2021 02:40:34 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Hans Verkuil <hans.verkuil@cisco.com>
Subject: Re: [PATCH v10 17/21] uvcvideo: uvc_ctrl_is_accessible: check for
 INACTIVE
Message-ID: <YSLgcmfOuCmnZOf8@pendragon.ideasonboard.com>
References: <20210618122923.385938-1-ribalda@chromium.org>
 <20210618122923.385938-18-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210618122923.385938-18-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo and Hans,

Thank you for the patch.

On Fri, Jun 18, 2021 at 02:29:19PM +0200, Ricardo Ribalda wrote:
> From: Hans Verkuil <hverkuil@xs4all.nl>
> 
> Check for inactive controls in uvc_ctrl_is_accessible().
> Use the new value for the master_id controls if present,
> otherwise use the existing value to determine if it is OK
> to set the control. Doing this here avoids attempting to
> set an inactive control, which will return an error from the
> USB device.

Could you please explain in the commit message why this is better than
handling the error ?

> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 28 +++++++++++++++++++++++++++-
>  drivers/media/usb/uvc/uvc_v4l2.c |  4 ++--
>  drivers/media/usb/uvc/uvcvideo.h |  3 ++-
>  3 files changed, 31 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index dd6ebcc7344a..11c25d4b5c20 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1043,10 +1043,18 @@ static int uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
>  }
>  

As this function is starting to get large and do many things, a short
comment here to document it would be useful (it doesn't need to be
kerneldoc).

>  int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
> -			   bool read)
> +			   const struct v4l2_ext_controls *ctrls,
> +			   unsigned long ioctl)
>  {
> +	struct uvc_control_mapping *master_map = NULL;
> +	struct uvc_control *master_ctrl = NULL;
>  	struct uvc_control_mapping *mapping;
>  	struct uvc_control *ctrl;
> +	bool read = ioctl == VIDIOC_G_EXT_CTRLS;
> +	bool try = ioctl == VIDIOC_TRY_EXT_CTRLS;
> +	s32 val;
> +	int ret;
> +	int i;
>  
>  	if (__uvc_query_v4l2_class(chain, v4l2_id, 0) >= 0)
>  		return -EACCES;
> @@ -1061,6 +1069,24 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
>  	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR) && !read)
>  		return -EACCES;
>  
> +	if (read || try || !mapping->master_id)
> +		return 0;
> +
> +	for (i = ctrls->count - 1; i >= 0; i--)

Is there a particular reason to iterate backwards ? If so, please add a
comment to explain why.

> +		if (ctrls->controls[i].id == mapping->master_id)
> +			return ctrls->controls[i].value ==
> +					mapping->master_manual ? 0 : -EACCES;

Curly braces for the for loop would be nice.

If I understand this correctly, this allows setting a manual control if
the same VIDIOC_S_EXT_CTRLS call sets the master control to manual mode,
regardless of the current value. Does the driver guarantee that the
master control will be set in the device before the manual control ?
Otherwise the device will still return an error.

> +
> +	__uvc_find_control(ctrl->entity, mapping->master_id, &master_map,
> +			   &master_ctrl, 0);
> +
> +	if (!master_ctrl || !(master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
> +		return 0;
> +
> +	ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
> +	if (ret >= 0 && val != mapping->master_manual)
> +		return -EACCES;
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 8d8b12a4db34..0f4d893eff46 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1000,8 +1000,8 @@ static int uvc_ctrl_check_access(struct uvc_video_chain *chain,
>  	int ret = 0;
>  
>  	for (i = 0; i < ctrls->count; ++ctrl, ++i) {
> -		ret = uvc_ctrl_is_accessible(chain, ctrl->id,
> -					    ioctl == VIDIOC_G_EXT_CTRLS);
> +		ret = uvc_ctrl_is_accessible(chain, ctrl->id, ctrls,
> +					    ioctl);
>  		if (ret)
>  			break;
>  	}
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 2e5366143b81..fd4f5ef47dfb 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -900,7 +900,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
>  int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
>  int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
>  int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
> -			   bool read);
> +			   const struct v4l2_ext_controls *ctrls,
> +			   unsigned long ioctl);
>  
>  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>  		      struct uvc_xu_control_query *xqry);

-- 
Regards,

Laurent Pinchart
