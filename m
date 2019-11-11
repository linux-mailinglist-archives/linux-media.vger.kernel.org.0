Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26246F815E
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2019 21:39:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727634AbfKKUis (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Nov 2019 15:38:48 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:40109 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727141AbfKKUir (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Nov 2019 15:38:47 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MuVOM-1hdoC52AuQ-00rVLy; Mon, 11 Nov 2019 21:38:39 +0100
From:   Arnd Bergmann <arnd@arndb.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org,
        y2038@lists.linaro.org, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v4 2/8] media: v4l2: abstract timeval handling in v4l2_buffer
Date:   Mon, 11 Nov 2019 21:38:29 +0100
Message-Id: <20191111203835.2260382-3-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191111203835.2260382-1-arnd@arndb.de>
References: <20191111203835.2260382-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fREgJFYS5c/Ce1W7NJCe9Mi1leEMqglZPNH2zLJm3ACCD5EBqSs
 DiL6D0tXQy9xsDvMw2UbMWERCHye/X7V/QBKvLXtgbThbxaPM65ILIHbsvqjp8UeWPKyMfr
 g3O9+Ntw04O76HB/+wLc4evlZ6yXJv7ZN72xutCJi9fOel6sy+DkxFe0VAe3+L8Qv8mjeJZ
 iL95JvK5GDI3sBO3ippaA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:eT9LInbvktc=:Jolj81xjQfFEuAUz1T0pgn
 WBwkR2B98+FlnEbudPfejMmQ+EoXPolujBmtwk9Sx03GNgVSpI85MEoGP4h7JkyJlX9ajQzBz
 gVOHF2gGT/SeujFxAr3xegiDo0rKZTVn5lq9M/2UtTCrOoNLOi/r+9y0hIAn47enB/XmcC1RZ
 Iw6j7hJ5lvpzMJc0WAbUMCgOB0v3azL/nR6GNwXAdYJ8ydzAyvjRUux4WMStaVwxXiEI7rI/A
 scu4Mojmq+dGT33fBQch/BoYqW2cpELNEXuKPLVemYzZ50xTBr2eJKxESs+e2RMM+c9FczKwQ
 M9/rsuYdsPQPvNQcq4cOoLIvTTqy/4Yarb/xWkieox4TMnGMBR6dzNBC78xwo44+n4xK9hyJk
 8tCIbmQT95pbiqhQdFcjcCkn65zwAhzVpMHH2tGsjO9AMs/VFylz32Ec652OZKA6P2lGvPgIR
 qrYCdkwOQRWqXPSV2FuKyTfl/QUCmW7HLBSHIV9xaRJaqKdhEUO9rSx8Wq8gouagsufitYi6X
 pk/9OxUEhOT+iA1LrE/XdKvq3KpQcjE7N54AOBWPQERa5aSuLhR30TRQoZSKHaXFKgwE4fjxH
 SaA5bGMQhzR+QUTnG3NjYlHavT/zl0YfPvZai+31edusW4QphO4ORHhcGDJ7PHxF8kvJ3/HUX
 u7F9UV4SqgupOpV4bGmg8kTxm++6CezNByp1rsCoyzD8i0s0dE+B8LjNdo+J7VWs/YLL/a7mG
 nipWylNb1dH7QIYK8UaXDejv0UnAqNFuph1UMWDpdaDWLvlcdOvVGPeeWa7PmGZeie6g9iq3L
 tfS6hA078F2gpILyFg0eEh/Eo+tgWw88j2nP4YPD356UQn9GDgA956yLkthr0I3+WdIYT2uxC
 kYD7WTBSacGM5m9EaLlQ==
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
index 5a9ba3846f0a..9ec710878db6 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -143,7 +143,7 @@ static void __copy_timestamp(struct vb2_buffer *vb, const void *pb)
 		 * and the timecode field and flag if needed.
 		 */
 		if (q->copy_timestamp)
-			vb->timestamp = v4l2_timeval_to_ns(&b->timestamp);
+			vb->timestamp = v4l2_buffer_get_timestamp(b);
 		vbuf->flags |= b->flags & V4L2_BUF_FLAG_TIMECODE;
 		if (b->flags & V4L2_BUF_FLAG_TIMECODE)
 			vbuf->timecode = b->timecode;
@@ -476,7 +476,7 @@ static void __fill_v4l2_buffer(struct vb2_buffer *vb, void *pb)
 
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
index cdc66adda755..15a423c5deb7 100644
--- a/drivers/media/usb/usbvision/usbvision-video.c
+++ b/drivers/media/usb/usbvision/usbvision-video.c
@@ -687,7 +687,7 @@ static int vidioc_querybuf(struct file *file,
 	vb->length = usbvision->curwidth *
 		usbvision->curheight *
 		usbvision->palette.bytes_per_pixel;
-	vb->timestamp = ns_to_timeval(usbvision->frame[vb->index].ts);
+	v4l2_buffer_set_timestamp(vb, usbvision->frame[vb->index].ts);
 	vb->sequence = usbvision->frame[vb->index].sequence;
 	return 0;
 }
@@ -756,7 +756,7 @@ static int vidioc_dqbuf(struct file *file, void *priv, struct v4l2_buffer *vb)
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
index 16c0ed6c50a7..4086036e37d5 100644
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
+	       (u32)buf->timestamp.tv_usec * NSEC_PER_USEC;
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
index 530638dffd93..74d3d522f3db 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1010,6 +1010,7 @@ struct v4l2_buffer {
 	};
 };
 
+#ifndef __KERNEL__
 /**
  * v4l2_timeval_to_ns - Convert timeval to nanoseconds
  * @ts:		pointer to the timeval variable to be converted
@@ -1021,6 +1022,7 @@ static inline __u64 v4l2_timeval_to_ns(const struct timeval *tv)
 {
 	return (__u64)tv->tv_sec * 1000000000ULL + tv->tv_usec * 1000;
 }
+#endif
 
 /*  Flags for 'flags' field */
 /* Buffer is mapped (flag) */
-- 
2.20.0

