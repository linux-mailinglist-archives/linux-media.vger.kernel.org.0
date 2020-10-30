Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 865022A0BE8
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 17:56:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727303AbgJ3Qzx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 12:55:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:60912 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727279AbgJ3Qzx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 12:55:53 -0400
Received: from localhost.localdomain (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 86CF02151B;
        Fri, 30 Oct 2020 16:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604076950;
        bh=w4QL4bPf0IUyVYDArqRzdv2EC7S85jL+ke0Ksuo7b74=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mxehbCR4Z+ZMwJ4+TqBxZztJUspWVDGMi9NwKMIiNOg3oxzp47n3FAgXTMrTIs7zI
         EN1HmS6DXZKBo7wiqHen5zGplrERac5zAZoUUDO3/xpwefAiGHPjzK0rOZWkjie+0q
         CbS0JH/NKo3NosbX4z1x59kWeer4kbw0k6CMttgE=
From:   Arnd Bergmann <arnd@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
        mchehab@kernel.org, hch@lst.de, linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/8] media: v4l2: convert v4l2_format compat ioctls
Date:   Fri, 30 Oct 2020 17:55:27 +0100
Message-Id: <20201030165529.1255175-7-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201030165529.1255175-1-arnd@kernel.org>
References: <20201030165529.1255175-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Now that the 'clips' array is accessed by common code in the native
ioctl handler, the same can be done for the compat version, greatly
simplifying the compat code for these four ioctl commands.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 346 +++++++-----------
 1 file changed, 139 insertions(+), 207 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
index dfc4632b7ba2..f774a17c9271 100644
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
-		return -EFAULT;
-	if (get_user(p, &p32->clips))
+	/* copy everything except the clips pointer */
+	if (copy_to_user(p32, &w32, offsetof(struct v4l2_window32, clips)) ||
+	    copy_to_user(&p32->clipcount, &w32.clipcount,
+		   sizeof(w32) - offsetof(struct v4l2_window32, clipcount)))
 		return -EFAULT;
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
 
@@ -257,169 +234,99 @@ struct v4l2_create_buffers32 {
 	__u32			reserved[7];
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
-			 offsetof(struct v4l2_create_buffers32, format)))
+	if (copy_from_user(p64, p32,
+			   offsetof(struct v4l2_create_buffers32, format)))
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
-	    copy_in_user(p32->reserved, p64->reserved, sizeof(p64->reserved)))
+	    put_user(p64->capabilities, &p32->capabilities) ||
+	    copy_to_user(p32->reserved, p64->reserved, sizeof(p64->reserved)))
 		return -EFAULT;
-	return __put_v4l2_format32(&p64->format, &p32->format);
+	return put_v4l2_format32(&p64->format, &p32->format);
 }
 
 struct v4l2_standard32 {
@@ -1081,6 +988,12 @@ static int put_v4l2_edid32(struct v4l2_edid __user *p64,
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
@@ -1097,6 +1010,8 @@ unsigned int v4l2_compat_translate_cmd(unsigned int cmd)
 		return VIDIOC_QBUF;
 	case VIDIOC_DQBUF32:
 		return VIDIOC_DQBUF;
+	case VIDIOC_CREATE_BUFS32:
+		return VIDIOC_CREATE_BUFS;
 	case VIDIOC_G_EXT_CTRLS32:
 		return VIDIOC_G_EXT_CTRLS;
 	case VIDIOC_S_EXT_CTRLS32:
@@ -1112,6 +1027,10 @@ unsigned int v4l2_compat_translate_cmd(unsigned int cmd)
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
@@ -1129,6 +1048,9 @@ int v4l2_compat_get_user(void __user *arg, void *parg, unsigned int cmd)
 	case VIDIOC_S_EXT_CTRLS32:
 	case VIDIOC_TRY_EXT_CTRLS32:
 		return get_v4l2_ext_controls32(parg, arg);
+
+	case VIDIOC_CREATE_BUFS32:
+		return get_v4l2_create32(parg, arg);
 	}
 	return 0;
 }
@@ -1136,6 +1058,10 @@ int v4l2_compat_get_user(void __user *arg, void *parg, unsigned int cmd)
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
@@ -1153,6 +1079,9 @@ int v4l2_compat_put_user(void __user *arg, void *parg, unsigned int cmd)
 	case VIDIOC_S_EXT_CTRLS32:
 	case VIDIOC_TRY_EXT_CTRLS32:
 		return put_v4l2_ext_controls32(parg, arg);
+
+	case VIDIOC_CREATE_BUFS32:
+		return put_v4l2_create32(parg, arg);
 	}
 	return 0;
 }
@@ -1164,6 +1093,29 @@ int v4l2_compat_get_array_args(struct file *file, void *mbuf,
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
@@ -1231,6 +1183,28 @@ int v4l2_compat_put_array_args(struct file *file, void __user *user_ptr,
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
@@ -1353,18 +1327,14 @@ static long do_video_ioctl(struct file *file, unsigned int cmd, unsigned long ar
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
@@ -1384,34 +1354,6 @@ static long do_video_ioctl(struct file *file, unsigned int cmd, unsigned long ar
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
@@ -1514,16 +1456,6 @@ static long do_video_ioctl(struct file *file, unsigned int cmd, unsigned long ar
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

