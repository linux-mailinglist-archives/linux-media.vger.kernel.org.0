Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADA7410A1DC
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 17:19:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728799AbfKZQS7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 11:18:59 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:42103 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728740AbfKZQSm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 11:18:42 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.145]) with ESMTPA (Nemesis) id
 1N3sNa-1hrk8h0iXo-00zkhP; Tue, 26 Nov 2019 17:18:35 +0100
From:   Arnd Bergmann <arnd@arndb.de>
To:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     y2038@lists.linaro.org, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v5 6/8] media: v4l2-core: fix v4l2_buffer handling for time64 ABI
Date:   Tue, 26 Nov 2019 17:18:22 +0100
Message-Id: <20191126161824.337724-7-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191126161824.337724-1-arnd@arndb.de>
References: <20191126161824.337724-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MpJL5kq5Qh38TN+TsyjI3Z9+stjWek1mdImDxxdOkH2BzJv0ttG
 8hXy4piwfh/1vPwu+yQY7GWmJlARXmO5DcpZH2I2ROW6QITtkUAgjyjwVnT3HndHrhRJoKM
 oGHKTQHs1u4sefpkkEnbjqiVrRXasBcJ7Vy9czGcYRNdHFdAOFAclvQfZMhJNxhxL771Jc3
 nmeNl/q1+UKvt4/5gEUMQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SSPchkp55RM=:CsLc8nmSzW3sXLHk8pL4yX
 ENNj6dJZx5/U0PjWlxrNjl/wjk4UFzP06dM0a9cqsO4N50megIk83AnhPv9w37Vc8E2LRr527
 MmHmhINHGU+p/ztef4MJ9FinEeiI+727lHcni0CRN1zsaw/G6eeeAdndeODOvxHHBjBuAo6wq
 DfeSjJAk7RbRRhlaGRlW3GJLwCFSYSNwfJ68BzuHmNCF/U9dlm/LBzU5KbBxH6CY4BrB/Sk0U
 NWjBU1rNAxnIz9lCXpi5EHrJ7TeBce2U2Z0uY3eII6ecJbncfCc739OxvSeDZw8zaYlpQBcDY
 iKTL9F5AswkS8THKnrQ2FBnuZmVW1RQeHdXqz/hOCU7phD0L2u2rGK7JVMQKLS+NBXcCogB/T
 pvRWXbyPbp4ecHEKtgAr3g/aYTg4YQ/e/Uos9PFpyyKLHdHqzZG2qwQjgAR3t1SN8J2Mo3T4V
 UUQpQuIl7EcOGOlpz51dAhjaiYP7ad2+K16UVdSTpTnDNVUKY49nBLSbZ9qNOZhu2Rj18sNif
 ynopbU72Y2TyOocyMs3ltJBdRbvMdybWyk7jEGZn4hjJdaMi0no1uqkVM+TieR8wx99Sdku+W
 sknBL11AU/KV++7DOId7OBbp0yFwcLUS+BuMHVXWt4BLEeWlv/UQ1fgkBGAp2lVJAAZ7jh711
 M1M3TlW6YHLC/Vmtx92fJD/uyiEULlQzYYl2VkLpQvCW36X4hXiq7+SOd+T/20zatTBMyMZjV
 7cKuhYZ/40cuUd5Gj19dwqTX40uTfeBS/Px6LnYTOqcy3BFg9XL2Y7OuJhnyPk0bjn1Ah5xVa
 O8jeOIY5cKzgk54ehhgcMNL4C8C56ViJlMnWIFXV9aXrtiG2oIq/dJ+Qw8mVyvnRNvEEXc/BM
 ZEE5PSE+0ijk9aL24a9A==
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
 drivers/media/v4l2-core/v4l2-ioctl.c | 73 ++++++++++++++++++++++++++--
 include/media/v4l2-ioctl.h           | 30 ++++++++++++
 include/uapi/linux/videodev2.h       | 23 +++++++++
 3 files changed, 122 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 96aafb659783..4d611a847462 100644
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
+#ifdef COMPAT_32BIT_TIME
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
+			.memory		= vb32.memory,
+			.m.userptr	= vb32.m.usercopy,
+			.length		= vb32.length,
+			.request_fd	= vb32.request_fd,
+		};
+
+		if (cmd == VIDIOC_QUERYBUF_TIME32)
+			memset(&vb->length, 0, sizeof(*vb) -
+			       offsetof(struct v4l2_buffer, length));
+
+		break;
+	}
+#endif
 	default:
 		/*
 		 * In some cases, only a few fields are used as input,
@@ -3100,6 +3141,30 @@ static int video_put_user(void __user *arg, void *parg, unsigned int cmd)
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

