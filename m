Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9920E1B65F6
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 23:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727125AbgDWVKu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 17:10:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727121AbgDWVKs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 17:10:48 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10632C09B043
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2020 14:10:48 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id a32so3004720pje.5
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2020 14:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zhPgvRrAqicIPz6pRORMT9ANciXinEc+85EuomZ8teM=;
        b=hbR451ZIcciIcZIIZm1i4aun2XaTNXc4RIsBmDicT2cIbRzdZZsz7WT+jVpOX7S2EI
         lIgC8l4vga1JO2z37j+AQkUovcSM19gQqzw8gy/30jAzHQOaLqWtnsSPpvbvcIeNH+h9
         74rQhOWY2u263fTTOiANpFrjwpSSvhwmL9CNOSo+lEtFGo8gO8fmu7Rm3hRJ+zzwbBVT
         ayE7sjkvvBerokbrw0Ix/OQbhFLGIbW7s8/Rl0LPjpB14qnUhmemLAN5FJhVyszIhXIU
         0YXVziOt455Ri//cMsO5eS0cSO+llhe3ew33UoqmkQZqpDE/WfvhgXt927hXTkft28Mo
         t2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zhPgvRrAqicIPz6pRORMT9ANciXinEc+85EuomZ8teM=;
        b=Ozl4mSFNTc8Ie4H0M7+6p5lYxAso8mCJLYjjNhiALeZsWS3MmPer/9PTlSWEOUt6+v
         7wLs4hGcGjolLz6BYKSIHkIHH+rr4VoE+JdhTsiUD0JU/sQU0IgG9dQlBmbiKXxvKyLa
         q8sMbM3BNKj7AJvg5ZnUmnmRvq2KwgPa/SomGpJGJTW8xeg9+xlrkf2nDOp/CG3QystV
         xaJ8xEQDUIhcyTX8Tq3lH/287of6/I6CuO0y32GFaBb+LB4EVsFHcCXpAWukL257TzEe
         EUZoFv4q9iT40wXCHszE5kGXkH+9HOo8Zfk+TUPOTimwZy1tnE6w3JVBP8XYDxp76KIS
         5YwA==
X-Gm-Message-State: AGi0PuZOyJkkWEvzfuWJyi/GEuq6s1GiIMHLqtLwy3v+rjgAWGF5McEJ
        L5T4pF53tqRuI+XoxEiNoLmwcrVQ
X-Google-Smtp-Source: APiQypJ2TojcKTlrxqWyVPZJQqZzl0cKgfnTO4LSVCN7/1GAjCU5q7Ieo8ZJIkhVO7xrIbKTZvf/MQ==
X-Received: by 2002:a17:90a:ca8f:: with SMTP id y15mr2692629pjt.88.1587676247204;
        Thu, 23 Apr 2020 14:10:47 -0700 (PDT)
Received: from localhost.localdomain (76-14-109-232.rk.wavecable.com. [76.14.109.232])
        by smtp.gmail.com with ESMTPSA id f21sm3563630pfn.71.2020.04.23.14.10.46
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 14:10:46 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 3/5] utils: fix implicit float conversions
Date:   Thu, 23 Apr 2020 14:10:38 -0700
Message-Id: <20200423211040.14275-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200423211040.14275-1-rosenp@gmail.com>
References: <20200423211040.14275-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with -Wfloat-conversion

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/cec-ctl/cec-ctl.cpp                   | 4 ++--
 utils/cec-ctl/cec-pin.cpp                   | 2 +-
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 2 +-
 utils/v4l2-ctl/v4l2-ctl-misc.cpp            | 4 ++--
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp       | 2 +-
 utils/v4l2-ctl/v4l2-ctl-subdev.cpp          | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
