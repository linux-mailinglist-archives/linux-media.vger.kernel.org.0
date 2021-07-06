Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE5BD3BC5D3
	for <lists+linux-media@lfdr.de>; Tue,  6 Jul 2021 06:55:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230029AbhGFE5x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jul 2021 00:57:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbhGFE5w (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jul 2021 00:57:52 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6337C061574
        for <linux-media@vger.kernel.org>; Mon,  5 Jul 2021 21:55:14 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id f5so10949489pgv.3
        for <linux-media@vger.kernel.org>; Mon, 05 Jul 2021 21:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8A5Ep3rYIGeAZi+Q/CdG9TCi8OZyU9HYP7RBqwTiPPw=;
        b=BmqKNxomcZwlQtsTjzrAucIVrJdcDvLGpQSlQxzZO+NnEt+PBMBX87p2HRlmNXUAXb
         zbpY3/dZa7UO62VURAP9Db5Q/WdiHuemDRpKAI05ohriYGbPkJ+U0pu0VZLH76cw4BYU
         0Jsn57DdX0gPUzryOnmLuzxXLsvmZXTL7rpmjJ5WZrwC+krEROVfy9VuRJo1SW5QPPPM
         hM8Avq3KsJgH1CXQR6AjlZ/PfYdWvv94wUaBsYi6ZNCxA3+lyjYEY3x2mDM/JBL3GFkU
         pWJLZz15ooCoyezVIBSiX0qZGYDOLPUkJX8K46e6rpyZgKR1GguuCsFyvaQZooIElHa0
         /4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8A5Ep3rYIGeAZi+Q/CdG9TCi8OZyU9HYP7RBqwTiPPw=;
        b=kffFQqXp/I8IYuXogYPAlGMgPY2sqzjP0eJwxyoCUbLFVC1F3KCdxZ1wHPw3CC4I0V
         Db2+NXCZl/wj5uBlmG542krMlTiMzk6khlPQCd0XGFAVTXQHJZnBZ9ETidZRDCxDy0eB
         VWVKLHRlE83hKUE3UrNwbJHloCe6Y3HGr/8pBgGWlbqbD3l2Jf0xFpbdvItK6uAUvETY
         1IKHfvwowM7FDV0SpZbzS2nDwWZZ+NxPoETFBTbZ5o9/OvvC9N1x+7bWjBPLMoy9jNV5
         Dz4KiPLzBZxjT3N9GtkUcZBExgCRwUSjUmeQd5alyxCS4twtRjXSG/Mjlqq5OpKgBGmb
         9qjQ==
X-Gm-Message-State: AOAM5304bXGPIsYgESrUJuj11vNaiEdc50ORm57B+1tDMOEaRn51z7mp
        daNelr6vxURd29BVPkFvQ7Qyqi4o8PE67Q==
X-Google-Smtp-Source: ABdhPJyMZHVy88XEM/N4HcXnGKI2H5mW4ngY/UJP3/7Pd5XWqU2P80kBnyzbc71NA4r7bzZr9CAf5Q==
X-Received: by 2002:a65:648f:: with SMTP id e15mr19161536pgv.165.1625547314104;
        Mon, 05 Jul 2021 21:55:14 -0700 (PDT)
Received: from dbcomp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id g1sm4527290pgs.23.2021.07.05.21.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 21:55:13 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, jaffe1@gmail.com,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH] cec: expand Timer Programming tests and emulation
Date:   Mon,  5 Jul 2021 21:55:00 -0700
Message-Id: <20210706045500.49612-1-deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Check that Timer Status and Time Cleared Status replies have a valid
operand. Check validity of timer dates. Check follower's response to
duplicate timers, overlapping timers and out-of-range dates. In the
follower, start and stop recording as programmed; emulate a finite storage
space for finished recordings; delete recordings as completed.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
 utils/cec-compliance/cec-test.cpp     | 213 +++++++++++++-----
 utils/cec-follower/cec-follower.cpp   |  63 ++++++
 utils/cec-follower/cec-follower.h     |  38 ++++
 utils/cec-follower/cec-processing.cpp |  19 ++
 utils/cec-follower/cec-tuner.cpp      | 304 ++++++++++++++++++++++++--
 5 files changed, 568 insertions(+), 69 deletions(-)

diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index 6c421eed..f092952a 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -13,6 +13,8 @@
 
 #include "cec-compliance.h"
 
+enum Months { Jan, Feb, March, April, May, June, July, Aug, Sept, Oct, Nov, Dec };
+
 struct remote_test {
 	const char *name;
 	const unsigned tags;
@@ -112,6 +114,58 @@ static bool rec_status_is_a_valid_error_status(__u8 rec_status)
 	}
 }
 
