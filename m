Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 639CD3A46EF
	for <lists+linux-media@lfdr.de>; Fri, 11 Jun 2021 18:46:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231877AbhFKQss (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Jun 2021 12:48:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230488AbhFKQsH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Jun 2021 12:48:07 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4801DC0611C1
        for <linux-media@vger.kernel.org>; Fri, 11 Jun 2021 09:45:48 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id m7so4897809pfa.10
        for <linux-media@vger.kernel.org>; Fri, 11 Jun 2021 09:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=90eJdF1Gp9dOJy3WL0Sy0/HJmENnRZdneP2Hgy9xhlA=;
        b=EgMweQ209R7+galCn2myEqqP98e/V6fch82fa/ulg3FyingM6BOaCkWN71Po6f9IjY
         WUSwYvJb4ODs6BCu2g6sdARzR9MT0hJgz70umSLaI+HKDPy/WslLdblkC6aWElu57hVB
         WHpvx+WZU+kh33eN2F9BNTMOBp3mhvZFRJ1QQPiy9UKVIs4Mo5uV4LP/ZlC239i1h9iI
         3IJG7QDwiPG4tA/SNSWG+LH0lL3bh1+7dDpw+pRqsHili5sM5wIC1ejSWQorNcmjUhyf
         4Lrb9VOhIrUWjW9rYxPDn7n4YPFpKX8/hLcvU5+l8BFE/r5jkRU1UwCKVIDBIYy+vlEz
         38Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=90eJdF1Gp9dOJy3WL0Sy0/HJmENnRZdneP2Hgy9xhlA=;
        b=oK/mnz7OXKCfmQEtiaNzOAfNDyF1Vrr8o4HNg55P+n9wvVnzPzPO/nzbGkRn7VIFOx
         Cd1k+5KsKwjPl6XzDNt1hG3FaXZZTeEAWfRWSw4ebO3GHPO7F6xl8MhouvSuJ834pJTP
         rxo4uSezVU7yKPNSI1Zk8hTcZgr5AAdBVnkjMmDVQIoPj3Ul9XEbskqty6bNPp0tUCfY
         QFTi0nIzoH4jvo77xemtm43ckAOsaEz1Ab81hVmBiD/brNK/ooKJYT0srxLv1PJbvJZw
         NQCP4EpZxaD/sFOhhawXIQP3REhDHLQInl7r5JGKo2ruFT/nbr2aHeBVc4PYf1Jkz/Va
         7jpA==
X-Gm-Message-State: AOAM531Nf2sHAF1H/tB2gYBNsEJ12iwdskowefl7x/Z4rJUg/L+crdZn
        gu/L8qJp5fYvNn0toC6h3PpHWxHnvLmR4A==
X-Google-Smtp-Source: ABdhPJy/w2n1PNWmDqUBmRLw/xcmMqhSfb/6Pu5VjIPliskRkJQ38Z8tbKgoKxRWFPJuhyOdTTIMTA==
X-Received: by 2002:a63:4e50:: with SMTP id o16mr4482814pgl.140.1623429947885;
        Fri, 11 Jun 2021 09:45:47 -0700 (PDT)
Received: from ada-comp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id z17sm5815254pfq.218.2021.06.11.09.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 09:45:47 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, jaffe1@gmail.com,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v7 2/3] cec: add tests for Deck Play message
Date:   Fri, 11 Jun 2021 09:45:26 -0700
Message-Id: <c69dbfd7208a2ddbbbfd9484ba41a7ac64982c47.1623428727.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623428727.git.deborahbrouwer3563@gmail.com>
References: <cover.1623428727.git.deborahbrouwer3563@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Send all Deck Play commands and check that the follower implements them.
Test that the follower returns Feature Abort for invalid Play operands.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
 utils/cec-compliance/cec-test.cpp     | 99 ++++++++++++++++++++++++---
 utils/cec-follower/cec-processing.cpp | 55 ++++++++++++++-
 2 files changed, 140 insertions(+), 14 deletions(-)

diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index 44f09b40..d463ffa4 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -33,6 +33,20 @@ static int deck_status_get(struct node *node, unsigned me, unsigned la, __u8 &de
 	return OK;
 }
 
+static int test_play_mode(struct node *node, unsigned me, unsigned la, __u8 play_mode, __u8 expected)
+{
+	struct cec_msg msg = {};
+	__u8 deck_status;
+
+	cec_msg_init(&msg, me, la);
+	cec_msg_play(&msg, play_mode);
+	fail_on_test(!transmit_timeout(node, &msg));
+	fail_on_test(cec_msg_status_is_abort(&msg)); /* Assumes deck has media. */
+	fail_on_test(deck_status_get(node, me, la, deck_status));
+	fail_on_test(deck_status != expected);
+
+	return OK;
+}
 
 /* System Information */
 
