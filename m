Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74C0C2711CE
	for <lists+linux-media@lfdr.de>; Sun, 20 Sep 2020 04:50:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbgITCuB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Sep 2020 22:50:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726760AbgITCuB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Sep 2020 22:50:01 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F54FC061755
        for <linux-media@vger.kernel.org>; Sat, 19 Sep 2020 19:50:01 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id u9so5095411plk.4
        for <linux-media@vger.kernel.org>; Sat, 19 Sep 2020 19:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O5HouA/r0djYPn/dBGNBtvCej+q+mrrwYHmBvsQmNCw=;
        b=o+C/kzdreelzzI6sXPP9hbg7UYLWZRJzZbwZXlpTG+Bv9txAG4RVJwy3KNcNVaIuK2
         n+jRh+azGR9c1NgfXR3hcnOznkCsq67Bng9iKsMJoga0vggJXQqfqQwEepo+Lety7MRO
         h9zbrgTH7l6YsD16G+KCqBKw9yCSYrI4RkqGsWLoHbqRBTLS84rmTVGECHA1tEfeD2JT
         8N3q/9Kw42Z9o9xd9OmNrpmz4TifWr/RGJOxe+KVjetxTt9YIAPeEBd+Es6avMZg6Uyb
         yOnXOKgB48eFwtklSMnK+WrhS8sQdkm0J/O7lBbCG1GtJ8tZQWcOdBdWZ69c8pwduxIG
         hehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O5HouA/r0djYPn/dBGNBtvCej+q+mrrwYHmBvsQmNCw=;
        b=irqcloQgOXiBVfcgw8XFRKPYKZkvivHgPwiPeb3QWGLNHkUMElVfTToFsoV3mNVXvu
         ukni7j8ckwyxKROY72IjJYuHKHYJjrFPVr8NVmCXFGFDtUV+H/SKaECvWUekeVudDkpH
         /YZ+Ndzs5Bb8nNJ8FQR1uXleVBL6k8YJYNCcv5/vX3aLz9tAh/DwnMkeEopeqdCUwXM5
         We2hOqoo9IUWpaoYf9NWwXcnfxZRssgzKnxvnuo57oQ6AK79J4p/CzYlATfyjZwyxlRM
         zO+NOz5c0VXp8auypp42wwcTK7Agddn3zxTQFAZeODXpppU9mcx5z/viA2kvN+6ebn9L
         9oKA==
X-Gm-Message-State: AOAM532laCuimAyt3oDTxrTKgR+ZJyBf6R63wQxtPOc6uNKp4VjYqJ3z
        6sHEdKX4ZZWY4Ds/t8aOqmOPDeHp0vGFBA==
X-Google-Smtp-Source: ABdhPJwayz/n4cZlVOUNQXPNIOm/qmla2KlIexkVjJtq6sEADA0+AD2sXFWrP/2ur+GwBP/w9oldnA==
X-Received: by 2002:a17:902:6bc9:b029:d0:cb2d:f272 with SMTP id m9-20020a1709026bc9b02900d0cb2df272mr39487754plt.11.1600570200615;
        Sat, 19 Sep 2020 19:50:00 -0700 (PDT)
Received: from mangix-trapnet.lan ([2001:470:1f05:79e::a89])
        by smtp.gmail.com with ESMTPSA id bx18sm6814197pjb.6.2020.09.19.19.49.59
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2020 19:49:59 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/2] cppcheck: turn several references to const
Date:   Sat, 19 Sep 2020 19:49:57 -0700
Message-Id: <20200920024958.8203-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with constParameter

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/cec-ctl/cec-ctl.cpp                    | 18 +++++++++---------
 utils/qvidcap/capture.cpp                    |  4 ++--
 utils/v4l2-compliance/v4l2-test-controls.cpp |  4 ++--
 utils/v4l2-ctl/v4l2-ctl-selection.cpp        |  4 ++--
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp        |  4 ++--
 5 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
index 8fe1c5284..2ee88ec9e 100644
--- a/utils/cec-ctl/cec-ctl.cpp
+++ b/utils/cec-ctl/cec-ctl.cpp
@@ -791,7 +791,7 @@ static void show_msg(const cec_msg &msg)
 		       status.c_str());
 }
 
