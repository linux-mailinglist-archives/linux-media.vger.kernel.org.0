Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F12FE3A688B
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 15:54:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234488AbhFNN4J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 09:56:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234476AbhFNN4E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 09:56:04 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60050C061574
        for <linux-media@vger.kernel.org>; Mon, 14 Jun 2021 06:53:45 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id w31so6183227pga.6
        for <linux-media@vger.kernel.org>; Mon, 14 Jun 2021 06:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1BdPKaH54pvfaYtCFOshYuHeBFBrKEcUDLyTdIcjCiU=;
        b=c7pkIcpIgM1jU1T9qamekRawyz4zq7bzFN6XkujyErXRlhH4aWC+KfbcTRqjgqFIb4
         wqfEB5dlygX2JoNqMW2vXiKe+XNyDJSnqC7yr6vXT/dZIepmxv/HLCDgWzhaNVaJt8rp
         wVUZwVlKZKCV/9LPJFNKAszlhtJJIsMKSeynb2WzVq6BaTDSjXtteFzbWKdSZvPaNGDp
         Bzd7khdH/l5oFRf1wT1KniHlMRAEKxsVZSwT7MCq2N4dW1UJD41AdtdC4oeYLhJPah1+
         PUQjwmY7ZUk9e36ghAdmufKjByzqCuApZzPo4OnycW+Gpu1qAhWPGQha+nHPRvUPXIGK
         W3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1BdPKaH54pvfaYtCFOshYuHeBFBrKEcUDLyTdIcjCiU=;
        b=fg7tCM7cjnnEcJ76bVokWd59KJqXeBrm3rUSt8u/s37kX/ePrWSdmk6YQXx0tUL/uh
         4U34ajujRcYa2BltFTRB8fzBi/gDE8KjBdV3ojuOPZlkX7wnoGHSBz7uZV8EaBP94dT7
         kjyFMH+0w18OW1ZS5e2tZuAnYjK2EQwd3oejIVBTfaRD7ZLVmic3xY5RC+W1MqOWyfAB
         S6QF5QKEnBFyiq3KYDm7c2Xj62qAKVvXp7bwN5asZECvjSYDUHuo6mYSvxhbsa4fYbZN
         4UoreHp3LFkt1amaaL1kcN6KFzU6N//rCc4Rq6YMHfgICOYFjWvIPpjmFmG5UTwhjYDl
         Gf0A==
X-Gm-Message-State: AOAM532Sjl4t2y1dQs3cTG9xcLXQ8Cu/ThEJ8xIGnasnRXwq8XrqtnzZ
        FqzgK/kPfEusHcLLPr/Dlo/IbLmHwIMGsg==
X-Google-Smtp-Source: ABdhPJwd4IohCqKzXr6x80RCDaoOyIVZkqgBBL0NtjNqKQqwE5Sbf/fm9VuVhhbV9kYcktCW40HClg==
X-Received: by 2002:a62:687:0:b029:2ef:be02:c346 with SMTP id 129-20020a6206870000b02902efbe02c346mr22062758pfg.51.1623678824844;
        Mon, 14 Jun 2021 06:53:44 -0700 (PDT)
Received: from ada-comp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id q16sm4211223pfk.209.2021.06.14.06.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 06:53:44 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, jaffe1@gmail.com,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v2] cec: add Deck Control wake-up handling tests
Date:   Mon, 14 Jun 2021 06:53:38 -0700
Message-Id: <20210614135338.8838-1-deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Test that a deck in standby will wake up upon receiving the Deck Control
messages Eject or Play Forward.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
This is part of an Outreachy project to expand the testing of
Deck Control messages as handled by CEC adapters.

Changes since v2:
	- move tests to cec-test-power.cpp
	- check if deck control is supported by sending REQ_ONCE
	- use a single function that accepts different ops

 utils/cec-compliance/cec-compliance.h   |  1 +
 utils/cec-compliance/cec-test-power.cpp | 58 +++++++++++++++++++++++++
 utils/cec-compliance/cec-test.cpp       |  1 +
 utils/cec-follower/cec-processing.cpp   |  2 +
 4 files changed, 62 insertions(+)

diff --git a/utils/cec-compliance/cec-compliance.h b/utils/cec-compliance/cec-compliance.h
index 818181ab..057f42c4 100644
--- a/utils/cec-compliance/cec-compliance.h
+++ b/utils/cec-compliance/cec-compliance.h
@@ -468,5 +468,6 @@ extern const vec_remote_subtests standby_subtests;
 extern const vec_remote_subtests one_touch_play_subtests;
 extern const vec_remote_subtests power_status_subtests;
 extern const vec_remote_subtests standby_resume_subtests;
