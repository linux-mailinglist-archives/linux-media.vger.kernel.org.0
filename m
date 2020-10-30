Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0A662A0BE4
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 17:56:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727327AbgJ3Qz5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 12:55:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:32776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727014AbgJ3Qzz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 12:55:55 -0400
Received: from localhost.localdomain (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 25F7122268;
        Fri, 30 Oct 2020 16:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604076954;
        bh=nD81YqJ3MtrM/BCkwrNITM6ew3jXY2PFsMLpEZfzE5M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=zxz5LHC9rzc/gWUoh0qVZdBPrHnsyiANZM2jgaFdtvAxDc8JhwiieMS5hTBJZG5w/
         yZlNc8HI3S2sABFJ7CuytfdBZr94WUTPtEyclPTnwcyEVeqSHMUYR5LPv04xRcoPVd
         pokL4QSMolGNE8lKONGKlRQtvLvpsP2zWfrRMClk=
From:   Arnd Bergmann <arnd@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
        mchehab@kernel.org, hch@lst.de, linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/8] media: v4l2: remove remaining compat_ioctl
Date:   Fri, 30 Oct 2020 17:55:29 +0100
Message-Id: <20201030165529.1255175-9-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201030165529.1255175-1-arnd@kernel.org>
References: <20201030165529.1255175-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

There are no remaining conversions in v4l2_compat_ioctl32(),
so all the infrastructure for it can be removed, with the
only remaining bit being the compat_ioctl32() callback into
drivers that implement their own incompatible data structures.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 197 +-----------------
 1 file changed, 2 insertions(+), 195 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
index f54f49bebea7..dfab9f662490 100644
--- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
+++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
@@ -23,103 +23,6 @@
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-ioctl.h>
 
