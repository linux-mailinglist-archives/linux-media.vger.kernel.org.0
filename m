Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C5D53C6A41
	for <lists+linux-media@lfdr.de>; Tue, 13 Jul 2021 08:09:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232908AbhGMGM0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jul 2021 02:12:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229798AbhGMGMZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jul 2021 02:12:25 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A001C0613DD
        for <linux-media@vger.kernel.org>; Mon, 12 Jul 2021 23:09:36 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id y4so18194919pgl.10
        for <linux-media@vger.kernel.org>; Mon, 12 Jul 2021 23:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o8KZeqsBEznJjP/mCl24qhx2CXl3LbSaA0rRLT197vw=;
        b=dy1NnasazVyM3nHPbr0Tlquut5sqjq4O/ZvnGYjySQvBi1N5xFyFwISoUIzH4pj/Ho
         lmqYs/Sqy8ex9toFTiwIn83DVHe31oCjAe0taQ7xvAhv2Ctgs2MypNHgFVK+QqNAPESY
         IWSyPbRlEKCucZIrY0B7B1QFGCkH2CJlaNkdMGjPGg+NWPUXgINSUnGPCMCBSV7dGm+1
         qxnDJOVPiyunqcaHwbSXAqs2csoemD+lfUgIievqHPZMe5Pqa9vSNQalnwdYyMppTCHD
         bELYEKWtaqsJmMfZ5CKHrPs/7waG5hn2y1QFBaHMQvgmNOZ+gUh4rcQ9VVB0oQlgFm7l
         kvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o8KZeqsBEznJjP/mCl24qhx2CXl3LbSaA0rRLT197vw=;
        b=B+HdpdVY1581iK3D5PKuwH4e2RFQiHgDXAlnhJJac9PzXzqmsOnzQgIhu1wPCpV8Ev
         hN0POQyPMbobJ6nEYdbK4X3XONFBVlaiEDuVOq0gFcE5ckQcBZqZmg6+Vvt5gqvv2wlc
         cO2pwn3x6/2l82v6ELBLFhvYhUamtzK1HmpsrdGPwvuHxfYnET84RHdBKAElwnYiBAMa
         4viLzSu+1bgFLXRlNI1pghZjLrRjxVkDC2Zti58ORQGILpByGOo2Hqs/6L7+wDWWW9xI
         616Xiaamq1oFwMUeWzfplBBWmGPu5GPvYPnZ/E83Oi/nFkCrFZyjNpqexJ0oKW9SM2SN
         OfgQ==
X-Gm-Message-State: AOAM530MDHFl4u2NhQ1Vl/piQRV5UmWb829KXI3IJBgn35Sl/EGjQtnT
        2i708KUGe4ZUNvaMM2BzFsEPtUusbUp+cg==
X-Google-Smtp-Source: ABdhPJza/FRlABh6o5ghryCpb4fX4hp14cX3bHPnDKH+HWRCn+wwXS5ea+XVCvxCJQuGwviwpcpSsQ==
X-Received: by 2002:a63:fa11:: with SMTP id y17mr2839627pgh.128.1626156575701;
        Mon, 12 Jul 2021 23:09:35 -0700 (PDT)
Received: from dbcomp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id a13sm15878362pfl.92.2021.07.12.23.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 23:09:35 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, jaffe1@gmail.com,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v4 1/2] cec: expand Timer Programming tests
Date:   Mon, 12 Jul 2021 23:09:19 -0700
Message-Id: <bf246f22ee256f1c95b997b5124f3ec34a15d792.1626155911.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626155911.git.deborahbrouwer3563@gmail.com>
References: <cover.1626155911.git.deborahbrouwer3563@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Check that Timer Status and Time Cleared Status replies have a valid
operand. Send timers with out-of-range dates and check follower's
response. Send an out-of-range recording sequence and check that the timer
is not set. Send a duplicate timer and check that the timer is not set.
Set overlapping timers and check that the timer overlap warning is set.
In the follower, keep track of timers that have been received and warn
if there may be insufficient space for a programmed recording.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
 utils/cec-compliance/cec-compliance.cpp |   1 +
 utils/cec-compliance/cec-compliance.h   |   1 +
 utils/cec-compliance/cec-test.cpp       | 424 +++++++++++++++++++-----
 utils/cec-follower/cec-follower.cpp     |  54 +++
 utils/cec-follower/cec-follower.h       |  43 +++
 utils/cec-follower/cec-tuner.cpp        | 284 ++++++++++++++--
 6 files changed, 706 insertions(+), 101 deletions(-)

diff --git a/utils/cec-compliance/cec-compliance.cpp b/utils/cec-compliance/cec-compliance.cpp
index 25931259..72199762 100644
--- a/utils/cec-compliance/cec-compliance.cpp
+++ b/utils/cec-compliance/cec-compliance.cpp
@@ -1236,6 +1236,7 @@ int main(int argc, char **argv)
 	node.num_log_addrs = laddrs.num_log_addrs;
 	memcpy(node.log_addr, laddrs.log_addr, laddrs.num_log_addrs);
 	node.adap_la_mask = laddrs.log_addr_mask;
+	node.current_time = time(nullptr);
 
 	printf("Find remote devices:\n");
 	printf("\tPolling: %s\n", ok(poll_remote_devs(&node)));
diff --git a/utils/cec-compliance/cec-compliance.h b/utils/cec-compliance/cec-compliance.h
index 41e2d63d..efc828ce 100644
--- a/utils/cec-compliance/cec-compliance.h
+++ b/utils/cec-compliance/cec-compliance.h
@@ -167,6 +167,7 @@ struct node {
 	__u16 phys_addr;
 	bool in_standby;
 	__u8 prim_devtype;
+	time_t current_time;
 };
 
 struct remote_subtest {
diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index 6c421eed..fc8c32e5 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -13,6 +13,8 @@
 
 #include "cec-compliance.h"
 
+enum Months { Jan = 1, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec };
+
 struct remote_test {
 	const char *name;
 	const unsigned tags;
@@ -112,6 +114,129 @@ static bool rec_status_is_a_valid_error_status(__u8 rec_status)
 	}
 }
 
