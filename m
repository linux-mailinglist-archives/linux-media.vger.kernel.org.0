Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AD563A3085
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 18:24:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231308AbhFJQ0f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 12:26:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231243AbhFJQ0e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 12:26:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F16BC061574;
        Thu, 10 Jun 2021 09:24:38 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 08BE88D4;
        Thu, 10 Jun 2021 18:24:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623342277;
        bh=JfU/pRNhplAa/oyIR0IJ6eHe2ovYrkWhAcA4t+Jp4oM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DZD79K1YfZ25DhAPkYWKm/v0zunIxCDCKRhtOv5SI/bmEsIu5dElgDU/hYHgJMik4
         TNGyJwPuqWT8VDKPBdTIZCmcOl9J7DnynFpJTbWuJ1aWTUDWrJjt0TOhKExUbHvlNE
         q7eINXy15fob2BZ5O8r1VlWJfpCC1M3gzXVkjfTY=
Date:   Thu, 10 Jun 2021 19:24:18 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Subject: Re: [PATCH v9 05/22] media: uvcvideo: Remove s_ctrl and g_ctrl
Message-ID: <YMI8sncgcBhBuia+@pendragon.ideasonboard.com>
References: <20210326095840.364424-1-ribalda@chromium.org>
 <20210326095840.364424-6-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210326095840.364424-6-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Fri, Mar 26, 2021 at 10:58:23AM +0100, Ricardo Ribalda wrote:
> If we do not implement these callbacks the framework will call the
> ext_ctrl callbaks instead, which are a superset of this functions.
> 
> Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 56 --------------------------------
>  1 file changed, 56 deletions(-)

Nice diffstat.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 47b0e3224205..ac98869d5a05 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -983,60 +983,6 @@ static int uvc_ioctl_query_ext_ctrl(struct file *file, void *fh,
>  	return 0;
>  }
>  
> -static int uvc_ioctl_g_ctrl(struct file *file, void *fh,
> -			    struct v4l2_control *ctrl)
> -{
> -	struct uvc_fh *handle = fh;
> -	struct uvc_video_chain *chain = handle->chain;
> -	struct v4l2_ext_control xctrl;
> -	int ret;
> -
> -	memset(&xctrl, 0, sizeof(xctrl));
> -	xctrl.id = ctrl->id;
> -
> -	ret = uvc_ctrl_begin(chain);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret = uvc_ctrl_get(chain, &xctrl);
> -	uvc_ctrl_rollback(handle);
> -	if (ret < 0)
> -		return ret;
> -
> -	ctrl->value = xctrl.value;
> -	return 0;
> -}
> -
> -static int uvc_ioctl_s_ctrl(struct file *file, void *fh,
> -			    struct v4l2_control *ctrl)
> -{
> -	struct uvc_fh *handle = fh;
> -	struct uvc_video_chain *chain = handle->chain;
> -	struct v4l2_ext_control xctrl;
> -	int ret;
> -
> -	memset(&xctrl, 0, sizeof(xctrl));
> -	xctrl.id = ctrl->id;
> -	xctrl.value = ctrl->value;
> -
> -	ret = uvc_ctrl_begin(chain);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret = uvc_ctrl_set(handle, &xctrl);
> -	if (ret < 0) {
> -		uvc_ctrl_rollback(handle);
> -		return ret;
> -	}
> -
> -	ret = uvc_ctrl_commit(handle, &xctrl, 1);
> -	if (ret < 0)
> -		return ret;
> -
> -	ctrl->value = xctrl.value;
> -	return 0;
> -}
> -
>  static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
>  				 struct v4l2_ext_controls *ctrls)
>  {
> @@ -1522,8 +1468,6 @@ const struct v4l2_ioctl_ops uvc_ioctl_ops = {
>  	.vidioc_s_input = uvc_ioctl_s_input,
>  	.vidioc_queryctrl = uvc_ioctl_queryctrl,
>  	.vidioc_query_ext_ctrl = uvc_ioctl_query_ext_ctrl,
> -	.vidioc_g_ctrl = uvc_ioctl_g_ctrl,
> -	.vidioc_s_ctrl = uvc_ioctl_s_ctrl,
>  	.vidioc_g_ext_ctrls = uvc_ioctl_g_ext_ctrls,
>  	.vidioc_s_ext_ctrls = uvc_ioctl_s_ext_ctrls,
>  	.vidioc_try_ext_ctrls = uvc_ioctl_try_ext_ctrls,

-- 
Regards,

Laurent Pinchart
