Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 438EBF1F3E
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 20:49:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727411AbfKFTsD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 14:48:03 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:55489 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727785AbfKFTrn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Nov 2019 14:47:43 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MqrsF-1i6Hk80KxN-00mw1x; Wed, 06 Nov 2019 20:47:29 +0100
From:   Arnd Bergmann <arnd@arndb.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        y2038@lists.linaro.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Daniel Mentz <danielmentz@google.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v3 6/8] media: v4l2-core: fix v4l2_buffer handling for time64 ABI
Date:   Wed,  6 Nov 2019 20:47:13 +0100
Message-Id: <20191106194715.2238044-7-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191106194715.2238044-1-arnd@arndb.de>
References: <20191106194715.2238044-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:sc+E8Llli0i6zWDJ5b6ZUOrnyQIsdXdsefrm3zBU54roXTqyjPG
 XNSzpdPbZ+bpe78taJr05sGeWRpGJMTCW2n648gYdDimfCbf1fMa4gZn6Q3jciIPyVVy4nj
 w4o7vweZDVzR5cUnlLK4omjtt2fnuvghU78RfkHGK5SFzL0a1+KQ3YPRzs0zU004e8akSoC
 7VO+ug1I1DtWcMm4/LZWQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TIdFNfQgxDk=:MVGDAmLxNA+o/HHvVXGvJ6
 toakWwOYnA9F1EypIlGtOVy7esPODSEDpbbz7YHgPYDK7w66DZJUz5Woz6V3VlM8hlXw5ow7/
 6VAZKVUysVACDNhRmBmM8NMT54SvQTLGH04zsdwkjlnVbNyoSHrLRdVFW04Zu+w13D9azSORe
 hDTnVzZbf4HdVkxYOV2ZFuV6lg6JXjsXOC4s13Mc73BAl3ClKF+7oIZZn5zcd41SmWUWPizhM
 mEHeO1H09zmogpThqfoFS+PlFdRQR3I4uQztONdX2OqIkcGEigbb0m0Uf1C9tT53+99FBsySX
 D2DS4hV47KZezuGHPS7cnYTQGFm5GZZ/4atck9JFgEsFSScJCMs1tlFrtdU8RyomHdh8glZwb
 1mneqxH8mamucdW4IvYuxaHEy48/pd6bP0icsHQMhcpE8bi0dahpGVl4q+p+dcO51YsWFRqmq
 87jcc1iaE6e/nsmxsiIfXobR1uSBBlHlkMSGE+6+4b/WzuGzVQ1lDaueCDQK6+lONhQuifNyx
 xw9lnSsC+0jCjxUBDI7gJPK8onm/T2oP/oPdsy96THIpYqHFwl3gPX/P/6T6qMMB7czai6MEz
 d8qbY7x9H5Om/lUb6+LHdwyndVeMUTsm4RH+3q3IGNNdPRHDO9AUZV3Kpsvzb/AFD2jLIjGar
 DRnQ1P/xiOh5UzDyhc65ujqvOuV/7M9UTcM15Dbmlncx4hDOiRMzCphZLpWV5DAR6FOnCxxoo
 hsftf2muhJq6p7B+2fylO+KCCOtao+V4RaSzPs2Mz6RoEXXghlXW/bfu17K4q/GO3RrJMB9Sh
 w4KREKOAwazxWcR+1ozjp1qLIVMjnop+1n7pOU2Ul0ywgVUpendkJW+Hf0l3hAQlHlR3Zzy2s
 G9LRmaVJgEdHH0fnFgwQ==
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

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 57 ++++++++++++++++++++++++++--
 include/uapi/linux/videodev2.h       | 40 +++++++++++++++++++
 2 files changed, 93 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index b8aca0d174bd..cd9a80960289 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -474,10 +474,10 @@ static void v4l_print_buffer(const void *arg, bool write_only)
 	const struct v4l2_plane *plane;
 	int i;
 
