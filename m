Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C235F1F40
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 20:49:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728263AbfKFTsJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 14:48:09 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:33363 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729036AbfKFTrn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Nov 2019 14:47:43 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MG9c2-1iivwy2y5c-00GcxA; Wed, 06 Nov 2019 20:47:28 +0100
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
Subject: [PATCH v3 5/8] media: v4l2-core: fix VIDIOC_DQEVENT for time64 ABI
Date:   Wed,  6 Nov 2019 20:47:12 +0100
Message-Id: <20191106194715.2238044-6-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191106194715.2238044-1-arnd@arndb.de>
References: <20191106194715.2238044-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:OtsoNIOiObwbn/wM1A3bLuSoKzPwIKJ6+XdchmxPBJonyoIKh5Y
 0iR+6eS9zZrh90AnDzxvF3TR5G+jSovPczaGG8/H3YdbOyXPxEvqXm5fH1wZL+KnQ1X9rIU
 8s2JdR5hOsieVChp2PbMMlFYXh4gKC80/85ss6vR7IBhbZk7u9tPikBc51yWB0yy/3xbuql
 4WG77levMWbgO4PiYcPLg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ddCe9lWZClk=:s/ArC9s92DlYvQ+Aw3NoM5
 9XLptxP2Vgfob7+xuRM0Jtp6vYzKmAl0Kdx3kGBCIRCBaOQiGUoLzxCkhUuMpCtC5GvLSCfSm
 zEWJfuEoJYkchHpaHEqlUWVM5f7nxVQMAE0ABecSeEROyrAIqEBUlTd0OO9XLBPjIprOmi8Bz
 gKqLxyxw/99FlxcU4miTxVbXC4QF+EHHxOGuLgoRrRqFIzyioAQJo0Hny51TkLeuQmmE+/+77
 xzmxfb+k4f4EnL2EQV7qrSGCyWrZuovg2DBt6SnLiBpZAW58zn6fxomnvIMDBnnPzp0LueQ/A
 pQrtdqq3pSBi72u/sZLzvZmuJJjdiJsAcCpecMs1IDaXWE3Q1rii83s3DjuhaEoRZH3uu82Ue
 E3T6SjWqlMJGBq9vbC2VcCHukeKpDQThaMiP5ybqiTjwrD2+BmtA6jYLwWy89K3iE7d/8gmmW
 685dGjxhIabPCljFqupw/rkOgf0fMBq0UsTHrw8tuFAR21i6/gDu7Sty3hprNwdux5MzA6lNf
 aMoO/zUTXDrDtvpWWXD/HEm74S5n+B4icmPvm9Kv063eP7sIscS1FvznjwiIiBQO4e24AT3GP
 Kb1MlCVZ018Bj0Gnta9Kz8vpAEWXnoFniF/JsQMrnylrqcocibFi5FSSGiVxtAYKqq1TJXMgy
 wRFck6PyhHgYm4TrzWalcsTGy46EIY5YS71Hc+i+S3Hgh9UijbTn/lHAnGwm04uWTVwS+eedr
 4Z06B1UD1n9rMh5nWOBwpwBl8OxsY05FTNiuoWoq9vaaL0i9bi+gu4Gu+Gh6oR5ykIqMy6VUm
 luYHdSOHIQaZtI0Z5Pg6GhQLdOgNelzdbhVpnA6chbkDeuWAXEtewsBNnB3WUYqHQXgp54nsy
 76hqEnWOXgSg+SZpQlhg==
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
 drivers/media/v4l2-core/v4l2-ioctl.c  | 22 ++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-subdev.c | 20 +++++++++++++++++-
 include/uapi/linux/videodev2.h        | 30 +++++++++++++++++++++++++++
 4 files changed, 75 insertions(+), 2 deletions(-)

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
index 50612b4749d3..b8aca0d174bd 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
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
 
@@ -3074,6 +3081,21 @@ static int video_put_user(void __user *arg, void *parg, unsigned int cmd)
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
index 9e987c0f840e..77b77807aaca 100644
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
index 5de1e37995c0..e38afa71a327 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -2340,11 +2340,40 @@ struct v4l2_event {
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
 
@@ -2497,6 +2526,7 @@ struct v4l2_create_buffers {
 #define	VIDIOC_S_DV_TIMINGS	_IOWR('V', 87, struct v4l2_dv_timings)
 #define	VIDIOC_G_DV_TIMINGS	_IOWR('V', 88, struct v4l2_dv_timings)
 #define	VIDIOC_DQEVENT		 _IOR('V', 89, struct v4l2_event)
+#define	VIDIOC_DQEVENT_TIME32	 _IOR('V', 89, struct v4l2_event_time32)
 #define	VIDIOC_SUBSCRIBE_EVENT	 _IOW('V', 90, struct v4l2_event_subscription)
 #define	VIDIOC_UNSUBSCRIBE_EVENT _IOW('V', 91, struct v4l2_event_subscription)
 #define VIDIOC_CREATE_BUFS	_IOWR('V', 92, struct v4l2_create_buffers)
-- 
2.20.0

