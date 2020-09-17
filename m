Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43DFC26E473
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 20:49:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726388AbgIQStc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 14:49:32 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:53129 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728497AbgIQQdG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 12:33:06 -0400
Received: from threadripper.lan ([149.172.98.151]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MYvse-1jx3Os3oiO-00UozF; Thu, 17 Sep 2020 17:28:26 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     linux-media@vger.kernel.org, mchehab@kernel.org, hverkuil@xs4all.nl
Cc:     hch@lst.de, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 6/8] media: v4l2: convert v4l2_format compat ioctls
Date:   Thu, 17 Sep 2020 17:28:21 +0200
Message-Id: <20200917152823.1241599-7-arnd@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200917152823.1241599-1-arnd@arndb.de>
References: <20200917152823.1241599-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:3uo0iCWQ2x7fhkiTWo1iuiTXrf+RA3n/nuQPsm2jTZxoXfdGUOd
 XvPoMbqfm9kYR//NgckHVRBOBGlegx0xwsUHXNwYRf1m4UDflXGhPB4Bu8tAkuiEdneygxn
 yPEFu4S+Ue0CxVHsGgoVsj8ysEPvRX/KQCzKtv5GnQ6XwpHmuU7SprXRQz/cuH6jiK7gB2r
 wf6+wIFtYe0uCJc6MDguA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QlWg2nKb6Lk=:7zsFDBRmINanzNJSiYLvHh
 ONHxMU4FembGnxydgFH4LkP1dnl0Pbaosaa+xIAprg/uP7QWQKlIOXLONNLTzBNHoc5/zvC0W
 PhIQoDxUq4/9A55LvUY0Q2RfGOB41w77eIDZdZ+pFhWN0TlBaDfgh8dwBeMQoriXgXV0B5HBw
 0KA1GCoUc0ScxU58sS1p3xhQSs3mksgBaI3zdlmjQgRQcJtM0t1hBuO7jwH88rnTsXM8Pk0+f
 cjTABXwhejZDIjfJu4yUrZNs45mPLm5yaNNYSVebayx1vFCJi192/odfyaAcPj1L6yAWlxvKb
 oqZMQYZv6h8a7xiu45TBXF8xK96Zh+H5e/qV3UMkgXCkYRO/0xdWyW71mUzDWx0kJ1aSMZLuj
 MMEpoN95mOH7sG2iIHvDcJM6T+OR5FKJ30kIb4qATa+DxhjRrMTOzw1OksIDMePJOFQ0h7b9m
 MKslFl6xRPbPCWOxXs3CZ6Lxtll0IryTlkG2G7R9WzWD8JD8NJs8/5T6Pd11kvoqOrm+f7QLf
 b0pAooAH0BW8GpjLRKwnkiP7AcFoPXNJsTND8cYUPaqaXP67eoijd4c/NpNmnyXjwsW8tQV2P
 6Y2uHYyAYW6qnTe5fJydZ/qHuH8lzNAe7gYC5s5qDGmo6jYeRmpTK02P9o7bO1UxfAlx4NZAE
 qqOINQDsA5NP8vPSPk9nucpYP6+I9dvUqw9WCuOKsRQkjgiAgPikmlHec+OFVoTVA3qYqXCV7
 qq2N8fVzmCpVVUZ7/4acDdP5BJqyfQxJ8RN8aypUW8pcQQ9RfzXfS+ms+LR8r7p4nj5coo7Oy
 eeKs21W75XIHZTCphkL+UXqquNoApruxPfgcEo+zizSul71sJiL6IQwbsSlQtXEsI1N0hBr
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that the 'clips' array is accessed by common code in the native
ioctl handler, the same can be done for the compat version, greatly
simplifying the compat code for these four ioctl commands.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 348 +++++++-----------
 1 file changed, 139 insertions(+), 209 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
index d1055bef8933..f0f3c9f9a0ef 100644
--- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
+++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
@@ -150,77 +150,54 @@ struct v4l2_window32 {
 	__u8                    global_alpha;
 };
 
