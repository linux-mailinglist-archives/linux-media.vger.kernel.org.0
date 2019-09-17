Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAD23B4B14
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2019 11:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727534AbfIQJna (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Sep 2019 05:43:30 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:41427 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728235AbfIQJna (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Sep 2019 05:43:30 -0400
Received: by mail-oi1-f193.google.com with SMTP id w17so2262057oiw.8
        for <linux-media@vger.kernel.org>; Tue, 17 Sep 2019 02:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eao6zm5cBBAAM6I0tchA02aQytck61OIITMmdbK/qFw=;
        b=GWHYXHOd5i5j3aMfBo+XsUFhF28HCj0Aaki2GhiERvQ8gij4AIBFVs3wO9zl+YZ2Uz
         INEhjAS2cWu0T0heheo0D4na8jM+jl3qHgdh23jdX21ADrjF8gMWZ1MPkxiO7umFhE4d
         fLflKFRKE1itxHPs1UG6uHd4vMD4vaXWqgK4Obww68XgBbkPKqyLNVx3atgcRAlzxRIu
         kbnsO5piRLXznIvj/H4D85DDLJHzRTIfgIc676f7bVWiyboQt5VOtl6G7XUhx9UJwtel
         qc3D2QWMi8xrFz7y7ZrgTnX8RisJ5yhgK7JBtcxo/HE92XVpbVKn8iylInS2d+EXicqO
         g6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eao6zm5cBBAAM6I0tchA02aQytck61OIITMmdbK/qFw=;
        b=EGCL/LNtzZayZZTORGhkRZAUKQ6tgfZ1KtTA6j1ogCPmuDO7vUvd2SBHZg6QhilNUS
         sElcntSoOj46WY/soNMA0VnYOIrV6PTkriA3GyNDt9/QSr04BOHqt9M4/KpW7WKhFOwZ
         3gnZPxxe5j+VgUF/RzQdDGZc25RjRbtZCe6WT0iLlUD7TtAo4Vm8P//GmAZBklt6BxHi
         0A7ACsQ5kEEuz8ydqe5XsgYVDU8rKGalc8GfhpV5KUlekmHUDaKRHaNcMQlSX94rbT9m
         3d0SL6bdyjJD98mzqoBsJNv+tKP3waTq7g+PWurjiO++HefuTG14LHX35w67c5YGR60+
         VtwA==
X-Gm-Message-State: APjAAAUOgPAsubXzAs5NM3ylXPx1im6y4TvRUTuLfH6x5qVAIUHypXAN
        CkXTyRsP+cOwBZJVuioeU2OfYjm0
X-Google-Smtp-Source: APXvYqxZzcQ1Gm/fbjLNVkJrGTVZLq0S6usjW/oQxA6/6h8JzwGDrRMfqj9Q7E1CAAt00J8PUDDLNw==
X-Received: by 2002:aca:ef82:: with SMTP id n124mr2705885oih.38.1568713408722;
        Tue, 17 Sep 2019 02:43:28 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::48])
        by smtp.googlemail.com with ESMTPSA id t6sm583970oij.39.2019.09.17.02.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 02:43:28 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH] cec-follower: add tuner analog service emulation
Date:   Tue, 17 Sep 2019 04:43:27 -0500
Message-Id: <20190917094327.51804-1-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
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
 utils/cec-follower/cec-tuner.cpp | 51 ++++++++++++++++++++++++--------
 1 file changed, 39 insertions(+), 12 deletions(-)

diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index 912adcb9..ed198ac8 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -87,6 +87,28 @@ static unsigned int analog_freqs_khz[3][9][3] =
 	}
 };
 
+static struct cec_op_tuner_device_info tuner_dev_info = {};
+
+static void set_analog_channel_freq(const unsigned int ana_freq_khz) {
+	tuner_dev_info.analog.ana_freq = (ana_freq_khz * 10) / 625;
+}
+
+static bool set_analog_tuner_dev_info(const struct cec_msg *msg)
+{
+	tuner_dev_info.rec_flag = CEC_OP_REC_FLAG_NOT_USED;
+	tuner_dev_info.tuner_display_info = CEC_OP_TUNER_DISPLAY_INFO_ANALOGUE;
+	tuner_dev_info.is_analog = true;
+	cec_ops_select_analogue_service(msg,
+					&tuner_dev_info.analog.ana_bcast_type,
+					&tuner_dev_info.analog.ana_freq,
+					&tuner_dev_info.analog.bcast_system);
+	if (tuner_dev_info.analog.ana_bcast_type > 2 ||
+	    tuner_dev_info.analog.bcast_system > 8)
+		return false;
+	set_analog_channel_freq(analog_freqs_khz[1][tuner_dev_info.analog.bcast_system][tuner_dev_info.analog.ana_bcast_type]);
+	return true;
+}
+
 void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me)
 {
 	switch (msg.msg[1]) {
@@ -101,29 +123,34 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
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
 		cec_msg_tuner_device_status(&msg, &tuner_dev_info);
 		transmit(node, &msg);
 		return;
 	}
-
 	case CEC_MSG_TUNER_DEVICE_STATUS:
 		return;
 
 	case CEC_MSG_SELECT_ANALOGUE_SERVICE:
+		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
+			break;
+
+		if (tuner_dev_info.rec_flag == CEC_OP_REC_FLAG_USED) {
+			msg.msg[1] = CEC_MSG_FEATURE_ABORT;
+			msg.msg[2] = CEC_OP_ABORT_REFUSED;
+			transmit(node, &msg);
+			return;
+		}
+		if (!set_analog_tuner_dev_info(&msg)) {
+			msg.msg[1] = CEC_MSG_FEATURE_ABORT;
+			msg.msg[2] = CEC_OP_ABORT_INVALID_OP;
+			transmit(node, &msg);
+			return;
+		}
+		return;
 	case CEC_MSG_SELECT_DIGITAL_SERVICE:
 	case CEC_MSG_TUNER_STEP_DECREMENT:
 	case CEC_MSG_TUNER_STEP_INCREMENT:
-- 
2.23.0

