Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5002342C6F
	for <lists+linux-media@lfdr.de>; Sat, 20 Mar 2021 12:44:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbhCTLoQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Mar 2021 07:44:16 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:53457 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229985AbhCTLnq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Mar 2021 07:43:46 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id NVzGldor64XAGNVzJlQ9Xs; Sat, 20 Mar 2021 08:25:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616225134; bh=bpAArK+nDcnOESnhwHebWypeJwhDWWbnY325wdMTmBE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=wYDQpJNGAicOhhV1XrL2OvUvW0tc0CpUGCSV5SANffL2elLBlBULXDw5T8eWXvI9w
         PRnsllB6OC3lthyY+IxzxCw5+FQJ1W/ry7jST9gDaRvNbkr18tL++b0Rs60SaRt5lr
         YJspX73lSBDvddp3avDl9PGY4zfMtMJlXyQpviqn8ODSKGuxLSf+DyeluSNVRldsaA
         +/AgxqU2oGO2haI/JityNpq7OIIJl/stpDCfq7qVgeKgrnYqlxG1OHeMUlDhUBKn+L
         BUIIYjIpQJ+fn41fj8bb9pi3UeSUtBevPuaTmTDsIS/vF52XnOlLzJrE0cdMFnXbWU
         Z3wtSXNGQSkRA==
Subject: Re: [PATCH v8 05/19] media: uvcvideo: Remove s_ctrl and g_ctrl
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
References: <20210319170906.278238-1-ribalda@chromium.org>
 <20210319170906.278238-6-ribalda@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <a9fb5f3f-5a2c-a43a-3964-284e7abb89c1@xs4all.nl>
Date:   Sat, 20 Mar 2021 08:25:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210319170906.278238-6-ribalda@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfF+/alibnzOlOh/P7sSBxojv6+RjGuzrKbhngbCujSZMk3bXBhtpAq+ARJVQ5ye60HqeJJO3lmYTYUE/0RzZdS60COx5YQtJYTmp1sGqLb6+YbtLOVT3
 +MZhWdi0OFYuLT4MSIjaYu3EIj7P7x0aRsoagulUk1At2i/NefQ7hS0nBLc0ELv1BrPztwXAgZ2Yv5GlKhH0is5F2vccx/Uy45u2DH41XUVH4DFEA3rnD83n
 fOJV3xMxmzFfbkbFpon2pnqme4l5zg4woNDd2xydp35GDHYyDtFp8BOwEEl78eewM+LVfbM0lTJU+qVj6Xv+roptJvef67DnwRDd4x1THwAmVKgE+P3t7pgm
 OP8TVq4ojkfsbMuSeZI3BXbVF0WlBb0pRRThYWvUeZfU9qyoiM33R7XJBOAld1fdvyvoAqmW
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/03/2021 18:08, Ricardo Ribalda wrote:
> If we do not implement these callback the framework will call the ext_ctrl
> callbaks instead, which are a superset of this functions.

callbaks -> callbacks

With that changed you can add my:

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> 
> Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 56 --------------------------------
>  1 file changed, 56 deletions(-)
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
> 