-static int get_v4l2_window32(struct v4l2_window __user *p64,
-			     struct v4l2_window32 __user *p32,
-			     void __user *aux_buf, u32 aux_space)
+static int get_v4l2_window32(struct v4l2_window *p64,
+			     struct v4l2_window32 __user *p32)
 {
-	struct v4l2_clip32 __user *uclips;
-	struct v4l2_clip __user *kclips;
-	compat_caddr_t p;
-	u32 clipcount;
+	struct v4l2_window32 w32;
 
-	if (!access_ok(p32, sizeof(*p32)) ||
-	    copy_in_user(&p64->w, &p32->w, sizeof(p32->w)) ||
-	    assign_in_user(&p64->field, &p32->field) ||
-	    assign_in_user(&p64->chromakey, &p32->chromakey) ||
-	    assign_in_user(&p64->global_alpha, &p32->global_alpha) ||
-	    get_user(clipcount, &p32->clipcount) ||
-	    put_user(clipcount, &p64->clipcount))
+	if (copy_from_user(&w32, p32, sizeof(w32)))
 		return -EFAULT;
-	if (clipcount > 2048)
-		return -EINVAL;
-	if (!clipcount)
-		return put_user(NULL, &p64->clips);
 
-	if (get_user(p, &p32->clips))
-		return -EFAULT;
-	uclips = compat_ptr(p);
-	if (aux_space < clipcount * sizeof(*kclips))
-		return -EFAULT;
-	kclips = aux_buf;
-	if (put_user(kclips, &p64->clips))
-		return -EFAULT;
+	*p64 = (struct v4l2_window) {
+		.w		= w32.w,
+		.field		= w32.field,
+		.chromakey	= w32.chromakey,
+		.clips		= (void __force *)compat_ptr(w32.clips),
+		.clipcount	= w32.clipcount,
+		.bitmap		= compat_ptr(w32.bitmap),
+		.global_alpha	= w32.global_alpha,
+	};
+
+	if (p64->clipcount > 2048)
+		return -EINVAL;
+	if (!p64->clipcount)
+		p64->clips = NULL;
 
-	while (clipcount--) {
-		if (copy_in_user(&kclips->c, &uclips->c, sizeof(uclips->c)))
-			return -EFAULT;
-		if (put_user(clipcount ? kclips + 1 : NULL, &kclips->next))
-			return -EFAULT;
-		uclips++;
-		kclips++;
-	}
 	return 0;
 }
 
