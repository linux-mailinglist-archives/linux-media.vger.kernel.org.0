Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C202120855
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 15:16:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728194AbfLPOPi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 09:15:38 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:33683 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728102AbfLPOPY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 09:15:24 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MPGmZ-1iLkIS0Nvp-00PchA; Mon, 16 Dec 2019 15:15:17 +0100
From:   Arnd Bergmann <arnd@arndb.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        y2038@lists.linaro.org, linux-kernel@vger.kernel.org, arnd@arndb.de
Subject: [PATCH v6 6/8] media: v4l2-core: fix v4l2_buffer handling for time64 ABI
Date:   Mon, 16 Dec 2019 15:15:04 +0100
Message-Id: <20191216141506.121728-7-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191216141506.121728-1-arnd@arndb.de>
References: <20191216141506.121728-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ZzV+/SPxEr7IXPzJzPpYUMVeFASoyIg8UxJ2Se0Ka2Peh56qs/M
 7tNIapml3ssEA+NgtSlbky8S3z7OCp3Bpggi6t7lhYGO84st0RgxyzODY+GTTzHu4oU85kt
 /42euk9llt499O9sSxr3JflYCV0S4Y3817RC8EnAOBbfbjWyYIIrro9yc0cdUPfBNKEwLLU
 7X4Gk3zaQVT/Uv3aI3/nQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LqGQjlxwTkQ=:6Pw+0vroXxibuqqglVYvV3
 0mWVEMugmcBpqmTu8doft6pPViJldKnPFTphZi/5YzZDSqBrw/CJoUWaZJm/q/TtthYyh478H
 JBzw5lu8k+seoENVWdIoMCUZDVLrDgC3AscX5nmZ/0VItMjCr037tDCLXeP/cnn4M34RbDiQX
 PlJ702IDHuZi3Z7P3TcaNYuEqlyQXeM+HHJ45B5Pj/A3FpPT9ZxpkM7/xQVr4nNIpMIIoweRz
 qiL49C4+W+b73X1r15NZl/G3JX6ZuoARuqdBgX9hG5bjVh/mWpqo9xNunolj0jVdd0mepO+hb
 TmbIvWgsBTcjtVC14bZksmqx+2MZX67zlQxL3j/7TWiPilzXNtJHcG1mRUyyR0gM4/7mtQ73N
 kCMNK/YSmaBUzDrtKdOPSeM+j5dDLIXb4Up6dHQowuhFC0D/ZSHdJQ3M2UuaxY368fZ5rRoYq
 GZiOzx94wu/JaF3oWRHi6Nu6eLbbdqijmcBXJr+stMzQgFfKBdluJWdKIStIhrFECyiPoYtDQ
 2hFsJVx2mI6fRcIKO+zp6tDOc6w4zQ0jwrXJ20RN2CgqXNABg1xIGjmzVPjUVD6p2/aWhWF5U
 FksoEeOxB5ofINheeGmC1ZOLcHHJHNEgkfZdXGKW5+G9kmAckwL4ZMTucsFcXbubnhnEEVRK2
 wgQBzjUqjuJQMygibtYZRT6MIWjS2hwbErUh5sSr3MO/mq9GTQwf2LzJS/DFw6AmWShXCdEza
 Xk2MdpRA7oof4AnxFEGGaNrApcuzmxhsc/w0bqIq82I3jJwZp/OEAo7VsT1CX8m+diswab5zp
 xODlBfR9+mckmU/VwFW4QRBus5eO5oRTPDkL3D9/Tc7l7hDeDjQBJAOh9HStrje+Qo9Y0ayhr
 hNXZMJsunlgfnthaOb3Q==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The v4l2_buffer structure contains a 'struct timeval' member that is
defined by the user space C library, creating an ABI incompatibility
when that gets updated to a 64-bit time_t.

As in v4l2_event, handle this with a special case in video_put_user()
and video_get_user() to replace the memcpy there.

