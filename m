Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AB47F1F3C
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 20:49:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732027AbfKFTrn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 14:47:43 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:60907 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726713AbfKFTrm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Nov 2019 14:47:42 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1N336J-1hneOg2SMv-013LtV; Wed, 06 Nov 2019 20:47:27 +0100
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
Subject: [PATCH v3 2/8] media: v4l2: abstract timeval handling in v4l2_buffer
Date:   Wed,  6 Nov 2019 20:47:09 +0100
Message-Id: <20191106194715.2238044-3-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191106194715.2238044-1-arnd@arndb.de>
References: <20191106194715.2238044-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:CI8NmnbaqFJd0bRVPgyIf+IWFn+d4q6tqgGn007CR9gLhlzYLCI
 HjkxtvO+wNjOT762I+3FNz9mJuZpnZPlmL0GeYugkeXm0ozlFYguwvoAehNoufTv9GnDBfo
 ZJr36HV1NSX2hxgHX+ZzDQneBUgEpwXG1uzJG4jquVIb+UeMAE2QANk3HWKHOvpt/t8STLa
 e657Wk7tBBVigZs6fG2Hg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:B9AhFum4mTw=:65r+YIdwLBY8wqzhOXwzkD
 ghBiimdrddcy/OUz4s0nQXuUTJrLNeHfMp7QupImrnKerfQNVvI7LJAB7sEVqpQ2UlNcb+9Q/
 KsQyEiByTejjmuL2MdYrV+WsIWQHKmmpNAl934q1VqBBsNwQ6e1bBr7JcLAYjU6YAJikZdYPD
 2lsC1Qa5/jk22fYxtn352YetBA4ORLhB6TguA7AXfYwolb7HoEEjYHbuxp2fGcVDs/uVAAw+J
 Xt17NxRsg/bRV/LixGkIIPFhEHwx7PrTGNOusyo/IBhAev0p5jCC7NJtGGMKnepSSC5Sq/58S
 SQBJTvxrkrVuGiN8iZZI6vSuapElXH80WxWymzh2NS3PNHhsAUhouzXTjU7WtbB62ndUHsqjc
 gnXu3EKyyes6MxkvLjvOLuu/MzptEQmMjfDlQYYdEouX0KoJECBseSxEpnCKwRZ+kOqiO7TfK
 4ObfNQnvBqcvA/RKGhKCpw+nuM6FxLkK9phXt16mAkKe7HRXChAzHJAZsniGHcTOlJWNHS9iz
 ovPVWR2QUl8aLO8XZYekFavcIpPhQ74BDKCzI9dV6LCiwLj2+1ENH7iGV9f3TCzVCmXnWP2Ur
 CswI8J7UqwhvsAIF63/vTyOfTmwz6ESs38bNNfwBfZG4NjLFvKtU+kXKJyTNvkFJyTNl5pfhV
 hndZN3YpYdHET5ywtDmTDKGtR4/ktoBToTuYOicG1VFvCRlV1P9Xd0VAQ/MBdDMljJvCvor7O
 mDAvlHfjTCZlbAcMwXX3CsrTMMuBgh/wdEBO6kCXzF1MuPs4WdSCA+FWgaOLQ9oUHnnv8LIie
 CKn/2hOVdexbRFmZn+99PhXsItAl96Rc+gtdL12PJ6jV7DCuretfwXAfgKrHAWtYy9EUDXSO2
 kHVtY8lix1NhyZnjdmzA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As a preparation for adding 64-bit time_t support in the uapi,
change the drivers to no longer care about the format of the
timestamp field in struct v4l2_buffer.

The v4l2_timeval_to_ns() function is no longer needed in the
kernel after this, but there may be userspace code relying on
it because it is part of the uapi header.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/common/videobuf2/videobuf2-v4l2.c |  4 ++--
 drivers/media/pci/meye/meye.c                   |  4 ++--
 drivers/media/usb/cpia2/cpia2_v4l.c             |  4 ++--
 drivers/media/usb/stkwebcam/stk-webcam.c        |  2 +-
 drivers/media/usb/usbvision/usbvision-video.c   |  4 ++--
 drivers/media/v4l2-core/videobuf-core.c         |  4 ++--
 include/linux/videodev2.h                       | 17 ++++++++++++++++-
 include/trace/events/v4l2.h                     |  2 +-
 include/uapi/linux/videodev2.h                  |  2 ++
 9 files changed, 30 insertions(+), 13 deletions(-)

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
index cfca3c70599b..1b730ac31499 100644
--- a/drivers/media/usb/stkwebcam/stk-webcam.c
+++ b/drivers/media/usb/stkwebcam/stk-webcam.c
@@ -1126,7 +1126,7 @@ static int stk_vidioc_dqbuf(struct file *filp,
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
index 939fc11cf080..ab650371c151 100644
--- a/drivers/media/v4l2-core/videobuf-core.c
+++ b/drivers/media/v4l2-core/videobuf-core.c
@@ -364,7 +364,7 @@ static void videobuf_status(struct videobuf_queue *q, struct v4l2_buffer *b,
 	}
 
 	b->field     = vb->field;
-	b->timestamp = ns_to_timeval(vb->ts);
+	v4l2_buffer_set_timestamp(b, vb->ts);
 	b->bytesused = vb->size;
 	b->sequence  = vb->field_count >> 1;
 }
@@ -578,7 +578,7 @@ int videobuf_qbuf(struct videobuf_queue *q, struct v4l2_buffer *b)
 		    || q->type == V4L2_BUF_TYPE_SDR_OUTPUT) {
 			buf->size = b->bytesused;
 			buf->field = b->field;
-			buf->ts = v4l2_timeval_to_ns(&b->timestamp);
+			buf->ts = v4l2_buffer_get_timestamp(b);
 		}
 		break;
 	case V4L2_MEMORY_USERPTR:
diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
index 16c0ed6c50a7..481ee3013b50 100644
--- a/include/linux/videodev2.h
+++ b/include/linux/videodev2.h
@@ -56,7 +56,22 @@
 #ifndef __LINUX_VIDEODEV2_H
 #define __LINUX_VIDEODEV2_H
 
-#include <linux/time.h>     /* need struct timeval */
+#include <linux/time.h>
 #include <uapi/linux/videodev2.h>
 
+static inline u64 v4l2_buffer_get_timestamp(const struct v4l2_buffer *buf)
+{
+	return buf->timestamp.tv_sec * NSEC_PER_SEC +
+	       buf->timestamp.tv_usec * NSEC_PER_USEC;
+}
+
+static inline void v4l2_buffer_set_timestamp(struct v4l2_buffer *buf,
+					     u64 timestamp)
+{
+	struct timespec64 ts = ns_to_timespec64(timestamp);
+
+	buf->timestamp.tv_sec  = ts.tv_sec;
+	buf->timestamp.tv_usec = ts.tv_nsec / NSEC_PER_USEC;
+}
+
 #endif /* __LINUX_VIDEODEV2_H */
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
index f98bbcced8ff..5de1e37995c0 100644
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

