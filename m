Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E34CF30A491
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 10:45:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232363AbhBAJon (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 04:44:43 -0500
Received: from smtp2.macqel.be ([109.135.2.61]:26097 "EHLO smtp2.macqel.be"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231598AbhBAJon (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Feb 2021 04:44:43 -0500
X-Greylist: delayed 554 seconds by postgrey-1.27 at vger.kernel.org; Mon, 01 Feb 2021 04:44:42 EST
Received: from localhost (localhost [127.0.0.1])
        by smtp2.macqel.be (Postfix) with ESMTP id 8B168158AC7;
        Mon,  1 Feb 2021 10:34:42 +0100 (CET)
X-Virus-Scanned: amavisd-new at macqel.be
Received: from smtp2.macqel.be ([127.0.0.1])
        by localhost (mail.macqel.be [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id VgeHPe7ClAmH; Mon,  1 Feb 2021 10:34:40 +0100 (CET)
Received: from perdita.MACQEL (perdita.macqel [10.1.40.53])
        by smtp2.macqel.be (Postfix) with ESMTP id C6540158AC3;
        Mon,  1 Feb 2021 10:34:40 +0100 (CET)
Received: from perdita.MACQEL (localhost [127.0.0.1])
        by perdita.MACQEL (8.14.4/8.14.4/SuSE Linux 0.8) with ESMTP id 1119YcYJ028880;
        Mon, 1 Feb 2021 10:34:40 +0100
Received: (from p6@localhost)
        by perdita.MACQEL (8.14.4/8.14.4/Submit) id 1119YcdU028868;
        Mon, 1 Feb 2021 10:34:38 +0100
X-Authentication-Warning: perdita.MACQEL: p6 set sender to phdm@macq.eu using -f
From:   Philippe De Muyter <phdm@macqel.be>
To:     linux-media@vger.kernel.org
Cc:     Philippe De Muyter <phdm@macqel.be>
Subject: [PATCH] media: add V4L2_BUF_FLAG_TIMESTAMP_UTC and V4L2_BUF_FLAG_TIMESTAMP_TAI.
Date:   Mon,  1 Feb 2021 10:34:08 +0100
Message-Id: <1612172048-28830-1-git-send-email-phdm@macqel.be>
X-Mailer: git-send-email 1.8.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since V4L2_BUF_FLAG_TIMESTAMP_UNKNOWN and
V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC were added long ago, no other flag
was introduced to indicate precisely the reference clock used for
timestamps associated to v4l2 buffers.  Add here the ability for drivers
to use the realtime (= UTC) or TAI clock.

Signed-off-by: Philippe De Muyter <phdm@macqel.be>
---
 Documentation/userspace-api/media/v4l/buffer.rst | 14 ++++++++++++++
 include/trace/events/v4l2.h                      |  2 ++
 include/uapi/linux/videodev2.h                   |  2 ++
 3 files changed, 18 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
index 1b0fdc1..44cb59b 100644
--- a/Documentation/userspace-api/media/v4l/buffer.rst
+++ b/Documentation/userspace-api/media/v4l/buffer.rst
@@ -637,6 +637,20 @@ Buffer Flags
       - The buffer timestamp has been taken from the ``CLOCK_MONOTONIC``
 	clock. To access the same clock outside V4L2, use
 	:c:func:`clock_gettime`.
+    * .. _`V4L2-BUF-FLAG-TIMESTAMP-UTC`:
+
+      - ``V4L2_BUF_FLAG_TIMESTAMP_UTC``
+      - 0x00008000
+      - The buffer timestamp has been taken from the ``CLOCK_REALTIME``
+	clock. To access the same clock outside V4L2, use
+	:c:func:`clock_gettime`.
+    * .. _`V4L2-BUF-FLAG-TIMESTAMP-TAI`:
+
+      - ``V4L2_BUF_FLAG_TIMESTAMP_TAI``
+      - 0x0000a000
+      - The buffer timestamp has been taken from the ``CLOCK_TAI``
+	clock. To access the same clock outside V4L2, use
+	:c:func:`clock_gettime`.
     * .. _`V4L2-BUF-FLAG-TIMESTAMP-COPY`:
 
       - ``V4L2_BUF_FLAG_TIMESTAMP_COPY``
diff --git a/include/trace/events/v4l2.h b/include/trace/events/v4l2.h
index 248bc09..ce93c88 100644
--- a/include/trace/events/v4l2.h
+++ b/include/trace/events/v4l2.h
@@ -88,6 +88,8 @@
 		{ V4L2_BUF_FLAG_TIMESTAMP_UNKNOWN,   "TIMESTAMP_UNKNOWN" },   \
 		{ V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC, "TIMESTAMP_MONOTONIC" }, \
 		{ V4L2_BUF_FLAG_TIMESTAMP_COPY,	     "TIMESTAMP_COPY" },      \
+		{ V4L2_BUF_FLAG_TIMESTAMP_UTC,	     "TIMESTAMP_UTC" },       \
+		{ V4L2_BUF_FLAG_TIMESTAMP_TAI,	     "TIMESTAMP_TAI" },       \
 		{ V4L2_BUF_FLAG_LAST,                "LAST" })
 
 #define show_timecode_flags(flags)					  \
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 79dbde3..87502ab 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1101,6 +1101,8 @@ static inline __u64 v4l2_timeval_to_ns(const struct timeval *tv)
 #define V4L2_BUF_FLAG_TIMESTAMP_UNKNOWN		0x00000000
 #define V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC	0x00002000
 #define V4L2_BUF_FLAG_TIMESTAMP_COPY		0x00004000
+#define V4L2_BUF_FLAG_TIMESTAMP_UTC		0x00008000
+#define V4L2_BUF_FLAG_TIMESTAMP_TAI		0x0000a000
 /* Timestamp sources. */
 #define V4L2_BUF_FLAG_TSTAMP_SRC_MASK		0x00070000
 #define V4L2_BUF_FLAG_TSTAMP_SRC_EOF		0x00000000
-- 
1.8.4