-/**
- * assign_in_user() - Copy from one __user var to another one
- *
- * @to: __user var where data will be stored
- * @from: __user var where data will be retrieved.
- *
- * As this code very often needs to allocate userspace memory, it is easier
- * to have a macro that will do both get_user() and put_user() at once.
- *
- * This function complements the macros defined at asm-generic/uaccess.h.
- * It uses the same argument order as copy_in_user()
- */
-#define assign_in_user(to, from)					\
-({									\
-	typeof(*from) __assign_tmp;					\
-									\
-	get_user(__assign_tmp, from) || put_user(__assign_tmp, to);	\
-})
-
-/**
- * get_user_cast() - Stores at a kernelspace local var the contents from a
- *		pointer with userspace data that is not tagged with __user.
- *
- * @__x: var where data will be stored
- * @__ptr: var where data will be retrieved.
- *
- * Sometimes we need to declare a pointer without __user because it
- * comes from a pointer struct field that will be retrieved from userspace
- * by the 64-bit native ioctl handler. This function ensures that the
- * @__ptr will be cast to __user before calling get_user() in order to
- * avoid warnings with static code analyzers like smatch.
- */
-#define get_user_cast(__x, __ptr)					\
-({									\
-	get_user(__x, (typeof(*__ptr) __user *)(__ptr));		\
-})
-
-/**
- * put_user_force() - Stores the contents of a kernelspace local var
- *		      into a userspace pointer, removing any __user cast.
- *
- * @__x: var where data will be stored
- * @__ptr: var where data will be retrieved.
- *
- * Sometimes we need to remove the __user attribute from some data,
- * by passing the __force macro. This function ensures that the
- * @__ptr will be cast with __force before calling put_user(), in order to
- * avoid warnings with static code analyzers like smatch.
- */
-#define put_user_force(__x, __ptr)					\
-({									\
-	put_user((typeof(*__x) __force *)(__x), __ptr);			\
-})
-
-/**
- * assign_in_user_cast() - Copy from one __user var to another one
- *
- * @to: __user var where data will be stored
- * @from: var where data will be retrieved that needs to be cast to __user.
- *
- * As this code very often needs to allocate userspace memory, it is easier
- * to have a macro that will do both get_user_cast() and put_user() at once.
- *
- * This function should be used instead of assign_in_user() when the @from
- * variable was not declared as __user. See get_user_cast() for more details.
- *
- * This function complements the macros defined at asm-generic/uaccess.h.
- * It uses the same argument order as copy_in_user()
- */
-#define assign_in_user_cast(to, from)					\
-({									\
-	typeof(*from) __assign_tmp;					\
-									\
-	get_user_cast(__assign_tmp, from) || put_user(__assign_tmp, to);\
-})
-
-/**
- * native_ioctl - Ancillary function that calls the native 64 bits ioctl
- * handler.
- *
- * @file: pointer to &struct file with the file handler
- * @cmd: ioctl to be called
- * @arg: arguments passed from/to the ioctl handler
- *
- * This function calls the native ioctl handler at v4l2-dev, e. g. v4l2_ioctl()
- */
-static long native_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
-{
-	long ret = -ENOIOCTLCMD;
-
-	if (file->f_op->unlocked_ioctl)
-		ret = file->f_op->unlocked_ioctl(file, cmd, arg);
-
-	return ret;
-}
-
-
 /*
  * Per-ioctl data copy handlers.
  *
@@ -1305,103 +1208,6 @@ int v4l2_compat_put_array_args(struct file *file, void __user *user_ptr,
 	return err;
 }
 
-
-/**
- * alloc_userspace() - Allocates a 64-bits userspace pointer compatible
- *	for calling the native 64-bits version of an ioctl.
- *
- * @size:	size of the structure itself to be allocated.
- * @aux_space:	extra size needed to store "extra" data, e.g. space for
- *		other __user data that is pointed to fields inside the
- *		structure.
- * @new_p64:	pointer to a pointer to be filled with the allocated struct.
- *
- * Return:
- *
- * if it can't allocate memory, either -ENOMEM or -EFAULT will be returned.
- * Zero otherwise.
- */
-static int alloc_userspace(unsigned int size, u32 aux_space,
-			   void __user **new_p64)
-{
-	*new_p64 = compat_alloc_user_space(size + aux_space);
-	if (!*new_p64)
-		return -ENOMEM;
-	if (clear_user(*new_p64, size))
-		return -EFAULT;
-	return 0;
-}
-
-/**
- * do_video_ioctl() - Ancillary function with handles a compat32 ioctl call
- *
- * @file: pointer to &struct file with the file handler
- * @cmd: ioctl to be called
- * @arg: arguments passed from/to the ioctl handler
- *
- * This function is called when a 32 bits application calls a V4L2 ioctl
- * and the Kernel is compiled with 64 bits.
- *
- * This function is called by v4l2_compat_ioctl32() when the function is
- * not private to some specific driver.
- *
- * It converts a 32-bits struct into a 64 bits one, calls the native 64-bits
- * ioctl handler and fills back the 32-bits struct with the results of the
- * native call.
- */
-static long do_video_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
-{
-	void __user *p32 = compat_ptr(arg);
-	void __user *new_p64 = NULL;
-	void __user *aux_buf;
-	u32 aux_space;
-	int compatible_arg = 1;
-	long err = 0;
-	unsigned int ncmd;
-
-	/*
-	 * 1. When struct size is different, converts the command.
-	 */
-	switch (cmd) {
-	default: ncmd = cmd; break;
-	}
-
-	/*
-	 * 2. Allocates a 64-bits userspace pointer to store the
-	 * values of the ioctl and copy data from the 32-bits __user
-	 * argument into it.
-	 */
-	switch (cmd) {
-	}
-	if (err)
-		return err;
-
-	/*
-	 * 3. Calls the native 64-bits ioctl handler.
-	 *
-	 * For the functions where a conversion was not needed,
-	 * compatible_arg is true, and it will call it with the arguments
-	 * provided by userspace and stored at @p32 var.
-	 *
-	 * Otherwise, it will pass the newly allocated @new_p64 argument.
-	 */
-	if (compatible_arg)
-		err = native_ioctl(file, ncmd, (unsigned long)p32);
-	else
-		err = native_ioctl(file, ncmd, (unsigned long)new_p64);
-
-	if (err == -ENOTTY)
-		return err;
-
-	/*
-	 * 5. Copy the data returned at the 64 bits userspace pointer to
-	 * the original 32 bits structure.
-	 */
-	switch (cmd) {
-	}
-	return err;
-}
-
 /**
  * v4l2_compat_ioctl32() - Handles a compat32 ioctl call
  *
@@ -1425,7 +1231,8 @@ long v4l2_compat_ioctl32(struct file *file, unsigned int cmd, unsigned long arg)
 		return ret;
 
 	if (_IOC_TYPE(cmd) == 'V' && _IOC_NR(cmd) < BASE_VIDIOC_PRIVATE)
-		ret = do_video_ioctl(file, cmd, arg);
+		ret = file->f_op->unlocked_ioctl(file, cmd,
+					(unsigned long)compat_ptr(arg));
 	else if (vdev->fops->compat_ioctl32)
 		ret = vdev->fops->compat_ioctl32(file, cmd, arg);
 
-- 
2.27.0

