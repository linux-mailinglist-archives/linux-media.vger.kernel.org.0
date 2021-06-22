Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AD4A3AFC06
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 06:36:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbhFVEia (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 00:38:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbhFVEi3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 00:38:29 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C374C061574
        for <linux-media@vger.kernel.org>; Mon, 21 Jun 2021 21:36:13 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id s17-20020a17090a8811b029016e89654f93so985169pjn.1
        for <linux-media@vger.kernel.org>; Mon, 21 Jun 2021 21:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BKhcZlAcDzl0uP7isStbp55SQt87z83Ae2ZL2A/UcBc=;
        b=ZshOZbAfpnMLrGDMt2vNwUX42NjHgUYajt3clryjRAb78mAQIS4S8Pa/iDsTtBtEbB
         EhTc4MY0ri2pOKp6Ke+Khtwl42b42l+AgRwBYH+0XTmFTX8YdROlkUwFlMPVYKc59vCi
         ZyUQB9dICPwcz1tXo9nv+CiAZuxsSrp7XAEGAp0Fzw1xQg59AAqknIziinyIYKZL5zFc
         L6BQLteuOTed8jFJLcEwrj9RBanrxGbrEU0uJwRG4eI8UsBbhohhTqVd7s/uXjh4L5a0
         ZKTRwEg72lt5u4nlfDWCFJweKMUdZ7p/xusv3oewEwh/5vfF4H/tVcjnENr1WUFF+CV1
         8fcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BKhcZlAcDzl0uP7isStbp55SQt87z83Ae2ZL2A/UcBc=;
        b=s0JbD/kYhInqP63vZ0XnF8elPfgc2qZk3Ypjub9Pufy//X/axm4LfhYX9gIi6ZPxnZ
         Dio6XP5BoqgsY2NRaDzP5d7tgwwNFFFXF0kpV+H7NfcXVibfWEVEFY7bhBKvwdpAjqe5
         8nIac7tSTfH4e/YsGqdScxYHVoqxmmihsuMNQvLVf4roCBAF2XvnGyLHLUJ7xXzD84Mw
         l2WYKcmVN2L4KQ6DsUGn2QYr+BxgYwmjMjNYFMvWtGzpYpAR8MB+Uh6/fp1LocL+2rD7
         uTn+tHdUPi1l52RdVbpz+SEeCjGcBRbEJin3sMmJA5LOaPHuW5k8zdueiV+sxWrAe90Z
         imZg==
X-Gm-Message-State: AOAM531qTWQ+v3Sgr8YMMJWmMZdl2akxeeV0uR46oGx3u++gN7Y7zqnz
        M3WVCa4x+NwOwGw2YCx4/wxr4k9lmGT7rQ==
X-Google-Smtp-Source: ABdhPJyt04YtTruBT8TncsGfSyEkySaAkC4bePHthgJ37OADG07txo16WksGIB3jPUFv4gKfQ3+E4A==
X-Received: by 2002:a17:90a:6286:: with SMTP id d6mr1898335pjj.87.1624336573138;
        Mon, 21 Jun 2021 21:36:13 -0700 (PDT)
Received: from ada-comp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id g4sm2152562pfu.134.2021.06.21.21.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 21:36:12 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, jaffe1@gmail.com,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v3 1/3] cec: expand One Touch Record TV Screen test
Date:   Mon, 21 Jun 2021 21:35:59 -0700
Message-Id: <3f74cbad2c7ee68e7e07526428afa691a9d9a9e6.1624336366.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1624336366.git.deborahbrouwer3563@gmail.com>
References: <cover.1624336366.git.deborahbrouwer3563@gmail.com>
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
 utils/cec-compliance/cec-test.cpp | 54 ++++++++++++++++++++++++++-----
 utils/cec-follower/cec-tuner.cpp  |  9 ++++--
 2 files changed, 52 insertions(+), 11 deletions(-)

diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index 40d8369d..2ea1b712 100644
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
@@ -1172,8 +1165,53 @@ static int one_touch_rec_tv_screen(struct node *node, unsigned me, unsigned la,
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
+	if (rec_src.type < CEC_OP_RECORD_SRC_OWN || rec_src.type > CEC_OP_RECORD_SRC_EXT_PHYS_ADDR)
+		return fail("Invalid source.\n");
+
+	if (rec_src.type == CEC_OP_RECORD_SRC_DIGITAL &&
+	    rec_src.digital.service_id_method == CEC_OP_SERVICE_ID_METHOD_BY_DIG_ID) {
+
+		switch (rec_src.digital.dig_bcast_system) {
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
+			return fail("Invalid digital service broadcast system operand.\n");
+		}
+	}
+
+	if (rec_src.type == CEC_OP_RECORD_SRC_ANALOG) {
+		fail_on_test(rec_src.analog.ana_bcast_type > CEC_OP_ANA_BCAST_TYPE_TERRESTRIAL);
+		fail_on_test(rec_src.analog.bcast_system > CEC_OP_BCAST_SYSTEM_PAL_DK &&
+		             rec_src.analog.bcast_system != CEC_OP_BCAST_SYSTEM_OTHER);
+	}
+
+	return OK;
 }
 
 static int one_touch_rec_on(struct node *node, unsigned me, unsigned la, bool interactive)
diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index b9c21684..fd11bd10 100644
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
@@ -594,6 +591,12 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
 		if (!node->has_rec_tv)
 			break;
 
+		__u8 la = cec_msg_initiator(&msg);
+
+		/* Ignore if initiator is not Record or Backup (aka "Reserved" in CEC Version < 2.0) */
+		if (!cec_has_record(1 << la) && !cec_has_backup(1 << la))
+			return;
+
 		struct cec_op_record_src rec_src = {};
 
 		rec_src.type = CEC_OP_RECORD_SRC_OWN;
-- 
2.25.1

