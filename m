Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6903120850
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 15:16:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728162AbfLPOP1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 09:15:27 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:41585 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728117AbfLPOP0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 09:15:26 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.145]) with ESMTPA (Nemesis) id
 1N94uf-1hatDG2NuR-0163zy; Mon, 16 Dec 2019 15:15:17 +0100
From:   Arnd Bergmann <arnd@arndb.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        y2038@lists.linaro.org, linux-kernel@vger.kernel.org, arnd@arndb.de
Subject: [PATCH v6 8/8] media: v4l2-core: fix compat v4l2_buffer handling for time64 ABI
Date:   Mon, 16 Dec 2019 15:15:06 +0100
Message-Id: <20191216141506.121728-9-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191216141506.121728-1-arnd@arndb.de>
References: <20191216141506.121728-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:K7RdIe5XuU3l5a8tW8CoHF/dAYBWzcUTSNj1wVftXzQ4NLfECmh
 9PRy4zE2H1HoX53vP9MqU5cwsZvivBx2/16gp0r7VVLRH//z05sFq9SNuNXyyl38XZworzx
 53w+LT6LmNiRzccoJdUwKO2wUgQvFHFYzMuD24EvStQUAww/4kuK6j+INwrVn3OqpefL/+j
 L3PZ19VImb530W05hswMA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8c8UypDb5sg=:4nqV0Mrs3JFU7UBiG8J0rR
 unuIZHj07pchqwCcnwGeYiDTcdKQ0hVUd94Ue547eXwbVa9Y+Q1up+cO3nv3LJEcdnXMq2bG/
 X0lEHyplDlwJtZS6rKYEf+7ndkrFaDcYr9keVkmY+Dxgl0WU/qO7BVhbfOm3tjWVJLYxfmxKV
 NiVHfn1Aiae4a6tlECcAk5QzjupUjUXsgGl/3qXJMBmefz0pYUC508ZhCJUXdia1vjqUtXQzV
 V+GEfAejqCepfN/1DQn4shGmAymPaSZUvU9BrsjmwRdx2cGQfPAEXDMzT9Alt6QcrwUY1/ycB
 oMVpoe29e+epsIrQ6V64LdpjB/avq74UOjmn2qKweyKKUItVjFeKdiokavclzUSOaKbxPMxmk
 lb0VUnbg4ICD5t18Z6GZ4+dV4YHjfKta+CHweKlQUf58egQ/lmEAXUc+nfAdUi9pAsrJ9lWaj
 7/rzGlLU6SOeezTGBcSUEgRIq/p+waCXOG/AUnXoNPhe/WPZUmU+uxSvwAOVQqve45lXkS70m
 5pqOtdrPxJg6ibJiNmm5Upk9Jgo97MNzqUfvom0bLsZeZA3Uc6Hw48rSOAQhjoOh0VioTN0Hl
 3brrm5HMm85XbA7cCl/Aaao1NPt0U8E0bh71ir3BF7GOA6h1PY6dH6rwRwzb82/DOV6K/8zAH
 Qa8mu++KA6vIl4nnYz1DoWio+REXjNQgyFSgoblsE66J1gNV4AoEhSgoFdM7OmaUQEPwO2Gaf
 UxoLcpv5bufEm/V39SOCpsp9HHOxs7chvmXb/7/IGNT0J1tE1jEokYEEjtl5o9KxR95B87Hej
 ++0nhqtu3nZn249shFRk1C8Qh6Y22yp1VkxplIrPz5evfCCbn7etgYfBcbbyH3LiVTTPR1C3C
 75nrFNxRsud8XNUTL9ug==
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

Note: x32 support for v4l2_buffer32 has always been broken and remains
so after this change, fixing it would have required even more duplication,
and apparently nobody has cared so far.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 269 +++++++++++++++++-
 1 file changed, 268 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
index f8a4b0ddd47d..381d29e45a49 100644
--- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
+++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
@@ -468,13 +468,43 @@ struct v4l2_plane32 {
 	__u32			reserved[11];
 };
 
+/*
+ * This is correct for all architectures including i386, but not x32,
+ * which has different alignment requirements for timestamp
+ */
 struct v4l2_buffer32 {
 	__u32			index;
 	__u32			type;	/* enum v4l2_buf_type */
 	__u32			bytesused;
 	__u32			flags;
 	__u32			field;	/* enum v4l2_field */
-	struct compat_timeval	timestamp;
+	struct {
+		compat_s64	tv_sec;
+		compat_s64	tv_usec;
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
 
@@ -581,6 +611,31 @@ static int bufsize_v4l2_buffer(struct v4l2_buffer32 __user *p32, u32 *size)
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
@@ -681,6 +736,106 @@ static int get_v4l2_buffer32(struct v4l2_buffer __user *p64,
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
@@ -761,6 +916,87 @@ static int put_v4l2_buffer32(struct v4l2_buffer __user *p64,
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
@@ -1150,10 +1386,13 @@ static int put_v4l2_edid32(struct v4l2_edid __user *p64,
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
@@ -1166,6 +1405,7 @@ static int put_v4l2_edid32(struct v4l2_edid __user *p64,
 #define	VIDIOC_DQEVENT32_TIME32	_IOR ('V', 89, struct v4l2_event32_time32)
 #define VIDIOC_CREATE_BUFS32	_IOWR('V', 92, struct v4l2_create_buffers32)
 #define VIDIOC_PREPARE_BUF32	_IOWR('V', 93, struct v4l2_buffer32)
+#define VIDIOC_PREPARE_BUF32_TIME32 _IOWR('V', 93, struct v4l2_buffer32_time32)
 
 #define VIDIOC_OVERLAY32	_IOW ('V', 14, s32)
 #define VIDIOC_STREAMON32	_IOW ('V', 18, s32)
@@ -1235,10 +1475,13 @@ static long do_video_ioctl(struct file *file, unsigned int cmd, unsigned long ar
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
@@ -1258,6 +1501,7 @@ static long do_video_ioctl(struct file *file, unsigned int cmd, unsigned long ar
 	case VIDIOC_S_OUTPUT32: ncmd = VIDIOC_S_OUTPUT; break;
 	case VIDIOC_CREATE_BUFS32: ncmd = VIDIOC_CREATE_BUFS; break;
 	case VIDIOC_PREPARE_BUF32: ncmd = VIDIOC_PREPARE_BUF; break;
+	case VIDIOC_PREPARE_BUF32_TIME32: ncmd = VIDIOC_PREPARE_BUF_TIME32; break;
 	case VIDIOC_G_EDID32: ncmd = VIDIOC_G_EDID; break;
 	case VIDIOC_S_EDID32: ncmd = VIDIOC_S_EDID; break;
 	default: ncmd = cmd; break;
@@ -1339,6 +1583,22 @@ static long do_video_ioctl(struct file *file, unsigned int cmd, unsigned long ar
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
@@ -1487,6 +1747,13 @@ static long do_video_ioctl(struct file *file, unsigned int cmd, unsigned long ar
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

