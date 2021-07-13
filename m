Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A6083C6A42
	for <lists+linux-media@lfdr.de>; Tue, 13 Jul 2021 08:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233305AbhGMGM1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jul 2021 02:12:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229798AbhGMGM1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jul 2021 02:12:27 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5FBBC0613DD
        for <linux-media@vger.kernel.org>; Mon, 12 Jul 2021 23:09:37 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id x16so9658774plg.3
        for <linux-media@vger.kernel.org>; Mon, 12 Jul 2021 23:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kuTjBA+1GYyGM0wZ9gSnhQ4iXlsuL7AZCXKp0cbCqg4=;
        b=MWDyZSfYSoDEcFkZA/8Mb8jg42/HZjMNB6EiqHKsmIQNX6qpAQmV+N+KYxiH4A2E5Y
         Whq/SL/6brb6MhrELrXdD2rmm6ILfKwY0EdQZk7drKD3JVR1OxuW3mTvBmkuKVwXgQEA
         K08hOm7+V6pYCbCCJqmDork+3IfghnUCBIZED3o5PlrIRkbN62Efw3E0CKEuXYFgOym+
         v9+BW4zjaSe+QfQEshSJoHHWfm7Ybaq7sjg+0CF9DnPKMIXWxxckNAHlHrNcRmffNqzi
         zy4zBjvkHPv6L5Jnqqgn+Ix3IwSDVK60Eby+fyXL5R/bi3YZwrgmeMG++DTTMPxLmFPC
         Uiiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kuTjBA+1GYyGM0wZ9gSnhQ4iXlsuL7AZCXKp0cbCqg4=;
        b=UudHcXGtqJMm4sF6AtzeTO9hsgYjc5COpC9DnJe4Cfaly2HjA4A31cl2xcHQCTNXah
         K6ki6dhgFUJP5mHeupKqOylugmcuIFrgPP59in4gqPe26Fd1FpsJWZnufWYFQpRMaAkA
         5cIaA20YBEBtkdGpz34k8rQMCSQTkTfDhiQJ/KNfDz82EtWoJg9GT1ic7GtvfXniuhG9
         IrH/7lfuopM8SJ99sPO73FnTVftF3lFYzXtFLoAFUfdQXQuDkQ8A7j6yT1DUDnxsq9Cn
         jRPa9j7CNwtVBhdvSwgQ1+zQCCnOfWk5gXb7FArHXmurF2+ToE+GmI2CILJ8ip4CteGz
         y58Q==
X-Gm-Message-State: AOAM530/OLQb/Y/2+93weY5PJGfwdS5r8iNLBAKmFEDSWxtYuhNtyySl
        7CF8nZeSFtMVx9tW76m0eoOPICD7L1XHEA==
X-Google-Smtp-Source: ABdhPJzWgGhBhEUo8XOo+UfiC01WfcRpPd4xZn4cfvDT54pvH5ye2fGwe4o+1NBQvAsFJDzmiOREew==
X-Received: by 2002:a17:902:c941:b029:12b:27b:a7b0 with SMTP id i1-20020a170902c941b029012b027ba7b0mr2426805pla.10.1626156577293;
        Mon, 12 Jul 2021 23:09:37 -0700 (PDT)
Received: from dbcomp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id a13sm15878362pfl.92.2021.07.12.23.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 23:09:36 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, jaffe1@gmail.com,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v4 2/2] cec-follower: emulate programmed timer recordings
Date:   Mon, 12 Jul 2021 23:09:20 -0700
Message-Id: <9ae9d7f22ba673216785532b544bf02348019c47.1626155911.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626155911.git.deborahbrouwer3563@gmail.com>
References: <cover.1626155911.git.deborahbrouwer3563@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Start and stop recording as timers are scheduled. Schedule future timers
if a completed timer has a recording sequence. Delete overlapped and
unfinished timers. Reduce available media space when a recording is
completed.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
 utils/cec-follower/cec-follower.cpp   |  5 +++
 utils/cec-follower/cec-follower.h     |  1 +
 utils/cec-follower/cec-processing.cpp | 65 +++++++++++++++++++++++++++
 utils/cec-follower/cec-tuner.cpp      | 15 ++++++-
 4 files changed, 84 insertions(+), 2 deletions(-)

diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
index b273b988..0adf6ce8 100644
--- a/utils/cec-follower/cec-follower.cpp
+++ b/utils/cec-follower/cec-follower.cpp
@@ -301,6 +301,10 @@ void print_timers(struct node *node)
 {
 	if (show_info) {
 		printf("Timers Set:\n");
+		if (node->state.recording_controlled_by_timer)
+			printf("Deck is currently recording from the first timer.\n");
+		if (node->state.one_touch_record_on && !node->state.recording_controlled_by_timer)
+			printf("Deck is currently recording independent of timers.\n");
 		for (auto &t : programmed_timers) {
 			std::string start = ctime(&t.start_time);
 			time_t end_time = t.start_time + t.duration;
@@ -373,6 +377,7 @@ void state_init(struct node &node)
 	node.state.one_touch_record_on = false;
 	node.state.record_received_standby = false;
 	node.state.media_space_available = 36000; /* In MB; space for 10 hours @ 1MB/sec */
+	node.state.recording_controlled_by_timer = false;
 	tuner_dev_info_init(&node.state);
 	node.state.last_aud_rate_rx_ts = 0;
 }
diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
index 69c96aa7..7b22368b 100644
--- a/utils/cec-follower/cec-follower.h
+++ b/utils/cec-follower/cec-follower.h
@@ -60,6 +60,7 @@ struct state {
 	bool one_touch_record_on;
 	bool record_received_standby;
 	int media_space_available;
+	bool recording_controlled_by_timer;
 	time_t toggle_power_status;
 	__u64 last_aud_rate_rx_ts;
 };
diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index 32375966..566444a4 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -1164,6 +1164,71 @@ void testProcessing(struct node *node, bool wallclock)
 			node->state.deck_skip_start = 0;
 			update_deck_state(node, me, CEC_OP_DECK_INFO_PLAY);
 		}
+
+		if (!programmed_timers.empty()) {
+			std::set<struct Timer>::iterator it = programmed_timers.begin();
+			/* Use the current minute because timers do not have second precision. */
+			time_t current_minute = time(nullptr) / 60;
+			time_t timer_start_minute = it->start_time / 60;
+			time_t timer_end_minute = (it->start_time + it->duration) / 60;
+
+			/* Start the timed recording only if the deck is not already recording. */
+			if (timer_start_minute == current_minute && !node->state.one_touch_record_on) {
+				node->state.one_touch_record_on = true;
+				node->state.recording_controlled_by_timer = true;
+				print_timers(node);
+			}
+
+			/* Delete an overlapped timer. Recording will be at best incomplete. */
+			if (timer_start_minute < current_minute &&
+			    (!node->state.recording_controlled_by_timer || !node->state.one_touch_record_on)) {
+				programmed_timers.erase(*it);
+				if (show_info)
+					printf("Deleted overlapped timer.\n");
+				print_timers(node);
+			}
+
+			/* Delete finished timers. */
+			if (timer_end_minute == current_minute && node->state.recording_controlled_by_timer) {
+				node->state.one_touch_record_on = false;
+				node->state.recording_controlled_by_timer = false;
+				node->state.media_space_available -= it->duration; /* 1 MB per second */
+				/*
+				 * TODO: We are only ever decreasing the amount of space available,
+				 * there is no heuristic that reclaims the space.
+				 */
+
+				if (it->recording_seq) {
+					struct tm *last_start_time = localtime(&(it->start_time));
+					int next_wday = (last_start_time->tm_wday + 1) % 7;
+					int days_to_move_ahead = 1;
+
+					while ((it->recording_seq & (1 << next_wday)) == 0) {
+						days_to_move_ahead++;
+						next_wday = (next_wday + 1) % 7;
+					}
+					struct Timer next_timer = {};
+					next_timer = *it;
+					last_start_time->tm_mday += days_to_move_ahead;
+					last_start_time->tm_isdst = -1;
+					next_timer.start_time = mktime(last_start_time);
+					programmed_timers.insert(next_timer);
+				}
+				programmed_timers.erase(*it);
+				if (show_info)
+					printf("Deleted finished timer.\n");
+				print_timers(node);
+				/*
+				 * If the finished timer was recording, and standby was received during recording,
+				 * enter standby when the recording stops unless recording device is the active source.
+				 */
+				if (node->state.record_received_standby) {
+					if (node->phys_addr != node->state.active_source_pa)
+						enter_standby(node);
+					node->state.record_received_standby = false;
+				}
+			}
+		}
 	}
 	mode = CEC_MODE_INITIATOR;
 	doioctl(node, CEC_S_MODE, &mode);
diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index e3e64a58..c3042e18 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -858,6 +858,15 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
 		cec_msg_record_status(&msg, CEC_OP_RECORD_STATUS_TERMINATED_OK);
 		transmit(node, &msg);
 		node->state.one_touch_record_on = false;
+
+		/* Delete any currently active recording timer or it may restart itself in first minute. */
+		if (node->state.recording_controlled_by_timer) {
+			node->state.recording_controlled_by_timer = false;
+			programmed_timers.erase(programmed_timers.begin());
+			if (show_info)
+				printf("Deleted manually stopped timer.\n");
+			print_timers(node);
+		}
 		/*
 		 * If standby was received during recording, enter standby when the
 		 * recording is finished unless recording device is the active source.
@@ -957,9 +966,10 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
 		auto it_previous_year = programmed_timers.find(timer_in_previous_year);
 
 		if (it_previous_year != programmed_timers.end()) {
-			if (node->state.one_touch_record_on && it_previous_year == programmed_timers.begin()) {
+			if (node->state.recording_controlled_by_timer && it_previous_year == programmed_timers.begin()) {
 				timer_cleared_status = CEC_OP_TIMER_CLR_STAT_RECORDING;
 				node->state.one_touch_record_on = false;
+				node->state.recording_controlled_by_timer = false;
 			} else {
 				timer_cleared_status = CEC_OP_TIMER_CLR_STAT_CLEARED;
 			}
@@ -972,9 +982,10 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
 		auto it_current_year = programmed_timers.find(timer_in_current_year);
 
 		if (it_current_year != programmed_timers.end()) {
-			if (node->state.one_touch_record_on && it_current_year == programmed_timers.begin()) {
+			if (node->state.recording_controlled_by_timer && it_current_year == programmed_timers.begin()) {
 				timer_cleared_status = CEC_OP_TIMER_CLR_STAT_RECORDING;
 				node->state.one_touch_record_on = false;
+				node->state.recording_controlled_by_timer = false;
 			} else {
 				/* Do not overwrite status if already set. */
 				if (timer_cleared_status == CEC_OP_TIMER_CLR_STAT_NO_MATCHING)
-- 
2.25.1

