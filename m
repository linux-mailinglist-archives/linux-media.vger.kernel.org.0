Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 169343D8B64
	for <lists+linux-media@lfdr.de>; Wed, 28 Jul 2021 12:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234186AbhG1KGg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jul 2021 06:06:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232539AbhG1KGf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jul 2021 06:06:35 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 839B9C061757
        for <linux-media@vger.kernel.org>; Wed, 28 Jul 2021 03:06:34 -0700 (PDT)
Received: from guri.fritz.box (unknown [IPv6:2a02:810a:880:f54:2423:b21a:aa05:1a51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5FDC51F435D5;
        Wed, 28 Jul 2021 11:06:32 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, mchehab@kernel.org,
        tfiga@chromium.org, enric.balletbo@collabora.com,
        acourbot@chromium.org, hsinyi@chromium.org, eizan@chromium.org
Subject: [PATCH 1/3] media: v4l2-core: move the code that copies v4l2_event_time32 to a function
Date:   Wed, 28 Jul 2021 12:06:22 +0200
Message-Id: <20210728100624.16129-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210728100624.16129-1-dafna.hirschfeld@collabora.com>
References: <20210728100624.16129-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move the code that copies v4l2_event_time32 to function
"put_v4l2_event_time32". This function will also be used
for the case of 64-bit kernel other than x86_64 in later
commits.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 41 +++++++++++++++++-----------
 include/media/v4l2-ioctl.h           |  6 ++++
 2 files changed, 31 insertions(+), 16 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 05d5db3d85e5..24bdb2383595 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3167,6 +3167,28 @@ static int video_get_user(void __user *arg, void *parg,
 	return err;
 }
 
+int put_v4l2_event_time32(void *parg, void __user *arg)
+{
+	struct v4l2_event *ev = parg;
+	struct v4l2_event_time32 ev32;
+
+	memset(&ev32, 0, sizeof(ev32));
+
+	ev32.type	= ev->type;
+	ev32.pending	= ev->pending;
+	ev32.sequence	= ev->sequence;
+	ev32.timestamp.tv_sec	= ev->timestamp.tv_sec;
+	ev32.timestamp.tv_nsec	= ev->timestamp.tv_nsec;
+	ev32.id		= ev->id;
+
+	memcpy(&ev32.u, &ev->u, sizeof(ev->u));
+	memcpy(&ev32.reserved, &ev->reserved, sizeof(ev->reserved));
+
+	if (copy_to_user(arg, &ev32, sizeof(ev32)))
+		return -EFAULT;
+	return 0;
+}
+
 static int video_put_user(void __user *arg, void *parg,
 			  unsigned int real_cmd, unsigned int cmd)
 {
@@ -3186,23 +3208,10 @@ static int video_put_user(void __user *arg, void *parg,
 #if !defined(CONFIG_64BIT) && defined(CONFIG_COMPAT_32BIT_TIME)
 	switch (cmd) {
 	case VIDIOC_DQEVENT_TIME32: {
-		struct v4l2_event *ev = parg;
-		struct v4l2_event_time32 ev32;
-
-		memset(&ev32, 0, sizeof(ev32));
+		int ret = put_v4l2_event_time32(parg, arg);
 
-		ev32.type	= ev->type;
-		ev32.pending	= ev->pending;
-		ev32.sequence	= ev->sequence;
-		ev32.timestamp.tv_sec	= ev->timestamp.tv_sec;
-		ev32.timestamp.tv_nsec	= ev->timestamp.tv_nsec;
-		ev32.id		= ev->id;
-
-		memcpy(&ev32.u, &ev->u, sizeof(ev->u));
-		memcpy(&ev32.reserved, &ev->reserved, sizeof(ev->reserved));
-
-		if (copy_to_user(arg, &ev32, sizeof(ev32)))
-			return -EFAULT;
+		if (ret)
+			return ret;
 		break;
 	}
 	case VIDIOC_QUERYBUF_TIME32:
diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
index edb733f21604..0c209bbbc76f 100644
--- a/include/media/v4l2-ioctl.h
+++ b/include/media/v4l2-ioctl.h
@@ -784,6 +784,12 @@ struct v4l2_buffer_time32 {
 		__u32		reserved;
 	};
 };
+
+/*
+ * This function is used to copy the struct v4l2_event_time32 to userspace
+ */
+int put_v4l2_event_time32(void *parg, void __user *arg);
+
 #define VIDIOC_QUERYBUF_TIME32	_IOWR('V',  9, struct v4l2_buffer_time32)
 #define VIDIOC_QBUF_TIME32	_IOWR('V', 15, struct v4l2_buffer_time32)
 #define VIDIOC_DQBUF_TIME32	_IOWR('V', 17, struct v4l2_buffer_time32)
-- 
2.17.1

