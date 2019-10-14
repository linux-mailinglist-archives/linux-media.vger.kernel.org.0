Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB247D5A28
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 06:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbfJNERa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Oct 2019 00:17:30 -0400
Received: from mail-ot1-f50.google.com ([209.85.210.50]:32861 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726304AbfJNER3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Oct 2019 00:17:29 -0400
Received: by mail-ot1-f50.google.com with SMTP id 60so12692462otu.0
        for <linux-media@vger.kernel.org>; Sun, 13 Oct 2019 21:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hjxyxz16VT+9RTpg0y000JkYrOazBOl9bozP84k+PgY=;
        b=Q7Xp3rG8Su7gQ+TeiPAmLyOkLOhGIAVZC13DS/uPsM43A0fEqMjFI9V1GTw6gtgg8I
         fOL87Ik7tH1B4+mIC62LbVkbux29xOcfGv0SsSkmpiElT4UQ2K8r8a0YJrS7GvghKOxm
         BsN+AsLbStnK3hkUBKhPnrBjYZHlT9v+kraNV7OcGZq4VEKqDpP+XAd58Tx/i+LNA9cY
         EWJNcM70JvJLH93pfn+301+BiPKrQAKyc+723BFTXHikGCZWdp/93Ab68bbY3Qx5pFjU
         fkFpDfYai0xkFE64H4o5md2D5xjKG1j+D61fmxLgmpfqFFWq5nMyKgzMWo+CTQSsMpDs
         PIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hjxyxz16VT+9RTpg0y000JkYrOazBOl9bozP84k+PgY=;
        b=PyaKsC06sTU2fP6MvHjmMrC6wc5lUe90gtN8140XdfTgZ5NiMNbzajjgjM0WMXNe4q
         bhCzphLS2x8j9/vuQU5pKeFyr+sVJe4mOjCxf8mhVRtcfj4z1gUxSXiU2L7v8DC57a5x
         NYbr+PwKLBSYzARSeRK25c1jpfoqabp/8+tPa6aLL674Ak1h2xP8+rKTK2LW3MpjGDIy
         V+mPAKzrBiWfAaDKu4PFHXPsll3qv7qGk8z6Up/yzX3tLHKrc6ZbIdD7vmN2zx9YuKNR
         jn0jq2K6HrLiZpE7aV7+EzDyGAsmvihMlGt3owSVBNjoAgOmpM7bdD3XwD8E0c5CvU9u
         jYvw==
X-Gm-Message-State: APjAAAWx7vv5X50DSFdBEMF+IRtmNF/qTdr7dVN6lkJDUoxaN7r3aTAw
        c78HFesmmcMJ7fs042zDdQMEjapr
X-Google-Smtp-Source: APXvYqz7aUzOSK1HAML+GTKFBKL5MVmihP8FYHzFb2cmwtngaWFQe+AjM7Dpp6QZvYhVmShtz7ksFg==
X-Received: by 2002:a9d:4591:: with SMTP id x17mr21966375ote.112.1571026648270;
        Sun, 13 Oct 2019 21:17:28 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::40])
        by smtp.googlemail.com with ESMTPSA id l19sm4887918oie.22.2019.10.13.21.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2019 21:17:27 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH 7/8] cec-follower: fix tuner step increment/decrement
Date:   Sun, 13 Oct 2019 23:17:20 -0500
Message-Id: <20191014041721.52025-8-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014041721.52025-1-c0d1n61at3@gmail.com>
References: <20191014041721.52025-1-c0d1n61at3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tuner step feature will select the next highest or lowest service
There are a total of 98 channels, 18 digital and 81 analog with
digital preceeding analog.  Analog channels defined by broadcast
type and system.  Digital channels defined by service ID method
and broadcast system along with digital IDs and channel data.

Opcodes implemented:
  - <Tuner Step Increment>
  - <Tuner Step Decrement>

Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
---
 utils/cec-follower/cec-follower.cpp |  2 +-
 utils/cec-follower/cec-follower.h   |  2 +-
 utils/cec-follower/cec-tuner.cpp    | 46 +++++++++++++++++++----------
 3 files changed, 32 insertions(+), 18 deletions(-)

diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
index 00783d15..2488d2e8 100644
--- a/utils/cec-follower/cec-follower.cpp
+++ b/utils/cec-follower/cec-follower.cpp
@@ -296,7 +296,7 @@ void state_init(struct node &node)
 	node.state.sac_active = false;
 	node.state.volume = 50;
 	node.state.mute = false;
-	analog_tuner_init(&node.state);
+	tuner_dev_info_init(&node.state);
 }
 
 int main(int argc, char **argv)
diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
index 2a9e397a..01357dc2 100644
--- a/utils/cec-follower/cec-follower.h
+++ b/utils/cec-follower/cec-follower.h
@@ -223,7 +223,7 @@ std::string opcode2s(const struct cec_msg *msg);
 void sad_encode(const struct short_audio_desc *sad, __u32 *descriptor);
 
 // cec-tuner.cpp
-void analog_tuner_init(struct state *state);
+void tuner_dev_info_init(struct state *state);
 void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me);
 
 // CEC processing
diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index 760eed2a..8a75f0f5 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -11,6 +11,9 @@
 #define NUM_ANALOG_FREQS 3
 #define NUM_DIGITAL_CHANS 3
 #define TOT_ANALOG_FREQS (sizeof(analog_freqs_khz) / sizeof(analog_freqs_khz[0][0][0]))