+extern const vec_remote_subtests deck_ctl_standby_resume_subtests;
 
 #endif
diff --git a/utils/cec-compliance/cec-test-power.cpp b/utils/cec-compliance/cec-test-power.cpp
index bc88eca7..49241093 100644
--- a/utils/cec-compliance/cec-test-power.cpp
+++ b/utils/cec-compliance/cec-test-power.cpp
@@ -652,3 +652,61 @@ const vec_remote_subtests standby_resume_subtests{
 	{ "Wake up TV on Text View On", CEC_LOG_ADDR_MASK_TV, standby_resume_wakeup_text_view_on },
 	{ "Power State Transitions", CEC_LOG_ADDR_MASK_TV, power_state_transitions, false, true },
 };
+
+static int standby_resume_wakeup_deck(struct node *node, unsigned me, unsigned la, bool interactive, __u8 opcode)
+{
+	struct cec_msg msg = {};
+
+	cec_msg_init(&msg, me, la);
+	cec_msg_give_deck_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
+	fail_on_test(!transmit_timeout(node, &msg));
+	if (timed_out_or_abort(&msg))
+		return OK_NOT_SUPPORTED;
+
+	unsigned unresponsive_time = 0;
+
+	fail_on_test(!poll_stable_power_status(node, me, la, CEC_OP_POWER_STATUS_ON, unresponsive_time));
+
+	int ret = standby_resume_standby(node, me, la, interactive);
+
+	if (ret)
+		return ret;
+
+	cec_msg_init(&msg, me, la);
+	if (opcode == CEC_OP_PLAY_MODE_PLAY_FWD)
+		cec_msg_play(&msg, CEC_OP_PLAY_MODE_PLAY_FWD);
+	else
+		cec_msg_deck_control(&msg, CEC_OP_DECK_CTL_MODE_EJECT);
+	fail_on_test(!transmit_timeout(node, &msg));
+	fail_on_test(cec_msg_status_is_abort(&msg));
+
+	unresponsive_time = 0;
+	fail_on_test(!poll_stable_power_status(node, me, la, CEC_OP_POWER_STATUS_ON, unresponsive_time));
+	fail_on_test(interactive && !question("Is the device in On state?"));
+
+	return OK;
+}
+
+
+static int standby_resume_wakeup_deck_eject(struct node *node, unsigned me, unsigned la, bool interactive)
+{
+	return standby_resume_wakeup_deck(node, me, la, interactive, CEC_OP_DECK_CTL_MODE_EJECT);
+}
+
+static int standby_resume_wakeup_deck_play(struct node *node, unsigned me, unsigned la, bool interactive)
+{
+	return standby_resume_wakeup_deck(node, me, la, interactive, CEC_OP_PLAY_MODE_PLAY_FWD);
+}
+
+const vec_remote_subtests deck_ctl_standby_resume_subtests{
+	{
+		"Deck Eject Standby Resume",
+		CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD,
+		standby_resume_wakeup_deck_eject,
+	},
+	{
+		"Deck Play Standby Resume",
+		CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD,
+		standby_resume_wakeup_deck_play,
+	}
+};
diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index 283abe43..cd50c52d 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -1658,6 +1658,7 @@ static const remote_test tests[] = {
 	{ "Remote Control Passthrough feature", TAG_REMOTE_CONTROL_PASSTHROUGH, rc_passthrough_subtests },
 	{ "Device Menu Control feature", TAG_DEVICE_MENU_CONTROL, dev_menu_ctl_subtests },
 	{ "Deck Control feature", TAG_DECK_CONTROL, deck_ctl_subtests },
+	{ "Deck Control Standby/Resume", TAG_STANDBY_RESUME, deck_ctl_standby_resume_subtests },
 	{ "Tuner Control feature", TAG_TUNER_CONTROL, tuner_ctl_subtests },
 	{ "One Touch Record feature", TAG_ONE_TOUCH_RECORD, one_touch_rec_subtests },
 	{ "Timer Programming feature", TAG_TIMER_PROGRAMMING, timer_prog_subtests },
diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index 876e0bc0..5385b335 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -561,6 +561,7 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
 
 		switch (play_mode) {
 		case CEC_OP_PLAY_MODE_PLAY_FWD:
+			exit_standby(node);
 			deck_state = CEC_OP_DECK_INFO_PLAY;
 			break;
 		case CEC_OP_PLAY_MODE_PLAY_REV:
@@ -618,6 +619,7 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
 			node->state.deck_skip_start = 0;
 			break;
 		case CEC_OP_DECK_CTL_MODE_EJECT:
+			exit_standby(node);
 			deck_state = CEC_OP_DECK_INFO_NO_MEDIA;
 			node->state.deck_skip_start = 0;
 			break;
-- 
2.25.1

