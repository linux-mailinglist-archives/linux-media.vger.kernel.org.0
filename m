Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD7A73B8A6D
	for <lists+linux-media@lfdr.de>; Thu,  1 Jul 2021 00:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233516AbhF3WZq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Jun 2021 18:25:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232917AbhF3WZf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Jun 2021 18:25:35 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E260AC061756
        for <linux-media@vger.kernel.org>; Wed, 30 Jun 2021 15:23:04 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id cs1-20020a17090af501b0290170856e1a8aso5375650pjb.3
        for <linux-media@vger.kernel.org>; Wed, 30 Jun 2021 15:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wry1HW3E0IimwH2uuLljbHzQFweIP5mw3HhkaaMldOs=;
        b=ZBB1be0C/ElujC1UYZpc5MkTXwW5T+MfYjFzhJ2+MKvLxn/GLlK11D1umFYo+S14EI
         08w23KtVn2vqZdE6B7Lvts8Lx8dcKIaN+iwEG9RCEBcPYhGcVNFqZzvDLhETGeUb75WW
         x/68qa4kKNtzzuFbUBL7nsw8wt7q4/O+Qi3RO8oEBDZsYC9aXDn+lpB6NCSn2DndhxNP
         SLjiIayau96vRRIrVIS8VZnIzMKsAt+9ZKKHmnvATRLoWBV3rgE1KgHolY2h+HYCMrad
         ptIA0PU3RbPqB3AwbW3UxIuN5AgTjfq7J+F0XRF0Mpwr4PYw+P6jpSp9r5q/Lp9h5nJq
         E2PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wry1HW3E0IimwH2uuLljbHzQFweIP5mw3HhkaaMldOs=;
        b=MaIBjhp883KZVZINjsH0HjP+zuAfAnTjFa1N5q9XflUi1LHOfeRSG6bkqXEY/yDFFf
         R45/r2Q2Py4FURQ5hesx8UHXi3ANM5ZPVDwtbmEbyMIySGw42Y+fsKOA75SmzC/zfdNa
         jzifk0QHPCPALIEqrN7yEo5P95d53O4jHRg3U7q5vdCdvRxR9kYUxKpYRiTl34TVxnA9
         3S+hC+voM5IdcIwohhXioXmmB9y0LK5EzDIae05OBf0BE2Rhm0fsKn6lDHZ0CxQbotJN
         aEaoxzLDV8tnp1NDwu5B494ZDfMdJUThLoP24MKedQ8U9uhi4yx1KMobQtbu8UXgnx7Y
         0KgA==
X-Gm-Message-State: AOAM5328uDEak66pSzjDgc4LsxmNJtljJrQJrUhajz0/8oL77+J8pgA6
        KrOLc5bNaJWX21AQWgWovq7vBY8ISab42A==
X-Google-Smtp-Source: ABdhPJwE2nn9fS0kvEJkRk68RkZxb2J17vBPkgcLmPcTaBwc6yCZZYSrbmAuZ3Poe9El/ZS1Q2wnfg==
X-Received: by 2002:a17:90b:4d8b:: with SMTP id oj11mr6558885pjb.146.1625091784451;
        Wed, 30 Jun 2021 15:23:04 -0700 (PDT)
Received: from dbcomp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id 76sm22762669pfu.131.2021.06.30.15.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 15:23:04 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, jaffe1@gmail.com,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v7 2/2] cec: add One Touch Record Standby tests
Date:   Wed, 30 Jun 2021 15:22:56 -0700
Message-Id: <b531359f796f1ff493306d6933a1721abf50ad11.1625091218.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625091218.git.deborahbrouwer3563@gmail.com>
References: <cover.1625091218.git.deborahbrouwer3563@gmail.com>
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
 utils/cec-compliance/cec-test-power.cpp | 62 +++++++++++++++++++++++++
 utils/cec-follower/cec-follower.cpp     |  1 +
 utils/cec-follower/cec-follower.h       |  2 +
 utils/cec-follower/cec-processing.cpp   | 14 +++++-
 utils/cec-follower/cec-tuner.cpp        |  9 ++++
 5 files changed, 87 insertions(+), 1 deletion(-)

diff --git a/utils/cec-compliance/cec-test-power.cpp b/utils/cec-compliance/cec-test-power.cpp
index b675bfc4..f23d0414 100644
--- a/utils/cec-compliance/cec-test-power.cpp
+++ b/utils/cec-compliance/cec-test-power.cpp
@@ -677,6 +677,66 @@ static int standby_resume_wakeup_deck_play(struct node *node, unsigned me, unsig
 	return standby_resume_wakeup_deck(node, me, la, interactive, CEC_OP_PLAY_MODE_PLAY_FWD);
 }
 
