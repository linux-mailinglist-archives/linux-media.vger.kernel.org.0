Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A67463A3828
	for <lists+linux-media@lfdr.de>; Fri, 11 Jun 2021 01:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbhFKAAh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 20:00:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbhFKAAh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 20:00:37 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4B89C061574
        for <linux-media@vger.kernel.org>; Thu, 10 Jun 2021 16:58:23 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id y15so2950372pfl.4
        for <linux-media@vger.kernel.org>; Thu, 10 Jun 2021 16:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fYF6yshbdDnOc0oeiJlzqJ9QqxQWt81AFSnSKdi8F3c=;
        b=IgJxC0NA80Q/bhr5i0Frc1iD+whPs25Vw+CIDPdHZi/Bv26bAGMPHpfQND0xPg8OUL
         AaIP8WnVCtAEbCv2vVFZECHispHmD2HOhbFWkDA17IvD5UMzSrzkG9E7rp+lYz+wmYfE
         uniK/SINpbAAXTa6Jqw+F+73kpid2uzcpl3ffubwyXOWKuKqeOJ2GzpjuznVrDbdjFuk
         iDKIm4ASa0gB32COj09/GsYlg71k0CgWthsGAhzR/DlRo+eZ0KlN2K8OKyH8eg2AgvDd
         ixmQPbSlU+Sx9mjnegMDZW3VBgDYBXEDZXWj+AUHomHHIspG9i3P7f1ay0Q5yNtHW50H
         t8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fYF6yshbdDnOc0oeiJlzqJ9QqxQWt81AFSnSKdi8F3c=;
        b=Kxns13IqXgJbwCrTY6iihpQGdxX9RR8g4V/ujP4ImEatsw86MiKbTppMDgwgzKs6WQ
         rdayernQJpY9PCeIuFyz4kh3ryQJGV+Op+QsibXGJZ0T+bmmMz8d3V6v20X/WRe8Z92C
         uCsQmSdzYh3vVmuWuz6Xvk3vh0tjTuylgve5xi6HEdnkygvwxxh8wlbuzd60xauZ7fm/
         5j4vrBrjfLAR9BtXMtNBse8E80VReTzRu3J5cfRVpMEjKJsMwTPSGKkZVDWgauTVJCTf
         5YyE9Aba02Oq1dryL6lZgP9ULYtuvW9K7mBFb50P+rGXAPQLtFNC4WmJxdwhSOh/nM4C
         FkLQ==
X-Gm-Message-State: AOAM533Syv+CW/An93lpyoryY3YvNeqrw9IxIjtKvCCbi89ObSlZAh3s
        oBCbC9EwUKGXy8pYbB9oueOmiuC4ovfSRA==
X-Google-Smtp-Source: ABdhPJyQfY0HhKcKiE/it12WlbNhi18fjJgLQ3ZP6qWIz04cshhmVWQYsRCk7V/IIRGSowz3sGzwGA==
X-Received: by 2002:a63:d218:: with SMTP id a24mr831907pgg.345.1623369503431;
        Thu, 10 Jun 2021 16:58:23 -0700 (PDT)
Received: from ada-comp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id c4sm3588133pfo.189.2021.06.10.16.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 16:58:22 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, jaffe1@gmail.com,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v6 2/3] cec: add tests for Deck Play message
Date:   Thu, 10 Jun 2021 16:58:03 -0700
Message-Id: <8f655634f038f312a32434e1f7c37c3720f0eb57.1623368303.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623368302.git.deborahbrouwer3563@gmail.com>
References: <cover.1623368302.git.deborahbrouwer3563@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Send all Deck Play commands and check that the follower implements them.
Test that the follower returns Feature Abort for invalid Play operands.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
 utils/cec-compliance/cec-test.cpp     | 100 +++++++++++++++++++++++---
 utils/cec-follower/cec-processing.cpp |  70 +++++++++++++++++-
 2 files changed, 156 insertions(+), 14 deletions(-)

diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index 83be6b73..f2ec4e90 100644
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
 
