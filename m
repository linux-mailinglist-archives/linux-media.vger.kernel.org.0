Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FAE2C96E4
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 05:18:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728469AbfJCDSV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 23:18:21 -0400
Received: from mail-oi1-f181.google.com ([209.85.167.181]:35708 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728457AbfJCDSU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 23:18:20 -0400
Received: by mail-oi1-f181.google.com with SMTP id x3so1303899oig.2
        for <linux-media@vger.kernel.org>; Wed, 02 Oct 2019 20:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0WW8qosWPZ27k6dcTtf0UXcKyKZhMzhJRkN9/PbFq+M=;
        b=tMvE7YRbgvd8F72EPVGuWrhtO1xE0juoovmvdRmASkRoIdin8o0oHmjubYZVDdaR39
         C9HKdED/llKyg2N7Dv8BGn7MS/QyTxQEB/R72YZ+fPblyrQ6mUIARWJdRlY4BsAT0498
         K0+mKArlBAwLkFOtN8GnZsXAQHeQKlbvC/JMaIlxRYiUaGyV7wFzUY2KHHfcgSC7g3Tx
         4V7pKN3se6s1bpTNGwm6SyqB16JOR2MfzIw4L1FKx4Fg8Bf7mLkXF/uYwM6+3P3KuN0s
         OSheMlShAJDuzF33RDOImSktc7qTya8316DLubSUat9j4F9cTkTXZkgwpBShXNPt1oZx
         NTvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0WW8qosWPZ27k6dcTtf0UXcKyKZhMzhJRkN9/PbFq+M=;
        b=VyHRB8TmIpMRrfRMF7rtr/gV/jpPIugYDTlUHlR4xJ5vCdGN6yEiLiPNLNAoJGu7sk
         BVSmmLvL7sptWdCPTJp3myrFi1gPkKQwq9eooMSl8kB/ZmVrrjbVn3RCUnA+y5yWrJeS
         4lTypC38nbJhTa6DgYBlD6qpgiVSg07/YMjTdeCqo+pbpLkcuo7waoGPSaz4SyQJFvQw
         3kVaW194Ok+RZYFT2hlX+SlaTcwEDBYW9dCt+twgiP5yipoXRjmOKGBGBQTh3t5g6XIP
         EtZQFQiufQxoJ0nX95c3X9qCrWChW6d/BOeIikpiokaOyTMwm9QLf2oNr4XU5aCM99/B
         YO4g==
X-Gm-Message-State: APjAAAWpxBHK+giURpNyKVegDuQtBkrIewCvtUYw179AnS/auX0Mcj/K
        ZqwkFmRGOdv9BzJKK2ajaRGT1Nic
X-Google-Smtp-Source: APXvYqxL+kOePJiUfJQaHZp4EzgiUuvnyHJEG+5bygvinmX9TzePcoeL+4UUIyFwa9XswYMyOoKCtg==
X-Received: by 2002:aca:ed15:: with SMTP id l21mr1085819oih.158.1570072699372;
        Wed, 02 Oct 2019 20:18:19 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::40])
        by smtp.googlemail.com with ESMTPSA id w20sm431301otk.73.2019.10.02.20.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 20:18:18 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH v5 1/2] cec-follower: add tuner step increment/decrement
Date:   Wed,  2 Oct 2019 22:18:15 -0500
Message-Id: <20191003031816.168985-2-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191001031823.312020-1-c0d1n61at3@gmail.com>
References: <20191001031823.312020-1-c0d1n61at3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tuner step feature will select the next highest or lowest service
frequency.  There are a total of three possible frequencies given
a broadcast type and system for a total of 81 analog channels.

Opcodes implemented:
  - <Tuner Step Increment>
  - <Tuner Step Decrement>

Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
---
 utils/cec-follower/cec-follower.cpp |  2 +-
 utils/cec-follower/cec-follower.h   |  3 +-
 utils/cec-follower/cec-tuner.cpp    | 67 ++++++++++++++++++++++-------
 3 files changed, 55 insertions(+), 17 deletions(-)

diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
index 789fef4a..b208d14e 100644
--- a/utils/cec-follower/cec-follower.cpp
+++ b/utils/cec-follower/cec-follower.cpp
@@ -298,7 +298,7 @@ void state_init(struct node &node)
 	node.state.sac_active = false;
 	node.state.volume = 50;
 	node.state.mute = false;
-	analog_tuner_init(&node.state.tuner_dev_info);
+	analog_tuner_init(&node.state);
 }
 
 int main(int argc, char **argv)
diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
index 0bd45452..04019c9a 100644
--- a/utils/cec-follower/cec-follower.h
+++ b/utils/cec-follower/cec-follower.h
@@ -53,6 +53,7 @@ struct state {
 	unsigned rc_press_hold_count;
 	unsigned rc_duration_sum;
 	struct cec_op_tuner_device_info tuner_dev_info;
+	unsigned int freq_idx;
 };
 
 struct node {
@@ -222,7 +223,7 @@ std::string opcode2s(const struct cec_msg *msg);
 void sad_encode(const struct short_audio_desc *sad, __u32 *descriptor);
 
 // cec-tuner.cpp
-void analog_tuner_init(struct cec_op_tuner_device_info *tuner_dev_info);
+void analog_tuner_init(struct state *state);
 void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me);
 
 // CEC processing
diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index d74981b2..46acccf4 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -8,7 +8,8 @@
 
 #include "cec-follower.h"
 
-#define NUM_ANALOG_FREQS	3
+#define NUM_ANALOG_FREQS 3
+#define TOT_ANALOG_FREQS (sizeof(analog_freqs_khz) / sizeof(analog_freqs_khz[0][0][0]))
 
 /*
  * This table contains analog television channel frequencies in KHz.  There are
@@ -90,10 +91,12 @@ static unsigned int analog_freqs_khz[3][9][NUM_ANALOG_FREQS] =
 	}
 };
 
-void analog_tuner_init(struct cec_op_tuner_device_info *info)
+void analog_tuner_init(struct state *state)
 {
+	struct cec_op_tuner_device_info *info = &state->tuner_dev_info;
 	unsigned int freq_khz;
 
+	state->freq_idx = 0;
 	info->rec_flag = CEC_OP_REC_FLAG_NOT_USED;
 	info->tuner_display_info = CEC_OP_TUNER_DISPLAY_INFO_ANALOGUE;
 	info->is_analog = true;
@@ -103,35 +106,52 @@ void analog_tuner_init(struct cec_op_tuner_device_info *info)
 	info->analog.ana_freq = (freq_khz * 10) / 625;
 }
 
-static unsigned int analog_get_nearest_freq(__u8 ana_bcast_type, __u8 ana_bcast_system,
-                                            int ana_freq_khz)
+static unsigned int analog_get_nearest_freq_idx(__u8 ana_bcast_type, __u8 ana_bcast_system,
+						int ana_freq_khz)
 {
 	int nearest = analog_freqs_khz[ana_bcast_type][ana_bcast_system][0];
+	unsigned int offset = 0;
 
 	for (int i = 0; i < NUM_ANALOG_FREQS; i++) {
 		int freq = analog_freqs_khz[ana_bcast_type][ana_bcast_system][i];
 
-		if (abs(ana_freq_khz - freq) < abs(ana_freq_khz - nearest))
+		if (abs(ana_freq_khz - freq) < abs(ana_freq_khz - nearest)) {
 			nearest = freq;
+			offset = i;
+		}
 	}
-	return nearest;
+	return NUM_ANALOG_FREQS * ((ana_bcast_type * 9) + ana_bcast_system) + offset;
 }
 
-static bool analog_set_tuner_dev_info(struct node *node, struct cec_msg *msg)
+static void analog_update_tuner_dev_info(struct node *node, unsigned int idx)
 {
 	struct cec_op_tuner_device_info *info = &node->state.tuner_dev_info;
+	unsigned int tot_freqs = NUM_ANALOG_FREQS * 9;
+	unsigned int offset;
+	unsigned int freq_khz;
+
+	node->state.freq_idx = idx;
+	info->analog.ana_bcast_type = node->state.freq_idx / tot_freqs;
+	info->analog.bcast_system =
+		(node->state.freq_idx - (tot_freqs * info->analog.ana_bcast_type)) / NUM_ANALOG_FREQS;
+	offset = node->state.freq_idx % NUM_ANALOG_FREQS;
+	freq_khz = analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][offset];
+	info->analog.ana_freq = (freq_khz * 10) / 625;
+}
+
+static bool analog_set_tuner_dev_info(struct node *node, struct cec_msg *msg)
+{
 	__u8 type;
 	__u16 freq;
 	__u8 system;
+	unsigned int idx;
 
 	cec_ops_select_analogue_service(msg, &type, &freq, &system);
 	if (type < 3 && system < 9) {
 		int freq_khz = (freq * 625) / 10;
-		unsigned int nearest = analog_get_nearest_freq(type, system,
-							       freq_khz);
-		info->analog.ana_bcast_type = type;
-		info->analog.ana_freq = (nearest * 10) / 625;
-		info->analog.bcast_system = system;
+
+		idx = analog_get_nearest_freq_idx(type, system, freq_khz);
+		analog_update_tuner_dev_info(node, idx);
 		return true;
 	}
 	return false;
@@ -180,12 +200,29 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
 		return;
 
 	case CEC_MSG_SELECT_DIGITAL_SERVICE:
-	case CEC_MSG_TUNER_STEP_DECREMENT:
-	case CEC_MSG_TUNER_STEP_INCREMENT:
-		if (!cec_has_tuner(1 << me))
+	case CEC_MSG_TUNER_STEP_DECREMENT: {
+		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
 			break;
+
+		if (node->state.freq_idx == 0)
+			node->state.freq_idx = TOT_ANALOG_FREQS - 1;
+		else
+			node->state.freq_idx--;
+		analog_update_tuner_dev_info(node, node->state.freq_idx);
 		return;
+	}
 
+	case CEC_MSG_TUNER_STEP_INCREMENT: {
+		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
+			break;
+
+		if (node->state.freq_idx == TOT_ANALOG_FREQS - 1)
+			node->state.freq_idx = 0;
+		else
+			node->state.freq_idx++;
+		analog_update_tuner_dev_info(node, node->state.freq_idx);
+		return;
+	}
 
 		/*
 		  One Touch Record
-- 
2.23.0