+static int timer_status_is_valid(const struct cec_msg &msg)
+{
+	__u8 timer_overlap_warning;
+	__u8 media_info;
+	__u8 prog_info;
+	__u8 prog_error;
+	__u8 duration_hr;
+	__u8 duration_min;
+
+	cec_ops_timer_status(&msg, &timer_overlap_warning, &media_info, &prog_info,
+	                     &prog_error, &duration_hr, &duration_min);
+	fail_on_test(media_info > CEC_OP_MEDIA_INFO_NO_MEDIA);
+	if (prog_info)
+		fail_on_test(prog_info < CEC_OP_PROG_INFO_ENOUGH_SPACE ||
+		             prog_info > CEC_OP_PROG_INFO_MIGHT_NOT_BE_ENOUGH_SPACE);
+	else
+		fail_on_test(prog_error < CEC_OP_PROG_ERROR_NO_FREE_TIMER ||
+		             (prog_error > CEC_OP_PROG_ERROR_CLOCK_FAILURE &&
+		              prog_error != CEC_OP_PROG_ERROR_DUPLICATE));
+
+	return OK;
+}
+
+static int timer_cleared_status_is_valid(const struct cec_msg &msg)
+{
+	__u8 timer_cleared_status;
+
+	cec_ops_timer_cleared_status(&msg, &timer_cleared_status);
+	fail_on_test(timer_cleared_status != CEC_OP_TIMER_CLR_STAT_RECORDING &&
+	             timer_cleared_status != CEC_OP_TIMER_CLR_STAT_NO_MATCHING &&
+	             timer_cleared_status != CEC_OP_TIMER_CLR_STAT_NO_INFO &&
+	             timer_cleared_status != CEC_OP_TIMER_CLR_STAT_CLEARED);
+
+	return OK;
+}
+
+static bool timer_has_error(const struct cec_msg &msg)
+{
+	__u8 timer_overlap_warning;
+	__u8 media_info;
+	__u8 prog_info;
+	__u8 prog_error;
+	__u8 duration_hr;
+	__u8 duration_min;
+
+	cec_ops_timer_status(&msg, &timer_overlap_warning, &media_info, &prog_info,
+	                     &prog_error, &duration_hr, &duration_min);
+	if (prog_error)
+		return true;
+
+	return false;
+}
+
+static int send_timer_error(struct node *node, unsigned me, unsigned la, __u8 day, __u8 month,
+                            __u8 start_hr, __u8 start_min, __u8 dur_hr, __u8 dur_min, __u8 rec_seq)
+{
+	struct cec_msg msg;
+	cec_msg_init(&msg, me, la);
+	cec_msg_set_analogue_timer(&msg, true, day, month, start_hr, start_min, dur_hr, dur_min,
+	                           rec_seq, CEC_OP_ANA_BCAST_TYPE_CABLE, 7668, // 479.25 MHz
+	                           node->remote[la].bcast_sys);
+	fail_on_test(!transmit_timeout(node, &msg, 10000));
+	fail_on_test(timed_out(&msg));
+	if (cec_msg_status_is_abort(&msg))
+		fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
+	else
+		fail_on_test(!timer_has_error(msg));
+
+	return OK;
+}
+
+static bool timer_overlap_warning_is_set(const struct cec_msg &msg)
+{
+	__u8 timer_overlap_warning;
+	__u8 media_info;
+	__u8 prog_info;
+	__u8 prog_error;
+	__u8 duration_hr;
+	__u8 duration_min;
+
+	cec_ops_timer_status(&msg, &timer_overlap_warning, &media_info, &prog_info,
+	                     &prog_error, &duration_hr, &duration_min);
+
+	if (timer_overlap_warning)
+		return true;
+
+	return false;
+}
+
+static int send_timer_overlap(struct node *node, unsigned me, unsigned la, __u8 day, __u8 month,
+                              __u8 start_hr, __u8 start_min, __u8 dur_hr, __u8 dur_min, __u8 rec_seq)
+{
+	struct cec_msg msg;
+
+	cec_msg_init(&msg, me, la);
+	cec_msg_set_analogue_timer(&msg, true, day, month, start_hr, start_min, dur_hr, dur_min,
+	                           rec_seq, CEC_OP_ANA_BCAST_TYPE_CABLE, 7668, // 479.25 MHz
+	                           node->remote[la].bcast_sys);
+	fail_on_test(!transmit_timeout(node, &msg, 10000));
+	fail_on_test(timed_out_or_abort(&msg));
+	fail_on_test(timer_has_error(msg));
+	fail_on_test(!timer_overlap_warning_is_set(msg));
+
+	return OK;
+}
+
+static int clear_timer(struct node *node, unsigned me, unsigned la, __u8 day, __u8 month,
+                       __u8 start_hr, __u8 start_min, __u8 dur_hr, __u8 dur_min, __u8 rec_seq)
+{
+	struct cec_msg msg;
+
+	cec_msg_init(&msg, me, la);
+	cec_msg_clear_analogue_timer(&msg, true, day, month, start_hr, start_min, dur_hr, dur_min,
+	                             rec_seq, CEC_OP_ANA_BCAST_TYPE_CABLE, 7668, // 479.25 MHz
+	                             node->remote[la].bcast_sys);
+	fail_on_test(!transmit_timeout(node, &msg, 10000));
+	fail_on_test(timed_out_or_abort(&msg));
+	fail_on_test(timer_has_error(msg));
+	fail_on_test(timer_cleared_status_is_valid(msg));
+
+	return OK;
+}
+
 /* System Information */
 
 int system_info_polling(struct node *node, unsigned me, unsigned la, bool interactive)
