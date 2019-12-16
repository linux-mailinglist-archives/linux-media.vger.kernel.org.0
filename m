Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76DA412084F
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 15:16:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728154AbfLPOP0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 09:15:26 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:59529 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727807AbfLPOPZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 09:15:25 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.145]) with ESMTPA (Nemesis) id
 1M894P-1ibcDm1OFP-005KOI; Mon, 16 Dec 2019 15:15:17 +0100
From:   Arnd Bergmann <arnd@arndb.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        y2038@lists.linaro.org, linux-kernel@vger.kernel.org, arnd@arndb.de
Subject: [PATCH v6 7/8] media: v4l2-core: fix compat VIDIOC_DQEVENT for time64 ABI
Date:   Mon, 16 Dec 2019 15:15:05 +0100
Message-Id: <20191216141506.121728-8-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191216141506.121728-1-arnd@arndb.de>
References: <20191216141506.121728-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6/Fv6ggGFhH/R+vNLGnpTlSqPnd/sm8+U+BgV4J+uwpVhtjl9n0
 XfDPsYEZywmDNVNvIe8jRn9OvbCXS+XlLFPO4eyExB/kSCLIzMPyTS1IhB49pJ2FVE6zMKK
 OWkmW+RraCPwVW9eg8ImQzQdjcCm1lQqhCJejrN0qIwVk7X90shGY16z8Sk/LBLGwcl/bvW
 LyntoNzuPHC2iYYV9sqlw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MhiY5j4G9c0=:8EARmMqyLNGkR0MUZlXQY+
 Q9ugx9FU/93OE1JdiY3QgAnjxt1ukceF6ZxcRVeQfGX2SrXYq+P57DrDzJLFWMe5psVDhzlaq
 D5PrgN91kn9wdu5xhMA77LYUz2jxV3QbvV14Bfk+0dSRIKMgCrZ6shLtfUcg7CJqtZJNldxCX
 LH4W6yqFzfCTy5Nd7Mb9fHAUClqgURLzcp/iG39sPU3wofjeN6i81bFqrS5/jgJowRXB8khZh
 9cGBqDpm2tpeM3v6FTH4XimZhKePoshpY2bmbPNnVcsVfLhZxZfrN5kUNtFx5HxWcc6oreens
 6kXFdQDISYYCEdti9DQ84EKwaiVrZM4MqkFH/pxYiwIaYBHXXT3rUYbsKqufInMUA4OlEaYWO
 t411DLaiy1n+6syaZiwyaQ9HWVCeCbNfmZZNHLyB9kv2Fi5weYqIaJl5sCXgk5dNFH28uZJf/
 DXYqrBwn35cQ4lrm+VJVYSP3HItgVBICKBdf1PkcUFnK/Sd0iQ4Op+NKb3SgLVr4bVc13CDVW
 36v5ZBaPHdwlgVZepkCzDNMOMZNlqIPu+xGyqEzZyrzeRIRedRUDiOsja+28i3AM6YdAsH+co
 n7eD/cLhMihCtJyAAf4J+eEyrUIQweNi4r/gbrVyaZ/Dx6ayODf53bWaNny1YjP3Gx0zWGm2A
 +zr8F6n9YRCA0pmimy3raSEk2uSzcCRwHlc0wojOER63S5TIeNL8CMxnIo4dC9Ov0c2w74TTn
 +BAu3MHKjWYXZ2/pLnUxAywCU7iVZCeBMGf3klAw3MDPBZmpWZro/Rv4EngLspK034mCk1jdR
 zQdVj9oV3c1o9YqQPYv5xf8avlrM3jj+Fc97ilTu53k0Ik73cdGBW7lRw3gzGgRcxYKCXJRPV
 wLJcc3yTwg/mDjy4ZpsA==
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
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 60 ++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
index 7ad6db8dd9f6..f8a4b0ddd47d 100644
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
@@ -1036,7 +1045,23 @@ struct v4l2_event32 {
 	} u;
 	__u32				pending;
 	__u32				sequence;
-	struct compat_timespec		timestamp;
+	struct {
+		compat_s64		tv_sec;
+		compat_s64		tv_nsec;
+	} timestamp;
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
@@ -1057,6 +1082,23 @@ static int put_v4l2_event32(struct v4l2_event __user *p64,
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
@@ -1121,6 +1163,7 @@ static int put_v4l2_edid32(struct v4l2_edid __user *p64,
 #define VIDIOC_S_EXT_CTRLS32    _IOWR('V', 72, struct v4l2_ext_controls32)
 #define VIDIOC_TRY_EXT_CTRLS32  _IOWR('V', 73, struct v4l2_ext_controls32)
 #define	VIDIOC_DQEVENT32	_IOR ('V', 89, struct v4l2_event32)
+#define	VIDIOC_DQEVENT32_TIME32	_IOR ('V', 89, struct v4l2_event32_time32)
 #define VIDIOC_CREATE_BUFS32	_IOWR('V', 92, struct v4l2_create_buffers32)
 #define VIDIOC_PREPARE_BUF32	_IOWR('V', 93, struct v4l2_buffer32)
 
@@ -1202,7 +1245,10 @@ static long do_video_ioctl(struct file *file, unsigned int cmd, unsigned long ar
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
@@ -1336,10 +1382,16 @@ static long do_video_ioctl(struct file *file, unsigned int cmd, unsigned long ar
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
@@ -1404,10 +1456,16 @@ static long do_video_ioctl(struct file *file, unsigned int cmd, unsigned long ar
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

