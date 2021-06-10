Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F21A03A3829
	for <lists+linux-media@lfdr.de>; Fri, 11 Jun 2021 01:59:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230452AbhFKABa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 20:01:30 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:33608 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbhFKABa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 20:01:30 -0400
Received: by mail-pj1-f67.google.com with SMTP id k22-20020a17090aef16b0290163512accedso6311167pjz.0
        for <linux-media@vger.kernel.org>; Thu, 10 Jun 2021 16:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WpJbMPCnqY+5cSSHltvh9VDsua5JinRzHRIGvT/ySSk=;
        b=oGspBHjLRQjzhSDYgAKb5wonWZuSdf1bvq7HKjqXFtBH6qXjW7XbE8Om4ENXSLx92y
         cDByWQ7WYOB22h01bIZNUGwGtM9bVcSatRcmesGWzVnRgZHDpHnsOw9FcuBkgsoZ7fdA
         okitrP9O86Z+hSopWZHQZlO7HmvHNwWn8tfdRzRrZCaY9M2K7XBEhTp4ohWUbmnhWEds
         BZLXwRgoztqyffUmOBjHEv4ZTEtgcASeAhtrUHnAqnWIwRv28d7NJKomey2NEywJO7DK
         AiFt2GkaBKwF7L5/HyFKE3VgtwJW0ybTwNQVgGpDIpkq/NWkEjdaAI0rv/cpWfLXzuey
         WKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WpJbMPCnqY+5cSSHltvh9VDsua5JinRzHRIGvT/ySSk=;
        b=rJ96PHBHEq6MQkrhG8Ia9auE0QNbdwPTlwSZGgzgcFYSKlmLEKIxgr2SCvpUleuPCx
         qj9WzphZ7H8rKTIX9+l/OKhxjJVtIxVzrIXiKQWMo3MA9XTwXf8DaA6D7QImdhLPRVQm
         riliO94eJ+5qz+HlX+nn0dCqbU8+Wc++zKTSTIFD26rHD7E8USSUpdvtTdhJy7Tvulmj
         GpxjMiO0A+iG4JbGyZELI74lJUpslVXkydUA2JrwCSPx8X5/5qecB6yoF1eV5qEdzmI+
         o5l4HrRp+lchWfBkx62Tm8e3WJv6WqvUJOJz4rT4I14XHAaC09poadp72F3lfWRvRqV4
         gHNw==
X-Gm-Message-State: AOAM533GmTA0+8AT60XfmX7FfSkXiAldSz5sAh/xEha+KLcFY6XCFqna
        jlsyHy87h7MygkPAqDz73ZNpi6gIeH1wCQ==
X-Google-Smtp-Source: ABdhPJz/jV/uwpL1ltb63xWIj3fexKOiUd7DQ7H19SYpqikNL0LhgGF8issDVqNucGtdsag5ZJf5og==
X-Received: by 2002:a17:90a:df13:: with SMTP id gp19mr1388573pjb.11.1623369499910;
        Thu, 10 Jun 2021 16:58:19 -0700 (PDT)
Received: from ada-comp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id c4sm3588133pfo.189.2021.06.10.16.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 16:58:19 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, jaffe1@gmail.com,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v6 1/3] cec: add tests for Deck Control message
Date:   Thu, 10 Jun 2021 16:58:02 -0700
Message-Id: <fcb3b80d42c53f01676e527b2eb43eff31f71230.1623368303.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623368302.git.deborahbrouwer3563@gmail.com>
References: <cover.1623368302.git.deborahbrouwer3563@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Send all Deck Control commands Skip Forward, Skip Reverse, Stop and Eject
and check the corresponding deck status. Test that the follower returns
Feature Abort for invalid Deck Control operands.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
 utils/cec-compliance/cec-compliance.h |   5 ++
 utils/cec-compliance/cec-test.cpp     | 111 +++++++++++++++++++++++---
 utils/cec-follower/cec-follower.cpp   |   2 +
 utils/cec-follower/cec-follower.h     |   2 +
 utils/cec-follower/cec-processing.cpp |  70 +++++++++++++++-
 5 files changed, 178 insertions(+), 12 deletions(-)

diff --git a/utils/cec-compliance/cec-compliance.h b/utils/cec-compliance/cec-compliance.h
index fc50e6d9..818181ab 100644
--- a/utils/cec-compliance/cec-compliance.h
+++ b/utils/cec-compliance/cec-compliance.h
@@ -359,6 +359,11 @@ static inline bool refused(const struct cec_msg *msg)
 	return cec_msg_status_is_abort(msg) && abort_reason(msg) == CEC_OP_ABORT_REFUSED;
 }
 
