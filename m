Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB4826E472
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 20:49:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728570AbgIQQdp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 12:33:45 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:60113 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728555AbgIQQdU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 12:33:20 -0400
Received: from threadripper.lan ([149.172.98.151]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MpD39-1kq8OL1wr9-00qkok; Thu, 17 Sep 2020 17:28:26 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     linux-media@vger.kernel.org, mchehab@kernel.org, hverkuil@xs4all.nl
Cc:     hch@lst.de, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 4/8] media: v4l2: move compat handling for v4l2_buffer
Date:   Thu, 17 Sep 2020 17:28:19 +0200
Message-Id: <20200917152823.1241599-5-arnd@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200917152823.1241599-1-arnd@arndb.de>
References: <20200917152823.1241599-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zgR99yeXBWunSRNR2pQVeQw2zfQ2QgupaadkCUuxgfQ0m/ngvSN
 fr1gCQSAYuLCz9ZKBbpYxLIJ2hNP3PYcz7heEVrjomAjzZ/4ZoltkJi+kKGYsXVDFrwyDyb
 n3JRXYT+UYlLk3GXXv/e4Zx50hX2dHYu1pc5FZ+uNJVfcXAxv1NjGoDrj+YDeL9DMxVyTdz
 UtBQT5wRlooMIq6Gtz90A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:09lHKTPDzvI=:q48J7VshHUYXbKEn9xXrr/
 Vi1hBW1teUSt/YTUeOwncItKn6uHaeEaCSXs4yZHkXw8Mu1tR1nxakhs/ox1P/eDHfF1yg0JD
 gafhXSfPpzHIhLzQS4Bk6gU5GlK7/CLtxyP2YHfaauPHYRczn3npQt74RbXxdFhWGNsCi0Eqg
 cuzaRDnisQEHB+N9Ur0HZ1hdPTLSKkOBIiA4x5dNkBQ6FRO40LMA5pNGZB1hFQgnzFUEHJITV
 OYMTcMT5kuk7tw7nDyEP/IgCC+IDT7i9zvJH5pVevSPioG6tyjq2+EDLVJI0FmbKYZfj18eov
 2kmnFgW9qbHTA0eFQ1xi8I1inXjlwNXyoCkYzJKu+Jv0Bxx8WGRg0OIfcM2GUDpCqrT/aJ01N
 RCzyIkBbLjUHS6o6HM1BG8gcGZp2KsO+DejKvgCkqHNaAoqpcWyWPFFwZtxmFMd9QSLIKKb79
 yy795Yh0S9PzomAgEx9Q/rD49kU7lCWThVUgVsja6YoLnZEitODGXNEQ3qby4E7RDmUmaTs0v
 FXFi0oSNpMHFbQVDsESjGv5CM7PzPWIiQeDvf0m1sCriPQTVf79tB6IwG69rOjK15MCixywG6
 U6s8TiedZHWsOYUC533SYX3O0rlNLyvWddszaxrGcL6bcEl3liJmKK9wFrKDEyLGhshbKLWDq
 GQqEuzKGkfp1+Uo6EGV+9UVYH6xr+BPZRIH81wfch2B6VsnGkHNluZab5OJ4ixu9Q+q8/TVVB
 ImI1VUgWSsQWj5813kneEtWBEjZLhf/Mm8pbGI37GH7eOu9QcHFlEEaEKMQ9huwyKVuaBhL00
 CilmZLV8NjpFdXACJc/B1Milw2iwb/yWlD9DBBsYBzhTc/mkNw5pEXL1UM5SQIPVt30HvFm
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ioctl commands based on v4l2_buffer have two sets of compat calls,
one for native time32 structures, and one for compat structures on
64-bit architectures.

Change the compat version to use the same approach as the other simpler
one, for both versions of the structure.

In an earlier version of the patch, I unified the v4l2_buffer_time32
and v4l2_buffer32_time32 compatibility handling into a single
implementation, but that relied on having it all in one file, rather
than having the in_compat_syscall() version in v4l2-compat-ioctl32.c.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 729 +++++++-----------
 1 file changed, 276 insertions(+), 453 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
index 1471dab71703..d1055bef8933 100644
--- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
+++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
@@ -527,480 +527,257 @@ struct v4l2_buffer32_time32 {
 	__s32			request_fd;
 };
 
