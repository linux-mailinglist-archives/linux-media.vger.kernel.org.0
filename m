Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE3B7C2C49
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 05:18:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732515AbfJADS2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 23:18:28 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:39071 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731164AbfJADS2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 23:18:28 -0400
Received: by mail-io1-f66.google.com with SMTP id a1so44107606ioc.6
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2019 20:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t7E+4Xrsw0Aoybon1FHcfixdSiyeFKAL53bGRD1eWpM=;
        b=tfMz/UCwstaSgaRPkxyQH3rBNLACZib8148Nlxd4wjkJvgJlEYGFjCt7g1A6nKQVyG
         LFISIfE4BnI0TPbShgnl7hmvjwb3mmhfdkRkVfulA2ROZFtclU9K2yeYFQHS4WkmQUgV
         MuGgKPgumSFe2Ulr7iyhs2cWiAHtLVfhYkaizJSZo3K9m5V6hqDWGUIJ01DSPN8xzkz3
         OMn9T1m31W8CCUFtTLYspIdH/C3IPuNJalfKfzhf32cWNtFObulUpcFW4iithqt+oRqe
         ODlFD2s8aATH/1t+pTW/3GpWSm/iLkjAOywxNJWEJv1GK5Vpqatoh+4sD2k2AN9VHErT
         VkuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t7E+4Xrsw0Aoybon1FHcfixdSiyeFKAL53bGRD1eWpM=;
        b=fIE+cIRqlvhB5oJ56dBA+f87IK7ACogOIHvMGd8Mka6u61xNkeSex7u1m2DOWLiPXG
         KnZ9WuVCDbAsCfq8DsEq+pEE7fNen/HqMDK5MM79LFoeXsUhvGymJyVIvtRbF6KmKyj+
         Hx2pqreY9qwYsqlbMCehqBvFrOxzj87/YgcdPx2d9La2CmcE1JyhiIouzraLjTYbsuug
         klzswmSLGO+Iw8uZ+yFuq9+7oZRVIFZji2wtFFtMGc3tV6xahmt3sm9AyjtKpiQMKGNx
         +yVh6UEKA/4XoAzGJbldXoVsj0NJsGzHehF6wBAMVYYGmrZmJbjOg2XoDxlyRAOJIyYJ
         5UNg==
X-Gm-Message-State: APjAAAW+n9gpMV3CCm76DG2EKSNTEaVl3aROE+c5Kit3fXHWLkbAECwf
        yB7N4XYwvDa/jWmObOfDQTgXSitm
X-Google-Smtp-Source: APXvYqyk1l3UQvIzzzjulReYqISKm13I/eDJ9KuRnILAbYYTLWulZMZByCIwrOIayR3ZrhkrAgdVWA==
X-Received: by 2002:a6b:e50b:: with SMTP id y11mr18271948ioc.161.1569899907253;
        Mon, 30 Sep 2019 20:18:27 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::40])
        by smtp.googlemail.com with ESMTPSA id l82sm8719452ilh.23.2019.09.30.20.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 20:18:26 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH v4 3/3] cec-compliance: add tuner control test
Date:   Mon, 30 Sep 2019 22:18:23 -0500
Message-Id: <20191001031823.312020-4-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930043017.474025-1-c0d1n61at3@gmail.com>
References: <20190930043017.474025-1-c0d1n61at3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add test for new features added to cec-follower.

Analog tuner control test tuner_ctl_test():
  - give analog tuner status
  - select tuner analog service
  - analog tuner step features

Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
---
 utils/cec-compliance/cec-test.cpp | 91 +++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index aece546c..17f72cc6 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -16,6 +16,7 @@
 #include <sys/ioctl.h>
 #include <config.h>
 #include <sstream>
+#include <vector>
 
 #include "cec-compliance.h"
 
@@ -722,6 +723,95 @@ static struct remote_subtest deck_ctl_subtests[] = {
   TODO: These are very rudimentary tests which should be expanded.
  */
 
+static int tuner_ctl_test(struct node *node, unsigned me, unsigned la, bool interactive)
+{
+	struct cec_msg msg = {};
+	struct cec_op_tuner_device_info info = {};
+	std::vector<struct cec_op_tuner_device_info> info_vec;
+	__u16 start_freq;
+
+	cec_msg_init(&msg, me, la);
+	cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
+	fail_on_test(!transmit_timeout(node, &msg));
+	fail_on_test(timed_out(&msg));
+	if (unrecognized_op(&msg))
+		return NOTSUPPORTED;
+	if (refused(&msg))
+		return REFUSED;
+	cec_ops_tuner_device_status(&msg, &info);
+	start_freq = info.analog.ana_freq;
+	info_vec.push_back(info);
+
+	while (1) {
+		struct cec_op_tuner_device_info new_info;
+
+		cec_msg_init(&msg, me, la);
+		cec_msg_tuner_step_increment(&msg);
+		fail_on_test(!transmit_timeout(node, &msg));
+		if (unrecognized_op(&msg))
+			return NOTSUPPORTED;
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
+		cec_ops_tuner_device_status(&msg, &new_info);
+		if (new_info.analog.ana_freq == start_freq)
+			break;
+		if (new_info.analog.ana_freq == info_vec.back().analog.ana_freq) {
+			warn("Tuner channel step increment does not wrap.\n");
+			break;
+		}
+		info_vec.push_back(new_info);
+	}
+
+	
+	for (std::vector<struct cec_op_tuner_device_info>::iterator iter = info_vec.begin();
+			iter != info_vec.end(); iter++) {
+		struct cec_op_tuner_device_info current;
+
+		cec_msg_init(&msg, me, la);
+		cec_msg_select_analogue_service(&msg, iter->analog.ana_bcast_type,
+			iter->analog.ana_freq, iter->analog.bcast_system);
+		fail_on_test(!transmit_timeout(node, &msg));
+		if (unrecognized_op(&msg))
+			return NOTSUPPORTED;
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
+		fail_on_test(current.analog.ana_freq != iter->analog.ana_freq);
+		if (iter->is_analog) {
+			float freq_mhz = (iter->analog.ana_freq * 625) / 10000;
+			info("Analog channel freq: %.2f MHz\n", freq_mhz);
+		}
+	}
+
+	cec_msg_init(&msg, me, la);
+	cec_msg_select_analogue_service(&msg, 3, 16000, 9);
+	fail_on_test(!transmit_timeout(node, &msg));
+	if (unrecognized_op(&msg))
+		return NOTSUPPORTED;
+	if (refused(&msg))
+		return REFUSED;
+	fail_on_test(!cec_msg_status_is_abort(&msg));
+	fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
+
+	return 0;
+}
+
 static int tuner_ctl_give_status(struct node *node, unsigned me, unsigned la, bool interactive)
 {
 	struct cec_msg msg = {};
@@ -885,6 +975,7 @@ static int tuner_ctl_step_inc(struct node *node, unsigned me, unsigned la, bool
 }
 
 static struct remote_subtest tuner_ctl_subtests[] = {
+	{ "Tuner Control", CEC_LOG_ADDR_MASK_TUNER | CEC_LOG_ADDR_MASK_TV, tuner_ctl_test },
 	{ "Give Tuner Device Status", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_give_status },
 	{ "Select Analogue Service", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_sel_analog_service },
 	{ "Select Digital Service", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_sel_digital_service },
-- 
2.23.0

