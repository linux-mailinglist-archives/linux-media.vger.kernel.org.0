Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA89B6686C4
	for <lists+linux-media@lfdr.de>; Thu, 12 Jan 2023 23:21:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240256AbjALWVH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Jan 2023 17:21:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240369AbjALWUb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Jan 2023 17:20:31 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C8E552766;
        Thu, 12 Jan 2023 14:12:18 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3E575492;
        Thu, 12 Jan 2023 23:12:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673561535;
        bh=WKb7PjpijPCeADGDSLwNKrwCukiFw3bYyk+iBS8t5PE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ityaP45gJtE3/cfT9to28giYpd17HqKgcBKsVodLjzs/2avOGOUqMf9s5IEyNjal5
         TH4NDzycyjMPLXqLfE9+0itysOvluh3TmbaKzB1K1PIpm+ht7Q5mVg0wYi+KI1wF72
         8wcxySlGrVlpi+JM5CD63oNVVX9wMDusyvCdPRlM=
Date:   Fri, 13 Jan 2023 00:12:14 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/8] media: uvcvideo: Check for INACTIVE in
 uvc_ctrl_is_accessible()
Message-ID: <Y8CFvgmcqHOiE7QY@pendragon.ideasonboard.com>
References: <20220920-resend-v4l2-compliance-v3-0-598d33a15815@chromium.org>
 <20220920-resend-v4l2-compliance-v3-1-598d33a15815@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220920-resend-v4l2-compliance-v3-1-598d33a15815@chromium.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, Jan 03, 2023 at 03:36:19PM +0100, Ricardo Ribalda wrote:
> From: Hans Verkuil <hverkuil@xs4all.nl>

There's a mismatch between the From and Signed-off-by tag. Which one
should I modify to match the other ?

> Check for inactive controls in uvc_ctrl_is_accessible().
> 
> Use the new value for the master_id controls if present, otherwise
> use the existing value to determine if it is OK to set the control.
> Doing this here avoids attempting to set an inactive control, which
> will return an error from the USB device, which returns an invalid
> errorcode.
> 
> This fixes:
>   warn: v4l2-test-controls.cpp(483): s_ctrl returned EIO
>   warn: v4l2-test-controls.cpp(483): s_ctrl returned EIO
> test VIDIOC_G/S_CTRL: OK
>   warn: v4l2-test-controls.cpp(739): s_ext_ctrls returned EIO
>   warn: v4l2-test-controls.cpp(739): s_ext_ctrls returned EIO
>   warn: v4l2-test-controls.cpp(816): s_ext_ctrls returned EIO
> test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> 
> Tested with:
> v4l2-ctl -c auto_exposure=1
> OK
> v4l2-ctl -c exposure_time_absolute=251
> OK
> v4l2-ctl -c auto_exposure=3
> OK
> v4l2-ctl -c exposure_time_absolute=251
> VIDIOC_S_EXT_CTRLS: failed: Input/output error
> exposure_time_absolute: Input/output error
> ERROR
> v4l2-ctl -c auto_exposure=3,exposure_time_absolute=251,auto_exposure=1
> v4l2-ctl -C auto_exposure,exposure_time_absolute  
> auto_exposure: 1
> exposure_time_absolute: 251
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 42 +++++++++++++++++++++++++++++++++++++++-
>  drivers/media/usb/uvc/uvc_v4l2.c |  3 +--
>  drivers/media/usb/uvc/uvcvideo.h |  3 ++-
>  3 files changed, 44 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index c95a2229f4fa..6165d6b8e855 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1085,11 +1085,28 @@ static int uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
>  	return 0;
>  }
>  
> +/*
> + * Check if control @v4l2_id can be accessed by the given control @ioctl
> + * (VIDIOC_G_EXT_CTRLS, VIDIOC_TRY_EXT_CTRLS or VIDIOC_S_EXT_CTRLS).
> + *
> + * For set operations on slave controls, check if the master's value is set to
> + * manual, either in the others controls set in the same ioctl call, or from
> + * the master's current value. This catches VIDIOC_S_EXT_CTRLS calls that
> + * set both the master and slave control, such as for instance setting
> + * auto_exposure=1, exposure_time_absolute=251.
> + */
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
> +	s32 val;
> +	int ret;
> +	int i;
>  
>  	if (__uvc_query_v4l2_class(chain, v4l2_id, 0) >= 0)
>  		return -EACCES;
> @@ -1104,6 +1121,29 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
>  	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR) && !read)
>  		return -EACCES;
>  
> +	if (ioctl != VIDIOC_S_EXT_CTRLS || !mapping->master_id)
> +		return 0;
> +
> +	/*
> +	 * Iterate backwards in cases where the master control is accessed
> +	 * multiple times in the same ioctl. We want the last value.
> +	 */
> +	for (i = ctrls->count - 1; i >= 0; i--) {
> +		if (ctrls->controls[i].id == mapping->master_id)
> +			return ctrls->controls[i].value ==
> +					mapping->master_manual ? 0 : -EACCES;
> +	}
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
> index f4d4c33b6dfb..3edb54c086b2 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1020,8 +1020,7 @@ static int uvc_ctrl_check_access(struct uvc_video_chain *chain,
>  	int ret = 0;
>  
>  	for (i = 0; i < ctrls->count; ++ctrl, ++i) {
> -		ret = uvc_ctrl_is_accessible(chain, ctrl->id,
> -					    ioctl == VIDIOC_G_EXT_CTRLS);
> +		ret = uvc_ctrl_is_accessible(chain, ctrl->id, ctrls, ioctl);
>  		if (ret)
>  			break;
>  	}
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index df93db259312..a151f583cd15 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -761,7 +761,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
>  int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
>  int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
>  int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
> -			   bool read);
> +			   const struct v4l2_ext_controls *ctrls,
> +			   unsigned long ioctl);
>  
>  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>  		      struct uvc_xu_control_query *xqry);
> 

-- 
Regards,

Laurent Pinchart
