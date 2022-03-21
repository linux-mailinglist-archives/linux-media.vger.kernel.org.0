Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A288D4E226E
	for <lists+linux-media@lfdr.de>; Mon, 21 Mar 2022 09:47:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345398AbiCUIsl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Mar 2022 04:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345430AbiCUIsi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Mar 2022 04:48:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B40FA76CF
        for <linux-media@vger.kernel.org>; Mon, 21 Mar 2022 01:47:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1B6276112D
        for <linux-media@vger.kernel.org>; Mon, 21 Mar 2022 08:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45E59C340E8
        for <linux-media@vger.kernel.org>; Mon, 21 Mar 2022 08:47:09 +0000 (UTC)
Message-ID: <e6d6e16c-e588-529d-1e6c-6dfe441d3d38@xs4all.nl>
Date:   Mon, 21 Mar 2022 09:47:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH for v5.18] v4l2-ioctl.c: fix incorrect error path
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
to call video_put_user() since there is no point.

If writing the array back to userspace fails, then don't go to out_array_args,
instead just continue with the regular code that just returns the error
unless 'always_copy' is set. That flag was just completely ignored when
writing back the array data.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 96e307fe3aab..92433234c430 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3311,7 +3311,7 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
 		array_buf = kvmalloc(array_size, GFP_KERNEL);
 		err = -ENOMEM;
 		if (array_buf == NULL)
-			goto out_array_args;
+			goto out;
 		err = -EFAULT;
 		if (in_compat_syscall())
 			err = v4l2_compat_get_array_args(file, array_buf,
@@ -3321,7 +3321,7 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
 			err = copy_from_user(array_buf, user_ptr, array_size) ?
 								-EFAULT : 0;
 		if (err)
-			goto out_array_args;
+			goto out;
 		*kernel_ptr = array_buf;
 	}

@@ -3353,7 +3353,6 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
 		} else if (copy_to_user(user_ptr, array_buf, array_size)) {
 			err = -EFAULT;
 		}
-		goto out_array_args;
 	}
 	/*
 	 * Some ioctls can return an error, but still have valid

