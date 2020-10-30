Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC8C2A0BEE
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 17:56:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbgJ3Q4Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 12:56:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:60746 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727144AbgJ3Qzo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 12:55:44 -0400
Received: from localhost.localdomain (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BC99622242;
        Fri, 30 Oct 2020 16:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604076943;
        bh=t7Sl1Pzu+/YBp2XhTNhTX6P+UIVbjjy0p02B2wp6jDA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=q1lrZVo4lBdUY4LcFXplHowysUMTk2NXo+MxhTuvVgqi9FQrOb/0gkz47B+mE70BQ
         gtXNakXgd1TwWiMaeMcdHXWYkvf8XNS+aIvHq3styqNq4wORJUfbDxJoqx+xCrnxey
         zCUtJv+0iFJK7+MMyB2+eHj28ZrgqwkW8IBh1ZUg=
From:   Arnd Bergmann <arnd@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
        mchehab@kernel.org, hch@lst.de, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/8] media: v4l2: remove unneeded compat ioctl handlers
Date:   Fri, 30 Oct 2020 17:55:23 +0100
Message-Id: <20201030165529.1255175-3-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201030165529.1255175-1-arnd@kernel.org>
References: <20201030165529.1255175-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

These seven commands are all compatible and do not need any
conversion handlers. The existing ones just copy 32-bit
integers around, and those are always compatible.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 42 -------------------
 1 file changed, 42 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
index 7c939d5c5232..a76f6ac5b1eb 100644
--- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
+++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
@@ -1406,14 +1406,6 @@ static int put_v4l2_edid32(struct v4l2_edid __user *p64,
 #define VIDIOC_PREPARE_BUF32	_IOWR('V', 93, struct v4l2_buffer32)
 #define VIDIOC_PREPARE_BUF32_TIME32 _IOWR('V', 93, struct v4l2_buffer32_time32)
 
-#define VIDIOC_OVERLAY32	_IOW ('V', 14, s32)
-#define VIDIOC_STREAMON32	_IOW ('V', 18, s32)
-#define VIDIOC_STREAMOFF32	_IOW ('V', 19, s32)
-#define VIDIOC_G_INPUT32	_IOR ('V', 38, s32)
-#define VIDIOC_S_INPUT32	_IOWR('V', 39, s32)
-#define VIDIOC_G_OUTPUT32	_IOR ('V', 46, s32)
-#define VIDIOC_S_OUTPUT32	_IOWR('V', 47, s32)
-
 unsigned int v4l2_compat_translate_cmd(unsigned int cmd)
 {
 	switch (cmd) {
@@ -1544,13 +1536,6 @@ static long do_video_ioctl(struct file *file, unsigned int cmd, unsigned long ar
 	case VIDIOC_DQEVENT32: ncmd = VIDIOC_DQEVENT; break;
 	case VIDIOC_DQEVENT32_TIME32: ncmd = VIDIOC_DQEVENT_TIME32; break;
 #endif
-	case VIDIOC_OVERLAY32: ncmd = VIDIOC_OVERLAY; break;
-	case VIDIOC_STREAMON32: ncmd = VIDIOC_STREAMON; break;
-	case VIDIOC_STREAMOFF32: ncmd = VIDIOC_STREAMOFF; break;
-	case VIDIOC_G_INPUT32: ncmd = VIDIOC_G_INPUT; break;
-	case VIDIOC_S_INPUT32: ncmd = VIDIOC_S_INPUT; break;
-	case VIDIOC_G_OUTPUT32: ncmd = VIDIOC_G_OUTPUT; break;
-	case VIDIOC_S_OUTPUT32: ncmd = VIDIOC_S_OUTPUT; break;
 	case VIDIOC_CREATE_BUFS32: ncmd = VIDIOC_CREATE_BUFS; break;
 	case VIDIOC_PREPARE_BUF32: ncmd = VIDIOC_PREPARE_BUF; break;
 	case VIDIOC_PREPARE_BUF32_TIME32: ncmd = VIDIOC_PREPARE_BUF_TIME32; break;
@@ -1565,24 +1550,6 @@ static long do_video_ioctl(struct file *file, unsigned int cmd, unsigned long ar
 	 * argument into it.
 	 */
 	switch (cmd) {
-	case VIDIOC_OVERLAY32:
-	case VIDIOC_STREAMON32:
-	case VIDIOC_STREAMOFF32:
-	case VIDIOC_S_INPUT32:
-	case VIDIOC_S_OUTPUT32:
-		err = alloc_userspace(sizeof(unsigned int), 0, &new_p64);
-		if (!err && assign_in_user((unsigned int __user *)new_p64,
-					   (compat_uint_t __user *)p32))
-			err = -EFAULT;
-		compatible_arg = 0;
-		break;
-
-	case VIDIOC_G_INPUT32:
-	case VIDIOC_G_OUTPUT32:
-		err = alloc_userspace(sizeof(unsigned int), 0, &new_p64);
-		compatible_arg = 0;
-		break;
-
 	case VIDIOC_G_EDID32:
 	case VIDIOC_S_EDID32:
 		err = alloc_userspace(sizeof(struct v4l2_edid), 0, &new_p64);
@@ -1755,15 +1722,6 @@ static long do_video_ioctl(struct file *file, unsigned int cmd, unsigned long ar
 	 * the original 32 bits structure.
 	 */
 	switch (cmd) {
-	case VIDIOC_S_INPUT32:
-	case VIDIOC_S_OUTPUT32:
-	case VIDIOC_G_INPUT32:
-	case VIDIOC_G_OUTPUT32:
-		if (assign_in_user((compat_uint_t __user *)p32,
-				   ((unsigned int __user *)new_p64)))
-			err = -EFAULT;
-		break;
-
 	case VIDIOC_G_FBUF32:
 		err = put_v4l2_framebuffer32(new_p64, p32);
 		break;
-- 
2.27.0

