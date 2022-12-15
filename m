Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E18D564D926
	for <lists+linux-media@lfdr.de>; Thu, 15 Dec 2022 10:59:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbiLOJ74 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Dec 2022 04:59:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230178AbiLOJ7r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Dec 2022 04:59:47 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB041537F8
        for <linux-media@vger.kernel.org>; Thu, 15 Dec 2022 01:59:42 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A515327;
        Thu, 15 Dec 2022 10:59:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671098381;
        bh=OaNP2DgXtuIToN2BOOsYajVXd4wdPfiXwG+0qLGmJq4=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=kh2T/+X4HDAPPXS1YcMIAIXDGh2CIYWCQMQ/XJGMxwYreqoxDRBhsO6VZ+RliTdbi
         LQp+8WQVGdcoK3vKxydmXIrS/sdhG4CrS7TLOEG4XWr1DHU1wB/A6DP47sElHLNnMb
         tLHStEtm/HorDY9jbQmzNCp9fIz2YleklxCaF7AM=
Message-ID: <7a3e8519-a45d-7d01-4108-b99e3ab3e640@ideasonboard.com>
Date:   Thu, 15 Dec 2022 09:59:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     Yunke Cao <yunkec@google.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
References: <20221109060621.704531-1-yunkec@google.com>
 <20221109060621.704531-4-yunkec@google.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH v10 03/11] media: uvcvideo: introduce __uvc_ctrl_get_std()
In-Reply-To: <20221109060621.704531-4-yunkec@google.com>
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

Hi Yunke - thanks for the patches

On 09/11/2022 06:06, Yunke Cao wrote:
> Refactor uvc_ctrl to make adding compound control easier.
>
> Currently uvc_ctrl_get() only work for non-compound controls.
> Move the logic into uvc_ctrl_std(), return error for compound
> controls.


s/uvc_ctrl_std/__uvc_ctrl_std/. This patch does a bit more than the 
commit message outlines, so I think it could do with some fleshing out.

> Signed-off-by: Yunke Cao <yunkec@google.com>
> ---
> Changelog since v9:
> - No change.
> Changelog since v8:
> - No change.
> Changelog since v7:
> - Newly added patch. Split the refactoring of uvc_ctrl_get from v7 3/7.
>
>   drivers/media/usb/uvc/uvc_ctrl.c | 40 +++++++++++++++++++++-----------
>   1 file changed, 27 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index dfb9d1daece6..93ae7ba5d0cc 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1028,15 +1028,15 @@ static int __uvc_ctrl_load_cur(struct uvc_video_chain *chain,
>   	return ret;
>   }
>   
> -static int __uvc_ctrl_get(struct uvc_video_chain *chain,
> -			  struct uvc_control *ctrl,
> -			  struct uvc_control_mapping *mapping,
> -			  s32 *value)
> +static int __uvc_ctrl_get_std(struct uvc_video_chain *chain,
> +			      struct uvc_control *ctrl,
> +			      struct uvc_control_mapping *mapping,
> +			      s32 *value)
>   {
>   	int ret;
>   
> -	if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
> -		return -EACCES;


Why is this check being dropped here? Won't it still be needed when the 
function's called for non-compound controls?

> +	if (uvc_ctrl_mapping_is_compound(mapping))
> +		return -EINVAL;
>   
>   	ret = __uvc_ctrl_load_cur(chain, ctrl);
>   	if (ret < 0)
> @@ -1153,8 +1153,13 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>   		__uvc_find_control(ctrl->entity, mapping->master_id,
>   				   &master_map, &master_ctrl, 0);
>   	if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
> -		s32 val;
> -		int ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
> +		s32 val = 0;
> +		int ret;
> +
> +		if (uvc_ctrl_mapping_is_compound(master_map))
> +			return -EINVAL;
> +
> +		ret = __uvc_ctrl_get_std(chain, master_ctrl, master_map, &val);
>   		if (ret < 0)
>   			return ret;
>   
> @@ -1399,7 +1404,8 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
>   	if (ctrl == NULL)
>   		return;
>   
> -	if (__uvc_ctrl_get(chain, ctrl, mapping, &val) == 0)
> +	if (uvc_ctrl_mapping_is_compound(mapping) ||
> +	    __uvc_ctrl_get_std(chain, ctrl, mapping, &val) == 0)
>   		changes |= V4L2_EVENT_CTRL_CH_VALUE;
>   
>   	uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
> @@ -1566,7 +1572,8 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
>   		u32 changes = V4L2_EVENT_CTRL_CH_FLAGS;
>   		s32 val = 0;
>   
> -		if (__uvc_ctrl_get(handle->chain, ctrl, mapping, &val) == 0)
> +		if (uvc_ctrl_mapping_is_compound(mapping) ||
> +		    __uvc_ctrl_get_std(handle->chain, ctrl, mapping, &val) == 0)
>   			changes |= V4L2_EVENT_CTRL_CH_VALUE;
>   
>   		uvc_ctrl_fill_event(handle->chain, &ev, ctrl, mapping, val,
> @@ -1746,7 +1753,10 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
>   	if (ctrl == NULL)
>   		return -EINVAL;
>   
> -	return __uvc_ctrl_get(chain, ctrl, mapping, &xctrl->value);
> +	if (uvc_ctrl_mapping_is_compound(mapping))
> +		return -EINVAL;
> +	else
> +		return __uvc_ctrl_get_std(chain, ctrl, mapping, &xctrl->value);
>   }
>   
>   static int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
> @@ -1893,8 +1903,12 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>   		       ctrl->info.size);
>   	}
>   
> -	mapping->set(mapping, value,
> -		uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> +	if (!uvc_ctrl_mapping_is_compound(mapping))
> +		mapping->set(mapping, value,
> +			     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> +	else
> +		return -EINVAL;
> +
>   
>   	if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
>   		ctrl->handle = handle;
