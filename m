Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 635A73B2607
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 06:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbhFXEJU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 00:09:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbhFXEJU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 00:09:20 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BB31C061574
        for <linux-media@vger.kernel.org>; Wed, 23 Jun 2021 21:07:01 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id bv7-20020a17090af187b029016fb18e04cfso4759125pjb.0
        for <linux-media@vger.kernel.org>; Wed, 23 Jun 2021 21:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7vtdCUa4AD/+GDlxyb03WUltkgIs0LCS0MSGBTT2s1c=;
        b=ARJVGKxOBJ39Orf4wf+kAPxzSvGub/WOX/ApaCMhr+kmM9w/wOeozfvn4lI2nZnQqO
         uRHWSVbZdyrRHGaz3joPzbFoq+9RkQ+Ac9mPip+qZEnGRfKDvt+7Lz4IiyY9dWyNiaAu
         fPC7JCDcDZfAQXCEr2O0GR+gqBAOSF7Qfl9ddEz2jAFnOemV+wg/V+5wUiUADzoC8Mho
         Mv2QMgRR8mkc6KfpWlU18RLNySB1mjHZlIKv7oscvZlkFLKdq9/7U7ap+tlb3y30Je6M
         g8N5qWQdtAkq+BvUTOD5pKPhNfgHj4jmn7gV/DoaOPgajkNKraQlkWbOSNy9aKHqw/AR
         IBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7vtdCUa4AD/+GDlxyb03WUltkgIs0LCS0MSGBTT2s1c=;
        b=Rs3WyoRaT2ejeUh6E6m8p4ZWTLOvoCVbfp6r2Z+6hpQJjR03YRQ4/Azt0sJxG4gOFO
         gPxGGgNcJV1tnLmE5phhUaXDAyrk4w4lfoBvfGfY8oajgiRcYexZW8jHcZ/aSeCEKtc1
         uqpvy0nzuFS6+xdttN3VxAHud9CRHzi6JbnGlUbPA/56B06lK+8Ls9wYb3YSy0tqoNSK
         c8M6J1l5hFEsoNcfM1RaM7H3EcXL1NNu50nWbsRF8lVUcgrDPLAJaayVizkExTB/m65B
         YlqZWTdoUaHUqZcGz6t52UN5mHjaVxahgHaTGKUUBk/xOTVqqBSQ8FERy/kaEe1WnEHw
         fRQg==
X-Gm-Message-State: AOAM532ZFk652gd1aWDt6J0ufAIt29GVf+/HhCrZ3D2Qu9sFIfI2WZoQ
        NdY9yAAn19itSV+rPsUSsH/5geZiAHAU6Q==
X-Google-Smtp-Source: ABdhPJzjcelTPww6uLxH2HRjC21B3COBEsDT3Y4xfGUchD19YVinPs9DAwS4Pe23e8+99D9OmvsCVQ==
X-Received: by 2002:a17:90a:bb89:: with SMTP id v9mr12902140pjr.0.1624507620779;
        Wed, 23 Jun 2021 21:07:00 -0700 (PDT)
Received: from ada-comp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id s20sm7094320pjn.23.2021.06.23.21.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 21:07:00 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, jaffe1@gmail.com,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v4 3/3] cec: add One Touch Record Standby tests
Date:   Wed, 23 Jun 2021 21:06:44 -0700
Message-Id: <97f889b42fe38417fd5a7cdc2c00cdf848361508.1624506446.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1624506445.git.deborahbrouwer3563@gmail.com>
References: <cover.1624506445.git.deborahbrouwer3563@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Check that the recording device ignores a Standby message while it is
recording. When the recording is finished, check that the recording device
enters standby unless the recording device is the active source.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
 utils/cec-compliance/cec-test-power.cpp | 63 +++++++++++++++++++++++++
 utils/cec-follower/cec-follower.h       |  2 +
 utils/cec-follower/cec-processing.cpp   |  8 +++-
 utils/cec-follower/cec-tuner.cpp        |  9 ++++
 4 files changed, 80 insertions(+), 2 deletions(-)

diff --git a/utils/cec-compliance/cec-test-power.cpp b/utils/cec-compliance/cec-test-power.cpp
index b675bfc4..c6bf7093 100644
--- a/utils/cec-compliance/cec-test-power.cpp
+++ b/utils/cec-compliance/cec-test-power.cpp
@@ -677,6 +677,67 @@ static int standby_resume_wakeup_deck_play(struct node *node, unsigned me, unsig
 	return standby_resume_wakeup_deck(node, me, la, interactive, CEC_OP_PLAY_MODE_PLAY_FWD);
 }
 
