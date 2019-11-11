Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78005F8163
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2019 21:39:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727722AbfKKUiw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Nov 2019 15:38:52 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:52845 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727718AbfKKUiv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Nov 2019 15:38:51 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MG90u-1igQ4y2wgu-00Gc36; Mon, 11 Nov 2019 21:38:40 +0100
From:   Arnd Bergmann <arnd@arndb.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org,
        y2038@lists.linaro.org, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v4 7/8] media: v4l2-core: fix compat VIDIOC_DQEVENT for time64 ABI
Date:   Mon, 11 Nov 2019 21:38:34 +0100
Message-Id: <20191111203835.2260382-8-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191111203835.2260382-1-arnd@arndb.de>
References: <20191111203835.2260382-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:dKK7xsILnKx0fQ4qyv2gvUd49B8SRdhukArWLoHaYtCAGNHYgF4
 7s2f/9aw5odplOHsmuwHTniyBsDUEulNbO7hbiWtiNh7P4sDbRUAvSK1MJw/ddnM0uXfzdE
 Esf4w9zJzAn+9NaUiJ5kE6U2ipuGgPzEHxR0pUMfgw/wo8eLtTMhKSgz6X/ZCIshXHLfeRi
 K23lQR5zzBRA5AZf87eIQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oXaK/44Wfxs=:2IWGOHBaSUHKHIxzZPkEUO
 Ypqrr6U8XRGBh7hsE5uPxQWvmndZe7kpWbk0rGfV14yrt1uqUqutabklUGBIBgCiZN8SLw9hv
 zv8asQmuADofatvSZ6WhDaUbWwc1a/+6Fd7ZoCTtT8YIgOQxQ2Qz0fyG3lLSHHCTIH4nOlqD3
 YT29y+DLmoDatDI5+CEyouJjLhh92htLYetqr2hO/FE4pmUUyaYl4vxTTyCUr+Tu5Yyx86Aej
 9GL8yIcobCn7dK++HXBV35DnQiM55gh7kGMGW2r49hvx0P7T3LFIfZrTl58hznPuM65OO7ckL
 J7rGGlxeWM1zNHOcUUlVEgyxycisfn++enkCB4QXTdvGGUppNF2PJlubi9e1VLw8kI2LydxOV
 KBUr/AXGi1zTWmWQKdmpQeUEpnBVxfAkhgxxiaIm9pfpcuyYMOz33EQPyx0mmLPglMtOmXgxZ
 2rxHMSLu3QOeWwPiQJBmE5zWHRkiI1PjvKn/F1sOdfN/NHzZMUuqMA8oDQmPkoqYjpWJ+RuTp
 qFispWjzbysJO+fxm9i/ydPk2IOmq/G2hOLJ0N2/z7KWqShVZaMEsAVvAVanrLPZfH5932lMH
 ETs0h5R0F4fuDLGmiahR8xD0PXebzrTm5eo8RvdcAAqMipco2FzUaPp7wdzB0ZeoE75pyCg+/
 ri66KVQjbvZORpFETsh5IFBNx3rZ07/d2lVEMKyMy8VxyeZN2EF8KohoHDMMRB2JbEQaOLCuc
 gnESR34GhdZknorp4imLOj1+15ck2FEhPpbFfnIUnruJJ0FD/ABUpp0EVZVB+HCXcHCXirvD7
 1MmEVYIMuX1TuCFQ3qXMkSrBIhVw3QD+gTDq9EHXU4uCWihBmVCKw/JSa5MCVYYu+C6AtYql9
 Bps4ue7HbnstxAzLdCtA==
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