Since the structure also contains a pointer, there are now two
native versions (on 32-bit systems) as well as two compat versions
(on 64-bit systems), which unfortunately complicates the compat
handler quite a bit.

Duplicating the existing handlers for the new types is a safe
conversion for now, but unfortunately this may turn into a
maintenance burden later. A larger-scale rework of the
compat code might be a better alternative, but is out of scope
of the y2038 work.

Sparc64 needs a special case because of their special suseconds_t
definition.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 74 ++++++++++++++++++++++++++--
 include/media/v4l2-ioctl.h           | 30 +++++++++++
 include/uapi/linux/videodev2.h       | 23 +++++++++
 3 files changed, 123 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index b066e27e99a2..667225712343 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -474,10 +474,10 @@ static void v4l_print_buffer(const void *arg, bool write_only)
 	const struct v4l2_plane *plane;
 	int i;
 
-	pr_cont("%02ld:%02d:%02d.%08ld index=%d, type=%s, request_fd=%d, flags=0x%08x, field=%s, sequence=%d, memory=%s",
-			p->timestamp.tv_sec / 3600,
-			(int)(p->timestamp.tv_sec / 60) % 60,
-			(int)(p->timestamp.tv_sec % 60),
+	pr_cont("%02d:%02d:%02d.%09ld index=%d, type=%s, request_fd=%d, flags=0x%08x, field=%s, sequence=%d, memory=%s",
+			(int)p->timestamp.tv_sec / 3600,
+			((int)p->timestamp.tv_sec / 60) % 60,
+			((int)p->timestamp.tv_sec % 60),
 			(long)p->timestamp.tv_usec,
 			p->index,
 			prt_names(p->type, v4l2_type_names), p->request_fd,
@@ -3029,6 +3029,14 @@ static unsigned int video_translate_cmd(unsigned int cmd)
 #ifdef CONFIG_COMPAT_32BIT_TIME
 	case VIDIOC_DQEVENT_TIME32:
 		return VIDIOC_DQEVENT;
+	case VIDIOC_QUERYBUF_TIME32:
+		return VIDIOC_QUERYBUF;
+	case VIDIOC_QBUF_TIME32:
+		return VIDIOC_QBUF;
+	case VIDIOC_DQBUF_TIME32:
+		return VIDIOC_DQBUF;
+	case VIDIOC_PREPARE_BUF_TIME32:
+		return VIDIOC_PREPARE_BUF;
 #endif
 	}
 
@@ -3047,6 +3055,39 @@ static int video_get_user(void __user *arg, void *parg, unsigned int cmd,
 	}
 
 	switch (cmd) {
+#ifdef CONFIG_COMPAT_32BIT_TIME
+	case VIDIOC_QUERYBUF_TIME32:
+	case VIDIOC_QBUF_TIME32:
+	case VIDIOC_DQBUF_TIME32:
+	case VIDIOC_PREPARE_BUF_TIME32: {
+		struct v4l2_buffer_time32 vb32;
+		struct v4l2_buffer *vb = parg;
+
+		if (copy_from_user(&vb32, arg, sizeof(vb32)))
+			return -EFAULT;
+
+		*vb = (struct v4l2_buffer) {
+			.index		= vb32.index,
+			.type		= vb32.type,
+			.bytesused	= vb32.bytesused,
+			.flags		= vb32.flags,
+			.field		= vb32.field,
+			.timestamp.tv_sec	= vb32.timestamp.tv_sec,
+			.timestamp.tv_usec	= vb32.timestamp.tv_usec,
+			.timecode	= vb32.timecode,
+			.sequence	= vb32.sequence,
+			.memory		= vb32.memory,
+			.m.userptr	= vb32.m.userptr,
+			.length		= vb32.length,
+			.request_fd	= vb32.request_fd,
+		};
+
+		if (cmd == VIDIOC_QUERYBUF_TIME32)
+			vb->request_fd = 0;
+
+		break;
+	}
+#endif
 	default:
 		/*
 		 * In some cases, only a few fields are used as input,
@@ -3100,6 +3141,31 @@ static int video_put_user(void __user *arg, void *parg, unsigned int cmd)
 			return -EFAULT;
 		break;
 	}
+	case VIDIOC_QUERYBUF_TIME32:
+	case VIDIOC_QBUF_TIME32:
+	case VIDIOC_DQBUF_TIME32:
+	case VIDIOC_PREPARE_BUF_TIME32: {
+		struct v4l2_buffer *vb = parg;
+		struct v4l2_buffer_time32 vb32 = {
+			.index		= vb->index,
+			.type		= vb->type,
+			.bytesused	= vb->bytesused,
+			.flags		= vb->flags,
+			.field		= vb->field,
+			.timestamp.tv_sec	= vb->timestamp.tv_sec,
+			.timestamp.tv_usec	= vb->timestamp.tv_usec,
+			.timecode	= vb->timecode,
+			.sequence	= vb->sequence,
+			.memory		= vb->memory,
+			.m.userptr	= vb->m.userptr,
+			.length		= vb->length,
+			.request_fd	= vb->request_fd,
+		};
+
+		if (copy_to_user(arg, &vb32, sizeof(vb32)))
+			return -EFAULT;
+		break;
+	}
 #endif
 	default:
 		/*  Copy results into user buffer  */
diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
index 05c1ec93a911..86878fba332b 100644
--- a/include/media/v4l2-ioctl.h
+++ b/include/media/v4l2-ioctl.h
@@ -749,4 +749,34 @@ struct v4l2_event_time32 {
 
 #define	VIDIOC_DQEVENT_TIME32	 _IOR('V', 89, struct v4l2_event_time32)
 
+struct v4l2_buffer_time32 {
+	__u32			index;
+	__u32			type;
+	__u32			bytesused;
+	__u32			flags;
+	__u32			field;
+	struct old_timeval32	timestamp;
+	struct v4l2_timecode	timecode;
+	__u32			sequence;
+
+	/* memory location */
+	__u32			memory;
+	union {
+		__u32           offset;
+		unsigned long   userptr;
+		struct v4l2_plane *planes;
+		__s32		fd;
+	} m;
+	__u32			length;
+	__u32			reserved2;
+	union {
+		__s32		request_fd;
+		__u32		reserved;
+	};
+};
+#define VIDIOC_QUERYBUF_TIME32	_IOWR('V',  9, struct v4l2_buffer_time32)
+#define VIDIOC_QBUF_TIME32	_IOWR('V', 15, struct v4l2_buffer_time32)
+#define VIDIOC_DQBUF_TIME32	_IOWR('V', 17, struct v4l2_buffer_time32)
+#define VIDIOC_PREPARE_BUF_TIME32 _IOWR('V', 93, struct v4l2_buffer_time32)
+
 #endif /* _V4L2_IOCTL_H */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index caf156d45842..5f9357dcb060 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -912,6 +912,25 @@ struct v4l2_jpegcompression {
 /*
  *	M E M O R Y - M A P P I N G   B U F F E R S
  */
+
+#ifdef __KERNEL__
+/*
+ * This corresponds to the user space version of timeval
+ * for 64-bit time_t. sparc64 is different from everyone
+ * else, using the microseconds in the wrong half of the
+ * second 64-bit word.
+ */
+struct __kernel_v4l2_timeval {
+	long long	tv_sec;
+#if defined(__sparc__) && defined(__arch64__)
+	int		tv_usec;
+	int		__pad;
+#else
+	long long	tv_usec;
+#endif
+};
+#endif
+
 struct v4l2_requestbuffers {
 	__u32			count;
 	__u32			type;		/* enum v4l2_buf_type */
@@ -997,7 +1016,11 @@ struct v4l2_buffer {
 	__u32			bytesused;
 	__u32			flags;
 	__u32			field;
+#ifdef __KERNEL__
+	struct __kernel_v4l2_timeval timestamp;
+#else
 	struct timeval		timestamp;
+#endif
 	struct v4l2_timecode	timecode;
 	__u32			sequence;
 
-- 
2.20.0

