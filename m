Return-Path: <linux-media+bounces-1978-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D27F80A705
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 16:13:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 190AB1F21457
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 15:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2217C241EF;
	Fri,  8 Dec 2023 15:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="flQk3TJ1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8767E2114
	for <linux-media@vger.kernel.org>; Fri,  8 Dec 2023 07:13:33 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 49244512;
	Fri,  8 Dec 2023 16:12:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702048370;
	bh=8R0a2UuqpESXTtdfvmqmU/ucjMUO42qfXTbp1GwXsVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=flQk3TJ1t2xF/F8eAiTVXYpCVvgGgYCWjSA81Sqjde1qGKDXYdo1FUP8bZBf58UU5
	 jkpT77tHXeiB/IUtH2ZTVnJ0DQiUXeC3eqwfSTxYEgjqAcLPhzscWfbYwWTR1WxBIP
	 De59P3rHTWoAgK1PWBiqTULr/6SVgvekydHBsbj0=
Date: Fri, 8 Dec 2023 17:13:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Yunke Cao <yunkec@google.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH v14 02/11] media: uvcvideo: add uvc_ctrl_get_boundary for
 getting default value
Message-ID: <20231208151339.GH25616@pendragon.ideasonboard.com>
References: <20231201071907.3080126-1-yunkec@google.com>
 <20231201071907.3080126-3-yunkec@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231201071907.3080126-3-yunkec@google.com>

Hi Yunke,

Thank you for the patch.

On Fri, Dec 01, 2023 at 04:18:53PM +0900, Yunke Cao wrote:
> Introduce uvc_ctrl_get_boundary(), making it easier to extend to
> support compound controls and V4L2_CTRL_WHICH_MIN/MAX_VAL in the
> following patches.
> 
> For now, it simply returns EINVAL for compound controls and calls
> __query_v4l2_ctrl() for non-compound controls.
> 
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Signed-off-by: Yunke Cao <yunkec@google.com>
> ---
> An alternative name is uvc_ctrl_get_static(). Let me know if that's better.

The name of the new function is weird in this patch, as it returns the
default value for the control. How about calling it
uvc_ctrl_get_default() here, and renaming it later when you extend it
with an additional argument in patch 08/11 ? All users of the function
are modified in that patch, so renaming the function there won't add
much churn.

> Changelog since v11:
> - No change.
> Changelog since v10:
> - Fix __uvc_ctrl_get_boundary_std() typo causing build error.
> - Added Reviewed-by from Sergey.
> Changelog since v9:
> - Make __uvc_ctrl_get_boundary_std() static.
> Changelog since v8:
> - No Change.
> Changelog since v7:
> - Rename uvc_ctrl_get_fixed() to uvc_ctrl_get_boundary().
> - Move refactor (introduce  __uvc_ctrl_get_boundary_std()) in this patch
>   instead of in the patch where we implement compound control.
> - Fix locking. uvc_ctrl_get_boundary() now acquires ctrl_mutex.
>   __uvc_ctrl_get_boundary_std() calls __uvc_query_v4l2_ctrl() while
>   holding the mutex.
> - Define a uvc_ctrl_mapping_is_compound() for readability.
> 
>  drivers/media/usb/uvc/uvc_ctrl.c | 48 ++++++++++++++++++++++++++++++++
>  drivers/media/usb/uvc/uvc_v4l2.c |  6 +---
>  drivers/media/usb/uvc/uvcvideo.h |  2 ++
>  3 files changed, 51 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index e59a463c2761..8d8333786333 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -884,6 +884,12 @@ static void uvc_set_le_value(struct uvc_control_mapping *mapping,
>  	}
>  }
>  
> +static bool
> +uvc_ctrl_mapping_is_compound(const struct uvc_control_mapping *mapping)
> +{
> +	return mapping->v4l2_type >= V4L2_CTRL_COMPOUND_TYPES;
> +}
> +
>  /* ------------------------------------------------------------------------
>   * Terminal and unit management
>   */
> @@ -1880,6 +1886,48 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
>  	return __uvc_ctrl_get(chain, ctrl, mapping, &xctrl->value);
>  }
>  
> +static int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
> +				       struct uvc_control *ctrl,
> +				       struct uvc_control_mapping *mapping,
> +				       struct v4l2_ext_control *xctrl)
> +{
> +	struct v4l2_queryctrl qc = { .id = xctrl->id };
> +
> +	int ret = __uvc_query_v4l2_ctrl(chain, ctrl, mapping, &qc);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	xctrl->value = qc.default_value;
> +	return 0;
> +}
> +
> +int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
> +			  struct v4l2_ext_control *xctrl)
> +{
> +	struct uvc_control *ctrl;
> +	struct uvc_control_mapping *mapping;
> +	int ret;
> +
> +	if (mutex_lock_interruptible(&chain->ctrl_mutex))
> +		return -ERESTARTSYS;
> +
> +	ctrl = uvc_find_control(chain, xctrl->id, &mapping);
> +	if (!ctrl) {
> +		ret = -EINVAL;
> +		goto done;
> +	}
> +
> +	if (uvc_ctrl_mapping_is_compound(mapping))
> +		ret = -EINVAL;
> +	else
> +		ret = __uvc_ctrl_get_boundary_std(chain, ctrl, mapping, xctrl);
> +
> +done:
> +	mutex_unlock(&chain->ctrl_mutex);
> +	return ret;
> +}
> +
>  int uvc_ctrl_set(struct uvc_fh *handle,
>  	struct v4l2_ext_control *xctrl)
>  {
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index f4988f03640a..5a88847bfbfe 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1096,15 +1096,11 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
>  
>  	if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL) {
>  		for (i = 0; i < ctrls->count; ++ctrl, ++i) {
> -			struct v4l2_queryctrl qc = { .id = ctrl->id };
> -
> -			ret = uvc_query_v4l2_ctrl(chain, &qc);
> +			ret = uvc_ctrl_get_boundary(chain, ctrl);
>  			if (ret < 0) {
>  				ctrls->error_idx = i;
>  				return ret;
>  			}
> -
> -			ctrl->value = qc.default_value;
>  		}
>  
>  		return 0;
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 6fb0a78b1b00..5091085fcfb0 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -781,6 +781,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
>  }
>  
>  int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
> +int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
> +			  struct v4l2_ext_control *xctrl);
>  int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
>  int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
>  			   const struct v4l2_ext_controls *ctrls,

-- 
Regards,

Laurent Pinchart

