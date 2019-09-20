Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C984B98D9
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2019 23:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729784AbfITVR4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Sep 2019 17:17:56 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:34379 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbfITVR4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Sep 2019 17:17:56 -0400
Received: by mail-oi1-f193.google.com with SMTP id 83so2984476oii.1
        for <linux-media@vger.kernel.org>; Fri, 20 Sep 2019 14:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VYq9DFXgbtOKu/3DTgdH2Qz5iHHZhujXeIuhRPdNltk=;
        b=vDi6MlUcnIUJ8oTCcPTEgtmnYCiJuA4WK9MKLJEs/AIEZM8Mj63wZPkJM3Wa82Yprt
         ESxCM4IP6Xf0jJmfwKgfBNEucGhyCLc/m3CzETReZhc4mRFWPaGBUmkxVgA38KEDKI7E
         cWfQnkqq8qOMdxYEoqeJhIIBNqT0CjtzRrToe0nHjDf0aGpIu6G9dtNpWw73BntFn5Tf
         ow78WpLNOyG2uvXCkrPqZKg8ATs1cSLEQo6igQ3rp+HYkkgc7hlH4gPpxdolLS0XIT1K
         tjsrM8a8h4GKRWPMAF65LpOps2kDD7XWk1Uy9I+Q33w74Xr2rQ40a2pupmeqKyhf24Ax
         8hcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VYq9DFXgbtOKu/3DTgdH2Qz5iHHZhujXeIuhRPdNltk=;
        b=L1wamDSYOu3IwIu+D4oeX0h0vYZOWJsEAuzjB/GKVHzr5m+XXYNMLoWV6Uu0SI2iRX
         VpOjQzPhgx2GTCYPQ+vEvqPpx6aZ7wspgGlg8vjOcC79tqYedwpTnD2tMEjUCXQD3Zdp
         2kXAUs2kIONSxzEdT6/zErUrRBnHtQOhUrqSKcNE4fcJFOodrnGywwmHrKZHCfwi17wh
         wYELUc9ahzPzfU4UtlbzXjGo6M1RAG9ht67vRtwE2Fm4a8apIKmkFLPyZe/PSJ1mUoQe
         mv2vx2ZyEsfqOQwJ3bX6x1Q3sHbLwYr86bmPoC9O4d6kvnRbfvqm+0izmXolM/X3WCeQ
         nSsA==
X-Gm-Message-State: APjAAAXfaEvL2WnZ9y1De9UKuGAkGYr/pDioMF8MxiOsIlia5z7a4uJN
        P6CvDPazTqvLtTptK1/XNf+mc3in
X-Google-Smtp-Source: APXvYqzNV3OjFHiaj6rm29t4FnIJmU0GNwmbatARwC6wPQz0R9rBrCF820l/05M7fBzIFz3KmgT5nw==
X-Received: by 2002:aca:db03:: with SMTP id s3mr5023533oig.56.1569014274775;
        Fri, 20 Sep 2019 14:17:54 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::40])
        by smtp.googlemail.com with ESMTPSA id x140sm976113oix.42.2019.09.20.14.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2019 14:17:53 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH v7] cec-follower: add tuner analog service emulation
Date:   Fri, 20 Sep 2019 16:17:52 -0500
Message-Id: <20190920211752.310836-1-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190920193236.217671-1-c0d1n61at3@gmail.com>
References: <20190920193236.217671-1-c0d1n61at3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cec-follower will now emulate an analog service.  This allows an
initiator device can directly select an analog service by choosing an
analog broadcast type, broadcast system, and frequency. After an analog
service is selected, the cec-follower will also provide the tuner device
status upon request.

Opcodes implemented:
  - <Select Analogue Service>
  - <Give Tuner Device Status>

Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
---

Changes made since v6:
  - Add more information to commit message

Changes made since v5:
  - Add analog_tuner_init() to cec-tuner.cpp
  - Change state_init() in cec-follower.cpp to use analog_tuner_init()
  - Rename function to analog_get_nearest_freq()
  - Change analog_get_nearest_freq() to only return freq in Khz
  - Change analog_set_tuner_dev_info() to set analog freq too

Changes made since v4:
  - Remove int casting in abs()
  - Add temp variables: info, freq to make code easier to read
  - Use NUM_ANALOG_FREQS macro

Changes made since v3:
  - Refactor lines numbers since a fix patch was needed for cec-tuner.cpp

Changes made since v2:
  - Fix typos/bugs
  - Use state from node in cec-follower.h
  - Rename functions to analog_ prefix

Changes made since v1:
  - Fix typos/bugs
  - Import reply_feature_abort() from cec-processing.cpp
  - Add functionality to choose nearest frequency

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