-	pr_cont("%02ld:%02d:%02d.%08ld index=%d, type=%s, request_fd=%d, flags=0x%08x, field=%s, sequence=%d, memory=%s",
-			p->timestamp.tv_sec / 3600,
-			(int)(p->timestamp.tv_sec / 60) % 60,
-			(int)(p->timestamp.tv_sec % 60),
+	pr_cont("%02ld:%02d:%02d.%09ld index=%d, type=%s, request_fd=%d, flags=0x%08x, field=%s, sequence=%d, memory=%s",
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
 
@@ -3047,6 +3055,30 @@ static int video_get_user(void __user *arg, void *parg, unsigned int cmd,
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
+		memcpy(vb, &vb32, offsetof(struct v4l2_buffer, timestamp));
+		vb->timestamp.tv_sec = vb32.timestamp.tv_sec;
+		vb->timestamp.tv_usec = vb32.timestamp.tv_usec;
+	        memcpy(&vb->timecode, &vb32.timecode,
+		       sizeof(*vb) - offsetof(struct v4l2_buffer, timecode));
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
@@ -3095,6 +3127,23 @@ static int video_put_user(void __user *arg, void *parg, unsigned int cmd)
 			return -EFAULT;
 		break;
 	}
+	case VIDIOC_QUERYBUF_TIME32:
+	case VIDIOC_QBUF_TIME32:
+	case VIDIOC_DQBUF_TIME32:
+	case VIDIOC_PREPARE_BUF_TIME32: {
+		struct v4l2_buffer_time32 vb32;
+		struct v4l2_buffer *vb = parg;
+
+		memcpy(&vb32, vb, offsetof(struct v4l2_buffer, timestamp));
+		vb32.timestamp.tv_sec = vb->timestamp.tv_sec;
+		vb32.timestamp.tv_usec = vb->timestamp.tv_usec;
+	        memcpy(&vb32.timecode, &vb->timecode,
+		       sizeof(*vb) - offsetof(struct v4l2_buffer, timecode));
+
+		if (copy_to_user(arg, &vb32, sizeof(vb32)))
+			return -EFAULT;
+		break;
+	}
 #endif
 	default:
 		/*  Copy results into user buffer  */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index e38afa71a327..4275d6e92dae 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -997,7 +997,42 @@ struct v4l2_buffer {
 	__u32			bytesused;
 	__u32			flags;
 	__u32			field;
+#ifdef __KERNEL__
+	/* match glibc timeval64 format */
+	struct {
+		long long	tv_sec;
+		long long	tv_usec;
+	} timestamp;
+#else
 	struct timeval		timestamp;
+#endif
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
+
+#ifdef __KERNEL__
+struct v4l2_buffer_time32 {
+	__u32			index;
+	__u32			type;
+	__u32			bytesused;
+	__u32			flags;
+	__u32			field;
+	struct old_timeval32	timestamp;
 	struct v4l2_timecode	timecode;
 	__u32			sequence;
 
@@ -1016,6 +1051,7 @@ struct v4l2_buffer {
 		__u32		reserved;
 	};
 };
+#endif
 
 #ifndef __KERNEL__
 /**
@@ -2457,12 +2493,15 @@ struct v4l2_create_buffers {
 #define VIDIOC_S_FMT		_IOWR('V',  5, struct v4l2_format)
 #define VIDIOC_REQBUFS		_IOWR('V',  8, struct v4l2_requestbuffers)
 #define VIDIOC_QUERYBUF		_IOWR('V',  9, struct v4l2_buffer)
+#define VIDIOC_QUERYBUF_TIME32	_IOWR('V',  9, struct v4l2_buffer_time32)
 #define VIDIOC_G_FBUF		 _IOR('V', 10, struct v4l2_framebuffer)
 #define VIDIOC_S_FBUF		 _IOW('V', 11, struct v4l2_framebuffer)
 #define VIDIOC_OVERLAY		 _IOW('V', 14, int)
 #define VIDIOC_QBUF		_IOWR('V', 15, struct v4l2_buffer)
+#define VIDIOC_QBUF_TIME32	_IOWR('V', 15, struct v4l2_buffer_time32)
 #define VIDIOC_EXPBUF		_IOWR('V', 16, struct v4l2_exportbuffer)
 #define VIDIOC_DQBUF		_IOWR('V', 17, struct v4l2_buffer)
+#define VIDIOC_DQBUF_TIME32	_IOWR('V', 17, struct v4l2_buffer_time32)
 #define VIDIOC_STREAMON		 _IOW('V', 18, int)
 #define VIDIOC_STREAMOFF	 _IOW('V', 19, int)
 #define VIDIOC_G_PARM		_IOWR('V', 21, struct v4l2_streamparm)
@@ -2531,6 +2570,7 @@ struct v4l2_create_buffers {
 #define	VIDIOC_UNSUBSCRIBE_EVENT _IOW('V', 91, struct v4l2_event_subscription)
 #define VIDIOC_CREATE_BUFS	_IOWR('V', 92, struct v4l2_create_buffers)
 #define VIDIOC_PREPARE_BUF	_IOWR('V', 93, struct v4l2_buffer)
+#define VIDIOC_PREPARE_BUF_TIME32 _IOWR('V', 93, struct v4l2_buffer_time32)
 #define VIDIOC_G_SELECTION	_IOWR('V', 94, struct v4l2_selection)
 #define VIDIOC_S_SELECTION	_IOWR('V', 95, struct v4l2_selection)
 #define VIDIOC_DECODER_CMD	_IOWR('V', 96, struct v4l2_decoder_cmd)
-- 
2.20.0

