Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A684BD291
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 21:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407749AbfIXTYu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 15:24:50 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:39269 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407325AbfIXTYt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 15:24:49 -0400
Received: by mail-oi1-f193.google.com with SMTP id w144so2710032oia.6
        for <linux-media@vger.kernel.org>; Tue, 24 Sep 2019 12:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MLc6B0iL+eyzCWLseh4/ryGZ/b/9E1yyU/1FQv8DUSQ=;
        b=blhNrHk8biA8PdN9ulckOuojCdMw2jmYeXcp4ilCm1mNMg2/KmYOIpgFK0UaSlIDB8
         qfUf+PxYQPZ4i6LQtdH0Z4yvYxynegdG1CvxzexghcDumiRoy2mC+UUIiTVbYZpXJ8dh
         T9bWnQklmePXTyVVHAb4V8za4Enjobo5eB9c7lRNw9OZPLZG8Q26v7ntYYGONhesDbCS
         GtUjSnpfvUhGx6IJl/nFCSuMstSLJpUJMZNDOFEacuusX2A5R6AxR7D6axUIaoeDu46v
         wKwGaNRl04LysrQ0QXD2Q+rAi24L9gDOX6M5Bnc4EeyWI4xsiHy2h23wKiQyQQ6BZP+b
         nelQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MLc6B0iL+eyzCWLseh4/ryGZ/b/9E1yyU/1FQv8DUSQ=;
        b=fzpg1rpredosYs1JZopAnhu0jQj70OTwgYQSyFZE14pOaItIPiLrSbZxLnEyu37MGi
         RSnPYMFnESkRL0ByCF+BVohGb2pXQjwkv+SmRoL7KMUKpUtJTThLosbP+vYIiCDtZ5KL
         h9pUSqJciE59LSjuH1wKHyqviNSgLfM0DlRsapp3gxB+Vm9JC98wdawCW6zznW/E/XzC
         nQstl9E/4wd2mnCBbv0wRzxDnEDUHhjwm8V0c5Wy8inWsD4/cY1ri2nABzs3Uz8DVlsQ
         F5qetPaJQEL3i4ov73/qQTtkkgVFcv5LD2GxUj7A9L7Ao1HV0TvS7FyqQPYbTzLqpVZw
         9pnQ==
X-Gm-Message-State: APjAAAVn9dcAQn4vuxYlvDebuzvYkUnmYijoQE7RFx0TPoGsh6Iov98C
        FWcGAlcHb84l4FS6UbeXWYGQBOD9
X-Google-Smtp-Source: APXvYqwcE4P6G+/a9dOycFd+vQaDkigq/oBiF5Km7nGADSn2cM5Y2iGXIHTSKj/5MLDS8ZScZPbsNA==
X-Received: by 2002:aca:d408:: with SMTP id l8mr1529471oig.113.1569353088607;
        Tue, 24 Sep 2019 12:24:48 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::40])
        by smtp.googlemail.com with ESMTPSA id v75sm833503oia.6.2019.09.24.12.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2019 12:24:47 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH v2 1/2] cec-follower: add tuner step increment/decrement
Date:   Tue, 24 Sep 2019 14:24:44 -0500
Message-Id: <20190924192445.93575-2-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190924141752.5508-1-c0d1n61at3@gmail.com>
References: <20190924141752.5508-1-c0d1n61at3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tuner step increment/decrement will select the next highest or next
lowest service frequency.  There are a total of three possible
frequencies from analog_freqs_khz given a broadcast type and system.

Opcodes implemented:
  - <Tuner Step Increment>
  - <Tuner Step Decrement>

Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
---
 utils/cec-follower/cec-tuner.cpp | 47 ++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 3 deletions(-)

diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index acc3fd00..1a9b9d90 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -135,6 +135,22 @@ static bool analog_set_tuner_dev_info(struct node *node, struct cec_msg *msg)
 	return false;
 }
 
+static int analog_find_freq_index(struct cec_op_tuner_device_info *info)
+{
+	if (info->analog.ana_freq == 0)
+		return -1;
+
+	int ana_freq_khz = (info->analog.ana_freq * 625) / 10;
+
+	for (int i = 0; i < NUM_ANALOG_FREQS; i++) {
+		int freq = analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][i];
+
+		if (ana_freq_khz == freq)
+			return i;
+	}
+	return -1;
+}
+
 void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me)
 {
 	bool is_bcast = cec_msg_is_broadcast(&msg);
@@ -178,12 +194,37 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
 		return;
 
 	case CEC_MSG_SELECT_DIGITAL_SERVICE:
-	case CEC_MSG_TUNER_STEP_DECREMENT:
-	case CEC_MSG_TUNER_STEP_INCREMENT:
-		if (!cec_has_tuner(1 << me))
+	case CEC_MSG_TUNER_STEP_DECREMENT: {
+		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
 			break;
+
+		struct cec_op_tuner_device_info *info = &node->state.tuner_dev_info;
+		int freq_idx = analog_find_freq_index(info);
+		int idx = (freq_idx == 0) ? NUM_ANALOG_FREQS : freq_idx;
+
+		if (info->is_analog) {
+			int freq = analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][--idx];
+
+			info->analog.ana_freq = (freq * 10) / 625;
+		}
 		return;
+	}
+
+	case CEC_MSG_TUNER_STEP_INCREMENT: {
+		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
+			break;
 
+		struct cec_op_tuner_device_info *info = &node->state.tuner_dev_info;
+		int freq_idx = analog_find_freq_index(info);
+		int idx = (freq_idx == NUM_ANALOG_FREQS - 1) ? -1 : freq_idx;
+
+		if (info->is_analog) {
+			int freq = analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][++idx];
+
+			info->analog.ana_freq = (freq * 10) / 625;
+		}
+		return;
+	}
 
 		/*
 		  One Touch Record
-- 
2.23.0

