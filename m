Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C3FF64E98D
	for <lists+linux-media@lfdr.de>; Fri, 16 Dec 2022 11:38:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbiLPKiB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Dec 2022 05:38:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229783AbiLPKiA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Dec 2022 05:38:00 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 357BC2EF22
        for <linux-media@vger.kernel.org>; Fri, 16 Dec 2022 02:37:59 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F58B570;
        Fri, 16 Dec 2022 11:37:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671187077;
        bh=tzKQumKjWm/MwEwVrSKDKtOZBrIZMcYuQke2YVJYhDc=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=CbRkCeR2pO4jpLIJp6hyjyKGiKAwlol9XAAkALpO23ENyXjAOrle9tH5uuVzqJGJB
         iy2gFWrF0qDO86IFM5dG+XPf5y/YXJJBCFZqXm/Zplp3ibeTGjjq9o5/ITE6toXMSH
         p62QvXN368IAFhPR3KpB/hp+KwNBv7XkQfB1g6ys=
Message-ID: <d67b9d52-5a12-2e24-b3d9-809a45784c8d@ideasonboard.com>
Date:   Fri, 16 Dec 2022 10:37:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v10 02/11] media: uvcvideo: add uvc_ctrl_get_boundary for
 getting default value
Content-Language: en-US
To:     Yunke Cao <yunkec@google.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
References: <20221109060621.704531-1-yunkec@google.com>
 <20221109060621.704531-3-yunkec@google.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20221109060621.704531-3-yunkec@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yunke

On 09/11/2022 06:06, Yunke Cao wrote:
> Introduce uvc_ctrl_get_boundary(), making it easier to extend to
> support compound controls and V4L2_CTRL_WHICH_MIN/MAX_VAL in the
> following patches.
>
> For now, it simply returns EINVAL for compound controls and calls
> __query_v4l2_ctrl() for non-compound controls.
>
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Yunke Cao <yunkec@google.com>
> ---
> Changelog since v9:
> - Make __uvc_ctrl_get_boundary_std() static.
> Changelog since v8:
> - No Change.
> Changelog since v7:
> - Rename uvc_ctrl_get_fixed() to uvc_ctrl_get_boundary().
> - Move refactor (introduce  __uvc_ctrl_get_boundary_std()) in this patch
>    instead of in the patch where we implement compound control.
> - Fix locking. uvc_ctrl_get_boundary() now acquires ctrl_mutex.
>    __uvc_ctrl_get_boundary_std() calls __uvc_query_v4l2_ctrl() while
>    holding the mutex.
> - Define a uvc_ctrl_mapping_is_compound() for readability.
>
>   drivers/media/usb/uvc/uvc_ctrl.c | 49 ++++++++++++++++++++++++++++++++
>   drivers/media/usb/uvc/uvc_v4l2.c |  6 +---
>   drivers/media/usb/uvc/uvcvideo.h |  2 ++
>   3 files changed, 52 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index c95a2229f4fa..dfb9d1daece6 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -837,6 +837,12 @@ static void uvc_set_le_value(struct uvc_control_mapping *mapping,
>   	}
>   }
>   
> +static bool
> +uvc_ctrl_mapping_is_compound(const struct uvc_control_mapping *mapping)
> +{
> +	return mapping->v4l2_type >= V4L2_CTRL_COMPOUND_TYPES;
> +}
> +
>   /* ------------------------------------------------------------------------
>    * Terminal and unit management
>    */
> @@ -1743,6 +1749,49 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
>   	return __uvc_ctrl_get(chain, ctrl, mapping, &xctrl->value);
>   }
>   
> +static int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
> +				       struct uvc_control *ctrl,
> +				       struct uvc_control_mapping *mapping,
> +				       u32 v4l2_which,
> +				       struct v4l2_ext_control *xctrl)


Here you define a parameter for v4l2_which, but further down...

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


...here, you're not passing it, which causes a compilation error. 
Otherwise I think the patch looks ok.

> +
> +done:
> +	mutex_unlock(&chain->ctrl_mutex);
> +	return ret;
> +}
> +
>   int uvc_ctrl_set(struct uvc_fh *handle,
>   	struct v4l2_ext_control *xctrl)
>   {
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index f4d4c33b6dfb..e807e348aa41 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1046,15 +1046,11 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
>   
>   	if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL) {
>   		for (i = 0; i < ctrls->count; ++ctrl, ++i) {
> -			struct v4l2_queryctrl qc = { .id = ctrl->id };
> -
> -			ret = uvc_query_v4l2_ctrl(chain, &qc);
> +			ret = uvc_ctrl_get_boundary(chain, ctrl);
>   			if (ret < 0) {
>   				ctrls->error_idx = i;
>   				return ret;
>   			}
> -
> -			ctrl->value = qc.default_value;
>   		}
>   
>   		return 0;
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index df93db259312..b2ee3d59a4c8 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -759,6 +759,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
>   }
>   
>   int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
> +int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
> +			  struct v4l2_ext_control *xctrl);
>   int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
>   int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
>   			   bool read);
