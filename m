Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 047ECB6C88
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2019 21:27:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730585AbfIRT1Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Sep 2019 15:27:16 -0400
Received: from mail-oi1-f170.google.com ([209.85.167.170]:38058 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727805AbfIRT1P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Sep 2019 15:27:15 -0400
Received: by mail-oi1-f170.google.com with SMTP id 7so635625oip.5
        for <linux-media@vger.kernel.org>; Wed, 18 Sep 2019 12:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FoiH/LwYDSn6+FzpJEdfc23+3YOXHvGHuT2UrzsD5JY=;
        b=U2mYeTK/sKAgdFXJfur1A8Ds7IoPi8sv9G/q5Z+FWzrHIabCkHkoBlbuQxXC9b9+vn
         UaTvvfzHRK4ho+jQ1L2cJ1brlaB241YR0u6sXBkjl2XDyt8KiT9Iy/i3llZWBcslp3TY
         keAdwYQXt2cnsbKdYS9k5ttEAO55JsM3EJS/Bkp1MT4KEz63ww7f/m55QLPpGuPyr1OV
         vxVx7DIGrCIZDHqYZe8t+ImNSvGa2wdw6m54enV0q4m+kDdRaoSP9eNVMpsYnQccUxBy
         94mKiZ3OXxlcG5JMPnyjxE4ern4WTtUIL7sv7kFGeYL1PkhHSnlEnsZNXCibFbArURNY
         IlXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FoiH/LwYDSn6+FzpJEdfc23+3YOXHvGHuT2UrzsD5JY=;
        b=uI6zH5rRAuUNZRlkjsuzHOc5dtdBAL1CYwuXO+Q/OYKYP0B7rY/2Y1P6NZNYaMapg4
         GGA/94NIQAxvzgU7ohyqY6VbQOpDaMmAqQ5umdDAVy005iwAgPrPOnIREexz5gDsuH+V
         uMROjU0q0tvwaYUdgMuZSnEJ8f7jLsJw/QjHLOByStZRHH+WMBG8uyDHvCTzvk377q2X
         LLLv1ts4Vw95pLTRHFFHWJsKqyTKyxSC6cDLgRn71wJanwltBQHbFWsLywkAhisXZ+Yu
         f8RGVlhUOYlVMY/qTjXKTaUDxsHNyEO67mPcvpnVt+by/2iz2mzWRm49DbAcHs7rHOSR
         xi9Q==
X-Gm-Message-State: APjAAAVEXF4Qcn24QEhky825IjnuqXCg+/WUYSYPOriiwYYU0wojdTyf
        HCJ/lMPcQKDADq9djp4P0Wm35GqZ
X-Google-Smtp-Source: APXvYqypWSPOCh5lvKC493GNnrcFeR5etPWniXShQE4q9CU1NDLaFCRgUbVHr0xl4Jy+B7tvWM/fkA==
X-Received: by 2002:aca:7250:: with SMTP id p77mr3582808oic.157.1568834833774;
        Wed, 18 Sep 2019 12:27:13 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::48])
        by smtp.googlemail.com with ESMTPSA id 109sm2046163otc.52.2019.09.18.12.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2019 12:27:12 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH v3] cec-follower: add tuner analog service emulation
Date:   Wed, 18 Sep 2019 14:27:10 -0500
Message-Id: <20190918192710.170428-1-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190917190539.162555-1-c0d1n61at3@gmail.com>
References: <20190917190539.162555-1-c0d1n61at3@gmail.com>
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

---
 utils/cec-follower/cec-follower.h |  1 +
 utils/cec-follower/cec-tuner.cpp  | 87 ++++++++++++++++++++++++++-----
 2 files changed, 76 insertions(+), 12 deletions(-)

diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
index 9f5f1be4..9c146be1 100644
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
index 912adcb9..1b2c0608 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -4,6 +4,7 @@
  */
 
 #include <sys/ioctl.h>
+#include <stdlib.h>
 
 #include "cec-follower.h"
 
@@ -87,6 +88,65 @@ static unsigned int analog_freqs_khz[3][9][3] =
 	}
 };
 
+static void analog_set_tuner_chan_freq(struct node *node)
+{
+	unsigned int ana_freq_khz = (node->state.tuner_dev_info.analog.ana_freq * 625) / 10;
+	unsigned int nearest = analog_freqs_khz[node->state.tuner_dev_info.analog.ana_bcast_type][node->state.tuner_dev_info.analog.bcast_system][0];
+	for (int i = 0; i < 3; i++) {
+		if (abs(int(ana_freq_khz - analog_freqs_khz[node->state.tuner_dev_info.analog.ana_bcast_type][node->state.tuner_dev_info.analog.bcast_system][i])) <
+		    abs(int(ana_freq_khz - nearest))) {
+			nearest = analog_freqs_khz[node->state.tuner_dev_info.analog.ana_bcast_type][node->state.tuner_dev_info.analog.bcast_system][i];
+		}
+	}
+	node->state.tuner_dev_info.analog.ana_freq = (nearest * 10) / 625;
+}
+
+static bool analog_set_tuner_dev_info(struct node *node, struct cec_msg *msg)
+{
+	node->state.tuner_dev_info.rec_flag = CEC_OP_REC_FLAG_NOT_USED;
+	node->state.tuner_dev_info.tuner_display_info = CEC_OP_TUNER_DISPLAY_INFO_ANALOGUE;
+	node->state.tuner_dev_info.is_analog = true;
+	cec_ops_select_analogue_service(msg,
+					&node->state.tuner_dev_info.analog.ana_bcast_type,
+					&node->state.tuner_dev_info.analog.ana_freq,
+					&node->state.tuner_dev_info.analog.bcast_system);
+	if (node->state.tuner_dev_info.analog.ana_bcast_type > 2 ||
+	    node->state.tuner_dev_info.analog.bcast_system > 8)
+		return false;
+	analog_set_tuner_chan_freq(node);
+	return true;
+}
+
+static void reply_feature_abort(struct node *node, struct cec_msg *msg, __u8 reason = CEC_OP_ABORT_UNRECOGNIZED_OP)
+{
+	unsigned la = cec_msg_initiator(msg);
+	__u8 opcode = cec_msg_opcode(msg);
+	__u64 ts_now = get_ts();
+
+	if (cec_msg_is_broadcast(msg) || cec_msg_initiator(msg) == CEC_LOG_ADDR_UNREGISTERED)
+		return;
+	if (reason == CEC_OP_ABORT_UNRECOGNIZED_OP) {
+		la_info[la].feature_aborted[opcode].count++;
+		if (la_info[la].feature_aborted[opcode].count == 2) {
+			/* If the Abort Reason was "Unrecognized opcode", the Initiator should not send
+			   the same message to the same Follower again at that time to avoid saturating
+			   the bus. */
+			warn("Received message %s from LA %d (%s) shortly after\n",
+				opcode2s(msg).c_str(), la, la2s(la));
+			warn("replying Feature Abort [Unrecognized Opcode] to the same message.\n");
+		}
+	}
+	else if (la_info[la].feature_aborted[opcode].count) {
+		warn("Replying Feature Abort with abort reason different than [Unrecognized Opcode]\n");
+		warn("to message that has previously been replied Feature Abort to with [Unrecognized Opcode].\n");
+	}
+	else
+		la_info[la].feature_aborted[opcode].ts = ts_now;
+
+	cec_msg_reply_feature_abort(msg, reason);
+	transmit(node, msg);
+}
+
 void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me)
 {
 	switch (msg.msg[1]) {
@@ -101,21 +161,11 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
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
@@ -124,6 +174,19 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
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

