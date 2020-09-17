Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EBC926E020
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 17:58:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728172AbgIQP60 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 11:58:26 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:49895 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728244AbgIQPru (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 11:47:50 -0400
Received: from threadripper.lan ([149.172.98.151]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1Mum2d-1kZdjl0yJv-00rnX4; Thu, 17 Sep 2020 17:28:26 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     linux-media@vger.kernel.org, mchehab@kernel.org, hverkuil@xs4all.nl
Cc:     hch@lst.de, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 3/8] media: v4l2: move v4l2_ext_controls conversion
Date:   Thu, 17 Sep 2020 17:28:18 +0200
Message-Id: <20200917152823.1241599-4-arnd@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200917152823.1241599-1-arnd@arndb.de>
References: <20200917152823.1241599-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ES95WvyRSQsf97A6EisoNS3E0xJveE8Ka/nUY4xQYEcGI+ckiFY
 hKHaeFAPwIvIrjAnWGB7JkdYR57VMHEH3feKPvO5PWxg+fv8ljzcbCS8BN9ns7ipHPNH/8J
 LG0TdGilFje7xevw4lwTVUQqB01nB2cO0+BrV+n4HYJgVqDO0F3CoAol6SMAEwJXHCykHVt
 4n9psSMbXpPeUKHrSTRYQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oVjGvnPcRuw=:CWwU8Vg4rQ1+UrmfKnI5bp
 kXYu8D6JyTJWu2o0zLiYSqUZBjwMaR8tBCLO21ga4lx+HzLJwtTISykQBuTqXMuAK8SbqCBww
 9CV6fpKhuDNGEnXY6CU6lCt92neNTJJERAWYxj1nlHzXqQmyebBY6+8z+lwSxINvMT5xHRMon
 +Fzi0B4JjpvpEUEFzXzXYzmZcRf/+MuRn9tDtYZ30OdEewm1W19t7+X8wBHmFvK+HuXnaSm/z
 KQY7G0Juo9aB70RrjHI8zoqGIvkbLccCLgqNdCmJ88rNMq278MYD1PYsx7uCl99zZ0YFwaI/5
 FD9ARWKKgR+HplCXcIXi5wJs/niVhTVL4B0m4QS9Ovx9poOH1q4aeLLD5//W8DpFbp5XYOJxc
 1yQSCG8hUdbweGLuKzgs3fb9ttbl2JpHGswFNdjZBMjQPvaLdC/lnHGJOY8ZMpqokx9yBVqfW
 RxqeG6bhg13Pcp/8RX7SnwuqLSfnc1pmtAjWlRiU/mVbsEDxZ9e+9NOc3Mix7Mw2QWHuVux4Y
 zLnEJBrtjwF+3Vdy6tAJhStxuHoCVaG5ozTCFDtvwMEaiazoqxGB1FsZkD7prRWef52EHuhmg
 rMk4TPfHsnRYdqs4z/UkRo7DjESwC9brFAshB9U5asQ0XbvBO83lwJc1+5v6eL3RbvK9cgv02
 ivlqbWOzvf/959CAhe8aYbnzkdW1kXawm8+pYayW5pIMNmEv2QUjqoEox1Y961OZkSQBCdmBi
 JxHR47kzEQflRvLkW6WmBHBYzqlomZDpzRWLhprSG4TJJghxqDaqDeh+BsEAap24UOOkt1e/U
 SmQ3/mRRINDfReC8PwUVefpky+EALAK6qR7egKqeU4Rsr4CjCUw7ak2Q4r6fTfQnyFayDJf
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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
index f04e29f3aecc..1471dab71703 100644
--- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
+++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
@@ -1130,142 +1130,44 @@ static inline bool ctrl_is_pointer(struct file *file, u32 id)
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
+		.request_fd	= ec32.error_idx,
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
+		.request_fd	= p64->error_idx,
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
 
@@ -1415,6 +1317,12 @@ static int put_v4l2_edid32(struct v4l2_edid __user *p64,
 unsigned int v4l2_compat_translate_cmd(unsigned int cmd)
 {
 	switch (cmd) {
+	case VIDIOC_G_EXT_CTRLS32:
+		return	VIDIOC_G_EXT_CTRLS;
+	case VIDIOC_S_EXT_CTRLS32:
+		return VIDIOC_S_EXT_CTRLS;
+	case VIDIOC_TRY_EXT_CTRLS32:
+		return VIDIOC_TRY_EXT_CTRLS;
 	}
 	return cmd;
 }
@@ -1422,6 +1330,10 @@ unsigned int v4l2_compat_translate_cmd(unsigned int cmd)
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
@@ -1429,6 +1341,10 @@ int v4l2_compat_get_user(void __user *arg, void *parg, unsigned int cmd)
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
@@ -1440,6 +1356,29 @@ int v4l2_compat_get_array_args(struct file *file, void *mbuf,
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
@@ -1456,6 +1395,33 @@ int v4l2_compat_put_array_args(struct file *file, void __user *user_ptr,
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
@@ -1465,6 +1431,7 @@ int v4l2_compat_put_array_args(struct file *file, void __user *user_ptr,
 	return err;
 }
 
+
 /**
  * alloc_userspace() - Allocates a 64-bits userspace pointer compatible
  *	for calling the native 64-bits version of an ioctl.
@@ -1535,9 +1502,6 @@ static long do_video_ioctl(struct file *file, unsigned int cmd, unsigned long ar
 	case VIDIOC_ENUMSTD32: ncmd = VIDIOC_ENUMSTD; break;
 	case VIDIOC_ENUMINPUT32: ncmd = VIDIOC_ENUMINPUT; break;
 	case VIDIOC_TRY_FMT32: ncmd = VIDIOC_TRY_FMT; break;
-	case VIDIOC_G_EXT_CTRLS32: ncmd = VIDIOC_G_EXT_CTRLS; break;
-	case VIDIOC_S_EXT_CTRLS32: ncmd = VIDIOC_S_EXT_CTRLS; break;
-	case VIDIOC_TRY_EXT_CTRLS32: ncmd = VIDIOC_TRY_EXT_CTRLS; break;
 #ifdef CONFIG_X86_64
 	case VIDIOC_DQEVENT32: ncmd = VIDIOC_DQEVENT; break;
 	case VIDIOC_DQEVENT32_TIME32: ncmd = VIDIOC_DQEVENT_TIME32; break;
@@ -1653,20 +1617,6 @@ static long do_video_ioctl(struct file *file, unsigned int cmd, unsigned long ar
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
@@ -1709,12 +1659,6 @@ static long do_video_ioctl(struct file *file, unsigned int cmd, unsigned long ar
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

