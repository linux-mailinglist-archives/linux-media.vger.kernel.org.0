Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34B4030591D
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 12:05:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236409AbhA0LDX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jan 2021 06:03:23 -0500
Received: from mout02.posteo.de ([185.67.36.66]:54891 "EHLO mout02.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236319AbhA0LBr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jan 2021 06:01:47 -0500
Received: from submission (posteo.de [89.146.220.130]) 
        by mout02.posteo.de (Postfix) with ESMTPS id EDC492400FE
        for <linux-media@vger.kernel.org>; Wed, 27 Jan 2021 12:00:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1611745214; bh=cfJ9Jfr9FCxI5fYsZ+W4d460cgbOGtrL435Q35xiGqs=;
        h=Subject:To:From:Date:From;
        b=XuvHjWM5JhG2WYmar6vBhv7IjtMg0PM1w+ENED5D4DO+TTroWNpO6tmrCgV3mvCvS
         COtclGC/xw2gk+KklttYoq1EFfXlBMI9bHC0GqIS/uNnugZnb1Aso0gFdwg8vHxcFB
         lEFjZQGJ6U+TkL5os05c4o5FBES2dbT6l5YADZ5cwbRzbgIQ1DWkSQc15nOI3B2G/o
         kCYVmjNEUzD6g0mZ2kv5lplhkcAYy8qgfKvWrTu6JR6mPN3nBBf4b90mJmxfWnT5Qg
         MgsqQb+ClrKeMLEb2XVutIfkOZnvZ+62oTQAVcjgfvI2pTneUXDl+hwCMqAlcsRu3c
         9V+Yb39khlgyw==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4DQgc600J3z9rxQ;
        Wed, 27 Jan 2021 12:00:05 +0100 (CET)
Subject: [PATCH v2] v4l2-ctl: print delta to current clock in verbose mode
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
References: <71a724ea-ffd4-25f5-b1ca-40802a625b62@posteo.de>
 <400c6a61-b778-0400-4ec2-cb254b9c67d5@xs4all.nl>
 <cce03638-168e-f7f7-a917-854310c64745@posteo.de>
 <0ccd746f-3555-11e0-9ff7-d2f39ba4685a@xs4all.nl>
From:   Max Schulze <max.schulze@posteo.de>
Message-ID: <75ae6722-0909-a90a-5ddc-5cd1f735bc1d@posteo.de>
Date:   Wed, 27 Jan 2021 12:00:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <0ccd746f-3555-11e0-9ff7-d2f39ba4685a@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the Buffer Timestamp Clock is _MONOTONIC, print the delta
to the current clock time

needs --stream-show-delta-now together with --verbose


Signed-off-by: Max Schuze <max.schulze@posteo.de>
---

Changes since v1:
* Hide behind command-line Option

  utils/v4l2-ctl/v4l2-ctl-streaming.cpp | 12 +++++++++++-
  utils/v4l2-ctl/v4l2-ctl.cpp           |  1 +
  utils/v4l2-ctl/v4l2-ctl.h             |  1 +
  3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp 
b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index a3580595..df465561 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -326,6 +326,10 @@ void streaming_usage()
             "  --stream-out-dmabuf\n"
             "                     output video using dmabuf 
[VIDIOC_(D)QBUF]\n"
             "                     Requires a corresponding 
--stream-mmap option.\n"
+           "  --stream-show-delta-now\n"
+           "                     output the difference between the 
buffer timestamp and current\n"
+           "                     clock, if the buffer timestamp source 
is the monotonic clock.\n"
+           "                     requires --verbose\n"
             "  --list-patterns    list available patterns for use with 
--stream-pattern.\n"
             "  --list-buffers     list all video buffers 
[VIDIOC_QUERYBUF]\n"
             "  --list-buffers-out list all video output buffers 
[VIDIOC_QUERYBUF]\n"
@@ -556,9 +560,15 @@ static void print_concise_buffer(FILE *f, 
cv4l_buffer &buf, cv4l_fmt &fmt,
          double ts = buf.g_timestamp().tv_sec + 
buf.g_timestamp().tv_usec / 1000000.0;
          fprintf(f, " ts: %.06f", ts);
          if (last_ts <= 0.0)
-            fprintf(f, " delta: %.03f ms", (ts - last_ts) * 1000.0);
+            fprintf(f, " delta last: %.03f ms", (ts - last_ts) * 1000.0);
          last_ts = ts;

+        if (options[OptStreamShowDeltaNow] && (buf.g_flags() & 
V4L2_BUF_FLAG_TIMESTAMP_MASK) == V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC) {
+            timespec ts_clock;
+            clock_gettime(CLOCK_MONOTONIC, &ts_clock);
+            fprintf(f, " delta now: %+.03f ms", ((ts_clock.tv_sec + 
ts_clock.tv_nsec / 1000000000.0) - ts) * 1000.0);
+        }
+
          if (fps_ts.has_fps(true))
              fprintf(stderr, " fps: %.02f", fps_ts.fps());

diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
index 6da4698a..4e179f77 100644
--- a/utils/v4l2-ctl/v4l2-ctl.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
@@ -265,6 +265,7 @@ static struct option long_options[] = {
      {"stream-out-mmap", optional_argument, nullptr, OptStreamOutMmap},
      {"stream-out-user", optional_argument, nullptr, OptStreamOutUser},
      {"stream-out-dmabuf", no_argument, nullptr, OptStreamOutDmaBuf},
+    {"stream-show-delta-now", no_argument, nullptr, 
OptStreamShowDeltaNow},
      {"list-patterns", no_argument, nullptr, OptListPatterns},
      {"version", no_argument, nullptr, OptVersion},
      {nullptr, 0, nullptr, 0}
diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
index a4f193cc..909b96e4 100644
--- a/utils/v4l2-ctl/v4l2-ctl.h
+++ b/utils/v4l2-ctl/v4l2-ctl.h
@@ -245,6 +245,7 @@ enum Option {
      OptStreamOutMmap,
      OptStreamOutUser,
      OptStreamOutDmaBuf,
+    OptStreamShowDeltaNow,
      OptListPatterns,
      OptHelpTuner,
      OptHelpIO,
-- 
2.29.0