+static int standby_record(struct node *node, unsigned me, unsigned la, bool interactive, bool active_source)
+{
+	struct cec_msg msg;
+	__u8 rec_status;
+	unsigned unresponsive_time = 0;
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
+	if (active_source)
+		cec_msg_active_source(&msg, node->remote[la].phys_addr);
+	else
+		cec_msg_active_source(&msg, me);
+	fail_on_test(!transmit_timeout(node, &msg));
+
+	cec_msg_init(&msg, me, la);
+	cec_msg_standby(&msg);
+	fail_on_test(!transmit_timeout(node, &msg));
+	/* Standby should not interrupt the recording. */
+	fail_on_test(!poll_stable_power_status(node, me, la, CEC_OP_POWER_STATUS_ON, unresponsive_time));
+
+	cec_msg_init(&msg, me, la);
+	cec_msg_record_off(&msg, false);
+	fail_on_test(!transmit_timeout(node, &msg));
+
+	/* When the recording stops, recorder should standby unless it is the active source. */
+	if (active_source) {
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
+	return standby_record(node, me, la, interactive, true);
+}
+
+static int standby_record_inactive_source(struct node *node, unsigned me, unsigned la, bool interactive)
+{
+	return standby_record(node, me, la, interactive, false);
+}
+
 const vec_remote_subtests standby_resume_subtests{
 	{ "Standby", CEC_LOG_ADDR_MASK_ALL, standby_resume_standby },
 	{ "Repeated Standby message does not wake up", CEC_LOG_ADDR_MASK_ALL, standby_resume_standby_toggle },
@@ -697,4 +757,6 @@ const vec_remote_subtests standby_resume_subtests{
 	{ "Power State Transitions", CEC_LOG_ADDR_MASK_TV, power_state_transitions, false, true },
 	{ "Deck Eject Standby Resume", CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD, standby_resume_wakeup_deck_eject },
 	{ "Deck Play Standby Resume", CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD, standby_resume_wakeup_deck_play },
+	{ "Record Standby Active Source", CEC_LOG_ADDR_MASK_RECORD | CEC_LOG_ADDR_MASK_BACKUP, standby_record_active_source },
+	{ "Record Standby Inactive Source", CEC_LOG_ADDR_MASK_RECORD | CEC_LOG_ADDR_MASK_BACKUP, standby_record_inactive_source },
 };
diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
index 482192e7..2816fb85 100644
--- a/utils/cec-follower/cec-follower.cpp
+++ b/utils/cec-follower/cec-follower.cpp
@@ -318,6 +318,7 @@ void state_init(struct node &node)
 	node.state.deck_state = CEC_OP_DECK_INFO_STOP;
 	node.state.deck_skip_start = 0;
 	node.state.one_touch_record_on = false;
+	node.state.record_received_standby = false;
 	tuner_dev_info_init(&node.state);
 	node.state.last_aud_rate_rx_ts = 0;
 }
diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
index 8dfbd39f..833dec5e 100644
--- a/utils/cec-follower/cec-follower.h
+++ b/utils/cec-follower/cec-follower.h
@@ -54,6 +54,7 @@ struct state {
 	__u8 deck_state;
 	__u64 deck_skip_start;
 	bool one_touch_record_on;
+	bool record_received_standby;
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
index e1a71d6c..32375966 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -146,6 +146,9 @@ void reply_feature_abort(struct node *node, struct cec_msg *msg, __u8 reason)
 
 static bool exit_standby(struct node *node)
 {
+	/* Cancel any standby request that was pending. */
+	node->state.record_received_standby = false;
+
 	if (node->state.power_status == CEC_OP_POWER_STATUS_STANDBY ||
 	    node->state.power_status == CEC_OP_POWER_STATUS_TO_STANDBY) {
 		node->state.old_power_status = node->state.power_status;
@@ -157,14 +160,23 @@ static bool exit_standby(struct node *node)
 	return false;
 }
 
-static bool enter_standby(struct node *node)
+bool enter_standby(struct node *node)
 {
 	if (node->state.power_status == CEC_OP_POWER_STATUS_ON ||
 	    node->state.power_status == CEC_OP_POWER_STATUS_TO_ON) {
+		/*
+		 * Standby should not interrupt a recording in progress, but
+		 * remember to go to standby once the recording is finished.
+		 */
+		if (node->state.one_touch_record_on) {
+			node->state.record_received_standby = true;
+			return false;
+		}
 		node->state.old_power_status = node->state.power_status;
 		node->state.power_status = CEC_OP_POWER_STATUS_STANDBY;
 		node->state.power_status_changed_time = time(nullptr);
 		node->state.deck_skip_start = 0;
+		node->state.record_received_standby = false;
 		dev_info("Changing state to standby\n");
 		return true;
 	}
diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index 13cf6d20..e1d8b8fc 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -724,6 +724,15 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
 		cec_msg_record_status(&msg, CEC_OP_RECORD_STATUS_TERMINATED_OK);
 		transmit(node, &msg);
 		node->state.one_touch_record_on = false;
+		/*
+		 * If standby was received during recording, enter standby when the
+		 * recording is finished unless recording device is the active source.
+		 */
+		if (node->state.record_received_standby) {
+			if (node->phys_addr != node->state.active_source_pa)
+				enter_standby(node);
+			node->state.record_received_standby = false;
+		}
 		return;
 	case CEC_MSG_RECORD_STATUS:
 		return;
-- 
2.25.1

