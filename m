Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F28F3C39AD
	for <lists+linux-media@lfdr.de>; Sun, 11 Jul 2021 02:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231330AbhGKAke (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 10 Jul 2021 20:40:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230408AbhGKAkc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 10 Jul 2021 20:40:32 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17CB0C0613DD
        for <linux-media@vger.kernel.org>; Sat, 10 Jul 2021 17:37:46 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id j199so12594115pfd.7
        for <linux-media@vger.kernel.org>; Sat, 10 Jul 2021 17:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+vKxRHAwUH/Ht6Th2FzOfgkmU7woded32NB6xhUS5Tg=;
        b=fSGhWjfDnUTBuWKQowdtOUgqh5itF+E15WE2+Qu1+nROuBJrVGtXB6P9m7hQ+ML8sO
         bFXzax7k2IBkMxQVduYNEeH4K/JOTCTy6gmIkgaQfbrlh8TwfzqSQjqz7Ok+ZDF4AudJ
         3mS38UoMp7Oc04gYqa78kfn7J0ovOPsjKaoYV0PWKVCM99oDwhm2Qcy3cfSdx7YlXiph
         Ki4aort7XMaZ7qru4mTBg0S8x38a2EIMBZ5QM38GHFB5ayVHs8ML9hlr8QGFL8saZgnj
         0FUsEvtJgHx77GiGe8fIyQVMdT5xDoSgLKs10gxONIQ6bu++VDVBvpbRNHeDjnqavfce
         42IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+vKxRHAwUH/Ht6Th2FzOfgkmU7woded32NB6xhUS5Tg=;
        b=ZfcNxwHeuXBv+rE+EHTeTCW2u8ixcE+zO5JrG4LIW8S4rpr6l3JrJQjT+s0PpOoWfN
         PO1HjQXKpdhk4KRwbDOpktYdLwi8jxF17NBDlUWFrULOn8w++waeGGWIzBL3ryRdNgYq
         sHESowrEVM7Qs2ovFoy1mRkeuu/44XAJpYPH9XXL93Sej+tRgBCKEZGvDFqLFgfkHd7p
         E/V2gFSRoKFF5auRfmOfrMQxYQuYdUgA6tfaQp5hqMfb/uW5XofWWy7BFog/eOpbjq6g
         3MSMmlyx/tOT+grMohY9RkAazocYcvlxeLD50GLDhY9qOuUWj8+0W7Ht/FWqBwhf254P
         Mu8g==
X-Gm-Message-State: AOAM532cgTiMOs4CrRR2XHikMpLI9cX/1pJkKax4zt/7q9XEty18PR7e
        j6nH96Lk3toXMVJ+MTSAuFfU4/WxdR2IEA==
X-Google-Smtp-Source: ABdhPJy8vxJpclUtkSc99wIFU4Ib8GWeFMGhtxbfIa1KC3gSBnPa0GX+B/v4v7jopQXzeZ8EfCdHtw==
X-Received: by 2002:a05:6a00:1a0f:b029:314:7bdf:9491 with SMTP id g15-20020a056a001a0fb02903147bdf9491mr45079283pfv.33.1625963865599;
        Sat, 10 Jul 2021 17:37:45 -0700 (PDT)
Received: from dbcomp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id j2sm10794130pfj.168.2021.07.10.17.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jul 2021 17:37:45 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, jaffe1@gmail.com,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v3 2/2] cec-follower: emulate programmed timer recordings
Date:   Sat, 10 Jul 2021 17:37:36 -0700
Message-Id: <b940889da47bc1c636993d9c7a93892eb18fa252.1625962440.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625962440.git.deborahbrouwer3563@gmail.com>
References: <cover.1625962440.git.deborahbrouwer3563@gmail.com>
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
 utils/cec-follower/cec-processing.cpp | 56 +++++++++++++++++++++++++++
 utils/cec-follower/cec-tuner.cpp      | 26 ++++++++++---
 4 files changed, 83 insertions(+), 5 deletions(-)

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
index 32375966..2987cb99 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -1164,6 +1164,62 @@ void testProcessing(struct node *node, bool wallclock)
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
+					struct tm last_start_time = *(localtime(&(it->start_time)));
+					int next_wday = (last_start_time.tm_wday + 1) % 7;
+					int days_to_move_ahead = 1;
+
+					while ((it->recording_seq & (1 << next_wday)) == 0) {
+						days_to_move_ahead++;
+						next_wday = (next_wday + 1) % 7;
+					}
+					struct Timer next_timer = {};
+					next_timer = *it;
+					last_start_time.tm_mday += days_to_move_ahead;
+					last_start_time.tm_isdst = -1;
+					next_timer.start_time = mktime(&last_start_time);
+					programmed_timers.insert(next_timer);
+				}
+				programmed_timers.erase(*it);
+				if (show_info)
+					printf("Deleted finished timer.\n");
+				print_timers(node);
+			}
+		}
 	}
 	mode = CEC_MODE_INITIATOR;
 	doioctl(node, CEC_S_MODE, &mode);
diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index 544cb662..37e2de24 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -864,6 +864,16 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
 		cec_msg_record_status(&msg, CEC_OP_RECORD_STATUS_TERMINATED_OK);
 		transmit(node, &msg);
 		node->state.one_touch_record_on = false;
+
+		/* Delete any currently active recording timer or it may restart itself in first minute. */
+		if (node->state.recording_controlled_by_timer) {
+			node->state.recording_controlled_by_timer = false;
+			std::set<struct Timer>::iterator it = programmed_timers.begin();
+			programmed_timers.erase(*it);
+			if (show_info)
+				printf("Deleted manually stopped timer.\n");
+			print_timers(node);
+		}
 		/*
 		 * If standby was received during recording, enter standby when the
 		 * recording is finished unless recording device is the active source.
@@ -946,12 +956,18 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
 			break;
 
 		__u8 timer_cleared_status = CEC_OP_TIMER_CLR_STAT_NO_MATCHING;
-		struct Timer timer = get_timer_from_message(msg);
 
-		if (programmed_timers.find(timer) != programmed_timers.end()) {
-			timer_cleared_status = CEC_OP_TIMER_CLR_STAT_CLEARED;
-			programmed_timers.erase(timer);
-			print_timers(node);
+		if (node->state.one_touch_record_on && node->state.recording_controlled_by_timer) {
+			timer_cleared_status = CEC_OP_TIMER_CLR_STAT_RECORDING;
+			/* TODO: Allow other timers to be cleared while one timer is recording. */
+		} else {
+			struct Timer timer = get_timer_from_message(msg);
+
+			if (programmed_timers.find(timer) != programmed_timers.end()) {
+				timer_cleared_status = CEC_OP_TIMER_CLR_STAT_CLEARED;
+				programmed_timers.erase(timer);
+				print_timers(node);
+			}
 		}
 		cec_msg_set_reply_to(&msg, &msg);
 		cec_msg_timer_cleared_status(&msg, timer_cleared_status);
-- 
2.25.1

