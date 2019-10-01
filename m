Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB7E0C2C4A
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 05:18:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732528AbfJADS3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 23:18:29 -0400
Received: from mail-io1-f53.google.com ([209.85.166.53]:35754 "EHLO
        mail-io1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732449AbfJADS3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 23:18:29 -0400
Received: by mail-io1-f53.google.com with SMTP id q10so44179370iop.2
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2019 20:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/5J3tdrfD+9V9z88r4ZFJeFQmWpclVcWOfL7ch0msJA=;
        b=o8nMrEwDx0S9No4vMIVvR9bfFPYqYQOTK0maHuOL1WmGDc7MGfq2cKR1UzIj8bBzus
         270G8OPCPsb9/E9IMCYuopgz5v4gd7/gj63iau6r3Nl7EfxHptbWYp1l3kHtAybM616b
         BvCYCUB0HG5AdZyzd5DiV0ntdf/CHYDhj9iMbb1OmbfWfaTCzGAB4CnJPpU4rRaDlLhf
         w4FpxpQqPEbjWdoAMbvoKme2QF3MSNto6KP+7s5hl2qwcMxQYRCr1MBQXJZUhR/6S7Bf
         JITS4uhNjggO8VmUUE5KswNOOWKsS9LuVaoOUGwlN5Fyl/Vq5dG3gb1atPOBP6ZatGS4
         ShUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/5J3tdrfD+9V9z88r4ZFJeFQmWpclVcWOfL7ch0msJA=;
        b=XRUnr6GM1feH075Ib0iDOUkkimjcBi3puHYQ457+HR4dkaN8GAtQlEhmUoo7D5st/q
         G6oNNyRQxG6xtbZmVCFaZhQatd5Nqb9O4Drp6uHgnHt/t+cpcy1I0fBJyiMw+qStgKIu
         A3eqE1lyUr81fr4R5tLg7QsIGs+09Xugj1XOLlRTDo9jEf0+LJgPbXThx6JV/Z+Oi7cg
         IhTAPqiMzD+CdA1OtRAsy0UEZvOyh/P0m2rNJ1JPYfDV2HekuT4lBhOIN2o8ImfsN4ZT
         w411I3gV+KqdJ2PZfTPga8hc0lng3JRwvOOVw/07XVosOS64HIhdh8ZowKWi3eLmngWW
         VkZA==
X-Gm-Message-State: APjAAAWvtlA1ih81TUTMV1jFWygkrMOE2M8FhXKySJ2gQ1YveUceLjf6
        hcwfNWkPs5EqTkpjV+fBapg5MF/y
X-Google-Smtp-Source: APXvYqwrL6CJGlGslHwZfQfjEGGb+s1UOKIczCzmopX/x6HmIknqtQneT6qVSg6JK4BjeDMXYZ0kuQ==
X-Received: by 2002:a02:6616:: with SMTP id k22mr21823913jac.129.1569899906454;
        Mon, 30 Sep 2019 20:18:26 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::40])
        by smtp.googlemail.com with ESMTPSA id l82sm8719452ilh.23.2019.09.30.20.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 20:18:26 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH v4 2/3] cec-follower: add tuner step increment/decrement
Date:   Mon, 30 Sep 2019 22:18:22 -0500
Message-Id: <20191001031823.312020-3-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930043017.474025-1-c0d1n61at3@gmail.com>
References: <20190930043017.474025-1-c0d1n61at3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tuner step increment/decrement will select the next highest or next
lowest service frequency.  There are a total of three possible
frequencies given a broadcast type and system for a total of 81 analog
channels.

Opcodes implemented:
  - <Tuner Step Increment>
  - <Tuner Step Decrement>

Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
---
 utils/cec-follower/cec-follower.cpp |  2 +-
 utils/cec-follower/cec-follower.h   |  3 +-
 utils/cec-follower/cec-tuner.cpp    | 65 ++++++++++++++++++++++-------
 3 files changed, 54 insertions(+), 16 deletions(-)

diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
index 4243fdd9..8375404e 100644
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
index a53c16fe..d8ac4e77 100644
--- a/utils/cec-follower/cec-follower.h
+++ b/utils/cec-follower/cec-follower.h
@@ -52,6 +52,7 @@ struct state {
 	unsigned rc_press_hold_count;
 	unsigned rc_duration_sum;
 	struct cec_op_tuner_device_info tuner_dev_info;
+	unsigned int freq_idx;
 };
 
 struct node {
@@ -221,7 +222,7 @@ std::string opcode2s(const struct cec_msg *msg);
 void sad_encode(const struct short_audio_desc *sad, __u32 *descriptor);
 
 // cec-tuner.cpp
-void analog_tuner_init(struct cec_op_tuner_device_info *tuner_dev_info);
+void analog_tuner_init(struct state *state);
 void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me);
 
 // CEC processing
diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index d74981b2..6f14b059 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -9,6 +9,8 @@
 #include "cec-follower.h"
 
 #define NUM_ANALOG_FREQS	3
+#define ARRAY_SIZE_ANA_FREQS(x) \
+	ARRAY_SIZE(x) * ARRAY_SIZE(*x) * ARRAY_SIZE(**x)
 
 /*
  * This table contains analog television channel frequencies in KHz.  There are
@@ -90,10 +92,12 @@ static unsigned int analog_freqs_khz[3][9][NUM_ANALOG_FREQS] =
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
@@ -103,23 +107,41 @@ void analog_tuner_init(struct cec_op_tuner_device_info *info)
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
+			offset++;
+		}
 	}
-	return nearest;
+	return NUM_ANALOG_FREQS * ((ana_bcast_type * 9) + ana_bcast_system) + offset;
 }
 
-static bool analog_set_tuner_dev_info(struct node *node, struct cec_msg *msg)
+static void analog_get_type_system_idx(struct node *node)
 {
 	struct cec_op_tuner_device_info *info = &node->state.tuner_dev_info;
+	unsigned int tot_freqs = NUM_ANALOG_FREQS * 9;
+	unsigned int freq_idx = node->state.freq_idx;
+	unsigned int freq_khz;
+	unsigned int idx;
+
+	info->analog.ana_bcast_type = freq_idx / tot_freqs;
+	info->analog.bcast_system =
+		(freq_idx - (tot_freqs * info->analog.ana_bcast_type)) / NUM_ANALOG_FREQS;
+	idx = freq_idx % NUM_ANALOG_FREQS;
+	freq_khz = analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][idx];
+	info->analog.ana_freq = (freq_khz * 10) / 625;
+}
+
+static bool analog_set_tuner_dev_info(struct node *node, struct cec_msg *msg)
+{
 	__u8 type;
 	__u16 freq;
 	__u8 system;
@@ -127,11 +149,9 @@ static bool analog_set_tuner_dev_info(struct node *node, struct cec_msg *msg)
 	cec_ops_select_analogue_service(msg, &type, &freq, &system);
 	if (type < 3 && system < 9) {
 		int freq_khz = (freq * 625) / 10;
-		unsigned int nearest = analog_get_nearest_freq(type, system,
-							       freq_khz);
-		info->analog.ana_bcast_type = type;
-		info->analog.ana_freq = (nearest * 10) / 625;
-		info->analog.bcast_system = system;
+
+		node->state.freq_idx = analog_get_nearest_freq_idx(type, system, freq_khz);
+		analog_get_type_system_idx(node);
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
+			node->state.freq_idx = ARRAY_SIZE_ANA_FREQS(analog_freqs_khz) - 1;
+		else
+			node->state.freq_idx--;
+		analog_get_type_system_idx(node);
 		return;
+	}
 
+	case CEC_MSG_TUNER_STEP_INCREMENT: {
+		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
+			break;
+
+		if (node->state.freq_idx == ARRAY_SIZE_ANA_FREQS(analog_freqs_khz) - 1)
+			node->state.freq_idx = 0;
+		else
+			node->state.freq_idx++;
+		analog_get_type_system_idx(node);
+		return;
+	}
 
 		/*
 		  One Touch Record
-- 
2.23.0

