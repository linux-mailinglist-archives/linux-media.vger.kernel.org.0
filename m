Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CFB452BBC1
	for <lists+linux-media@lfdr.de>; Wed, 18 May 2022 16:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237436AbiERNGw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 May 2022 09:06:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237652AbiERNGf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 May 2022 09:06:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E488A3B3DC
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 06:06:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7A91361786
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 13:06:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7915EC385A5;
        Wed, 18 May 2022 13:06:33 +0000 (UTC)
Message-ID: <e6a37123-b17a-39c4-3075-7f5d7576ec34@xs4all.nl>
Date:   Wed, 18 May 2022 15:06:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3] v4l2-ioctl.c: fix incorrect error path
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If allocating array_buf fails, or copying data from userspace into that
buffer fails, then just free memory and return the error. Don't attempt
to call video_put_user() since there is no point, and it would copy back
data on error even if INFO_FL_ALWAYS_COPY wasn't set.

So if writing the array back to userspace fails, then don't go to
out_array_args, instead just continue with the regular code that just
returns the error unless 'always_copy' is set.

Update the VIDIOC_G/S/TRY_EXT_CTRLS ioctls to set the ALWAYS_COPY flag
since they now need it. Before this worked due to this buggy code, but
now that that is fixed these ioctls need to set this flag explicitly.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
Changes since v2:
- don't copy back data on error unless always_copy is set
- drop an unnecessary 'err = -EFAULT;' since err will be overwritten
  right after that assignment.
Changes since v1:
- drop the now unused out_array_args label
- set the INFO_FL_ALWAYS_COPY for the VIDIOC_G/S/TRY_EXT_CTRLS ioctls
---
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 21470de62d72..6e0ddb70e341 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -2823,9 +2823,9 @@ static const struct v4l2_ioctl_info v4l2_ioctls[] = {
 	IOCTL_INFO(VIDIOC_S_PRIORITY, v4l_s_priority, v4l_print_u32, INFO_FL_PRIO),
 	IOCTL_INFO(VIDIOC_G_SLICED_VBI_CAP, v4l_g_sliced_vbi_cap, v4l_print_sliced_vbi_cap, INFO_FL_CLEAR(v4l2_sliced_vbi_cap, type)),
 	IOCTL_INFO(VIDIOC_LOG_STATUS, v4l_log_status, v4l_print_newline, 0),
-	IOCTL_INFO(VIDIOC_G_EXT_CTRLS, v4l_g_ext_ctrls, v4l_print_ext_controls, INFO_FL_CTRL),
-	IOCTL_INFO(VIDIOC_S_EXT_CTRLS, v4l_s_ext_ctrls, v4l_print_ext_controls, INFO_FL_PRIO | INFO_FL_CTRL),
-	IOCTL_INFO(VIDIOC_TRY_EXT_CTRLS, v4l_try_ext_ctrls, v4l_print_ext_controls, INFO_FL_CTRL),
+	IOCTL_INFO(VIDIOC_G_EXT_CTRLS, v4l_g_ext_ctrls, v4l_print_ext_controls, INFO_FL_CTRL | INFO_FL_ALWAYS_COPY),
+	IOCTL_INFO(VIDIOC_S_EXT_CTRLS, v4l_s_ext_ctrls, v4l_print_ext_controls, INFO_FL_PRIO | INFO_FL_CTRL | INFO_FL_ALWAYS_COPY),
+	IOCTL_INFO(VIDIOC_TRY_EXT_CTRLS, v4l_try_ext_ctrls, v4l_print_ext_controls, INFO_FL_CTRL | INFO_FL_ALWAYS_COPY),
 	IOCTL_INFO(VIDIOC_ENUM_FRAMESIZES, v4l_stub_enum_framesizes, v4l_print_frmsizeenum, INFO_FL_CLEAR(v4l2_frmsizeenum, pixel_format)),
 	IOCTL_INFO(VIDIOC_ENUM_FRAMEINTERVALS, v4l_stub_enum_frameintervals, v4l_print_frmivalenum, INFO_FL_CLEAR(v4l2_frmivalenum, height)),
 	IOCTL_INFO(VIDIOC_G_ENC_INDEX, v4l_stub_g_enc_index, v4l_print_enc_idx, 0),
@@ -3318,8 +3318,7 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
 		array_buf = kvmalloc(array_size, GFP_KERNEL);
 		err = -ENOMEM;
 		if (array_buf == NULL)
-			goto out_array_args;
-		err = -EFAULT;
+			goto out;
 		if (in_compat_syscall())
 			err = v4l2_compat_get_array_args(file, array_buf,
 							 user_ptr, array_size,
@@ -3328,7 +3327,7 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
 			err = copy_from_user(array_buf, user_ptr, array_size) ?
 								-EFAULT : 0;
 		if (err)
-			goto out_array_args;
+			goto out;
 		*kernel_ptr = array_buf;
 	}
 
@@ -3346,6 +3345,13 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
 			trace_v4l2_qbuf(video_devdata(file)->minor, parg);
 	}
 
+	/*
+	 * Some ioctls can return an error, but still have valid
+	 * results that must be returned.
+	 */
+	if (err < 0 && !always_copy)
+		goto out;
+
 	if (has_array_args) {
 		*kernel_ptr = (void __force *)user_ptr;
 		if (in_compat_syscall()) {
@@ -3360,16 +3366,8 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
 		} else if (copy_to_user(user_ptr, array_buf, array_size)) {
 			err = -EFAULT;
 		}
-		goto out_array_args;
 	}
-	/*
-	 * Some ioctls can return an error, but still have valid
-	 * results that must be returned.
-	 */
-	if (err < 0 && !always_copy)
-		goto out;
 
-out_array_args:
 	if (video_put_user((void __user *)arg, parg, cmd, orig_cmd))
 		err = -EFAULT;
 out:
