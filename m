Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 906FF3A8317
	for <lists+linux-media@lfdr.de>; Tue, 15 Jun 2021 16:41:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230208AbhFOOna (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Jun 2021 10:43:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbhFOOna (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Jun 2021 10:43:30 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6204BC061574
        for <linux-media@vger.kernel.org>; Tue, 15 Jun 2021 07:41:25 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id y15so13423075pfl.4
        for <linux-media@vger.kernel.org>; Tue, 15 Jun 2021 07:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K7CCgsE0fcq9Cirf80uYReUCKq4rnQTpiQd/kGEJJkk=;
        b=SUPp3TBxjYYCJRQn9w9jjsatjxWIT7zdJ0sz6Wkem87kWAzGPIcVUrsM6b0LdzqMnJ
         sBqmQCXqxed3qKkfxDq2GEPyBicMtustlSy9/4m7XQeyiOfa6G4EsDw2PoOSAhTs4a0S
         ICepI+Nj3MKU0olb2AZ8IjsZd9Os/EWiYgzImr+tOp73HddfE1leAG+/QBVrwbo3Y2zW
         o0rPw574rZNpEcZk/44Bo6osAHJqg7RS9maS7onnM3G3vsPtWYdJJ33Fv8J8yTbT4vZh
         xPDwXrbbKPjSNl2JRcUEZC+0Y0a7KDvRCH8r93UjG2ooYyLTJjQRaSeVxwGm2Io4Aqw3
         DZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K7CCgsE0fcq9Cirf80uYReUCKq4rnQTpiQd/kGEJJkk=;
        b=Er7Cjjwgq6v2XISBhfhg/CvzFuHS0l8jtKDhJ+r1iMGmx+qL+jflvzDyijJFYGn6SO
         C3r8edoBw/bFohinZAg+WyxYLHF845IA6nqUejbR2Ah6AUfsuxzjZeY1WnFeId7b9K4G
         JYYHIp1w+eSBukf36bK/7R/lMzpfL5+fTTGY2oyUevx1ykPxEzLA716sc3/MMpTceSg1
         kwuvDNpoytFDuc11Y0xqxWno08+wLmLFYXBYjURKx/f84jSQ5W0wSN8Tn5OAIzRMwbrP
         xoXDCI5Vj4cir2SxB3QztyfH4lD58d37xZlgSXgb7H0hovqAYdQxIlLz99ZPnh2ggsGE
         Hj6Q==
X-Gm-Message-State: AOAM530yS5y/bXXMDwUHwgeWYy1aBy/XQCFtuwjddm9IzLsf0rZO9eLM
        DYgDmsepQjY9DNFf7+oy1TeK7WFXbbpYww==
X-Google-Smtp-Source: ABdhPJy8j9ih9KaukgDG7egv8wSVXtnJU5PjloREqBkSSmFaBSzzrfIqapdK66FxItvm7pe8ImAK8g==
X-Received: by 2002:a65:550e:: with SMTP id f14mr22722834pgr.160.1623768084883;
        Tue, 15 Jun 2021 07:41:24 -0700 (PDT)
Received: from ada-comp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id g8sm16519980pgo.10.2021.06.15.07.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 07:41:24 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, jaffe1@gmail.com,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v3] cec: add Deck Control wake-up handling tests
Date:   Tue, 15 Jun 2021 07:41:14 -0700
Message-Id: <20210615144114.7844-1-deborahbrouwer3563@gmail.com>
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
	- add subtests to existing vector instead of creating new one

Changes since v1:
	- move tests to cec-test-power.cpp
	- check if deck control is supported by sending REQ_ONCE
	- use a single function that accepts different ops

 utils/cec-compliance/cec-test-power.cpp | 46 +++++++++++++++++++++++++
 utils/cec-follower/cec-processing.cpp   |  2 ++
 2 files changed, 48 insertions(+)

diff --git a/utils/cec-compliance/cec-test-power.cpp b/utils/cec-compliance/cec-test-power.cpp
index bc88eca7..8ac45fbf 100644
--- a/utils/cec-compliance/cec-test-power.cpp
+++ b/utils/cec-compliance/cec-test-power.cpp
@@ -633,6 +633,50 @@ static int power_state_transitions(struct node *node, unsigned me, unsigned la,
 	return 0;
 }
 
+static int standby_resume_wakeup_deck(struct node *node, unsigned me, unsigned la, bool interactive, __u8 opcode)
+{
+	struct cec_msg msg;
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
 const vec_remote_subtests standby_resume_subtests{
 	{ "Standby", CEC_LOG_ADDR_MASK_ALL, standby_resume_standby },
 	{ "Repeated Standby message does not wake up", CEC_LOG_ADDR_MASK_ALL, standby_resume_standby_toggle },
@@ -651,4 +695,6 @@ const vec_remote_subtests standby_resume_subtests{
 	{ "Wake up TV on Image View On", CEC_LOG_ADDR_MASK_TV, standby_resume_wakeup_image_view_on },
 	{ "Wake up TV on Text View On", CEC_LOG_ADDR_MASK_TV, standby_resume_wakeup_text_view_on },
 	{ "Power State Transitions", CEC_LOG_ADDR_MASK_TV, power_state_transitions, false, true },
+	{ "Deck Eject Standby Resume", CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD, standby_resume_wakeup_deck_eject },
+	{ "Deck Play Standby Resume", CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD, standby_resume_wakeup_deck_play },
 };
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

