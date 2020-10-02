Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F89D28153E
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 16:32:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388083AbgJBOcr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 10:32:47 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:50237 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387919AbgJBOcr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 2 Oct 2020 10:32:47 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id OM6zkdmibTHgxOM72k0ef4; Fri, 02 Oct 2020 16:32:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1601649165; bh=OBKdwRR+8ara8mmMXgh6Qp1+CsYWpLsNm1wUlQAoelI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=rbK+QVMC/1Tp64bN07fz+3tGH5qWbmxVVgvVluSNc2OuUoT3Y3YjDgu1/nPta7pzb
         LSqpiy5iG7bM2F0UvgQ63j6GkwVN7LyIP0A6OGK2PAeI4UlP61qaAqH2M9nGfXE9gs
         XCNPWhdCqf2Rs7kDM3Nwx6mu2RB8au0mOcN5mnniBeiH9OqK+o0FcWdFF2srho7o8S
         AZ94VqLkA7HTyc0QK+Rvf/+9Gblru8zSL7H/hkDYTSuASNoxvk/Jel+tQzxkI4bIh0
         qj98pywapT0kOKe0VQ9Qs6y71MQz17xEiyzxnKYLZGkgZdIRopTqrfK9GJHkAY9s1w
         Ioiw8weuLtGuw==
Subject: Re: [PATCH 0/8] media: v4l2: simplify compat ioctl handling
To:     Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
        mchehab@kernel.org
Cc:     hch@lst.de, linux-kernel@vger.kernel.org
References: <20200917152823.1241599-1-arnd@arndb.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <cbbed130-3329-85a5-f360-3537391c1569@xs4all.nl>
Date:   Fri, 2 Oct 2020 16:32:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200917152823.1241599-1-arnd@arndb.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLefJsCDG8ET1o3Di6l0z+V4qHB44VhEKwHxMQU1rFPTfCiOPY2a95Dl75RAOw9YdFHlZThhTfI6IQ3QCZe7OWO9iZV4NCbtAxdyzF7x76ognpCckO62
 foNm8nCjVPgmY7rRMhsSnlqmlwRSgnceO7gcu7EtC/rYwEamHAKurcA+3M+RwFZd/VaZSpy1JQEf6sr+X26+YqhtBPQA1sk/+1aT7Trr7TTl+MBe9sDpN/ft
 E3q08ktFolxsLneN0egS0+b4MSYWkLRVYHAlziLJA06tU46ppg4m+pmYCahcYaEY
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Arnd,

On 17/09/2020 17:28, Arnd Bergmann wrote:
> I have a series to remove all uses of compat_alloc_user_space()
> and copy_in_user() from the kernel, this is the part of it that
> involves the v4l2 compat code.
> 
> The resulting code is significantly shorter and arguably more
> readable, but I have not done any testing beyond compilation on
> it, so at the minimum this first needs to pass the test suite
> for both native and compat users space.
> 
> Given the complexity of the code, I am fairly sure that there
> are bugs I missed.
> 
> Please review and test if possible.

While testing I found a lot of bugs. Below is a patch that sits on top
of your series and fixes all the bugs:

- put_v4l2_standard32: typo: p64->index -> p64->id
- get_v4l2_plane32: typo: p64 -> plane32
		    typo: duplicate bytesused: the 2nd should be 'length'
- put_v4l2_plane32: typo: duplicate bytesused: the 2nd should be 'length'
- get_v4l2_buffer32/get_v4l2_buffer32_time32: missing compat_ptr for vb32.m.userptr
- get_v4l2_buffer32/get_v4l2_buffer32_time32: drop querybuf bool
- put_v4l2_buffer32/put_v4l2_buffer32_time32: add uintptr_t cast for vb->m.userptr
- get_v4l2_ext_controls32: typo: error_idx -> request_fd
- put_v4l2_ext_controls32: typo: error_idx -> request_fd
- v4l2_compat_translate_cmd: missing case VIDIOC_CREATE_BUFS32
- v4l2_compat_translate_cmd: #ifdef CONFIG_COMPAT_32BIT_TIME for
  case VIDIOC_DQEVENT32_TIME32 and return VIDIOC_DQEVENT