+static int standby_record(struct node *node, unsigned me, unsigned la, bool interactive, __u8 opcode)
+{
+	struct cec_msg msg;
+	__u8 rec_status;
+
+	cec_msg_init(&msg, me, la);
+	cec_msg_record_on_own(&msg);
+	msg.reply = CEC_MSG_RECORD_STATUS;
+	fail_on_test(!transmit_timeout(node, &msg, 10000));
+	if (timed_out_or_abort(&msg))
+		return OK_NOT_SUPPORTED;
+	cec_ops_record_status(&msg, &rec_status);
+	fail_on_test(rec_status != CEC_OP_RECORD_STATUS_CUR_SRC &&
+	             rec_status != CEC_OP_RECORD_STATUS_ALREADY_RECORDING);
+
+	cec_msg_init(&msg, me, la);
+	cec_msg_standby(&msg);
+	fail_on_test(!transmit_timeout(node, &msg));
+	/* Standby should not interrupt the recording. */
+	fail_on_test(!cec_msg_status_is_abort(&msg));
+
+	/* When the recording stops, the recorder should standby unless the recorder is the active source */
+	cec_msg_init(&msg, me, la);
+	if (opcode == CEC_MSG_ACTIVE_SOURCE)
+		cec_msg_active_source(&msg, node->remote[la].phys_addr);
+	else
+		cec_msg_active_source(&msg, node->remote[la].phys_addr + 1);
+	fail_on_test(!transmit_timeout(node, &msg));
+
+	cec_msg_init(&msg, me, la);
+	cec_msg_record_off(&msg, false);
+	fail_on_test(!transmit_timeout(node, &msg));
+
+	unsigned unresponsive_time = 0;
+
+	if (opcode == CEC_MSG_ACTIVE_SOURCE) {
+		fail_on_test(!poll_stable_power_status(node, me, la, CEC_OP_POWER_STATUS_ON, unresponsive_time));
+	} else {
+		fail_on_test(!poll_stable_power_status(node, me, la, CEC_OP_POWER_STATUS_STANDBY, unresponsive_time));
+		fail_on_test(interactive && !question("Is the device in standby?"));
+		node->remote[la].in_standby = true;
+
+		int ret = standby_resume_wakeup(node, me, la, interactive);
+		if (ret)
+			return ret;
+		node->remote[la].in_standby = false;
+	}
+
+	return OK;
+}
+
+static int standby_record_active_source(struct node *node, unsigned me, unsigned la, bool interactive)
+{
+	return standby_record(node, me, la, interactive, CEC_MSG_ACTIVE_SOURCE);
+}
+
+static int standby_record_inactive_source(struct node *node, unsigned me, unsigned la, bool interactive)
+{
+	return standby_record(node, me, la, interactive, CEC_MSG_INACTIVE_SOURCE);
+}
+
 const vec_remote_subtests standby_resume_subtests{
 	{ "Standby", CEC_LOG_ADDR_MASK_ALL, standby_resume_standby },
 	{ "Repeated Standby message does not wake up", CEC_LOG_ADDR_MASK_ALL, standby_resume_standby_toggle },
@@ -697,4 +758,6 @@ const vec_remote_subtests standby_resume_subtests{
 	{ "Power State Transitions", CEC_LOG_ADDR_MASK_TV, power_state_transitions, false, true },
 	{ "Deck Eject Standby Resume", CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD, standby_resume_wakeup_deck_eject },
 	{ "Deck Play Standby Resume", CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD, standby_resume_wakeup_deck_play },
+	{ "Record Standby Active Source", CEC_LOG_ADDR_MASK_RECORD | CEC_LOG_ADDR_MASK_BACKUP, standby_record_active_source },
+	{ "Record Standby Inactive Source", CEC_LOG_ADDR_MASK_RECORD | CEC_LOG_ADDR_MASK_BACKUP, standby_record_inactive_source },
 };
diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
index 589ea6bf..b4d7563f 100644
--- a/utils/cec-follower/cec-follower.h
+++ b/utils/cec-follower/cec-follower.h
@@ -54,6 +54,7 @@ struct state {
 	__u8 deck_state;
 	__u64 deck_skip_start;
 	bool one_touch_record_on;
+	bool one_touch_record_standby;
 	time_t toggle_power_status;
 	__u64 last_aud_rate_rx_ts;
 };
@@ -229,5 +230,6 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
 void reply_feature_abort(struct node *node, struct cec_msg *msg,
 			 __u8 reason = CEC_OP_ABORT_UNRECOGNIZED_OP);
 void testProcessing(struct node *node, bool wallclock);
+bool enter_standby(struct node *node);
 
 #endif
diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index f985a841..43e03878 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -157,7 +157,7 @@ static bool exit_standby(struct node *node)
 	return false;
 }
 
-static bool enter_standby(struct node *node)
+bool enter_standby(struct node *node)
 {
 	if (node->state.power_status == CEC_OP_POWER_STATUS_ON ||
 	    node->state.power_status == CEC_OP_POWER_STATUS_TO_ON) {
@@ -320,10 +320,14 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me, __u8
 		/* Standby */
 
 	case CEC_MSG_STANDBY:
+		/* Standby should not interrupt a recording in progress. */
+		if (node->state.one_touch_record_on) {
+			node->state.one_touch_record_standby = true;
+			break;
+		}
 		enter_standby(node);
 		return;
 
-
 		/* One Touch Play and Routing Control */
 
 	case CEC_MSG_ACTIVE_SOURCE: {
diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index 4ecb62a6..80b126ac 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -802,6 +802,15 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
 		cec_msg_set_reply_to(&msg, &msg);
 		cec_msg_record_status(&msg, CEC_OP_RECORD_STATUS_TERMINATED_OK);
 		transmit(node, &msg);
+		/*
+		 * If standby was received during recording, enter standby when the recording is finished
+		 * unless the recording device is the currently the active source.
+		 */
+		if (node->state.one_touch_record_standby) {
+			if (node->phys_addr != node->state.active_source_pa)
+				enter_standby(node);
+			node->state.one_touch_record_standby = false;
+		}
 		node->state.one_touch_record_on = false;
 		return;
 	case CEC_MSG_RECORD_STATUS:
-- 
2.25.1

