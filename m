Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8ED9C96E5
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 05:18:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728475AbfJCDSX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 23:18:23 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33207 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728457AbfJCDSW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 23:18:22 -0400
Received: by mail-ot1-f67.google.com with SMTP id 60so1063899otu.0
        for <linux-media@vger.kernel.org>; Wed, 02 Oct 2019 20:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5LvoRADZ/0D1IGyLroSfJDM7H3JPCnfBaxifl7Fh9kI=;
        b=OeG3B4iBBcSfnoECaxIwMji+x5CzElUxJwdK2tnyd2IFO6oZddXGVy/aOQb+nr5/RP
         1pq1Oq8z8kagMN2Hi3HEG+SXVtqQBRYs6S8xA630aDaHLGSbzEUOdTT0dWpjIn9kZhCz
         54M/eBdzwUcl9hkByLBdcnXoKjKm6dLWdebKe+6rsaAHipeoqhvbS3uuuoWhy2mOd0gX
         MH2GLDiRJPN/GxwRbtrqqreGJfg7xqX0fZvcJFZj1MdAqBdoNG/YcyOLJvOhGzDsD8n7
         giHCgJfYBsuNQOjN3CR/VW23895IH38loy7ymBt71tJitZJvbRAd3dK3PrT307FLf7LZ
         GvSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5LvoRADZ/0D1IGyLroSfJDM7H3JPCnfBaxifl7Fh9kI=;
        b=itcjzHwi171SxDNg4sZPknedSJxBgJJIhFc8hrLvejMsaVkUE/d+pJd15ZLXKTjkLe
         5x3ugLuQRV566k6M011NU9NSrTt1LOrP5vwyxo5pDv91gO3AjvWCug62aaUO4fPNZMAE
         m+oxtypozd2Aih2Rlt5jHfAFlM9G9CHUub4MIkPbCdnEHi3edhG/lvScaQKV7vgwByzx
         zNQ4AnotZeo1UZpqT6kb2ekduUC/VtfmWA2JTWVWxUPQtX/01qRx0aIy9M2IC7C8ckYm
         Lf+nh+SlaxX8mn/fXT0carfpCubxoGA+y+vuIgeWeSeFP3TgzJ3lwL3iQZzuL/x0nN2h
         ykhg==
X-Gm-Message-State: APjAAAWe+RhsFwWGprVO99FkAIZPxWoP9rJxQqtr4TvuESynF0EvDcjm
        SAR5i1PdtIeDF4KxhJG4liBwRMU/
X-Google-Smtp-Source: APXvYqyENOGf0mAErR/GBiY8x+spedWY3GSWim7Xc/q9t2G5Iz4c20knc8pMhO3SJaE8GHMVuB0bFA==
X-Received: by 2002:a9d:876:: with SMTP id 109mr5203826oty.318.1570072700189;
        Wed, 02 Oct 2019 20:18:20 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::40])
        by smtp.googlemail.com with ESMTPSA id w20sm431301otk.73.2019.10.02.20.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 20:18:19 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH v5 2/2] Add test for new features in cec-follower
Date:   Wed,  2 Oct 2019 22:18:16 -0500
Message-Id: <20191003031816.168985-3-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191001031823.312020-1-c0d1n61at3@gmail.com>
References: <20191001031823.312020-1-c0d1n61at3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Analog tuner control test tuner_ctl_test():
  - give analog tuner status
  - select tuner analog service
  - analog tuner step features

Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
---
 utils/cec-compliance/cec-test.cpp | 74 +++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index 017d1ef8..669df4b7 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -16,6 +16,7 @@
 #include <sys/ioctl.h>
 #include <config.h>
 #include <sstream>
+#include <vector>
 
 #include "cec-compliance.h"
 
