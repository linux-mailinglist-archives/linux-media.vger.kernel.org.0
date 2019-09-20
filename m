Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5195EB97D2
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2019 21:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726977AbfITTcj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Sep 2019 15:32:39 -0400
Received: from mail-ot1-f45.google.com ([209.85.210.45]:42154 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726869AbfITTcj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Sep 2019 15:32:39 -0400
Received: by mail-ot1-f45.google.com with SMTP id c10so7128940otd.9
        for <linux-media@vger.kernel.org>; Fri, 20 Sep 2019 12:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kqF6r4PcCXIAFFLERjMq4nSk7STkrTW4l7SPVhRXkzU=;
        b=OTNpO+2tgGTHR0Y2kAGFVwjNyK0D8D7dkcL//VgoTDB1OyJf0QDHL8Ivt9UxF4tSnT
         ooaxPzcONcJkrwKdmPfeWfYeKt+XK2tGlMUKStbC1H1QMsty9o/gIgdx5C6B+Mrm7N6K
         EKz27nJ3vilV7uihCUuxi8FDDz2Ku5zgxZMXaJ7FNtC9ZAG4W9Yw75iigmx+nNrFEjyv
         FhcoVAuQpFkYDPso4DDwj+6y8+yNjAUbxwMA6myXFnEz4GhQfXzvRONbEG7iUX3GWCF1
         U0wiBtSogILBrHM+4qRoB8jvGEYz6a6kB0tPRVQu8WrnLGX7YVORegUg3qlAnxCdawLE
         hiDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kqF6r4PcCXIAFFLERjMq4nSk7STkrTW4l7SPVhRXkzU=;
        b=G0iJOnpaz0wh4NiQZPIu2a+xAhGRc4W7JNEM0EW0SMpSEtyi2fSvA3kCCcCS+IKKXL
         g973MftulXQOGQYaVKE2XzKrPC2CdxVesaD8g9YVKdtJ9xhkg6e/5lzwe1jqD3p9crKj
         GZ3n/7LJROTYAeaMfruxU/8XBGmMXMYYFzZcY/oHnj1xqPpf6jYdNSczqSZLdwd7MqEd
         kcvXplk4oALafX3VoJg+IKwZqRou9PmHDKMDleCc7i4EX5Bv1AWZSerTQFlJPdBH5Xus
         HrjvNZJ8QSO6CFTMkd+Kr3v3VgbhfHbTgjU3C7KmqK2n8XSZazet2uZ2o7IrOJP5QMx4
         jJ8A==
X-Gm-Message-State: APjAAAWbL4GlXrRt3kYFYqYWcfD3RBmS3EZ/H+opBQ1zeBNBdvVG+Iuq
        JqerGX9RiGyjD5BuPhCuN+3095Cj
X-Google-Smtp-Source: APXvYqyIr5mgRoLAOdgncbzX+RPq6BCyiIdeDfEL6SWY+PLpvp4ynzp8Ae0blO2l2JJOdYDliUnnxA==
X-Received: by 2002:a05:6830:1090:: with SMTP id y16mr12941823oto.46.1569007957707;
        Fri, 20 Sep 2019 12:32:37 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::40])
        by smtp.googlemail.com with ESMTPSA id 2sm768390ois.43.2019.09.20.12.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2019 12:32:36 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH v6] cec-follower: add tuner analog service emulation
Date:   Fri, 20 Sep 2019 14:32:36 -0500
Message-Id: <20190920193236.217671-1-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190919174702.140335-3-c0d1n61at3@gmail.com>
References: <20190919174702.140335-3-c0d1n61at3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement the following tuner control features:
  - <Select Analogue Service>
  - <Give Tuner Device Status> and reply <Tuner Device Status>

Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
---

Changes made since v1:
  - Fix typos/bugs
  - Import reply_feature_abort() from cec-processing.cpp
  - Add functionality to choose nearest frequency

Changes made since v2:
  - Fix typos/bugs
  - Use state from node in cec-follower.h
  - Rename functions to analog_ prefix

Changes made since v3:
  - Refactor lines numbers since a fix patch was needed for cec-tuner.cpp

Changes made since v4:
  - Remove int casting in abs()
  - Add temp variables: info, freq to make code easier to read
  - Use NUM_ANALOG_FREQS macro

Changes made since v5:
  - Add analog_tuner_init() to cec-tuner.cpp
  - Change state_init() in cec-follower.cpp to use analog_tuner_init()
  - Rename function to analog_get_nearest_freq()
  - Change analog_get_nearest_freq() to only return freq in Khz
  - Change analog_set_tuner_dev_info() to set analog freq too

---
 utils/cec-follower/cec-follower.cpp |  1 +
 utils/cec-follower/cec-follower.h   |  2 +
 utils/cec-follower/cec-tuner.cpp    | 73 ++++++++++++++++++++++++-----
 3 files changed, 64 insertions(+), 12 deletions(-)

diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
index dca0f627..4243fdd9 100644
--- a/utils/cec-follower/cec-follower.cpp
+++ b/utils/cec-follower/cec-follower.cpp
@@ -298,6 +298,7 @@ void state_init(struct node &node)
 	node.state.sac_active = false;
 	node.state.volume = 50;
 	node.state.mute = false;
+	analog_tuner_init(&node.state.tuner_dev_info);
 }
 
 int main(int argc, char **argv)
diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
index 954e001f..a53c16fe 100644
--- a/utils/cec-follower/cec-follower.h
+++ b/utils/cec-follower/cec-follower.h
@@ -51,6 +51,7 @@ struct state {
 	__u64 rc_press_rx_ts;
 	unsigned rc_press_hold_count;
 	unsigned rc_duration_sum;
+	struct cec_op_tuner_device_info tuner_dev_info;
 };
 
 struct node {
@@ -220,6 +221,7 @@ std::string opcode2s(const struct cec_msg *msg);
 void sad_encode(const struct short_audio_desc *sad, __u32 *descriptor);
 
 // cec-tuner.cpp
+void analog_tuner_init(struct cec_op_tuner_device_info *tuner_dev_info);
 void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me);
 
 // CEC processing
diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index bdeda342..68d945d5 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -4,6 +4,7 @@
  */
 
 #include <sys/ioctl.h>
+#include <stdlib.h>
 
 #include "cec-follower.h"
 
@@ -89,6 +90,51 @@ static unsigned int analog_freqs_khz[3][9][NUM_ANALOG_FREQS] =
 	}
 };
 
+void analog_tuner_init(struct cec_op_tuner_device_info *info)
+{
+	info->rec_flag = CEC_OP_REC_FLAG_NOT_USED;
+	info->tuner_display_info = CEC_OP_TUNER_DISPLAY_INFO_ANALOGUE;
+	info->is_analog = true;
+	info->analog.ana_bcast_type = CEC_OP_ANA_BCAST_TYPE_CABLE;
+	info->analog.ana_freq =
+		analog_freqs_khz[CEC_OP_ANA_BCAST_TYPE_CABLE][CEC_OP_BCAST_SYSTEM_PAL_BG][0];
+	info->analog.bcast_system = CEC_OP_BCAST_SYSTEM_PAL_BG;
+}
+
+static unsigned int analog_get_nearest_freq(__u8 ana_bcast_type, __u8 ana_bcast_system,
+                                            int ana_freq_khz)
+{
+	int nearest = analog_freqs_khz[ana_bcast_type][ana_bcast_system][0];
+
+	for (int i = 0; i < NUM_ANALOG_FREQS; i++) {
+		int freq = analog_freqs_khz[ana_bcast_type][ana_bcast_system][i];
+
+		if (abs(ana_freq_khz - freq) < abs(ana_freq_khz - nearest))
+			nearest = freq;
+	}
+	return nearest;
+}
+
+static bool analog_set_tuner_dev_info(struct node *node, struct cec_msg *msg)
+{
+	struct cec_op_tuner_device_info *info = &node->state.tuner_dev_info;
+	__u8 type = 0;
+	__u16 freq = 0;
+	__u8 system = 0;
+
+	cec_ops_select_analogue_service(msg, &type, &freq, &system);
+	if (info->analog.ana_bcast_type < 3 && info->analog.bcast_system < 9) {
+		int freq_khz = (freq * 625) / 10;
+		unsigned int nearest = analog_get_nearest_freq(type, system,
+							       freq_khz);
+		info->analog.ana_bcast_type = type;
+		info->analog.ana_freq = (nearest * 10) / 625;
+		info->analog.bcast_system = system;
+		return true;
+	}
+	return false;
+}
+
 void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me)
 {
 	bool is_bcast = cec_msg_is_broadcast(&msg);
@@ -105,21 +151,11 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
 		*/
 
 	case CEC_MSG_GIVE_TUNER_DEVICE_STATUS: {
-		if (!cec_has_tuner(1 << me))
+		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
 			break;
 
-		struct cec_op_tuner_device_info tuner_dev_info = {};
-
 		cec_msg_set_reply_to(&msg, &msg);
-		tuner_dev_info.rec_flag = CEC_OP_REC_FLAG_NOT_USED;
-		tuner_dev_info.tuner_display_info = CEC_OP_TUNER_DISPLAY_INFO_NONE;
-		tuner_dev_info.is_analog = false;
-		tuner_dev_info.digital.service_id_method = CEC_OP_SERVICE_ID_METHOD_BY_CHANNEL;
-		tuner_dev_info.digital.dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_C;
-		tuner_dev_info.digital.channel.channel_number_fmt = CEC_OP_CHANNEL_NUMBER_FMT_1_PART;
-		tuner_dev_info.digital.channel.minor = 1;
-
-		cec_msg_tuner_device_status(&msg, &tuner_dev_info);
+		cec_msg_tuner_device_status(&msg, &node->state.tuner_dev_info);
 		transmit(node, &msg);
 		return;
 	}
@@ -128,6 +164,19 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
 		return;
 
 	case CEC_MSG_SELECT_ANALOGUE_SERVICE:
+		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
+			break;
+
+		if (node->state.tuner_dev_info.rec_flag == CEC_OP_REC_FLAG_USED) {
+			reply_feature_abort(node, &msg, CEC_OP_ABORT_REFUSED);
+			return;
+		}
+		if (!analog_set_tuner_dev_info(node, &msg)) {
+			reply_feature_abort(node, &msg, CEC_OP_ABORT_INVALID_OP);
+			return;
+		}
+		return;
+
 	case CEC_MSG_SELECT_DIGITAL_SERVICE:
 	case CEC_MSG_TUNER_STEP_DECREMENT:
 	case CEC_MSG_TUNER_STEP_INCREMENT:
-- 
2.23.0