+#define TOT_DIGITAL_CHANS ((sizeof(digital_arib_data) / sizeof(digital_arib_data[0][0][0])) + \
+			   (sizeof(digital_atsc_data) / sizeof(digital_atsc_data[0][0][0])) + \
+			   (sizeof(digital_dvb_data) / sizeof(digital_dvb_data[0][0][0])))
 
 struct service_info {
 	unsigned tsid;
@@ -229,19 +232,20 @@ static unsigned int analog_freqs_khz[3][9][NUM_ANALOG_FREQS] =
 	}
 };
 
-void analog_tuner_init(struct state *state)
+void tuner_dev_info_init(struct state *state)
 {
 	struct cec_op_tuner_device_info *info = &state->tuner_dev_info;
-	unsigned int freq_khz;
+	struct cec_op_digital_service_id *digital = &info->digital;
 
 	state->service_idx = 0;
 	info->rec_flag = CEC_OP_REC_FLAG_NOT_USED;
-	info->tuner_display_info = CEC_OP_TUNER_DISPLAY_INFO_ANALOGUE;
-	info->is_analog = true;
-	info->analog.ana_bcast_type = CEC_OP_ANA_BCAST_TYPE_CABLE;
-	info->analog.bcast_system = CEC_OP_BCAST_SYSTEM_PAL_BG;
-	freq_khz = analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][0];
-	info->analog.ana_freq = (freq_khz * 10) / 625;
+	info->tuner_display_info = CEC_OP_TUNER_DISPLAY_INFO_DIGITAL;
+	info->is_analog = false;
+	digital->service_id_method = CEC_OP_SERVICE_ID_METHOD_BY_DIG_ID;
+	digital->dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_BS;
+	digital->arib.transport_id = digital_arib_data[0][0][0].tsid;
+	digital->arib.service_id = digital_arib_data[0][0][0].sid;
+	digital->arib.orig_network_id = digital_arib_data[0][0][0].onid;
 }
 
 static int digital_get_service_offset(struct cec_op_digital_service_id *digital)
@@ -414,22 +418,24 @@ static unsigned int analog_get_nearest_service_idx(__u8 ana_bcast_type, __u8 ana
 			offset = i;
 		}
 	}
-	return NUM_ANALOG_FREQS * ((ana_bcast_type * 9) + ana_bcast_system) + offset;
+	return NUM_ANALOG_FREQS * ((ana_bcast_type * 9) + ana_bcast_system) +
+		offset + TOT_DIGITAL_CHANS;
 }
 
 static void analog_update_tuner_dev_info(struct node *node, unsigned int idx)
 {
 	struct cec_op_tuner_device_info *info = &node->state.tuner_dev_info;
-	unsigned int tot_freqs = NUM_ANALOG_FREQS * 9;
+	unsigned int sys_freqs = NUM_ANALOG_FREQS * 9;
 	unsigned int offset;
 	unsigned int freq_khz;
 
 	node->state.service_idx = idx;
 	info->tuner_display_info = CEC_OP_TUNER_DISPLAY_INFO_ANALOGUE;
 	info->is_analog = true;
-	info->analog.ana_bcast_type = node->state.service_idx / tot_freqs;
+	info->analog.ana_bcast_type = (node->state.service_idx - TOT_DIGITAL_CHANS) / sys_freqs;
 	info->analog.bcast_system =
-		(node->state.service_idx - (tot_freqs * info->analog.ana_bcast_type)) / NUM_ANALOG_FREQS;
+		(node->state.service_idx -
+		 (sys_freqs * info->analog.ana_bcast_type + TOT_DIGITAL_CHANS)) / NUM_ANALOG_FREQS;
 	offset = node->state.service_idx % NUM_ANALOG_FREQS;
 	freq_khz = analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][offset];
 	info->analog.ana_freq = (freq_khz * 10) / 625;
@@ -514,10 +520,14 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
 			break;
 
 		if (node->state.service_idx == 0)
-			node->state.service_idx = TOT_ANALOG_FREQS - 1;
+			node->state.service_idx =
+				TOT_DIGITAL_CHANS + TOT_ANALOG_FREQS - 1;
 		else
 			node->state.service_idx--;
-		analog_update_tuner_dev_info(node, node->state.service_idx);
+		if (node->state.service_idx < TOT_DIGITAL_CHANS)
+			digital_update_tuner_dev_info(node, node->state.service_idx);
+		else
+			analog_update_tuner_dev_info(node, node->state.service_idx);
 		return;
 	}
 
@@ -525,11 +535,15 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
 		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
 			break;
 
-		if (node->state.service_idx == TOT_ANALOG_FREQS - 1)
+		if (node->state.service_idx ==
+				TOT_DIGITAL_CHANS + TOT_ANALOG_FREQS - 1)
 			node->state.service_idx = 0;
 		else
 			node->state.service_idx++;
-		analog_update_tuner_dev_info(node, node->state.service_idx);
+		if (node->state.service_idx < TOT_DIGITAL_CHANS)
+			digital_update_tuner_dev_info(node, node->state.service_idx);
+		else
+			analog_update_tuner_dev_info(node, node->state.service_idx);
 		return;
 	}
 
-- 
2.23.0