-static int put_v4l2_window32(struct v4l2_window __user *p64,
+static int put_v4l2_window32(struct v4l2_window *p64,
 			     struct v4l2_window32 __user *p32)
 {
-	struct v4l2_clip __user *kclips;
-	struct v4l2_clip32 __user *uclips;
-	compat_caddr_t p;
-	u32 clipcount;
-
-	if (copy_in_user(&p32->w, &p64->w, sizeof(p64->w)) ||
-	    assign_in_user(&p32->field, &p64->field) ||
-	    assign_in_user(&p32->chromakey, &p64->chromakey) ||
-	    assign_in_user(&p32->global_alpha, &p64->global_alpha) ||
-	    get_user(clipcount, &p64->clipcount) ||
-	    put_user(clipcount, &p32->clipcount))
-		return -EFAULT;
-	if (!clipcount)
-		return 0;
+	struct v4l2_window32 w32;
+
+	memset(&w32, 0, sizeof(w32));
+	w32 = (struct v4l2_window32) {
+		.w		= p64->w,
+		.field		= p64->field,
+		.chromakey	= p64->chromakey,
+		.clips		= (uintptr_t)p64->clips,
+		.clipcount	= p64->clipcount,
+		.bitmap		= ptr_to_compat(p64->bitmap),
+		.global_alpha	= p64->global_alpha,
+	};
 
-	if (get_user(kclips, &p64->clips))
+	/* copy everything except the clips pointer */
+	if (copy_to_user(p32, &w32, offsetof(struct v4l2_window32, clips)) ||
+	    copy_to_user(&p32->clipcount, &w32.clipcount,
+		   sizeof(w32) - offsetof(struct v4l2_window32, clipcount)))
 		return -EFAULT;
-	if (get_user(p, &p32->clips))
-		return -EFAULT;
-	uclips = compat_ptr(p);
-	while (clipcount--) {
-		if (copy_in_user(&uclips->c, &kclips->c, sizeof(uclips->c)))
-			return -EFAULT;
-		uclips++;
-		kclips++;
-	}
+
 	return 0;
 }
 
@@ -261,171 +238,101 @@ struct v4l2_create_buffers32 {
 	__u32			reserved[6];
 };
 
-static int __bufsize_v4l2_format(struct v4l2_format32 __user *p32, u32 *size)
-{
-	u32 type;
-
-	if (get_user(type, &p32->type))
-		return -EFAULT;
-
-	switch (type) {
-	case V4L2_BUF_TYPE_VIDEO_OVERLAY:
-	case V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY: {
-		u32 clipcount;
-
-		if (get_user(clipcount, &p32->fmt.win.clipcount))
-			return -EFAULT;
-		if (clipcount > 2048)
-			return -EINVAL;
-		*size = clipcount * sizeof(struct v4l2_clip);
-		return 0;
-	}
-	default:
-		*size = 0;
-		return 0;
-	}
-}
-
-static int bufsize_v4l2_format(struct v4l2_format32 __user *p32, u32 *size)
-{
-	if (!access_ok(p32, sizeof(*p32)))
-		return -EFAULT;
-	return __bufsize_v4l2_format(p32, size);
-}
-
-static int __get_v4l2_format32(struct v4l2_format __user *p64,
-			       struct v4l2_format32 __user *p32,
-			       void __user *aux_buf, u32 aux_space)
+static int get_v4l2_format32(struct v4l2_format *p64,
+			     struct v4l2_format32 __user *p32)
 {
-	u32 type;
-
-	if (get_user(type, &p32->type) || put_user(type, &p64->type))
+	if (get_user(p64->type, &p32->type))
 		return -EFAULT;
 
-	switch (type) {
+	switch (p64->type) {
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
-		return copy_in_user(&p64->fmt.pix, &p32->fmt.pix,
-				    sizeof(p64->fmt.pix)) ? -EFAULT : 0;
+		return copy_from_user(&p64->fmt.pix, &p32->fmt.pix,
+				      sizeof(p64->fmt.pix)) ? -EFAULT : 0;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		return copy_in_user(&p64->fmt.pix_mp, &p32->fmt.pix_mp,
-				    sizeof(p64->fmt.pix_mp)) ? -EFAULT : 0;
+		return copy_from_user(&p64->fmt.pix_mp, &p32->fmt.pix_mp,
+				      sizeof(p64->fmt.pix_mp)) ? -EFAULT : 0;
 	case V4L2_BUF_TYPE_VIDEO_OVERLAY:
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY:
-		return get_v4l2_window32(&p64->fmt.win, &p32->fmt.win,
-					 aux_buf, aux_space);
+		return get_v4l2_window32(&p64->fmt.win, &p32->fmt.win);
 	case V4L2_BUF_TYPE_VBI_CAPTURE:
 	case V4L2_BUF_TYPE_VBI_OUTPUT:
-		return copy_in_user(&p64->fmt.vbi, &p32->fmt.vbi,
-				    sizeof(p64->fmt.vbi)) ? -EFAULT : 0;
+		return copy_from_user(&p64->fmt.vbi, &p32->fmt.vbi,
+				      sizeof(p64->fmt.vbi)) ? -EFAULT : 0;
 	case V4L2_BUF_TYPE_SLICED_VBI_CAPTURE:
 	case V4L2_BUF_TYPE_SLICED_VBI_OUTPUT:
-		return copy_in_user(&p64->fmt.sliced, &p32->fmt.sliced,
-				    sizeof(p64->fmt.sliced)) ? -EFAULT : 0;
+		return copy_from_user(&p64->fmt.sliced, &p32->fmt.sliced,
+				      sizeof(p64->fmt.sliced)) ? -EFAULT : 0;
 	case V4L2_BUF_TYPE_SDR_CAPTURE:
 	case V4L2_BUF_TYPE_SDR_OUTPUT:
-		return copy_in_user(&p64->fmt.sdr, &p32->fmt.sdr,
-				    sizeof(p64->fmt.sdr)) ? -EFAULT : 0;
+		return copy_from_user(&p64->fmt.sdr, &p32->fmt.sdr,
+				      sizeof(p64->fmt.sdr)) ? -EFAULT : 0;
 	case V4L2_BUF_TYPE_META_CAPTURE:
 	case V4L2_BUF_TYPE_META_OUTPUT:
-		return copy_in_user(&p64->fmt.meta, &p32->fmt.meta,
-				    sizeof(p64->fmt.meta)) ? -EFAULT : 0;
+		return copy_from_user(&p64->fmt.meta, &p32->fmt.meta,
+				      sizeof(p64->fmt.meta)) ? -EFAULT : 0;
 	default:
 		return -EINVAL;
 	}
 }
 
-static int get_v4l2_format32(struct v4l2_format __user *p64,
-			     struct v4l2_format32 __user *p32,
-			     void __user *aux_buf, u32 aux_space)
-{
-	if (!access_ok(p32, sizeof(*p32)))
-		return -EFAULT;
-	return __get_v4l2_format32(p64, p32, aux_buf, aux_space);
-}
-
-static int bufsize_v4l2_create(struct v4l2_create_buffers32 __user *p32,
-			       u32 *size)
-{
-	if (!access_ok(p32, sizeof(*p32)))
-		return -EFAULT;
-	return __bufsize_v4l2_format(&p32->format, size);
-}
-
-static int get_v4l2_create32(struct v4l2_create_buffers __user *p64,
-			     struct v4l2_create_buffers32 __user *p32,
-			     void __user *aux_buf, u32 aux_space)
+static int get_v4l2_create32(struct v4l2_create_buffers *p64,
+			     struct v4l2_create_buffers32 __user *p32)
 {
-	if (!access_ok(p32, sizeof(*p32)) ||
-	    copy_in_user(p64, p32,
-			 offsetof(struct v4l2_create_buffers32, format)) ||
-	    assign_in_user(&p64->flags, &p32->flags))
+	if (copy_from_user(p64, p32,
+			   offsetof(struct v4l2_create_buffers32, format)) ||
+	    get_user(p64->flags, &p32->flags))
 		return -EFAULT;
-	return __get_v4l2_format32(&p64->format, &p32->format,
-				   aux_buf, aux_space);
+	return get_v4l2_format32(&p64->format, &p32->format);
 }
 
-static int __put_v4l2_format32(struct v4l2_format __user *p64,
-			       struct v4l2_format32 __user *p32)
+static int put_v4l2_format32(struct v4l2_format *p64,
+			     struct v4l2_format32 __user *p32)
 {
-	u32 type;
-
-	if (get_user(type, &p64->type))
-		return -EFAULT;
-
-	switch (type) {
+	switch (p64->type) {
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
-		return copy_in_user(&p32->fmt.pix, &p64->fmt.pix,
+		return copy_to_user(&p32->fmt.pix, &p64->fmt.pix,
 				    sizeof(p64->fmt.pix)) ? -EFAULT : 0;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		return copy_in_user(&p32->fmt.pix_mp, &p64->fmt.pix_mp,
+		return copy_to_user(&p32->fmt.pix_mp, &p64->fmt.pix_mp,
 				    sizeof(p64->fmt.pix_mp)) ? -EFAULT : 0;
 	case V4L2_BUF_TYPE_VIDEO_OVERLAY:
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY:
 		return put_v4l2_window32(&p64->fmt.win, &p32->fmt.win);
 	case V4L2_BUF_TYPE_VBI_CAPTURE:
 	case V4L2_BUF_TYPE_VBI_OUTPUT:
-		return copy_in_user(&p32->fmt.vbi, &p64->fmt.vbi,
+		return copy_to_user(&p32->fmt.vbi, &p64->fmt.vbi,
 				    sizeof(p64->fmt.vbi)) ? -EFAULT : 0;
 	case V4L2_BUF_TYPE_SLICED_VBI_CAPTURE:
 	case V4L2_BUF_TYPE_SLICED_VBI_OUTPUT:
-		return copy_in_user(&p32->fmt.sliced, &p64->fmt.sliced,
+		return copy_to_user(&p32->fmt.sliced, &p64->fmt.sliced,
 				    sizeof(p64->fmt.sliced)) ? -EFAULT : 0;
 	case V4L2_BUF_TYPE_SDR_CAPTURE:
 	case V4L2_BUF_TYPE_SDR_OUTPUT:
-		return copy_in_user(&p32->fmt.sdr, &p64->fmt.sdr,
+		return copy_to_user(&p32->fmt.sdr, &p64->fmt.sdr,
 				    sizeof(p64->fmt.sdr)) ? -EFAULT : 0;
 	case V4L2_BUF_TYPE_META_CAPTURE:
 	case V4L2_BUF_TYPE_META_OUTPUT:
-		return copy_in_user(&p32->fmt.meta, &p64->fmt.meta,
+		return copy_to_user(&p32->fmt.meta, &p64->fmt.meta,
 				    sizeof(p64->fmt.meta)) ? -EFAULT : 0;
 	default:
 		return -EINVAL;
 	}
 }
 
-static int put_v4l2_format32(struct v4l2_format __user *p64,
-			     struct v4l2_format32 __user *p32)
-{
-	if (!access_ok(p32, sizeof(*p32)))
-		return -EFAULT;
-	return __put_v4l2_format32(p64, p32);
-}
-
-static int put_v4l2_create32(struct v4l2_create_buffers __user *p64,
+static int put_v4l2_create32(struct v4l2_create_buffers *p64,
 			     struct v4l2_create_buffers32 __user *p32)
 {
-	if (!access_ok(p32, sizeof(*p32)) ||
-	    copy_in_user(p32, p64,
+	if (copy_to_user(p32, p64,
 			 offsetof(struct v4l2_create_buffers32, format)) ||
-	    assign_in_user(&p32->capabilities, &p64->capabilities) ||
-	    assign_in_user(&p32->flags, &p64->flags) ||
-	    copy_in_user(p32->reserved, p64->reserved, sizeof(p64->reserved)))
+	    put_user(p64->capabilities, &p32->capabilities) ||
+	    put_user(p64->flags, &p32->flags) ||
+	    copy_to_user(p32->reserved, p64->reserved, sizeof(p64->reserved)))
 		return -EFAULT;
-	return __put_v4l2_format32(&p64->format, &p32->format);
+	return put_v4l2_format32(&p64->format, &p32->format);
 }
 
 struct v4l2_standard32 {
@@ -1094,6 +1001,12 @@ static int put_v4l2_edid32(struct v4l2_edid __user *p64,
 unsigned int v4l2_compat_translate_cmd(unsigned int cmd)
 {
 	switch (cmd) {
+	case VIDIOC_G_FMT32:
+		return VIDIOC_G_FMT;
+	case VIDIOC_S_FMT32:
+		return VIDIOC_S_FMT;
+	case VIDIOC_TRY_FMT32:
+		return VIDIOC_TRY_FMT;
 #ifdef CONFIG_COMPAT_32BIT_TIME
 	case VIDIOC_QUERYBUF32_TIME32:
 		return VIDIOC_QUERYBUF;
@@ -1125,6 +1038,10 @@ unsigned int v4l2_compat_translate_cmd(unsigned int cmd)
 int v4l2_compat_get_user(void __user *arg, void *parg, unsigned int cmd)
 {
 	switch (cmd) {
+	case VIDIOC_G_FMT32:
+	case VIDIOC_S_FMT32:
+	case VIDIOC_TRY_FMT32:
+		return get_v4l2_format32(parg, arg);
 #ifdef CONFIG_COMPAT_32BIT_TIME
 	case VIDIOC_QUERYBUF32_TIME32:
 	case VIDIOC_QBUF32_TIME32:
@@ -1144,6 +1061,9 @@ int v4l2_compat_get_user(void __user *arg, void *parg, unsigned int cmd)
 	case VIDIOC_S_EXT_CTRLS32:
 	case VIDIOC_TRY_EXT_CTRLS32:
 		return get_v4l2_ext_controls32(parg, arg);
+
+	case VIDIOC_CREATE_BUFS32:
+		return get_v4l2_create32(parg, arg);
 	}
 	return 0;
 }
@@ -1151,6 +1071,10 @@ int v4l2_compat_get_user(void __user *arg, void *parg, unsigned int cmd)
 int v4l2_compat_put_user(void __user *arg, void *parg, unsigned int cmd)
 {
 	switch (cmd) {
+	case VIDIOC_G_FMT32:
+	case VIDIOC_S_FMT32:
+	case VIDIOC_TRY_FMT32:
+		return put_v4l2_format32(parg, arg);
 #ifdef CONFIG_COMPAT_32BIT_TIME
 	case VIDIOC_QUERYBUF32_TIME32:
 	case VIDIOC_QBUF32_TIME32:
@@ -1168,6 +1092,9 @@ int v4l2_compat_put_user(void __user *arg, void *parg, unsigned int cmd)
 	case VIDIOC_S_EXT_CTRLS32:
 	case VIDIOC_TRY_EXT_CTRLS32:
 		return put_v4l2_ext_controls32(parg, arg);
+
+	case VIDIOC_CREATE_BUFS32:
+		return put_v4l2_create32(parg, arg);
 	}
 	return 0;
 }
@@ -1179,6 +1106,29 @@ int v4l2_compat_get_array_args(struct file *file, void *mbuf,
 	int err = 0;
 
 	switch (cmd) {
+	case VIDIOC_G_FMT32:
+	case VIDIOC_S_FMT32:
+	case VIDIOC_TRY_FMT32: {
+		struct v4l2_format *f64 = arg;
+		struct v4l2_clip *c64 = mbuf;
+		struct v4l2_clip32 __user *c32 = user_ptr;
+		u32 clipcount = f64->fmt.win.clipcount;
+
+		if ((f64->type != V4L2_BUF_TYPE_VIDEO_OVERLAY &&
+		     f64->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY) ||
+		    clipcount == 0)
+			return 0;
+		if (clipcount > 2048)
+			return -EINVAL;
+		while (clipcount--) {
+			if (copy_from_user(c64, c32, sizeof(c64->c)))
+				return -EFAULT;
+			c64->next = NULL;
+			c64++;
+			c32++;
+		}
+		break;
+	}
 	case VIDIOC_QUERYBUF32_TIME32:
 	case VIDIOC_QBUF32_TIME32:
 	case VIDIOC_DQBUF32_TIME32:
@@ -1245,6 +1195,28 @@ int v4l2_compat_put_array_args(struct file *file, void __user *user_ptr,
 	int err = 0;
 
 	switch (cmd) {
+	case VIDIOC_G_FMT32:
+	case VIDIOC_S_FMT32:
+	case VIDIOC_TRY_FMT32: {
+		struct v4l2_format *f64 = arg;
+		struct v4l2_clip *c64 = mbuf;
+		struct v4l2_clip32 __user *c32 = user_ptr;
+		u32 clipcount = f64->fmt.win.clipcount;
+
+		if ((f64->type != V4L2_BUF_TYPE_VIDEO_OVERLAY &&
+		     f64->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY) ||
+		    clipcount == 0)
+			return 0;
+		if (clipcount > 2048)
+			return -EINVAL;
+		while (clipcount--) {
+			if (copy_to_user(c32, c64, sizeof(c64->c)))
+				return -EFAULT;
+			c64++;
+			c32++;
+		}
+		break;
+	}
 	case VIDIOC_QUERYBUF32_TIME32:
 	case VIDIOC_QBUF32_TIME32:
 	case VIDIOC_DQBUF32_TIME32:
@@ -1366,18 +1338,14 @@ static long do_video_ioctl(struct file *file, unsigned int cmd, unsigned long ar
 	 * 1. When struct size is different, converts the command.
 	 */
 	switch (cmd) {
-	case VIDIOC_G_FMT32: ncmd = VIDIOC_G_FMT; break;
-	case VIDIOC_S_FMT32: ncmd = VIDIOC_S_FMT; break;
 	case VIDIOC_G_FBUF32: ncmd = VIDIOC_G_FBUF; break;
 	case VIDIOC_S_FBUF32: ncmd = VIDIOC_S_FBUF; break;
 	case VIDIOC_ENUMSTD32: ncmd = VIDIOC_ENUMSTD; break;
 	case VIDIOC_ENUMINPUT32: ncmd = VIDIOC_ENUMINPUT; break;
-	case VIDIOC_TRY_FMT32: ncmd = VIDIOC_TRY_FMT; break;
 #ifdef CONFIG_X86_64
 	case VIDIOC_DQEVENT32: ncmd = VIDIOC_DQEVENT; break;
 	case VIDIOC_DQEVENT32_TIME32: ncmd = VIDIOC_DQEVENT_TIME32; break;
 #endif
-	case VIDIOC_CREATE_BUFS32: ncmd = VIDIOC_CREATE_BUFS; break;
 	case VIDIOC_G_EDID32: ncmd = VIDIOC_G_EDID; break;
 	case VIDIOC_S_EDID32: ncmd = VIDIOC_S_EDID; break;
 	default: ncmd = cmd; break;
@@ -1397,34 +1365,6 @@ static long do_video_ioctl(struct file *file, unsigned int cmd, unsigned long ar
 		compatible_arg = 0;
 		break;
 
-	case VIDIOC_G_FMT32:
-	case VIDIOC_S_FMT32:
-	case VIDIOC_TRY_FMT32:
-		err = bufsize_v4l2_format(p32, &aux_space);
-		if (!err)
-			err = alloc_userspace(sizeof(struct v4l2_format),
-					      aux_space, &new_p64);
-		if (!err) {
-			aux_buf = new_p64 + sizeof(struct v4l2_format);
-			err = get_v4l2_format32(new_p64, p32,
-						aux_buf, aux_space);
-		}
-		compatible_arg = 0;
-		break;
-
-	case VIDIOC_CREATE_BUFS32:
-		err = bufsize_v4l2_create(p32, &aux_space);
-		if (!err)
-			err = alloc_userspace(sizeof(struct v4l2_create_buffers),
-					      aux_space, &new_p64);
-		if (!err) {
-			aux_buf = new_p64 + sizeof(struct v4l2_create_buffers);
-			err = get_v4l2_create32(new_p64, p32,
-						aux_buf, aux_space);
-		}
-		compatible_arg = 0;
-		break;
-
 	case VIDIOC_S_FBUF32:
 		err = alloc_userspace(sizeof(struct v4l2_framebuffer), 0,
 				      &new_p64);
@@ -1527,16 +1467,6 @@ static long do_video_ioctl(struct file *file, unsigned int cmd, unsigned long ar
 		err = put_v4l2_edid32(new_p64, p32);
 		break;
 
-	case VIDIOC_G_FMT32:
-	case VIDIOC_S_FMT32:
-	case VIDIOC_TRY_FMT32:
-		err = put_v4l2_format32(new_p64, p32);
-		break;
-
-	case VIDIOC_CREATE_BUFS32:
-		err = put_v4l2_create32(new_p64, p32);
-		break;
-
 	case VIDIOC_ENUMSTD32:
 		err = put_v4l2_standard32(new_p64, p32);
 		break;
-- 
2.27.0

