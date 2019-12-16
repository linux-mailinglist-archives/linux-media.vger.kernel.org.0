Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C049F120854
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 15:16:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728198AbfLPOPi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 09:15:38 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:57047 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728077AbfLPOPX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 09:15:23 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MIxmm-1iQzEM3aBe-00KPMx; Mon, 16 Dec 2019 15:15:16 +0100
From:   Arnd Bergmann <arnd@arndb.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        y2038@lists.linaro.org, linux-kernel@vger.kernel.org, arnd@arndb.de
Subject: [PATCH v6 5/8] media: v4l2-core: fix VIDIOC_DQEVENT for time64 ABI
Date:   Mon, 16 Dec 2019 15:15:03 +0100
Message-Id: <20191216141506.121728-6-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191216141506.121728-1-arnd@arndb.de>
References: <20191216141506.121728-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:H5H1RmnXaEOuYWn+vsjSxxaTxYeVtdhHvtMBsOQPAVhibas8Uar
 yLC6PGWFKIqzGjk6x9Z02S+iX/5Q61nF44ZgSb8EMD6vk9wkXZ59zXWP6LnAIAj5+XisIIO
 yY7255T/9pcitGw+2En4WUw1Pc+P5TUQWJ0Da4eMlaMoPzBGHywC4SL2TrEk0HCox3DLZJ0
 nqaZ2y0SSa5mN02ugRwYQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cQFbZyBNSTs=:spZ1js6BwetzI8lokx6pMb
 x60WvzLkPuFk6oqzIUU4W06UyubKX8BoS70085Pik8ZfqhAn6oy5EdJr4x8mDA4vFL+DRJ9F8
 y4k2d78HzsDZBRmqNh+e1xXq4xibaVa9lsP5eeSJL9aFtdWn6jxSODv3tNQGKRiguqGCARE/O
 yjdXb26zE27Q5aT+OPPWqbxDbWRo6eOtaSBoqY2YW/1Vqw/A3vb5fGgMK8xB24zqfkDI9Our2
 cs2xLvDZUp79K/+JxC4d53/ZlPAf5cSL97lfkeWFgCcoUfeg8hP6So9J30/m7PGMLRTbZNw6/
 q7/sOX+JzfG6ei5YvZVPGjXQS8P4cI7ht/3Tw0RdCQuUbgE7QXc6y8s7f1DjLnS2lBlm/1IYr
 blZ0XjVZ4Kyqv81gAi2Gta0b9N3WTuRajrdjLwiYlEK74c1Z5ztISWZwVPTSd0L3npWxsWxIs
 PVsIHYJ93xdyHwhh65OuvigEHMfv5USnEWwH8Ytse/cH/lIx8WAa6qz31lflEOGh/BP5F1Xn0
 QEqfj6DQ98CssEje5Zy0ZgWVMwRLUiJypX7SW5LMBdhhuMrxfBVO630ANWF1XCrqTBNBVGzKM
 2BOi1B1A2iZLqKPF5RgnlEmmWj+dOIyjtlyUwBavFPDlhuYGu1hWrVOuKT33FDeVJnDUix4U/
 5Gxly7Yll3BDENiFBI8xPWhx3SCidoKxI6RP94NScLKDEdHs3va8g5pV9kHdzfTP/5HBgGhfs
 TqNnHBkQZY5ccC6/Zz5Nitl6oexSwEd64aKeeOg9qp7raMtNtSootj8+BhqFX2h0bdGwnIzAx
 pIBy997tsQqO4m7dlYTD1xvxdNBhuYIUJ6dSu5ohSLye9lfibUoQ6OIC1Sri8JYB2mt97yS7g
 vkx0nE7GoAA/wkicLnqg==
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
 drivers/media/v4l2-core/v4l2-ioctl.c  | 29 ++++++++++++++++++++++++++-
 drivers/media/v4l2-core/v4l2-subdev.c | 26 +++++++++++++++++++++++-
 include/media/v4l2-ioctl.h            | 25 +++++++++++++++++++++++
 include/uapi/linux/videodev2.h        |  4 ++++
 5 files changed, 86 insertions(+), 3 deletions(-)

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
index fe4678965e1b..b066e27e99a2 100644
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
@@ -3025,6 +3025,13 @@ static int check_array_args(unsigned int cmd, void *parg, size_t *array_size,
 
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
 
@@ -3074,6 +3081,26 @@ static int video_put_user(void __user *arg, void *parg, unsigned int cmd)
 		return 0;
 
 	switch (cmd) {
+#ifdef CONFIG_COMPAT_32BIT_TIME
+	case VIDIOC_DQEVENT_TIME32: {
+		struct v4l2_event *ev = parg;
+		struct v4l2_event_time32 ev32 = {
+			.type		= ev->type,
+			.pending	= ev->pending,
+			.sequence	= ev->sequence,
+			.timestamp.tv_sec  = ev->timestamp.tv_sec,
+			.timestamp.tv_nsec = ev->timestamp.tv_nsec,
+			.id		= ev->id,
+		};
+
+		memcpy(&ev32.u, &ev->u, sizeof(ev->u));
+		memcpy(&ev32.reserved, &ev->reserved, sizeof(ev->reserved));
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
index 9e987c0f840e..de926e311348 100644
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
@@ -392,6 +392,30 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 
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
+		*ev32 = (struct v4l2_event_time32) {
+			.type		= ev.type,
+			.pending	= ev.pending,
+			.sequence	= ev.sequence,
+			.timestamp.tv_sec  = ev.timestamp.tv_sec,
+			.timestamp.tv_nsec = ev.timestamp.tv_nsec,
+			.id		= ev.id,
+		};
+
+		memcpy(&ev32->u, &ev.u, sizeof(ev.u));
+		memcpy(&ev32->reserved, &ev.reserved, sizeof(ev.reserved));
+
+		return rval;
+	}
+
 	case VIDIOC_SUBSCRIBE_EVENT:
 		return v4l2_subdev_call(sd, core, subscribe_event, vfh, arg);
 
diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
index 4bba65a59d46..05c1ec93a911 100644
--- a/include/media/v4l2-ioctl.h
+++ b/include/media/v4l2-ioctl.h
@@ -724,4 +724,29 @@ long int video_usercopy(struct file *file, unsigned int cmd,
 long int video_ioctl2(struct file *file,
 		      unsigned int cmd, unsigned long int arg);
 
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
+
+#define	VIDIOC_DQEVENT_TIME32	 _IOR('V', 89, struct v4l2_event_time32)
+
 #endif /* _V4L2_IOCTL_H */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 6ef4a5b787a4..caf156d45842 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -2341,7 +2341,11 @@ struct v4l2_event {
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
-- 
2.20.0

