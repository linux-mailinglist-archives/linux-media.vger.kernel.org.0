Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6DAD5A23
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 06:17:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbfJNER0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Oct 2019 00:17:26 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:33616 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726304AbfJNERZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Oct 2019 00:17:25 -0400
Received: by mail-ot1-f66.google.com with SMTP id 60so12692384otu.0
        for <linux-media@vger.kernel.org>; Sun, 13 Oct 2019 21:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d7Nm+hSYodpCIxFJ8P1/CTHz7cLHTbiVif6UgXYbzEM=;
        b=HMIqAFSbDoaeUbKb3X+Cz+knFU3b5stZ30V022rkk8lV+HGji9h4sUPEO38gVVDHNK
         IuODqU2OaPua6gs3m7YbZrEZJMJSZDt8YbLtZRUpROk/If8MzzisiTHrggyY6RfuCI2U
         t3INcAeCMhq7mrh8eA11YTUwidTQf4EdFkpXMJ7OiHZ5nVf8rMeYYJxfBIatxCNdopgg
         hL4JK4FaAbDzIAhFlYkRtnn3kqZjxuC5m2Z3chSy7wfb8g9kEKQXM/uB6Q/DHyYA4YSP
         sRrq4ga+2eTrenvj0iSRsvtYvOc5SNm+GTrVXPrDly3v/sJUBChhh07aNZpAnzwa3mUL
         sAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d7Nm+hSYodpCIxFJ8P1/CTHz7cLHTbiVif6UgXYbzEM=;
        b=Rg+QpxIY6N871SHECnk4YRgVEx+NYdvrNgVSYNtqUlQVefPA7oIsMsszRg9zYR0J5x
         WO059Y3i9l9c/0fSd6+/MxBbJ3zpU+zRkY3FtFQ5a/yBecwuv0Ll2MtrlGbW/mpVt7JY
         3fUb+HSP5GtQsot5hWFiMBQIEISR953Oz4LUUPm+RtlAJM9omPb7t3raSmu5wUBJFs/8
         KXG6hiPRzpY+sMQpKE2BIbNSjWqyOMlouOityFtWELY2ZiK2ksOuR9js4KZCYsUaQGD/
         SN36HopZHatI3YhlRsoA1++kHSHFT1wCC586sI/rxQISkuMDoM+tbHJCWvL24Y5yppXI
         Nzig==
X-Gm-Message-State: APjAAAUBd0MORkTkKr62TmCyaeWSLsZFO7lEWuDZmmQygT7nkkDQ01CK
        3nBislr1E7lk56u/miefADX6cRzO
X-Google-Smtp-Source: APXvYqxNtOW3yvG28kdEJjsid2y007Ge2u3fPLutUoXqVtxIPTpwIKtAPvJLyNzPAbbQRcdL5ENJCg==
X-Received: by 2002:a9d:3b4b:: with SMTP id z69mr23257274otb.55.1571026644476;
        Sun, 13 Oct 2019 21:17:24 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::40])
        by smtp.googlemail.com with ESMTPSA id l19sm4887918oie.22.2019.10.13.21.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2019 21:17:23 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH 2/8] cec-follower: rename freq_idx to service_idx
Date:   Sun, 13 Oct 2019 23:17:15 -0500
Message-Id: <20191014041721.52025-3-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014041721.52025-1-c0d1n61at3@gmail.com>
References: <20191014041721.52025-1-c0d1n61at3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The implementation of digital support in tuner control requires the
renaming of freq_idx to service_idx as analog and digital channels
are referred to collectively as services.  The index will now represent
the current state of both analog and digital.  Tuner step features will
cycle through both analog and digital with digital preceeding analog.

Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
---
 utils/cec-follower/cec-follower.h |  2 +-
 utils/cec-follower/cec-tuner.cpp  | 32 +++++++++++++++----------------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