- v4l2_compat_put_user: #ifdef CONFIG_COMPAT_32BIT_TIME for case VIDIOC_DQEVENT32_TIME32
- v4l2_compat_get_array_args: typo: p64 -> b64
- v4l2_compat_put_array_args: typo: p64 -> b64
- video_get_user: make sure INFO_FL_CLEAR_MASK is honored, also when in_compat_syscall()
- video_usercopy: err = v4l2_compat_put_array_args overwrote the original ioctl err value.
  Handle this correctly.

I've tested this as well with the y2038 compat mode (i686 with 64-bit time_t)
and that too works fine.

Regards,

	Hans

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
index d20c36ab01b4..e8c823776de0 100644
--- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
+++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
@@ -258,7 +258,7 @@ static int put_v4l2_standard32(struct v4l2_standard *p64,
 			       struct v4l2_standard32 __user *p32)
 {
 	if (put_user(p64->index, &p32->index) ||
-	    put_user(p64->index, &p32->id) ||
+	    put_user(p64->id, &p32->id) ||
 	    copy_to_user(p32->name, p64->name, sizeof(p32->name)) ||
 	    copy_to_user(&p32->frameperiod, &p64->frameperiod,
 			 sizeof(p32->frameperiod)) ||
@@ -358,10 +358,10 @@ static int get_v4l2_plane32(struct v4l2_plane *p64,

 	memset(p64, 0, sizeof(*p64));
 	*p64 = (struct v4l2_plane) {
-		.bytesused	= p64->bytesused,
-		.length		= p64->bytesused,
+		.bytesused	= plane32.bytesused,
+		.length		= plane32.length,
 		.m		= m,
-		.data_offset	= p64->data_offset,
+		.data_offset	= plane32.data_offset,
 	};

 	return 0;
@@ -376,7 +376,7 @@ static int put_v4l2_plane32(struct v4l2_plane *p64,
 	memset(&plane32, 0, sizeof(plane32));
 	plane32 = (struct v4l2_plane32) {
 		.bytesused	= p64->bytesused,
-		.length		= p64->bytesused,
+		.length		= p64->length,
 		.data_offset	= p64->data_offset,
 	};

@@ -400,8 +400,7 @@ static int put_v4l2_plane32(struct v4l2_plane *p64,
 }

 static int get_v4l2_buffer32(struct v4l2_buffer *vb,
-			     struct v4l2_buffer32 __user *arg,
-			     bool querybuf)
+			     struct v4l2_buffer32 __user *arg)
 {
 	struct v4l2_buffer32 vb32;

@@ -431,7 +430,7 @@ static int get_v4l2_buffer32(struct v4l2_buffer *vb,
 		vb->m.offset = vb32.m.offset;
 		break;
 	case V4L2_MEMORY_USERPTR:
-		vb->m.userptr = vb32.m.userptr;
+		vb->m.userptr = (unsigned long)compat_ptr(vb32.m.userptr);
 		break;
 	case V4L2_MEMORY_DMABUF:
 		vb->m.fd = vb32.m.fd;
@@ -442,16 +441,12 @@ static int get_v4l2_buffer32(struct v4l2_buffer *vb,
 		vb->m.planes = (void __force *)
 				compat_ptr(vb32.m.planes);

-	if (querybuf)
-		vb->request_fd = 0;
-
 	return 0;
 }

 #ifdef CONFIG_COMPAT_32BIT_TIME
 static int get_v4l2_buffer32_time32(struct v4l2_buffer *vb,
-				    struct v4l2_buffer32_time32 __user *arg,
-				    bool querybuf)
+				    struct v4l2_buffer32_time32 __user *arg)
 {
 	struct v4l2_buffer32_time32 vb32;

@@ -479,7 +474,7 @@ static int get_v4l2_buffer32_time32(struct v4l2_buffer *vb,
 		vb->m.offset = vb32.m.offset;
 		break;
 	case V4L2_MEMORY_USERPTR:
-		vb->m.userptr = vb32.m.userptr;
+		vb->m.userptr = (unsigned long)compat_ptr(vb32.m.userptr);
 		break;
 	case V4L2_MEMORY_DMABUF:
 		vb->m.fd = vb32.m.fd;
@@ -489,8 +484,6 @@ static int get_v4l2_buffer32_time32(struct v4l2_buffer *vb,
 	if (V4L2_TYPE_IS_MULTIPLANAR(vb->type))
 		vb->m.planes = (void __force *)
 				compat_ptr(vb32.m.planes);
-	if (querybuf)
-		vb->request_fd = 0;

 	return 0;
 }
@@ -524,7 +517,7 @@ static int put_v4l2_buffer32(struct v4l2_buffer *vb,
 		vb32.m.offset = vb->m.offset;
 		break;
 	case V4L2_MEMORY_USERPTR:
-		vb32.m.userptr = vb->m.userptr;
+		vb32.m.userptr = (uintptr_t)(vb->m.userptr);
 		break;
 	case V4L2_MEMORY_DMABUF:
 		vb32.m.fd = vb->m.fd;
@@ -568,7 +561,7 @@ static int put_v4l2_buffer32_time32(struct v4l2_buffer *vb,
 		vb32.m.offset = vb->m.offset;
 		break;
 	case V4L2_MEMORY_USERPTR:
-		vb32.m.userptr = vb->m.userptr;
+		vb32.m.userptr = (uintptr_t)(vb->m.userptr);
 		break;
 	case V4L2_MEMORY_DMABUF:
 		vb32.m.fd = vb->m.fd;
@@ -722,7 +715,7 @@ static int get_v4l2_ext_controls32(struct v4l2_ext_controls *p64,
 		.which		= ec32.which,
 		.count		= ec32.count,
 		.error_idx	= ec32.error_idx,
-		.request_fd	= ec32.error_idx,
+		.request_fd	= ec32.request_fd,
 		.reserved[0]	= ec32.reserved[0],
 		.controls	= (void __force *)compat_ptr(ec32.controls),
 	};
@@ -740,7 +733,7 @@ static int put_v4l2_ext_controls32(struct v4l2_ext_controls *p64,
 		.which		= p64->which,
 		.count		= p64->count,
 		.error_idx	= p64->error_idx,
-		.request_fd	= p64->error_idx,
+		.request_fd	= p64->request_fd,
 		.reserved[0]	= p64->reserved[0],
 		.controls	= (uintptr_t)p64->controls,
 	};
@@ -910,8 +903,10 @@ unsigned int v4l2_compat_translate_cmd(unsigned int cmd)
 		return VIDIOC_QBUF;
 	case VIDIOC_DQBUF32:
 		return VIDIOC_DQBUF;
+	case VIDIOC_CREATE_BUFS32:
+		return VIDIOC_CREATE_BUFS;
 	case VIDIOC_G_EXT_CTRLS32:
-		return	VIDIOC_G_EXT_CTRLS;
+		return VIDIOC_G_EXT_CTRLS;
 	case VIDIOC_S_EXT_CTRLS32:
 		return VIDIOC_S_EXT_CTRLS;
 	case VIDIOC_TRY_EXT_CTRLS32:
@@ -929,8 +924,10 @@ unsigned int v4l2_compat_translate_cmd(unsigned int cmd)
 #ifdef CONFIG_X86_64
 	case VIDIOC_DQEVENT32:
 		return VIDIOC_DQEVENT;
+#ifdef CONFIG_COMPAT_32BIT_TIME
 	case VIDIOC_DQEVENT32_TIME32:
-		return VIDIOC_DQEVENT_TIME32;
+		return VIDIOC_DQEVENT;
+#endif
 #endif
 	}
 	return cmd;
@@ -951,15 +948,13 @@ int v4l2_compat_get_user(void __user *arg, void *parg, unsigned int cmd)
 	case VIDIOC_QBUF32_TIME32:
 	case VIDIOC_DQBUF32_TIME32:
 	case VIDIOC_PREPARE_BUF32_TIME32:
-		return get_v4l2_buffer32_time32(parg, arg,
-					cmd == VIDIOC_QUERYBUF32_TIME32);
+		return get_v4l2_buffer32_time32(parg, arg);
 #endif
 	case VIDIOC_QUERYBUF32:
 	case VIDIOC_QBUF32:
 	case VIDIOC_DQBUF32:
 	case VIDIOC_PREPARE_BUF32:
-		return get_v4l2_buffer32(parg, arg,
-					cmd == VIDIOC_QUERYBUF32);
+		return get_v4l2_buffer32(parg, arg);

 	case VIDIOC_G_EXT_CTRLS32:
 	case VIDIOC_S_EXT_CTRLS32:
@@ -1025,8 +1020,10 @@ int v4l2_compat_put_user(void __user *arg, void *parg, unsigned int cmd)
 #ifdef CONFIG_X86_64
 	case VIDIOC_DQEVENT32:
 		return put_v4l2_event32(parg, arg);
+#ifdef CONFIG_COMPAT_32BIT_TIME
 	case VIDIOC_DQEVENT32_TIME32:
 		return put_v4l2_event32_time32(parg, arg);
+#endif
 #endif
 	}
 	return 0;
@@ -1073,9 +1070,10 @@ int v4l2_compat_get_array_args(struct file *file, void *mbuf,
 		struct v4l2_buffer *b64 = arg;
 		struct v4l2_plane *p64 = mbuf;
 		struct v4l2_plane32 __user *p32 = user_ptr;
-		u32 num_planes = p64->length;

 		if (V4L2_TYPE_IS_MULTIPLANAR(b64->type)) {
+			u32 num_planes = b64->length;
+
 			if (num_planes == 0)
 				return 0;

@@ -1161,9 +1159,10 @@ int v4l2_compat_put_array_args(struct file *file, void __user *user_ptr,
 		struct v4l2_buffer *b64 = arg;
 		struct v4l2_plane *p64 = mbuf;
 		struct v4l2_plane32 __user *p32 = user_ptr;
-		u32 num_planes = p64->length;

 		if (V4L2_TYPE_IS_MULTIPLANAR(b64->type)) {
+			u32 num_planes = b64->length;
+
 			if (num_planes == 0)
 				return 0;

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 114eaa79b6f5..aacb13b8f0a9 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3133,7 +3133,8 @@ static int video_get_user(void __user *arg, void *parg,
 			  unsigned int real_cmd, unsigned int cmd,
 			  bool *always_copy)
 {
-	unsigned int n = _IOC_SIZE(cmd);
+	unsigned int n = _IOC_SIZE(real_cmd);
+	int err = 0;

 	if (!(_IOC_DIR(cmd) & _IOC_WRITE)) {
 		/* read-only ioctl */
@@ -3141,70 +3142,64 @@ static int video_get_user(void __user *arg, void *parg,
 		return 0;
 	}

-	if (cmd == real_cmd) {
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
-
-		if (copy_from_user(parg, (void __user *)arg, n))
-			return -EFAULT;
+	/*
+	 * In some cases, only a few fields are used as input,
+	 * i.e. when the app sets "index" and then the driver
+	 * fills in the rest of the structure for the thing
+	 * with that index.  We only need to copy up the first
+	 * non-input field.
+	 */
+	if (v4l2_is_known_ioctl(real_cmd)) {
+		u32 flags = v4l2_ioctls[_IOC_NR(real_cmd)].flags;

-		/* zero out anything we don't copy from userspace */
-		if (n < _IOC_SIZE(cmd))
-			memset((u8 *)parg + n, 0, _IOC_SIZE(cmd) - n);
-		return 0;
+		if (flags & INFO_FL_CLEAR_MASK)
+			n = (flags & INFO_FL_CLEAR_MASK) >> 16;
+		*always_copy = flags & INFO_FL_ALWAYS_COPY;
 	}

-	if (in_compat_syscall())
-		return v4l2_compat_get_user(arg, parg, cmd);
-
-	switch (cmd) {
+	if (cmd == real_cmd) {
+		if (copy_from_user(parg, (void __user *)arg, n))
+			err = -EFAULT;
+	} else if (in_compat_syscall()) {
+		err = v4l2_compat_get_user(arg, parg, cmd);
+	} else {
+		switch (cmd) {
 #ifdef CONFIG_COMPAT_32BIT_TIME
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
-
-		break;
-	}
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
 #endif
+		}
 	}
-	return 0;
+
+	/* zero out anything we don't copy from userspace */
+	if (!err && n < _IOC_SIZE(real_cmd))
+		memset((u8 *)parg + n, 0, _IOC_SIZE(real_cmd) - n);
+	return err;
 }

 static int video_put_user(void __user *arg, void *parg,
@@ -3357,12 +3352,17 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,

 	if (has_array_args) {
 		*kernel_ptr = (void __force *)user_ptr;
-		if (in_compat_syscall())
-			err = v4l2_compat_put_array_args(file, user_ptr, mbuf,
-							 array_size, orig_cmd,
-							 parg);
-		else if (copy_to_user(user_ptr, mbuf, array_size))
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
