Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8350E3B3A10
	for <lists+linux-media@lfdr.de>; Fri, 25 Jun 2021 02:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232873AbhFYAPv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 20:15:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbhFYAPv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 20:15:51 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A78BEC061574
        for <linux-media@vger.kernel.org>; Thu, 24 Jun 2021 17:13:31 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id t13so6106325pgu.11
        for <linux-media@vger.kernel.org>; Thu, 24 Jun 2021 17:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f5t5UDb4vJG20SiwihfsLfWy50f1UicezNzyrqEKicg=;
        b=M2HooTYTCfJ6wRSJOCjgHitgoVQCaqS5+GKDKSvxpCmZlOb8aJ3FnxmPW76+UbT9f6
         14z1vDpbYqoEErKi6cPe2iD3NN37loO4XDd3mFpGgBTIgVvhVKT16YjMDzs9SYkEmzFL
         1vLdgiTEyFOHliqKbVle7DAAdTTJACEePsoCKk+6yUuUWsL8u2lYyRfD0d2jwRFalxLa
         u82c86qS5Cec9kVA1qTaF20eBk+vHHFGfqRt48pElTrJcxhWnjQCmRXaa/ZBkrNaVvDu
         BN92ov4cpDq6ia1jAHmObqYprF4flPlH/BKA+PEhdyIQ4D4XRulsE6Ys6YEG+u3hB4GJ
         OVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f5t5UDb4vJG20SiwihfsLfWy50f1UicezNzyrqEKicg=;
        b=dzAYyA9xO0ZrCf8ptT4vmz1A6A1vDfM96Qd33qdpjAjxvEZeYIlnEBjCHh0diEHCHc
         i0CQMFk7TX/La12j05Dv5SotYNNEa/fVIB2WORMvx8AGkNmf2+zwBKRnKGpFooh8kEa/
         G9+5PgBZlBuWcINqNm7C1eFNLOP0njV6DqCchBJnHG3THQtglhE7lCtJ401Re0LeYBQw
         wfrm8X+HSpAArnfGtiwdByKBH9rdOPxEx9O2dawcfBqm+FamvGavEGIvtHvHh8/WATI2
         2L6I1wVXveoIY58Gq6m9ZDT6JPp43oA9+SFQsKeBPQvcL5FJRibJ3PbEM5dK+wP65x27
         O3xg==
X-Gm-Message-State: AOAM530HKNWTz4yWTntZ+XH0exChiYCGinAINW8lcjxIGX4TpMn2X9CG
        HL7ztFQMS87eCYvLbI6U8Lmps7Pz+lzJbw==
X-Google-Smtp-Source: ABdhPJzO1/QeET5BmyisCJlkrapFpB3Is6rE7BBzXdZds340e9XeoGbFSEK+sawizTN5xOjbwBO+Fg==
X-Received: by 2002:a63:2c8a:: with SMTP id s132mr6953037pgs.65.1624580011165;
        Thu, 24 Jun 2021 17:13:31 -0700 (PDT)
Received: from ada-comp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id h22sm3799060pfc.21.2021.06.24.17.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 17:13:30 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, jaffe1@gmail.com,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v5 3/3] cec: add One Touch Record Standby tests
Date:   Thu, 24 Jun 2021 17:13:11 -0700
Message-Id: <7940ca575845c46d56d25e65b46db55682c719f7.1624578960.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1624578960.git.deborahbrouwer3563@gmail.com>
References: <cover.1624578960.git.deborahbrouwer3563@gmail.com>
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
 utils/cec-follower/cec-follower.cpp     |  1 +
 utils/cec-follower/cec-follower.h       |  2 +
 utils/cec-follower/cec-processing.cpp   |  8 +++-
 utils/cec-follower/cec-tuner.cpp        |  9 ++++
 5 files changed, 81 insertions(+), 2 deletions(-)

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
diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
index 482192e7..d6c9cdfb 100644
--- a/utils/cec-follower/cec-follower.cpp
+++ b/utils/cec-follower/cec-follower.cpp
@@ -318,6 +318,7 @@ void state_init(struct node &node)
 	node.state.deck_state = CEC_OP_DECK_INFO_STOP;
 	node.state.deck_skip_start = 0;
 	node.state.one_touch_record_on = false;
+	node.state.one_touch_record_standby = false;
 	tuner_dev_info_init(&node.state);
 	node.state.last_aud_rate_rx_ts = 0;
 }
diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
index 3bcb2774..a5d1c3a6 100644
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
@@ -230,5 +231,6 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
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
index 0f40b7d7..4d159456 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -716,6 +716,15 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
 		cec_msg_record_status(&msg, CEC_OP_RECORD_STATUS_TERMINATED_OK);
 		transmit(node, &msg);
 		node->state.one_touch_record_on = false;
+		/*
+		 * If standby was received during recording, enter standby when the recording is finished
+		 * unless the recording device is the currently the active source.
+		 */
+		if (node->state.one_touch_record_standby) {
+			if (node->phys_addr != node->state.active_source_pa)
+				enter_standby(node);
+			node->state.one_touch_record_standby = false;
+		}
 		return;
 	case CEC_MSG_RECORD_STATUS:
 		return;
-- 
2.25.1