-static void wait_for_msgs(struct node &node, __u32 monitor_time)
+static void wait_for_msgs(const struct node &node, __u32 monitor_time)
 {
 	fd_set rd_fds;
 	fd_set ex_fds;
@@ -836,7 +836,7 @@ static void wait_for_msgs(struct node &node, __u32 monitor_time)
 
 #define MONITOR_FL_DROPPED_EVENTS     (1 << 16)
 
-static void monitor(struct node &node, __u32 monitor_time, const char *store_pin)
+static void monitor(const struct node &node, __u32 monitor_time, const char *store_pin)
 {
 	__u32 monitor = CEC_MODE_MONITOR;
 	fd_set rd_fds;
@@ -1057,7 +1057,7 @@ err:
 	std::exit(EXIT_FAILURE);
 }
 
-static bool wait_for_pwr_state(struct node &node, unsigned from,
+static bool wait_for_pwr_state(const struct node &node, unsigned from,
 			       unsigned &hpd_is_low_cnt, bool on)
 {
 	struct cec_msg msg;
@@ -1116,18 +1116,18 @@ static bool wait_for_pwr_state(struct node &node, unsigned from,
 	return pwr == (on ? CEC_OP_POWER_STATUS_ON : CEC_OP_POWER_STATUS_STANDBY);
 }
 
-static bool wait_for_power_on(struct node &node, unsigned from)
+static bool wait_for_power_on(const struct node &node, unsigned from)
 {
 	unsigned hpd_is_low_cnt = 0;
 	return wait_for_pwr_state(node, from, hpd_is_low_cnt, true);
 }
 
-static bool wait_for_power_off(struct node &node, unsigned from, unsigned &hpd_is_low_cnt)
+static bool wait_for_power_off(const struct node &node, unsigned from, unsigned &hpd_is_low_cnt)
 {
 	return wait_for_pwr_state(node, from, hpd_is_low_cnt, false);
 }
 
-static int transmit_msg_retry(struct node &node, struct cec_msg &msg)
+static int transmit_msg_retry(const struct node &node, struct cec_msg &msg)
 {
 	bool from_unreg = cec_msg_initiator(&msg) == CEC_LOG_ADDR_UNREGISTERED;
 	unsigned cnt = 0;
@@ -1144,7 +1144,7 @@ static int transmit_msg_retry(struct node &node, struct cec_msg &msg)
 	return ret;
 }
 
-static int init_power_cycle_test(struct node &node, unsigned repeats, unsigned max_tries)
+static int init_power_cycle_test(const struct node &node, unsigned repeats, unsigned max_tries)
 {
 	struct cec_msg msg;
 	unsigned from;
@@ -1261,7 +1261,7 @@ static int init_power_cycle_test(struct node &node, unsigned repeats, unsigned m
 	return from;
 }
 
-static void test_power_cycle(struct node &node, unsigned int max_tries,
+static void test_power_cycle(const struct node &node, unsigned int max_tries,
 			     unsigned int retry_sleep)
 {
 	struct cec_log_addrs laddrs = { };
@@ -1476,7 +1476,7 @@ static void test_power_cycle(struct node &node, unsigned int max_tries,
 		printf("Test had %u failure%s\n", failures, failures == 1 ? "" : "s");
 }
 
-static void stress_test_power_cycle(struct node &node, unsigned cnt,
+static void stress_test_power_cycle(const struct node &node, unsigned cnt,
 				    unsigned min_sleep, unsigned max_sleep, unsigned max_tries,
 				    bool has_seed, unsigned seed, unsigned repeats,
 				    double sleep_before_on, double sleep_before_off)
diff --git a/utils/qvidcap/capture.cpp b/utils/qvidcap/capture.cpp
index 556e35e43..3941d6018 100644
--- a/utils/qvidcap/capture.cpp
+++ b/utils/qvidcap/capture.cpp
@@ -543,7 +543,7 @@ void CaptureWin::mouseDoubleClickEvent(QMouseEvent * e)
 	toggleFullScreen();
 }
 
-void CaptureWin::cycleMenu(__u32 &overrideVal, __u32 &origVal,
+void CaptureWin::cycleMenu(__u32 &overrideVal, const __u32 &origVal,
 			     const __u32 values[], bool hasShift, bool hasCtrl)
 {
 	unsigned i;
@@ -1106,7 +1106,7 @@ bool CaptureWin::setV4LFormat(cv4l_fmt &fmt)
 	return true;
 }
 
-void CaptureWin::setPixelAspect(v4l2_fract &pixelaspect)
+void CaptureWin::setPixelAspect(const v4l2_fract &pixelaspect)
 {
 	m_pixelaspect = pixelaspect;
 }
diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
index fcc42cdfb..4faa538f5 100644
--- a/utils/v4l2-compliance/v4l2-test-controls.cpp
+++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
@@ -345,7 +345,7 @@ int testQueryControls(struct node *node)
 	return 0;
 }
 
-static int checkSimpleCtrl(struct v4l2_control &ctrl, struct test_query_ext_ctrl &qctrl)
+static int checkSimpleCtrl(const struct v4l2_control &ctrl, const struct test_query_ext_ctrl &qctrl)
 {
 	if (ctrl.id != qctrl.id)
 		return fail("control id mismatch\n");
@@ -524,7 +524,7 @@ int testSimpleControls(struct node *node)
 	return 0;
 }
 
-static int checkExtendedCtrl(struct v4l2_ext_control &ctrl, struct test_query_ext_ctrl &qctrl)
+static int checkExtendedCtrl(const struct v4l2_ext_control &ctrl, const struct test_query_ext_ctrl &qctrl)
 {
 	int len;
 
diff --git a/utils/v4l2-ctl/v4l2-ctl-selection.cpp b/utils/v4l2-ctl/v4l2-ctl-selection.cpp
index 1665607e6..c4ede272c 100644
--- a/utils/v4l2-ctl/v4l2-ctl-selection.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-selection.cpp
@@ -69,7 +69,7 @@ void selection_usage()
 	       );
 }
 
-static void do_crop(int fd, unsigned int set_crop, struct v4l2_rect &vcrop, v4l2_buf_type type)
+static void do_crop(int fd, unsigned int set_crop, const struct v4l2_rect &vcrop, v4l2_buf_type type)
 {
 	struct v4l2_crop in_crop;
 
@@ -125,7 +125,7 @@ static void parse_crop(char *optarg, unsigned int &set_crop, v4l2_rect &vcrop)
 	}
 }
 
-static void do_selection(int fd, unsigned int set_selection, struct v4l2_selection &vsel,
+static void do_selection(int fd, unsigned int set_selection, const struct v4l2_selection &vsel,
 			 v4l2_buf_type type)
 {
 	struct v4l2_selection in_selection;
diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index 04af717ea..0f34b3e6e 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -2211,7 +2211,7 @@ static int capture_setup(cv4l_fd &fd, cv4l_queue &in, cv4l_fd *exp_fd, cv4l_fmt
 
 static void stateful_m2m(cv4l_fd &fd, cv4l_queue &in, cv4l_queue &out,
 			 FILE *fin, FILE *fout, cv4l_fmt &fmt_in,
-			 cv4l_fmt &fmt_out, cv4l_fd *exp_fd_p)
+			 const cv4l_fmt &fmt_out, cv4l_fd *exp_fd_p)
 {
 	int fd_flags = fcntl(fd.g_fd(), F_GETFL);
 	fps_timestamps fps_ts[2];
@@ -2411,7 +2411,7 @@ static void stateful_m2m(cv4l_fd &fd, cv4l_queue &in, cv4l_queue &out,
 
 static void stateless_m2m(cv4l_fd &fd, cv4l_queue &in, cv4l_queue &out,
 			  FILE *fin, FILE *fout, cv4l_fmt &fmt_in,
-			  cv4l_fmt &fmt_out, cv4l_fd *exp_fd_p)
+			  const cv4l_fmt &fmt_out, cv4l_fd *exp_fd_p)
 {
 	fps_timestamps fps_ts[2];
 	unsigned count[2] = { 0, 0 };
-- 
2.26.2

