Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 977E1120858
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 15:16:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728223AbfLPOPs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 09:15:48 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:60123 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728071AbfLPOPX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 09:15:23 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.145]) with ESMTPA (Nemesis) id
 1Mj831-1i1jVJ0K17-00fDhs; Mon, 16 Dec 2019 15:15:16 +0100
From:   Arnd Bergmann <arnd@arndb.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        y2038@lists.linaro.org, linux-kernel@vger.kernel.org, arnd@arndb.de
Subject: [PATCH v6 2/8] media: v4l2: abstract timeval handling in v4l2_buffer
Date:   Mon, 16 Dec 2019 15:15:00 +0100
Message-Id: <20191216141506.121728-3-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191216141506.121728-1-arnd@arndb.de>
References: <20191216141506.121728-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:VBiiDXfoOh9jfWooojSW6N2tWr2yq+LiAEFTMAtjolltBnI9D3T
 LoVeDUjwqGfctfp8E6+8OEyH9MoF+FWscZpRdqacf7EcaGGmIwJ1zaigUZB2sIG/VCHQYZk
 alkXqzKbnXhA1DReWSyK9c+ixsVjS79kNJn7soQ4Vhp5jElSinhxQfneCoCnxAS/xk0S2F2
 k758EVGVepnF0R8CfvCfA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BV44q3XCE7A=:ruh8DM96iWaQNeDFnNHM9u
 3jq+4cbR2wjmIb/awVjkZicVPeRVvjncbV+l6QRb31XtYworWbRcGlctUL307KrvftV1dhVJi
 36Eqn36INTYksu70Vs00YPaxu3JCjzndeDp3XXzz1eiIvWuo/OEQoTZiSMqckIJolEAcMWD/L
 YEQAyFETh40iaM1TAYnd4pIbpcP0tZ+EWpzNXWNDQQQ2dMHeeg4dhzI06V+FDiHXxPUF2Gt6j
 n/RwAamtcqGre/fQul5Blo+FQ01IZvAiIN7KrlN2juHpH/KNVcUSy2KB/JbYA/BaNv8bO8QLB
 D2HXvrOxzjEw2CtjbA7wkO230sdJddC/KF2UgdR/xu9AiWeIWkHoHLYF9VubHmX1fqB4ZEtfX
 OjvT4z8dI2GTRum9zM19uijhEGJbkT1p5Uvs/bbTjUL++QdTZtIuYFfIIfFT9Te8D6oMovVRu
 9eLyzeM6HQaS24XWXygiYpbX1RJSq7gjqqm0zl8PY0mrR7vRWGDIkWbF4eHlHMVNGZQVCM+ET
 1xjq6AT6Xth6Z0qWkji7usEt+JwQLGd7baLd8hfZoQJoHrXyX8WclKzokesiZB8u685eozXA0
 JlUdoN4/LmPUTP9INha8xOS9NIN2TJUyKSI/crLsRf4620aSgPEkcQMjSKgofzeU5QDnhqtuH
 0lNg8W0Osejc5bA8BlrPvHzC9AJT+t/xGUy8YqOzSw4p5/ePOUnoQLcXqH47exWs+d4mAUcWX
 SK7UyZ5LxlGfybEF7DRK3bCdqXVzc7vJ6qNkNgAbdw+2Xw6jACQCW207RoF1sI5E2fKPaAfeT
 i5ZJ6g08etMvEBvoH5LzHCBhOw7MevUSL/0uXJSlad4URjFiKSCkjIVVZBVa4rTeCaIoqdRhb
 5gG4fIBD2QBxT4+A+NSg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As a preparation for adding 64-bit time_t support in the uapi,
change the drivers to no longer care about the format of the
timestamp field in struct v4l2_buffer.

The v4l2_timeval_to_ns() function is no longer needed in the
kernel after this, but there is userspace code relying on
it to be part of the uapi header.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 .../media/common/videobuf2/videobuf2-v4l2.c   |  4 ++--
 drivers/media/pci/meye/meye.c                 |  4 ++--
 drivers/media/usb/cpia2/cpia2_v4l.c           |  4 ++--
 drivers/media/usb/stkwebcam/stk-webcam.c      |  2 +-
 drivers/media/usb/usbvision/usbvision-video.c |  4 ++--
 drivers/media/v4l2-core/videobuf-core.c       |  5 +++--
 include/media/v4l2-common.h                   | 21 +++++++++++++++++++
 include/trace/events/v4l2.h                   |  2 +-
 include/uapi/linux/videodev2.h                |  2 ++
 9 files changed, 36 insertions(+), 12 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index e652f4318284..eb5d5db96552 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -146,7 +146,7 @@ static void __copy_timestamp(struct vb2_buffer *vb, const void *pb)
 		 * and the timecode field and flag if needed.
 		 */
 		if (q->copy_timestamp)
-			vb->timestamp = v4l2_timeval_to_ns(&b->timestamp);
+			vb->timestamp = v4l2_buffer_get_timestamp(b);
 		vbuf->flags |= b->flags & V4L2_BUF_FLAG_TIMECODE;
 		if (b->flags & V4L2_BUF_FLAG_TIMECODE)
 			vbuf->timecode = b->timecode;
