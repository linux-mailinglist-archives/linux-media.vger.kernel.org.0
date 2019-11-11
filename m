Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56CEBF8165
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2019 21:39:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727763AbfKKUi6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Nov 2019 15:38:58 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:37929 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727511AbfKKUit (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Nov 2019 15:38:49 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MBSJT-1icHDb3sxb-00D3PP; Mon, 11 Nov 2019 21:38:40 +0100
From:   Arnd Bergmann <arnd@arndb.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org,
        y2038@lists.linaro.org, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v4 8/8] media: v4l2-core: fix compat v4l2_buffer handling for time64 ABI
Date:   Mon, 11 Nov 2019 21:38:35 +0100
Message-Id: <20191111203835.2260382-9-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191111203835.2260382-1-arnd@arndb.de>
References: <20191111203835.2260382-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MrzW6KJa1cIaWEauAUsNfILMCmUCCIJRbO7mZrMOYju3SuZ5841
 DSEaZeGFnl5tSaUYjEjUAtPeL9ION1/wRfxjAbl05x6JTSkWgkJNXwWyXEpgQ8aaAPybzqi
 b5QkWuRu0IK3YrsUZEXABBalVsGDu7I0gOXQDrLahldiaE3RwSjTkHFDSkslG1AF6DaJkmE
 8Q7o7CrkE8k7sJHgMAXKw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VMM2+5IuRSY=:N4bvnr7GejUzA18HYGrMvk
 XWYNdKkHm7u7Q7ehYul8ZU6Z5BVGp6xmwBFr8oAVScmswWRe11qdmvz915BpG3IYp4M8tvqo4
 c4WDeso+potaP8VtaAwRmFx4DW5m4Rx75sOZ3aF4D8Dh9MbpUwQ5BrMgJTxv3+N1VMF80RL/F
 T1lwjt17rtiDwHDRLwKu0T2wofDUPcnmq8wZW02fNtVN8t8Y5HlUmpN6RTJr9zBS4DjNzBqkA
 RXWQne3cOWgnGYoWNBSib7LIlizjhr4JJV7Fv0EekEHx8ZNLa/oAGcEZuhqSk09idamB5vIYc
 4S8hOfqdFtWMplEGjXw0CSTaWsNt31vCyB743BGGDbv7hcf9NvmnuqeoTASiuoy+GhZ3oARxn
 Hjj5KKacL97ZiZOC/gmgXsnIV0yiVl6uEPXnbBybMbF6rPdix51p7mGLUL81LpRwUFk/gDU3x
 9o3C5eXORkX9ub7/WlXx5/EFY3vui6EidtOg+mHGiSLnGucv+9AwpV5TnF8wkhyPHX7RrUX0F
 AeBZIeneV8WiE4SLV5doIZA8kX+IJItmKs03dHOPi3ZSV2z+XDfBQhZ9HOYrsS97xhEj3DZ2i
 sqw2Oobq/AtMShIhqLV0reQ++bHaOX6E1nveDS7nBDoo3y42GlfnJg7vTkTQAhyx85Z3b5GS2
 59xgeP0Fm7slw3COpyDYjYeKHtimowStotJvXcIjNoB/jxujw/hYnFmdUOasBKKEigJAwVVL5
 Ip59xGUzmgAxdXOK/xfHPsOvYv0L6LymLT5g2196FOz2fUwP9vhYKdNf2VmhcictUtMJVJM0M
 fMawAoehoN0+HIKx79MAJisZyW9LDK9rmAw3ro/BZx2n74kgzxe58FJlCW/WmHfJ9igTqrsQ2
 XigDXyK4L4XOfpR4NXFA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for the four new variants of ioctl commands for 64-bit time_t
in v4l2_buffer.

The existing v4l2_buffer32 structure for the traditional format gets
changed to match the new v4l2_buffer format, and the old layout is
now called v4l2_buffer32_time32. Neither of these matches the native
64-bit architecture format of v4l2_buffer, so both require special
handling in compat code.