+static int timer_status_invalid(const struct cec_msg &msg)
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
+static int timer_cleared_status_invalid(const struct cec_msg &msg)
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
+static int timer_prog_error_invalid(const struct cec_msg *msg, __u8 expected_prog_error)
+{
+	__u8 timer_overlap_warning;
+	__u8 media_info;
+	__u8 prog_info;
+	__u8 prog_error;
+	__u8 duration_hr;
+	__u8 duration_min;
+
+	cec_ops_timer_status(msg, &timer_overlap_warning, &media_info, &prog_info,
+	                     &prog_error, &duration_hr, &duration_min);
+	fail_on_test(prog_error != expected_prog_error);
+
+	return OK;
+}
+
 /* System Information */
 
 int system_info_polling(struct node *node, unsigned me, unsigned la, bool interactive)
@@ -1499,21 +1553,15 @@ static const vec_remote_subtests one_touch_rec_subtests{
 
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
+	cec_msg_set_analogue_timer(&msg, true, 21, Aug, 16, 30, 9, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
+	                           CEC_OP_ANA_BCAST_TYPE_CABLE,
+	                           7668, // 479.25 MHz
+	                           node->remote[la].bcast_sys);
 	fail_on_test(!transmit_timeout(node, &msg, 10000));
 	if (timed_out(&msg)) {
 		warn("Timed out waiting for Timer Status. Assuming timer was set.\n");
@@ -1525,14 +1573,13 @@ static int timer_prog_set_analog_timer(struct node *node, unsigned me, unsigned
 		return OK_REFUSED;
 	if (cec_msg_status_is_abort(&msg))
 		return OK_PRESUMED;
+	fail_on_test(timer_status_invalid(msg));
 
-	return 0;
+	return OK;
 }
 
 static int timer_prog_set_digital_timer(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	/* TODO: Check the timer status for possible errors, etc. */
-
 	struct cec_msg msg;
 	struct cec_op_digital_service_id digital_service_id = {};
 
@@ -1541,8 +1588,8 @@ static int timer_prog_set_digital_timer(struct node *node, unsigned me, unsigned
 	digital_service_id.channel.minor = 1;
 	digital_service_id.dig_bcast_system = node->remote[la].dig_bcast_sys;
 	cec_msg_init(&msg, me, la);
-	cec_msg_set_digital_timer(&msg, true, 1, 1, 0, 0, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
-				    &digital_service_id);
+	cec_msg_set_digital_timer(&msg, true, 31, Dec, 23, 30, 2, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
+	                          &digital_service_id);
 	fail_on_test(!transmit_timeout(node, &msg, 10000));
 	if (timed_out(&msg)) {
 		warn("Timed out waiting for Timer Status. Assuming timer was set.\n");
@@ -1554,19 +1601,18 @@ static int timer_prog_set_digital_timer(struct node *node, unsigned me, unsigned
 		return OK_REFUSED;
 	if (cec_msg_status_is_abort(&msg))
 		return OK_PRESUMED;
+	fail_on_test(timer_status_invalid(msg));
 
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
+	cec_msg_set_ext_timer(&msg, true, 4, Nov, 23, 55, 20, 51, CEC_OP_REC_SEQ_ONCE_ONLY,
+	                      CEC_OP_EXT_SRC_PHYS_ADDR, 0, node->phys_addr);
 	fail_on_test(!transmit_timeout(node, &msg, 10000));
 	if (timed_out(&msg)) {
 		warn("Timed out waiting for Timer Status. Assuming timer was set.\n");
@@ -1578,21 +1624,20 @@ static int timer_prog_set_ext_timer(struct node *node, unsigned me, unsigned la,
 		return OK_REFUSED;
 	if (cec_msg_status_is_abort(&msg))
 		return OK_PRESUMED;
+	fail_on_test(timer_status_invalid(msg));
 
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
+	cec_msg_clear_analogue_timer(&msg, true, 21, Aug, 16, 30, 9, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
+	                             CEC_OP_ANA_BCAST_TYPE_CABLE,
+	                             7668, // 479.25 MHz
+	                             node->remote[la].bcast_sys);
 	fail_on_test(!transmit_timeout(node, &msg, 10000));
 	if (timed_out(&msg)) {
 		warn("Timed out waiting for Timer Cleared Status. Assuming timer was cleared.\n");
@@ -1604,14 +1649,13 @@ static int timer_prog_clear_analog_timer(struct node *node, unsigned me, unsigne
 		return OK_REFUSED;
 	if (cec_msg_status_is_abort(&msg))
 		return OK_PRESUMED;
+	fail_on_test(timer_cleared_status_invalid(msg));
 
 	return 0;
 }
 
 static int timer_prog_clear_digital_timer(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	/* TODO: Check the timer cleared status. */
-
 	struct cec_msg msg;
 	struct cec_op_digital_service_id digital_service_id = {};
 
@@ -1620,8 +1664,8 @@ static int timer_prog_clear_digital_timer(struct node *node, unsigned me, unsign
 	digital_service_id.channel.minor = 1;
 	digital_service_id.dig_bcast_system = node->remote[la].dig_bcast_sys;
 	cec_msg_init(&msg, me, la);
-	cec_msg_clear_digital_timer(&msg, true, 1, 1, 0, 0, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
-				    &digital_service_id);
+	cec_msg_clear_digital_timer(&msg, true, 31, Dec, 23, 30, 2, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
+	                            &digital_service_id);
 	fail_on_test(!transmit_timeout(node, &msg, 10000));
 	if (timed_out(&msg)) {
 		warn("Timed out waiting for Timer Cleared Status. Assuming timer was cleared.\n");
@@ -1633,19 +1677,18 @@ static int timer_prog_clear_digital_timer(struct node *node, unsigned me, unsign
 		return OK_REFUSED;
 	if (cec_msg_status_is_abort(&msg))
 		return OK_PRESUMED;
+	fail_on_test(timer_cleared_status_invalid(msg));
 
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
+	cec_msg_clear_ext_timer(&msg, true, 4, Nov, 23, 55, 20, 51, CEC_OP_REC_SEQ_ONCE_ONLY,
+	                        CEC_OP_EXT_SRC_PHYS_ADDR, 0, node->phys_addr);
 	fail_on_test(!transmit_timeout(node, &msg, 10000));
 	if (timed_out(&msg)) {
 		warn("Timed out waiting for Timer Cleared Status. Assuming timer was cleared.\n");
@@ -1657,6 +1700,7 @@ static int timer_prog_clear_ext_timer(struct node *node, unsigned me, unsigned l
 		return OK_REFUSED;
 	if (cec_msg_status_is_abort(&msg))
 		return OK_PRESUMED;
+	fail_on_test(timer_cleared_status_invalid(msg));
 
 	return 0;
 }
@@ -1676,35 +1720,104 @@ static int timer_prog_set_prog_title(struct node *node, unsigned me, unsigned la
 	return OK_PRESUMED;
 }
 
-static int timer_prog_timer_status(struct node *node, unsigned me, unsigned la, bool interactive)
+static int timer_set_duplicate(struct node *node, unsigned me, unsigned la, bool interactive)
 {
 	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
-	cec_msg_timer_status(&msg, CEC_OP_TIMER_OVERLAP_WARNING_NO_OVERLAP,
-			     CEC_OP_MEDIA_INFO_NO_MEDIA,
-			     CEC_OP_PROG_INFO_ENOUGH_SPACE,
-			     0, 0, 0);
-	fail_on_test(!transmit_timeout(node, &msg));
+	cec_msg_set_analogue_timer(&msg, true, 30, April, 10, 42, 35, 5, CEC_OP_REC_SEQ_ONCE_ONLY,
+	                           CEC_OP_ANA_BCAST_TYPE_CABLE,
+	                           7668, // 479.25 MHz
+	                           node->remote[la].bcast_sys);
+	fail_on_test(!transmit_timeout(node, &msg, 10000));
 	if (unrecognized_op(&msg))
 		return OK_NOT_SUPPORTED;
-	if (refused(&msg))
-		return OK_REFUSED;
+	fail_on_test(timed_out_or_abort(&msg));
 
-	return OK_PRESUMED;
+	cec_msg_init(&msg, me, la);
+	cec_msg_set_analogue_timer(&msg, true, 30, April, 10, 42, 35, 5, CEC_OP_REC_SEQ_ONCE_ONLY,
+	                           CEC_OP_ANA_BCAST_TYPE_CABLE,
+	                           7668, // 479.25 MHz
+	                           node->remote[la].bcast_sys);
+	fail_on_test(!transmit_timeout(node, &msg, 10000));
+	fail_on_test(timed_out_or_abort(&msg));
+	fail_on_test(timer_prog_error_invalid(&msg, CEC_OP_PROG_ERROR_DUPLICATE));
+
+	return OK;
 }
 
-static int timer_prog_timer_clear_status(struct node *node, unsigned me, unsigned la, bool interactive)
+static int timer_set_invalid_date(struct node *node, unsigned me, unsigned la, bool interactive)
 {
 	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
-	cec_msg_timer_cleared_status(&msg, CEC_OP_TIMER_CLR_STAT_CLEARED);
-	fail_on_test(!transmit_timeout(node, &msg));
+	cec_msg_set_analogue_timer(&msg, true, 31, April, 10, 42, 35, 5, CEC_OP_REC_SEQ_ONCE_ONLY,
+	                           CEC_OP_ANA_BCAST_TYPE_CABLE,
+	                           7668, // 479.25 MHz
+	                           node->remote[la].bcast_sys);
+	fail_on_test(!transmit_timeout(node, &msg, 10000));
 	if (unrecognized_op(&msg))
 		return OK_NOT_SUPPORTED;
-	if (refused(&msg))
-		return OK_REFUSED;
+	fail_on_test(timed_out_or_abort(&msg));
+	fail_on_test(timer_prog_error_invalid(&msg, CEC_OP_PROG_ERROR_DATE_OUT_OF_RANGE));
+
+	return OK;
+}
+
+static int timer_set_overlapping_timers(struct node *node, unsigned me, unsigned la, bool interactive)
+{
+	struct cec_msg msg;
+
+	cec_msg_init(&msg, me, la);
+	cec_msg_set_analogue_timer(&msg, true, 30, Oct, 23, 35, 4, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
+	                           CEC_OP_ANA_BCAST_TYPE_CABLE,
+	                           7668, // 479.25 MHz
+	                           node->remote[la].bcast_sys);
+	fail_on_test(!transmit_timeout(node, &msg, 10000));
+	if (unrecognized_op(&msg))
+		return OK_NOT_SUPPORTED;
+	fail_on_test(timed_out_or_abort(&msg));
+
+	cec_msg_init(&msg, me, la);
+	cec_msg_set_analogue_timer(&msg, true, 30, Oct, 23, 45, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
+	                           CEC_OP_ANA_BCAST_TYPE_CABLE,
+	                           7668, // 479.25 MHz
+	                           node->remote[la].bcast_sys);
+	fail_on_test(!transmit_timeout(node, &msg, 10000));
+	if (unrecognized_op(&msg))
+		return OK_NOT_SUPPORTED;
+	fail_on_test(timed_out_or_abort(&msg));
+
+	__u8 timer_overlap_warning;
+	__u8 media_info;
+	__u8 prog_info;
+	__u8 prog_error;
+	__u8 duration_hr;
+	__u8 duration_min;
+
+	cec_ops_timer_status(&msg, &timer_overlap_warning, &media_info, &prog_info,
+	                     &prog_error, &duration_hr, &duration_min);
+	fail_on_test(timer_overlap_warning != CEC_OP_TIMER_OVERLAP_WARNING_OVERLAP);
+
+	return OK;
+}
+
+static int timer_set_immediate_timer(struct node *node, unsigned me, unsigned la, bool interactive)
+{
+	struct cec_msg msg;
+	time_t current_time = time(nullptr);
+	struct tm *temp = localtime(&current_time);
+	struct tm now = *temp;
+
+	cec_msg_init(&msg, me, la);
+	cec_msg_set_analogue_timer(&msg, true, now.tm_mday, now.tm_mon, now.tm_hour, now.tm_min+1, 0, 1,
+	                           CEC_OP_REC_SEQ_ONCE_ONLY, CEC_OP_ANA_BCAST_TYPE_CABLE,
+	                           7668, // 479.25 MHz
+	                           node->remote[la].bcast_sys);
+	fail_on_test(!transmit_timeout(node, &msg, 10000));
+	if (unrecognized_op(&msg))
+		return OK_NOT_SUPPORTED;
+	fail_on_test(timed_out_or_abort(&msg));
 
 	return OK_PRESUMED;
 }
@@ -1717,8 +1830,10 @@ static const vec_remote_subtests timer_prog_subtests{
 	{ "Clear Analogue Timer", CEC_LOG_ADDR_MASK_RECORD, timer_prog_clear_analog_timer },
 	{ "Clear Digital Timer", CEC_LOG_ADDR_MASK_RECORD, timer_prog_clear_digital_timer },
 	{ "Clear External Timer", CEC_LOG_ADDR_MASK_RECORD, timer_prog_clear_ext_timer },
-	{ "Timer Status", CEC_LOG_ADDR_MASK_RECORD, timer_prog_timer_status },
-	{ "Timer Cleared Status", CEC_LOG_ADDR_MASK_RECORD, timer_prog_timer_clear_status },
+	{ "Set Duplicate Timer", CEC_LOG_ADDR_MASK_RECORD, timer_set_duplicate },
+	{ "Set Invalid Date Timer", CEC_LOG_ADDR_MASK_RECORD, timer_set_invalid_date },
+	{ "Set Overlapping Date Timer", CEC_LOG_ADDR_MASK_RECORD, timer_set_overlapping_timers },
+	{ "Set Immediate Timer", CEC_LOG_ADDR_MASK_RECORD, timer_set_immediate_timer },
 };
 
 static const char *hec_func_state2s(__u8 hfs)
diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
index 2816fb85..8642407c 100644
--- a/utils/cec-follower/cec-follower.cpp
+++ b/utils/cec-follower/cec-follower.cpp
@@ -47,6 +47,7 @@ bool show_msgs;
 bool show_state;
 bool show_warnings = true;
 unsigned warnings;
+std::list<struct Timer> programmed_timers;
 
 static struct option long_options[] = {
 	{ "device", required_argument, nullptr, OptSetDevice },
@@ -296,6 +297,67 @@ int cec_named_ioctl(int fd, const char *name,
 	return retval == -1 ? e : (retval ? -1 : 0);
 }
 
+bool operator==(struct Timer &left, struct Timer &right)
+{
+	time_t left_timer_start = mktime(&(left.start_time));
+	time_t right_timer_start = mktime(&right.start_time);
+
+	if (left_timer_start != right_timer_start)
+		return false;
+
+	time_t left_timer_end = mktime(&(left.end_time));
+	time_t right_timer_end = mktime(&right.end_time);
+
+	if (left_timer_end != right_timer_end)
+		return false;
+
+	if (left.src.type != right.src.type)
+		return false; //to do - look at src details for better accuracy?
+
+	return true;
+}
+
+bool compare_timer(struct Timer &left, struct Timer &right)
+{
+	time_t left_timer_start = mktime(&left.start_time);
+	time_t right_timer_start = mktime(&right.start_time);
+	if (left_timer_start <= right_timer_start)
+		return true;
+	return false;
+}
+
+void timer_delete(struct Timer &timer)
+{
+	std::list<struct Timer>::iterator it;
+
+	for (it = programmed_timers.begin(); it != programmed_timers.end(); it++) {
+		if (timer == *it) {
+			programmed_timers.erase(it);
+			break;
+		}
+	}
+	programmed_timers.sort(compare_timer);
+}
+
+void print_timers(struct node *node)
+{
+	int count = 1;
+	std::list<struct Timer>::iterator it;
+
+	printf("Programmed Timers:\n");
+	for (it = programmed_timers.begin(); it != programmed_timers.end(); ++it) {
+		printf("%d. ", count++);
+		std::string str = "Start: ";
+		str += asctime(&(it->start_time));
+		str.replace(str.end()-1, str.end(), ", End: ");
+		str+= asctime(&(it->end_time));
+		str.replace(str.end()-1, str.end(), ", Needs: ");
+		printf("%s", str.c_str());
+		printf("%d %s\n", it->media_space_required, "MB.");
+	}
+	printf("Total media space available for recording: %d MB.\n\n", node->state.media_space_available);
+}
+
 void state_init(struct node &node)
 {
 	if (options[OptStandby])
@@ -319,6 +381,7 @@ void state_init(struct node &node)
 	node.state.deck_skip_start = 0;
 	node.state.one_touch_record_on = false;
 	node.state.record_received_standby = false;
+	node.state.media_space_available = 36000; /* In MB; space for 10 hours @ 1MB/sec */
 	tuner_dev_info_init(&node.state);
 	node.state.last_aud_rate_rx_ts = 0;
 }
diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
index 833dec5e..d5f617c4 100644
--- a/utils/cec-follower/cec-follower.h
+++ b/utils/cec-follower/cec-follower.h
@@ -19,12 +19,19 @@
 
 #include <cec-info.h>
 #include <cec-log.h>
+#include <list>
+#include <ctime>
 
 extern bool show_info;
 extern bool show_msgs;
 extern bool show_state;
 extern bool show_warnings;
 extern unsigned warnings;
+extern std::list<struct Timer> programmed_timers;
+extern bool operator==(struct Timer &left, struct Timer &right);
+extern bool compare_timer(struct Timer &left, struct Timer &right);
+extern void print_timers(struct node *node);
+extern void timer_delete(struct Timer &timer);
 
 struct state {
 	__u16 active_source_pa;
@@ -55,6 +62,7 @@ struct state {
 	__u64 deck_skip_start;
 	bool one_touch_record_on;
 	bool record_received_standby;
+	int media_space_available;
 	time_t toggle_power_status;
 	__u64 last_aud_rate_rx_ts;
 };
@@ -82,6 +90,36 @@ struct node {
 	unsigned short ignore_opcode[256];
 };
 
+struct Timer {
+	struct tm start_time;
+	struct tm end_time;
+	int media_space_required;
+	__u8 recording_seq;
+	struct cec_op_record_src src;
+
+	Timer()
+	{
+		time_t current_time = time(nullptr);
+		struct tm *tp_start = localtime(&current_time);
+		start_time = *tp_start;
+		struct tm *tp_end = localtime(&current_time);
+		end_time = *tp_end;
+		start_time.tm_sec = end_time.tm_sec = 0; /* Time precision is only to the minute. */
+		media_space_required = 0;
+		recording_seq = 0;
+		src = {};
+	}
+
+	Timer(const Timer& timer)
+	{
+		start_time = timer.start_time;
+		end_time = timer.end_time;
+		media_space_required = timer.media_space_required;
+		recording_seq = timer.recording_seq;
+		src = timer.src;
+	}
+};
+
 struct la_info {
 	__u64 ts;
 	struct {
diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index 32375966..05d0641d 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -1164,6 +1164,25 @@ void testProcessing(struct node *node, bool wallclock)
 			node->state.deck_skip_start = 0;
 			update_deck_state(node, me, CEC_OP_DECK_INFO_PLAY);
 		}
+
+		/*
+		 * Execute any recording timers that have been programmed.
+		 * Delete timers when finished.
+		 */
+		if (programmed_timers.size() > 0) {
+			time_t current_time = time(nullptr);
+			std::list<struct Timer>::iterator it = programmed_timers.begin();
+			time_t timer_start = mktime(&(it->start_time));
+			time_t timer_end = mktime(&(it->end_time));
+			if (timer_start < current_time && timer_end > current_time)
+				node->state.one_touch_record_on = true;
+			if (timer_start < current_time && timer_end < current_time){
+				node->state.one_touch_record_on = false;
+				node->state.media_space_available-= it->media_space_required;
+				timer_delete(*it);
+				print_timers(node);
+			}
+		}
 	}
 	mode = CEC_MODE_INITIATOR;
 	doioctl(node, CEC_S_MODE, &mode);
diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index e1d8b8fc..312542a2 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -4,7 +4,6 @@
  */
 
 #include <array>
-#include <ctime>
 #include <string>
 
 #include <sys/ioctl.h>
@@ -17,6 +16,208 @@
 #define TOT_ANALOG_FREQS analog_freqs_khz[0][0].size()
 #define TOT_DIGITAL_CHANS digital_arib_data[0].size() + digital_atsc_data[0].size() + digital_dvb_data[0].size()
 
+enum Months { Jan, Feb, March, April, May, June, July, Aug, Sept, Oct, Nov, Dec };
+
+static struct Timer get_timer_from_message(const struct cec_msg &msg)
+{
+		struct Timer timer = {};
+		__u8 day = 0;
+		__u8 month = 0;
+		__u8 start_hr = 0;
+		__u8 start_min = 0;
+		__u8 duration_hr = 0;
+		__u8 duration_min = 0;
+		__u8 ext_src_spec = 0;
+		__u8 plug = 0;
+		__u16 phys_addr = 0;
+
+		switch (msg.msg[1]) {
+		case CEC_MSG_CLEAR_ANALOGUE_TIMER:
+		case CEC_MSG_SET_ANALOGUE_TIMER:
+			timer.src.type = CEC_OP_RECORD_SRC_ANALOG;
+			cec_ops_set_analogue_timer(&msg, &day, &month, &start_hr, &start_min,
+			                           &duration_hr, &duration_min, &timer.recording_seq,
+			                           &timer.src.analog.ana_bcast_type, &timer.src.analog.ana_freq,
+			                           &timer.src.analog.bcast_system);
+			break;
+		case CEC_MSG_CLEAR_DIGITAL_TIMER:
+		case CEC_MSG_SET_DIGITAL_TIMER: {
+			struct cec_op_digital_service_id digital = {};
+
+			timer.src.type = CEC_OP_RECORD_SRC_DIGITAL;
+			timer.src.digital = digital;
+			cec_ops_set_digital_timer(&msg, &day, &month, &start_hr, &start_min,
+			                          &duration_hr, &duration_min, &timer.recording_seq,
+			                          &timer.src.digital);
+			break;
+		}
+		case CEC_MSG_CLEAR_EXT_TIMER:
+		case CEC_MSG_SET_EXT_TIMER: {
+			cec_ops_set_ext_timer(&msg, &day, &month, &start_hr, &start_min,
+			                      &duration_hr, &duration_min, &timer.recording_seq, &ext_src_spec,
+			                      &plug, &phys_addr);
+			if (ext_src_spec == CEC_OP_EXT_SRC_PLUG) {
+				timer.src.type = CEC_OP_RECORD_SRC_EXT_PLUG;
+				timer.src.ext_plug.plug = plug;
+			}
+			if (ext_src_spec == CEC_OP_EXT_SRC_PHYS_ADDR) {
+				timer.src.type = CEC_OP_RECORD_SRC_EXT_PHYS_ADDR;
+				timer.src.ext_phys_addr.phys_addr = phys_addr;
+			}
+			break;
+		}
+		default:
+			break;
+		}
+		timer.start_time.tm_mday = day;
+		timer.start_time.tm_mon = month;
+		timer.start_time.tm_hour = start_hr;
+		timer.start_time.tm_min = start_min;
+		timer.end_time = timer.start_time;
+		timer.end_time.tm_hour += duration_hr;
+		timer.end_time.tm_min += duration_min;
+		timer.media_space_required = ((duration_hr * 60) + duration_min) * 60; /* 60 MB/min */
+
+		return timer;
+}
+
+static bool timer_date_out_of_range(struct Timer &timer)
+{
+	/*
+	 * Timer date ranges are the same as in struct tm:
+	 * mon (0,11), hours (0,23), min (0,59), days (1,31).
+	 */
+	if (timer.start_time.tm_mon > Dec || timer.start_time.tm_hour > 23 || timer.start_time.tm_min > 59 ||
+	    timer.start_time.tm_mday == 0 || timer.start_time.tm_mday > 31 )
+		return true;
+	/*
+	 * Validity of day in February cannot be determined until after year is determined,
+	 * but the library function used to determine the year will also adjust an incorrect date.
+	 * So get the February dates now, to check later.
+	 */
+	bool starts_in_February = false;
+	int day_in_February = timer.start_time.tm_mday;
+
+	switch (timer.start_time.tm_mon) {
+	case Feb:
+		starts_in_February = true;
+		break;
+	case April: case June: case Sept: case Nov:
+		if (timer.start_time.tm_mday > 30)
+			return true;
+		break;
+	}
+
+	/*
+	 * If the timer starts and/or ends in the past, increment the year.
+	 * This allows a reasonable timer to be set near the end of the year.
+	 */
+	time_t current_time = time(nullptr);
+	time_t start_time = mktime(&timer.start_time);
+	time_t end_time = mktime(&timer.end_time);
+	if (current_time > start_time) {
+		timer.start_time.tm_year++;
+		start_time = mktime(&timer.start_time);
+	}
+	if (current_time > end_time) {
+		timer.end_time.tm_year++;
+		end_time = mktime(&timer.end_time);
+	}
+	if (start_time >= end_time)
+		return true;
+	if (starts_in_February) {
+		/* Simplified leap year formula will work until 2100. */
+		if (timer.start_time.tm_year%4 == 0) {
+			if (day_in_February > 29)
+				return true;
+		} else {
+			if (day_in_February > 28)
+				return true;
+		}
+	}
+
+	return false;
+}
+
+static bool timer_duplicate(struct Timer &timer)
+{
+	if (programmed_timers.size() == 0) /* this will be the first timer */
+		return false;
+
+	std::list<struct Timer>::iterator it;
+
+	for (it = programmed_timers.begin(); it != programmed_timers.end(); it++) {
+		if (timer == *it)
+			return true;
+	}
+	return false;
+}
+
+static bool timer_overlap(struct node *node, struct Timer &new_timer)
+{
+	if (programmed_timers.size() == 1)
+		return false;
+
+	time_t new_timer_start = mktime(&new_timer.start_time);
+	time_t new_timer_end = mktime(&new_timer.end_time);
+	time_t existing_timer_start;
+	time_t existing_timer_end;
+	bool overlap = false;
+	int remaining_hour;
+	int remaining_min;
+	int remaining_space;
+	std::list<struct Timer>::iterator it;
+	std::list<struct Timer> timers_to_remove;
+
+	for (it = programmed_timers.begin(); it != programmed_timers.end(); it++) {
+		if (new_timer == *it)
+			continue;
+		existing_timer_start = mktime(&(it->start_time));
+		existing_timer_end = mktime(&(it->end_time));
+		/*
+		 * Keep the front-end of the existing timer that does not overlap with the
+		 * new timer. The tail-end will be discarded even if it does not overlap.
+		 */
+		if (existing_timer_start < new_timer_start  && new_timer_start < existing_timer_end) {
+			it->end_time = new_timer.start_time;
+			existing_timer_end = mktime(&(it->end_time)); /* update value for remainder of loop */
+			remaining_hour = it->end_time.tm_hour - it->start_time.tm_hour;
+			remaining_min = (it->end_time.tm_min - it->start_time.tm_min) + (remaining_hour * 60);
+			remaining_space =  remaining_min * 60; /* 60 MB/min */
+			it->media_space_required = remaining_space;
+			overlap = true;
+		}
+
+		/* Keep the tail-end of the existing timer that does not overlap with the new timer. */
+		if (existing_timer_start < new_timer_end && new_timer_end < existing_timer_end) {
+			it->start_time = new_timer.end_time;
+			existing_timer_start = mktime(&(it->start_time)); /* update value for remainder of loop */
+			remaining_hour = it->end_time.tm_hour - it->start_time.tm_hour;
+			remaining_min = (it->end_time.tm_min - it->start_time.tm_min) + (remaining_hour * 60);
+			remaining_space =  remaining_min * 60; /* 60 MB/min */
+			it->media_space_required = remaining_space;
+			overlap = true;
+		}
+
+		/* Remove the existing timer because it is entirely overlapped by the new timer. */
+		if (new_timer_start <= existing_timer_start && existing_timer_end <= new_timer_end) {
+			timers_to_remove.push_back(*it);
+			overlap = true;
+		}
+	}
+
+	for (struct Timer &timer_to_be_removed : timers_to_remove)
+		timer_delete(timer_to_be_removed);
+
+	return overlap;
+}
+
+static void add_timer(struct node *node, const struct Timer &timer)
+{
+	programmed_timers.push_back(timer);
+	programmed_timers.sort(compare_timer);
+}
+
 struct service_info {
 	unsigned tsid;
 	unsigned onid;
@@ -738,39 +939,102 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
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
+		if (timer_date_out_of_range(timer)) //to do: check for duration_min > 59
+			prog_error = CEC_OP_PROG_ERROR_DATE_OUT_OF_RANGE;
+
+		if (timer.recording_seq > 127)
+			prog_error = CEC_OP_PROG_ERROR_REC_SEQ_ERROR;
+
+		if (timer_duplicate(timer))
+			prog_error = CEC_OP_PROG_ERROR_DUPLICATE;
+
+		if (!prog_error) {
+			add_timer(node, timer);
+
+			if (timer_overlap(node, timer))
+				timer_overlap_warning = CEC_OP_TIMER_OVERLAP_WARNING_OVERLAP;
+
+			if (node->state.media_space_available <= 0 ||
+			    timer.media_space_required > node->state.media_space_available) {
+				prog_info = CEC_OP_PROG_INFO_NOT_ENOUGH_SPACE;
+			} else {
+				/* Get the space that may be used by timers scheduled before this timer (if any). */
+				int space_that_may_be_needed = 0;
+				std::list<struct Timer>::iterator it;
+
+				for (it = programmed_timers.begin(); it != programmed_timers.end(); it++) {
+					space_that_may_be_needed+= it->media_space_required;
+					if (*it == timer)
+						break;
+				}
+
+				if ((node->state.media_space_available - space_that_may_be_needed) >= 0)
+					prog_info = CEC_OP_PROG_INFO_ENOUGH_SPACE;
+				else
+					prog_info = CEC_OP_PROG_INFO_MIGHT_NOT_BE_ENOUGH_SPACE;
+			}
+		}
+
+		if (prog_info == CEC_OP_PROG_INFO_NOT_ENOUGH_SPACE ||
+		    prog_info == CEC_OP_PROG_INFO_MIGHT_NOT_BE_ENOUGH_SPACE ||
+		    prog_error == CEC_OP_PROG_ERROR_DUPLICATE) {
+			available_space_hr = node->state.media_space_available/3600; /* 3600 MB/hour */
+			available_space_min = (node->state.media_space_available%3600)/60; /* 60 MB/min */
+		}
+		print_timers(node);
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
+		if (node->state.one_touch_record_on) {
+			timer_cleared_status = CEC_OP_TIMER_CLR_STAT_RECORDING;
+		} else {
+			struct Timer timer = get_timer_from_message(msg);
+			std::list<struct Timer>::iterator it;
+
+			for (it = programmed_timers.begin(); it != programmed_timers.end(); it++) {
+				if (*it == timer){
+					timer_cleared_status = CEC_OP_TIMER_CLR_STAT_CLEARED;
+					break;
+				}
+			}
+
+			if (timer_cleared_status == CEC_OP_TIMER_CLR_STAT_CLEARED)
+				timer_delete(timer);
+		}
+		print_timers(node);
 		cec_msg_set_reply_to(&msg, &msg);
-		cec_msg_timer_cleared_status(&msg, CEC_OP_TIMER_CLR_STAT_CLEARED);
+		cec_msg_timer_cleared_status(&msg, timer_cleared_status);
 		transmit(node, &msg);
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

