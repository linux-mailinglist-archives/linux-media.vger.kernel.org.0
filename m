Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 340973AB492
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 15:22:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231560AbhFQNYM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 09:24:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230291AbhFQNYM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 09:24:12 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1498EC061574
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 06:22:04 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id q25so4988309pfh.7
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 06:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WSt5QdtnILdVT8QXJNquyip6D9ksPT+Ac5ft4M9K6W8=;
        b=Ltgolmngu4wclLOC+4VNwpUmLUW0rQE3c5SgfIAP/GJONzP2qrQtZT52koui9sexBS
         yrswNb5aZb2NV1qd9dkQXinZkBhMoBltGIBan146oWqlfH3/bP80lM1pVWzBs9wWe13n
         1v4hYb4Nl+Hc1rG3Hm1ImOJB6wddTI9r7KtNki3vdBiDcQSiLf/mk79zB0zOALv2Dm67
         Nil9GSCzcWhaunftZj5iU+/P1jR0/QXPduPycZ0AGCJNMQiBMryCm2MNgtW9vjmHViPX
         OoPAPbn/QQKUz2Ovt62WW1VIw6uUkYQgTMqrH9YWS4vmn8Flgv2zKHtubMO+Z6aa2Fun
         2cGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WSt5QdtnILdVT8QXJNquyip6D9ksPT+Ac5ft4M9K6W8=;
        b=UwOPmcdWOrXVSuLH0dRrqf2vMkTavfkXTtXunauc8qmS8Q6vJvz7FvRTGQdGWhsJih
         ogMDzPOnT6ps2e1btOSYS/uN4E+b7fGlj5lIQSLN8na5H395WG/T8UrULzizP+yFEmZS
         3BjWBA//8jrl/J5cKNNzAVDtWkvbdxxLEXiXpR9y8vhpt/vcaZ1KQx9s+gg6+hxhTSkb
         ATEQkrUY9xxvrNuf9raBuEsoyOGhMJGdnvcOBbFcS/67dUWazN92C1NTor76RI29R38q
         E9BXPPi1ZZxtNWd/u+maGEApOVL8inN3SRlpOamkWPk5HlodO5n9jToBvmZSecXqe2L7
         P0Zw==
X-Gm-Message-State: AOAM532H570PN7OixWiQO53TmQwuMxK2HIvrKzDnkSvTpJoCQmHC/Q5k
        Y+aWicy6iY/jomPNYwVTET6n0xi2uRkuRw==
X-Google-Smtp-Source: ABdhPJzpxMtefgM6Cmophv2P+U7Cryr7JR4JuLvrVXZjbL/4DsrTVt4ukfKdsNnnto9+mGYx4eAr1A==
X-Received: by 2002:a63:f4b:: with SMTP id 11mr5042521pgp.250.1623936123516;
        Thu, 17 Jun 2021 06:22:03 -0700 (PDT)
Received: from ada-comp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id i125sm5310962pfc.7.2021.06.17.06.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 06:22:03 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, jaffe1@gmail.com,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH] cec: expand One Touch Record TV Screen test
Date:   Thu, 17 Jun 2021 06:21:52 -0700
Message-Id: <20210617132152.5247-1-deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Check that the follower ignores the Record TV Screen message if the
initiator has a logical address other than Record or Backup (aka Reserved
in CEC Version < 2.0). If the follower replies correctly, check that the
source operand is valid.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
 utils/cec-compliance/cec-test.cpp | 48 +++++++++++++++++++++++++------
 utils/cec-follower/cec-tuner.cpp  |  8 ++++--
 2 files changed, 45 insertions(+), 11 deletions(-)

diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index 40d8369d..9512f319 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -1150,13 +1150,6 @@ static const vec_remote_subtests tuner_ctl_subtests{
 
 static int one_touch_rec_tv_screen(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	/*
-	  TODO:
-	  - Page 36 in HDMI CEC 1.4b spec lists additional behaviors that should be
-	    checked for.
-	  - The TV should ignore this message when received from other LA than Recording or
-	    Reserved.
-	 */
 	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
@@ -1172,8 +1165,47 @@ static int one_touch_rec_tv_screen(struct node *node, unsigned me, unsigned la,
 		return OK_REFUSED;
 	if (cec_msg_status_is_abort(&msg))
 		return OK_PRESUMED;
+	/*
+	 * Follower should ignore this message if initiator has a logical
+	 * address other than Record or Backup (aka "Reserved" in CEC Version < 2.0).
+	 */
+	if (!cec_has_record(1 << me) && !cec_has_backup(1 << me)) {
+		fail_on_test(!timed_out(&msg));
+		return OK;
+	}
+	fail_on_test(timed_out(&msg));
 
-	return 0;
+	struct cec_op_record_src rec_src = {};
+
+	cec_ops_record_on(&msg, &rec_src);
+
+	if (rec_src.type < 1 || rec_src.type > 5)
+		fail("Invalid source.\n");
+
+	if (rec_src.type == CEC_OP_RECORD_SRC_DIGITAL &&
+	    rec_src.digital.service_id_method == CEC_OP_SERVICE_ID_METHOD_BY_DIG_ID) {
+
+		switch(rec_src.digital.dig_bcast_system) {
+		case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_GEN:
+		case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_GEN:
+		case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_GEN:
+		case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_BS:
+		case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_CS:
+		case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_T:
+		case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_CABLE:
+		case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_SAT:
+		case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_T:
+		case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_C:
+		case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_S:
+		case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_S2:
+		case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_T:
+			break;
+		default:
+			fail("Invalid digital service broadcast system operand.\n");
+		}
+	}
+
+	return OK;
 }
 
 static int one_touch_rec_on(struct node *node, unsigned me, unsigned la, bool interactive)
diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index b9c21684..edf5016b 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -583,9 +583,6 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
 		  This is only a basic implementation.
 
 		  TODO:
-		  - If we are a TV, we should only send Record On if the
-		    remote end is a Recording device or Reserved. Otherwise ignore.
-
 		  - Device state should reflect whether we are recording, etc. In
 		    recording mode we should ignore Standby messages.
 		*/
@@ -594,6 +591,11 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
 		if (!node->has_rec_tv)
 			break;
 
+		__u8 la = cec_msg_initiator(&msg);
+
+		if (!cec_has_record(1 << la) && !cec_has_backup(1 << la))
+			return;
+
 		struct cec_op_record_src rec_src = {};
 
 		rec_src.type = CEC_OP_RECORD_SRC_OWN;
-- 
2.25.1

