Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97DDA3D8B66
	for <lists+linux-media@lfdr.de>; Wed, 28 Jul 2021 12:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235656AbhG1KGh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jul 2021 06:06:37 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40286 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231907AbhG1KGg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jul 2021 06:06:36 -0400
Received: from guri.fritz.box (unknown [IPv6:2a02:810a:880:f54:2423:b21a:aa05:1a51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9891D1F435DD;
        Wed, 28 Jul 2021 11:06:33 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, mchehab@kernel.org,
        tfiga@chromium.org, enric.balletbo@collabora.com,
        acourbot@chromium.org, hsinyi@chromium.org, eizan@chromium.org
Subject: [PATCH 3/3] media: v4l2-ctl: Add support to VIDIOC_DQEVENT_TIME32 on non x86_64 arch
Date:   Wed, 28 Jul 2021 12:06:24 +0200
Message-Id: <20210728100624.16129-4-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210728100624.16129-1-dafna.hirschfeld@collabora.com>
References: <20210728100624.16129-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently, if the ioctl VIDIOC_DQEVENT_TIME32 is called on e.g. Arm-64
the function 'v4l2_compat_translate_cmd' doesn't have a 'translation'
for the cmd and so 'cmd' is returned as is. This cause
a failure '-ENOTTY' in __video_do_ioctl.
This patch fixes it by defining VIDIOC_DQEVENT32_TIME32 to be
VIDIOC_DQEVENT_TIME32 for non x86-64 arch and translates it
to VIDIOC_DQEVENT.
In addition, add a call to put_v4l2_event_time32 to copy the data
to userspace for non x86-64 arch

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 21 ++++++++++++-------
 include/media/v4l2-ioctl.h                    |  3 +++
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
index 5623003a9705..20a80880d9b7 100644
--- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
+++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
@@ -871,9 +871,13 @@ static int put_v4l2_edid32(struct v4l2_edid *p64,
 #define VIDIOC_QUERYBUF32_TIME32	_IOWR('V',  9, struct v4l2_buffer32_time32)
 #define VIDIOC_QBUF32_TIME32		_IOWR('V', 15, struct v4l2_buffer32_time32)
 #define VIDIOC_DQBUF32_TIME32		_IOWR('V', 17, struct v4l2_buffer32_time32)
+
 #ifdef CONFIG_X86_64
 #define	VIDIOC_DQEVENT32_TIME32		_IOR ('V', 89, struct v4l2_event32_time32)
+#else
+#define	VIDIOC_DQEVENT32_TIME32		VIDIOC_DQEVENT_TIME32
 #endif
+
 #define VIDIOC_PREPARE_BUF32_TIME32	_IOWR('V', 93, struct v4l2_buffer32_time32)
 #endif
 
@@ -899,6 +903,8 @@ unsigned int v4l2_compat_translate_cmd(unsigned int cmd)
 		return VIDIOC_DQBUF;
 	case VIDIOC_PREPARE_BUF32_TIME32:
 		return VIDIOC_PREPARE_BUF;
+	case VIDIOC_DQEVENT32_TIME32:
+		return VIDIOC_DQEVENT;
 #endif
 	case VIDIOC_QUERYBUF32:
 		return VIDIOC_QUERYBUF;
@@ -927,10 +933,6 @@ unsigned int v4l2_compat_translate_cmd(unsigned int cmd)
 #ifdef CONFIG_X86_64
 	case VIDIOC_DQEVENT32:
 		return VIDIOC_DQEVENT;
-#ifdef CONFIG_COMPAT_32BIT_TIME
-	case VIDIOC_DQEVENT32_TIME32:
-		return VIDIOC_DQEVENT;
-#endif
 #endif
 	}
 	return cmd;
@@ -996,6 +998,13 @@ int v4l2_compat_put_user(void __user *arg, void *parg, unsigned int cmd)
 	case VIDIOC_DQBUF32_TIME32:
 	case VIDIOC_PREPARE_BUF32_TIME32:
 		return put_v4l2_buffer32_time32(parg, arg);
+	case VIDIOC_DQEVENT32_TIME32:
+#ifdef CONFIG_X86_64
+		return put_v4l2_event32_time32(parg, arg);
+#else
+		return put_v4l2_event_time32(parg, arg);
+#endif
+
 #endif
 	case VIDIOC_QUERYBUF32:
 	case VIDIOC_QBUF32:
@@ -1023,10 +1032,6 @@ int v4l2_compat_put_user(void __user *arg, void *parg, unsigned int cmd)
 #ifdef CONFIG_X86_64
 	case VIDIOC_DQEVENT32:
 		return put_v4l2_event32(parg, arg);
-#ifdef CONFIG_COMPAT_32BIT_TIME
-	case VIDIOC_DQEVENT32_TIME32:
-		return put_v4l2_event32_time32(parg, arg);
-#endif
 #endif
 	}
 	return 0;
diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
index 0c209bbbc76f..3840a3ea384c 100644
--- a/include/media/v4l2-ioctl.h
+++ b/include/media/v4l2-ioctl.h
@@ -786,7 +786,10 @@ struct v4l2_buffer_time32 {
 };
 
 /*
+ * For architectures other than x86_64, the struct v4l2_event32_time32
+ * is the same as v4l2_event_time32.
  * This function is used to copy the struct v4l2_event_time32 to userspace
+ * if either the kernel is not 64-bit or if the architecture is other than x86_64.
  */
 int put_v4l2_event_time32(void *parg, void __user *arg);
 
-- 
2.17.1

