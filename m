Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BA8434003F
	for <lists+linux-media@lfdr.de>; Thu, 18 Mar 2021 08:28:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229600AbhCRH15 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 03:27:57 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:36585 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229454AbhCRH1f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 03:27:35 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Mn45lHgcWDUxpMn49lhyrD; Thu, 18 Mar 2021 08:27:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616052453; bh=B+V7aOuFTru4IgleLpXfnk9Zd0MWyFMNnsii0CcXtOE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=aHwkkk2kdSJO7TO/lnaYAMK0vDOBBU8tyzAbS/sNP1QOeaugc/vpXjFwzoYvMP+I2
         xRCQ7RV77q0+C97jSQwMGkVrwJFIyn2vnNdrPsj0WItBVFHZBHKB8VCiI/fm2+FbR1
         XAmFCBT4r/aMaVokjRRrIeIvJYI1b1dhHrkopfQyH7kRCnUinqj6od44Wq1QckMaH1
         59m3Nn4jqEJyRhUf3vN+toFuT4FTlNKuiF+YafU42VXDtvZAxFfQjs158bO6KDZ1Tk
         oMGD1uR1vef2q+/Mo6BLQdRkkmgf/CfN+W2qRbwo25aDpaAdPd+maToIdm6Qz49YtE
         lBlUitteT1z3g==
Subject: Re: [PATCH v6 15/17] media: uvcvideo: Check controls flags before
 accessing them
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
References: <20210317164511.39967-1-ribalda@chromium.org>
 <20210317164511.39967-16-ribalda@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <7e5bd33c-66a5-6a55-85b3-6fe3743a8e06@xs4all.nl>
Date:   Thu, 18 Mar 2021 08:27:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210317164511.39967-16-ribalda@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCF0gcx4lNy0jcB+OE5yrQ0d78yBJtC9b82JgTQp/76TfiyB6Zue8ySOHrEFUQA6/Xc6I/0rdVdcDKxkg5txqElV5+okCBrYPGIbbARUM7RwjY+J0tcu
 qTBGlgbkrxBOdi0AJ3WX18Izuhw4Io1HC1WQrW1EVrmK844vIwfuX5FsMH6RfS1aqHh2e65iRUIoW9+GnGrUWyE+taOhLRg/StKY3+3fkDPwtDbNsfbxRZ9h
 s64wKcQBkDuhMQuwjBra0O4egUWXAjCwLe8SL0iTWqbKtEqVSGuuiPeOc8gtY6Dd2bcUsiNfzKFB35MuS6b7ugkDfFOicrGJwpQlyH/mdJlDy8aFHLpev5qz
 n1zCMGB20ADd1xjo1/OtYCJXhK8vHxYBdRDY3No5NIzQvVDYVH5OGGsrY9RJ8EgFcJD2EJF/
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/03/2021 17:45, Ricardo Ribalda wrote:
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
>  drivers/media/usb/uvc/uvc_ctrl.c | 21 +++++++++++++++++
>  drivers/media/usb/uvc/uvc_v4l2.c | 39 ++++++++++++++++++++++++++++----
>  drivers/media/usb/uvc/uvcvideo.h |  1 +
>  3 files changed, 56 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 929e70dff11a..af1d4d9b8afb 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1046,6 +1046,27 @@ static int uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
>  	return 0;
>  }
>  
> +int uvc_ctrl_is_accesible(struct uvc_video_chain *chain, u32 v4l2_id, bool read)

accesible -> accessible

With that typo fixed you can add my:

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks!

	Hans