-static int get_v4l2_plane32(struct v4l2_plane __user *p64,
+static int get_v4l2_plane32(struct v4l2_plane *p64,
 			    struct v4l2_plane32 __user *p32,
 			    enum v4l2_memory memory)
 {
-	compat_ulong_t p;
+	struct v4l2_plane32 plane32;
+	typeof(p64->m) m = {};
 
-	if (copy_in_user(p64, p32, 2 * sizeof(__u32)) ||
-	    copy_in_user(&p64->data_offset, &p32->data_offset,
-			 sizeof(p64->data_offset)))
+	if (copy_from_user(&plane32, p32, sizeof(plane32)))
 		return -EFAULT;
 
 	switch (memory) {
 	case V4L2_MEMORY_MMAP:
 	case V4L2_MEMORY_OVERLAY:
-		if (copy_in_user(&p64->m.mem_offset, &p32->m.mem_offset,
-				 sizeof(p32->m.mem_offset)))
-			return -EFAULT;
+		m.mem_offset = plane32.m.mem_offset;
 		break;
 	case V4L2_MEMORY_USERPTR:
-		if (get_user(p, &p32->m.userptr) ||
-		    put_user((unsigned long)compat_ptr(p), &p64->m.userptr))
-			return -EFAULT;
+		m.userptr = (unsigned long)compat_ptr(plane32.m.userptr);
 		break;
 	case V4L2_MEMORY_DMABUF:
-		if (copy_in_user(&p64->m.fd, &p32->m.fd, sizeof(p32->m.fd)))
-			return -EFAULT;
+		m.fd = plane32.m.fd;
 		break;
 	}
 
+	memset(p64, 0, sizeof(*p64));
+	*p64 = (struct v4l2_plane) {
+		.bytesused	= p64->bytesused,
+		.length		= p64->bytesused,
+		.m		= m,
+		.data_offset	= p64->data_offset,
+	};
+
 	return 0;
 }
 
-static int put_v4l2_plane32(struct v4l2_plane __user *p64,
+static int put_v4l2_plane32(struct v4l2_plane *p64,
 			    struct v4l2_plane32 __user *p32,
 			    enum v4l2_memory memory)
 {
-	unsigned long p;
+	struct v4l2_plane32 plane32;
 
-	if (copy_in_user(p32, p64, 2 * sizeof(__u32)) ||
-	    copy_in_user(&p32->data_offset, &p64->data_offset,
-			 sizeof(p64->data_offset)))
-		return -EFAULT;
+	memset(&plane32, 0, sizeof(plane32));
+	plane32 = (struct v4l2_plane32) {
+		.bytesused	= p64->bytesused,
+		.length		= p64->bytesused,
+		.data_offset	= p64->data_offset,
+	};
 
 	switch (memory) {
 	case V4L2_MEMORY_MMAP:
 	case V4L2_MEMORY_OVERLAY:
-		if (copy_in_user(&p32->m.mem_offset, &p64->m.mem_offset,
-				 sizeof(p64->m.mem_offset)))
-			return -EFAULT;
+		plane32.m.mem_offset = p64->m.mem_offset;
 		break;
 	case V4L2_MEMORY_USERPTR:
-		if (get_user(p, &p64->m.userptr) ||
-		    put_user((compat_ulong_t)ptr_to_compat((void __user *)p),
-			     &p32->m.userptr))
-			return -EFAULT;
+		plane32.m.userptr = (uintptr_t)(p64->m.userptr);
 		break;
 	case V4L2_MEMORY_DMABUF:
-		if (copy_in_user(&p32->m.fd, &p64->m.fd, sizeof(p64->m.fd)))
-			return -EFAULT;
+		plane32.m.fd = p64->m.fd;
 		break;
 	}
 
-	return 0;
-}
-
-static int bufsize_v4l2_buffer(struct v4l2_buffer32 __user *p32, u32 *size)
-{
-	u32 type;
-	u32 length;
-
-	if (!access_ok(p32, sizeof(*p32)) ||
-	    get_user(type, &p32->type) ||
-	    get_user(length, &p32->length))
+	if (copy_to_user(p32, &plane32, sizeof(plane32)))
 		return -EFAULT;
 
-	if (V4L2_TYPE_IS_MULTIPLANAR(type)) {
-		if (length > VIDEO_MAX_PLANES)
-			return -EINVAL;
-
-		/*
-		 * We don't really care if userspace decides to kill itself
-		 * by passing a very big length value
-		 */
-		*size = length * sizeof(struct v4l2_plane);
-	} else {
-		*size = 0;
-	}
 	return 0;
 }
 
-static int bufsize_v4l2_buffer_time32(struct v4l2_buffer32_time32 __user *p32, u32 *size)
+static int get_v4l2_buffer32(struct v4l2_buffer *vb,
+			     struct v4l2_buffer32 __user *arg,
+			     bool querybuf)
 {
-	u32 type;
-	u32 length;
+	struct v4l2_buffer32 vb32;
 
-	if (!access_ok(p32, sizeof(*p32)) ||
-	    get_user(type, &p32->type) ||
-	    get_user(length, &p32->length))
+	if (copy_from_user(&vb32, arg, sizeof(vb32)))
 		return -EFAULT;
 
-	if (V4L2_TYPE_IS_MULTIPLANAR(type)) {
-		if (length > VIDEO_MAX_PLANES)
-			return -EINVAL;
+	memset(vb, 0, sizeof(*vb));
+	*vb = (struct v4l2_buffer) {
+		.index		= vb32.index,
+		.type		= vb32.type,
+		.bytesused	= vb32.bytesused,
+		.flags		= vb32.flags,
+		.field		= vb32.field,
+		.timestamp.tv_sec	= vb32.timestamp.tv_sec,
+		.timestamp.tv_usec	= vb32.timestamp.tv_usec,
+		.timecode	= vb32.timecode,
+		.sequence	= vb32.sequence,
+		.memory		= vb32.memory,
+		.m.offset	= vb32.m.offset,
+		.length		= vb32.length,
+		.request_fd	= vb32.request_fd,
+	};
 
-		/*
-		 * We don't really care if userspace decides to kill itself
-		 * by passing a very big length value
-		 */
-		*size = length * sizeof(struct v4l2_plane);
-	} else {
-		*size = 0;
+	switch (vb->memory) {
+	case V4L2_MEMORY_MMAP:
+	case V4L2_MEMORY_OVERLAY:
+		vb->m.offset = vb32.m.offset;
+		break;
+	case V4L2_MEMORY_USERPTR:
+		vb->m.userptr = vb32.m.userptr;
+		break;
+	case V4L2_MEMORY_DMABUF:
+		vb->m.fd = vb32.m.fd;
+		break;
 	}
-	return 0;
-}
-
-static int get_v4l2_buffer32(struct v4l2_buffer __user *p64,
-			     struct v4l2_buffer32 __user *p32,
-			     void __user *aux_buf, u32 aux_space)
-{
-	u32 type;
-	u32 length;
-	s32 request_fd;
-	enum v4l2_memory memory;
-	struct v4l2_plane32 __user *uplane32;
-	struct v4l2_plane __user *uplane;
-	compat_caddr_t p;
-	int ret;
-
-	if (!access_ok(p32, sizeof(*p32)) ||
-	    assign_in_user(&p64->index, &p32->index) ||
-	    get_user(type, &p32->type) ||
-	    put_user(type, &p64->type) ||
-	    assign_in_user(&p64->flags, &p32->flags) ||
-	    get_user(memory, &p32->memory) ||
-	    put_user(memory, &p64->memory) ||
-	    get_user(length, &p32->length) ||
-	    put_user(length, &p64->length) ||
-	    get_user(request_fd, &p32->request_fd) ||
-	    put_user(request_fd, &p64->request_fd))
-		return -EFAULT;
 
-	if (V4L2_TYPE_IS_OUTPUT(type))
-		if (assign_in_user(&p64->bytesused, &p32->bytesused) ||
-		    assign_in_user(&p64->field, &p32->field) ||
-		    assign_in_user(&p64->timestamp.tv_sec,
-				   &p32->timestamp.tv_sec) ||
-		    assign_in_user(&p64->timestamp.tv_usec,
-				   &p32->timestamp.tv_usec))
-			return -EFAULT;
+	if (V4L2_TYPE_IS_MULTIPLANAR(vb->type))
+		vb->m.planes = (void __force *)
+				compat_ptr(vb32.m.planes);
 
-	if (V4L2_TYPE_IS_MULTIPLANAR(type)) {
-		u32 num_planes = length;
-
-		if (num_planes == 0) {
-			/*
-			 * num_planes == 0 is legal, e.g. when userspace doesn't
-			 * need planes array on DQBUF
-			 */
-			return put_user(NULL, &p64->m.planes);
-		}
-		if (num_planes > VIDEO_MAX_PLANES)
-			return -EINVAL;
-
-		if (get_user(p, &p32->m.planes))
-			return -EFAULT;
-
-		uplane32 = compat_ptr(p);
-		if (!access_ok(uplane32,
-			       num_planes * sizeof(*uplane32)))
-			return -EFAULT;
-
-		/*
-		 * We don't really care if userspace decides to kill itself
-		 * by passing a very big num_planes value
-		 */
-		if (aux_space < num_planes * sizeof(*uplane))
-			return -EFAULT;
-
-		uplane = aux_buf;
-		if (put_user_force(uplane, &p64->m.planes))
-			return -EFAULT;
-
-		while (num_planes--) {
-			ret = get_v4l2_plane32(uplane, uplane32, memory);
-			if (ret)
-				return ret;
-			uplane++;
-			uplane32++;
-		}
-	} else {
-		switch (memory) {
-		case V4L2_MEMORY_MMAP:
-		case V4L2_MEMORY_OVERLAY:
-			if (assign_in_user(&p64->m.offset, &p32->m.offset))
-				return -EFAULT;
-			break;
-		case V4L2_MEMORY_USERPTR: {
-			compat_ulong_t userptr;
-
-			if (get_user(userptr, &p32->m.userptr) ||
-			    put_user((unsigned long)compat_ptr(userptr),
-				     &p64->m.userptr))
-				return -EFAULT;
-			break;
-		}
-		case V4L2_MEMORY_DMABUF:
-			if (assign_in_user(&p64->m.fd, &p32->m.fd))
-				return -EFAULT;
-			break;
-		}
-	}
+	if (querybuf)
+		vb->request_fd = 0;
 
 	return 0;
 }
 
-static int get_v4l2_buffer32_time32(struct v4l2_buffer_time32 __user *p64,
-				    struct v4l2_buffer32_time32 __user *p32,
-				    void __user *aux_buf, u32 aux_space)
+#ifdef CONFIG_COMPAT_32BIT_TIME
+static int get_v4l2_buffer32_time32(struct v4l2_buffer *vb,
+				    struct v4l2_buffer32_time32 __user *arg,
+				    bool querybuf)
 {
-	u32 type;
-	u32 length;
-	s32 request_fd;
-	enum v4l2_memory memory;
-	struct v4l2_plane32 __user *uplane32;
-	struct v4l2_plane __user *uplane;
-	compat_caddr_t p;
-	int ret;
+	struct v4l2_buffer32_time32 vb32;
 
-	if (!access_ok(p32, sizeof(*p32)) ||
-	    assign_in_user(&p64->index, &p32->index) ||
-	    get_user(type, &p32->type) ||
-	    put_user(type, &p64->type) ||
-	    assign_in_user(&p64->flags, &p32->flags) ||
-	    get_user(memory, &p32->memory) ||
-	    put_user(memory, &p64->memory) ||
-	    get_user(length, &p32->length) ||
-	    put_user(length, &p64->length) ||
-	    get_user(request_fd, &p32->request_fd) ||
-	    put_user(request_fd, &p64->request_fd))
+	if (copy_from_user(&vb32, arg, sizeof(vb32)))
 		return -EFAULT;
 
-	if (V4L2_TYPE_IS_OUTPUT(type))
-		if (assign_in_user(&p64->bytesused, &p32->bytesused) ||
-		    assign_in_user(&p64->field, &p32->field) ||
-		    assign_in_user(&p64->timestamp.tv_sec,
-				   &p32->timestamp.tv_sec) ||
-		    assign_in_user(&p64->timestamp.tv_usec,
-				   &p32->timestamp.tv_usec))
-			return -EFAULT;
-
-	if (V4L2_TYPE_IS_MULTIPLANAR(type)) {
-		u32 num_planes = length;
-
-		if (num_planes == 0) {
-			/*
-			 * num_planes == 0 is legal, e.g. when userspace doesn't
-			 * need planes array on DQBUF
-			 */
-			return put_user(NULL, &p64->m.planes);
-		}
-		if (num_planes > VIDEO_MAX_PLANES)
-			return -EINVAL;
-
-		if (get_user(p, &p32->m.planes))
-			return -EFAULT;
-
-		uplane32 = compat_ptr(p);
-		if (!access_ok(uplane32,
-			       num_planes * sizeof(*uplane32)))
-			return -EFAULT;
-
-		/*
-		 * We don't really care if userspace decides to kill itself
-		 * by passing a very big num_planes value
-		 */
-		if (aux_space < num_planes * sizeof(*uplane))
-			return -EFAULT;
-
-		uplane = aux_buf;
-		if (put_user_force(uplane, &p64->m.planes))
-			return -EFAULT;
-
-		while (num_planes--) {
-			ret = get_v4l2_plane32(uplane, uplane32, memory);
-			if (ret)
-				return ret;
-			uplane++;
-			uplane32++;
-		}
-	} else {
-		switch (memory) {
-		case V4L2_MEMORY_MMAP:
-		case V4L2_MEMORY_OVERLAY:
-			if (assign_in_user(&p64->m.offset, &p32->m.offset))
-				return -EFAULT;
-			break;
-		case V4L2_MEMORY_USERPTR: {
-			compat_ulong_t userptr;
-
-			if (get_user(userptr, &p32->m.userptr) ||
-			    put_user((unsigned long)compat_ptr(userptr),
-				     &p64->m.userptr))
-				return -EFAULT;
-			break;
-		}
-		case V4L2_MEMORY_DMABUF:
-			if (assign_in_user(&p64->m.fd, &p32->m.fd))
-				return -EFAULT;
-			break;
-		}
+	*vb = (struct v4l2_buffer) {
+		.index		= vb32.index,
+		.type		= vb32.type,
+		.bytesused	= vb32.bytesused,
+		.flags		= vb32.flags,
+		.field		= vb32.field,
+		.timestamp.tv_sec	= vb32.timestamp.tv_sec,
+		.timestamp.tv_usec	= vb32.timestamp.tv_usec,
+		.timecode	= vb32.timecode,
+		.sequence	= vb32.sequence,
+		.memory		= vb32.memory,
+		.m.offset	= vb32.m.offset,
+		.length		= vb32.length,
+		.request_fd	= vb32.request_fd,
+	};
+	switch (vb->memory) {
+	case V4L2_MEMORY_MMAP:
+	case V4L2_MEMORY_OVERLAY:
+		vb->m.offset = vb32.m.offset;
+		break;
+	case V4L2_MEMORY_USERPTR:
+		vb->m.userptr = vb32.m.userptr;
+		break;
+	case V4L2_MEMORY_DMABUF:
+		vb->m.fd = vb32.m.fd;
+		break;
 	}
 
+	if (V4L2_TYPE_IS_MULTIPLANAR(vb->type))
+		vb->m.planes = (void __force *)
+				compat_ptr(vb32.m.planes);
+	if (querybuf)
+		vb->request_fd = 0;
+
 	return 0;
 }
+#endif
 
-static int put_v4l2_buffer32(struct v4l2_buffer __user *p64,
-			     struct v4l2_buffer32 __user *p32)
+static int put_v4l2_buffer32(struct v4l2_buffer *vb,
+			     struct v4l2_buffer32 __user *arg)
 {
-	u32 type;
-	u32 length;
-	enum v4l2_memory memory;
-	struct v4l2_plane32 __user *uplane32;
-	struct v4l2_plane *uplane;
-	compat_caddr_t p;
-	int ret;
+	struct v4l2_buffer32 vb32;;
+
+	memset (&vb32, 0, sizeof vb32);
+	vb32 = (struct v4l2_buffer32) {
+		.index		= vb->index,
+		.type		= vb->type,
+		.bytesused	= vb->bytesused,
+		.flags		= vb->flags,
+		.field		= vb->field,
+		.timestamp.tv_sec	= vb->timestamp.tv_sec,
+		.timestamp.tv_usec	= vb->timestamp.tv_usec,
+		.timecode	= vb->timecode,
+		.sequence	= vb->sequence,
+		.memory		= vb->memory,
+		.m.offset	= vb->m.offset,
+		.length		= vb->length,
+		.request_fd	= vb->request_fd,
+	};
 
-	if (!access_ok(p32, sizeof(*p32)) ||
-	    assign_in_user(&p32->index, &p64->index) ||
-	    get_user(type, &p64->type) ||
-	    put_user(type, &p32->type) ||
-	    assign_in_user(&p32->flags, &p64->flags) ||
-	    get_user(memory, &p64->memory) ||
-	    put_user(memory, &p32->memory))
-		return -EFAULT;
+	switch (vb->memory) {
+	case V4L2_MEMORY_MMAP:
+	case V4L2_MEMORY_OVERLAY:
+		vb32.m.offset = vb->m.offset;
+		break;
+	case V4L2_MEMORY_USERPTR:
+		vb32.m.userptr = vb->m.userptr;
+		break;
+	case V4L2_MEMORY_DMABUF:
+		vb32.m.fd = vb->m.fd;
+		break;
+	}
 
-	if (assign_in_user(&p32->bytesused, &p64->bytesused) ||
-	    assign_in_user(&p32->field, &p64->field) ||
-	    assign_in_user(&p32->timestamp.tv_sec, &p64->timestamp.tv_sec) ||
-	    assign_in_user(&p32->timestamp.tv_usec, &p64->timestamp.tv_usec) ||
-	    copy_in_user(&p32->timecode, &p64->timecode, sizeof(p64->timecode)) ||
-	    assign_in_user(&p32->sequence, &p64->sequence) ||
-	    assign_in_user(&p32->reserved2, &p64->reserved2) ||
-	    assign_in_user(&p32->request_fd, &p64->request_fd) ||
-	    get_user(length, &p64->length) ||
-	    put_user(length, &p32->length))
-		return -EFAULT;
+	if (V4L2_TYPE_IS_MULTIPLANAR(vb->type))
+		vb32.m.planes = (uintptr_t)vb->m.planes;
 
-	if (V4L2_TYPE_IS_MULTIPLANAR(type)) {
-		u32 num_planes = length;
-
-		if (num_planes == 0)
-			return 0;
-		/* We need to define uplane without __user, even though
-		 * it does point to data in userspace here. The reason is
-		 * that v4l2-ioctl.c copies it from userspace to kernelspace,
-		 * so its definition in videodev2.h doesn't have a
-		 * __user markup. Defining uplane with __user causes
-		 * smatch warnings, so instead declare it without __user
-		 * and cast it as a userspace pointer to put_v4l2_plane32().
-		 */
-		if (get_user(uplane, &p64->m.planes))
-			return -EFAULT;
-		if (get_user(p, &p32->m.planes))
-			return -EFAULT;
-		uplane32 = compat_ptr(p);
-
-		while (num_planes--) {
-			ret = put_v4l2_plane32((void __user *)uplane,
-					       uplane32, memory);
-			if (ret)
-				return ret;
-			++uplane;
-			++uplane32;
-		}
-	} else {
-		switch (memory) {
-		case V4L2_MEMORY_MMAP:
-		case V4L2_MEMORY_OVERLAY:
-			if (assign_in_user(&p32->m.offset, &p64->m.offset))
-				return -EFAULT;
-			break;
-		case V4L2_MEMORY_USERPTR:
-			if (assign_in_user(&p32->m.userptr, &p64->m.userptr))
-				return -EFAULT;
-			break;
-		case V4L2_MEMORY_DMABUF:
-			if (assign_in_user(&p32->m.fd, &p64->m.fd))
-				return -EFAULT;
-			break;
-		}
-	}
+	if (copy_to_user(arg, &vb32, sizeof(vb32)))
+		return -EFAULT;
 
 	return 0;
 }
 
-static int put_v4l2_buffer32_time32(struct v4l2_buffer_time32 __user *p64,
-				    struct v4l2_buffer32_time32 __user *p32)
+#ifdef CONFIG_COMPAT_32BIT_TIME
+static int put_v4l2_buffer32_time32(struct v4l2_buffer *vb,
+				    struct v4l2_buffer32_time32 __user *arg)
 {
-	u32 type;
-	u32 length;
-	enum v4l2_memory memory;
-	struct v4l2_plane32 __user *uplane32;
-	struct v4l2_plane *uplane;
-	compat_caddr_t p;
-	int ret;
+	struct v4l2_buffer32_time32 vb32;
+
+	memset (&vb32, 0, sizeof vb32);
+	vb32 = (struct v4l2_buffer32_time32) {
+		.index		= vb->index,
+		.type		= vb->type,
+		.bytesused	= vb->bytesused,
+		.flags		= vb->flags,
+		.field		= vb->field,
+		.timestamp.tv_sec	= vb->timestamp.tv_sec,
+		.timestamp.tv_usec	= vb->timestamp.tv_usec,
+		.timecode	= vb->timecode,
+		.sequence	= vb->sequence,
+		.memory		= vb->memory,
+		.m.offset	= vb->m.offset,
+		.length		= vb->length,
+		.request_fd	= vb->request_fd,
+	};
+	switch (vb->memory) {
+	case V4L2_MEMORY_MMAP:
+	case V4L2_MEMORY_OVERLAY:
+		vb32.m.offset = vb->m.offset;
+		break;
+	case V4L2_MEMORY_USERPTR:
+		vb32.m.userptr = vb->m.userptr;
+		break;
+	case V4L2_MEMORY_DMABUF:
+		vb32.m.fd = vb->m.fd;
+		break;
+	}
 
-	if (!access_ok(p32, sizeof(*p32)) ||
-	    assign_in_user(&p32->index, &p64->index) ||
-	    get_user(type, &p64->type) ||
-	    put_user(type, &p32->type) ||
-	    assign_in_user(&p32->flags, &p64->flags) ||
-	    get_user(memory, &p64->memory) ||
-	    put_user(memory, &p32->memory))
-		return -EFAULT;
+	if (V4L2_TYPE_IS_MULTIPLANAR(vb->type))
+		vb32.m.planes = (uintptr_t)vb->m.planes;
 
-	if (assign_in_user(&p32->bytesused, &p64->bytesused) ||
-	    assign_in_user(&p32->field, &p64->field) ||
-	    assign_in_user(&p32->timestamp.tv_sec, &p64->timestamp.tv_sec) ||
-	    assign_in_user(&p32->timestamp.tv_usec, &p64->timestamp.tv_usec) ||
-	    copy_in_user(&p32->timecode, &p64->timecode, sizeof(p64->timecode)) ||
-	    assign_in_user(&p32->sequence, &p64->sequence) ||
-	    assign_in_user(&p32->reserved2, &p64->reserved2) ||
-	    assign_in_user(&p32->request_fd, &p64->request_fd) ||
-	    get_user(length, &p64->length) ||
-	    put_user(length, &p32->length))
+	if (copy_to_user(arg, &vb32, sizeof(vb32)))
 		return -EFAULT;
 
-	if (V4L2_TYPE_IS_MULTIPLANAR(type)) {
-		u32 num_planes = length;
-
-		if (num_planes == 0)
-			return 0;
-		/* We need to define uplane without __user, even though
-		 * it does point to data in userspace here. The reason is
-		 * that v4l2-ioctl.c copies it from userspace to kernelspace,
-		 * so its definition in videodev2.h doesn't have a
-		 * __user markup. Defining uplane with __user causes
-		 * smatch warnings, so instead declare it without __user
-		 * and cast it as a userspace pointer to put_v4l2_plane32().
-		 */
-		if (get_user(uplane, &p64->m.planes))
-			return -EFAULT;
-		if (get_user(p, &p32->m.planes))
-			return -EFAULT;
-		uplane32 = compat_ptr(p);
-
-		while (num_planes--) {
-			ret = put_v4l2_plane32((void __user *)uplane,
-					       uplane32, memory);
-			if (ret)
-				return ret;
-			++uplane;
-			++uplane32;
-		}
-	} else {
-		switch (memory) {
-		case V4L2_MEMORY_MMAP:
-		case V4L2_MEMORY_OVERLAY:
-			if (assign_in_user(&p32->m.offset, &p64->m.offset))
-				return -EFAULT;
-			break;
-		case V4L2_MEMORY_USERPTR:
-			if (assign_in_user(&p32->m.userptr, &p64->m.userptr))
-				return -EFAULT;
-			break;
-		case V4L2_MEMORY_DMABUF:
-			if (assign_in_user(&p32->m.fd, &p64->m.fd))
-				return -EFAULT;
-			break;
-		}
-	}
-
 	return 0;
 }
+#endif
 
 struct v4l2_framebuffer32 {
 	__u32			capability;
@@ -1317,12 +1094,30 @@ static int put_v4l2_edid32(struct v4l2_edid __user *p64,
 unsigned int v4l2_compat_translate_cmd(unsigned int cmd)
 {
 	switch (cmd) {
+#ifdef CONFIG_COMPAT_32BIT_TIME
+	case VIDIOC_QUERYBUF32_TIME32:
+		return VIDIOC_QUERYBUF;
+	case VIDIOC_QBUF32_TIME32:
+		return VIDIOC_QBUF;
+	case VIDIOC_DQBUF32_TIME32:
+		return VIDIOC_DQBUF;
+	case VIDIOC_PREPARE_BUF32_TIME32:
+		return VIDIOC_PREPARE_BUF;
+#endif
+	case VIDIOC_QUERYBUF32:
+		return VIDIOC_QUERYBUF;
+	case VIDIOC_QBUF32:
+		return VIDIOC_QBUF;
+	case VIDIOC_DQBUF32:
+		return VIDIOC_DQBUF;
 	case VIDIOC_G_EXT_CTRLS32:
 		return	VIDIOC_G_EXT_CTRLS;
 	case VIDIOC_S_EXT_CTRLS32:
 		return VIDIOC_S_EXT_CTRLS;
 	case VIDIOC_TRY_EXT_CTRLS32:
 		return VIDIOC_TRY_EXT_CTRLS;
+	case VIDIOC_PREPARE_BUF32:
+		return VIDIOC_PREPARE_BUF;
 	}
 	return cmd;
 }
@@ -1330,6 +1125,21 @@ unsigned int v4l2_compat_translate_cmd(unsigned int cmd)
 int v4l2_compat_get_user(void __user *arg, void *parg, unsigned int cmd)
 {
 	switch (cmd) {
+#ifdef CONFIG_COMPAT_32BIT_TIME
+	case VIDIOC_QUERYBUF32_TIME32:
+	case VIDIOC_QBUF32_TIME32:
+	case VIDIOC_DQBUF32_TIME32:
+	case VIDIOC_PREPARE_BUF32_TIME32:
+		return get_v4l2_buffer32_time32(parg, arg,
+					cmd == VIDIOC_QUERYBUF32_TIME32);
+#endif
+	case VIDIOC_QUERYBUF32:
+	case VIDIOC_QBUF32:
+	case VIDIOC_DQBUF32:
+	case VIDIOC_PREPARE_BUF32:
+		return get_v4l2_buffer32(parg, arg,
+					cmd == VIDIOC_QUERYBUF32);
+
 	case VIDIOC_G_EXT_CTRLS32:
 	case VIDIOC_S_EXT_CTRLS32:
 	case VIDIOC_TRY_EXT_CTRLS32:
@@ -1341,6 +1151,19 @@ int v4l2_compat_get_user(void __user *arg, void *parg, unsigned int cmd)
 int v4l2_compat_put_user(void __user *arg, void *parg, unsigned int cmd)
 {
 	switch (cmd) {
+#ifdef CONFIG_COMPAT_32BIT_TIME
+	case VIDIOC_QUERYBUF32_TIME32:
+	case VIDIOC_QBUF32_TIME32:
+	case VIDIOC_DQBUF32_TIME32:
+	case VIDIOC_PREPARE_BUF32_TIME32:
+		return put_v4l2_buffer32_time32(parg, arg);
+#endif
+	case VIDIOC_QUERYBUF32:
+	case VIDIOC_QBUF32:
+	case VIDIOC_DQBUF32:
+	case VIDIOC_PREPARE_BUF32:
+		return put_v4l2_buffer32(parg, arg);
+
 	case VIDIOC_G_EXT_CTRLS32:
 	case VIDIOC_S_EXT_CTRLS32:
 	case VIDIOC_TRY_EXT_CTRLS32:
@@ -1356,6 +1179,33 @@ int v4l2_compat_get_array_args(struct file *file, void *mbuf,
 	int err = 0;
 
 	switch (cmd) {
+	case VIDIOC_QUERYBUF32_TIME32:
+	case VIDIOC_QBUF32_TIME32:
+	case VIDIOC_DQBUF32_TIME32:
+	case VIDIOC_PREPARE_BUF32_TIME32:
+	case VIDIOC_QUERYBUF32:
+	case VIDIOC_QBUF32:
+	case VIDIOC_DQBUF32:
+	case VIDIOC_PREPARE_BUF32: {
+		struct v4l2_buffer *b64 = arg;
+		struct v4l2_plane *p64 = mbuf;
+		struct v4l2_plane32 __user *p32 = user_ptr;
+		u32 num_planes = p64->length;
+
+		if (V4L2_TYPE_IS_MULTIPLANAR(b64->type)) {
+			if (num_planes == 0)
+				return 0;
+
+			while (num_planes--) {
+				err = get_v4l2_plane32(p64, p32, b64->memory);
+				if (err)
+					return err;
+				++p64;
+				++p32;
+			}
+		}
+		break;
+	}
 	case VIDIOC_G_EXT_CTRLS32:
 	case VIDIOC_S_EXT_CTRLS32:
 	case VIDIOC_TRY_EXT_CTRLS32: {
@@ -1395,6 +1245,33 @@ int v4l2_compat_put_array_args(struct file *file, void __user *user_ptr,
 	int err = 0;
 
 	switch (cmd) {
+	case VIDIOC_QUERYBUF32_TIME32:
+	case VIDIOC_QBUF32_TIME32:
+	case VIDIOC_DQBUF32_TIME32:
+	case VIDIOC_PREPARE_BUF32_TIME32:
+	case VIDIOC_QUERYBUF32:
+	case VIDIOC_QBUF32:
+	case VIDIOC_DQBUF32:
+	case VIDIOC_PREPARE_BUF32: {
+		struct v4l2_buffer *b64 = arg;
+		struct v4l2_plane *p64 = mbuf;
+		struct v4l2_plane32 __user *p32 = user_ptr;
+		u32 num_planes = p64->length;
+
+		if (V4L2_TYPE_IS_MULTIPLANAR(b64->type)) {
+			if (num_planes == 0)
+				return 0;
+
+			while (num_planes--) {
+				err = put_v4l2_plane32(p64, p32, b64->memory);
+				if (err)
+					return err;
+				++p64;
+				++p32;
+			}
+		}
+		break;
+	}
 	case VIDIOC_G_EXT_CTRLS32:
 	case VIDIOC_S_EXT_CTRLS32:
 	case VIDIOC_TRY_EXT_CTRLS32: {
@@ -1491,14 +1368,8 @@ static long do_video_ioctl(struct file *file, unsigned int cmd, unsigned long ar
 	switch (cmd) {
 	case VIDIOC_G_FMT32: ncmd = VIDIOC_G_FMT; break;
 	case VIDIOC_S_FMT32: ncmd = VIDIOC_S_FMT; break;
-	case VIDIOC_QUERYBUF32: ncmd = VIDIOC_QUERYBUF; break;
-	case VIDIOC_QUERYBUF32_TIME32: ncmd = VIDIOC_QUERYBUF_TIME32; break;
 	case VIDIOC_G_FBUF32: ncmd = VIDIOC_G_FBUF; break;
 	case VIDIOC_S_FBUF32: ncmd = VIDIOC_S_FBUF; break;
-	case VIDIOC_QBUF32: ncmd = VIDIOC_QBUF; break;
-	case VIDIOC_QBUF32_TIME32: ncmd = VIDIOC_QBUF_TIME32; break;
-	case VIDIOC_DQBUF32: ncmd = VIDIOC_DQBUF; break;
-	case VIDIOC_DQBUF32_TIME32: ncmd = VIDIOC_DQBUF_TIME32; break;
 	case VIDIOC_ENUMSTD32: ncmd = VIDIOC_ENUMSTD; break;
 	case VIDIOC_ENUMINPUT32: ncmd = VIDIOC_ENUMINPUT; break;
 	case VIDIOC_TRY_FMT32: ncmd = VIDIOC_TRY_FMT; break;
@@ -1507,8 +1378,6 @@ static long do_video_ioctl(struct file *file, unsigned int cmd, unsigned long ar
 	case VIDIOC_DQEVENT32_TIME32: ncmd = VIDIOC_DQEVENT_TIME32; break;
 #endif
 	case VIDIOC_CREATE_BUFS32: ncmd = VIDIOC_CREATE_BUFS; break;
-	case VIDIOC_PREPARE_BUF32: ncmd = VIDIOC_PREPARE_BUF; break;
-	case VIDIOC_PREPARE_BUF32_TIME32: ncmd = VIDIOC_PREPARE_BUF_TIME32; break;
 	case VIDIOC_G_EDID32: ncmd = VIDIOC_G_EDID; break;
 	case VIDIOC_S_EDID32: ncmd = VIDIOC_S_EDID; break;
 	default: ncmd = cmd; break;
@@ -1556,38 +1425,6 @@ static long do_video_ioctl(struct file *file, unsigned int cmd, unsigned long ar
 		compatible_arg = 0;
 		break;
 
-	case VIDIOC_PREPARE_BUF32:
-	case VIDIOC_QUERYBUF32:
-	case VIDIOC_QBUF32:
-	case VIDIOC_DQBUF32:
-		err = bufsize_v4l2_buffer(p32, &aux_space);
-		if (!err)
-			err = alloc_userspace(sizeof(struct v4l2_buffer),
-					      aux_space, &new_p64);
-		if (!err) {
-			aux_buf = new_p64 + sizeof(struct v4l2_buffer);
-			err = get_v4l2_buffer32(new_p64, p32,
-						aux_buf, aux_space);
-		}
-		compatible_arg = 0;
-		break;
-
-	case VIDIOC_PREPARE_BUF32_TIME32:
-	case VIDIOC_QUERYBUF32_TIME32:
-	case VIDIOC_QBUF32_TIME32:
-	case VIDIOC_DQBUF32_TIME32:
-		err = bufsize_v4l2_buffer_time32(p32, &aux_space);
-		if (!err)
-			err = alloc_userspace(sizeof(struct v4l2_buffer),
-					      aux_space, &new_p64);
-		if (!err) {
-			aux_buf = new_p64 + sizeof(struct v4l2_buffer);
-			err = get_v4l2_buffer32_time32(new_p64, p32,
-						       aux_buf, aux_space);
-		}
-		compatible_arg = 0;
-		break;
-
 	case VIDIOC_S_FBUF32:
 		err = alloc_userspace(sizeof(struct v4l2_framebuffer), 0,
 				      &new_p64);
@@ -1700,20 +1537,6 @@ static long do_video_ioctl(struct file *file, unsigned int cmd, unsigned long ar
 		err = put_v4l2_create32(new_p64, p32);
 		break;
 
-	case VIDIOC_PREPARE_BUF32:
-	case VIDIOC_QUERYBUF32:
-	case VIDIOC_QBUF32:
-	case VIDIOC_DQBUF32:
-		err = put_v4l2_buffer32(new_p64, p32);
-		break;
-
-	case VIDIOC_PREPARE_BUF32_TIME32:
-	case VIDIOC_QUERYBUF32_TIME32:
-	case VIDIOC_QBUF32_TIME32:
-	case VIDIOC_DQBUF32_TIME32:
-		err = put_v4l2_buffer32_time32(new_p64, p32);
-		break;
-
 	case VIDIOC_ENUMSTD32:
 		err = put_v4l2_standard32(new_p64, p32);
 		break;
-- 
2.27.0

