Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 455F043ABDE
	for <lists+linux-media@lfdr.de>; Tue, 26 Oct 2021 07:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235094AbhJZFwi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Oct 2021 01:52:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:44136 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229687AbhJZFwi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Oct 2021 01:52:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6664C6058D;
        Tue, 26 Oct 2021 05:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635227415;
        bh=H97AJUSzxtY1KeNAjKvVW3u0ncDbnOSqhM9oBb396P0=;
        h=From:To:Cc:Subject:Date:From;
        b=Yb48cQqXPGN47MpkPEK2O+3za09G0VvqAPhan3lqGiHeS1LHZi8htC4Ub0vFJas/e
         tR+pGuAr4aFQuGEc0i3p0WlV8h0m19tomBs1BuaQaAcLtknXj0IFL4OdTz0QO3rEcN
         Vd3/bM1byihxMdHzq/k8a1kkMFgeo59vAiNBqYsO+LSJrP3Ho6WpJWgcC6k7hPZNAR
         +YUa115a9yo9Xt6nRwlJxkP1mf/e3+VNAZgPZytxLwAAD1Gmi+ew1IM2gTHhmn1HZo
         55wMezYj7UZcrUmjT1VWWdUFH+E4kqQ4b0pPUc7BJTNcmIZhHsxGkzAeMQ27AeXtZY
         uONQRFwH0ooDA==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Arnd Bergmann <arnd@arndb.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     John Stultz <john.stultz@linaro.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: v4l2-core: fix VIDIOC_DQEVENT handling on non-x86
Date:   Tue, 26 Oct 2021 07:49:54 +0200
Message-Id: <20211026055010.1569728-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

My previous bugfix addressed an API inconsistency found by syzbot,
and it correctly fixed the issue on x86-64 machines, which now behave
correctly for both native and compat tasks.

Unfortunately, John found that the patch broke compat mode on all other
architectures, as they can no longer rely on the VIDIOC_DQEVENT_TIME32
code from the native handler as a fallback in the compat code.

The best way I can see for addressing this is to generalize the
VIDIOC_DQEVENT32_TIME32 code from x86 and use that for all architectures,
leaving only the VIDIOC_DQEVENT32 variant as x86 specific. The original
code was trying to be clever and use the same conversion helper for native
32-bit code and compat mode, but that turned out to be too obscure so
even I missed that bit I had introduced myself when I made the fix.

Fixes: c344f07aa1b4 ("media: v4l2-core: ignore native time32 ioctls on 64-bit")
Reported-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 41 ++++++++-----------
 1 file changed, 17 insertions(+), 24 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
index 8176769a89fa..0f3d6b5667b0 100644
--- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
+++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
@@ -751,10 +751,6 @@ static int put_v4l2_ext_controls32(struct v4l2_ext_controls *p64,
 /*
  * x86 is the only compat architecture with different struct alignment
  * between 32-bit and 64-bit tasks.
- *
- * On all other architectures, v4l2_event32 and v4l2_event32_time32 are
- * the same as v4l2_event and v4l2_event_time32, so we can use the native
- * handlers, converting v4l2_event to v4l2_event_time32 if necessary.
  */
 struct v4l2_event32 {
 	__u32				type;
@@ -772,21 +768,6 @@ struct v4l2_event32 {
 	__u32				reserved[8];
 };
 
-#ifdef CONFIG_COMPAT_32BIT_TIME
-struct v4l2_event32_time32 {
-	__u32				type;
-	union {
-		compat_s64		value64;
-		__u8			data[64];
-	} u;
-	__u32				pending;
-	__u32				sequence;
-	struct old_timespec32		timestamp;
-	__u32				id;
-	__u32				reserved[8];
-};
-#endif
-
 static int put_v4l2_event32(struct v4l2_event *p64,
 			    struct v4l2_event32 __user *p32)
 {
@@ -802,7 +783,22 @@ static int put_v4l2_event32(struct v4l2_event *p64,
 	return 0;
 }
 
+#endif
+
 #ifdef CONFIG_COMPAT_32BIT_TIME
+struct v4l2_event32_time32 {
+	__u32				type;
+	union {
+		compat_s64		value64;
+		__u8			data[64];
+	} u;
+	__u32				pending;
+	__u32				sequence;
+	struct old_timespec32		timestamp;
+	__u32				id;
+	__u32				reserved[8];
+};
+
 static int put_v4l2_event32_time32(struct v4l2_event *p64,
 				   struct v4l2_event32_time32 __user *p32)
 {
@@ -818,7 +814,6 @@ static int put_v4l2_event32_time32(struct v4l2_event *p64,
 	return 0;
 }
 #endif
-#endif
 
 struct v4l2_edid32 {
 	__u32 pad;
@@ -880,9 +875,7 @@ static int put_v4l2_edid32(struct v4l2_edid *p64,
 #define VIDIOC_QUERYBUF32_TIME32	_IOWR('V',  9, struct v4l2_buffer32_time32)
 #define VIDIOC_QBUF32_TIME32		_IOWR('V', 15, struct v4l2_buffer32_time32)
 #define VIDIOC_DQBUF32_TIME32		_IOWR('V', 17, struct v4l2_buffer32_time32)
-#ifdef CONFIG_X86_64
 #define	VIDIOC_DQEVENT32_TIME32		_IOR ('V', 89, struct v4l2_event32_time32)
-#endif
 #define VIDIOC_PREPARE_BUF32_TIME32	_IOWR('V', 93, struct v4l2_buffer32_time32)
 #endif
 
@@ -936,10 +929,10 @@ unsigned int v4l2_compat_translate_cmd(unsigned int cmd)
 #ifdef CONFIG_X86_64
 	case VIDIOC_DQEVENT32:
 		return VIDIOC_DQEVENT;
+#endif
 #ifdef CONFIG_COMPAT_32BIT_TIME
 	case VIDIOC_DQEVENT32_TIME32:
 		return VIDIOC_DQEVENT;
-#endif
 #endif
 	}
 	return cmd;
@@ -1032,10 +1025,10 @@ int v4l2_compat_put_user(void __user *arg, void *parg, unsigned int cmd)
 #ifdef CONFIG_X86_64
 	case VIDIOC_DQEVENT32:
 		return put_v4l2_event32(parg, arg);
+#endif
 #ifdef CONFIG_COMPAT_32BIT_TIME
 	case VIDIOC_DQEVENT32_TIME32:
 		return put_v4l2_event32_time32(parg, arg);
-#endif
 #endif
 	}
 	return 0;
-- 
2.29.2