index f4133494..ae7b2dba 100644
--- a/utils/cec-ctl/cec-ctl.cpp
+++ b/utils/cec-ctl/cec-ctl.cpp
@@ -1507,8 +1507,8 @@ static void stress_test_power_cycle(struct node &node, unsigned cnt,
 	srandom(seed);
 
 	for (;;) {
-		unsigned usecs1 = mod_usleep ? random() % mod_usleep : sleep_before_on * 1000000;
-		unsigned usecs2 = mod_usleep ? random() % mod_usleep : sleep_before_off * 1000000;
+		unsigned usecs1 = mod_usleep ? random() % mod_usleep : static_cast<unsigned>(sleep_before_on * 1000000);
+		unsigned usecs2 = mod_usleep ? random() % mod_usleep : static_cast<unsigned>(sleep_before_off * 1000000);
 
 		usecs1 += min_usleep;
 		usecs2 += min_usleep;
diff --git a/utils/cec-ctl/cec-pin.cpp b/utils/cec-ctl/cec-pin.cpp
index 0322ad5e..c09d6bbd 100644
--- a/utils/cec-ctl/cec-pin.cpp
+++ b/utils/cec-ctl/cec-pin.cpp
@@ -261,7 +261,7 @@ static void cec_pin_rx_data_bit_was_low(__u64 ev_ts, __u64 usecs, __u64 usecs_mi
 	 * If the low drive starts at the end of a 0 bit, then the actual
 	 * maximum time that the bus can be low is the two summed.
 	 */
-	const unsigned max_low_drive = CEC_TIM_LOW_DRIVE_ERROR_MAX +
+	const unsigned max_low_drive = static_cast<unsigned>(CEC_TIM_LOW_DRIVE_ERROR_MAX) +
 		CEC_TIM_DATA_BIT_0_LOW_MAX + CEC_TIM_MARGIN;
 
 	low_usecs = usecs;
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index 93df7034..561a3376 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -2597,7 +2597,7 @@ static void streamFmt(struct node *node, __u32 pixelformat, __u32 w, __u32 h,
 	char hz[32] = "";
 
 	if (!frame_count)
-		frame_count = f ? 1.0 / fract2f(f) : 10;
+		frame_count = f ? static_cast<unsigned>(1.0f / fract2f(f)) : 10;
 	node->g_fmt(fmt);
 	fmt.s_pixelformat(pixelformat);
 	fmt.s_width(w);
diff --git a/utils/v4l2-ctl/v4l2-ctl-misc.cpp b/utils/v4l2-ctl/v4l2-ctl-misc.cpp
index cb933217..b038cfe9 100644
--- a/utils/v4l2-ctl/v4l2-ctl-misc.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-misc.cpp
@@ -320,7 +320,7 @@ void misc_set(cv4l_fd &_fd)
 		parm.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 		parm.parm.capture.timeperframe.numerator = 1000;
 		parm.parm.capture.timeperframe.denominator =
-			fps * parm.parm.capture.timeperframe.numerator;
+			static_cast<uint32_t>(fps * parm.parm.capture.timeperframe.numerator);
 
 		if (doioctl(fd, VIDIOC_S_PARM, &parm) == 0) {
 			struct v4l2_fract *tf = &parm.parm.capture.timeperframe;
@@ -338,7 +338,7 @@ void misc_set(cv4l_fd &_fd)
 		parm.type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
 		parm.parm.output.timeperframe.numerator = 1000;
 		parm.parm.output.timeperframe.denominator =
-			output_fps * parm.parm.output.timeperframe.numerator;
+			static_cast<uint32_t>(output_fps * parm.parm.output.timeperframe.numerator);
 
 		if (doioctl(fd, VIDIOC_S_PARM, &parm) == 0) {
 			struct v4l2_fract *tf = &parm.parm.output.timeperframe;
diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index 066a336a..6981a3cc 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -569,7 +569,7 @@ static void print_concise_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt,
 	if (!skip_ts && (buf.g_flags() & V4L2_BUF_FLAG_TIMESTAMP_MASK) != V4L2_BUF_FLAG_TIMESTAMP_COPY) {
 		double ts = buf.g_timestamp().tv_sec + buf.g_timestamp().tv_usec / 1000000.0;
 		fprintf(f, " ts: %.06f", ts);
-		if (last_ts)
+		if (last_ts <= 0.0)
 			fprintf(f, " delta: %.03f ms", (ts - last_ts) * 1000.0);
 		last_ts = ts;
 
diff --git a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
index 747f1699..5bd5f57e 100644
--- a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
@@ -487,7 +487,7 @@ void subdev_set(cv4l_fd &_fd)
 			exit(1);
 		}
 		fival.interval.numerator = 1000;
-		fival.interval.denominator = set_fps * fival.interval.numerator;
+		fival.interval.denominator = static_cast<uint32_t>(set_fps * fival.interval.numerator);
 		printf("Note: --set-subdev-fps is only for testing.\n"
 		       "Normally media-ctl is used to configure the video pipeline.\n");
 		printf("ioctl: VIDIOC_SUBDEV_S_FRAME_INTERVAL (pad=%u)\n", fival.pad);
-- 
2.25.3

