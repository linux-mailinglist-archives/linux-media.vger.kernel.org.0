Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7D8AB805D
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2019 19:47:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391103AbfISRrM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Sep 2019 13:47:12 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:41976 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391038AbfISRrL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Sep 2019 13:47:11 -0400
Received: by mail-oi1-f195.google.com with SMTP id w17so3452325oiw.8
        for <linux-media@vger.kernel.org>; Thu, 19 Sep 2019 10:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5TGdIV2dt8oLLuPWoDdahHMheN8yswwxHcWl4W40138=;
        b=E5R+8NE5bTW7OHll5BdEFrKS+DNQE6Y0Jpf7EOC/piFg7uuE3Gt2r3ptMkbi3AMX3y
         0Q5AEttY0zDoiOUzuGOYfC9Fvgj+OtZGBZm3bn1KnJFT3GkVaHiFUwuwmsfjo5JCimWY
         0HMvBMAwTKlU5z61FBQrDFbbR2CXnXGusQIxH6ZZI5nsmTK20crliT9aMxVOJjoJ9Upx
         Vt+ejpe8+evS5Ekf8BG9bRA/BREwAPQ1tBBwo2tCfYOKDvtHXq7NwvHQI/gqbVBD0uTj
         RUbdMIGMBX7NIJHB1xGyEEp25twXjUexQ+h5Ys/Yd3fsFEvZgi6uFuGkJdRSFoBxGHbi
         UIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5TGdIV2dt8oLLuPWoDdahHMheN8yswwxHcWl4W40138=;
        b=LaYcMp7CTUWzwRwtAuE5hRsXyl/Wzy9gVcWlWQuGrs/Pd0LfeuAqP4VFYnJuPl4nlC
         HkeuQvIA9JuDm7lOHKsyxC7w1EIYU7RrA8YNphf245bRd6lAQheOEtQTTHtICcAZEgq2
         etaZvWVQN/HbXjMn0QZGgLdVBd+BXE4wNwJ7lDF+TZzyrLOzUMgk2RNmJP4D6SR7cQJw
         xSRhp/VgRh7uwxnJjm8yop18QBhg/ve6Ia8dJMlafc4aCiFRokfaPDlTtl14ZMT1PImk
         70ByvzGvKHPiQ13qvwP8jDoQhMLW0y/NaV1gR7LQOu+S9PMEbuQCDg8fx3G4tsHZkj8+
         OCtQ==
X-Gm-Message-State: APjAAAVnj9uUAPubnm/WzcjwfaFZ31jj1C3fp2zaHBs1u06hkRuk+Xsl
        VXrmu8Ctmd0qP0lX0ZXIqTtqrli3
X-Google-Smtp-Source: APXvYqza3YNjZz/nR6Grrl+dAjtPKdgBsjR5B7sQNlOOzO/qbQI3KeBYa607kSPOFtDRpSt0c8ATkw==
X-Received: by 2002:aca:ba06:: with SMTP id k6mr3359469oif.136.1568915230400;
        Thu, 19 Sep 2019 10:47:10 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::48])
        by smtp.googlemail.com with ESMTPSA id e5sm3033680otr.81.2019.09.19.10.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 10:47:09 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH v5] cec-follower: add tuner analog service emulation
Date:   Thu, 19 Sep 2019 12:47:02 -0500
Message-Id: <20190919174702.140335-3-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190919041844.346514-1-c0d1n61at3@gmail.com>
References: <20190919041844.346514-1-c0d1n61at3@gmail.com>
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

---
 utils/cec-follower/cec-follower.h |  1 +
 utils/cec-follower/cec-tuner.cpp  | 62 +++++++++++++++++++++++++------
 2 files changed, 51 insertions(+), 12 deletions(-)

diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
index 03b52217..91b9e037 100644
--- a/utils/cec-follower/cec-follower.h
+++ b/utils/cec-follower/cec-follower.h
@@ -51,6 +51,7 @@ struct state {
 	__u64 rc_press_rx_ts;
 	unsigned rc_press_hold_count;
 	unsigned rc_duration_sum;
+	struct cec_op_tuner_device_info tuner_dev_info;
 };
 
 struct node {
diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index bdeda342..87425083 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -4,6 +4,7 @@
  */
 
 #include <sys/ioctl.h>
+#include <stdlib.h>
 
 #include "cec-follower.h"
 
@@ -89,6 +90,40 @@ static unsigned int analog_freqs_khz[3][9][NUM_ANALOG_FREQS] =
 	}
 };
 
+static void analog_set_tuner_chan_freq(struct node *node)
+{
+	struct cec_op_tuner_device_info *info = &node->state.tuner_dev_info;
+	int ana_freq_khz = (info->analog.ana_freq * 625) / 10;
+	int nearest = analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][0];
+
+	for (int i = 0; i < NUM_ANALOG_FREQS; i++) {
+		int freq = analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][i];
+
+		if (abs(ana_freq_khz - freq) < abs(ana_freq_khz - nearest)) {
+			nearest = freq;
+		}
+	}
+	info->analog.ana_freq = (nearest * 10) / 625;
+}
+
+static bool analog_set_tuner_dev_info(struct node *node, struct cec_msg *msg)
+{
+	struct cec_op_tuner_device_info *info = &node->state.tuner_dev_info;
+
+	info->rec_flag = CEC_OP_REC_FLAG_NOT_USED;
+	info->tuner_display_info = CEC_OP_TUNER_DISPLAY_INFO_ANALOGUE;
+	info->is_analog = true;
+	cec_ops_select_analogue_service(msg,
+					&info->analog.ana_bcast_type,
+					&info->analog.ana_freq,
+					&info->analog.bcast_system);
+	if (info->analog.ana_bcast_type > 2 ||
+	    info->analog.bcast_system > 8)
+		return false;
+	analog_set_tuner_chan_freq(node);
+	return true;
+}
+
 void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me)
 {
 	bool is_bcast = cec_msg_is_broadcast(&msg);
@@ -105,21 +140,11 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
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
@@ -128,6 +153,19 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
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

