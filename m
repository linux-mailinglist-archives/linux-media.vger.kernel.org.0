Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A570C1ABB
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 06:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726753AbfI3EaZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 00:30:25 -0400
Received: from mail-ot1-f46.google.com ([209.85.210.46]:33748 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726132AbfI3EaY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 00:30:24 -0400
Received: by mail-ot1-f46.google.com with SMTP id o9so6369748otl.0
        for <linux-media@vger.kernel.org>; Sun, 29 Sep 2019 21:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pygjrhMQMz3wetMmmyV6MZj2BYZCyju0J6No3cPqWtw=;
        b=JVnzc1JacS+2X1ts1sgUgNIwyPIlu6nxopCNlxnqomAicB9VZMPFaeAuE34yZHl5rX
         VcRqn6Ds+fGj3hPT7JnrUbw9mfQzLf8+r5JR7rNBSNB75N1cHjTzRNpuNB2BgRvHCmXO
         HOnKJ9fm/df7OnMNFBnbXgfLyl6HgfDpNpeSctIjGzE6qrKbEdQ//wKeW4ZFQ7usx40y
         mHGmJWpaHjBJCTrrwkc1oTjda2Wp/4Xi7HYgQ5XFmMxalpaiJ+tIjRtX2XdYWtXv2UpD
         RkkACV1dJRO+A5c0vNyntrGjubQGomx/SYh12RPLHrn3lQ55F3LtdRlneikpA6I8WJX2
         xXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pygjrhMQMz3wetMmmyV6MZj2BYZCyju0J6No3cPqWtw=;
        b=oyX7ae854i+9RQu5y9Y0XQJD5NdG6jLf5qUtnxhciFaluifQ2oUvcvzoMKvIT9mGHf
         ES+tdiuaQDPPG0ry0g5+TX6ORu1VAHWL31YZgDlbIebBXRIJpb5k89sgNxIxXlweEdJq
         1Uvlwc8tie6u7t/owJXfhwT/uoRj6CHq3MOO7l2W1IK1Vh2D1r9iVwdg3W27UegwaJjD
         PisKG0m4Ot4g5NFOmmoJkyyizRda6N6vpxZu/CbwJl3REn1arMLHAtZpFSOCqrAGt40l
         +1v9nHoS19zasPNZI4isjyeIPPse2CDFwjYPzDxgs4CQ9CjElC1S3fhJr50lh4udDpL9
         v85g==
X-Gm-Message-State: APjAAAXjjjHDOME4lAJJxsIO0H7loYbhVDAdX/7EdCRd1HzRE5NnF4RV
        1UjNtWSUgxuQgRXKfPgEEFdElQmd
X-Google-Smtp-Source: APXvYqyjA3YY3VJWFESOoW6PHl66D5zq+PVtfGSW0gV2tG21aBY0sDsVl9BfEiRN+XB/WxfQdkCkSw==
X-Received: by 2002:a9d:4048:: with SMTP id o8mr11813319oti.80.1569817822955;
        Sun, 29 Sep 2019 21:30:22 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::40])
        by smtp.googlemail.com with ESMTPSA id w20sm3509017otq.72.2019.09.29.21.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2019 21:30:22 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH v3 3/3] cec-compliance: refactor tuner control tests
Date:   Sun, 29 Sep 2019 23:30:17 -0500
Message-Id: <20190930043017.474025-4-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190924192445.93575-1-c0d1n61at3@gmail.com>
References: <20190924192445.93575-1-c0d1n61at3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tests refactored for new features added to cec-collower.

Analog tuner control tests combined into tuner_ctl_test():
  - give analog tuner status
  - select tuner analog service
  - analog tuner step features

Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
---
 utils/cec-compliance/cec-test.cpp | 184 +++++++++---------------------
 1 file changed, 54 insertions(+), 130 deletions(-)

diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index aece546c..bdeb589f 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -722,9 +722,13 @@ static struct remote_subtest deck_ctl_subtests[] = {
   TODO: These are very rudimentary tests which should be expanded.
  */
 
-static int tuner_ctl_give_status(struct node *node, unsigned me, unsigned la, bool interactive)
+static int tuner_ctl_test(struct node *node, unsigned me, unsigned la, bool interactive)
 {
 	struct cec_msg msg = {};
+	struct cec_op_tuner_device_info info = {};
+	struct cec_op_tuner_device_info data[81] = {};
+	int cnt = 0;
+	__u16 start_freq;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
@@ -734,163 +738,83 @@ static int tuner_ctl_give_status(struct node *node, unsigned me, unsigned la, bo
 		return NOTSUPPORTED;
 	if (refused(&msg))
 		return REFUSED;
-	if (cec_msg_status_is_abort(&msg))
-		return PRESUMED_OK;
-
-	return 0;
-}
+	cec_ops_tuner_device_status(&msg, &info);
+	start_freq = info.analog.ana_freq;
+	data[cnt++] = info;
 
-static int tuner_ctl_sel_analog_service(struct node *node, unsigned me, unsigned la, bool interactive)
-{
-	struct cec_msg msg = {};
+	while (1) {
+		struct cec_op_tuner_device_info *new_info =
+			(struct cec_op_tuner_device_info *)malloc(sizeof(struct cec_op_tuner_device_info));
 
-	node->remote[la].bcast_sys = ~0;
-	for (unsigned sys = 0; sys <= 8; sys++) {
 		cec_msg_init(&msg, me, la);
-		cec_msg_select_analogue_service(&msg, CEC_OP_ANA_BCAST_TYPE_CABLE,
-						7668, sys); // 479.25 MHz analog frequency
+		cec_msg_tuner_step_increment(&msg);
 		fail_on_test(!transmit_timeout(node, &msg));
 		if (unrecognized_op(&msg))
 			return NOTSUPPORTED;
-		if (abort_reason(&msg) == CEC_OP_ABORT_INVALID_OP) {
-			info("Tuner supports %s, but cannot select that service.\n",
-			     bcast_system2s(sys));
-			node->remote[la].bcast_sys = sys;
-			continue;
+		if (refused(&msg))
+			return REFUSED;
+		cec_msg_init(&msg, me, la);
+		cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
+		fail_on_test(!transmit_timeout(node, &msg));
+		fail_on_test(timed_out(&msg));
+		if (unrecognized_op(&msg))
+			return NOTSUPPORTED;
+		if (refused(&msg))
+			return REFUSED;
+		cec_ops_tuner_device_status(&msg, new_info);
+		if (new_info->analog.ana_freq == start_freq)
+			break;
+		if (new_info->analog.ana_freq == data[cnt - 1].analog.ana_freq) {
+			warn("Tuner channel step increment does not wrap.\n");
+			break;
 		}
-		if (cec_msg_status_is_abort(&msg))
-			continue;
-		info("Tuner supports %s\n", bcast_system2s(sys));
-		node->remote[la].bcast_sys = sys;
+		data[cnt] = *new_info;
+		cnt++;
 	}
 
-	if (node->remote[la].bcast_sys == (__u8)~0)
-		warn("No analog broadcast format supported\n");
-	else
-		return 0;
+	for (size_t i = 0; i < sizeof(data) / sizeof(data[0]); i++) {
+		info = data[i];
+		struct cec_op_tuner_device_info current;
 
-	return PRESUMED_OK;
-}
-
-static int tuner_ctl_sel_digital_service(struct node *node, unsigned me, unsigned la, bool interactive)
-{
-	struct cec_msg msg = {};
-	struct cec_op_digital_service_id digital_service_id = {};
-
-	digital_service_id.service_id_method = CEC_OP_SERVICE_ID_METHOD_BY_CHANNEL;
-	digital_service_id.channel.channel_number_fmt = CEC_OP_CHANNEL_NUMBER_FMT_1_PART;
-	digital_service_id.channel.minor = 1;
-
-	__u8 bcast_systems[] = {
-		CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_GEN,
-		CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_GEN,
-		CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_GEN,
-		CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_BS,
-		CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_CS,
-		CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_T,
-		CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_CABLE,
-		CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_SAT,
-		CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_T,
-		CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_C,
-		CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_S,
-		CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_S2,
-		CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_T,
-	};
-
-	node->remote[la].dig_bcast_sys = ~0;
-	for (unsigned i = 0; i < ARRAY_SIZE(bcast_systems); i++) {
-		__u8 sys = bcast_systems[i];
-
-		digital_service_id.dig_bcast_system = sys;
 		cec_msg_init(&msg, me, la);
-		cec_msg_select_digital_service(&msg, &digital_service_id);
+		cec_msg_select_analogue_service(&msg, info.analog.ana_bcast_type,
+			info.analog.ana_freq, info.analog.bcast_system);
 		fail_on_test(!transmit_timeout(node, &msg));
 		if (unrecognized_op(&msg))
 			return NOTSUPPORTED;
-		if (abort_reason(&msg) == CEC_OP_ABORT_INVALID_OP) {
-			info("Tuner supports %s, but cannot select that service.\n",
-			     dig_bcast_system2s(sys));
-			node->remote[la].dig_bcast_sys = sys;
-			continue;
+		if (refused(&msg))
+			return REFUSED;
+		cec_msg_init(&msg, me, la);
+		cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
+		fail_on_test(!transmit_timeout(node, &msg));
+		fail_on_test(timed_out(&msg));
+		if (unrecognized_op(&msg))
+			return NOTSUPPORTED;
+		if (refused(&msg))
+			return REFUSED;
+		cec_ops_tuner_device_status(&msg, &current);
+		fail_on_test(current.analog.ana_freq != info.analog.ana_freq);
+		if (info.is_analog) {
+			float freq_mhz = (info.analog.ana_freq * 625) / 10000;
+			info("Analog channel freq: %.2f MHz\n", freq_mhz);
 		}
-		if (cec_msg_status_is_abort(&msg))
-			continue;
-		info("Tuner supports %s\n", dig_bcast_system2s(sys));
-		node->remote[la].dig_bcast_sys = sys;
 	}
 
-	if (node->remote[la].dig_bcast_sys == (__u8)~0)
-		warn("No digital broadcast system supported\n");
-	else
-		return 0;
-
-	return PRESUMED_OK;
-}
-
-static int tuner_ctl_tuner_dev_status(struct node *node, unsigned me, unsigned la, bool interactive)
-{
-	struct cec_msg msg = {};
-	struct cec_op_tuner_device_info tuner_dev_info = {};
-
-	tuner_dev_info.rec_flag = CEC_OP_REC_FLAG_NOT_USED;
-	tuner_dev_info.tuner_display_info = CEC_OP_TUNER_DISPLAY_INFO_NONE;
-	tuner_dev_info.is_analog = false;
-	tuner_dev_info.digital.service_id_method = CEC_OP_SERVICE_ID_METHOD_BY_CHANNEL;
-	tuner_dev_info.digital.dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_C;
-	tuner_dev_info.digital.channel.channel_number_fmt = CEC_OP_CHANNEL_NUMBER_FMT_1_PART;
-	tuner_dev_info.digital.channel.minor = 1;
-
 	cec_msg_init(&msg, me, la);
-
-	cec_msg_tuner_device_status(&msg, &tuner_dev_info);
+	cec_msg_select_analogue_service(&msg, 3, 16000, 9);
 	fail_on_test(!transmit_timeout(node, &msg));
 	if (unrecognized_op(&msg))
 		return NOTSUPPORTED;
 	if (refused(&msg))
 		return REFUSED;
-	if (cec_msg_status_is_abort(&msg))
-		return PRESUMED_OK;
+	fail_on_test(!cec_msg_status_is_abort(&msg));
+	fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
 
 	return 0;
 }
 
-static int tuner_ctl_step_dec(struct node *node, unsigned me, unsigned la, bool interactive)
-{
-	struct cec_msg msg = {};
-
-	cec_msg_init(&msg, me, la);
-	cec_msg_tuner_step_decrement(&msg);
-	fail_on_test(!transmit_timeout(node, &msg));
-	if (unrecognized_op(&msg))
-		return NOTSUPPORTED;
-	if (refused(&msg))
-		return REFUSED;
-
-	return PRESUMED_OK;
-}
-
-static int tuner_ctl_step_inc(struct node *node, unsigned me, unsigned la, bool interactive)
-{
-	struct cec_msg msg = {};
-
-	cec_msg_init(&msg, me, la);
-	cec_msg_tuner_step_increment(&msg);
-	fail_on_test(!transmit_timeout(node, &msg));
-	if (unrecognized_op(&msg))
-		return NOTSUPPORTED;
-	if (refused(&msg))
-		return REFUSED;
-
-	return PRESUMED_OK;
-}
-
 static struct remote_subtest tuner_ctl_subtests[] = {
-	{ "Give Tuner Device Status", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_give_status },
-	{ "Select Analogue Service", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_sel_analog_service },
-	{ "Select Digital Service", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_sel_digital_service },
-	{ "Tuner Device Status", CEC_LOG_ADDR_MASK_ALL, tuner_ctl_tuner_dev_status },
-	{ "Tuner Step Decrement", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_step_dec },
-	{ "Tuner Step Increment", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_step_inc },
+	{ "Tuner Control", CEC_LOG_ADDR_MASK_TUNER | CEC_LOG_ADDR_MASK_TV, tuner_ctl_test },
 };
 
 
-- 
2.23.0