index fc335b14..2a9e397a 100644
--- a/utils/cec-follower/cec-follower.h
+++ b/utils/cec-follower/cec-follower.h
@@ -53,7 +53,7 @@ struct state {
 	unsigned rc_press_hold_count;
 	unsigned rc_duration_sum;
 	struct cec_op_tuner_device_info tuner_dev_info;
-	unsigned int freq_idx;
+	unsigned int service_idx;
 };
 
 struct node {
diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index b3b20b89..3a71a890 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -96,7 +96,7 @@ void analog_tuner_init(struct state *state)
 	struct cec_op_tuner_device_info *info = &state->tuner_dev_info;
 	unsigned int freq_khz;
 
-	state->freq_idx = 0;
+	state->service_idx = 0;
 	info->rec_flag = CEC_OP_REC_FLAG_NOT_USED;
 	info->tuner_display_info = CEC_OP_TUNER_DISPLAY_INFO_ANALOGUE;
 	info->is_analog = true;
@@ -106,8 +106,8 @@ void analog_tuner_init(struct state *state)
 	info->analog.ana_freq = (freq_khz * 10) / 625;
 }
 
-static unsigned int analog_get_nearest_freq_idx(__u8 ana_bcast_type, __u8 ana_bcast_system,
-						int ana_freq_khz)
+static unsigned int analog_get_nearest_service_idx(__u8 ana_bcast_type, __u8 ana_bcast_system,
+						   int ana_freq_khz)
 {
 	int nearest = analog_freqs_khz[ana_bcast_type][ana_bcast_system][0];
 	unsigned int offset = 0;
@@ -130,13 +130,13 @@ static void analog_update_tuner_dev_info(struct node *node, unsigned int idx)
 	unsigned int offset;
 	unsigned int freq_khz;
 
-	node->state.freq_idx = idx;
+	node->state.service_idx = idx;
 	info->tuner_display_info = CEC_OP_TUNER_DISPLAY_INFO_ANALOGUE;
 	info->is_analog = true;
-	info->analog.ana_bcast_type = node->state.freq_idx / tot_freqs;
+	info->analog.ana_bcast_type = node->state.service_idx / tot_freqs;
 	info->analog.bcast_system =
-		(node->state.freq_idx - (tot_freqs * info->analog.ana_bcast_type)) / NUM_ANALOG_FREQS;
-	offset = node->state.freq_idx % NUM_ANALOG_FREQS;
+		(node->state.service_idx - (tot_freqs * info->analog.ana_bcast_type)) / NUM_ANALOG_FREQS;
+	offset = node->state.service_idx % NUM_ANALOG_FREQS;
 	freq_khz = analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][offset];
 	info->analog.ana_freq = (freq_khz * 10) / 625;
 }
@@ -152,7 +152,7 @@ static bool analog_set_tuner_dev_info(struct node *node, struct cec_msg *msg)
 	if (type < 3 && system < 9) {
 		int freq_khz = (freq * 625) / 10;
 
-		idx = analog_get_nearest_freq_idx(type, system, freq_khz);
+		idx = analog_get_nearest_service_idx(type, system, freq_khz);
 		analog_update_tuner_dev_info(node, idx);
 		return true;
 	}
@@ -206,11 +206,11 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
 		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
 			break;
 
-		if (node->state.freq_idx == 0)
-			node->state.freq_idx = TOT_ANALOG_FREQS - 1;
+		if (node->state.service_idx == 0)
+			node->state.service_idx = TOT_ANALOG_FREQS - 1;
 		else
-			node->state.freq_idx--;
-		analog_update_tuner_dev_info(node, node->state.freq_idx);
+			node->state.service_idx--;
+		analog_update_tuner_dev_info(node, node->state.service_idx);
 		return;
 	}
 
@@ -218,11 +218,11 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
 		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
 			break;
 
-		if (node->state.freq_idx == TOT_ANALOG_FREQS - 1)
-			node->state.freq_idx = 0;
+		if (node->state.service_idx == TOT_ANALOG_FREQS - 1)
+			node->state.service_idx = 0;
 		else
-			node->state.freq_idx++;
-		analog_update_tuner_dev_info(node, node->state.freq_idx);
+			node->state.service_idx++;
+		analog_update_tuner_dev_info(node, node->state.service_idx);
 		return;
 	}
 
-- 
2.23.0