+static inline bool incorrect_mode(const struct cec_msg *msg)
+{
+	return cec_msg_status_is_abort(msg) && abort_reason(msg) == CEC_OP_ABORT_INCORRECT_MODE;
+}
+
 static inline bool timed_out(const struct cec_msg *msg)
 {
 	return msg->rx_status & CEC_RX_STATUS_TIMEOUT;
diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index 65a3943a..83be6b73 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -19,6 +19,20 @@ struct remote_test {
 	const vec_remote_subtests &subtests;
 };
 
+static int deck_status_get(struct node *node, unsigned me, unsigned la, __u8 &deck_status)
+{
+	struct cec_msg msg = {};
+	deck_status = 0;
+
+	cec_msg_init(&msg, me, la);
+	cec_msg_give_deck_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
+	fail_on_test(!transmit_timeout(node, &msg));
+	fail_on_test(timed_out_or_abort(&msg));
+	cec_ops_deck_status(&msg, &deck_status);
+
+	return OK;
+}
+
 
 /* System Information */
 
@@ -688,24 +702,92 @@ static int deck_ctl_deck_status(struct node *node, unsigned me, unsigned la, boo
 static int deck_ctl_deck_ctl(struct node *node, unsigned me, unsigned la, bool interactive)
 {
 	struct cec_msg msg = {};
+	__u8 deck_status;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_deck_control(&msg, CEC_OP_DECK_CTL_MODE_STOP);
 	fail_on_test(!transmit_timeout(node, &msg));
-	if (is_playback_or_rec(la)) {
-		fail_on_test_v2(node->remote[la].cec_version,
-				node->remote[la].has_deck_ctl && unrecognized_op(&msg));
-		fail_on_test_v2(node->remote[la].cec_version,
-				!node->remote[la].has_deck_ctl && !unrecognized_op(&msg));
-	}
+	fail_on_test_v2(node->remote[la].cec_version,
+	                node->remote[la].has_deck_ctl && unrecognized_op(&msg));
+	fail_on_test_v2(node->remote[la].cec_version,
+	                !node->remote[la].has_deck_ctl && !unrecognized_op(&msg));
 	if (unrecognized_op(&msg))
 		return OK_NOT_SUPPORTED;
 	if (refused(&msg))
 		return OK_REFUSED;
-	if (cec_msg_status_is_abort(&msg))
-		return OK_PRESUMED;
+	fail_on_test(deck_status_get(node, me, la, deck_status));
+	if (cec_msg_status_is_abort(&msg)) {
+		if (incorrect_mode(&msg)) {
+			if (deck_status == CEC_OP_DECK_INFO_NO_MEDIA)
+				info("Stop: no media.\n");
+			else
+				warn("Deck has media but returned Feature Abort with Incorrect Mode.");
+			return OK;
+		}
+		return FAIL;
+	}
+	fail_on_test(deck_status != CEC_OP_DECK_INFO_STOP && deck_status != CEC_OP_DECK_INFO_NO_MEDIA);
 
-	return OK_PRESUMED;
+	cec_msg_init(&msg, me, la);
+	cec_msg_deck_control(&msg, CEC_OP_DECK_CTL_MODE_SKIP_FWD);
+	fail_on_test(!transmit_timeout(node, &msg));
+	fail_on_test(deck_status_get(node, me, la, deck_status));
+	/*
+	 * If there is no media, Skip Forward should Feature Abort with Incorrect Mode
+	 * even if Stop did not.  If Skip Forward does not Feature Abort, the deck
+	 * is assumed to have media.
+	 */
+	if (incorrect_mode(&msg)) {
+		fail_on_test(deck_status != CEC_OP_DECK_INFO_NO_MEDIA);
+		return OK;
+	}
+	fail_on_test(cec_msg_status_is_abort(&msg));
+	for (unsigned i = 0; deck_status == CEC_OP_DECK_INFO_SKIP_FWD && i < long_timeout; i++) {
+		sleep(1);
+		fail_on_test(deck_status_get(node, me, la, deck_status));
+	}
+	fail_on_test(deck_status != CEC_OP_DECK_INFO_PLAY);
+
+	cec_msg_init(&msg, me, la);
+	cec_msg_deck_control(&msg, CEC_OP_DECK_CTL_MODE_SKIP_REV);
+	fail_on_test(!transmit_timeout(node, &msg));
+	fail_on_test(cec_msg_status_is_abort(&msg)); /* Assumes deck has media. */
+	fail_on_test(deck_status_get(node, me, la, deck_status));
+	for (unsigned i = 0; deck_status == CEC_OP_DECK_INFO_SKIP_REV && i < long_timeout; i++) {
+		sleep(1);
+		fail_on_test(deck_status_get(node, me, la, deck_status));
+	}
+	fail_on_test(deck_status != CEC_OP_DECK_INFO_PLAY);
+
+	cec_msg_init(&msg, me, la);
+	cec_msg_deck_control(&msg, CEC_OP_DECK_CTL_MODE_EJECT);
+	fail_on_test(!transmit_timeout(node, &msg));
+	fail_on_test(cec_msg_status_is_abort(&msg));
+	fail_on_test(deck_status_get(node, me, la, deck_status));
+	fail_on_test(deck_status != CEC_OP_DECK_INFO_NO_MEDIA);
+
+	return OK;
+}
+
+static int deck_ctl_deck_ctl_invalid(struct node *node, unsigned me, unsigned la, bool interactive)
+{
+	struct cec_msg msg = {};
+
+	cec_msg_init(&msg, me, la);
+	cec_msg_deck_control(&msg, 0); /* Invalid Deck Control operand */
+	fail_on_test(!transmit_timeout(node, &msg));
+	if (unrecognized_op(&msg))
+		return OK_NOT_SUPPORTED;
+	fail_on_test(!cec_msg_status_is_abort(&msg));
+	fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
+
+	cec_msg_init(&msg, me, la);
+	cec_msg_deck_control(&msg, 5); /* Invalid Deck Control operand */
+	fail_on_test(!transmit_timeout(node, &msg));
+	fail_on_test(!cec_msg_status_is_abort(&msg));
+	fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
+
+	return OK;
 }
 
 static int deck_ctl_play(struct node *node, unsigned me, unsigned la, bool interactive)
@@ -743,8 +825,17 @@ static const vec_remote_subtests deck_ctl_subtests{
 		deck_ctl_give_status_invalid,
 	},
 	{ "Deck Status", CEC_LOG_ADDR_MASK_ALL, deck_ctl_deck_status },
-	{ "Deck Control", CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD, deck_ctl_deck_ctl },
 	{ "Play", CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD, deck_ctl_play },
+	{
+		"Deck Control",
+		CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD,
+		deck_ctl_deck_ctl,
+	},
+	{
+		"Deck Control Invalid Operand",
+		CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD,
+		deck_ctl_deck_ctl_invalid,
+	},
 };
 
 /* Tuner Control */
diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
index 047d7a04..ff47d698 100644
--- a/utils/cec-follower/cec-follower.cpp
+++ b/utils/cec-follower/cec-follower.cpp
@@ -314,7 +314,9 @@ void state_init(struct node &node)
 	node.state.volume = 50;
 	node.state.mute = false;
 	node.state.deck_report_changes = false;
+	node.state.deck_report_changes_to = 0;
 	node.state.deck_state = CEC_OP_DECK_INFO_STOP;
+	node.state.deck_skip_start = 0;
 	tuner_dev_info_init(&node.state);
 	node.state.last_aud_rate_rx_ts = 0;
 }
diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
index 0492faa9..68ef222a 100644
--- a/utils/cec-follower/cec-follower.h
+++ b/utils/cec-follower/cec-follower.h
@@ -50,7 +50,9 @@ struct state {
 	bool service_by_dig_id;
 	bool tuner_report_changes;
 	bool deck_report_changes;
+	__u8 deck_report_changes_to;
 	__u8 deck_state;
+	__u64 deck_skip_start;
 	unsigned toggle_power_status;
 	__u64 last_aud_rate_rx_ts;
 };
diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index 3d2e4a2c..4c7ba1d4 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -32,6 +32,9 @@
 /* The maximum interval in nanoseconds between audio rate messages as defined in the spec */
 #define MAX_AUD_RATE_MSG_INTERVAL_NS (2 * 1000000000ULL)
 
+/* The maximum interval in nanoseconds to allow a deck to skip forward/reverse */
+#define MAX_DECK_SKIP_NS (2 * 1000000000ULL)
+
 struct cec_enum_values {
 	const char *type_name;
 	__u8 value;
@@ -161,6 +164,7 @@ static bool enter_standby(struct node *node)
 		node->state.old_power_status = node->state.power_status;
 		node->state.power_status = CEC_OP_POWER_STATUS_STANDBY;
 		node->state.power_status_changed_time = time(nullptr);
+		node->state.deck_skip_start = 0;
 		dev_info("Changing state to standby\n");
 		return true;
 	}
