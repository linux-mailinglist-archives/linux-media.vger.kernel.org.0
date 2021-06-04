Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7044B39B087
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 04:41:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229823AbhFDCnI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Jun 2021 22:43:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhFDCnI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Jun 2021 22:43:08 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7AE8C06174A
        for <linux-media@vger.kernel.org>; Thu,  3 Jun 2021 19:41:08 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id g6so6402430pfq.1
        for <linux-media@vger.kernel.org>; Thu, 03 Jun 2021 19:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=YuzY5rqOYw8A5M/0LuD1wT4JDXZmGJGNCqhnC6a3nZk=;
        b=ZRoRs5/erm52P8aqFhUYhuUovScN8LDbIecXLdGYCpJpl4sxgKHokvGRPeCiBL7V1j
         YcILp7TeYOp/qupezKkCKw8exv1OImzMii1grBFqjhZEyjbYhvjwCSF4iNJEkGaOif2J
         w3eIMudavDs1CEkF131UCyr7TZRb/5wZcubfGGr2qU/lUS9Mh2lfCmGfXR1H7DHMuC7C
         G7v+CWA/e3KwFzxO/aTBt6eM76vVl9yWviADOOvlh9G1DZbouNorznzx+nc6/Z9t5aGp
         ELTEKYf4wKGbjwN8whIW8C9+J+gsUghliaL2wz8A9U8K8vZEL3QfVhp7zIzg/zTmKEhb
         NRHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=YuzY5rqOYw8A5M/0LuD1wT4JDXZmGJGNCqhnC6a3nZk=;
        b=BiHsYKCHAirOOrh6ew8/3mEJM1tnm3nttnE5yRbCkcdBzKeu3tWcgwiWeKsU30fN9J
         hhKGZJLP0w6v6uyVUizN6ts1VEbdAJboaZW9qZpBvAV2obkgIeJtfA2EbDU3gb1NqTmg
         KVOc0/bZobzp5iY5nlxmqesIp/dgdwcwgLjZjcqsSTOlOxHDEv7ICPyS5I+eV7PTocRU
         HXIYyv2IZ+MvklB5FWXjL2Em2mDLn50O9zfQd2m/RLxBb3D0FCcueipoS8kjHdOJh6C/
         uP1GQv7A5pI6l/lD6qEHbHla/wpJGZ9mI96cO25R7R2iIcxkhlKL/qtsQYAgZlpZ/oy9
         eHsA==
X-Gm-Message-State: AOAM5310wdHjOA2U3uhTfn2DLU+uYc4bxUZ5HNaoU7OtfIClb2av4A/P
        7/ov0h9ygs8kDD+JjHS9kpf4fWC6CRz4TA==
X-Google-Smtp-Source: ABdhPJy8rXAczt0wkO2meKMLHDf1XtluWrPJ5f/dL4YUwHSPKNSp9LZWXjk9T3H94Pm30O8HtxLiGg==
X-Received: by 2002:a63:1c1c:: with SMTP id c28mr2586494pgc.16.1622774468497;
        Thu, 03 Jun 2021 19:41:08 -0700 (PDT)
Received: from djbComp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id z9sm3166356pji.47.2021.06.03.19.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 19:41:08 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, jaffe1@gmail.com,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v4 2/2] cec: add tests for Give Deck Status message
Date:   Thu,  3 Jun 2021 19:40:53 -0700
Message-Id: <9025929d71bf9b8b93f0d0fd25ec7a31dccc202c.1622773904.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1622773904.git.deborahbrouwer3563@gmail.com>
References: <cover.1622773904.git.deborahbrouwer3563@gmail.com>
In-Reply-To: <cover.1622773904.git.deborahbrouwer3563@gmail.com>
References: <cover.1622773904.git.deborahbrouwer3563@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Test that a valid Deck Status message is received in response to Give Deck
Status and that Give Deck Status automatic reporting can be turned on and
off. Test that the follower returns Feature Abort for an invalid Give Deck
Status operand.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
 utils/cec-compliance/cec-test.cpp     | 72 ++++++++++++++++++++++-----
 utils/cec-follower/cec-follower.cpp   |  2 +
 utils/cec-follower/cec-follower.h     |  1 +
 utils/cec-follower/cec-processing.cpp | 41 +++++++--------
 4 files changed, 81 insertions(+), 35 deletions(-)

diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index fb57d10b..4578dd13 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -601,10 +601,6 @@ static const vec_remote_subtests dev_menu_ctl_subtests{
 
 /* Deck Control */
 
-/*
-  TODO: These are very rudimentary tests which should be expanded.
- */
-
 static int deck_ctl_give_status(struct node *node, unsigned me, unsigned la, bool interactive)
 {
 	struct cec_msg msg = {};
@@ -613,12 +609,11 @@ static int deck_ctl_give_status(struct node *node, unsigned me, unsigned la, boo
 	cec_msg_give_deck_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
 	fail_on_test(!transmit_timeout(node, &msg));
 	fail_on_test(timed_out(&msg));
-	if (is_playback_or_rec(la)) {
-		fail_on_test_v2(node->remote[la].cec_version,
-				node->remote[la].has_deck_ctl && cec_msg_status_is_abort(&msg));
-		fail_on_test_v2(node->remote[la].cec_version,
-				!node->remote[la].has_deck_ctl && !unrecognized_op(&msg));
-	}
+
+	fail_on_test_v2(node->remote[la].cec_version,
+	                node->remote[la].has_deck_ctl && cec_msg_status_is_abort(&msg));
+	fail_on_test_v2(node->remote[la].cec_version,
+	                !node->remote[la].has_deck_ctl && !unrecognized_op(&msg));
 	if (unrecognized_op(&msg))
 		return OK_NOT_SUPPORTED;
 	if (refused(&msg))
@@ -626,7 +621,51 @@ static int deck_ctl_give_status(struct node *node, unsigned me, unsigned la, boo
 	if (cec_msg_status_is_abort(&msg))
 		return OK_PRESUMED;
 
-	return 0;
+	__u8 deck_info;
+
+	cec_ops_deck_status(&msg, &deck_info);
+	fail_on_test(deck_info < CEC_OP_DECK_INFO_PLAY || deck_info > CEC_OP_DECK_INFO_OTHER);
+
+	cec_msg_init(&msg, me, la);
+	cec_msg_give_deck_status(&msg, true, CEC_OP_STATUS_REQ_ON);
+	fail_on_test(!transmit_timeout(node, &msg));
+	fail_on_test(timed_out(&msg));
+	cec_ops_deck_status(&msg, &deck_info);
+	fail_on_test(deck_info < CEC_OP_DECK_INFO_PLAY || deck_info > CEC_OP_DECK_INFO_OTHER);
+
+	cec_msg_init(&msg, me, la);
+	cec_msg_give_deck_status(&msg, true, CEC_OP_STATUS_REQ_OFF);
+	/*
+	 * Reply would not normally be expected for CEC_OP_STATUS_REQ_OFF.
+	 * If a reply is received, then the follower failed to turn off
+	 * status reporting as required.
+	 */
+	msg.reply = CEC_MSG_DECK_STATUS;
+	fail_on_test(!transmit_timeout(node, &msg));
+	fail_on_test(!timed_out(&msg));
+
+	return OK;
+}
+
+static int deck_ctl_give_status_invalid(struct node *node, unsigned me, unsigned la, bool interactive)
+{
+	struct cec_msg msg = {};
+
+	cec_msg_init(&msg, me, la);
+	cec_msg_give_deck_status(&msg, true, 0); /* Invalid Operand */
+	fail_on_test(!transmit_timeout(node, &msg));
+	if (unrecognized_op(&msg))
+		return OK_NOT_SUPPORTED;
+	fail_on_test(!cec_msg_status_is_abort(&msg));
+	fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
+
+	cec_msg_init(&msg, me, la);
+	cec_msg_give_deck_status(&msg, true, 4); /* Invalid Operand */
+	fail_on_test(!transmit_timeout(node, &msg));
+	fail_on_test(!cec_msg_status_is_abort(&msg));
+	fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
+
+	return OK;
 }
 
 static int deck_ctl_deck_status(struct node *node, unsigned me, unsigned la, bool interactive)
@@ -693,7 +732,16 @@ static int deck_ctl_play(struct node *node, unsigned me, unsigned la, bool inter
 }
 
 static const vec_remote_subtests deck_ctl_subtests{
-	{ "Give Deck Status", CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD, deck_ctl_give_status },
+	{
+		"Give Deck Status",
+		CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD,
+		deck_ctl_give_status,
+	},
+	{
+		"Give Deck Status Invalid Operand",
+		CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD,
+		deck_ctl_give_status_invalid,
+	},
 	{ "Deck Status", CEC_LOG_ADDR_MASK_ALL, deck_ctl_deck_status },
 	{ "Deck Control", CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD, deck_ctl_deck_ctl },
 	{ "Play", CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD, deck_ctl_play },
diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
index 1f598fdf..047d7a04 100644
--- a/utils/cec-follower/cec-follower.cpp
+++ b/utils/cec-follower/cec-follower.cpp
@@ -313,6 +313,8 @@ void state_init(struct node &node)
 	node.state.sac_active = false;
 	node.state.volume = 50;
 	node.state.mute = false;
+	node.state.deck_report_changes = false;
+	node.state.deck_state = CEC_OP_DECK_INFO_STOP;
 	tuner_dev_info_init(&node.state);
 	node.state.last_aud_rate_rx_ts = 0;
 }
diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
index 391b9ab4..0492faa9 100644
--- a/utils/cec-follower/cec-follower.h
+++ b/utils/cec-follower/cec-follower.h
@@ -50,6 +50,7 @@ struct state {
 	bool service_by_dig_id;
 	bool tuner_report_changes;
 	bool deck_report_changes;
+	__u8 deck_state;
 	unsigned toggle_power_status;
 	__u64 last_aud_rate_rx_ts;
 };
diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index 5b9db19f..3d2e4a2c 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -505,36 +505,31 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
 		break;
 
 
-		/*
-		  Deck Control
-
-		  This is only a basic implementation.
-
-		  TODO: Device state should reflect whether we are playing,
-		  fast forwarding, etc.
-		*/
+		/* Deck Control */
 
 	case CEC_MSG_GIVE_DECK_STATUS:
-		if (node->has_deck_ctl) {
-			__u8 status_req;
+		if (!node->has_deck_ctl)
+			break;
 
-			cec_ops_give_deck_status(&msg, &status_req);
-			if (status_req < CEC_OP_STATUS_REQ_ON ||
-			    status_req > CEC_OP_STATUS_REQ_ONCE) {
-				reply_feature_abort(node, &msg, CEC_OP_ABORT_INVALID_OP);
-				return;
-			}
-			if (status_req != CEC_OP_STATUS_REQ_ONCE)
-				node->state.deck_report_changes =
-					status_req == CEC_OP_STATUS_REQ_ON;
-			if (status_req == CEC_OP_STATUS_REQ_OFF)
-				return;
+		__u8 status_req;
+		cec_ops_give_deck_status(&msg, &status_req);
+
+		switch (status_req) {
+		case CEC_OP_STATUS_REQ_ON:
+			node->state.deck_report_changes = true;
+			fallthrough;
+		case CEC_OP_STATUS_REQ_ONCE:
 			cec_msg_set_reply_to(&msg, &msg);
-			cec_msg_deck_status(&msg, CEC_OP_DECK_INFO_STOP);
+			cec_msg_deck_status(&msg, node->state.deck_state);
 			transmit(node, &msg);
 			return;
+		case CEC_OP_STATUS_REQ_OFF:
+			node->state.deck_report_changes = false;
+			return;
+		default:
+			reply_feature_abort(node, &msg, CEC_OP_ABORT_INVALID_OP);
+			return;
 		}
-		break;
 	case CEC_MSG_PLAY:
 		if (node->has_deck_ctl)
 			return;
-- 
2.17.1

