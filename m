Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83D5CCB3A4
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2019 06:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727878AbfJDEFL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Oct 2019 00:05:11 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:33108 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726927AbfJDEFL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Oct 2019 00:05:11 -0400
Received: by mail-oi1-f193.google.com with SMTP id e18so4667322oii.0
        for <linux-media@vger.kernel.org>; Thu, 03 Oct 2019 21:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k6ipv+vszB+i3gGjydQm7Dj3Hl/GLIB/gJYteJFb9Sc=;
        b=GqRcgerqO6z7eG1AVUY0ftVERdjukryd5axR3PSNN8OzypQOYUY/xnWZ6xUio5vtuY
         oaASltULMz6e8X9wZY4M7H5uAN0MV8cdIJyKyYaO334u+IXOJCgr6+nmfUV9CW9j9+cH
         j7LCAhCBDafCmbdNlInz9PiJe35TArky2xbfwhkkGckgMjdIo8vvwJS3glGVbtKuslB9
         JMQi+dqicjt/pmhwgbZMkdTOohZVItUmCLpM4uVBGyTPeQpdAq7P1UB5FFGkccmLUuhK
         TWOB8VioRYwy3MURtrHc3tPr+/eU8K3RJb/SFszRVRVM9C9Q7tNtMWhHEBTRo5vabu6F
         RDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k6ipv+vszB+i3gGjydQm7Dj3Hl/GLIB/gJYteJFb9Sc=;
        b=QEs9PABcxdIlE7doA1GmIdAY7ZWIa09ndYov3VwrV6Z3mn0LtQhg8DB07D+ag14IRt
         eKm2kImDRpbd420pt4b4DAhHJ4VL9R3WoF7k6bpMjDqOGpqpR2ik0npCY2GJufwIPdjy
         F+Aaq02/NvbQR2PhQioC89nErGlmedSrBpJcsfGYQqy3Y/qUoDzWXmBCZMzsNc9Tmxre
         rZoxp2fVIs96G0FldoUwdpSP62YK7B5KfvVAkeJRAHnUOwYEj4BG7KZBTdR9vte5rC+n
         Fav5GgLozyLt8Dc5L9BnniGkcRr4Gu4QrRzfAoRqmtJWZx/ew5okMmokaOYHQUNPfekP
         B5AQ==
X-Gm-Message-State: APjAAAUzI6tMF8/qNyvlPtjJimo6tBZ71pTOFH2FF1HEUXoNcovaDFt8
        KoHmXL24webfRJg89JBdIqpMb5m3
X-Google-Smtp-Source: APXvYqyjYoOwCd60piYZnS2jNho1niDkaduSwBgymlAW+yRMh8aZapHBTB4hvrWVHYERePSefJD8Mg==
X-Received: by 2002:aca:ea04:: with SMTP id i4mr5548952oih.98.1570161908291;
        Thu, 03 Oct 2019 21:05:08 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::40])
        by smtp.googlemail.com with ESMTPSA id z14sm1386166oic.13.2019.10.03.21.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 21:05:07 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH v6 1/1] Add test for new features in cec-follower
Date:   Thu,  3 Oct 2019 23:05:06 -0500
Message-Id: <20191004040506.31488-2-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191003031816.168985-1-c0d1n61at3@gmail.com>
References: <20191003031816.168985-1-c0d1n61at3@gmail.com>
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
 utils/cec-compliance/cec-test.cpp | 75 +++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index ec07d886..1fd0ea92 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -16,6 +16,7 @@
 #include <sys/ioctl.h>
 #include <config.h>
 #include <sstream>
+#include <vector>
 
 #include "cec-compliance.h"
 
@@ -722,6 +723,79 @@ static struct remote_subtest deck_ctl_subtests[] = {
   TODO: These are very rudimentary tests which should be expanded.
  */
 
+static int tuner_ctl_test(struct node *node, unsigned me, unsigned la, bool interactive)
+{
+	struct cec_msg msg = {};
+	struct cec_op_tuner_device_info info = {};
+	std::vector<struct cec_op_tuner_device_info> info_vec;
+
+	cec_msg_init(&msg, me, la);
+	cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
+	fail_on_test(!transmit_timeout(node, &msg));
+	fail_on_test(cec_msg_status_is_abort(&msg));
+	if (timed_out(&msg) || unrecognized_op(&msg))
+		return NOTSUPPORTED;
+	if (refused(&msg))
+		return REFUSED;
+	cec_ops_tuner_device_status(&msg, &info);
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
+		info = {};
+		cec_ops_tuner_device_status(&msg, &info);
+		if (!memcmp(&info, &info_vec[0], sizeof(info)))
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
+		info = {};
+		cec_ops_tuner_device_status(&msg, &info);
+		fail_on_test(memcmp(&info, &(*iter), sizeof(info)));
+		if (iter->is_analog) {
+			double freq_mhz = (iter->analog.ana_freq * 625) / 10000.0;
+
+			info("Analog channel freq: %.2f MHz\n", freq_mhz);
+		}
+	}
+
+	cec_msg_init(&msg, me, la);
+	cec_msg_select_analogue_service(&msg, 3, 16000, 9);
+	fail_on_test(!transmit_timeout(node, &msg));
+	fail_on_test(!cec_msg_status_is_abort(&msg));
+	fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
+
+	return 0;
+}
+
 static int tuner_ctl_give_status(struct node *node, unsigned me, unsigned la, bool interactive)
 {
 	struct cec_msg msg = {};
@@ -885,6 +959,7 @@ static int tuner_ctl_step_inc(struct node *node, unsigned me, unsigned la, bool
 }
 
 static struct remote_subtest tuner_ctl_subtests[] = {
+	{ "Tuner Control", CEC_LOG_ADDR_MASK_TUNER | CEC_LOG_ADDR_MASK_TV, tuner_ctl_test },
 	{ "Give Tuner Device Status", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_give_status },
 	{ "Select Analogue Service", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_sel_analog_service },
 	{ "Select Digital Service", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_sel_digital_service },
-- 
2.23.0

