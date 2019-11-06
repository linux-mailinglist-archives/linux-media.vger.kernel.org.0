Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0A08F1F3B
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 20:49:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732087AbfKFTrn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 14:47:43 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:49881 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728725AbfKFTrn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Nov 2019 14:47:43 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MFbeC-1iiNih1jlm-00HBBW; Wed, 06 Nov 2019 20:47:29 +0100
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
Subject: [PATCH v3 7/8] media: v4l2-core: fix compat VIDIOC_DQEVENT for time64 ABI
Date:   Wed,  6 Nov 2019 20:47:14 +0100
Message-Id: <20191106194715.2238044-8-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191106194715.2238044-1-arnd@arndb.de>
References: <20191106194715.2238044-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qf8MvFpIAOKyu9qPsIzcqWc1FIBAR+EwQnWxqMS7s4sjndSLP9M
 JhdkZJSu/v8JyrjcjCMLogIrES4kA5sLj5Yo8MRnzjGfvAM9cddJJKwPlICjBorpRV+ZmvA
 UDh0wdT00NIpt7hTey7e43qQA/ouupbH/tGVrY2f7c+Z1ZzyMSeUZYw/xta+3AhQEqPGeN4
 OmzX+a0fMe+kChwLAmGkw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qUzYAIJVjqk=:Nf2OyloFW8J5+zPjfLzyZj
 61I3SyqXJtsMgH+6B48LF/5xpbpsQYgspADWjlO/kQ2KMKKRclw6HHfwHf3DRnPL7dbbI7kwO
 xR+80YAaLLkjUwhXg/VYj3li5Tq9p02BDka8j5npfcjr/Pyth6sSVtP/vBScDKnyXPOQUnRQE
 Kp0ZOAPzVJAq1Oy/S81PLszB2G8tFSNHcZ8sMK0YNlU3apIIzNbQrMxaIMv1PiwDRWZKzDWGr
 Cts2kckHbrirLFkMPrn9rzDMNvDIpvobMH7utL1A0+R3AaSpIMuI24PyvSeUlm/ZNXd5PsNzY
 598WB5ZEM1Gb0+ua4kyfzEh5q6anud8rpGfaK1fomD81v0q552kxdexLdUOcL0ZA/o8Ni4nUz
 dRlLa56Ob2z1AoZSXAJkCdTisfv4/gc+fCExZYVejw2hqBcWQeZTw3Lt1pFyhihmswIE5f7Sc
 Zy42wtHD1HCrCGw2E55C0VaBNUhcT/dsX7h4nu3cmhn0Y/fkOi3kpdST99TSUYJvHfK5O2Dtx
 k4qkDkpZh28vIqXVT6OYlN2tJn+yMVFhT2nKUm6NT5T0xUsf4vp9Zozsill79kqHf8TfoeR5c
 9TfQ3y7hKJJ309W4z/H9nQ916V6UVmmCvtrzitlI9lB9EzCcPxn1kHc0L2EFU3qdmbs5XzdDR
 Yv1aZ6+tYKBwDQ8C6sxCFThCa9qYSmEHu7rRCjjlXEFCh6snbJrRRzGq/QJVHlvnXQQOKklMQ
 mHWakzFHrh8rEfjQkQGjWJsgvMOLIuCVnC2ZeaB08FqyH4Thyn0B/F2l6HMze1WzbL8ZMyucj
 DeLAvJUgRitDvbNQiESqASD5BDwRR/lu/0TdsE+eaa3G85Dr/EuovzglkFafLS9oSgcOSCuuk
 IqKwmK3Hc74J5kMsqpmA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The native code supports the variant of struct v4l2_event for 64-bit
time_t, so add the compat version as well.

Here, a new incompatibility arises: while almost all 32-bit architectures
now use the same layout as 64-bit architectures and the commands can
simply be passed through, on x86 the internal alignment of v4l2_event
is different because of the 64-bit member in v4l2_event_ctrl.

To handle all architectures, this now requires defining four different
versions of the structure to cover all possible combinations. The compat
handling for VIDIOC_DQEVENT32 and VIDIOC_DQEVENT32_TIME32 is now inside
of an #ifdef so it does not get used on architectures other than x86.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 57 ++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
index 7ad6db8dd9f6..aa4bc63dc261 100644
--- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
+++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
@@ -1028,7 +1028,29 @@ static int put_v4l2_ext_controls32(struct file *file,
 	return 0;
 }
 
