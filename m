Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9407A4E269D
	for <lists+linux-media@lfdr.de>; Mon, 21 Mar 2022 13:34:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344735AbiCUMfe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Mar 2022 08:35:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233115AbiCUMfe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Mar 2022 08:35:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09E3D186E0
        for <linux-media@vger.kernel.org>; Mon, 21 Mar 2022 05:34:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9B3066102A
        for <linux-media@vger.kernel.org>; Mon, 21 Mar 2022 12:34:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4BFBC340E8;
        Mon, 21 Mar 2022 12:34:07 +0000 (UTC)
Message-ID: <1a8ba26c-c0e0-1967-d3e9-2a59a7fda427@xs4all.nl>
Date:   Mon, 21 Mar 2022 13:34:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCHv2] v4l2-ioctl.c: fix incorrect error path
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
References: <1c8d81b7-ea0d-743d-2d27-4ee0c06a5a00@xs4all.nl>
 <YjhnLGVtt0LJoG9D@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <YjhnLGVtt0LJoG9D@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/03/2022 12:53, Laurent Pinchart wrote:
> Hi Hans,
> 
> Thank you for the patch.
> 
> On Mon, Mar 21, 2022 at 12:03:30PM +0100, Hans Verkuil wrote:
>> If allocating array_buf fails, or copying data from userspace into that
>> buffer fails, then just free memory and return the error. Don't attempt
>> to call video_put_user() since there is no point.
>>
>> If writing the array back to userspace fails, then don't go to out_array_args,
>> instead just continue with the regular code that just returns the error
>> unless 'always_copy' is set. That flag was just completely ignored when
>> writing back the array data.
>>
>> Update the VIDIOC_G/S/TRY_EXT_CTRLS ioctls to set the ALWAYS_COPY flag
>> since they now need it.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>> Changes since v1:
>> - drop the now unused out_array_args label
>> - set the INFO_FL_ALWAYS_COPY for the VIDIOC_G/S/TRY_EXT_CTRLS ioctls
>> ---
>>  drivers/media/v4l2-core/v4l2-ioctl.c | 12 +++++-------
>>  1 file changed, 5 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>> index 96e307fe3aab..3eb8f5f0958d 100644
>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>> @@ -2816,9 +2816,9 @@ static const struct v4l2_ioctl_info v4l2_ioctls[] = {
>>  	IOCTL_INFO(VIDIOC_S_PRIORITY, v4l_s_priority, v4l_print_u32, INFO_FL_PRIO),
>>  	IOCTL_INFO(VIDIOC_G_SLICED_VBI_CAP, v4l_g_sliced_vbi_cap, v4l_print_sliced_vbi_cap, INFO_FL_CLEAR(v4l2_sliced_vbi_cap, type)),
>>  	IOCTL_INFO(VIDIOC_LOG_STATUS, v4l_log_status, v4l_print_newline, 0),
>> -	IOCTL_INFO(VIDIOC_G_EXT_CTRLS, v4l_g_ext_ctrls, v4l_print_ext_controls, INFO_FL_CTRL),
>> -	IOCTL_INFO(VIDIOC_S_EXT_CTRLS, v4l_s_ext_ctrls, v4l_print_ext_controls, INFO_FL_PRIO | INFO_FL_CTRL),
>> -	IOCTL_INFO(VIDIOC_TRY_EXT_CTRLS, v4l_try_ext_ctrls, v4l_print_ext_controls, INFO_FL_CTRL),
>> +	IOCTL_INFO(VIDIOC_G_EXT_CTRLS, v4l_g_ext_ctrls, v4l_print_ext_controls, INFO_FL_CTRL | INFO_FL_ALWAYS_COPY),
>> +	IOCTL_INFO(VIDIOC_S_EXT_CTRLS, v4l_s_ext_ctrls, v4l_print_ext_controls, INFO_FL_PRIO | INFO_FL_CTRL | INFO_FL_ALWAYS_COPY),
>> +	IOCTL_INFO(VIDIOC_TRY_EXT_CTRLS, v4l_try_ext_ctrls, v4l_print_ext_controls, INFO_FL_CTRL | INFO_FL_ALWAYS_COPY),
>>  	IOCTL_INFO(VIDIOC_ENUM_FRAMESIZES, v4l_stub_enum_framesizes, v4l_print_frmsizeenum, INFO_FL_CLEAR(v4l2_frmsizeenum, pixel_format)),
>>  	IOCTL_INFO(VIDIOC_ENUM_FRAMEINTERVALS, v4l_stub_enum_frameintervals, v4l_print_frmivalenum, INFO_FL_CLEAR(v4l2_frmivalenum, height)),
>>  	IOCTL_INFO(VIDIOC_G_ENC_INDEX, v4l_stub_g_enc_index, v4l_print_enc_idx, 0),
>> @@ -3311,7 +3311,7 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
>>  		array_buf = kvmalloc(array_size, GFP_KERNEL);
>>  		err = -ENOMEM;
>>  		if (array_buf == NULL)
>> -			goto out_array_args;
>> +			goto out;
>>  		err = -EFAULT;
>>  		if (in_compat_syscall())
>>  			err = v4l2_compat_get_array_args(file, array_buf,
>> @@ -3321,7 +3321,7 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
>>  			err = copy_from_user(array_buf, user_ptr, array_size) ?
>>  								-EFAULT : 0;
>>  		if (err)
>> -			goto out_array_args;
>> +			goto out;
>>  		*kernel_ptr = array_buf;
>>  	}
>>
>> @@ -3353,7 +3353,6 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
>>  		} else if (copy_to_user(user_ptr, array_buf, array_size)) {
>>  			err = -EFAULT;
>>  		}
>> -		goto out_array_args;
>>  	}
>>  	/*
>>  	 * Some ioctls can return an error, but still have valid
>> @@ -3362,7 +3361,6 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
>>  	if (err < 0 && !always_copy)
>>  		goto out;
>>
>> -out_array_args:
>>  	if (video_put_user((void __user *)arg, parg, cmd, orig_cmd))
>>  		err = -EFAULT;
> 
> Could we turn this into
> 
>   	if (err >= 0 || always_copy) {
>   		if (video_put_user((void __user *)arg, parg, cmd, orig_cmd))
>   			err = -EFAULT;
> 	}
> 
> to avoid the goto ?
> 
> With this,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> I also wonder if we should skip the copy to user for the array args when
> an error occurs (unless always_copy is set). What do you think ? It's
> not a candidate for this patch of course.

Actually, that's a very good point and I think it belongs to this patch as well.
It's really wrong to copy back data on error unless always_copy is set.

But in that case I prefer to keep the goto: the 'if (err < 0 && !always_copy)'
just moves up to before the 'if (has_array_args) {':

That part of the patch will then look like this:

@@ -3339,6 +3339,13 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
                        trace_v4l2_qbuf(video_devdata(file)->minor, parg);
        }

+       /*
+        * Some ioctls can return an error, but still have valid
+        * results that must be returned.
+        */
+       if (err < 0 && !always_copy)
+               goto out;
+
        if (has_array_args) {
                *kernel_ptr = (void __force *)user_ptr;
                if (in_compat_syscall()) {
@@ -3353,16 +3360,8 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
                } else if (copy_to_user(user_ptr, array_buf, array_size)) {
                        err = -EFAULT;
                }
-               goto out_array_args;
        }
-       /*
-        * Some ioctls can return an error, but still have valid
-        * results that must be returned.
-        */
-       if (err < 0 && !always_copy)
-               goto out;

-out_array_args:
        if (video_put_user((void __user *)arg, parg, cmd, orig_cmd))
                err = -EFAULT;
 out:

Regards,

	Hans
