Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34009F8167
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2019 21:39:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727324AbfKKUjH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Nov 2019 15:39:07 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:59485 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727200AbfKKUir (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Nov 2019 15:38:47 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MjxW4-1i1ZUG11Vg-00kT9Q; Mon, 11 Nov 2019 21:38:40 +0100
From:   Arnd Bergmann <arnd@arndb.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org,
        y2038@lists.linaro.org, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v4 5/8] media: v4l2-core: fix VIDIOC_DQEVENT for time64 ABI
Date:   Mon, 11 Nov 2019 21:38:32 +0100
Message-Id: <20191111203835.2260382-6-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191111203835.2260382-1-arnd@arndb.de>
References: <20191111203835.2260382-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:KWZVyns7uI4Ejqxez8Csfv+bM9yXU7W10+mxfa7HGG2fSSNbpzK
 KAB96lZ+QKg9akmwi+kwjXhEs4E9X8cBiC7DgFzunGts3GCeoyQdNh3t+sranW2ySMormI+
 plD0HAD8Gn6+9mvQjsfpDNNuNXAhxdxEXHTmuyJxzQ5mdhj1Mb6Egk4YR/ufYDzDGKTl/iE
 cXMN0Kw8SAiDDDGDH+kjA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mqFzTn9t+2A=:RxrvlvdLiTsR/oPT09ho58
 UVc2t7maQM94eA3ZKx4mrjOAKQJIonQAjposr7cB+ur7nHasoYpEwzdk439G+/Hez9iw/omuF
 jX0agnTMD62cDfdJaP5lbU6GrL4qRno66TLgZIjpMeoX/Ud+w+MCfNOP/nZ1i8C8UEq1MSgx+
 9e3XXCthWXu1mjmBOhg1AYk5Uqik4U/IhP2n/y8d4Bf/EB3NP6Xp++LqbyIhDjUnWAHNthnxt
 LzsnfGH6Slfh3x4vuuZte0QzvjRLcSa1SIumSjUCctJwU5kajdAuOP/YFk3fKT2yNDpKwVWyt
 GW9SEWxvxjDJPHo0twVRQbgMjPLvO4rL+QX4xBRGJA97bJQcUA8HYYrYesf5UD4ARlyiADTC0
 NCs0e8YJfyny5aMykk3oRyGHpDK1Q9Pg9vcz/o8fJgKSLJGAG0i/zpc1NluikiDiA+7bDjFBq
 AC5fCGaXHZ69y4PS8WFCHaMPL0ECX9mERvjohW4F83PZpfttja7bMZTeIniHWS9Mrs1MwLsPD
 H+OgzIyw96hhbSy1ID/ch/R5fPK4PBXB6hx34eR2q+QLLn/RWdr2q1VzE/pCgSxxghhlGWEQW
 JR06VnblEESGrlzbKujqcqJt0HzumIe1XAkG9elj64VWGqzgNv34Dg83ez9jw6tZgQzZrIQh/
 KmIv1oQ9ir/X35OzYNUtLSnb28Bh5Bf0r5P0rqLSxNvzbP/TgHlN3YLvu8I4oD6qTKVe8i8pf
 +aCDwv+FQlYp/7z1IxecPICfPVTdkdzpjSishNJx+CxEERb55rIT/OWNsZlcg9hX+LLWvXVkc
 K+WiYdBIoiifHRvnEuGE4V/w6vo1VL3dSmShe+X+w0NGSOcDBZ515M9aN+HXk0Iq8JyRb8KRO
 u5NJp61aZqNk9N81Rx9A==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The v4l2_event structure contains a 'struct timespec' member that is
defined by the user space C library, creating an ABI incompatibility
when that gets updated to a 64-bit time_t.

While passing a 32-bit time_t here would be sufficient for CLOCK_MONOTONIC
timestamps, simply redefining the structure to use the kernel's
__kernel_old_timespec would not work for any library that uses a copy
of the linux/videodev2.h header file rather than including the copy from
the latest kernel headers.