@@ -482,7 +482,7 @@ static void __fill_v4l2_buffer(struct vb2_buffer *vb, void *pb)
 
 	b->flags = vbuf->flags;
 	b->field = vbuf->field;
-	b->timestamp = ns_to_timeval(vb->timestamp);
+	v4l2_buffer_set_timestamp(b, vb->timestamp);
 	b->timecode = vbuf->timecode;
 	b->sequence = vbuf->sequence;
 	b->reserved2 = 0;
diff --git a/drivers/media/pci/meye/meye.c b/drivers/media/pci/meye/meye.c
index 0e61c81356ef..3a4c29bc0ba5 100644
--- a/drivers/media/pci/meye/meye.c
+++ b/drivers/media/pci/meye/meye.c
@@ -1266,7 +1266,7 @@ static int vidioc_querybuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 		buf->flags |= V4L2_BUF_FLAG_DONE;
 
 	buf->field = V4L2_FIELD_NONE;
-	buf->timestamp = ns_to_timeval(meye.grab_buffer[index].ts);
+	v4l2_buffer_set_timestamp(buf, meye.grab_buffer[index].ts);
 	buf->sequence = meye.grab_buffer[index].sequence;
 	buf->memory = V4L2_MEMORY_MMAP;
 	buf->m.offset = index * gbufsize;
@@ -1332,7 +1332,7 @@ static int vidioc_dqbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 	buf->bytesused = meye.grab_buffer[reqnr].size;
 	buf->flags = V4L2_BUF_FLAG_MAPPED | V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	buf->field = V4L2_FIELD_NONE;
-	buf->timestamp = ns_to_timeval(meye.grab_buffer[reqnr].ts);
+	v4l2_buffer_set_timestamp(buf, meye.grab_buffer[reqnr].ts);
 	buf->sequence = meye.grab_buffer[reqnr].sequence;
 	buf->memory = V4L2_MEMORY_MMAP;
 	buf->m.offset = reqnr * gbufsize;
diff --git a/drivers/media/usb/cpia2/cpia2_v4l.c b/drivers/media/usb/cpia2/cpia2_v4l.c
index 626264a56517..9d3d05125d7b 100644
--- a/drivers/media/usb/cpia2/cpia2_v4l.c
+++ b/drivers/media/usb/cpia2/cpia2_v4l.c
@@ -800,7 +800,7 @@ static int cpia2_querybuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 		break;
 	case FRAME_READY:
 		buf->bytesused = cam->buffers[buf->index].length;
-		buf->timestamp = ns_to_timeval(cam->buffers[buf->index].ts);
+		v4l2_buffer_set_timestamp(buf, cam->buffers[buf->index].ts);
 		buf->sequence = cam->buffers[buf->index].seq;
 		buf->flags = V4L2_BUF_FLAG_DONE;
 		break;
@@ -907,7 +907,7 @@ static int cpia2_dqbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 	buf->flags = V4L2_BUF_FLAG_MAPPED | V4L2_BUF_FLAG_DONE
 		| V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	buf->field = V4L2_FIELD_NONE;
-	buf->timestamp = ns_to_timeval(cam->buffers[buf->index].ts);
+	v4l2_buffer_set_timestamp(buf, cam->buffers[buf->index].ts);
 	buf->sequence = cam->buffers[buf->index].seq;
 	buf->m.offset = cam->buffers[buf->index].data - cam->frame_buffer;
 	buf->length = cam->frame_size;