@@ -794,24 +808,78 @@ static int deck_ctl_deck_ctl_invalid(struct node *node, unsigned me, unsigned la
 static int deck_ctl_play(struct node *node, unsigned me, unsigned la, bool interactive)
 {
 	struct cec_msg msg = {};
+	__u8 deck_status;
 
 	cec_msg_init(&msg, me, la);
-	cec_msg_play(&msg, CEC_OP_PLAY_MODE_PLAY_STILL);
+	cec_msg_play(&msg, CEC_OP_PLAY_MODE_PLAY_FWD);
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
+		if (!incorrect_mode(&msg))
+			return FAIL;
+		if (deck_status == CEC_OP_DECK_INFO_NO_MEDIA)
+			info("Play Still: no media.\n");
+		else
+			warn("Deck has media but returned Feature Abort with Incorrect Mode.");
+		return OK;
+	}
+	fail_on_test(deck_status != CEC_OP_DECK_INFO_PLAY);
 
-	return OK_PRESUMED;
+	fail_on_test(test_play_mode(node, me, la, CEC_OP_PLAY_MODE_PLAY_STILL, CEC_OP_DECK_INFO_STILL));
+	fail_on_test(test_play_mode(node, me, la, CEC_OP_PLAY_MODE_PLAY_REV, CEC_OP_DECK_INFO_PLAY_REV));
+	fail_on_test(test_play_mode(node, me, la, CEC_OP_PLAY_MODE_PLAY_FAST_FWD_MIN, CEC_OP_DECK_INFO_FAST_FWD));
+	fail_on_test(test_play_mode(node, me, la, CEC_OP_PLAY_MODE_PLAY_FAST_REV_MIN, CEC_OP_DECK_INFO_FAST_REV));
+	fail_on_test(test_play_mode(node, me, la, CEC_OP_PLAY_MODE_PLAY_FAST_FWD_MED, CEC_OP_DECK_INFO_FAST_FWD));
+	fail_on_test(test_play_mode(node, me, la, CEC_OP_PLAY_MODE_PLAY_FAST_REV_MED, CEC_OP_DECK_INFO_FAST_REV));
+	fail_on_test(test_play_mode(node, me, la, CEC_OP_PLAY_MODE_PLAY_FAST_FWD_MAX, CEC_OP_DECK_INFO_FAST_FWD));
+	fail_on_test(test_play_mode(node, me, la, CEC_OP_PLAY_MODE_PLAY_FAST_REV_MAX, CEC_OP_DECK_INFO_FAST_REV));
+	fail_on_test(test_play_mode(node, me, la, CEC_OP_PLAY_MODE_PLAY_SLOW_FWD_MIN, CEC_OP_DECK_INFO_SLOW));
+	fail_on_test(test_play_mode(node, me, la, CEC_OP_PLAY_MODE_PLAY_SLOW_REV_MIN, CEC_OP_DECK_INFO_SLOW_REV));
+	fail_on_test(test_play_mode(node, me, la, CEC_OP_PLAY_MODE_PLAY_SLOW_FWD_MED, CEC_OP_DECK_INFO_SLOW));
+	fail_on_test(test_play_mode(node, me, la, CEC_OP_PLAY_MODE_PLAY_SLOW_REV_MED, CEC_OP_DECK_INFO_SLOW_REV));
+	fail_on_test(test_play_mode(node, me, la, CEC_OP_PLAY_MODE_PLAY_SLOW_FWD_MAX, CEC_OP_DECK_INFO_SLOW));
+	fail_on_test(test_play_mode(node, me, la, CEC_OP_PLAY_MODE_PLAY_SLOW_REV_MAX, CEC_OP_DECK_INFO_SLOW_REV));
+
+	cec_msg_init(&msg, me, la);
+	cec_msg_deck_control(&msg, CEC_OP_DECK_CTL_MODE_STOP);
+	fail_on_test(!transmit_timeout(node, &msg));
+
+	return OK;
+}
+
+static int deck_ctl_play_invalid(struct node *node, unsigned me, unsigned la, bool interactive)
+{
+	struct cec_msg msg = {};
+
+	cec_msg_init(&msg, me, la);
+	cec_msg_play(&msg, 0); /* Invalid Operand */
+	fail_on_test(!transmit_timeout(node, &msg));
+	if (unrecognized_op(&msg))
+		return OK_NOT_SUPPORTED;
+	fail_on_test(!cec_msg_status_is_abort(&msg));
+	fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
+
+	cec_msg_init(&msg, me, la);
+	cec_msg_play(&msg, 4); /* Invalid Operand */
+	fail_on_test(!transmit_timeout(node, &msg));
+	fail_on_test(!cec_msg_status_is_abort(&msg));
+	fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
+
+	cec_msg_init(&msg, me, la);
+	cec_msg_play(&msg, 0x26); /* Invalid Operand */
+	fail_on_test(!transmit_timeout(node, &msg));
+	fail_on_test(!cec_msg_status_is_abort(&msg));
+	fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
+
+	return OK;
 }
 
 static const vec_remote_subtests deck_ctl_subtests{
@@ -826,7 +894,6 @@ static const vec_remote_subtests deck_ctl_subtests{
 		deck_ctl_give_status_invalid,
 	},
 	{ "Deck Status", CEC_LOG_ADDR_MASK_ALL, deck_ctl_deck_status },
-	{ "Play", CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD, deck_ctl_play },
 	{
 		"Deck Control",
 		CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD,
@@ -837,6 +904,16 @@ static const vec_remote_subtests deck_ctl_subtests{
 		CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD,
 		deck_ctl_deck_ctl_invalid,
 	},
+	{
+		"Play",
+		CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD,
+		deck_ctl_play,
+	},
+	{
+		"Play Invalid Operand",
+		CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD,
+		deck_ctl_play_invalid,
+	},
 };
 
 /* Tuner Control */
diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index f88f0dcc..8665bf5a 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -551,14 +551,63 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
 			return;
 		}
 	case CEC_MSG_PLAY:
