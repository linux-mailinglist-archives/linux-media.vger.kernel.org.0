Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECA1A3AFC08
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 06:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbhFVEig (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 00:38:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbhFVEid (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 00:38:33 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21BFBC061574
        for <linux-media@vger.kernel.org>; Mon, 21 Jun 2021 21:36:17 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x16so15400473pfa.13
        for <linux-media@vger.kernel.org>; Mon, 21 Jun 2021 21:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gNUfcX4+o5oyoSfrcCEGTnwI611TQdibzuK6/m2JWNE=;
        b=BM46dTkrwqezmr00N+zeJf9kCWk92pAf3XWwoHS65dDSKPbjkMIy6I5mBiUFaIPQ92
         PnqtwLE8P+i0wlHsDFyNHh47E0FqF7ByZCR8H1WOuzBXZhbd4I6RvmlaYQKW7jDdyxKd
         jUmhZ9sh5BFxt9SdzQCadmHO6cmNnEQdE2SbdiYlkdy3BuF+ahHxuq961GykbVXRTYT4
         wciDzvNOTyKf4Ikw9/RzXQrWMk05qDcPXIPu6t6wpcf3emO4ccdgoZXuiOaONoPqcnoE
         dN9dHTLBa6VQ1/t7ztb2syQcZESj3EpXjaGFb1HFrt4p+w7I/F7TLNcXBbYFc/H/1izX
         QWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gNUfcX4+o5oyoSfrcCEGTnwI611TQdibzuK6/m2JWNE=;
        b=WbbfiZwU995bxkOjR2+DzdqvLkdPbsVeaUILZ6F8Xz4AamLF7zGFdwf5mx9aUmygUq
         O9TlildPu7CERahFvAHzeNqQFh3UpDYr1un1+yAwm6poPziyQoDVsSL6aqERPVVrgRXT
         ETynURX3uv/5sjcaqK+TYgeUAy6wcVHRRuLkUVsbiRKzilbJzoWMwJd4rXkrKAlh19R3
         Sfnqg7Ifr16/reBW1t+RGEq0BiDJlhu86z/K6f88a2pBwqS355RrcZ1phOTEp5Qfst3r
         pN4V7/3n17+twLCJLrRWBgH/z7ekYGNyiyKR6aOorZe6Jh0/vg2EfZLeJsb+k9XqfQSG
         vPIQ==
X-Gm-Message-State: AOAM531t2KjQdgn9CDKzWHm5TfUamIpBZ0kQl0XMcen6cKSlv6tFD/6F
        7rxn59iBbmhstAnCJruuJJ0iJqO0iMzw/w==
X-Google-Smtp-Source: ABdhPJyoh4KFo6mVsW6jLNnMNpl3EWTdpjgGNayYFjKoMfo8Al1qRlca0zq5vPeIxHud8obdfdpgHA==
X-Received: by 2002:a65:52cb:: with SMTP id z11mr1860781pgp.201.1624336576609;
        Mon, 21 Jun 2021 21:36:16 -0700 (PDT)
Received: from ada-comp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id g4sm2152562pfu.134.2021.06.21.21.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 21:36:16 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, jaffe1@gmail.com,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v3 3/3] cec: add One Touch Record Standby tests
Date:   Mon, 21 Jun 2021 21:36:01 -0700
Message-Id: <770d218756aacdd68bfd6cbb593b4cbccfa97c40.1624336366.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1624336366.git.deborahbrouwer3563@gmail.com>
References: <cover.1624336366.git.deborahbrouwer3563@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Check that the recording device ignores a standby message while it is
recording. When the recording is finished, check that the recording device
enters standby unless the recording device is the active source.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
 utils/cec-compliance/cec-test-power.cpp | 63 +++++++++++++++++++++++++
 utils/cec-follower/cec-follower.cpp     |  1 +
 utils/cec-follower/cec-follower.h       |  2 +
 utils/cec-follower/cec-processing.cpp   |  7 ++-
 utils/cec-follower/cec-tuner.cpp        |  9 ++++
 5 files changed, 81 insertions(+), 1 deletion(-)

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
index 482192e7..ff8bdff7 100644
--- a/utils/cec-follower/cec-follower.cpp
+++ b/utils/cec-follower/cec-follower.cpp
@@ -317,6 +317,7 @@ void state_init(struct node &node)
 	node.state.deck_report_changes_to = 0;
 	node.state.deck_state = CEC_OP_DECK_INFO_STOP;
 	node.state.deck_skip_start = 0;
+	node.state.one_touch_record_standby = false;
 	node.state.one_touch_record_on = false;
 	tuner_dev_info_init(&node.state);
 	node.state.last_aud_rate_rx_ts = 0;
diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
index 8e8877d7..4fdc4aec 100644
--- a/utils/cec-follower/cec-follower.h
+++ b/utils/cec-follower/cec-follower.h
@@ -53,6 +53,7 @@ struct state {
 	__u8 deck_report_changes_to;
 	__u8 deck_state;
 	__u64 deck_skip_start;
+	bool one_touch_record_standby;
 	bool one_touch_record_on;
 	time_t toggle_power_status;
 	__u64 last_aud_rate_rx_ts;
@@ -229,5 +230,6 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
 void reply_feature_abort(struct node *node, struct cec_msg *msg,
 			 __u8 reason = CEC_OP_ABORT_UNRECOGNIZED_OP);
 void testProcessing(struct node *node, bool wallclock);
+bool enter_standby(struct node *node);
 
 #endif
diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index b1c8f3d9..b4ddb8b4 100644
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
@@ -320,6 +320,11 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me, __u8
 		/* Standby */
 
 	case CEC_MSG_STANDBY:
+		 /* Standby should not interrupt a recording in progress. */
+		if (node->state.one_touch_record_on) {
+			node->state.one_touch_record_standby = true;
+			break;
+		}
 		enter_standby(node);
 		return;
 
diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index c6dd47f0..225fa934 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -708,6 +708,15 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
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

