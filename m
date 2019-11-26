Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 435DC10A1CD
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 17:18:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728753AbfKZQSo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 11:18:44 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:41867 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728739AbfKZQSn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 11:18:43 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MVMNF-1iPzA41o6p-00SLUS; Tue, 26 Nov 2019 17:18:35 +0100
From:   Arnd Bergmann <arnd@arndb.de>
To:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     y2038@lists.linaro.org, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v5 7/8] media: v4l2-core: fix compat VIDIOC_DQEVENT for time64 ABI
Date:   Tue, 26 Nov 2019 17:18:23 +0100
Message-Id: <20191126161824.337724-8-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191126161824.337724-1-arnd@arndb.de>
References: <20191126161824.337724-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qkDInfKyka/nqbgHNepwaYQ0KDWIvFoJWlOVAt4iyAlq2n+FRmC
 3goPaARuNQpQYprSzLsXcU78Bqo3gcxjS4Iq7goI8U5UI1tMUPjmdX1clWUVcXL753XbkSY
 csi3EZbLwzIvX3Ewnqkc5gqN2swEPngz/8xUlCafiGm1ELmS8OAmdNf+c5sgMWD15jhTgpe
 QkOdDft5VnhyLoTLb/a6Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NYj2HxuPskE=:pM5Nhr0wV29QHPqIlb/6Qt
 ebRbzJcqUzPK+7sbk9wMJAIonh0Xyqx0fW6bWSLRGEAzyPlXZ7BY8hGLw7RiyIqpj2myltoof
 Y4sLxgnhmPGYD/q/y2O3mwji/922PegvbPJ6aUfREV3ZOy0ztFYVElf04C5QfgybUgm8ih0+I
 3TkgegXuPVw2w5L1mtxN2MkouRsCb1WJffLqigzQvlW4GMWc+9Bj4ha3jy9/beh8xqZj//Lk/
 bmlURffFuuSU7f9Hw0xExtQu4UNPhi3/uLWhvsd5pbWr0M/4snMQkI6V+do7iBz53Z5R0GyCD
 RCQM5AZc0F7yR6OTxkYznYaXSfl+ClpN8JU2zqPVqStjBDMAr5JIFRXFk+o5DAtRYIsN7GuWX
 +msswJSw0I8w7VmdDsSGS8KLbHkiWufvLfRXN50vIYC9t0EkJ9v7o3CNUx3Cd3QCocfEtq2d7
 9/Hbus6WgqhMCtc9le5ggdLjX8su1YMgKKU1nNaapD9DckmZJqzKuJqdielk9dW/vDGlWcm9q
 IPVthK+1LYE1O5kJMt03zFah8Wyo/Hi9dGyr89nXnj/6famNt8PU25hP5npj8zd+ME9rL7tEB
 gsyZFlmk8aNXMZvcQLM5p53ZoRvl7bmg5Ziwd5v/F09czDy23s/O0efhVYzdLb5x7/NlO/EJa
 059VlnJPm5trCRIjSTddBH/EfzjlRMJya1elBvbAZAGyKcejyQxkDudj5QE4vF2mU2Q2NlEzZ
 nDPuob0bQdlPjCRXXcaK/AL5HTQ992z0d+4dKpjmM4TpniSkgknnCt40IlsM749UfgNwVoN8T
 WnEq6Ya8oR7QXXkfnCRuPGqg/CepQegXlwoa802TPXQUKB+bVytLpE4zuWaXUoaaXEYSgfGyt
 RiznNV+cbpyMYSXQsAkw==
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
index 7ad6db8dd9f6..46cd84879c1f 100644
--- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
+++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
@@ -1028,6 +1028,15 @@ static int put_v4l2_ext_controls32(struct file *file,
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
 	__u32				type;
 	union {
@@ -1036,7 +1045,20 @@ struct v4l2_event32 {
 	} u;
 	__u32				pending;
 	__u32				sequence;
-	struct compat_timespec		timestamp;
+	struct __kernel_timespec	timestamp;
+	__u32				id;
+	__u32				reserved[8];
+};
+
+struct v4l2_event32_time32 {
+	__u32				type;
+	union {
+		compat_s64		value64;
+		__u8			data[64];
+	} u;
+	__u32				pending;
+	__u32				sequence;
+	struct old_timespec32		timestamp;
 	__u32				id;
 	__u32				reserved[8];
 };
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
+#ifdef CONFIG_X86_64
 	case VIDIOC_DQEVENT32: ncmd = VIDIOC_DQEVENT; break;
+	case VIDIOC_DQEVENT32_TIME32: ncmd = VIDIOC_DQEVENT_TIME32; break;
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