-		if (node->has_deck_ctl)
+		if (!node->has_deck_ctl)
+			break;
+
+		__u8 deck_state;
+		__u8 play_mode;
+
+		cec_ops_play(&msg, &play_mode);
+
+		switch (play_mode) {
+		case CEC_OP_PLAY_MODE_PLAY_FWD:
+			deck_state = CEC_OP_DECK_INFO_PLAY;
+			break;
+		case CEC_OP_PLAY_MODE_PLAY_REV:
+			deck_state = CEC_OP_DECK_INFO_PLAY_REV;
+			break;
+		case CEC_OP_PLAY_MODE_PLAY_STILL:
+			deck_state = CEC_OP_DECK_INFO_STILL;
+			break;
+		case CEC_OP_PLAY_MODE_PLAY_FAST_FWD_MIN:
+		case CEC_OP_PLAY_MODE_PLAY_FAST_FWD_MED:
+		case CEC_OP_PLAY_MODE_PLAY_FAST_FWD_MAX:
+			deck_state = CEC_OP_DECK_INFO_FAST_FWD;
+			break;
+		case CEC_OP_PLAY_MODE_PLAY_FAST_REV_MIN:
+		case CEC_OP_PLAY_MODE_PLAY_FAST_REV_MED:
+		case CEC_OP_PLAY_MODE_PLAY_FAST_REV_MAX:
+			deck_state = CEC_OP_DECK_INFO_FAST_REV;
+			break;
+		case CEC_OP_PLAY_MODE_PLAY_SLOW_FWD_MIN:
+		case CEC_OP_PLAY_MODE_PLAY_SLOW_FWD_MED:
+		case CEC_OP_PLAY_MODE_PLAY_SLOW_FWD_MAX:
+			deck_state = CEC_OP_DECK_INFO_SLOW;
+			break;
+		case CEC_OP_PLAY_MODE_PLAY_SLOW_REV_MIN:
+		case CEC_OP_PLAY_MODE_PLAY_SLOW_REV_MED:
+		case CEC_OP_PLAY_MODE_PLAY_SLOW_REV_MAX:
+			deck_state = CEC_OP_DECK_INFO_SLOW_REV;
+			break;
+		default:
+			cec_msg_reply_feature_abort(&msg, CEC_OP_ABORT_INVALID_OP);
+			transmit(node, &msg);
 			return;
-		break;
+		}
+		/* Only Play Forward and Play Still will close tray if open. */
+		if (play_mode != CEC_OP_PLAY_MODE_PLAY_FWD &&
+		    play_mode != CEC_OP_PLAY_MODE_PLAY_STILL &&
+		    node->state.deck_state == CEC_OP_DECK_INFO_NO_MEDIA) {
+				reply_feature_abort(node, &msg, CEC_OP_ABORT_INCORRECT_MODE);
+				return;
+		}
+		node->state.deck_skip_start = 0;
+		update_deck_state(node, me, deck_state);
+		return;
 	case CEC_MSG_DECK_CONTROL:
 		if (!node->has_deck_ctl)
 			break;
 
-		__u8 deck_state;
 		__u8 deck_control_mode;
 
 		cec_ops_deck_control(&msg, &deck_control_mode);
-- 
2.25.1

