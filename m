Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59382B3B34
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2019 15:23:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733068AbfIPNXM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Sep 2019 09:23:12 -0400
Received: from mail-oi1-f171.google.com ([209.85.167.171]:35188 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728014AbfIPNXM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Sep 2019 09:23:12 -0400
Received: by mail-oi1-f171.google.com with SMTP id a127so8266309oii.2
        for <linux-media@vger.kernel.org>; Mon, 16 Sep 2019 06:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n3U29OmFOZrNUDgWbzfJqVH6AgOhq2z1uq16fp9Z0d4=;
        b=XmoqllKO7Y9vBZa2nrXRO6qhjGlHgOC6EHq8pqvq5vXGU1Jq7sQkz4Y90qADMtIC3X
         OWw1Swf5IA+/XUNbtnJDtj2kFF9s4N3ask4+NICMfLs/9q1fYYg/L/n+o6zpYQv1k0XA
         UAAu/RLXc78Z1xiiCrPZ2SKxYJl1P+22WJX0XfvvVP+R8qMyNHAaIaxteW5KShPfujKt
         KaiOQ+PEXECsdApPwtabI5/Gl2mh+cE2EAkzgssor66R7lodIuM+teNnwAG2vsztM6eK
         rf0WJtZtxWGKu6/+wm9B7DPKnKXxiV7lQAGU5a34qkPF5QY1uZSna9HnK7b+wQp1JuZy
         /yuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n3U29OmFOZrNUDgWbzfJqVH6AgOhq2z1uq16fp9Z0d4=;
        b=SCMmZ/Obqv4g4V9he1wLlhJsT/YNvnbRdq2p4tEdLd+iSFdO+ve2s0OrQtdKawHAN5
         XOPh7c1n1Md1NZGcpjA/cKQZCyGla4nWqkjT1wlCyqHHaI/kua75Zdo+rCMhQzey8TfG
         3m1eEuA1Rx9snCReh/xiVDh8yOXrWoHNnoGbdt9/eOHYjYXJwRYBkbab9kr+WwA7KCcd
         2R6sDVHM3Uim2dF6UWuauAbMbde3NOWY5LmeR7Pf7afMy6VwF/EMYRl00PjMx4QVx4vq
         IRCiQZBtnbzxrHJrSq0IpWk+bRfbcGFxJ4q48DatXH0K+AcDjE142dKU8skK7ytz8cY6
         rFPg==
X-Gm-Message-State: APjAAAX5M0AJExCUroU5J26hUQxFPrJx35998PLf2ZPz0ZhSQ9AAE7ST
        whuuDHYFISVkzAM3fO2tdSYguxgq
X-Google-Smtp-Source: APXvYqynzVbCbbkiMIwU0abxD7g/9IbQtV0a248cp9KPZpY48OegX5haou3wrTDLKOPEY0NOnJA2fw==
X-Received: by 2002:aca:d9c3:: with SMTP id q186mr4264636oig.53.1568640190125;
        Mon, 16 Sep 2019 06:23:10 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::40])
        by smtp.googlemail.com with ESMTPSA id b67sm3955431oii.21.2019.09.16.06.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 06:23:09 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH v2] cec-follower: create cec-tuner.cpp
Date:   Mon, 16 Sep 2019 08:23:08 -0500
Message-Id: <20190916132308.41810-1-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190916091553.116728-1-c0d1n61at3@gmail.com>
References: <20190916091553.116728-1-c0d1n61at3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move tuner control, one touch record, and timer programming into
cec-tuner.cpp.  These features are all tuner related and involve the
tuner as a central feature to be able to test.

Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
---

Changes made since v1:
  - Change cec-tuner.cpp function name to process_tuner_record_timer_msgs()
  - Refactor commit message

>8---------------------------------------------------------------------------8<

 utils/cec-follower/Makefile.am        |   2 +-
 utils/cec-follower/cec-follower.h     |   3 +
 utils/cec-follower/cec-processing.cpp | 109 +-------------------
 utils/cec-follower/cec-tuner.cpp      | 139 ++++++++++++++++++++++++++
 4 files changed, 148 insertions(+), 105 deletions(-)
 create mode 100644 utils/cec-follower/cec-tuner.cpp

