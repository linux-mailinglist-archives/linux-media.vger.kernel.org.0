Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E8C826E0D0
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 18:34:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728550AbgIQQdz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 12:33:55 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:45273 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728562AbgIQQdZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 12:33:25 -0400
Received: from threadripper.lan ([149.172.98.151]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MY5s5-1k05nq0Z3t-00YOx6; Thu, 17 Sep 2020 17:28:27 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     linux-media@vger.kernel.org, mchehab@kernel.org, hverkuil@xs4all.nl
Cc:     hch@lst.de, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 7/8] media: v4l2: remaining compat handlers
Date:   Thu, 17 Sep 2020 17:28:22 +0200
Message-Id: <20200917152823.1241599-8-arnd@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200917152823.1241599-1-arnd@arndb.de>
References: <20200917152823.1241599-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:iGjEzENY5O6hel39eyTaVFST7gE+/tzBTAUdNx39Sq9PmWNiSwv
 Qm1uHC4HWHJpEWtTnGdMATN4JlGywJFA1iKLosOilTPscF5xSLjKzs+Yfy5BibukT8ZFe+G
 9DnQdPSP2W1zV+jKbnm/hyhTBF2l+rHjykVEKtPxyjW2dSq4i47vYGVD1GSv7PEXuDQ3KyF
 lm6Pdb0TvbcBAy6S/oE5w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WSf72vxBqAU=:lgLZ4IXCcB4gqir1IXY514
 LYLgc+qdopO151LBuYgRBtXCyWQMp+uGDCHqs2hg8RsWKO69BXrdyypBjD4uXX5b0ttX8E6ki
 psr9w7J9gZwT0Bec0OYBsxg6IzGJgOipXv4ierR3YqLFqlvfcX65t7rXbdroJ/yV3Mo/eYiGJ
 5HrAYZGrkOT/xLMayAF9Xq+M6rJH7wJYrrMniaNkWNT/89o5v+syvuNoRElVUn1W42yezt3RY
 JURWodjVXWktbyvSg2XFbpEyRGbqgGDxEPtPVIuczpvZ5SGx76ENQj1MrTYyRxjAxTdPEVJzN
 g1edW7zmZ9ue08ijwBJL2Y6uXlfgHgvFY2CFA0KpSA8069pbZRwNcO4NUcu3gGMMKGCR1adA7
 FVclujNUm2KPNX/0+X5ZZ0ndMKrQ56JbrOn7ZuWu/WpbLwUEeSZsy9VnnSs5u0fbua9fIdA9Q
 RxMAn50Lg9F2gDVVgBghfDadsttwgu+BylY8pqkV5y4bg9L5ddxYyfL0UAEEZXbENgcVmbDDd
 X/PCPYZC44PXp64fdDAb+gHKOoXMTYOYV0+IBOHVBOYiLRgrFcR0nXQPXx+aevYl7TmaWUErB
 ZHRVx/jjIgkMDMSgSwATzk1pSKMh0rtTBzBvsvNsg/pF1AZa3b8Em8o24BqCdIDm19be0qOkQ
 8FyCLttdBswbrikEKMfT2NlaqYKVpUbRnC2Tfg6CbHTurY+Zi1GBsn4UPQiGFvKnrRENA+j/5
 1AiPA2lQv8j+c4h9QuOclt1y0qaj3My1PD1BX9mS3Hs07lWbqbDuaJx5EX8g0WQKXiDhqFEVu
 4RvKtYW0cDu4YpJGHewE0gD3jGEohuTF0q8Z+iHaZ0oNyBhtG1xCRShgKwCCa5cPILwOuM/
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are eight remaining ioctl commands handled by copying
incompatible data structures in v4l2_compat_ioctl32(),
all of them fairly simple.

Change them to instead go through the native ioctl
infrastructure and only special-case the data copy.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 277 +++++++-----------
 1 file changed, 103 insertions(+), 174 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