Duplicating the existing handlers for the new types is a safe conversion
for now, but unfortunately this may turn into a maintenance burden
later. A larger-scale rework of the compat code might be a better
alternative, but is out of scope of the y2038 work.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 265 +++++++++++++++++-
 1 file changed, 264 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
index 46cd84879c1f..3bbf47d950e0 100644
--- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
+++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
@@ -474,7 +474,33 @@ struct v4l2_buffer32 {
 	__u32			bytesused;
 	__u32			flags;
 	__u32			field;	/* enum v4l2_field */
-	struct compat_timeval	timestamp;
+	struct {
+		long long	tv_sec;
+		long long	tv_usec;
+	}			timestamp;
+	struct v4l2_timecode	timecode;
+	__u32			sequence;
+
+	/* memory location */
+	__u32			memory;	/* enum v4l2_memory */
+	union {
+		__u32           offset;
+		compat_long_t   userptr;
+		compat_caddr_t  planes;
+		__s32		fd;
+	} m;
+	__u32			length;
+	__u32			reserved2;
+	__s32			request_fd;
+};
+
+struct v4l2_buffer32_time32 {
+	__u32			index;
+	__u32			type;	/* enum v4l2_buf_type */
+	__u32			bytesused;
+	__u32			flags;
+	__u32			field;	/* enum v4l2_field */
+	struct old_timeval32	timestamp;
 	struct v4l2_timecode	timecode;
 	__u32			sequence;
 
@@ -581,6 +607,31 @@ static int bufsize_v4l2_buffer(struct v4l2_buffer32 __user *p32, u32 *size)
 	return 0;
 }
 
+static int bufsize_v4l2_buffer_time32(struct v4l2_buffer32_time32 __user *p32, u32 *size)
+{
+	u32 type;
+	u32 length;
+
+	if (!access_ok(p32, sizeof(*p32)) ||
+	    get_user(type, &p32->type) ||
+	    get_user(length, &p32->length))
+		return -EFAULT;
+
+	if (V4L2_TYPE_IS_MULTIPLANAR(type)) {
+		if (length > VIDEO_MAX_PLANES)
+			return -EINVAL;
+
+		/*
+		 * We don't really care if userspace decides to kill itself
+		 * by passing a very big length value
+		 */
+		*size = length * sizeof(struct v4l2_plane);
+	} else {
+		*size = 0;
+	}
+	return 0;
+}
+
 static int get_v4l2_buffer32(struct v4l2_buffer __user *p64,
 			     struct v4l2_buffer32 __user *p32,
 			     void __user *aux_buf, u32 aux_space)
@@ -681,6 +732,106 @@ static int get_v4l2_buffer32(struct v4l2_buffer __user *p64,
 	return 0;
 }
 
