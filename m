Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 544812A0BDD
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 17:55:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727233AbgJ3Qzr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 12:55:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:60776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726239AbgJ3Qzq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 12:55:46 -0400
Received: from localhost.localdomain (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8AE442076E;
        Fri, 30 Oct 2020 16:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604076945;
        bh=3HHkPHxUAoaKPZnU75UL9Fi/9SVSDzWYfAj9CVPMYC0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=a6K2gEWcB6d5tQ/5C07Gq+IH4VCgUT6NhFkW6dKY5D9xKNfjZBWNQQRTi58uui2bn
         O1BHCj5Rsu7zLDYyptT+tZDfT7yPAGKPVIyiqlT5IuNadBbCkhELQyTD+hoGVWC/dA
         6qq1RL32uwhix6tpNPBZ0cPBxS0sKmjoaxcUpv4M=
From:   Arnd Bergmann <arnd@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
        mchehab@kernel.org, hch@lst.de, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/8] media: v4l2: move v4l2_ext_controls conversion
Date:   Fri, 30 Oct 2020 17:55:24 +0100
Message-Id: <20201030165529.1255175-4-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201030165529.1255175-1-arnd@kernel.org>
References: <20201030165529.1255175-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The v4l2_ext_controls ioctl handlers use an indirect pointer to an
incompatible data structure, making the conversion particularly tricky.

Moving the compat implementation to use the new
v4l2_compat_get_user()/v4l2_compat_put_user() helpers makes it
noticeably simpler.

In v4l2_compat_get_array_args()/v4l2_compat_put_array_args(),
the 'file' argument needs to get passed to determine the
exact format, which is a bit unfortunate, as no other conversion
needs these.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 236 +++++++-----------
 1 file changed, 90 insertions(+), 146 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
index a76f6ac5b1eb..fa94cdec7df5 100644
--- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
+++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
@@ -1124,142 +1124,44 @@ static inline bool ctrl_is_pointer(struct file *file, u32 id)
 		(qec.flags & V4L2_CTRL_FLAG_HAS_PAYLOAD);
 }
 
-static int bufsize_v4l2_ext_controls(struct v4l2_ext_controls32 __user *p32,
-				     u32 *size)
-{
-	u32 count;
-
-	if (!access_ok(p32, sizeof(*p32)) ||
-	    get_user(count, &p32->count))
-		return -EFAULT;
-	if (count > V4L2_CID_MAX_CTRLS)
-		return -EINVAL;
-	*size = count * sizeof(struct v4l2_ext_control);
-	return 0;
-}
-
-static int get_v4l2_ext_controls32(struct file *file,
-				   struct v4l2_ext_controls __user *p64,
-				   struct v4l2_ext_controls32 __user *p32,
-				   void __user *aux_buf, u32 aux_space)
+static int get_v4l2_ext_controls32(struct v4l2_ext_controls *p64,
+				   struct v4l2_ext_controls32 __user *p32)
 {
-	struct v4l2_ext_control32 __user *ucontrols;
-	struct v4l2_ext_control __user *kcontrols;
-	u32 count;
-	u32 n;
-	compat_caddr_t p;
-
-	if (!access_ok(p32, sizeof(*p32)) ||
-	    assign_in_user(&p64->which, &p32->which) ||
-	    get_user(count, &p32->count) ||
-	    put_user(count, &p64->count) ||
-	    assign_in_user(&p64->error_idx, &p32->error_idx) ||
-	    assign_in_user(&p64->request_fd, &p32->request_fd) ||
-	    copy_in_user(p64->reserved, p32->reserved, sizeof(p64->reserved)))
-		return -EFAULT;
+	struct v4l2_ext_controls32 ec32;
 
-	if (count == 0)
-		return put_user(NULL, &p64->controls);
-	if (count > V4L2_CID_MAX_CTRLS)
-		return -EINVAL;
-	if (get_user(p, &p32->controls))
-		return -EFAULT;
-	ucontrols = compat_ptr(p);
-	if (!access_ok(ucontrols, count * sizeof(*ucontrols)))
-		return -EFAULT;
-	if (aux_space < count * sizeof(*kcontrols))
+	if (copy_from_user(&ec32, p32, sizeof(ec32)))
 		return -EFAULT;
-	kcontrols = aux_buf;
-	if (put_user_force(kcontrols, &p64->controls))
-		return -EFAULT;
-
-	for (n = 0; n < count; n++) {
-		u32 id;
-
-		if (copy_in_user(kcontrols, ucontrols, sizeof(*ucontrols)))
-			return -EFAULT;
-
-		if (get_user(id, &kcontrols->id))
-			return -EFAULT;
 
-		if (ctrl_is_pointer(file, id)) {
-			void __user *s;
+	*p64 = (struct v4l2_ext_controls) {
+		.which		= ec32.which,
+		.count		= ec32.count,
+		.error_idx	= ec32.error_idx,
+		.request_fd	= ec32.request_fd,
+		.reserved[0]	= ec32.reserved[0],
+		.controls	= (void __force *)compat_ptr(ec32.controls),
+	};
 
-			if (get_user(p, &ucontrols->string))
-				return -EFAULT;
-			s = compat_ptr(p);
-			if (put_user(s, &kcontrols->string))
-				return -EFAULT;
-		}
-		ucontrols++;
-		kcontrols++;
-	}
 	return 0;
 }
 