@@ -252,6 +256,22 @@ static void aud_rate_msg_interval_check(struct node *node, __u64 ts_new)
 	}
 }
 
+static void update_deck_state(struct node *node, __u8 deck_state_new)
+{
+	if (node->state.deck_state != deck_state_new) {
+		node->state.deck_state = deck_state_new;
+
+		if (node->state.deck_report_changes) {
+
+			struct cec_msg msg = {};
+
+			msg.msg[0] = node->state.deck_report_changes_to;
+			cec_msg_deck_status(&msg, node->state.deck_state);
+			transmit(node, &msg);
+		}
+	}
+}
+
 static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
 {
 	__u8 to = cec_msg_destination(&msg);
@@ -517,6 +537,7 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
 		switch (status_req) {
 		case CEC_OP_STATUS_REQ_ON:
 			node->state.deck_report_changes = true;
+			node->state.deck_report_changes_to = (cec_msg_destination(&msg) << 4) | cec_msg_initiator(&msg);
 			fallthrough;
 		case CEC_OP_STATUS_REQ_ONCE:
 			cec_msg_set_reply_to(&msg, &msg);
@@ -525,6 +546,7 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
 			return;
 		case CEC_OP_STATUS_REQ_OFF:
 			node->state.deck_report_changes = false;
+			node->state.deck_report_changes_to = 0;
 			return;
 		default:
 			reply_feature_abort(node, &msg, CEC_OP_ABORT_INVALID_OP);
@@ -535,9 +557,48 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
 			return;
 		break;
 	case CEC_MSG_DECK_CONTROL:
-		if (node->has_deck_ctl)
+		if (!node->has_deck_ctl)
+			break;
+
+		__u8 deck_state;
+		__u8 deck_control_mode;
+
+		cec_ops_deck_control(&msg, &deck_control_mode);
+
+		switch (deck_control_mode) {
+		case CEC_OP_DECK_CTL_MODE_STOP:
+			deck_state = CEC_OP_DECK_INFO_STOP;
+			node->state.deck_skip_start = 0;
+			break;
+		case CEC_OP_DECK_CTL_MODE_SKIP_FWD:
+			/* Skip Forward will not retract the deck tray. */
+			if (node->state.deck_state == CEC_OP_DECK_INFO_NO_MEDIA) {
+				reply_feature_abort(node, &msg, CEC_OP_ABORT_INCORRECT_MODE);
+				return;
+			}
+			deck_state = CEC_OP_DECK_INFO_SKIP_FWD;
+			node->state.deck_skip_start = msg.rx_ts;
+			break;
+		case CEC_OP_DECK_CTL_MODE_SKIP_REV:
+			/* Skip Reverse will not retract the deck tray. */
+			if (node->state.deck_state == CEC_OP_DECK_INFO_NO_MEDIA) {
+				reply_feature_abort(node, &msg, CEC_OP_ABORT_INCORRECT_MODE);
+				return;
+			}
+			deck_state = CEC_OP_DECK_INFO_SKIP_REV;
+			node->state.deck_skip_start = msg.rx_ts;
+			break;
+		case CEC_OP_DECK_CTL_MODE_EJECT:
+			deck_state = CEC_OP_DECK_INFO_NO_MEDIA;
+			node->state.deck_skip_start = 0;
+			break;
+		default:
+			cec_msg_reply_feature_abort(&msg, CEC_OP_ABORT_INVALID_OP);
+			transmit(node, &msg);
 			return;
-		break;
+		}
+		update_deck_state(node, deck_state);
+		return;
 	case CEC_MSG_DECK_STATUS:
 		return;
 
@@ -1034,6 +1095,11 @@ void testProcessing(struct node *node, bool wallclock)
 
 		if (node->has_aud_rate)
 			aud_rate_msg_interval_check(node, ts_now);
+
+		if (node->state.deck_skip_start && ts_now - node->state.deck_skip_start > MAX_DECK_SKIP_NS) {
+			node->state.deck_skip_start = 0;
+			update_deck_state(node, CEC_OP_DECK_INFO_PLAY);
+		}
 	}
 	mode = CEC_MODE_INITIATOR;
 	doioctl(node, CEC_S_MODE, &mode);
-- 
2.25.1