+static int get_v4l2_buffer32_time32(struct v4l2_buffer_time32 __user *p64,
+				    struct v4l2_buffer32_time32 __user *p32,
+				    void __user *aux_buf, u32 aux_space)
+{
+	u32 type;
+	u32 length;
+	s32 request_fd;
+	enum v4l2_memory memory;
+	struct v4l2_plane32 __user *uplane32;
+	struct v4l2_plane __user *uplane;
+	compat_caddr_t p;
+	int ret;
+
+	if (!access_ok(p32, sizeof(*p32)) ||
+	    assign_in_user(&p64->index, &p32->index) ||
+	    get_user(type, &p32->type) ||
+	    put_user(type, &p64->type) ||
+	    assign_in_user(&p64->flags, &p32->flags) ||
+	    get_user(memory, &p32->memory) ||
+	    put_user(memory, &p64->memory) ||
+	    get_user(length, &p32->length) ||
+	    put_user(length, &p64->length) ||
+	    get_user(request_fd, &p32->request_fd) ||
+	    put_user(request_fd, &p64->request_fd))
+		return -EFAULT;
+
+	if (V4L2_TYPE_IS_OUTPUT(type))
+		if (assign_in_user(&p64->bytesused, &p32->bytesused) ||
+		    assign_in_user(&p64->field, &p32->field) ||
+		    assign_in_user(&p64->timestamp.tv_sec,
+				   &p32->timestamp.tv_sec) ||
+		    assign_in_user(&p64->timestamp.tv_usec,
+				   &p32->timestamp.tv_usec))
+			return -EFAULT;
+
+	if (V4L2_TYPE_IS_MULTIPLANAR(type)) {
+		u32 num_planes = length;
+
+		if (num_planes == 0) {
+			/*
+			 * num_planes == 0 is legal, e.g. when userspace doesn't
+			 * need planes array on DQBUF
+			 */
+			return put_user(NULL, &p64->m.planes);
+		}
+		if (num_planes > VIDEO_MAX_PLANES)
+			return -EINVAL;
+
+		if (get_user(p, &p32->m.planes))
+			return -EFAULT;
+
+		uplane32 = compat_ptr(p);
+		if (!access_ok(uplane32,
+			       num_planes * sizeof(*uplane32)))
+			return -EFAULT;
+
+		/*
+		 * We don't really care if userspace decides to kill itself
+		 * by passing a very big num_planes value
+		 */
+		if (aux_space < num_planes * sizeof(*uplane))
+			return -EFAULT;
+
+		uplane = aux_buf;
+		if (put_user_force(uplane, &p64->m.planes))
+			return -EFAULT;
+
+		while (num_planes--) {
+			ret = get_v4l2_plane32(uplane, uplane32, memory);
+			if (ret)
+				return ret;
+			uplane++;
+			uplane32++;
+		}
+	} else {
+		switch (memory) {
+		case V4L2_MEMORY_MMAP:
+		case V4L2_MEMORY_OVERLAY:
+			if (assign_in_user(&p64->m.offset, &p32->m.offset))
+				return -EFAULT;
+			break;
+		case V4L2_MEMORY_USERPTR: {
+			compat_ulong_t userptr;
+
+			if (get_user(userptr, &p32->m.userptr) ||
+			    put_user((unsigned long)compat_ptr(userptr),
+				     &p64->m.userptr))
+				return -EFAULT;
+			break;
+		}
+		case V4L2_MEMORY_DMABUF:
+			if (assign_in_user(&p64->m.fd, &p32->m.fd))
+				return -EFAULT;
+			break;
+		}
+	}
+
+	return 0;
+}
+
 static int put_v4l2_buffer32(struct v4l2_buffer __user *p64,
 			     struct v4l2_buffer32 __user *p32)
 {
@@ -761,6 +912,87 @@ static int put_v4l2_buffer32(struct v4l2_buffer __user *p64,
 	return 0;
 }
 
+
+static int put_v4l2_buffer32_time32(struct v4l2_buffer_time32 __user *p64,
+				    struct v4l2_buffer32_time32 __user *p32)
+{
+	u32 type;
+	u32 length;
+	enum v4l2_memory memory;
+	struct v4l2_plane32 __user *uplane32;
+	struct v4l2_plane *uplane;
+	compat_caddr_t p;
+	int ret;
+
+	if (!access_ok(p32, sizeof(*p32)) ||
+	    assign_in_user(&p32->index, &p64->index) ||
+	    get_user(type, &p64->type) ||
+	    put_user(type, &p32->type) ||
+	    assign_in_user(&p32->flags, &p64->flags) ||
+	    get_user(memory, &p64->memory) ||
+	    put_user(memory, &p32->memory))
+		return -EFAULT;
+
+	if (assign_in_user(&p32->bytesused, &p64->bytesused) ||
+	    assign_in_user(&p32->field, &p64->field) ||
+	    assign_in_user(&p32->timestamp.tv_sec, &p64->timestamp.tv_sec) ||
+	    assign_in_user(&p32->timestamp.tv_usec, &p64->timestamp.tv_usec) ||
+	    copy_in_user(&p32->timecode, &p64->timecode, sizeof(p64->timecode)) ||
+	    assign_in_user(&p32->sequence, &p64->sequence) ||
+	    assign_in_user(&p32->reserved2, &p64->reserved2) ||
+	    assign_in_user(&p32->request_fd, &p64->request_fd) ||
+	    get_user(length, &p64->length) ||
+	    put_user(length, &p32->length))
+		return -EFAULT;
+
+	if (V4L2_TYPE_IS_MULTIPLANAR(type)) {
+		u32 num_planes = length;
+
+		if (num_planes == 0)
+			return 0;
+		/* We need to define uplane without __user, even though
+		 * it does point to data in userspace here. The reason is
+		 * that v4l2-ioctl.c copies it from userspace to kernelspace,
+		 * so its definition in videodev2.h doesn't have a
+		 * __user markup. Defining uplane with __user causes
+		 * smatch warnings, so instead declare it without __user
+		 * and cast it as a userspace pointer to put_v4l2_plane32().
+		 */
+		if (get_user(uplane, &p64->m.planes))
+			return -EFAULT;
+		if (get_user(p, &p32->m.planes))
+			return -EFAULT;
+		uplane32 = compat_ptr(p);
+
+		while (num_planes--) {
+			ret = put_v4l2_plane32((void __user *)uplane,
+					       uplane32, memory);
+			if (ret)
+				return ret;
+			++uplane;
+			++uplane32;
+		}
+	} else {
+		switch (memory) {
+		case V4L2_MEMORY_MMAP:
+		case V4L2_MEMORY_OVERLAY:
+			if (assign_in_user(&p32->m.offset, &p64->m.offset))
+				return -EFAULT;
+			break;
+		case V4L2_MEMORY_USERPTR:
+			if (assign_in_user(&p32->m.userptr, &p64->m.userptr))
+				return -EFAULT;
+			break;
+		case V4L2_MEMORY_DMABUF:
+			if (assign_in_user(&p32->m.fd, &p64->m.fd))
+				return -EFAULT;
+			break;
+		}
+	}
+
+	return 0;
+}
+
 struct v4l2_framebuffer32 {
 	__u32			capability;
 	__u32			flags;
@@ -1147,10 +1379,13 @@ static int put_v4l2_edid32(struct v4l2_edid __user *p64,
 #define VIDIOC_G_FMT32		_IOWR('V',  4, struct v4l2_format32)
 #define VIDIOC_S_FMT32		_IOWR('V',  5, struct v4l2_format32)
 #define VIDIOC_QUERYBUF32	_IOWR('V',  9, struct v4l2_buffer32)
+#define VIDIOC_QUERYBUF32_TIME32 _IOWR('V',  9, struct v4l2_buffer32_time32)
 #define VIDIOC_G_FBUF32		_IOR ('V', 10, struct v4l2_framebuffer32)
 #define VIDIOC_S_FBUF32		_IOW ('V', 11, struct v4l2_framebuffer32)
 #define VIDIOC_QBUF32		_IOWR('V', 15, struct v4l2_buffer32)
+#define VIDIOC_QBUF32_TIME32	_IOWR('V', 15, struct v4l2_buffer32_time32)
 #define VIDIOC_DQBUF32		_IOWR('V', 17, struct v4l2_buffer32)
+#define VIDIOC_DQBUF32_TIME32	_IOWR('V', 17, struct v4l2_buffer32_time32)
 #define VIDIOC_ENUMSTD32	_IOWR('V', 25, struct v4l2_standard32)
 #define VIDIOC_ENUMINPUT32	_IOWR('V', 26, struct v4l2_input32)
 #define VIDIOC_G_EDID32		_IOWR('V', 40, struct v4l2_edid32)
@@ -1163,6 +1398,7 @@ static int put_v4l2_edid32(struct v4l2_edid __user *p64,
 #define	VIDIOC_DQEVENT32_TIME32	_IOR ('V', 89, struct v4l2_event32_time32)
 #define VIDIOC_CREATE_BUFS32	_IOWR('V', 92, struct v4l2_create_buffers32)
 #define VIDIOC_PREPARE_BUF32	_IOWR('V', 93, struct v4l2_buffer32)
+#define VIDIOC_PREPARE_BUF32_TIME32 _IOWR('V', 93, struct v4l2_buffer32_time32)
 
 #define VIDIOC_OVERLAY32	_IOW ('V', 14, s32)
 #define VIDIOC_STREAMON32	_IOW ('V', 18, s32)
@@ -1232,10 +1468,13 @@ static long do_video_ioctl(struct file *file, unsigned int cmd, unsigned long ar
 	case VIDIOC_G_FMT32: ncmd = VIDIOC_G_FMT; break;
 	case VIDIOC_S_FMT32: ncmd = VIDIOC_S_FMT; break;
 	case VIDIOC_QUERYBUF32: ncmd = VIDIOC_QUERYBUF; break;
+	case VIDIOC_QUERYBUF32_TIME32: ncmd = VIDIOC_QUERYBUF_TIME32; break;
 	case VIDIOC_G_FBUF32: ncmd = VIDIOC_G_FBUF; break;
 	case VIDIOC_S_FBUF32: ncmd = VIDIOC_S_FBUF; break;
 	case VIDIOC_QBUF32: ncmd = VIDIOC_QBUF; break;
+	case VIDIOC_QBUF32_TIME32: ncmd = VIDIOC_QBUF_TIME32; break;
 	case VIDIOC_DQBUF32: ncmd = VIDIOC_DQBUF; break;
+	case VIDIOC_DQBUF32_TIME32: ncmd = VIDIOC_DQBUF_TIME32; break;
 	case VIDIOC_ENUMSTD32: ncmd = VIDIOC_ENUMSTD; break;
 	case VIDIOC_ENUMINPUT32: ncmd = VIDIOC_ENUMINPUT; break;
 	case VIDIOC_TRY_FMT32: ncmd = VIDIOC_TRY_FMT; break;
@@ -1255,6 +1494,7 @@ static long do_video_ioctl(struct file *file, unsigned int cmd, unsigned long ar
 	case VIDIOC_S_OUTPUT32: ncmd = VIDIOC_S_OUTPUT; break;
 	case VIDIOC_CREATE_BUFS32: ncmd = VIDIOC_CREATE_BUFS; break;
 	case VIDIOC_PREPARE_BUF32: ncmd = VIDIOC_PREPARE_BUF; break;
+	case VIDIOC_PREPARE_BUF32_TIME32: ncmd = VIDIOC_PREPARE_BUF_TIME32; break;
 	case VIDIOC_G_EDID32: ncmd = VIDIOC_G_EDID; break;
 	case VIDIOC_S_EDID32: ncmd = VIDIOC_S_EDID; break;
 	default: ncmd = cmd; break;
@@ -1336,6 +1576,22 @@ static long do_video_ioctl(struct file *file, unsigned int cmd, unsigned long ar
 		compatible_arg = 0;
 		break;
 
+	case VIDIOC_PREPARE_BUF32_TIME32:
+	case VIDIOC_QUERYBUF32_TIME32:
+	case VIDIOC_QBUF32_TIME32:
+	case VIDIOC_DQBUF32_TIME32:
+		err = bufsize_v4l2_buffer_time32(p32, &aux_space);
+		if (!err)
+			err = alloc_userspace(sizeof(struct v4l2_buffer),
+					      aux_space, &new_p64);
+		if (!err) {
+			aux_buf = new_p64 + sizeof(struct v4l2_buffer);
+			err = get_v4l2_buffer32_time32(new_p64, p32,
+						       aux_buf, aux_space);
+		}
+		compatible_arg = 0;
+		break;
+
 	case VIDIOC_S_FBUF32:
 		err = alloc_userspace(sizeof(struct v4l2_framebuffer), 0,
 				      &new_p64);
@@ -1484,6 +1740,13 @@ static long do_video_ioctl(struct file *file, unsigned int cmd, unsigned long ar
 		err = put_v4l2_buffer32(new_p64, p32);
 		break;
 
+	case VIDIOC_PREPARE_BUF32_TIME32:
+	case VIDIOC_QUERYBUF32_TIME32:
+	case VIDIOC_QBUF32_TIME32:
+	case VIDIOC_DQBUF32_TIME32:
+		err = put_v4l2_buffer32_time32(new_p64, p32);
+		break;
+
 	case VIDIOC_ENUMSTD32:
 		err = put_v4l2_standard32(new_p64, p32);
 		break;
-- 
2.20.0