index f0f3c9f9a0ef..1d0315d09f6a 100644
--- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
+++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
@@ -344,27 +344,23 @@ struct v4l2_standard32 {
 	__u32		     reserved[4];
 };
 
-static int get_v4l2_standard32(struct v4l2_standard __user *p64,
+static int get_v4l2_standard32(struct v4l2_standard *p64,
 			       struct v4l2_standard32 __user *p32)
 {
 	/* other fields are not set by the user, nor used by the driver */
-	if (!access_ok(p32, sizeof(*p32)) ||
-	    assign_in_user(&p64->index, &p32->index))
-		return -EFAULT;
-	return 0;
+	return get_user(p64->index, &p32->index);
 }
 
-static int put_v4l2_standard32(struct v4l2_standard __user *p64,
+static int put_v4l2_standard32(struct v4l2_standard *p64,
 			       struct v4l2_standard32 __user *p32)
 {
-	if (!access_ok(p32, sizeof(*p32)) ||
-	    assign_in_user(&p32->index, &p64->index) ||
-	    assign_in_user(&p32->id, &p64->id) ||
-	    copy_in_user(p32->name, p64->name, sizeof(p32->name)) ||
-	    copy_in_user(&p32->frameperiod, &p64->frameperiod,
+	if (put_user(p64->index, &p32->index) ||
+	    put_user(p64->index, &p32->id) ||
+	    copy_to_user(p32->name, p64->name, sizeof(p32->name)) ||
+	    copy_to_user(&p32->frameperiod, &p64->frameperiod,
 			 sizeof(p32->frameperiod)) ||
-	    assign_in_user(&p32->framelines, &p64->framelines) ||
-	    copy_in_user(p32->reserved, p64->reserved, sizeof(p32->reserved)))
+	    put_user(p64->framelines, &p32->framelines) ||
+	    copy_to_user(p32->reserved, p64->reserved, sizeof(p32->reserved)))
 		return -EFAULT;
 	return 0;
 }
@@ -702,33 +698,30 @@ struct v4l2_framebuffer32 {
 	} fmt;
 };
 
-static int get_v4l2_framebuffer32(struct v4l2_framebuffer __user *p64,
+static int get_v4l2_framebuffer32(struct v4l2_framebuffer *p64,
 				  struct v4l2_framebuffer32 __user *p32)
 {
 	compat_caddr_t tmp;
 
-	if (!access_ok(p32, sizeof(*p32)) ||
-	    get_user(tmp, &p32->base) ||
-	    put_user_force(compat_ptr(tmp), &p64->base) ||
-	    assign_in_user(&p64->capability, &p32->capability) ||
-	    assign_in_user(&p64->flags, &p32->flags) ||
-	    copy_in_user(&p64->fmt, &p32->fmt, sizeof(p64->fmt)))
+	if (get_user(tmp, &p32->base) ||
+	    get_user(p64->capability, &p32->capability) ||
+	    get_user(p64->flags, &p32->flags) ||
+	    copy_from_user(&p64->fmt, &p32->fmt, sizeof(p64->fmt)))
 		return -EFAULT;
+	p64->base = (void __force *)compat_ptr(tmp);
+
 	return 0;
 }
 
-static int put_v4l2_framebuffer32(struct v4l2_framebuffer __user *p64,
+static int put_v4l2_framebuffer32(struct v4l2_framebuffer *p64,
 				  struct v4l2_framebuffer32 __user *p32)
 {
-	void *base;
-
-	if (!access_ok(p32, sizeof(*p32)) ||
-	    get_user(base, &p64->base) ||
-	    put_user(ptr_to_compat((void __user *)base), &p32->base) ||
-	    assign_in_user(&p32->capability, &p64->capability) ||
-	    assign_in_user(&p32->flags, &p64->flags) ||
-	    copy_in_user(&p32->fmt, &p64->fmt, sizeof(p64->fmt)))
+	if (put_user((uintptr_t)p64->base, &p32->base) ||
+	    put_user(p64->capability, &p32->capability) ||
+	    put_user(p64->flags, &p32->flags) ||
+	    copy_to_user(&p32->fmt, &p64->fmt, sizeof(p64->fmt)))
 		return -EFAULT;
+
 	return 0;
 }
 
@@ -748,18 +741,18 @@ struct v4l2_input32 {
  * The 64-bit v4l2_input struct has extra padding at the end of the struct.
  * Otherwise it is identical to the 32-bit version.
  */
-static inline int get_v4l2_input32(struct v4l2_input __user *p64,
+static inline int get_v4l2_input32(struct v4l2_input *p64,
 				   struct v4l2_input32 __user *p32)
 {
-	if (copy_in_user(p64, p32, sizeof(*p32)))
+	if (copy_from_user(p64, p32, sizeof(*p32)))
 		return -EFAULT;
 	return 0;
 }
 
-static inline int put_v4l2_input32(struct v4l2_input __user *p64,
+static inline int put_v4l2_input32(struct v4l2_input *p64,
 				   struct v4l2_input32 __user *p32)
 {
-	if (copy_in_user(p32, p64, sizeof(*p32)))
+	if (copy_to_user(p32, p64, sizeof(*p32)))
 		return -EFAULT;
 	return 0;
 }
@@ -893,34 +886,32 @@ struct v4l2_event32_time32 {
 	__u32				reserved[8];
 };
 
-static int put_v4l2_event32(struct v4l2_event __user *p64,
+static int put_v4l2_event32(struct v4l2_event *p64,
 			    struct v4l2_event32 __user *p32)
 {
-	if (!access_ok(p32, sizeof(*p32)) ||
-	    assign_in_user(&p32->type, &p64->type) ||
-	    copy_in_user(&p32->u, &p64->u, sizeof(p64->u)) ||
-	    assign_in_user(&p32->pending, &p64->pending) ||
-	    assign_in_user(&p32->sequence, &p64->sequence) ||
-	    assign_in_user(&p32->timestamp.tv_sec, &p64->timestamp.tv_sec) ||
-	    assign_in_user(&p32->timestamp.tv_nsec, &p64->timestamp.tv_nsec) ||
-	    assign_in_user(&p32->id, &p64->id) ||
-	    copy_in_user(p32->reserved, p64->reserved, sizeof(p32->reserved)))
+	if (put_user(p64->type, &p32->type) ||
+	    copy_to_user(&p32->u, &p64->u, sizeof(p64->u)) ||
+	    put_user(p64->pending, &p32->pending) ||
+	    put_user(p64->sequence, &p32->sequence) ||
+	    put_user(p64->timestamp.tv_sec, &p32->timestamp.tv_sec) ||
+	    put_user(p64->timestamp.tv_nsec, &p32->timestamp.tv_nsec) ||
+	    put_user(p64->id, &p32->id) ||
+	    copy_to_user(p32->reserved, p64->reserved, sizeof(p32->reserved)))
 		return -EFAULT;
 	return 0;
 }
 
-static int put_v4l2_event32_time32(struct v4l2_event_time32 __user *p64,
+static int put_v4l2_event32_time32(struct v4l2_event *p64,
 				   struct v4l2_event32_time32 __user *p32)
 {
-	if (!access_ok(p32, sizeof(*p32)) ||
-	    assign_in_user(&p32->type, &p64->type) ||
-	    copy_in_user(&p32->u, &p64->u, sizeof(p64->u)) ||
-	    assign_in_user(&p32->pending, &p64->pending) ||
-	    assign_in_user(&p32->sequence, &p64->sequence) ||
-	    assign_in_user(&p32->timestamp.tv_sec, &p64->timestamp.tv_sec) ||
-	    assign_in_user(&p32->timestamp.tv_nsec, &p64->timestamp.tv_nsec) ||
-	    assign_in_user(&p32->id, &p64->id) ||
-	    copy_in_user(p32->reserved, p64->reserved, sizeof(p32->reserved)))
+	if (put_user(p64->type, &p32->type) ||
+	    copy_to_user(&p32->u, &p64->u, sizeof(p64->u)) ||
+	    put_user(p64->pending, &p32->pending) ||
+	    put_user(p64->sequence, &p32->sequence) ||
+	    put_user(p64->timestamp.tv_sec, &p32->timestamp.tv_sec) ||
+	    put_user(p64->timestamp.tv_nsec, &p32->timestamp.tv_nsec) ||
+	    put_user(p64->id, &p32->id) ||
+	    copy_to_user(p32->reserved, p64->reserved, sizeof(p32->reserved)))
 		return -EFAULT;
 	return 0;
 }
@@ -934,34 +925,23 @@ struct v4l2_edid32 {
 	compat_caddr_t edid;
 };
 
-static int get_v4l2_edid32(struct v4l2_edid __user *p64,
+static int get_v4l2_edid32(struct v4l2_edid *p64,
 			   struct v4l2_edid32 __user *p32)
 {
-	compat_uptr_t tmp;
-
-	if (!access_ok(p32, sizeof(*p32)) ||
-	    assign_in_user(&p64->pad, &p32->pad) ||
-	    assign_in_user(&p64->start_block, &p32->start_block) ||
-	    assign_in_user_cast(&p64->blocks, &p32->blocks) ||
-	    get_user(tmp, &p32->edid) ||
-	    put_user_force(compat_ptr(tmp), &p64->edid) ||
-	    copy_in_user(p64->reserved, p32->reserved, sizeof(p64->reserved)))
+	compat_uptr_t edid;
+
+	if (copy_from_user(p64, p32, offsetof(struct v4l2_edid32, edid)) ||
+	    get_user(edid, &p32->edid))
 		return -EFAULT;
+
+	p64->edid = (void __force *)compat_ptr(edid);
 	return 0;
 }
 
-static int put_v4l2_edid32(struct v4l2_edid __user *p64,
+static int put_v4l2_edid32(struct v4l2_edid *p64,
 			   struct v4l2_edid32 __user *p32)
 {
-	void *edid;
-
-	if (!access_ok(p32, sizeof(*p32)) ||
-	    assign_in_user(&p32->pad, &p64->pad) ||
-	    assign_in_user(&p32->start_block, &p64->start_block) ||
-	    assign_in_user(&p32->blocks, &p64->blocks) ||
-	    get_user(edid, &p64->edid) ||
-	    put_user(ptr_to_compat((void __user *)edid), &p32->edid) ||
-	    copy_in_user(p32->reserved, p64->reserved, sizeof(p32->reserved)))
+	if (copy_to_user(p32, p64, offsetof(struct v4l2_edid32, edid)))
 		return -EFAULT;
 	return 0;
 }
@@ -1007,6 +987,10 @@ unsigned int v4l2_compat_translate_cmd(unsigned int cmd)
 		return VIDIOC_S_FMT;
 	case VIDIOC_TRY_FMT32:
 		return VIDIOC_TRY_FMT;
+	case VIDIOC_G_FBUF32:
+		return VIDIOC_G_FBUF;
+	case VIDIOC_S_FBUF32:
+		return VIDIOC_S_FBUF;
 #ifdef CONFIG_COMPAT_32BIT_TIME
 	case VIDIOC_QUERYBUF32_TIME32:
 		return VIDIOC_QUERYBUF;
@@ -1031,6 +1015,20 @@ unsigned int v4l2_compat_translate_cmd(unsigned int cmd)
 		return VIDIOC_TRY_EXT_CTRLS;
 	case VIDIOC_PREPARE_BUF32:
 		return VIDIOC_PREPARE_BUF;
+	case VIDIOC_ENUMSTD32:
+		return VIDIOC_ENUMSTD;
+	case VIDIOC_ENUMINPUT32:
+		return VIDIOC_ENUMINPUT;
+	case VIDIOC_G_EDID32:
+		return VIDIOC_G_EDID;
+	case VIDIOC_S_EDID32:
+		return VIDIOC_S_EDID;
+#ifdef CONFIG_X86_64
+	case VIDIOC_DQEVENT32:
+		return VIDIOC_DQEVENT;
+	case VIDIOC_DQEVENT32_TIME32:
+		return VIDIOC_DQEVENT_TIME32;
+#endif
 	}
 	return cmd;
 }
@@ -1042,6 +1040,9 @@ int v4l2_compat_get_user(void __user *arg, void *parg, unsigned int cmd)
 	case VIDIOC_S_FMT32:
 	case VIDIOC_TRY_FMT32:
 		return get_v4l2_format32(parg, arg);
+
+	case VIDIOC_S_FBUF32:
+		return get_v4l2_framebuffer32(parg, arg);
 #ifdef CONFIG_COMPAT_32BIT_TIME
 	case VIDIOC_QUERYBUF32_TIME32:
 	case VIDIOC_QBUF32_TIME32:
@@ -1064,6 +1065,16 @@ int v4l2_compat_get_user(void __user *arg, void *parg, unsigned int cmd)
 
 	case VIDIOC_CREATE_BUFS32:
 		return get_v4l2_create32(parg, arg);
+
+	case VIDIOC_ENUMSTD32:
+		return get_v4l2_standard32(parg, arg);
+
+	case VIDIOC_ENUMINPUT32:
+		return get_v4l2_input32(parg, arg);
+
+	case VIDIOC_G_EDID32:
+	case VIDIOC_S_EDID32:
+		return get_v4l2_edid32(parg, arg);
 	}
 	return 0;
 }
@@ -1075,6 +1086,9 @@ int v4l2_compat_put_user(void __user *arg, void *parg, unsigned int cmd)
 	case VIDIOC_S_FMT32:
 	case VIDIOC_TRY_FMT32:
 		return put_v4l2_format32(parg, arg);
+
+	case VIDIOC_G_FBUF32:
+		return put_v4l2_framebuffer32(parg, arg);
 #ifdef CONFIG_COMPAT_32BIT_TIME
 	case VIDIOC_QUERYBUF32_TIME32:
 	case VIDIOC_QBUF32_TIME32:
@@ -1095,6 +1109,22 @@ int v4l2_compat_put_user(void __user *arg, void *parg, unsigned int cmd)
 
 	case VIDIOC_CREATE_BUFS32:
 		return put_v4l2_create32(parg, arg);
+
+	case VIDIOC_ENUMSTD32:
+		return put_v4l2_standard32(parg, arg);
+
+	case VIDIOC_ENUMINPUT32:
+		return put_v4l2_input32(parg, arg);
+
+	case VIDIOC_G_EDID32:
+	case VIDIOC_S_EDID32:
+		return put_v4l2_edid32(parg, arg);
+#ifdef CONFIG_X86_64
+	case VIDIOC_DQEVENT32:
+		return put_v4l2_event32(parg, arg);
+	case VIDIOC_DQEVENT32_TIME32:
+		return put_v4l2_event32_time32(parg, arg);
+#endif
 	}
 	return 0;
 }
@@ -1338,16 +1368,6 @@ static long do_video_ioctl(struct file *file, unsigned int cmd, unsigned long ar
 	 * 1. When struct size is different, converts the command.
 	 */
 	switch (cmd) {
-	case VIDIOC_G_FBUF32: ncmd = VIDIOC_G_FBUF; break;
-	case VIDIOC_S_FBUF32: ncmd = VIDIOC_S_FBUF; break;
-	case VIDIOC_ENUMSTD32: ncmd = VIDIOC_ENUMSTD; break;
-	case VIDIOC_ENUMINPUT32: ncmd = VIDIOC_ENUMINPUT; break;
-#ifdef CONFIG_X86_64
-	case VIDIOC_DQEVENT32: ncmd = VIDIOC_DQEVENT; break;
-	case VIDIOC_DQEVENT32_TIME32: ncmd = VIDIOC_DQEVENT_TIME32; break;
-#endif
-	case VIDIOC_G_EDID32: ncmd = VIDIOC_G_EDID; break;
-	case VIDIOC_S_EDID32: ncmd = VIDIOC_S_EDID; break;
 	default: ncmd = cmd; break;
 	}
 
@@ -1357,53 +1377,6 @@ static long do_video_ioctl(struct file *file, unsigned int cmd, unsigned long ar
 	 * argument into it.
 	 */
 	switch (cmd) {
-	case VIDIOC_G_EDID32:
-	case VIDIOC_S_EDID32:
-		err = alloc_userspace(sizeof(struct v4l2_edid), 0, &new_p64);
-		if (!err)
-			err = get_v4l2_edid32(new_p64, p32);
-		compatible_arg = 0;
-		break;
-
-	case VIDIOC_S_FBUF32:
-		err = alloc_userspace(sizeof(struct v4l2_framebuffer), 0,
-				      &new_p64);
-		if (!err)
-			err = get_v4l2_framebuffer32(new_p64, p32);
-		compatible_arg = 0;
-		break;
-
-	case VIDIOC_G_FBUF32:
-		err = alloc_userspace(sizeof(struct v4l2_framebuffer), 0,
-				      &new_p64);
-		compatible_arg = 0;
-		break;
-
-	case VIDIOC_ENUMSTD32:
-		err = alloc_userspace(sizeof(struct v4l2_standard), 0,
-				      &new_p64);
-		if (!err)
-			err = get_v4l2_standard32(new_p64, p32);
-		compatible_arg = 0;
-		break;
-
-	case VIDIOC_ENUMINPUT32:
-		err = alloc_userspace(sizeof(struct v4l2_input), 0, &new_p64);
-		if (!err)
-			err = get_v4l2_input32(new_p64, p32);
-		compatible_arg = 0;
-		break;
-
-#ifdef CONFIG_X86_64
-	case VIDIOC_DQEVENT32:
-		err = alloc_userspace(sizeof(struct v4l2_event), 0, &new_p64);
-		compatible_arg = 0;
-		break;
-	case VIDIOC_DQEVENT32_TIME32:
-		err = alloc_userspace(sizeof(struct v4l2_event_time32), 0, &new_p64);
-		compatible_arg = 0;
-		break;
-#endif
 	}
 	if (err)
 		return err;
@@ -1425,55 +1398,11 @@ static long do_video_ioctl(struct file *file, unsigned int cmd, unsigned long ar
 	if (err == -ENOTTY)
 		return err;
 
-	/*
-	 * 4. Special case: even after an error we need to put the
-	 * results back for some ioctls.
-	 *
-	 * In the case of EXT_CTRLS, the error_idx will contain information
-	 * on which control failed.
-	 *
-	 * In the case of S_EDID, the driver can return E2BIG and set
-	 * the blocks to maximum allowed value.
-	 */
-	switch (cmd) {
-	case VIDIOC_S_EDID32:
-		if (put_v4l2_edid32(new_p64, p32))
-			err = -EFAULT;
-		break;
-	}
-	if (err)
-		return err;
-
 	/*
 	 * 5. Copy the data returned at the 64 bits userspace pointer to
 	 * the original 32 bits structure.
 	 */
 	switch (cmd) {
-	case VIDIOC_G_FBUF32:
-		err = put_v4l2_framebuffer32(new_p64, p32);
-		break;
-
-#ifdef CONFIG_X86_64
-	case VIDIOC_DQEVENT32:
-		err = put_v4l2_event32(new_p64, p32);
-		break;
-
-	case VIDIOC_DQEVENT32_TIME32:
-		err = put_v4l2_event32_time32(new_p64, p32);
-		break;
-#endif
-
-	case VIDIOC_G_EDID32:
-		err = put_v4l2_edid32(new_p64, p32);
-		break;
-
-	case VIDIOC_ENUMSTD32:
-		err = put_v4l2_standard32(new_p64, p32);
-		break;
-
-	case VIDIOC_ENUMINPUT32:
-		err = put_v4l2_input32(new_p64, p32);
-		break;
 	}
 	return err;
 }
-- 
2.27.0