-static int put_v4l2_ext_controls32(struct file *file,
-				   struct v4l2_ext_controls __user *p64,
+static int put_v4l2_ext_controls32(struct v4l2_ext_controls *p64,
 				   struct v4l2_ext_controls32 __user *p32)
 {
-	struct v4l2_ext_control32 __user *ucontrols;
-	struct v4l2_ext_control *kcontrols;
-	u32 count;
-	u32 n;
-	compat_caddr_t p;
-
-	/*
-	 * We need to define kcontrols without __user, even though it does
-	 * point to data in userspace here. The reason is that v4l2-ioctl.c
-	 * copies it from userspace to kernelspace, so its definition in
-	 * videodev2.h doesn't have a __user markup. Defining kcontrols
-	 * with __user causes smatch warnings, so instead declare it
-	 * without __user and cast it as a userspace pointer where needed.
-	 */
-	if (!access_ok(p32, sizeof(*p32)) ||
-	    assign_in_user(&p32->which, &p64->which) ||
-	    get_user(count, &p64->count) ||
-	    put_user(count, &p32->count) ||
-	    assign_in_user(&p32->error_idx, &p64->error_idx) ||
-	    assign_in_user(&p32->request_fd, &p64->request_fd) ||
-	    copy_in_user(p32->reserved, p64->reserved, sizeof(p32->reserved)) ||
-	    get_user(kcontrols, &p64->controls))
-		return -EFAULT;
+	struct v4l2_ext_controls32 ec32;
+
+	memset(&ec32, 0, sizeof(ec32));
+	ec32 = (struct v4l2_ext_controls32) {
+		.which		= p64->which,
+		.count		= p64->count,
+		.error_idx	= p64->error_idx,
+		.request_fd	= p64->request_fd,
+		.reserved[0]	= p64->reserved[0],
+		.controls	= (uintptr_t)p64->controls,
+	};
 
-	if (!count || count > (U32_MAX/sizeof(*ucontrols)))
-		return 0;
-	if (get_user(p, &p32->controls))
-		return -EFAULT;
-	ucontrols = compat_ptr(p);
-	if (!access_ok(ucontrols, count * sizeof(*ucontrols)))
+	if (copy_to_user(p32, &ec32, sizeof(ec32)))
 		return -EFAULT;
 
-	for (n = 0; n < count; n++) {
-		unsigned int size = sizeof(*ucontrols);
-		u32 id;
-
-		if (get_user_cast(id, &kcontrols->id) ||
-		    put_user(id, &ucontrols->id) ||
-		    assign_in_user_cast(&ucontrols->size, &kcontrols->size) ||
-		    copy_in_user(&ucontrols->reserved2,
-				 (void __user *)&kcontrols->reserved2,
-				 sizeof(ucontrols->reserved2)))
-			return -EFAULT;
-
-		/*
-		 * Do not modify the pointer when copying a pointer control.
-		 * The contents of the pointer was changed, not the pointer
-		 * itself.
-		 */
-		if (ctrl_is_pointer(file, id))
-			size -= sizeof(ucontrols->value64);
-
-		if (copy_in_user(ucontrols,
-				 (void __user *)kcontrols, size))
-			return -EFAULT;
-
-		ucontrols++;
-		kcontrols++;
-	}
 	return 0;
 }
 
@@ -1409,6 +1311,12 @@ static int put_v4l2_edid32(struct v4l2_edid __user *p64,
 unsigned int v4l2_compat_translate_cmd(unsigned int cmd)
 {
 	switch (cmd) {
+	case VIDIOC_G_EXT_CTRLS32:
+		return VIDIOC_G_EXT_CTRLS;
+	case VIDIOC_S_EXT_CTRLS32:
+		return VIDIOC_S_EXT_CTRLS;
+	case VIDIOC_TRY_EXT_CTRLS32:
+		return VIDIOC_TRY_EXT_CTRLS;
 	}
 	return cmd;
 }
@@ -1416,6 +1324,10 @@ unsigned int v4l2_compat_translate_cmd(unsigned int cmd)
 int v4l2_compat_get_user(void __user *arg, void *parg, unsigned int cmd)
 {
 	switch (cmd) {
+	case VIDIOC_G_EXT_CTRLS32:
+	case VIDIOC_S_EXT_CTRLS32:
+	case VIDIOC_TRY_EXT_CTRLS32:
+		return get_v4l2_ext_controls32(parg, arg);
 	}
 	return 0;
 }
@@ -1423,6 +1335,10 @@ int v4l2_compat_get_user(void __user *arg, void *parg, unsigned int cmd)
 int v4l2_compat_put_user(void __user *arg, void *parg, unsigned int cmd)
 {
 	switch (cmd) {
+	case VIDIOC_G_EXT_CTRLS32:
+	case VIDIOC_S_EXT_CTRLS32:
+	case VIDIOC_TRY_EXT_CTRLS32:
+		return put_v4l2_ext_controls32(parg, arg);
 	}
 	return 0;
 }
@@ -1434,6 +1350,29 @@ int v4l2_compat_get_array_args(struct file *file, void *mbuf,
 	int err = 0;
 
 	switch (cmd) {
+	case VIDIOC_G_EXT_CTRLS32:
+	case VIDIOC_S_EXT_CTRLS32:
+	case VIDIOC_TRY_EXT_CTRLS32: {
+		struct v4l2_ext_controls *ecs64 = arg;
+		struct v4l2_ext_control *ec64 = mbuf;
+		struct v4l2_ext_control32 __user *ec32 = user_ptr;
+		int n;
+
+		for (n = 0; n < ecs64->count; n++) {
+			if (copy_from_user(ec64, ec32, sizeof(*ec32)))
+				return -EFAULT;
+
+			if (ctrl_is_pointer(file, ec64->id)) {
+				compat_uptr_t p;
+				if (get_user(p, &ec32->string))
+					return -EFAULT;
+				ec64->string = compat_ptr(p);
+			}
+			ec32++;
+			ec64++;
+		}
+		break;
+	}
 	default:
 		if (copy_from_user(mbuf, user_ptr, array_size))
 			err = -EFAULT;
@@ -1450,6 +1389,33 @@ int v4l2_compat_put_array_args(struct file *file, void __user *user_ptr,
 	int err = 0;
 
 	switch (cmd) {
+	case VIDIOC_G_EXT_CTRLS32:
+	case VIDIOC_S_EXT_CTRLS32:
+	case VIDIOC_TRY_EXT_CTRLS32: {
+		struct v4l2_ext_controls *ecs64 = arg;
+		struct v4l2_ext_control *ec64 = mbuf;
+		struct v4l2_ext_control32 __user *ec32 = user_ptr;
+		int n;
+
+		for (n = 0; n < ecs64->count; n++) {
+			unsigned int size = sizeof(*ec32);
+			/*
+			 * Do not modify the pointer when copying a pointer
+			 * control.  The contents of the pointer was changed,
+			 * not the pointer itself.
+			 * The structures are otherwise compatible.
+			 */
+			if (ctrl_is_pointer(file, ec64->id))
+				size -= sizeof(ec32->value64);
+
+			if (copy_to_user(ec32, ec64, size))
+				return -EFAULT;
+
+			ec32++;
+			ec64++;
+		}
+		break;
+	}
 	default:
 		if (copy_to_user(user_ptr, mbuf, array_size))
 			err = -EFAULT;
@@ -1459,6 +1425,7 @@ int v4l2_compat_put_array_args(struct file *file, void __user *user_ptr,
 	return err;
 }
 
+
 /**
  * alloc_userspace() - Allocates a 64-bits userspace pointer compatible
  *	for calling the native 64-bits version of an ioctl.
@@ -1529,9 +1496,6 @@ static long do_video_ioctl(struct file *file, unsigned int cmd, unsigned long ar
 	case VIDIOC_ENUMSTD32: ncmd = VIDIOC_ENUMSTD; break;
 	case VIDIOC_ENUMINPUT32: ncmd = VIDIOC_ENUMINPUT; break;
 	case VIDIOC_TRY_FMT32: ncmd = VIDIOC_TRY_FMT; break;
-	case VIDIOC_G_EXT_CTRLS32: ncmd = VIDIOC_G_EXT_CTRLS; break;
-	case VIDIOC_S_EXT_CTRLS32: ncmd = VIDIOC_S_EXT_CTRLS; break;
-	case VIDIOC_TRY_EXT_CTRLS32: ncmd = VIDIOC_TRY_EXT_CTRLS; break;
 #ifdef CONFIG_X86_64
 	case VIDIOC_DQEVENT32: ncmd = VIDIOC_DQEVENT; break;
 	case VIDIOC_DQEVENT32_TIME32: ncmd = VIDIOC_DQEVENT_TIME32; break;
@@ -1647,20 +1611,6 @@ static long do_video_ioctl(struct file *file, unsigned int cmd, unsigned long ar
 		compatible_arg = 0;
 		break;
 
-	case VIDIOC_G_EXT_CTRLS32:
-	case VIDIOC_S_EXT_CTRLS32:
-	case VIDIOC_TRY_EXT_CTRLS32:
-		err = bufsize_v4l2_ext_controls(p32, &aux_space);
-		if (!err)
-			err = alloc_userspace(sizeof(struct v4l2_ext_controls),
-					      aux_space, &new_p64);
-		if (!err) {
-			aux_buf = new_p64 + sizeof(struct v4l2_ext_controls);
-			err = get_v4l2_ext_controls32(file, new_p64, p32,
-						      aux_buf, aux_space);
-		}
-		compatible_arg = 0;
-		break;
 #ifdef CONFIG_X86_64
 	case VIDIOC_DQEVENT32:
 		err = alloc_userspace(sizeof(struct v4l2_event), 0, &new_p64);
@@ -1703,12 +1653,6 @@ static long do_video_ioctl(struct file *file, unsigned int cmd, unsigned long ar
 	 * the blocks to maximum allowed value.
 	 */
 	switch (cmd) {
-	case VIDIOC_G_EXT_CTRLS32:
-	case VIDIOC_S_EXT_CTRLS32:
-	case VIDIOC_TRY_EXT_CTRLS32:
-		if (put_v4l2_ext_controls32(file, new_p64, p32))
-			err = -EFAULT;
-		break;
 	case VIDIOC_S_EDID32:
 		if (put_v4l2_edid32(new_p64, p32))
 			err = -EFAULT;
-- 
2.27.0

