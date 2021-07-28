Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 662BA3D8B65
	for <lists+linux-media@lfdr.de>; Wed, 28 Jul 2021 12:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234354AbhG1KGg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jul 2021 06:06:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233513AbhG1KGg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jul 2021 06:06:36 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCF78C061757
        for <linux-media@vger.kernel.org>; Wed, 28 Jul 2021 03:06:34 -0700 (PDT)
Received: from guri.fritz.box (unknown [IPv6:2a02:810a:880:f54:2423:b21a:aa05:1a51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 018A71F435D7;
        Wed, 28 Jul 2021 11:06:32 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, mchehab@kernel.org,
        tfiga@chromium.org, enric.balletbo@collabora.com,
        acourbot@chromium.org, hsinyi@chromium.org, eizan@chromium.org
Subject: [PATCH 2/3] media: v4l2-core: combine code chunks under macro condition together
Date:   Wed, 28 Jul 2021 12:06:23 +0200
Message-Id: <20210728100624.16129-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210728100624.16129-1-dafna.hirschfeld@collabora.com>
References: <20210728100624.16129-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The struct v4l2_event32_time32 and the function put_v4l2_event32_time32
are both defined under the condition 'ifdef CONFIG_COMPAT_32BIT_TIME'.
In order to make the code more readable, move both definitions under
one 'ifdef'.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 30 +++++++++----------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
index 47aff3b19742..5623003a9705 100644
--- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
+++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
@@ -765,21 +765,6 @@ struct v4l2_event32 {
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
@@ -796,6 +781,19 @@ static int put_v4l2_event32(struct v4l2_event *p64,
 }
 
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
@@ -811,7 +809,7 @@ static int put_v4l2_event32_time32(struct v4l2_event *p64,
 	return 0;
 }
 #endif
-#endif
+#endif /* CONFIG_X86_64 */
 
 struct v4l2_edid32 {
 	__u32 pad;
-- 
2.17.1

