Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF81BC9FE
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 16:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441268AbfIXOR6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 10:17:58 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:32983 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2441264AbfIXOR5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 10:17:57 -0400
Received: by mail-oi1-f193.google.com with SMTP id e18so1789029oii.0
        for <linux-media@vger.kernel.org>; Tue, 24 Sep 2019 07:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nXyOBqTnjNNNs/kVlXPvyFwjglSVqhwqxGnE850B05g=;
        b=li9PHn69lSZxh65mc1aDKxV82WHWtjMnFFdNjGbaniEo2y8U9ariRK542WPEErLNzI
         DVhT0WnxFUUM/0hDREFQs4SA/RYMzLjlWTW4luL1L6AgLGokQecSwX81smoEAsezSNzU
         rIiytUDrFDGhSnKB5YDkeMHqtzN/6DNCM7dfwILt96R9sOubHBXTAM5+ETazoJn7vxyT
         rQmkwXT4AT0iX7kThCNYVwth973ZKiii26/RjuhcLeHVp7EU4lUlzFYCQa55RbUa58JB
         sivUgVTV2GV6vW0n6C4vhwJY0ZpJb1I/Cgh2xDZ3KnZtAnH4kuXIhyWYWoR0KXj+wS5Y
         huKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nXyOBqTnjNNNs/kVlXPvyFwjglSVqhwqxGnE850B05g=;
        b=SxDanh6NTp7rULnrGpUMvBJMsTrkD81SJAcB18cvBuDbzaZT22VlkGmWEvI8SHMBBX
         UOhOtYuilXdFx6c3ywdv0bwidvaUW9OKFDvvFENyGxfjJKaR4xkpwT1uDraDUzIuM0gz
         Pg7GPoHhp3MiUK6Y/l0h+M54nn2CPVGnJZGMNLtE4NhBgeZfs+0KjhnyfH1lKCbZdN7Z
         NfIQxcTOV9CzNaivJumw2y/9wG5ICi5sSP2+gBShgBP9HMuuMD8h+Y7xm8S5G/ZLzxGv
         2mAWn9zrosURwiN5wsgYO6CyXVVxgEmtjrnSe20cfnIFEOtJQTBubuRKhbQ20wTF75f9
         PdeQ==
X-Gm-Message-State: APjAAAUoooTgV9TmLW77/VlxshHuVibrWKgqnYW4E78k15jih+bFIoS0
        Eg6H6Fs9I0JTZGtMVNzaLOBkO3Kx
X-Google-Smtp-Source: APXvYqxa34fNGvUOT3AiAka6lWtvP0uaPYoshTmjjlGvxD0hk1wrRfOrjCxlnEOQsoXlLuPlrQc8gA==
X-Received: by 2002:aca:fd8a:: with SMTP id b132mr250968oii.33.1569334674849;
        Tue, 24 Sep 2019 07:17:54 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::40])
        by smtp.googlemail.com with ESMTPSA id j11sm555543otk.80.2019.09.24.07.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2019 07:17:54 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH 2/2] cec-compliance: add/refactor tuner control tests
Date:   Tue, 24 Sep 2019 09:17:52 -0500
Message-Id: <20190924141752.5508-3-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190924141752.5508-1-c0d1n61at3@gmail.com>
References: <20190924141752.5508-1-c0d1n61at3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tests added/refactored for new features added to the cec-follower.

Analog tuner control tests added/refactored:
  - give analog tuner status
  - select tuner analog service
  - analog tuner step decrement
  - analog tuner step increment

Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
---
 utils/cec-compliance/cec-test.cpp | 181 +++++++++++++++++++++++-------
 1 file changed, 140 insertions(+), 41 deletions(-)

diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index aece546c..91600d39 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -722,9 +722,19 @@ static struct remote_subtest deck_ctl_subtests[] = {
   TODO: These are very rudimentary tests which should be expanded.
  */
 
-static int tuner_ctl_give_status(struct node *node, unsigned me, unsigned la, bool interactive)
+static int tuner_ctl_analog_give_status(struct node *node, unsigned me, unsigned la, bool interactive)
 {
 	struct cec_msg msg = {};
+	struct cec_op_tuner_device_info info = {};
+
+	cec_msg_init(&msg, me, la);
+	cec_msg_select_analogue_service(&msg, CEC_OP_ANA_BCAST_TYPE_CABLE,
+			                7668, CEC_OP_BCAST_SYSTEM_PAL_BG); // 479.25 MHz analog frequency
+	fail_on_test(!transmit_timeout(node, &msg));
+	if (unrecognized_op(&msg))
+		return NOTSUPPORTED;
+	if (refused(&msg))
+		return REFUSED;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
@@ -737,6 +747,14 @@ static int tuner_ctl_give_status(struct node *node, unsigned me, unsigned la, bo
 	if (cec_msg_status_is_abort(&msg))
 		return PRESUMED_OK;
 
+	cec_ops_tuner_device_status(&msg, &info);
+	if (info.analog.ana_bcast_type != CEC_OP_ANA_BCAST_TYPE_CABLE)
+		return FAIL;
+	if (info.analog.ana_freq != 7668)
+		return FAIL;
+	if (info.analog.bcast_system != CEC_OP_BCAST_SYSTEM_PAL_BG)
+		return FAIL;
+
 	return 0;
 }
 
@@ -745,23 +763,24 @@ static int tuner_ctl_sel_analog_service(struct node *node, unsigned me, unsigned
 	struct cec_msg msg = {};
 
 	node->remote[la].bcast_sys = ~0;
-	for (unsigned sys = 0; sys <= 8; sys++) {
-		cec_msg_init(&msg, me, la);
-		cec_msg_select_analogue_service(&msg, CEC_OP_ANA_BCAST_TYPE_CABLE,
-						7668, sys); // 479.25 MHz analog frequency
-		fail_on_test(!transmit_timeout(node, &msg));
-		if (unrecognized_op(&msg))
-			return NOTSUPPORTED;
-		if (abort_reason(&msg) == CEC_OP_ABORT_INVALID_OP) {
-			info("Tuner supports %s, but cannot select that service.\n",
-			     bcast_system2s(sys));
+	for (unsigned type = 0; type < 3; type++) {
+		for (unsigned sys = 0; sys < 9; sys++) {
+			cec_msg_init(&msg, me, la);
+			cec_msg_select_analogue_service(&msg, type, 7668, sys); // 479.25 MHz analog frequency
+			fail_on_test(!transmit_timeout(node, &msg));
+			if (unrecognized_op(&msg))
+				return NOTSUPPORTED;
+			if (abort_reason(&msg) == CEC_OP_ABORT_INVALID_OP) {
+				info("Tuner supports %s, but cannot select that service.\n",
+				bcast_system2s(sys));
+				node->remote[la].bcast_sys = sys;
+				continue;
+			}
+			if (cec_msg_status_is_abort(&msg))
+				continue;
+			info("Tuner supports %s\n", bcast_system2s(sys));
 			node->remote[la].bcast_sys = sys;
-			continue;
 		}
-		if (cec_msg_status_is_abort(&msg))
-			continue;
-		info("Tuner supports %s\n", bcast_system2s(sys));
-		node->remote[la].bcast_sys = sys;
 	}
 
 	if (node->remote[la].bcast_sys == (__u8)~0)
@@ -854,43 +873,123 @@ static int tuner_ctl_tuner_dev_status(struct node *node, unsigned me, unsigned l
 	return 0;
 }
 
-static int tuner_ctl_step_dec(struct node *node, unsigned me, unsigned la, bool interactive)
+static int tuner_ctl_analog_step_dec(struct node *node, unsigned me, unsigned la, bool interactive)
 {
 	struct cec_msg msg = {};
+	struct cec_op_tuner_device_info info = {};
+	__u16 freq = 0;
+
+	info.is_analog = true;
+	for (unsigned type = 0; type < 3; type++) {
+		for (unsigned sys = 0; sys < 9; sys++) {
+			cec_msg_init(&msg, me, la);
+			cec_msg_select_analogue_service(&msg, type, 16000, sys); // 1000 MHz analog frequency
+			fail_on_test(!transmit_timeout(node, &msg));
+			if (unrecognized_op(&msg))
+				return NOTSUPPORTED;
+			if (refused(&msg))
+				return REFUSED;
+
+			cec_msg_init(&msg, me, la);
+			cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
+			fail_on_test(!transmit_timeout(node, &msg));
+			fail_on_test(timed_out(&msg));
+			if (unrecognized_op(&msg))
+				return NOTSUPPORTED;
+			if (refused(&msg))
+				return REFUSED;
+			cec_ops_tuner_device_status(&msg, &info);
+			freq = info.analog.ana_freq;
+
+			cec_msg_init(&msg, me, la);
+			cec_msg_tuner_step_decrement(&msg);
+			fail_on_test(!transmit_timeout(node, &msg));
+			if (unrecognized_op(&msg))
+				return NOTSUPPORTED;
+			if (refused(&msg))
+				return REFUSED;
+			if (cec_msg_status_is_abort(&msg))
+				return PRESUMED_OK;
+
+			cec_msg_init(&msg, me, la);
+			cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
+			fail_on_test(!transmit_timeout(node, &msg));
+			fail_on_test(timed_out(&msg));
+			if (unrecognized_op(&msg))
+				return NOTSUPPORTED;
+			if (refused(&msg))
+				return REFUSED;
+			cec_ops_tuner_device_status(&msg, &info);
+			if (!(info.analog.ana_freq < freq))
+				return FAIL;
+		}
+	}
 
-	cec_msg_init(&msg, me, la);
-	cec_msg_tuner_step_decrement(&msg);
-	fail_on_test(!transmit_timeout(node, &msg));
-	if (unrecognized_op(&msg))
-		return NOTSUPPORTED;
-	if (refused(&msg))
-		return REFUSED;
-
-	return PRESUMED_OK;
+	return 0;
 }
 
-static int tuner_ctl_step_inc(struct node *node, unsigned me, unsigned la, bool interactive)
+static int tuner_ctl_analog_step_inc(struct node *node, unsigned me, unsigned la, bool interactive)
 {
 	struct cec_msg msg = {};
+	struct cec_op_tuner_device_info info = {};
+	__u16 freq = 0;
+
+	info.is_analog = true;
+	for (unsigned type = 0; type < 3; type++) {
+		for (unsigned sys = 0; sys < 9; sys++) {
+			cec_msg_init(&msg, me, la);
+			cec_msg_select_analogue_service(&msg, type, 0, sys); // 0 MHz analog frequency
+			fail_on_test(!transmit_timeout(node, &msg));
+			if (unrecognized_op(&msg))
+				return NOTSUPPORTED;
+			if (refused(&msg))
+				return REFUSED;
+
+			cec_msg_init(&msg, me, la);
+			cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
+			fail_on_test(!transmit_timeout(node, &msg));
+			fail_on_test(timed_out(&msg));
+			if (unrecognized_op(&msg))
+				return NOTSUPPORTED;
+			if (refused(&msg))
+				return REFUSED;
+			cec_ops_tuner_device_status(&msg, &info);
+			freq = info.analog.ana_freq;
+
+			cec_msg_init(&msg, me, la);
+			cec_msg_tuner_step_increment(&msg);
+			fail_on_test(!transmit_timeout(node, &msg));
+			if (unrecognized_op(&msg))
+				return NOTSUPPORTED;
+			if (refused(&msg))
+				return REFUSED;
+			if (cec_msg_status_is_abort(&msg))
+				return PRESUMED_OK;
+
+			cec_msg_init(&msg, me, la);
+			cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
+			fail_on_test(!transmit_timeout(node, &msg));
+			fail_on_test(timed_out(&msg));
+			if (unrecognized_op(&msg))
+				return NOTSUPPORTED;
+			if (refused(&msg))
+				return REFUSED;
+			cec_ops_tuner_device_status(&msg, &info);
+			if (!(info.analog.ana_freq > freq))
+				return FAIL;
+		}
+	}
 
-	cec_msg_init(&msg, me, la);
-	cec_msg_tuner_step_increment(&msg);
-	fail_on_test(!transmit_timeout(node, &msg));
-	if (unrecognized_op(&msg))
-		return NOTSUPPORTED;
-	if (refused(&msg))
-		return REFUSED;
-
-	return PRESUMED_OK;
+	return 0;
 }
 
 static struct remote_subtest tuner_ctl_subtests[] = {
-	{ "Give Tuner Device Status", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_give_status },
-	{ "Select Analogue Service", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_sel_analog_service },
-	{ "Select Digital Service", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_sel_digital_service },
+	{ "Give Tuner Device Status", CEC_LOG_ADDR_MASK_TUNER | CEC_LOG_ADDR_MASK_TV, tuner_ctl_analog_give_status },
+	{ "Select Analogue Service", CEC_LOG_ADDR_MASK_TUNER | CEC_LOG_ADDR_MASK_TV, tuner_ctl_sel_analog_service },
+	{ "Select Digital Service", CEC_LOG_ADDR_MASK_TUNER | CEC_LOG_ADDR_MASK_TV, tuner_ctl_sel_digital_service },
 	{ "Tuner Device Status", CEC_LOG_ADDR_MASK_ALL, tuner_ctl_tuner_dev_status },
-	{ "Tuner Step Decrement", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_step_dec },
-	{ "Tuner Step Increment", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_step_inc },
+	{ "Tuner Analog Step Decrement", CEC_LOG_ADDR_MASK_TUNER | CEC_LOG_ADDR_MASK_TV, tuner_ctl_analog_step_dec },
+	{ "Tuner Analog Step Increment", CEC_LOG_ADDR_MASK_TUNER | CEC_LOG_ADDR_MASK_TV, tuner_ctl_analog_step_inc },
 };
 
 
-- 
2.23.0

