Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 024DE2A0BDC
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 17:55:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727182AbgJ3Qzo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 12:55:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:60686 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726239AbgJ3Qzn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 12:55:43 -0400
Received: from localhost.localdomain (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B7D5420756;
        Fri, 30 Oct 2020 16:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604076941;
        bh=neFXMFtMlZM1GFNm+RLu2Iz3KJrNqMJWP03QjnJSjOg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=enYw2uV8I7hLoFbcmrF8G+UwC5tv2NFaUiZEORke2oddlsaReWQPkf5zOAznCY70P
         ZVP//bM96ixfcpxwvVLvxoxs8gN8DQ8uloH49dABLSuNMnJImvQT95WBljRnMy+Bv8
         jkd3t/gXzSLlWU92XtRoaaLxe34LT1Mwl+9dPv4A=
From:   Arnd Bergmann <arnd@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
        mchehab@kernel.org, hch@lst.de, linux-kernel@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 1/8] media: v4l2: prepare compat-ioctl rework
Date:   Fri, 30 Oct 2020 17:55:22 +0100
Message-Id: <20201030165529.1255175-2-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201030165529.1255175-1-arnd@kernel.org>
References: <20201030165529.1255175-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The v4l2-compat-ioctl32() currently takes an extra round trip through user
space pointers when converting the data structure formats. In particular,
this involves using the compat_alloc_user_space() and copy_in_user()
helpers that often lead to worse compat handlers compared to using
in_compat_syscall() checks when copying the data.

The native implementation already gained a simpler method to deal with
the conversion for the time32 conversion.  Hook into the same places to
provide a location for reading and writing user space data from inside
of the generic video_usercopy() helper.

Hans Verkuil rewrote the video_get_user() function here to simplify
the zeroing of the extra input fields and fixed a couple of bugs in
the original implementation.

Co-developed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c |  53 ++++++
 drivers/media/v4l2-core/v4l2-ioctl.c          | 159 ++++++++++--------
 include/media/v4l2-ioctl.h                    |  11 ++
 3 files changed, 156 insertions(+), 67 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
index a99e82ec9ab6..7c939d5c5232 100644
--- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
+++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
@@ -1414,6 +1414,59 @@ static int put_v4l2_edid32(struct v4l2_edid __user *p64,
 #define VIDIOC_G_OUTPUT32	_IOR ('V', 46, s32)
 #define VIDIOC_S_OUTPUT32	_IOWR('V', 47, s32)
 
+unsigned int v4l2_compat_translate_cmd(unsigned int cmd)
+{
+	switch (cmd) {
+	}
+	return cmd;
+}
+
+int v4l2_compat_get_user(void __user *arg, void *parg, unsigned int cmd)
+{
+	switch (cmd) {
+	}
+	return 0;
+}
+
+int v4l2_compat_put_user(void __user *arg, void *parg, unsigned int cmd)
+{
+	switch (cmd) {
+	}
+	return 0;
+}
+
+int v4l2_compat_get_array_args(struct file *file, void *mbuf,
+			       void __user *user_ptr, size_t array_size,
+			       unsigned int cmd, void *arg)
+{
+	int err = 0;
+
+	switch (cmd) {
+	default:
+		if (copy_from_user(mbuf, user_ptr, array_size))
+			err = -EFAULT;
+		break;
+	}
+
+	return err;
+}
+
+int v4l2_compat_put_array_args(struct file *file, void __user *user_ptr,
+			       void *mbuf, size_t array_size,
+			       unsigned int cmd, void *arg)
+{
+	int err = 0;
+
+	switch (cmd) {
+	default:
+		if (copy_to_user(user_ptr, mbuf, array_size))
+			err = -EFAULT;
+		break;
+	}
+
+	return err;
+}
+
 /**
  * alloc_userspace() - Allocates a 64-bits userspace pointer compatible
  *	for calling the native 64-bits version of an ioctl.
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index eeff398fbdcc..b8be61a09776 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -8,6 +8,7 @@
  *              Mauro Carvalho Chehab <mchehab@kernel.org> (version 2)
  */
 
+#include <linux/compat.h>
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -3104,14 +3105,18 @@ static unsigned int video_translate_cmd(unsigned int cmd)
 		return VIDIOC_PREPARE_BUF;
 #endif
 	}
+	if (in_compat_syscall())
+		return v4l2_compat_translate_cmd(cmd);
 
 	return cmd;
 }
 