@@ -1499,40 +1624,32 @@ static const vec_remote_subtests one_touch_rec_subtests{
 
 /* Timer Programming */
 
-/*
-  TODO: These are very rudimentary tests which should be expanded.
- */
-
 static int timer_prog_set_analog_timer(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	/* TODO: Check the timer status for possible errors, etc. */
-
 	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
-	cec_msg_set_analogue_timer(&msg, true, 1, 1, 0, 0, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
-				     CEC_OP_ANA_BCAST_TYPE_CABLE,
-				     7668, // 479.25 MHz
-				     node->remote[la].bcast_sys);
+	/* Set timer to start tomorrow, at current time, for 2 hr, 30 min. */
+	time_t tomorrow = node->current_time + (24 * 60 * 60);
+	struct tm *t = localtime(&tomorrow);
+	cec_msg_set_analogue_timer(&msg, true, t->tm_mday, t->tm_mon + 1, t->tm_hour, t->tm_min, 2, 30,
+	                           0x7f, CEC_OP_ANA_BCAST_TYPE_CABLE, 7668, // 479.25 MHz
+	                           node->remote[la].bcast_sys);
 	fail_on_test(!transmit_timeout(node, &msg, 10000));
-	if (timed_out(&msg)) {
-		warn("Timed out waiting for Timer Status. Assuming timer was set.\n");
-		return OK_PRESUMED;
-	}
+	fail_on_test(timed_out(&msg));
 	if (unrecognized_op(&msg))
 		return OK_NOT_SUPPORTED;
 	if (refused(&msg))
 		return OK_REFUSED;
 	if (cec_msg_status_is_abort(&msg))
 		return OK_PRESUMED;
+	fail_on_test(timer_status_is_valid(msg));
 
-	return 0;
+	return OK;
 }
 
 static int timer_prog_set_digital_timer(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	/* TODO: Check the timer status for possible errors, etc. */
-
 	struct cec_msg msg;
 	struct cec_op_digital_service_id digital_service_id = {};
 
@@ -1541,77 +1658,73 @@ static int timer_prog_set_digital_timer(struct node *node, unsigned me, unsigned
 	digital_service_id.channel.minor = 1;
 	digital_service_id.dig_bcast_system = node->remote[la].dig_bcast_sys;
 	cec_msg_init(&msg, me, la);
-	cec_msg_set_digital_timer(&msg, true, 1, 1, 0, 0, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
-				    &digital_service_id);
+	/* Set timer to start 2 days from now, at current time, for 4 hr, 30 min. */
+	time_t two_days_ahead = node->current_time + (2 * 24 * 60 * 60);
+	struct tm *t = localtime(&two_days_ahead);
+	cec_msg_set_digital_timer(&msg, true, t->tm_mday, t->tm_mon + 1, t->tm_hour,
+	                          t->tm_min, 4, 30, CEC_OP_REC_SEQ_ONCE_ONLY, &digital_service_id);
 	fail_on_test(!transmit_timeout(node, &msg, 10000));
-	if (timed_out(&msg)) {
-		warn("Timed out waiting for Timer Status. Assuming timer was set.\n");
-		return OK_PRESUMED;
-	}
+	fail_on_test(timed_out(&msg));
 	if (unrecognized_op(&msg))
 		return OK_NOT_SUPPORTED;
 	if (refused(&msg))
 		return OK_REFUSED;
 	if (cec_msg_status_is_abort(&msg))
 		return OK_PRESUMED;
+	fail_on_test(timer_status_is_valid(msg));
 
 	return 0;
 }
 
 static int timer_prog_set_ext_timer(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	/* TODO: Check the timer status. */
-
 	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
-	cec_msg_set_ext_timer(&msg, true, 1, 1, 0, 0, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
-			      CEC_OP_EXT_SRC_PHYS_ADDR, 0, node->phys_addr);
+	/* Set timer to start 3 days from now, at current time, for 6 hr, 30 min. */
+	time_t three_days_ahead = node->current_time + (3 * 24 * 60 * 60);
+	struct tm *t = localtime(&three_days_ahead);
+	cec_msg_set_ext_timer(&msg, true, t->tm_mday, t->tm_mon + 1, t->tm_hour, t->tm_min, 6, 30,
+	                      CEC_OP_REC_SEQ_ONCE_ONLY, CEC_OP_EXT_SRC_PHYS_ADDR, 0, node->phys_addr);
 	fail_on_test(!transmit_timeout(node, &msg, 10000));
-	if (timed_out(&msg)) {
-		warn("Timed out waiting for Timer Status. Assuming timer was set.\n");
-		return OK_PRESUMED;
-	}
+	fail_on_test(timed_out(&msg));
 	if (unrecognized_op(&msg))
 		return OK_NOT_SUPPORTED;
 	if (refused(&msg))
 		return OK_REFUSED;
 	if (cec_msg_status_is_abort(&msg))
 		return OK_PRESUMED;
+	fail_on_test(timer_status_is_valid(msg));
 
 	return 0;
 }
 
 static int timer_prog_clear_analog_timer(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	/* TODO: Check the timer cleared status. */
-
 	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
-	cec_msg_clear_analogue_timer(&msg, true, 1, 1, 0, 0, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
-				     CEC_OP_ANA_BCAST_TYPE_CABLE,
-				     7668, // 479.25 MHz
-				     node->remote[la].bcast_sys);
+	/* Clear timer set to start tomorrow, at current time, for 2 hr, 30 min. */
+	time_t tomorrow = node->current_time + (24 * 60 * 60);
+	struct tm *t = localtime(&tomorrow);
+	cec_msg_clear_analogue_timer(&msg, true, t->tm_mday, t->tm_mon + 1, t->tm_hour, t->tm_min, 2, 30,
+	                             0x7f, CEC_OP_ANA_BCAST_TYPE_CABLE,7668, // 479.25 MHz
+	                             node->remote[la].bcast_sys);
 	fail_on_test(!transmit_timeout(node, &msg, 10000));
-	if (timed_out(&msg)) {
-		warn("Timed out waiting for Timer Cleared Status. Assuming timer was cleared.\n");
-		return OK_PRESUMED;
-	}
+	fail_on_test(timed_out(&msg));
 	if (unrecognized_op(&msg))
 		return OK_NOT_SUPPORTED;
 	if (refused(&msg))
 		return OK_REFUSED;
 	if (cec_msg_status_is_abort(&msg))
 		return OK_PRESUMED;
+	fail_on_test(timer_cleared_status_is_valid(msg));
 
 	return 0;
 }
 
 static int timer_prog_clear_digital_timer(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	/* TODO: Check the timer cleared status. */
-
 	struct cec_msg msg;
 	struct cec_op_digital_service_id digital_service_id = {};
 
@@ -1620,43 +1733,43 @@ static int timer_prog_clear_digital_timer(struct node *node, unsigned me, unsign
 	digital_service_id.channel.minor = 1;
 	digital_service_id.dig_bcast_system = node->remote[la].dig_bcast_sys;
 	cec_msg_init(&msg, me, la);
-	cec_msg_clear_digital_timer(&msg, true, 1, 1, 0, 0, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
-				    &digital_service_id);
+	/* Clear timer set to start 2 days from now, at current time, for 4 hr, 30 min. */
+	time_t two_days_ahead = node->current_time + (2 * 24 * 60 * 60);
+	struct tm *t = localtime(&two_days_ahead);
+	cec_msg_clear_digital_timer(&msg, true, t->tm_mday, t->tm_mon + 1, t->tm_hour,
+	                            t->tm_min, 4, 30, CEC_OP_REC_SEQ_ONCE_ONLY, &digital_service_id);
 	fail_on_test(!transmit_timeout(node, &msg, 10000));
-	if (timed_out(&msg)) {
-		warn("Timed out waiting for Timer Cleared Status. Assuming timer was cleared.\n");
-		return OK_PRESUMED;
-	}
+	fail_on_test(timed_out(&msg));
 	if (unrecognized_op(&msg))
 		return OK_NOT_SUPPORTED;
 	if (refused(&msg))
 		return OK_REFUSED;
 	if (cec_msg_status_is_abort(&msg))
 		return OK_PRESUMED;
+	fail_on_test(timer_cleared_status_is_valid(msg));
 
 	return 0;
 }
 
 static int timer_prog_clear_ext_timer(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	/* TODO: Check the timer cleared status. */
-
 	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
-	cec_msg_clear_ext_timer(&msg, true, 1, 1, 0, 0, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
-				CEC_OP_EXT_SRC_PHYS_ADDR, 0, node->phys_addr);
+	/* Clear timer set to start 3 days from now, at current time, for 6 hr, 30 min. */
+	time_t three_days_ahead = node->current_time + (3 * 24 * 60 * 60);
+	struct tm *t = localtime(&three_days_ahead);
+	cec_msg_clear_ext_timer(&msg, true, t->tm_mday, t->tm_mon + 1, t->tm_hour, t->tm_min, 6, 30,
+	                        CEC_OP_REC_SEQ_ONCE_ONLY, CEC_OP_EXT_SRC_PHYS_ADDR, 0, node->phys_addr);
 	fail_on_test(!transmit_timeout(node, &msg, 10000));
-	if (timed_out(&msg)) {
-		warn("Timed out waiting for Timer Cleared Status. Assuming timer was cleared.\n");
-		return OK_PRESUMED;
-	}
+	fail_on_test(timed_out(&msg));
 	if (unrecognized_op(&msg))
 		return OK_NOT_SUPPORTED;
 	if (refused(&msg))
 		return OK_REFUSED;
 	if (cec_msg_status_is_abort(&msg))
 		return OK_PRESUMED;
+	fail_on_test(timer_cleared_status_is_valid(msg));
 
 	return 0;
 }
@@ -1676,49 +1789,198 @@ static int timer_prog_set_prog_title(struct node *node, unsigned me, unsigned la
 	return OK_PRESUMED;
 }
 
-static int timer_prog_timer_status(struct node *node, unsigned me, unsigned la, bool interactive)
+static int timer_errors(struct node *node, unsigned me, unsigned la, bool interactive)
 {
 	struct cec_msg msg;
 
+	/* Day error: November 31, at 6:00 am, for 1 hr. */
 	cec_msg_init(&msg, me, la);
-	cec_msg_timer_status(&msg, CEC_OP_TIMER_OVERLAP_WARNING_NO_OVERLAP,
-			     CEC_OP_MEDIA_INFO_NO_MEDIA,
-			     CEC_OP_PROG_INFO_ENOUGH_SPACE,
-			     0, 0, 0);
-	fail_on_test(!transmit_timeout(node, &msg));
+	cec_msg_set_analogue_timer(&msg, true, 31, Nov, 6, 0, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
+	                           CEC_OP_ANA_BCAST_TYPE_CABLE, 7668, // 479.25 MHz
+	                           node->remote[la].bcast_sys);
+	fail_on_test(!transmit_timeout(node, &msg, 10000));
+	fail_on_test(timed_out(&msg));
 	if (unrecognized_op(&msg))
 		return OK_NOT_SUPPORTED;
-	if (refused(&msg))
-		return OK_REFUSED;
+	if (cec_msg_status_is_abort(&msg))
+		fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
+	else
+		fail_on_test(!timer_has_error(msg));
 
-	return OK_PRESUMED;
+	/* Day error: December 32, at 6:00 am, for 1 hr. */
+	fail_on_test(send_timer_error(node, me, la, 32, Dec, 6, 0, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY));
+
+	/* Day error: 0, in January, at 6:00 am, for 1 hr. Day range begins at 1. */
+	fail_on_test(send_timer_error(node, me, la, 0, Jan, 6, 0, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY));
+
+	/* Month error: 0, on day 5, at 6:00 am, for 1 hr. CEC month range is 1-12. */
+	fail_on_test(send_timer_error(node, me, la, 5, 0, 6, 0, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY));
+
+	/* Month error: 13, on day 5, at 6:00 am, for 1 hr. */
+	fail_on_test(send_timer_error(node, me, la, 5, 13, 6, 0, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY));
+
+	/* Start hour error: 24 hr, on August 5, for 1 hr. Start hour range is 0-23. */
+	fail_on_test(send_timer_error(node, me, la, 5, Aug, 24, 0, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY));
+
+	/* Start min error: 60 min, on August 5, for 1 hr. Start min range is 0-59. */
+	fail_on_test(send_timer_error(node, me, la, 5, Aug, 0, 60, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY));
+
+	/* Recording duration error: 0 hr, 0 min on August 5, at 6:00am. */
+	fail_on_test(send_timer_error(node, me, la, 5, Aug, 6, 0, 0, 0, CEC_OP_REC_SEQ_ONCE_ONLY));
+
+	/* Duplicate timer error: start 2 hrs from now, for 1 hr. */
+	time_t two_hours_ahead = node->current_time + (2 * 60 * 60);
+	struct tm *t = localtime(&two_hours_ahead);
+	cec_msg_init(&msg, me, la);
+	cec_msg_set_analogue_timer(&msg, true, t->tm_mday, t->tm_mon + 1, t->tm_hour, t->tm_min, 1, 0,
+	                           CEC_OP_REC_SEQ_ONCE_ONLY,CEC_OP_ANA_BCAST_TYPE_CABLE,
+	                           7668, // 479.25 MHz
+	                           node->remote[la].bcast_sys);
+	fail_on_test(!transmit_timeout(node, &msg, 10000));
+	fail_on_test(timed_out_or_abort(&msg));
+	fail_on_test(timer_has_error(msg)); /* The first timer should be set. */
+	fail_on_test(send_timer_error(node, me, la, t->tm_mday, t->tm_mon + 1, t->tm_hour,
+	                              t->tm_min, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY));
+
+	/* Clear the timer that was set to test duplicate timers. */
+	fail_on_test(clear_timer(node, me, la, t->tm_mday, t->tm_mon + 1, t->tm_hour, t->tm_min, 1, 0,
+	                         CEC_OP_REC_SEQ_ONCE_ONLY));
+
+	/* Recording sequence error: 0xff, on August 5, at 6:00 am, for 1 hr. */
+	fail_on_test(send_timer_error(node, me, la, 5, Aug, 6, 0, 1, 0, 0xff));
+
+	/* Error in last day of February, at 6:00 am, for 1 hr. */
+	time_t current_time = node->current_time;
+	t = localtime(&current_time);
+	if ((t->tm_mon + 1) > Feb)
+		t->tm_year++; /* The timer will be for next year. */
+	if (!(t->tm_year % 4) && ((t->tm_year % 100) || !(t->tm_year % 400)))
+		fail_on_test(send_timer_error(node, me, la, 30, Feb, 6, 0, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY));
+	else
+		fail_on_test(send_timer_error(node, me, la, 29, Feb, 6, 0, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY));
+
+	return OK;
 }
 
-static int timer_prog_timer_clear_status(struct node *node, unsigned me, unsigned la, bool interactive)
+static int timer_overlap_warning(struct node *node, unsigned me, unsigned la, bool interactive)
 {
 	struct cec_msg msg;
 
+	time_t tomorrow = node->current_time + (24 * 60 * 60);
+	struct tm *t = localtime(&tomorrow);
+
+	/* No overlap: set timer for tomorrow at 8:00 am for 2 hr. */
 	cec_msg_init(&msg, me, la);
-	cec_msg_timer_cleared_status(&msg, CEC_OP_TIMER_CLR_STAT_CLEARED);
-	fail_on_test(!transmit_timeout(node, &msg));
+	cec_msg_set_analogue_timer(&msg, true, t->tm_mday, t->tm_mon + 1, 8, 0, 2, 0,
+	                           CEC_OP_REC_SEQ_ONCE_ONLY, CEC_OP_ANA_BCAST_TYPE_CABLE,
+	                           7668, // 479.25 MHz
+	                           node->remote[la].bcast_sys);
+	fail_on_test(!transmit_timeout(node, &msg, 10000));
 	if (unrecognized_op(&msg))
 		return OK_NOT_SUPPORTED;
-	if (refused(&msg))
-		return OK_REFUSED;
+	fail_on_test(timed_out_or_abort(&msg));
+	fail_on_test(timer_has_error(msg));
+	fail_on_test(timer_overlap_warning_is_set(msg));
 
-	return OK_PRESUMED;
+	/* No overlap, just adjacent: set timer for tomorrow at 10:00 am for 15 min. */
+	cec_msg_init(&msg, me, la);
+	cec_msg_set_analogue_timer(&msg, true, t->tm_mday, t->tm_mon + 1, 10, 0, 0, 15,
+	                           CEC_OP_REC_SEQ_ONCE_ONLY, CEC_OP_ANA_BCAST_TYPE_CABLE,
+	                           7668, // 479.25 MHz
+	                           node->remote[la].bcast_sys);
+	fail_on_test(!transmit_timeout(node, &msg, 10000));
+	fail_on_test(timed_out_or_abort(&msg));
+	fail_on_test(timer_has_error(msg));
+	fail_on_test(timer_overlap_warning_is_set(msg));
+
+	/* No overlap, just adjacent: set timer for tomorrow at 7:45 am for 15 min. */
+	cec_msg_init(&msg, me, la);
+	cec_msg_set_analogue_timer(&msg, true, t->tm_mday, t->tm_mon + 1, 7, 45, 0, 15,
+	                           CEC_OP_REC_SEQ_ONCE_ONLY, CEC_OP_ANA_BCAST_TYPE_CABLE,
+	                           7668, // 479.25 MHz
+	                           node->remote[la].bcast_sys);
+	fail_on_test(!transmit_timeout(node, &msg, 10000));
+	fail_on_test(timed_out_or_abort(&msg));
+	fail_on_test(timer_has_error(msg));
+	fail_on_test(timer_overlap_warning_is_set(msg));
+
+	/* Overlap tail end: set timer for tomorrow at 9:00 am for 2 hr, repeats on Sun. */
+	fail_on_test(send_timer_overlap(node, me, la, t->tm_mday, t->tm_mon + 1, 9, 0, 2, 0, 0x1));
+
+	/* Overlap front end: set timer for tomorrow at 7:00 am for 1 hr, 30 min. */
+	fail_on_test(send_timer_overlap(node, me, la, t->tm_mday, t->tm_mon + 1, 7, 0, 1, 30, 0x1));
+
+	/* Overlap same start time: set timer for tomorrow at 8:00 am for 30 min. */
+	fail_on_test(send_timer_overlap(node, me, la, t->tm_mday, t->tm_mon + 1, 8, 0, 0, 30, 0x1));
+
+	/* Overlap same end time: set timer for tomorrow at 9:30 am for 30 min. */
+	fail_on_test(send_timer_overlap(node, me, la, t->tm_mday, t->tm_mon + 1, 9, 30, 0, 30, 0x1));
+
+	/* Overlap all timers: set timer for tomorrow at 6:00 am for 6 hr. */
+	fail_on_test(send_timer_overlap(node, me, la, t->tm_mday, t->tm_mon + 1, 6, 0, 6, 0, 0x1));
+
+	/* Clear all the timers. */
+	fail_on_test(clear_timer(node, me, la, t->tm_mday, t->tm_mon + 1, 8, 0, 2, 0,
+	                         CEC_OP_REC_SEQ_ONCE_ONLY));
+	fail_on_test(clear_timer(node, me, la, t->tm_mday, t->tm_mon + 1, 10, 0, 0, 15,
+	                         CEC_OP_REC_SEQ_ONCE_ONLY));
+	fail_on_test(clear_timer(node, me, la, t->tm_mday, t->tm_mon + 1, 7, 45, 0, 15,
+	                         CEC_OP_REC_SEQ_ONCE_ONLY));
+	fail_on_test(clear_timer(node, me, la, t->tm_mday, t->tm_mon + 1, 9, 0, 2, 0, 0x1));
+	fail_on_test(clear_timer(node, me, la, t->tm_mday, t->tm_mon + 1, 7, 0, 1, 30, 0x1));
+	fail_on_test(clear_timer(node, me, la, t->tm_mday, t->tm_mon + 1, 8, 0, 0, 30, 0x1));
+	fail_on_test(clear_timer(node, me, la, t->tm_mday, t->tm_mon + 1, 9, 30, 0, 30, 0x1));
+	fail_on_test(clear_timer(node, me, la, t->tm_mday, t->tm_mon + 1, 6, 0, 6, 0, 0x1));
+
+	return OK;
 }
 
 static const vec_remote_subtests timer_prog_subtests{
-	{ "Set Analogue Timer", CEC_LOG_ADDR_MASK_RECORD, timer_prog_set_analog_timer },
-	{ "Set Digital Timer", CEC_LOG_ADDR_MASK_RECORD, timer_prog_set_digital_timer },
-	{ "Set Timer Program Title", CEC_LOG_ADDR_MASK_RECORD, timer_prog_set_prog_title },
-	{ "Set External Timer", CEC_LOG_ADDR_MASK_RECORD, timer_prog_set_ext_timer },
-	{ "Clear Analogue Timer", CEC_LOG_ADDR_MASK_RECORD, timer_prog_clear_analog_timer },
-	{ "Clear Digital Timer", CEC_LOG_ADDR_MASK_RECORD, timer_prog_clear_digital_timer },
-	{ "Clear External Timer", CEC_LOG_ADDR_MASK_RECORD, timer_prog_clear_ext_timer },
-	{ "Timer Status", CEC_LOG_ADDR_MASK_RECORD, timer_prog_timer_status },
-	{ "Timer Cleared Status", CEC_LOG_ADDR_MASK_RECORD, timer_prog_timer_clear_status },
+	{
+		"Set Analogue Timer",
+		CEC_LOG_ADDR_MASK_RECORD | CEC_LOG_ADDR_MASK_BACKUP,
+		timer_prog_set_analog_timer,
+	},
+	{
+		"Set Digital Timer",
+		CEC_LOG_ADDR_MASK_RECORD | CEC_LOG_ADDR_MASK_BACKUP,
+		timer_prog_set_digital_timer,
+	},
+	{
+		"Set Timer Program Title",
+		CEC_LOG_ADDR_MASK_RECORD | CEC_LOG_ADDR_MASK_BACKUP,
+		timer_prog_set_prog_title,
+	},
+	{
+		"Set External Timer",
+		CEC_LOG_ADDR_MASK_RECORD | CEC_LOG_ADDR_MASK_BACKUP,
+		timer_prog_set_ext_timer,
+	},
+	{
+		"Clear Analogue Timer",
+		CEC_LOG_ADDR_MASK_RECORD | CEC_LOG_ADDR_MASK_BACKUP,
+		timer_prog_clear_analog_timer,
+	},
+	{
+		"Clear Digital Timer",
+		CEC_LOG_ADDR_MASK_RECORD | CEC_LOG_ADDR_MASK_BACKUP,
+		timer_prog_clear_digital_timer,
+	},
+	{
+		"Clear External Timer",
+		CEC_LOG_ADDR_MASK_RECORD | CEC_LOG_ADDR_MASK_BACKUP,
+		timer_prog_clear_ext_timer,
+	},
+	{
+		"Set Timers with Errors",
+		CEC_LOG_ADDR_MASK_RECORD | CEC_LOG_ADDR_MASK_BACKUP,
+		timer_errors,
+	},
+	{
+		"Set Overlapping Timers",
+		CEC_LOG_ADDR_MASK_RECORD | CEC_LOG_ADDR_MASK_BACKUP,
+		timer_overlap_warning,
+	},
 };
 
 static const char *hec_func_state2s(__u8 hfs)
diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
index 2816fb85..b273b988 100644
--- a/utils/cec-follower/cec-follower.cpp
+++ b/utils/cec-follower/cec-follower.cpp
@@ -47,6 +47,7 @@ bool show_msgs;
 bool show_state;
 bool show_warnings = true;
 unsigned warnings;
+std::set<struct Timer> programmed_timers;
 
 static struct option long_options[] = {
 	{ "device", required_argument, nullptr, OptSetDevice },
@@ -296,6 +297,58 @@ int cec_named_ioctl(int fd, const char *name,
 	return retval == -1 ? e : (retval ? -1 : 0);
 }
 
+void print_timers(struct node *node)
+{
+	if (show_info) {
+		printf("Timers Set:\n");
+		for (auto &t : programmed_timers) {
+			std::string start = ctime(&t.start_time);
+			time_t end_time = t.start_time + t.duration;
+			std::string end = ctime(&end_time);
+			/* Remove the seconds because timer is precise only to the minute. */
+			start.erase(16, 3);
+			end.erase(16, 3);
+			/* Remove the new line characters. */
+			start.erase(start.end() - 1);
+			end.erase(end.end() - 1);
+			/* Remove the start year if it is the same as the end year. */
+			if ((start.compare(start.size() - 4, 5, end, end.size() - 4, 5) == 0))
+				start.erase(start.size() - 5, 5);
+			printf("\t%s - %s, ", start.c_str(), end.c_str());
+			/* Find and print the source. */
+			std::string source;
+			switch (t.src.type) {
+			case CEC_OP_RECORD_SRC_OWN:
+				source = "own";
+				break;
+			case CEC_OP_RECORD_SRC_DIGITAL:
+				source = "digital";
+				break;
+			case CEC_OP_RECORD_SRC_ANALOG:
+				source = "analog";
+				break;
+			case CEC_OP_RECORD_SRC_EXT_PLUG:
+				source = "ext plug";
+				break;
+			case CEC_OP_RECORD_SRC_EXT_PHYS_ADDR:
+				source = "ext phy addr";
+				break;
+			default:
+				break;
+			}
+			printf("source: %s, ", source.c_str());
+			if (t.recording_seq)
+				printf("rec-seq: 0x%x, ", t.recording_seq);
+			printf("needs: %ld %s\n", t.duration, "MB."); /* 1MB per second. */
+		}
+		printf("Total media space available for recording: ");
+		if (node->state.media_space_available >= 0)
+			printf("%d MB.\n\n", node->state.media_space_available);
+		else
+			printf("0 MB.\n\n");
+	}
+}
+
 void state_init(struct node &node)
 {
 	if (options[OptStandby])
@@ -319,6 +372,7 @@ void state_init(struct node &node)
 	node.state.deck_skip_start = 0;
 	node.state.one_touch_record_on = false;
 	node.state.record_received_standby = false;
+	node.state.media_space_available = 36000; /* In MB; space for 10 hours @ 1MB/sec */
 	tuner_dev_info_init(&node.state);
 	node.state.last_aud_rate_rx_ts = 0;
 }
diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
index 833dec5e..69c96aa7 100644
--- a/utils/cec-follower/cec-follower.h
+++ b/utils/cec-follower/cec-follower.h
@@ -19,12 +19,16 @@
 
 #include <cec-info.h>
 #include <cec-log.h>
+#include <set>
+#include <ctime>
 
 extern bool show_info;
 extern bool show_msgs;
 extern bool show_state;
 extern bool show_warnings;
 extern unsigned warnings;
+extern std::set<struct Timer> programmed_timers;
+extern void print_timers(struct node *node);
 
 struct state {
 	__u16 active_source_pa;
@@ -55,6 +59,7 @@ struct state {
 	__u64 deck_skip_start;
 	bool one_touch_record_on;
 	bool record_received_standby;
+	int media_space_available;
 	time_t toggle_power_status;
 	__u64 last_aud_rate_rx_ts;
 };
@@ -82,6 +87,44 @@ struct node {
 	unsigned short ignore_opcode[256];
 };
 
+struct Timer {
+	time_t start_time;
+	time_t duration; /* In seconds. */
+	__u8 recording_seq;
+	struct cec_op_record_src src;
+
+	Timer()
+	{
+		start_time = 0;
+		duration = 0;
+		recording_seq = 0;
+		src = {};
+	}
+
+	Timer(const Timer& timer)
+	{
+		start_time = timer.start_time;
+		duration = timer.duration;
+		recording_seq = timer.recording_seq;
+		src = timer.src;
+	}
+
+	bool operator<(const Timer &r) const
+	{
+		return start_time < r.start_time ||
+		       (start_time == r.start_time && duration < r.duration) ||
+		       (start_time == r.start_time && duration == r.duration && src.type < r.src.type) ||
+		       (start_time == r.start_time && duration == r.duration && src.type == r.src.type &&
+		       recording_seq < r.recording_seq);
+	}
+
+	bool operator==(const Timer &right) const
+	{
+		return start_time == right.start_time && duration == right.duration &&
+		       src.type == right.src.type && recording_seq == right.recording_seq;
+	}
+};
+
 struct la_info {
 	__u64 ts;
 	struct {
diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index e1d8b8fc..e3e64a58 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -4,7 +4,6 @@
  */
 
 #include <array>
-#include <ctime>
 #include <string>
 
 #include <sys/ioctl.h>
@@ -17,6 +16,141 @@
 #define TOT_ANALOG_FREQS analog_freqs_khz[0][0].size()
 #define TOT_DIGITAL_CHANS digital_arib_data[0].size() + digital_atsc_data[0].size() + digital_dvb_data[0].size()
 
+enum Months { Jan = 1, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec };
+
+static struct Timer get_timer_from_message(const struct cec_msg &msg)
+{
+	struct Timer timer = {};
+
+	__u8 day = 0;
+	__u8 month = 0;
+	__u8 start_hr = 0;
+	__u8 start_min = 0;
+	__u8 duration_hr = 0;
+	__u8 duration_min = 0;
+	__u8 ext_src_spec = 0;
+	__u8 plug = 0;
+	__u16 phys_addr = 0;
+
+	switch (msg.msg[1]) {
+	case CEC_MSG_CLEAR_ANALOGUE_TIMER:
+	case CEC_MSG_SET_ANALOGUE_TIMER:
+		timer.src.type = CEC_OP_RECORD_SRC_ANALOG;
+		cec_ops_set_analogue_timer(&msg, &day, &month, &start_hr, &start_min,
+		                           &duration_hr, &duration_min, &timer.recording_seq,
+		                           &timer.src.analog.ana_bcast_type, &timer.src.analog.ana_freq,
+		                           &timer.src.analog.bcast_system);
+		break;
+	case CEC_MSG_CLEAR_DIGITAL_TIMER:
+	case CEC_MSG_SET_DIGITAL_TIMER: {
+		struct cec_op_digital_service_id digital = {};
+		timer.src.type = CEC_OP_RECORD_SRC_DIGITAL;
+		timer.src.digital = digital;
+		cec_ops_set_digital_timer(&msg, &day, &month, &start_hr, &start_min,
+		                          &duration_hr, &duration_min, &timer.recording_seq,
+		                          &timer.src.digital);
+		break;
+	}
+	case CEC_MSG_CLEAR_EXT_TIMER:
+	case CEC_MSG_SET_EXT_TIMER: {
+		cec_ops_set_ext_timer(&msg, &day, &month, &start_hr, &start_min,
+		                      &duration_hr, &duration_min, &timer.recording_seq, &ext_src_spec,
+		                      &plug, &phys_addr);
+		if (ext_src_spec == CEC_OP_EXT_SRC_PLUG) {
+			timer.src.type = CEC_OP_RECORD_SRC_EXT_PLUG;
+			timer.src.ext_plug.plug = plug;
+		}
+		if (ext_src_spec == CEC_OP_EXT_SRC_PHYS_ADDR) {
+			timer.src.type = CEC_OP_RECORD_SRC_EXT_PHYS_ADDR;
+			timer.src.ext_phys_addr.phys_addr = phys_addr;
+		}
+		break;
+	}
+	default:
+		break;
+	}
+
+	timer.duration = ((duration_hr * 60) + duration_min) * 60; /* In seconds. */
+
+	/* Use current time in the timer when it is not available from message e.g. year. */
+	time_t current_time = time(nullptr);
+	struct tm *temp = localtime(&current_time);
+	temp->tm_mday = day;
+	temp->tm_mon = month - 1; /* CEC months are 1-12 but struct tm range is 0-11. */
+	temp->tm_hour = start_hr;
+	temp->tm_min = start_min;
+	/*
+	 * Timer precision is only to the minute. Set sec to 0 so that differences in seconds
+	 * do not affect timer comparisons.
+	 */
+	temp->tm_sec = 0;
+	temp->tm_isdst = -1;
+	timer.start_time = mktime(temp);
+
+	return timer;
+}
+
+static bool timer_date_out_of_range(const struct cec_msg &msg, const struct Timer &timer)
+{
+	__u8 day = msg.msg[2];
+	__u8 month = msg.msg[3];
+	/* Hours and minutes are in BCD format */
+	__u8 start_hr = (msg.msg[4] >> 4) * 10 + (msg.msg[4] & 0xf);
+	__u8 start_min = (msg.msg[5] >> 4) * 10 + (msg.msg[5] & 0xf);
+	__u8 duration_hr = (msg.msg[6] >> 4) * 10 + (msg.msg[6] & 0xf);
+	__u8 duration_min = (msg.msg[7] >> 4) * 10 + (msg.msg[7] & 0xf);
+
+	if (start_min > 59 || start_hr > 23 || month > 12 || month == 0 || day > 31 || day == 0 ||
+	    duration_min > 59 || (duration_hr == 0 && duration_min == 0))
+		return true;
+
+	switch (month) {
+	case Apr: case Jun: case Sep: case Nov:
+		if (day > 30)
+			return true;
+		break;
+	case Feb: {
+		struct tm *tp = localtime(&timer.start_time);
+
+		if (!(tp->tm_year % 4) && ((tp->tm_year % 100) || !(tp->tm_year % 400))) {
+			if (day > 29)
+				return true;
+		} else {
+			if (day > 28)
+				return true;
+		}
+		break;
+	}
+	default:
+		break;
+	}
+
+	return false;
+}
+
+static bool timer_overlap(const struct Timer &new_timer)
+{
+	if (programmed_timers.size() == 1)
+		return false;
+
+	time_t new_timer_end = new_timer.start_time + new_timer.duration;
+	for (auto &t : programmed_timers) {
+
+		if (new_timer == t)
+			continue; /* Timer doesn't overlap itself. */
+
+		time_t existing_timer_end = t.start_time + t.duration;
+
+		if ((t.start_time < new_timer.start_time && new_timer.start_time < existing_timer_end) ||
+		    (t.start_time < new_timer_end && new_timer_end < existing_timer_end) ||
+		    (t.start_time == new_timer.start_time || existing_timer_end == new_timer_end) ||
+		    (new_timer.start_time < t.start_time && existing_timer_end < new_timer_end))
+		    return true;
+	}
+
+	return false;
+}
+
 struct service_info {
 	unsigned tsid;
 	unsigned onid;
@@ -738,39 +872,149 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
 		return;
 
 
-		/*
-		  Timer Programming
-
-		  This is only a basic implementation.
-
-		  TODO/Ideas:
-		  - Act like an actual recording device; keep track of recording
-		    schedule and act correctly when colliding timers are set.
-		  - Emulate a finite storage space for recordings
-		 */
+		/* Timer Programming */
 
 	case CEC_MSG_SET_ANALOGUE_TIMER:
 	case CEC_MSG_SET_DIGITAL_TIMER:
-	case CEC_MSG_SET_EXT_TIMER:
-		if (!cec_has_record(1 << me))
+	case CEC_MSG_SET_EXT_TIMER: {
+		if (type != CEC_LOG_ADDR_TYPE_RECORD)
 			break;
+
+		__u8 prog_error = 0;
+		__u8 prog_info = 0;
+		__u8 timer_overlap_warning = CEC_OP_TIMER_OVERLAP_WARNING_NO_OVERLAP;
+		__u8 available_space_hr = 0;
+		__u8 available_space_min = 0;
+		struct Timer timer = get_timer_from_message(msg);
+
+		/* If timer starts in the past, increment the year so that timers can be set across year-end. */
+		if (time(nullptr) > timer.start_time) {
+			struct tm *temp = localtime(&timer.start_time);
+			temp->tm_year++;
+			temp->tm_isdst = -1;
+			timer.start_time = mktime(temp);
+		}
+
+		if (timer_date_out_of_range(msg, timer))
+			prog_error = CEC_OP_PROG_ERROR_DATE_OUT_OF_RANGE;
+
+		if (timer.recording_seq > 0x7f)
+			prog_error = CEC_OP_PROG_ERROR_REC_SEQ_ERROR;
+
+		if (programmed_timers.find(timer) != programmed_timers.end())
+			prog_error = CEC_OP_PROG_ERROR_DUPLICATE;
+
+		if (!prog_error) {
+			programmed_timers.insert(timer);
+
+			if (timer_overlap(timer))
+				timer_overlap_warning = CEC_OP_TIMER_OVERLAP_WARNING_OVERLAP;
+
+			if (node->state.media_space_available <= 0 ||
+			    timer.duration > node->state.media_space_available) {
+				prog_info = CEC_OP_PROG_INFO_NOT_ENOUGH_SPACE;
+			} else {
+				int space_that_may_be_needed = 0;
+				for (auto &t : programmed_timers) {
+					space_that_may_be_needed += t.duration;
+					if (t == timer) /* Only count the space up to and including the new timer. */
+						break;
+				}
+				if ((node->state.media_space_available - space_that_may_be_needed) >= 0)
+					prog_info = CEC_OP_PROG_INFO_ENOUGH_SPACE;
+				else
+					prog_info = CEC_OP_PROG_INFO_MIGHT_NOT_BE_ENOUGH_SPACE;
+			}
+			print_timers(node);
+		}
+
+		if (prog_info == CEC_OP_PROG_INFO_NOT_ENOUGH_SPACE ||
+		    prog_info == CEC_OP_PROG_INFO_MIGHT_NOT_BE_ENOUGH_SPACE ||
+		    prog_error == CEC_OP_PROG_ERROR_DUPLICATE) {
+			available_space_hr = node->state.media_space_available / 3600; /* 3600 MB/hour */
+			available_space_min = (node->state.media_space_available % 3600) / 60; /* 60 MB/min */
+		}
 		cec_msg_set_reply_to(&msg, &msg);
-		cec_msg_timer_status(&msg, CEC_OP_TIMER_OVERLAP_WARNING_NO_OVERLAP,
-				     CEC_OP_MEDIA_INFO_NO_MEDIA,
-				     CEC_OP_PROG_INFO_ENOUGH_SPACE, 0, 0, 0);
+		cec_msg_timer_status(&msg, timer_overlap_warning, CEC_OP_MEDIA_INFO_UNPROT_MEDIA,
+		                     prog_info, prog_error, available_space_hr, available_space_min);
 		transmit(node, &msg);
 		return;
+	}
 	case CEC_MSG_CLEAR_ANALOGUE_TIMER:
 	case CEC_MSG_CLEAR_DIGITAL_TIMER:
-	case CEC_MSG_CLEAR_EXT_TIMER:
-		if (!cec_has_record(1 << me))
+	case CEC_MSG_CLEAR_EXT_TIMER: {
+		if (type != CEC_LOG_ADDR_TYPE_RECORD)
 			break;
+
+		__u8 timer_cleared_status = CEC_OP_TIMER_CLR_STAT_NO_MATCHING;
+
+		/* Look for timer in the previous year which have persisted across year-end. */
+		struct Timer timer_in_previous_year = get_timer_from_message(msg);
+		struct tm *temp = localtime(&timer_in_previous_year.start_time);
+		temp->tm_year--;
+		temp->tm_isdst = -1;
+		timer_in_previous_year.start_time = mktime(temp);
+		auto it_previous_year = programmed_timers.find(timer_in_previous_year);
+
+		if (it_previous_year != programmed_timers.end()) {
+			if (node->state.one_touch_record_on && it_previous_year == programmed_timers.begin()) {
+				timer_cleared_status = CEC_OP_TIMER_CLR_STAT_RECORDING;
+				node->state.one_touch_record_on = false;
+			} else {
+				timer_cleared_status = CEC_OP_TIMER_CLR_STAT_CLEARED;
+			}
+			programmed_timers.erase(timer_in_previous_year);
+			print_timers(node);
+		}
+
+		/* Look for timer in the current year. */
+		struct Timer timer_in_current_year = get_timer_from_message(msg);
+		auto it_current_year = programmed_timers.find(timer_in_current_year);
+
+		if (it_current_year != programmed_timers.end()) {
+			if (node->state.one_touch_record_on && it_current_year == programmed_timers.begin()) {
+				timer_cleared_status = CEC_OP_TIMER_CLR_STAT_RECORDING;
+				node->state.one_touch_record_on = false;
+			} else {
+				/* Do not overwrite status if already set. */
+				if (timer_cleared_status == CEC_OP_TIMER_CLR_STAT_NO_MATCHING)
+					timer_cleared_status = CEC_OP_TIMER_CLR_STAT_CLEARED;
+			}
+			programmed_timers.erase(timer_in_current_year);
+			print_timers(node);
+		}
+
+		/* Look for timer in the next year. */
+		struct Timer timer_in_next_year = get_timer_from_message(msg);
+		temp = localtime(&timer_in_next_year.start_time);
+		temp->tm_year++;
+		temp->tm_isdst = -1;
+		timer_in_next_year.start_time = mktime(temp);
+		if (programmed_timers.find(timer_in_next_year) != programmed_timers.end()) {
+			/* Do not overwrite status if already set. */
+			if (timer_cleared_status == CEC_OP_TIMER_CLR_STAT_NO_MATCHING)
+				timer_cleared_status = CEC_OP_TIMER_CLR_STAT_CLEARED;
+			programmed_timers.erase(timer_in_next_year);
+			print_timers(node);
+		}
 		cec_msg_set_reply_to(&msg, &msg);
-		cec_msg_timer_cleared_status(&msg, CEC_OP_TIMER_CLR_STAT_CLEARED);
+		cec_msg_timer_cleared_status(&msg, timer_cleared_status);
 		transmit(node, &msg);
+		/*
+		 * If the cleared timer was recording, and standby was received during recording,
+		 * enter standby when the recording stops unless recording device is the active source.
+		 */
+		if (timer_cleared_status == CEC_OP_TIMER_CLR_STAT_RECORDING) {
+			if (node->state.record_received_standby) {
+				if (node->phys_addr != node->state.active_source_pa)
+					enter_standby(node);
+				node->state.record_received_standby = false;
+			}
+		}
 		return;
+	}
 	case CEC_MSG_SET_TIMER_PROGRAM_TITLE:
-		if (!cec_has_record(1 << me))
+		if (type != CEC_LOG_ADDR_TYPE_RECORD)
 			break;
 		return;
 	case CEC_MSG_TIMER_CLEARED_STATUS:
-- 
2.25.1

