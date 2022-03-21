Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 823B64E25BE
	for <lists+linux-media@lfdr.de>; Mon, 21 Mar 2022 12:55:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244781AbiCULz3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Mar 2022 07:55:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347027AbiCULzR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Mar 2022 07:55:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76CA71D324
        for <linux-media@vger.kernel.org>; Mon, 21 Mar 2022 04:53:35 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DFC90291;
        Mon, 21 Mar 2022 12:53:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647863614;
        bh=YjOQCUtrrJRFDGSsFuYRfmL4IU2jH5ir85fTMvnU0pM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=six4T+IXDkNK6OeTX4smAksHFUH2ES6AEv1DEJ/OooNkx784KbkcawNL0OImIV8cN
         7fwpuDkvGhf8OX3YHEnFNRxLe+oS6FlUNs7k0ZjkVc6vUNyZ00SjDUXraLbbiZWaWs
         4EZKMs8YzYJkEeYDvAn8INhTKijSNbFuBaVeHg1M=
Date:   Mon, 21 Mar 2022 13:53:16 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCHv2] v4l2-ioctl.c: fix incorrect error path
Message-ID: <YjhnLGVtt0LJoG9D@pendragon.ideasonboard.com>
References: <1c8d81b7-ea0d-743d-2d27-4ee0c06a5a00@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1c8d81b7-ea0d-743d-2d27-4ee0c06a5a00@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Mon, Mar 21, 2022 at 12:03:30PM +0100, Hans Verkuil wrote:
> If allocating array_buf fails, or copying data from userspace into that
> buffer fails, then just free memory and return the error. Don't attempt
> to call video_put_user() since there is no point.
> 
> If writing the array back to userspace fails, then don't go to out_array_args,
> instead just continue with the regular code that just returns the error
> unless 'always_copy' is set. That flag was just completely ignored when
> writing back the array data.
> 
> Update the VIDIOC_G/S/TRY_EXT_CTRLS ioctls to set the ALWAYS_COPY flag
> since they now need it.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> Changes since v1:
> - drop the now unused out_array_args label
> - set the INFO_FL_ALWAYS_COPY for the VIDIOC_G/S/TRY_EXT_CTRLS ioctls
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 96e307fe3aab..3eb8f5f0958d 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -2816,9 +2816,9 @@ static const struct v4l2_ioctl_info v4l2_ioctls[] = {
>  	IOCTL_INFO(VIDIOC_S_PRIORITY, v4l_s_priority, v4l_print_u32, INFO_FL_PRIO),
>  	IOCTL_INFO(VIDIOC_G_SLICED_VBI_CAP, v4l_g_sliced_vbi_cap, v4l_print_sliced_vbi_cap, INFO_FL_CLEAR(v4l2_sliced_vbi_cap, type)),
>  	IOCTL_INFO(VIDIOC_LOG_STATUS, v4l_log_status, v4l_print_newline, 0),
> -	IOCTL_INFO(VIDIOC_G_EXT_CTRLS, v4l_g_ext_ctrls, v4l_print_ext_controls, INFO_FL_CTRL),
> -	IOCTL_INFO(VIDIOC_S_EXT_CTRLS, v4l_s_ext_ctrls, v4l_print_ext_controls, INFO_FL_PRIO | INFO_FL_CTRL),
> -	IOCTL_INFO(VIDIOC_TRY_EXT_CTRLS, v4l_try_ext_ctrls, v4l_print_ext_controls, INFO_FL_CTRL),
> +	IOCTL_INFO(VIDIOC_G_EXT_CTRLS, v4l_g_ext_ctrls, v4l_print_ext_controls, INFO_FL_CTRL | INFO_FL_ALWAYS_COPY),
> +	IOCTL_INFO(VIDIOC_S_EXT_CTRLS, v4l_s_ext_ctrls, v4l_print_ext_controls, INFO_FL_PRIO | INFO_FL_CTRL | INFO_FL_ALWAYS_COPY),
> +	IOCTL_INFO(VIDIOC_TRY_EXT_CTRLS, v4l_try_ext_ctrls, v4l_print_ext_controls, INFO_FL_CTRL | INFO_FL_ALWAYS_COPY),
>  	IOCTL_INFO(VIDIOC_ENUM_FRAMESIZES, v4l_stub_enum_framesizes, v4l_print_frmsizeenum, INFO_FL_CLEAR(v4l2_frmsizeenum, pixel_format)),
>  	IOCTL_INFO(VIDIOC_ENUM_FRAMEINTERVALS, v4l_stub_enum_frameintervals, v4l_print_frmivalenum, INFO_FL_CLEAR(v4l2_frmivalenum, height)),
>  	IOCTL_INFO(VIDIOC_G_ENC_INDEX, v4l_stub_g_enc_index, v4l_print_enc_idx, 0),
> @@ -3311,7 +3311,7 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
>  		array_buf = kvmalloc(array_size, GFP_KERNEL);
>  		err = -ENOMEM;
>  		if (array_buf == NULL)
> -			goto out_array_args;
> +			goto out;
>  		err = -EFAULT;
>  		if (in_compat_syscall())
>  			err = v4l2_compat_get_array_args(file, array_buf,
> @@ -3321,7 +3321,7 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
>  			err = copy_from_user(array_buf, user_ptr, array_size) ?
>  								-EFAULT : 0;
>  		if (err)
> -			goto out_array_args;
> +			goto out;
>  		*kernel_ptr = array_buf;
>  	}
> 
> @@ -3353,7 +3353,6 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
>  		} else if (copy_to_user(user_ptr, array_buf, array_size)) {
>  			err = -EFAULT;
>  		}
> -		goto out_array_args;
>  	}
>  	/*
>  	 * Some ioctls can return an error, but still have valid
> @@ -3362,7 +3361,6 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
>  	if (err < 0 && !always_copy)
>  		goto out;
> 
> -out_array_args:
>  	if (video_put_user((void __user *)arg, parg, cmd, orig_cmd))
>  		err = -EFAULT;

Could we turn this into

  	if (err >= 0 || always_copy) {
  		if (video_put_user((void __user *)arg, parg, cmd, orig_cmd))
  			err = -EFAULT;
	}

to avoid the goto ?

With this,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I also wonder if we should skip the copy to user for the array args when
an error occurs (unless always_copy is set). What do you think ? It's
not a candidate for this patch of course.

>  out:

-- 
Regards,

Laurent Pinchart
