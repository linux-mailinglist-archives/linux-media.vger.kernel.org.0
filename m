Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C236B36E9
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2019 11:15:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728176AbfIPJP5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Sep 2019 05:15:57 -0400
Received: from mail-ot1-f51.google.com ([209.85.210.51]:36881 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbfIPJP5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Sep 2019 05:15:57 -0400
Received: by mail-ot1-f51.google.com with SMTP id s28so34915851otd.4
        for <linux-media@vger.kernel.org>; Mon, 16 Sep 2019 02:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YH0jRLrWht98mH3/lmJ7Fp67MvCjv8qnyfJU02rvEN0=;
        b=P034ch4jMdAF+ODzDEB00YcX+3dMk7pHEDzDrq5F04tW6sXYJs5FgxpAEl/nK2/N6a
         0JSAMF3ljqgrkU6Q+4jePkIjVcKX5QvgYNh1NTzZ1Zw9lud+EEWFPjdja+tiiTrD/0yb
         HgxFIf5DHFoZj7h1tcQecz8s/rNyPb9QCjcbN6cKGYVW2ZdUIYLB5fQtuXNovLk+hcvc
         Pr5P0SIi8jiilll/ay6paJk4S4mp9XvFq1AO7j8pT9vHOqFcIM/Hw7TI1y8qSDTXxmFo
         RCruyGZ8C2Xw3qgqoivTu58/5MZAtV5kYZov3nt/vGJLBkSnoShRx7+RD3dZmRqnszzs
         DjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YH0jRLrWht98mH3/lmJ7Fp67MvCjv8qnyfJU02rvEN0=;
        b=XWsiPhs0c59Qi+/sSiAD1NEdFyaksQ1oQReUrgA8mg/IMrarIBGWE7ItWcIRrw6cZH
         5TljwBupif79oQjK7ejBdefqIrc1atMBmkWu8j0K3dvR3DdnTcyybHCKRfHAlwDOnX3n
         SFOYiYxC7jJmSz4Zm2tBDGfOx+gk7JJG2BORhwKtktV5lLpJmegwxu7+AR77h0IUS8Vc
         7L3HiXIy4PrYja+4XVP7ecrlP/8x71gQZKjHN2PaErfo+Rg2S8vwq5JghGvcGgmCTOaz
         M9bPiQTHlTkiG0wcUn1fNUdxoUKw4HyVsmrF6wWErbLG+2DMsqX9UKdmY+5tVxqJDU8x
         /XHA==
X-Gm-Message-State: APjAAAX6uESIuVXOBZww02RS+6+0Ix9xdl6GyZ7aWmnshIyJYYbR4ep3
        btyD4GZHcRtFN9SoqmWMjm8dF+q5
X-Google-Smtp-Source: APXvYqzoNuRKIPA9ERGWRU86PgQ23sEp0CfH6jwSLRjEgnxHnh804MnxXLEb4cR8sWyxMnj1nNBR3Q==
X-Received: by 2002:a9d:6c86:: with SMTP id c6mr808842otr.153.1568625355470;
        Mon, 16 Sep 2019 02:15:55 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::40])
        by smtp.googlemail.com with ESMTPSA id 13sm13432972otv.14.2019.09.16.02.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 02:15:54 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH] cec-follower: create cec-tuner.cpp
Date:   Mon, 16 Sep 2019 04:15:53 -0500
Message-Id: <20190916091553.116728-1-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move tuner control, one touch record, and timer programming into
cec-tuner.cpp.  These features are all tuner centric and involve the
tuner as a central capability.

This will help keep cec-follower emulation for these features all in
one place making it easier to read and to maintain.

Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
---
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
index 0998382c..582fcece 100644
--- a/utils/cec-follower/cec-follower.h
+++ b/utils/cec-follower/cec-follower.h
@@ -219,6 +219,9 @@ std::string audio_format_id_code2s(__u8 audio_format_id, __u8 audio_format_code)
 std::string opcode2s(const struct cec_msg *msg);
 void sad_encode(const struct short_audio_desc *sad, __u32 *descriptor);
 
+// cec-tuner.cpp
+void process_tuner_centric_msg(struct node *node, struct cec_msg &msg, unsigned me);
+
 // CEC processing
 void testProcessing(struct node *node, bool wallclock);
 
diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index fa7687c9..6470dc6b 100644
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
+		process_tuner_centric_msg(node, msg, me);
+		break;
 
 		/* Dynamic Auto Lipsync */
 
diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
new file mode 100644
index 00000000..3f0b5f66
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
+void process_tuner_centric_msg(struct node *node, struct cec_msg &msg, unsigned me)
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