> +{
> +	struct uvc_control_mapping *mapping;
> +	struct uvc_control *ctrl;
> +
> +	if (__uvc_query_v4l2_class(chain, v4l2_id, 0) >= 0)
> +		return -EACCES;
> +
> +	ctrl = uvc_find_control(chain, v4l2_id, &mapping);
> +	if (!ctrl)
> +		return -EINVAL;
> +
> +	if (!(ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) && read)
> +		return -EACCES;
> +
> +	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR) && !read)
> +		return -EACCES;
> +
> +	return 0;
> +}
> +
>  static const char *uvc_map_get_name(const struct uvc_control_mapping *map)
>  {
>  	const char *name;
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index ed262f61e6a6..ce55b4bff687 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1045,6 +1045,26 @@ static int uvc_ioctl_s_ctrl(struct file *file, void *fh,
>  	return 0;
>  }
>  
> +static int uvc_ctrl_check_access(struct uvc_video_chain *chain,
> +				 struct v4l2_ext_controls *ctrls,
> +				 unsigned long ioctl)
> +{
> +	struct v4l2_ext_control *ctrl = ctrls->controls;
> +	unsigned int i;
> +	int ret = 0;
> +
> +	for (i = 0; i < ctrls->count; ++ctrl, ++i) {
> +		ret = uvc_ctrl_is_accesible(chain, ctrl->id,
> +					    ioctl == VIDIOC_G_EXT_CTRLS);
> +		if (ret)
> +			break;
> +	}
> +
> +	ctrls->error_idx = ioctl == VIDIOC_TRY_EXT_CTRLS ? i : ctrls->count;
> +
> +	return ret;
> +}
> +
>  static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
>  				 struct v4l2_ext_controls *ctrls)
>  {
> @@ -1054,6 +1074,10 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
>  	unsigned int i;
>  	int ret;
>  
> +	ret = uvc_ctrl_check_access(chain, ctrls, VIDIOC_G_EXT_CTRLS);
> +	if (ret < 0)
> +		return ret;
> +
>  	if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL) {
>  		for (i = 0; i < ctrls->count; ++ctrl, ++i) {
>  			struct v4l2_queryctrl qc = { .id = ctrl->id };
> @@ -1090,13 +1114,17 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
>  
>  static int uvc_ioctl_s_try_ext_ctrls(struct uvc_fh *handle,
>  				     struct v4l2_ext_controls *ctrls,
> -				     bool commit)
> +				     unsigned long ioctl)
>  {
>  	struct v4l2_ext_control *ctrl = ctrls->controls;
>  	struct uvc_video_chain *chain = handle->chain;
>  	unsigned int i;
>  	int ret;
>  
> +	ret = uvc_ctrl_check_access(chain, ctrls, ioctl);
> +	if (ret < 0)
> +		return ret;
> +
>  	ret = uvc_ctrl_begin(chain);
>  	if (ret < 0)
>  		return ret;
> @@ -1105,14 +1133,15 @@ static int uvc_ioctl_s_try_ext_ctrls(struct uvc_fh *handle,
>  		ret = uvc_ctrl_set(handle, ctrl);
>  		if (ret < 0) {
>  			uvc_ctrl_rollback(handle);
> -			ctrls->error_idx = commit ? ctrls->count : i;
> +			ctrls->error_idx = ioctl == VIDIOC_S_EXT_CTRLS ?
> +						    ctrls->count : i;
>  			return ret;
>  		}
>  	}
>  
>  	ctrls->error_idx = 0;
>  
> -	if (commit)
> +	if (ioctl == VIDIOC_S_EXT_CTRLS)
>  		return uvc_ctrl_commit(handle, ctrls->controls, ctrls->count);
>  	else
>  		return uvc_ctrl_rollback(handle);
> @@ -1123,7 +1152,7 @@ static int uvc_ioctl_s_ext_ctrls(struct file *file, void *fh,
>  {
>  	struct uvc_fh *handle = fh;
>  
> -	return uvc_ioctl_s_try_ext_ctrls(handle, ctrls, true);
> +	return uvc_ioctl_s_try_ext_ctrls(handle, ctrls, VIDIOC_S_EXT_CTRLS);
>  }
>  
>  static int uvc_ioctl_try_ext_ctrls(struct file *file, void *fh,
> @@ -1131,7 +1160,7 @@ static int uvc_ioctl_try_ext_ctrls(struct file *file, void *fh,
>  {
>  	struct uvc_fh *handle = fh;
>  
> -	return uvc_ioctl_s_try_ext_ctrls(handle, ctrls, false);
> +	return uvc_ioctl_s_try_ext_ctrls(handle, ctrls, VIDIOC_TRY_EXT_CTRLS);
>  }
>  
>  static int uvc_ioctl_querymenu(struct file *file, void *fh,
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index dc20021f7ee0..3288b118264e 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -902,6 +902,7 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
>  
>  int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
>  int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
> +int uvc_ctrl_is_accesible(struct uvc_video_chain *chain, u32 v4l2_id, bool read);
>  
>  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>  		      struct uvc_xu_control_query *xqry);
> 

