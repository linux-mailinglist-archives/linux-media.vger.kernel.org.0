Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 574E51B3403
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 02:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbgDVAhs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 20:37:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726407AbgDVAhr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 20:37:47 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54502C0610D6
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2020 17:37:47 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id a5so116052pjh.2
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2020 17:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DDCReULhAZqwiOO+lYG2DBtAycE2eLUNBrl8041Cchc=;
        b=aEI6j8uWpieHod9mmtFnCSL3lD6L76uhGKQnrq7s2C08zj4qwqR6FzupJUijqMuhRc
         /FFlVOQXlCMuNn6oIvaaXtsXXEWYZw1YDm/G8OYeCD96XmM4oJPP5Mv2x5VMiBFBwsbT
         xMHrk/gTw23PcmgZJWzn55fQ3OZ1OhsAI07kUZv8z0UwY7PG/VhXN6PdVyiAvV78wH6T
         bdCuuVISSbBMiTBpRLPudsBWBlZUmkSQSV3BPhpX6N6MS/Pm/7ScdlSzbYzrUlA5627H
         qweVbOXoTgLsF/AMxn5VXKgs4480lWogRol31ORxACPRcX/+4wPta6n6Jj0RKIAY+tbb
         Hofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DDCReULhAZqwiOO+lYG2DBtAycE2eLUNBrl8041Cchc=;
        b=ewrSXiEl4+98eIkeABy8I5X5Ms2vPLyAROBKBDp3f1DzASDqjtx7RovbUsJTQyoX5u
         NV0RoN9giI5VTRC+PYABGiGcmR3p1veFJJJfBKw60BH9uMUS2sKSeCjNaW74itUAaAMW
         wDJkWUj2eM7VXYLj4ZSD/w2qQS2TZFhYyUFFXQ655YXajOtg68zLEviN94Gfw28TeeFO
         CSAhrlh/2tUV8KLaJzPfiCApgBYdgsfts3QmmFzbQZQ1E5Vs5PWvrRKqPS7CB7xPOA3C
         xujaEXA/6/xqON4KuMdiZFkOS/vdPlwwLtQz+7nFu84qhjwB8ZXVonSmSXFoyG+wHbeq
         Ea/Q==
X-Gm-Message-State: AGi0PuZabeGbyHxzwL0REPrDQp2Yi92ng+A3eehAcOdfgUwsZA9w9HN4
        SDTydZlYmThU6CO83NUHsEti84Bj
X-Google-Smtp-Source: APiQypIAPhn8S8NtyCWpY/f34rHpUri8bRbR/UEZM5L3NKXN4wYDBYQhoNYTecC9F6whRcxJWfP01Q==
X-Received: by 2002:a17:90a:a484:: with SMTP id z4mr8511578pjp.40.1587515866511;
        Tue, 21 Apr 2020 17:37:46 -0700 (PDT)
Received: from localhost.localdomain (76-14-109-232.rk.wavecable.com. [76.14.109.232])
        by smtp.gmail.com with ESMTPSA id y16sm1359676pfp.45.2020.04.21.17.37.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 17:37:46 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 09/12] utils: fix implicit float conversions
Date:   Tue, 21 Apr 2020 17:37:32 -0700
Message-Id: <20200422003735.3891-9-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200422003735.3891-1-rosenp@gmail.com>
References: <20200422003735.3891-1-rosenp@gmail.com>
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
index f4133494..f0e31aca 100644
--- a/utils/cec-ctl/cec-ctl.cpp
+++ b/utils/cec-ctl/cec-ctl.cpp
@@ -1507,8 +1507,8 @@ static void stress_test_power_cycle(struct node &node, unsigned cnt,
 	srandom(seed);
 
 	for (;;) {
-		unsigned usecs1 = mod_usleep ? random() % mod_usleep : sleep_before_on * 1000000;
-		unsigned usecs2 = mod_usleep ? random() % mod_usleep : sleep_before_off * 1000000;
+		unsigned usecs1 = mod_usleep ? random() % mod_usleep : (unsigned)(sleep_before_on * 1000000);
+		unsigned usecs2 = mod_usleep ? random() % mod_usleep : (unsigned)(sleep_before_off * 1000000);
 
 		usecs1 += min_usleep;
 		usecs2 += min_usleep;
diff --git a/utils/cec-ctl/cec-pin.cpp b/utils/cec-ctl/cec-pin.cpp
index 0322ad5e..10abea37 100644
--- a/utils/cec-ctl/cec-pin.cpp
+++ b/utils/cec-ctl/cec-pin.cpp
@@ -261,7 +261,7 @@ static void cec_pin_rx_data_bit_was_low(__u64 ev_ts, __u64 usecs, __u64 usecs_mi
 	 * If the low drive starts at the end of a 0 bit, then the actual
 	 * maximum time that the bus can be low is the two summed.
 	 */
-	const unsigned max_low_drive = CEC_TIM_LOW_DRIVE_ERROR_MAX +
+	const unsigned max_low_drive = (unsigned)CEC_TIM_LOW_DRIVE_ERROR_MAX +
 		CEC_TIM_DATA_BIT_0_LOW_MAX + CEC_TIM_MARGIN;
 
 	low_usecs = usecs;
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index 93df7034..87c2e523 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -2597,7 +2597,7 @@ static void streamFmt(struct node *node, __u32 pixelformat, __u32 w, __u32 h,
 	char hz[32] = "";
 
 	if (!frame_count)
-		frame_count = f ? 1.0 / fract2f(f) : 10;
+		frame_count = f ? (unsigned)(1.0f / fract2f(f)) : 10;
 	node->g_fmt(fmt);
 	fmt.s_pixelformat(pixelformat);
 	fmt.s_width(w);
diff --git a/utils/v4l2-ctl/v4l2-ctl-misc.cpp b/utils/v4l2-ctl/v4l2-ctl-misc.cpp
index cb933217..2851886a 100644
--- a/utils/v4l2-ctl/v4l2-ctl-misc.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-misc.cpp
@@ -320,7 +320,7 @@ void misc_set(cv4l_fd &_fd)
 		parm.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 		parm.parm.capture.timeperframe.numerator = 1000;
 		parm.parm.capture.timeperframe.denominator =
-			fps * parm.parm.capture.timeperframe.numerator;
+			(uint32_t)(fps * parm.parm.capture.timeperframe.numerator);
 
 		if (doioctl(fd, VIDIOC_S_PARM, &parm) == 0) {
 			struct v4l2_fract *tf = &parm.parm.capture.timeperframe;
@@ -338,7 +338,7 @@ void misc_set(cv4l_fd &_fd)
 		parm.type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
 		parm.parm.output.timeperframe.numerator = 1000;
 		parm.parm.output.timeperframe.denominator =
-			output_fps * parm.parm.output.timeperframe.numerator;
+			(uint32_t)(output_fps * parm.parm.output.timeperframe.numerator);
 
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
index 747f1699..f1223084 100644
--- a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
@@ -487,7 +487,7 @@ void subdev_set(cv4l_fd &_fd)
 			exit(1);
 		}
 		fival.interval.numerator = 1000;
-		fival.interval.denominator = set_fps * fival.interval.numerator;
+		fival.interval.denominator = (uint32_t)(set_fps * fival.interval.numerator);
 		printf("Note: --set-subdev-fps is only for testing.\n"
 		       "Normally media-ctl is used to configure the video pipeline.\n");
 		printf("ioctl: VIDIOC_SUBDEV_S_FRAME_INTERVAL (pad=%u)\n", fival.pad);
-- 
2.25.2