@@ -793,24 +807,79 @@ static int deck_ctl_deck_ctl_invalid(struct node *node, unsigned me, unsigned la
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
+		if (incorrect_mode(&msg)) {
+			if (deck_status == CEC_OP_DECK_INFO_NO_MEDIA)
+				info("Play Still: no media.\n");
+			else
+				warn("Deck has media but returned Feature Abort with Incorrect Mode.");
+			return OK;
+		}
+		return FAIL;
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
+	cec_msg_play(&msg, 4); /* Invalid Operand */
+	fail_on_test(!transmit_timeout(node, &msg));
+	if (unrecognized_op(&msg))
+		return OK_NOT_SUPPORTED;
+	fail_on_test(!cec_msg_status_is_abort(&msg));
+	fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
+
+	cec_msg_init(&msg, me, la);
+	cec_msg_play(&msg, 8); /* Invalid Operand */
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
@@ -825,7 +894,6 @@ static const vec_remote_subtests deck_ctl_subtests{
 		deck_ctl_give_status_invalid,
 	},
 	{ "Deck Status", CEC_LOG_ADDR_MASK_ALL, deck_ctl_deck_status },
-	{ "Play", CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD, deck_ctl_play },
 	{
 		"Deck Control",
 		CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD,
@@ -836,6 +904,16 @@ static const vec_remote_subtests deck_ctl_subtests{
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
index 4c7ba1d4..e58df85f 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -553,14 +553,78 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
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
+			/* Play Forward will close tray if open. */
+			deck_state = CEC_OP_DECK_INFO_PLAY;
+			break;
+		case CEC_OP_PLAY_MODE_PLAY_REV:
+			if (node->state.deck_state == CEC_OP_DECK_INFO_NO_MEDIA) {
+				reply_feature_abort(node, &msg, CEC_OP_ABORT_INCORRECT_MODE);
+				return;
+			}
+			deck_state = CEC_OP_DECK_INFO_PLAY_REV;
+			break;
+		case CEC_OP_PLAY_MODE_PLAY_STILL:
+			/* Play Still will close tray if open. */
+			deck_state = CEC_OP_DECK_INFO_STILL;
+			break;
+		case CEC_OP_PLAY_MODE_PLAY_FAST_FWD_MIN:
+		case CEC_OP_PLAY_MODE_PLAY_FAST_FWD_MED:
+		case CEC_OP_PLAY_MODE_PLAY_FAST_FWD_MAX:
+			if (node->state.deck_state == CEC_OP_DECK_INFO_NO_MEDIA) {
+				reply_feature_abort(node, &msg, CEC_OP_ABORT_INCORRECT_MODE);
+				return;
+			}
+			deck_state = CEC_OP_DECK_INFO_FAST_FWD;
+			break;
+		case CEC_OP_PLAY_MODE_PLAY_FAST_REV_MIN:
+		case CEC_OP_PLAY_MODE_PLAY_FAST_REV_MED:
+		case CEC_OP_PLAY_MODE_PLAY_FAST_REV_MAX:
+			if (node->state.deck_state == CEC_OP_DECK_INFO_NO_MEDIA) {
+				reply_feature_abort(node, &msg, CEC_OP_ABORT_INCORRECT_MODE);
+				return;
+			}
+			deck_state = CEC_OP_DECK_INFO_FAST_REV;
+			break;
+		case CEC_OP_PLAY_MODE_PLAY_SLOW_FWD_MIN:
+		case CEC_OP_PLAY_MODE_PLAY_SLOW_FWD_MED:
+		case CEC_OP_PLAY_MODE_PLAY_SLOW_FWD_MAX:
+			if (node->state.deck_state == CEC_OP_DECK_INFO_NO_MEDIA) {
+				reply_feature_abort(node, &msg, CEC_OP_ABORT_INCORRECT_MODE);
+				return;
+			}
+			deck_state = CEC_OP_DECK_INFO_SLOW;
+			break;
+		case CEC_OP_PLAY_MODE_PLAY_SLOW_REV_MIN:
+		case CEC_OP_PLAY_MODE_PLAY_SLOW_REV_MED:
+		case CEC_OP_PLAY_MODE_PLAY_SLOW_REV_MAX:
+			if (node->state.deck_state == CEC_OP_DECK_INFO_NO_MEDIA) {
+				reply_feature_abort(node, &msg, CEC_OP_ABORT_INCORRECT_MODE);
+				return;
+			}
+			deck_state = CEC_OP_DECK_INFO_SLOW_REV;
+			break;
+		default:
+			cec_msg_reply_feature_abort(&msg, CEC_OP_ABORT_INVALID_OP);
+			transmit(node, &msg);
 			return;
-		break;
+		}
+		node->state.deck_skip_start = 0;
+		update_deck_state(node, deck_state);
+		return;
 	case CEC_MSG_DECK_CONTROL:
 		if (!node->has_deck_ctl)
 			break;
 
-		__u8 deck_state;
 		__u8 deck_control_mode;
 
 		cec_ops_deck_control(&msg, &deck_control_mode);
-- 
2.25.1