diff --git a/utils/cec-follower/Makefile.am b/utils/cec-follower/Makefile.am
index 9b0a48b0..294a6ab4 100644
--- a/utils/cec-follower/Makefile.am
+++ b/utils/cec-follower/Makefile.am
@@ -1,7 +1,7 @@
 bin_PROGRAMS = cec-follower
 man_MANS = cec-follower.1
 
-cec_follower_SOURCES = cec-follower.cpp cec-follower.h cec-processing.cpp cec-log.cpp cec-info.cpp
+cec_follower_SOURCES = cec-follower.cpp cec-follower.h cec-processing.cpp cec-tuner.cpp cec-log.cpp cec-info.cpp
 cec_follower_CPPFLAGS = -I$(top_srcdir)/utils/common
 cec_follower_LDFLAGS = -lrt
 
diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
index 0998382c..9f5f1be4 100644
--- a/utils/cec-follower/cec-follower.h
+++ b/utils/cec-follower/cec-follower.h
@@ -219,6 +219,9 @@ std::string audio_format_id_code2s(__u8 audio_format_id, __u8 audio_format_code)
 std::string opcode2s(const struct cec_msg *msg);
 void sad_encode(const struct short_audio_desc *sad, __u32 *descriptor);
 
+// cec-tuner.cpp
+void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me);
+
 // CEC processing
 void testProcessing(struct node *node, bool wallclock);
 
diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index fa7687c9..15cedddf 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -608,128 +608,29 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
 	case CEC_MSG_DECK_STATUS:
 		return;
 
+	/* Tuner Centric Messages */
 
-		/*
-		  Tuner Control
-
-		  This is only a basic implementation.
-
-		  TODO: Device state should change when selecting services etc.
-		*/
-
-	case CEC_MSG_GIVE_TUNER_DEVICE_STATUS: {
-		if (!cec_has_tuner(1 << me))
-			break;
-
-		struct cec_op_tuner_device_info tuner_dev_info = {};
-
-		cec_msg_set_reply_to(&msg, &msg);
-		tuner_dev_info.rec_flag = CEC_OP_REC_FLAG_NOT_USED;
-		tuner_dev_info.tuner_display_info = CEC_OP_TUNER_DISPLAY_INFO_NONE;
-		tuner_dev_info.is_analog = false;
-		tuner_dev_info.digital.service_id_method = CEC_OP_SERVICE_ID_METHOD_BY_CHANNEL;
-		tuner_dev_info.digital.dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_C;
-		tuner_dev_info.digital.channel.channel_number_fmt = CEC_OP_CHANNEL_NUMBER_FMT_1_PART;
-		tuner_dev_info.digital.channel.minor = 1;
-
-		cec_msg_tuner_device_status(&msg, &tuner_dev_info);
-		transmit(node, &msg);
-		return;
-	}
-
+	case CEC_MSG_GIVE_TUNER_DEVICE_STATUS:
 	case CEC_MSG_TUNER_DEVICE_STATUS:
-		return;
-
 	case CEC_MSG_SELECT_ANALOGUE_SERVICE:
 	case CEC_MSG_SELECT_DIGITAL_SERVICE:
 	case CEC_MSG_TUNER_STEP_DECREMENT:
 	case CEC_MSG_TUNER_STEP_INCREMENT:
-		if (!cec_has_tuner(1 << me))
-			break;
-		return;
-
-
-		/*
-		  One Touch Record
-
-		  This is only a basic implementation.
-
-		  TODO:
-		  - If we are a TV, we should only send Record On if the
-		    remote end is a Recording device or Reserved. Otherwise ignore.
-
-		  - Device state should reflect whether we are recording, etc. In
-		    recording mode we should ignore Standby messages.
-		*/
-
-	case CEC_MSG_RECORD_TV_SCREEN: {
-		if (!node->has_rec_tv)
-			break;
-
-		struct cec_op_record_src rec_src = {};
-
-		rec_src.type = CEC_OP_RECORD_SRC_OWN;
-		cec_msg_set_reply_to(&msg, &msg);
-		cec_msg_record_on(&msg, false, &rec_src);
-		transmit(node, &msg);
-		return;
-	}
+	case CEC_MSG_RECORD_TV_SCREEN:
 	case CEC_MSG_RECORD_ON:
-		if (!cec_has_record(1 << me))
-			break;
-		cec_msg_set_reply_to(&msg, &msg);
-		cec_msg_record_status(&msg, CEC_OP_RECORD_STATUS_CUR_SRC);
-		transmit(node, &msg);
-		return;
 	case CEC_MSG_RECORD_OFF:
-		if (!cec_has_record(1 << me))
-			break;
-		cec_msg_set_reply_to(&msg, &msg);
-		cec_msg_record_status(&msg, CEC_OP_RECORD_STATUS_TERMINATED_OK);
-		transmit(node, &msg);
-		return;
 	case CEC_MSG_RECORD_STATUS:
-		return;
-
-
-		/*
-		  Timer Programming
-
-		  This is only a basic implementation.
-
-		  TODO/Ideas:
-		  - Act like an actual recording device; keep track of recording
-		    schedule and act correctly when colliding timers are set.
-		  - Emulate a finite storage space for recordings
-		 */
-
 	case CEC_MSG_SET_ANALOGUE_TIMER:
 	case CEC_MSG_SET_DIGITAL_TIMER:
 	case CEC_MSG_SET_EXT_TIMER:
-		if (!cec_has_record(1 << me))
-			break;
-		cec_msg_set_reply_to(&msg, &msg);
-		cec_msg_timer_status(&msg, CEC_OP_TIMER_OVERLAP_WARNING_NO_OVERLAP,
-				     CEC_OP_MEDIA_INFO_NO_MEDIA,
-				     CEC_OP_PROG_INFO_ENOUGH_SPACE, 0, 0, 0);
-		transmit(node, &msg);
-		return;
 	case CEC_MSG_CLEAR_ANALOGUE_TIMER:
 	case CEC_MSG_CLEAR_DIGITAL_TIMER:
 	case CEC_MSG_CLEAR_EXT_TIMER:
-		if (!cec_has_record(1 << me))
-			break;
-		cec_msg_set_reply_to(&msg, &msg);
-		cec_msg_timer_cleared_status(&msg, CEC_OP_TIMER_CLR_STAT_CLEARED);
-		transmit(node, &msg);
-		return;
 	case CEC_MSG_SET_TIMER_PROGRAM_TITLE:
-		if (!cec_has_record(1 << me))
-			break;
-		return;
 	case CEC_MSG_TIMER_CLEARED_STATUS:
 	case CEC_MSG_TIMER_STATUS:
-		return;
+		process_tuner_record_timer_msgs(node, msg, me);
+		break;
 
 		/* Dynamic Auto Lipsync */
 
diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
new file mode 100644
index 00000000..5e794d71
--- /dev/null
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -0,0 +1,139 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+/*
+ * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
+ */
+
+#include <sys/ioctl.h>
+
+#include "cec-follower.h"
+
+void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me)
+{
+	switch (msg.msg[1]) {
+
+
+		/*
+		  Tuner Control
+
+		  This is only a basic implementation.
+
+		  TODO: Device state should change when selecting services etc.
+		*/
+
+	case CEC_MSG_GIVE_TUNER_DEVICE_STATUS: {
+		if (!cec_has_tuner(1 << me))
+			break;
+
+		struct cec_op_tuner_device_info tuner_dev_info = {};
+
+		cec_msg_set_reply_to(&msg, &msg);
+		tuner_dev_info.rec_flag = CEC_OP_REC_FLAG_NOT_USED;
+		tuner_dev_info.tuner_display_info = CEC_OP_TUNER_DISPLAY_INFO_NONE;
+		tuner_dev_info.is_analog = false;
+		tuner_dev_info.digital.service_id_method = CEC_OP_SERVICE_ID_METHOD_BY_CHANNEL;
+		tuner_dev_info.digital.dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_C;
+		tuner_dev_info.digital.channel.channel_number_fmt = CEC_OP_CHANNEL_NUMBER_FMT_1_PART;
+		tuner_dev_info.digital.channel.minor = 1;
+
+		cec_msg_tuner_device_status(&msg, &tuner_dev_info);
+		transmit(node, &msg);
+		return;
+	}
+
+	case CEC_MSG_TUNER_DEVICE_STATUS:
+		return;
+
+	case CEC_MSG_SELECT_ANALOGUE_SERVICE:
+	case CEC_MSG_SELECT_DIGITAL_SERVICE:
+	case CEC_MSG_TUNER_STEP_DECREMENT:
+	case CEC_MSG_TUNER_STEP_INCREMENT:
+		if (!cec_has_tuner(1 << me))
+			break;
+		return;
+
+
+		/*
+		  One Touch Record
+
+		  This is only a basic implementation.
+
+		  TODO:
+		  - If we are a TV, we should only send Record On if the
+		    remote end is a Recording device or Reserved. Otherwise ignore.
+
+		  - Device state should reflect whether we are recording, etc. In
+		    recording mode we should ignore Standby messages.
+		*/
+
+	case CEC_MSG_RECORD_TV_SCREEN: {
+		if (!node->has_rec_tv)
+			break;
+
+		struct cec_op_record_src rec_src = {};
+
+		rec_src.type = CEC_OP_RECORD_SRC_OWN;
+		cec_msg_set_reply_to(&msg, &msg);
+		cec_msg_record_on(&msg, false, &rec_src);
+		transmit(node, &msg);
+		return;
+	}
+	case CEC_MSG_RECORD_ON:
+		if (!cec_has_record(1 << me))
+			break;
+		cec_msg_set_reply_to(&msg, &msg);
+		cec_msg_record_status(&msg, CEC_OP_RECORD_STATUS_CUR_SRC);
+		transmit(node, &msg);
+		return;
+	case CEC_MSG_RECORD_OFF:
+		if (!cec_has_record(1 << me))
+			break;
+		cec_msg_set_reply_to(&msg, &msg);
+		cec_msg_record_status(&msg, CEC_OP_RECORD_STATUS_TERMINATED_OK);
+		transmit(node, &msg);
+		return;
+	case CEC_MSG_RECORD_STATUS:
+		return;
+
+
+		/*
+		  Timer Programming
+
+		  This is only a basic implementation.
+
+		  TODO/Ideas:
+		  - Act like an actual recording device; keep track of recording
+		    schedule and act correctly when colliding timers are set.
+		  - Emulate a finite storage space for recordings
+		 */
+
+	case CEC_MSG_SET_ANALOGUE_TIMER:
+	case CEC_MSG_SET_DIGITAL_TIMER:
+	case CEC_MSG_SET_EXT_TIMER:
+		if (!cec_has_record(1 << me))
+			break;
+		cec_msg_set_reply_to(&msg, &msg);
+		cec_msg_timer_status(&msg, CEC_OP_TIMER_OVERLAP_WARNING_NO_OVERLAP,
+				     CEC_OP_MEDIA_INFO_NO_MEDIA,
+				     CEC_OP_PROG_INFO_ENOUGH_SPACE, 0, 0, 0);
+		transmit(node, &msg);
+		return;
+	case CEC_MSG_CLEAR_ANALOGUE_TIMER:
+	case CEC_MSG_CLEAR_DIGITAL_TIMER:
+	case CEC_MSG_CLEAR_EXT_TIMER:
+		if (!cec_has_record(1 << me))
+			break;
+		cec_msg_set_reply_to(&msg, &msg);
+		cec_msg_timer_cleared_status(&msg, CEC_OP_TIMER_CLR_STAT_CLEARED);
+		transmit(node, &msg);
+		return;
+	case CEC_MSG_SET_TIMER_PROGRAM_TITLE:
+		if (!cec_has_record(1 << me))
+			break;
+		return;
+	case CEC_MSG_TIMER_CLEARED_STATUS:
+	case CEC_MSG_TIMER_STATUS:
+		return;
+	default:
+		break;
+	}
+}
-- 
2.23.0