diff --git a/drivers/media/usb/stkwebcam/stk-webcam.c b/drivers/media/usb/stkwebcam/stk-webcam.c
index 21f90a887485..b22501f76b78 100644
--- a/drivers/media/usb/stkwebcam/stk-webcam.c
+++ b/drivers/media/usb/stkwebcam/stk-webcam.c
@@ -1125,7 +1125,7 @@ static int stk_vidioc_dqbuf(struct file *filp,
 	sbuf->v4lbuf.flags &= ~V4L2_BUF_FLAG_QUEUED;
 	sbuf->v4lbuf.flags |= V4L2_BUF_FLAG_DONE;
 	sbuf->v4lbuf.sequence = ++dev->sequence;
-	sbuf->v4lbuf.timestamp = ns_to_timeval(ktime_get_ns());
+	v4l2_buffer_set_timestamp(&sbuf->v4lbuf, ktime_get_ns());
 
 	*buf = sbuf->v4lbuf;
 	return 0;
diff --git a/drivers/media/usb/usbvision/usbvision-video.c b/drivers/media/usb/usbvision/usbvision-video.c
index 93d36aab824f..5ca2c2f35fe2 100644
--- a/drivers/media/usb/usbvision/usbvision-video.c
+++ b/drivers/media/usb/usbvision/usbvision-video.c
@@ -696,7 +696,7 @@ static int vidioc_querybuf(struct file *file,
 	vb->length = usbvision->curwidth *
 		usbvision->curheight *
 		usbvision->palette.bytes_per_pixel;
-	vb->timestamp = ns_to_timeval(usbvision->frame[vb->index].ts);
+	v4l2_buffer_set_timestamp(vb, usbvision->frame[vb->index].ts);
 	vb->sequence = usbvision->frame[vb->index].sequence;
 	return 0;
 }
@@ -765,7 +765,7 @@ static int vidioc_dqbuf(struct file *file, void *priv, struct v4l2_buffer *vb)
 		V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	vb->index = f->index;
 	vb->sequence = f->sequence;
-	vb->timestamp = ns_to_timeval(f->ts);
+	v4l2_buffer_set_timestamp(vb, f->ts);
 	vb->field = V4L2_FIELD_NONE;
 	vb->bytesused = f->scanlength;
 
diff --git a/drivers/media/v4l2-core/videobuf-core.c b/drivers/media/v4l2-core/videobuf-core.c
index 939fc11cf080..2686f03b322e 100644
--- a/drivers/media/v4l2-core/videobuf-core.c
+++ b/drivers/media/v4l2-core/videobuf-core.c
@@ -19,6 +19,7 @@
 #include <linux/interrupt.h>
 
 #include <media/videobuf-core.h>
+#include <media/v4l2-common.h>
 
 #define MAGIC_BUFFER 0x20070728
 #define MAGIC_CHECK(is, should)						\
@@ -364,7 +365,7 @@ static void videobuf_status(struct videobuf_queue *q, struct v4l2_buffer *b,
 	}
 
 	b->field     = vb->field;
-	b->timestamp = ns_to_timeval(vb->ts);
+	v4l2_buffer_set_timestamp(b, vb->ts);
 	b->bytesused = vb->size;
 	b->sequence  = vb->field_count >> 1;
 }
@@ -578,7 +579,7 @@ int videobuf_qbuf(struct videobuf_queue *q, struct v4l2_buffer *b)
 		    || q->type == V4L2_BUF_TYPE_SDR_OUTPUT) {
 			buf->size = b->bytesused;
 			buf->field = b->field;
-			buf->ts = v4l2_timeval_to_ns(&b->timestamp);
+			buf->ts = v4l2_buffer_get_timestamp(b);
 		}
 		break;
 	case V4L2_MEMORY_USERPTR:
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index d8c29e089000..8d0ac0311c84 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -14,6 +14,7 @@
 #ifndef V4L2_COMMON_H_
 #define V4L2_COMMON_H_
 
+#include <linux/time.h>
 #include <media/v4l2-dev.h>
 
 /* Common printk constructs for v4l-i2c drivers. These macros create a unique
@@ -518,4 +519,24 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
 int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
 			u32 width, u32 height);
 
+static inline u64 v4l2_buffer_get_timestamp(const struct v4l2_buffer *buf)
+{
+	/*
+	 * When the timestamp comes from 32-bit user space, there may be
+	 * uninitialized data in tv_usec, so cast it to u32.
+	 * Otherwise allow invalid input for backwards compatibility.
+	 */
+	return buf->timestamp.tv_sec * NSEC_PER_SEC +
+		(u32)buf->timestamp.tv_usec * NSEC_PER_USEC;
+}
+
+static inline void v4l2_buffer_set_timestamp(struct v4l2_buffer *buf,
+                                            u64 timestamp)
+{
+	struct timespec64 ts = ns_to_timespec64(timestamp);
+
+	buf->timestamp.tv_sec  = ts.tv_sec;
+	buf->timestamp.tv_usec = ts.tv_nsec / NSEC_PER_USEC;
+}
+
 #endif /* V4L2_COMMON_H_ */
diff --git a/include/trace/events/v4l2.h b/include/trace/events/v4l2.h
index 83860de120e3..248bc09bfc99 100644
--- a/include/trace/events/v4l2.h
+++ b/include/trace/events/v4l2.h
@@ -130,7 +130,7 @@ DECLARE_EVENT_CLASS(v4l2_event_class,
 		__entry->bytesused = buf->bytesused;
 		__entry->flags = buf->flags;
 		__entry->field = buf->field;
-		__entry->timestamp = timeval_to_ns(&buf->timestamp);
+		__entry->timestamp = v4l2_buffer_get_timestamp(buf);
 		__entry->timecode_type = buf->timecode.type;
 		__entry->timecode_flags = buf->timecode.flags;
 		__entry->timecode_frames = buf->timecode.frames;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 04481c717fee..6ef4a5b787a4 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1017,6 +1017,7 @@ struct v4l2_buffer {
 	};
 };
 
+#ifndef __KERNEL__
 /**
  * v4l2_timeval_to_ns - Convert timeval to nanoseconds
  * @ts:		pointer to the timeval variable to be converted
@@ -1028,6 +1029,7 @@ static inline __u64 v4l2_timeval_to_ns(const struct timeval *tv)
 {
 	return (__u64)tv->tv_sec * 1000000000ULL + tv->tv_usec * 1000;
 }
+#endif
 
 /*  Flags for 'flags' field */
 /* Buffer is mapped (flag) */
-- 
2.20.0

