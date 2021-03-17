Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD26733EECB
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 11:51:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231186AbhCQKu4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Mar 2021 06:50:56 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:41149 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230398AbhCQKuX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Mar 2021 06:50:23 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id MTkolAEONGEYcMTkrlNBQS; Wed, 17 Mar 2021 11:50:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615978221; bh=HDLBDtP1kmCoC2/kdEylUtm0VS0JBOE6TjJ6fxXIcCc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=uGccAMKFMD4OmYbAnG4RajJ+QReIGsI+1WPMdtBxg6Qz/p7DuZoxg1yzDZ0QMtSgV
         dLgQbHl8mD8uDP2PD6DDhfvIxHibAnT7SdxeYCvHz9IMcYnxT8i2yZCRwRjXJBJi38
         o5UScuYoncmGiSXP/3+mEnbCwDs0SSZ+LS8bHrFk5DXAA9dvBfJ6rYW7ZJJLQ9iQGu
         xtfAdJsGdFUYlGCpDzWltWHQoq0fDKI+mubsyw6e+QLkZfK1el4PxtxbQOdiMHSb6A
         Mxm+ukIttBjQtYuwIMzHgx4LOr32YzA0bioxUXpkOvjjTKG7Vo0AdZKLSzJUrUna5p
         0HOxaYGJIQ2Aw==
Subject: Re: [PATCH v5 04/13] media: uvcvideo: Check controls flags before
 accessing them
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
References: <20210316180004.1605727-1-ribalda@chromium.org>
 <20210316180004.1605727-5-ribalda@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <f6f6c59b-f55f-4415-13ee-dca777ed44ab@xs4all.nl>
Date:   Wed, 17 Mar 2021 11:50:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210316180004.1605727-5-ribalda@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfAgxyYhgbHhiy0bhr3ZuBsTp8VZlyfdcvhwJedolFkzyPBZ7o+9RiNIrZaWVDsC0Wxb+7Kr0pKyq9No3UgvU32FVdhbgaKIp3UzFi0aRIeBla7WxOckd
 Et1RvD6ATGhCknG4oTcjcZsgik3BIh2xB1uQY28tunoxwszRsusTP+ZMb08c1pllOooQaExEcCMbjnAxWsYt6gAVHrGsQ7aCvw0gbfWpRm8kDZ0NhHpSOSaf
 TWzcvgJmtjPZsaSyJ8oi6cPX1SnLPLC5V6xI+T9HRoiyrUB5+CV+gLi+sPcl+2Vyr6hhhbkq1RouGdDZZWfLBo03Qeycnl9EkyMTDrnRrclY5Oblx1oBhwlq
 5k3cVZfhb0Jstr9XvB3XlhbMi7tgdOSlLsnZ19erK+9YoF7hTkGd2RcUOSefYbbGO7T1MA75
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/03/2021 18:59, Ricardo Ribalda wrote:
> We can figure out if reading/writing a set of controls can fail without
> accessing them by checking their flags.
> 
> This way we can honor the API closer:
> 
> If an error is found when validating the list of controls passed with
> VIDIOC_G_EXT_CTRLS, then error_idx shall be set to ctrls->count to
> indicate to userspace that no actual hardware was touched.
> 
> Fixes v4l2-compliance:
> Control ioctls (Input 0):
> 		warn: v4l2-test-controls.cpp(765): g_ext_ctrls(0) invalid error_idx 0
>                 fail: v4l2-test-controls.cpp(645): invalid error index write only control
>         test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 69 +++++++++++++++++++++++---------
>  1 file changed, 51 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 157310c0ca87..e956d833ed84 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1040,31 +1040,54 @@ static int uvc_ioctl_s_ctrl(struct file *file, void *fh,
>  	return 0;
>  }
>  
> -static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
> -				 struct v4l2_ext_controls *ctrls)
> +static int uvc_ctrl_check_access(struct uvc_video_chain *chain,
> +				 struct v4l2_ext_controls *ctrls, bool read)
>  {
> -	struct uvc_fh *handle = fh;
> -	struct uvc_video_chain *chain = handle->chain;
>  	struct v4l2_ext_control *ctrl = ctrls->controls;
>  	unsigned int i;
> -	int ret;
> +	int ret = 0;
>  
> -	if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL) {
> -		for (i = 0; i < ctrls->count; ++ctrl, ++i) {
> -			struct v4l2_queryctrl qc = { .id = ctrl->id };
> +	for (i = 0; i < ctrls->count; ++ctrl, ++i) {
> +		struct v4l2_queryctrl qc = { .id = ctrl->id };
>  
> -			ret = uvc_query_v4l2_ctrl(chain, &qc);
> -			if (ret < 0) {
> -				ctrls->error_idx = i;
> -				return ret;
> -			}
> +		ret = uvc_query_v4l2_ctrl(chain, &qc);

You can't call this. If I am not mistaken, this call can actually call
the hardware.

Instead you need to call the lower level function uvc_find_control() and
use ctrl->info to check for read/write only.

> +		if (ret < 0)
> +			break;
>  
> +		if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL) {
>  			ctrl->value = qc.default_value;

This needs to use the old code in uvc_ioctl_g_ext_ctrls() since it depends
on uvc_query_v4l2_ctrl() which accesses the hardware.

> +			continue;
>  		}
>  
> -		return 0;
> +		if (qc.flags & V4L2_CTRL_FLAG_WRITE_ONLY && read) {
> +			ret = -EACCES;
> +			break;
> +		}
> +
> +		if (qc.flags & V4L2_CTRL_FLAG_READ_ONLY && !read) {
> +			ret = -EACCES;
> +			break;
> +		}
>  	}
>  
> +	ctrls->error_idx = ctrls->count;
> +
> +	return ret;
> +}