-static int video_get_user(void __user *arg, void *parg, unsigned int cmd,
+static int video_get_user(void __user *arg, void *parg,
+			  unsigned int real_cmd, unsigned int cmd,
 			  bool *always_copy)
 {
-	unsigned int n = _IOC_SIZE(cmd);
+	unsigned int n = _IOC_SIZE(real_cmd);
+	int err = 0;
 
 	if (!(_IOC_DIR(cmd) & _IOC_WRITE)) {
 		/* read-only ioctl */
@@ -3119,73 +3124,82 @@ static int video_get_user(void __user *arg, void *parg, unsigned int cmd,
 		return 0;
 	}
 
-	switch (cmd) {
-#ifdef CONFIG_COMPAT_32BIT_TIME
-	case VIDIOC_QUERYBUF_TIME32:
-	case VIDIOC_QBUF_TIME32:
-	case VIDIOC_DQBUF_TIME32:
-	case VIDIOC_PREPARE_BUF_TIME32: {
-		struct v4l2_buffer_time32 vb32;
-		struct v4l2_buffer *vb = parg;
-
-		if (copy_from_user(&vb32, arg, sizeof(vb32)))
-			return -EFAULT;
-
-		*vb = (struct v4l2_buffer) {
-			.index		= vb32.index,
-			.type		= vb32.type,
-			.bytesused	= vb32.bytesused,
-			.flags		= vb32.flags,
-			.field		= vb32.field,
-			.timestamp.tv_sec	= vb32.timestamp.tv_sec,
-			.timestamp.tv_usec	= vb32.timestamp.tv_usec,
-			.timecode	= vb32.timecode,
-			.sequence	= vb32.sequence,
-			.memory		= vb32.memory,
-			.m.userptr	= vb32.m.userptr,
-			.length		= vb32.length,
-			.request_fd	= vb32.request_fd,
-		};
-
-		if (cmd == VIDIOC_QUERYBUF_TIME32)
-			vb->request_fd = 0;
+	/*
+	 * In some cases, only a few fields are used as input,
+	 * i.e. when the app sets "index" and then the driver
+	 * fills in the rest of the structure for the thing
+	 * with that index.  We only need to copy up the first
+	 * non-input field.
+	 */
+	if (v4l2_is_known_ioctl(real_cmd)) {
+		u32 flags = v4l2_ioctls[_IOC_NR(real_cmd)].flags;
 
-		break;
+		if (flags & INFO_FL_CLEAR_MASK)
+			n = (flags & INFO_FL_CLEAR_MASK) >> 16;
+		*always_copy = flags & INFO_FL_ALWAYS_COPY;
 	}
-#endif
-	default:
-		/*
-		 * In some cases, only a few fields are used as input,
-		 * i.e. when the app sets "index" and then the driver
-		 * fills in the rest of the structure for the thing
-		 * with that index.  We only need to copy up the first
-		 * non-input field.
-		 */
-		if (v4l2_is_known_ioctl(cmd)) {
-			u32 flags = v4l2_ioctls[_IOC_NR(cmd)].flags;
-
-			if (flags & INFO_FL_CLEAR_MASK)
-				n = (flags & INFO_FL_CLEAR_MASK) >> 16;
-			*always_copy = flags & INFO_FL_ALWAYS_COPY;
-		}
 
+	if (cmd == real_cmd) {
 		if (copy_from_user(parg, (void __user *)arg, n))
-			return -EFAULT;
-
-		/* zero out anything we don't copy from userspace */
-		if (n < _IOC_SIZE(cmd))
-			memset((u8 *)parg + n, 0, _IOC_SIZE(cmd) - n);
-		break;
+			err = -EFAULT;
+	} else if (in_compat_syscall()) {
+		err = v4l2_compat_get_user(arg, parg, cmd);
+	} else {
+		switch (cmd) {
+#ifdef CONFIG_COMPAT_32BIT_TIME
+		case VIDIOC_QUERYBUF_TIME32:
+		case VIDIOC_QBUF_TIME32:
+		case VIDIOC_DQBUF_TIME32:
+		case VIDIOC_PREPARE_BUF_TIME32: {
+			struct v4l2_buffer_time32 vb32;
+			struct v4l2_buffer *vb = parg;
+
+			if (copy_from_user(&vb32, arg, sizeof(vb32)))
+				return -EFAULT;
+
+			*vb = (struct v4l2_buffer) {
+				.index		= vb32.index,
+					.type		= vb32.type,
+					.bytesused	= vb32.bytesused,
+					.flags		= vb32.flags,
+					.field		= vb32.field,
+					.timestamp.tv_sec	= vb32.timestamp.tv_sec,
+					.timestamp.tv_usec	= vb32.timestamp.tv_usec,
+					.timecode	= vb32.timecode,
+					.sequence	= vb32.sequence,
+					.memory		= vb32.memory,
+					.m.userptr	= vb32.m.userptr,
+					.length		= vb32.length,
+					.request_fd	= vb32.request_fd,
+			};
+			break;
+		}
+#endif
+		}
 	}
 
-	return 0;
+	/* zero out anything we don't copy from userspace */
+	if (!err && n < _IOC_SIZE(real_cmd))
+		memset((u8 *)parg + n, 0, _IOC_SIZE(real_cmd) - n);
+	return err;
 }
 
-static int video_put_user(void __user *arg, void *parg, unsigned int cmd)
+static int video_put_user(void __user *arg, void *parg,
+			  unsigned int real_cmd, unsigned int cmd)
 {
 	if (!(_IOC_DIR(cmd) & _IOC_READ))
 		return 0;
 
+	if (cmd == real_cmd) {
+		/*  Copy results into user buffer  */
+		if (copy_to_user(arg, parg, _IOC_SIZE(cmd)))
+			return -EFAULT;
+		return 0;
+	}
+
+	if (in_compat_syscall())
+		return v4l2_compat_put_user(arg, parg, cmd);
+
 	switch (cmd) {
 #ifdef CONFIG_COMPAT_32BIT_TIME
 	case VIDIOC_DQEVENT_TIME32: {
@@ -3236,11 +3250,6 @@ static int video_put_user(void __user *arg, void *parg, unsigned int cmd)
 		break;
 	}
 #endif
-	default:
-		/*  Copy results into user buffer  */
-		if (copy_to_user(arg, parg, _IOC_SIZE(cmd)))
-			return -EFAULT;
-		break;
 	}
 
 	return 0;
@@ -3274,8 +3283,8 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
 			parg = mbuf;
 		}
 
-		err = video_get_user((void __user *)arg, parg, orig_cmd,
-				     &always_copy);
+		err = video_get_user((void __user *)arg, parg, cmd,
+				     orig_cmd, &always_copy);
 		if (err)
 			goto out;
 	}
@@ -3297,7 +3306,14 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
 		if (NULL == mbuf)
 			goto out_array_args;
 		err = -EFAULT;
-		if (copy_from_user(mbuf, user_ptr, array_size))
+		if (in_compat_syscall())
+			err = v4l2_compat_get_array_args(file, mbuf, user_ptr,
+							 array_size, orig_cmd,
+							 parg);
+		else
+			err = copy_from_user(mbuf, user_ptr, array_size) ?
+								-EFAULT : 0;
+		if (err)
 			goto out_array_args;
 		*kernel_ptr = mbuf;
 	}
@@ -3318,8 +3334,17 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
 
 	if (has_array_args) {
 		*kernel_ptr = (void __force *)user_ptr;
-		if (copy_to_user(user_ptr, mbuf, array_size))
+		if (in_compat_syscall()) {
+			int put_err;
+
+			put_err = v4l2_compat_put_array_args(file, user_ptr, mbuf,
+							     array_size, orig_cmd,
+							     parg);
+			if (put_err)
+				err = put_err;
+		} else if (copy_to_user(user_ptr, mbuf, array_size)) {
 			err = -EFAULT;
+		}
 		goto out_array_args;
 	}
 	/*
@@ -3330,7 +3355,7 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
 		goto out;
 
 out_array_args:
-	if (video_put_user((void __user *)arg, parg, orig_cmd))
+	if (video_put_user((void __user *)arg, parg, cmd, orig_cmd))
 		err = -EFAULT;
 out:
 	kvfree(mbuf);
diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
index 86878fba332b..0db79f36c496 100644
--- a/include/media/v4l2-ioctl.h
+++ b/include/media/v4l2-ioctl.h
@@ -686,6 +686,17 @@ long int v4l2_compat_ioctl32(struct file *file, unsigned int cmd,
 			     unsigned long arg);
 #endif
 
+unsigned int v4l2_compat_translate_cmd(unsigned int cmd);
+int v4l2_compat_get_user(void __user *arg, void *parg, unsigned int cmd);
+int v4l2_compat_put_user(void __user *arg, void *parg, unsigned int cmd);
+int v4l2_compat_get_array_args(struct file *file, void *mbuf,
+			       void __user *user_ptr, size_t array_size,
+			       unsigned int cmd, void *arg);
+int v4l2_compat_put_array_args(struct file *file, void __user *user_ptr,
+			       void *mbuf, size_t array_size,
+			       unsigned int cmd, void *arg);
+
+
 /**
  * typedef v4l2_kioctl - Typedef used to pass an ioctl handler.
  *
-- 
2.27.0