+#ifdef CONFIG_X86_64
+/*
+ * x86 is the only compat architecture with different struct alignment
+ * between 32-bit and 64-bit tasks.
+ *
+ * On all other architectures, v4l2_event32 and v4l2_event32_time32 are
+ * the same as v4l2_event and v4l2_event_time32, so we can use the native
+ * handlers, converting v4l2_event to v4l2_event_time32 if necessary.
+ */
 struct v4l2_event32 {
+	__u32				type;
+	union {
+		compat_s64		value64;
+		__u8			data[64];
+	} u;
+	__u32				pending;
+	__u32				sequence;
+	struct __kernel_timespec	timestamp;
+	__u32				id;
+	__u32				reserved[8];
+};
+
+struct v4l2_event32_time32 {
 	__u32				type;
 	union {
 		compat_s64		value64;
@@ -1057,6 +1079,23 @@ static int put_v4l2_event32(struct v4l2_event __user *p64,
 	return 0;
 }
 
+static int put_v4l2_event32_time32(struct v4l2_event_time32 __user *p64,
+				   struct v4l2_event32_time32 __user *p32)
+{
+	if (!access_ok(p32, sizeof(*p32)) ||
+	    assign_in_user(&p32->type, &p64->type) ||
+	    copy_in_user(&p32->u, &p64->u, sizeof(p64->u)) ||
+	    assign_in_user(&p32->pending, &p64->pending) ||
+	    assign_in_user(&p32->sequence, &p64->sequence) ||
+	    assign_in_user(&p32->timestamp.tv_sec, &p64->timestamp.tv_sec) ||
+	    assign_in_user(&p32->timestamp.tv_nsec, &p64->timestamp.tv_nsec) ||
+	    assign_in_user(&p32->id, &p64->id) ||
+	    copy_in_user(p32->reserved, p64->reserved, sizeof(p32->reserved)))
+		return -EFAULT;
+	return 0;
+}
+#endif
+
 struct v4l2_edid32 {
 	__u32 pad;
 	__u32 start_block;
@@ -1121,6 +1160,7 @@ static int put_v4l2_edid32(struct v4l2_edid __user *p64,
 #define VIDIOC_S_EXT_CTRLS32    _IOWR('V', 72, struct v4l2_ext_controls32)
 #define VIDIOC_TRY_EXT_CTRLS32  _IOWR('V', 73, struct v4l2_ext_controls32)
 #define	VIDIOC_DQEVENT32	_IOR ('V', 89, struct v4l2_event32)
+#define	VIDIOC_DQEVENT32_TIME32	_IOR ('V', 89, struct v4l2_event32_time32)
 #define VIDIOC_CREATE_BUFS32	_IOWR('V', 92, struct v4l2_create_buffers32)
 #define VIDIOC_PREPARE_BUF32	_IOWR('V', 93, struct v4l2_buffer32)
 
@@ -1202,7 +1242,10 @@ static long do_video_ioctl(struct file *file, unsigned int cmd, unsigned long ar
 	case VIDIOC_G_EXT_CTRLS32: ncmd = VIDIOC_G_EXT_CTRLS; break;
 	case VIDIOC_S_EXT_CTRLS32: ncmd = VIDIOC_S_EXT_CTRLS; break;
 	case VIDIOC_TRY_EXT_CTRLS32: ncmd = VIDIOC_TRY_EXT_CTRLS; break;
-	case VIDIOC_DQEVENT32: ncmd = VIDIOC_DQEVENT; break;
+#ifdef CONFIG_X86_64
+	case VIDIOC_DQEVENT32: cmd = VIDIOC_DQEVENT; break;
+	case VIDIOC_DQEVENT32_TIME32: cmd = VIDIOC_DQEVENT_TIME32; break;
+#endif
 	case VIDIOC_OVERLAY32: ncmd = VIDIOC_OVERLAY; break;
 	case VIDIOC_STREAMON32: ncmd = VIDIOC_STREAMON; break;
 	case VIDIOC_STREAMOFF32: ncmd = VIDIOC_STREAMOFF; break;
@@ -1336,10 +1379,16 @@ static long do_video_ioctl(struct file *file, unsigned int cmd, unsigned long ar
 		}
 		compatible_arg = 0;
 		break;
+#ifdef CONFIG_X86_64
 	case VIDIOC_DQEVENT32:
 		err = alloc_userspace(sizeof(struct v4l2_event), 0, &new_p64);
 		compatible_arg = 0;
 		break;
+	case VIDIOC_DQEVENT32_TIME32:
+		err = alloc_userspace(sizeof(struct v4l2_event_time32), 0, &new_p64);
+		compatible_arg = 0;
+		break;
+#endif
 	}
 	if (err)
 		return err;
@@ -1404,10 +1453,16 @@ static long do_video_ioctl(struct file *file, unsigned int cmd, unsigned long ar
 		err = put_v4l2_framebuffer32(new_p64, p32);
 		break;
 
+#ifdef CONFIG_X86_64
 	case VIDIOC_DQEVENT32:
 		err = put_v4l2_event32(new_p64, p32);
 		break;
 
+	case VIDIOC_DQEVENT32_TIME32:
+		err = put_v4l2_event32_time32(new_p64, p32);
+		break;
+#endif
+
 	case VIDIOC_G_EDID32:
 		err = put_v4l2_edid32(new_p64, p32);
 		break;
-- 
2.20.0