@@ -722,6 +723,78 @@ static struct remote_subtest deck_ctl_subtests[] = {
   TODO: These are very rudimentary tests which should be expanded.
  */
 
+static int tuner_ctl_test(struct node *node, unsigned me, unsigned la, bool interactive)
+{
+	struct cec_msg msg = {};
+	struct cec_op_tuner_device_info info = {};
+	__u16 start_freq;
+	std::vector<struct cec_op_tuner_device_info> info_vec;
+
+	cec_msg_init(&msg, me, la);
+	cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
+	fail_on_test(!transmit_timeout(node, &msg));
+	if (timed_out(&msg) || unrecognized_op(&msg))
+		return NOTSUPPORTED;
+	if (refused(&msg))
+		return REFUSED;
+	cec_ops_tuner_device_status(&msg, &info);
+	start_freq = info.analog.ana_freq;
+	info_vec.push_back(info);
+
+	while (1) {
+		cec_msg_init(&msg, me, la);
+		cec_msg_tuner_step_increment(&msg);
+		fail_on_test(!transmit_timeout(node, &msg));
+		fail_on_test(cec_msg_status_is_abort(&msg));
+		if (cec_msg_status_is_abort(&msg)) {
+			fail_on_test(abort_reason(&msg) == CEC_OP_ABORT_UNRECOGNIZED_OP);
+			if (abort_reason(&msg) == CEC_OP_ABORT_REFUSED) {
+				warn("Tuner step increment does not wrap.\n");
+				break;
+			} else {
+				warn("Tuner at end of service list did not receive feature abort refused.\n");
+				break;
+			}
+		}
+		cec_msg_init(&msg, me, la);
+		cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
+		fail_on_test(!transmit_timeout(node, &msg));
+		fail_on_test(timed_out_or_abort(&msg));
+		cec_ops_tuner_device_status(&msg, &info);
+		if (info.analog.ana_freq == start_freq)
+			break;
+		info_vec.push_back(info);
+	}
+
+	for (std::vector<struct cec_op_tuner_device_info>::iterator iter = info_vec.begin();
+			iter != info_vec.end(); iter++) {
+		cec_msg_init(&msg, me, la);
+		cec_msg_select_analogue_service(&msg, iter->analog.ana_bcast_type,
+			iter->analog.ana_freq, iter->analog.bcast_system);
+		fail_on_test(!transmit_timeout(node, &msg));
+		fail_on_test(cec_msg_status_is_abort(&msg));
+		cec_msg_init(&msg, me, la);
+		cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
+		fail_on_test(!transmit_timeout(node, &msg));
+		fail_on_test(timed_out_or_abort(&msg));
+		cec_ops_tuner_device_status(&msg, &info);
+		fail_on_test(info.analog.ana_freq != iter->analog.ana_freq);
+		if (iter->is_analog) {
+			double freq_mhz = (iter->analog.ana_freq * 625) / 10000.0;
+			info("Analog channel freq: %.2f MHz\n", freq_mhz);
+		}
+	}
+
+	cec_msg_init(&msg, me, la);
+	cec_msg_select_analogue_service(&msg, 3, 16000, 9);
+	fail_on_test(!transmit_timeout(node, &msg));
+	fail_on_test(!cec_msg_status_is_abort(&msg));
+	fail_on_test(unrecognized_op(&msg));
+	fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
+
+	return 0;
+}
+
 static int tuner_ctl_give_status(struct node *node, unsigned me, unsigned la, bool interactive)
 {
 	struct cec_msg msg = {};
@@ -885,6 +958,7 @@ static int tuner_ctl_step_inc(struct node *node, unsigned me, unsigned la, bool
 }
 
 static struct remote_subtest tuner_ctl_subtests[] = {
+	{ "Tuner Control", CEC_LOG_ADDR_MASK_TUNER | CEC_LOG_ADDR_MASK_TV, tuner_ctl_test },
 	{ "Give Tuner Device Status", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_give_status },
 	{ "Select Analogue Service", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_sel_analog_service },
 	{ "Select Digital Service", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_sel_digital_service },
-- 
2.23.0