This means the kernel has to be changed to handle both versions of the
structure layout on a 32-bit architecture. The easiest way to do this
is during the copy from/to user space.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/v4l2-core/v4l2-event.c  |  5 ++++-
 drivers/media/v4l2-core/v4l2-ioctl.c  | 24 ++++++++++++++++++++-
 drivers/media/v4l2-core/v4l2-subdev.c | 20 +++++++++++++++++-
 include/uapi/linux/videodev2.h        | 30 +++++++++++++++++++++++++++
 4 files changed, 76 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-event.c b/drivers/media/v4l2-core/v4l2-event.c
index 9d673d113d7a..290c6b213179 100644
--- a/drivers/media/v4l2-core/v4l2-event.c
+++ b/drivers/media/v4l2-core/v4l2-event.c
@@ -27,6 +27,7 @@ static unsigned sev_pos(const struct v4l2_subscribed_event *sev, unsigned idx)
 static int __v4l2_event_dequeue(struct v4l2_fh *fh, struct v4l2_event *event)
 {
 	struct v4l2_kevent *kev;
+	struct timespec64 ts;
 	unsigned long flags;
 
 	spin_lock_irqsave(&fh->vdev->fh_lock, flags);
@@ -44,7 +45,9 @@ static int __v4l2_event_dequeue(struct v4l2_fh *fh, struct v4l2_event *event)
 
 	kev->event.pending = fh->navailable;
 	*event = kev->event;
-	event->timestamp = ns_to_timespec(kev->ts);
+	ts = ns_to_timespec64(kev->ts);
+	event->timestamp.tv_sec = ts.tv_sec;
+	event->timestamp.tv_nsec = ts.tv_nsec;
 	kev->sev->first = sev_pos(kev->sev, 1);
 	kev->sev->in_use--;
 
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 693f9eb8e01b..1de939d11628 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -821,7 +821,7 @@ static void v4l_print_event(const void *arg, bool write_only)
 	const struct v4l2_event *p = arg;
 	const struct v4l2_event_ctrl *c;
 
-	pr_cont("type=0x%x, pending=%u, sequence=%u, id=%u, timestamp=%lu.%9.9lu\n",
+	pr_cont("type=0x%x, pending=%u, sequence=%u, id=%u, timestamp=%llu.%9.9llu\n",
 			p->type, p->pending, p->sequence, p->id,
 			p->timestamp.tv_sec, p->timestamp.tv_nsec);
 	switch (p->type) {
@@ -3010,6 +3010,13 @@ static int check_array_args(unsigned int cmd, void *parg, size_t *array_size,
 
 static unsigned int video_translate_cmd(unsigned int cmd)
 {
+	switch (cmd) {
+#ifdef CONFIG_COMPAT_32BIT_TIME
+	case VIDIOC_DQEVENT_TIME32:
+		return VIDIOC_DQEVENT;
+#endif
+	}
+
 	return cmd;
 }
 
@@ -3059,6 +3066,21 @@ static int video_put_user(void __user *arg, void *parg, unsigned int cmd)
 		return 0;
 
 	switch (cmd) {
+#ifdef CONFIG_COMPAT_32BIT_TIME
+	case VIDIOC_DQEVENT_TIME32: {
+		struct v4l2_event_time32 ev32;
+		struct v4l2_event *ev = parg;
+
+	        memcpy(&ev32, ev, offsetof(struct v4l2_event, timestamp));
+	        ev32.timestamp.tv_sec = ev->timestamp.tv_sec;
+	        ev32.timestamp.tv_nsec = ev->timestamp.tv_nsec;
+	        memcpy(&ev32.id, &ev->id, sizeof(*ev) - offsetof(struct v4l2_event, id));
+
+		if (copy_to_user(arg, &ev32, sizeof(ev32)))
+			return -EFAULT;
+		break;
+	}
+#endif
 	default:
 		/*  Copy results into user buffer  */
 		if (copy_to_user(arg, parg, _IOC_SIZE(cmd)))
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index f725cd9b66b9..45454a628e45 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -331,8 +331,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 	struct v4l2_fh *vfh = file->private_data;
 #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
 	struct v4l2_subdev_fh *subdev_fh = to_v4l2_subdev_fh(vfh);
-	int rval;
 #endif
+	int rval;
 
 	switch (cmd) {
 	case VIDIOC_QUERYCTRL:
@@ -392,6 +392,24 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 
 		return v4l2_event_dequeue(vfh, arg, file->f_flags & O_NONBLOCK);
 
+	case VIDIOC_DQEVENT_TIME32: {
+		struct v4l2_event_time32 *ev32 = arg;
+		struct v4l2_event ev;
+
+		if (!(sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS))
+			return -ENOIOCTLCMD;
+
+		rval = v4l2_event_dequeue(vfh, &ev, file->f_flags & O_NONBLOCK);
+
+		memcpy(ev32, &ev, offsetof(struct v4l2_event, timestamp));
+		ev32->timestamp.tv_sec = ev.timestamp.tv_sec;
+		ev32->timestamp.tv_nsec = ev.timestamp.tv_nsec;
+		memcpy(&ev32->id, &ev.id,
+		       sizeof(ev) - offsetof(struct v4l2_event, id));
+
+		return rval;
+	}
+
 	case VIDIOC_SUBSCRIBE_EVENT:
 		return v4l2_subdev_call(sd, core, subscribe_event, vfh, arg);
 
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 74d3d522f3db..1d2553d4ed5b 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -2329,11 +2329,40 @@ struct v4l2_event {
 	} u;
 	__u32				pending;
 	__u32				sequence;
+#ifdef __KERNEL__
+	struct __kernel_timespec	timestamp;
+#else
 	struct timespec			timestamp;
+#endif
 	__u32				id;
 	__u32				reserved[8];
 };
 
+#ifdef __KERNEL__
+/*
+ * The user space interpretation of the 'v4l2_event' differs
+ * based on the 'time_t' definition on 32-bit architectures, so
+ * the kernel has to handle both.
+ * This is the old version for 32-bit architectures.
+ */
+struct v4l2_event_time32 {
+	__u32				type;
+	union {
+		struct v4l2_event_vsync		vsync;
+		struct v4l2_event_ctrl		ctrl;
+		struct v4l2_event_frame_sync	frame_sync;
+		struct v4l2_event_src_change	src_change;
+		struct v4l2_event_motion_det	motion_det;
+		__u8				data[64];
+	} u;
+	__u32				pending;
+	__u32				sequence;
+	struct old_timespec32		timestamp;
+	__u32				id;
+	__u32				reserved[8];
+};
+#endif
+
 #define V4L2_EVENT_SUB_FL_SEND_INITIAL		(1 << 0)
 #define V4L2_EVENT_SUB_FL_ALLOW_FEEDBACK	(1 << 1)
 
@@ -2486,6 +2515,7 @@ struct v4l2_create_buffers {
 #define	VIDIOC_S_DV_TIMINGS	_IOWR('V', 87, struct v4l2_dv_timings)
 #define	VIDIOC_G_DV_TIMINGS	_IOWR('V', 88, struct v4l2_dv_timings)
 #define	VIDIOC_DQEVENT		 _IOR('V', 89, struct v4l2_event)
+#define	VIDIOC_DQEVENT_TIME32	 _IOR('V', 89, struct v4l2_event_time32)
 #define	VIDIOC_SUBSCRIBE_EVENT	 _IOW('V', 90, struct v4l2_event_subscription)
 #define	VIDIOC_UNSUBSCRIBE_EVENT _IOW('V', 91, struct v4l2_event_subscription)
 #define VIDIOC_CREATE_BUFS	_IOWR('V', 92, struct v4l2_create_buffers)
-- 
2.20.0