So uvc_ctrl_check_access() is a good idea, but it does a bit too much.
It should just check if all controls in the list are known and check for
write/read only.

Regards,

	Hans

> +
> +static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
> +				 struct v4l2_ext_controls *ctrls)
> +{
> +	struct uvc_fh *handle = fh;
> +	struct uvc_video_chain *chain = handle->chain;
> +	struct v4l2_ext_control *ctrl = ctrls->controls;
> +	unsigned int i;
> +	int ret;
> +
> +	ret = uvc_ctrl_check_access(chain, ctrls, true);
> +	if (ret < 0 || ctrls->which == V4L2_CTRL_WHICH_DEF_VAL)
> +		return ret;
> +
>  	ret = uvc_ctrl_begin(chain);
>  	if (ret < 0)
>  		return ret;
> @@ -1092,10 +1115,6 @@ static int uvc_ioctl_s_try_ext_ctrls(struct uvc_fh *handle,
>  	unsigned int i;
>  	int ret;
>  
> -	/* Default value cannot be changed */
> -	if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL)
> -		return -EINVAL;
> -
>  	ret = uvc_ctrl_begin(chain);
>  	if (ret < 0)
>  		return ret;
> @@ -1121,6 +1140,16 @@ static int uvc_ioctl_s_ext_ctrls(struct file *file, void *fh,
>  				 struct v4l2_ext_controls *ctrls)
>  {
>  	struct uvc_fh *handle = fh;
> +	struct uvc_video_chain *chain = handle->chain;
> +	int ret;
> +
> +	/* Default value cannot be changed */
> +	if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL)
> +		return -EINVAL;
> +
> +	ret = uvc_ctrl_check_access(chain, ctrls, false);
> +	if (ret < 0)
> +		return ret;
>  
>  	return uvc_ioctl_s_try_ext_ctrls(handle, ctrls, true);
>  }
> @@ -1130,6 +1159,10 @@ static int uvc_ioctl_try_ext_ctrls(struct file *file, void *fh,
>  {
>  	struct uvc_fh *handle = fh;
>  
> +	/* Default value cannot be changed */
> +	if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL)
> +		return -EINVAL;
> +
>  	return uvc_ioctl_s_try_ext_ctrls(handle, ctrls, false);
>  }
>  
> 

