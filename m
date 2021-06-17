Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29DE93ABFA2
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 01:41:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232349AbhFQXnh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 19:43:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230447AbhFQXnh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 19:43:37 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D216EC061574
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 16:41:27 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id u18so896962pfk.11
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 16:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=77ABy1TzsOXnqLIiVvGSJIovexBaJwxDxUj3K2nBtrY=;
        b=SthCgKEdiSTaZQ2BplRLZe1NPMszJURVoWwEEPkF7MR/u1PROwknNpfdQOjx/a3kLb
         xtmKM/mrcXgAQxsLYNLFyHCCYMzfsE0YW6LRKM2BeVxTcnZodqyCTjuLKgWkOg/9/0ji
         g4cvsNxjuThd5RZjUSK60W8vQ5QNlTfoPmKb8K6nmn5/SMAGezypc/aVoog60ug+ZT3I
         eGlvtdKeHuaZQPKdQFCvBH4q4rBuJJf07kLTZtN1eAwX9TBk8JH9l7auZzaHrHm3dz9d
         paObHlJOe4OlshdGK/v3NFOt+YxJQxVMY6edD0inJoZsRRmAahq2qJoJEAbE2IaoPxsD
         WU1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=77ABy1TzsOXnqLIiVvGSJIovexBaJwxDxUj3K2nBtrY=;
        b=HUmgR8wC6lQRTlBw9zAORHtYJhli/QO7nTtqJgSh47hSC6/5zAHzfoiWE04719wU//
         8Xxux/FATGoOCSmcz+wPuZ+osJihctSKxWOnljVM5jRThCz2ee3wcNBwAgCCUyeApWNs
         EGbshZ7jC/2PpI3RTKVpWJdSNWq5vFXsashtKYSn+DIfBYEpc3/VJYA6+NMUKni3ov/3
         791rQRaGX5XKOU25D8aLvUMcjlYzykBuFTHllY/iGcU8QHEeiq5SY4CtJJK8JXL0lVLB
         novWQU1QYhh2SryXrnz9KaGjkVa/uyKN8HcBAakWdQdIrdqn1WMZGQDElqLclMm/KaPy
         F0zQ==
X-Gm-Message-State: AOAM532+dy4voROBVN2fQaY9nP3jQYSMmxsLWQg0/VHFyejphz67gYKY
        rQR5Tqm6CTA0nXGD6jbGJAemuaxMMIN5tA==
X-Google-Smtp-Source: ABdhPJwKkOKgsN65wHCM38OzpEIIaOSexX89WeAychz8F+zlwOBz4cdq96TNJP7H3YWBzz22rDLEZg==
X-Received: by 2002:a63:e309:: with SMTP id f9mr7132629pgh.443.1623973287386;
        Thu, 17 Jun 2021 16:41:27 -0700 (PDT)
Received: from ada-comp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id j19sm6452966pgm.44.2021.06.17.16.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 16:41:27 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, jaffe1@gmail.com,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v2 1/2] cec: expand One Touch Record TV Screen test
Date:   Thu, 17 Jun 2021 16:41:11 -0700
Message-Id: <33ad72ef20383b4a86526c511696ed0838afa10b.1623972511.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623972511.git.deborahbrouwer3563@gmail.com>
References: <cover.1623972511.git.deborahbrouwer3563@gmail.com>
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
 utils/cec-compliance/cec-test.cpp | 53 ++++++++++++++++++++++++++-----
 utils/cec-follower/cec-tuner.cpp  |  9 ++++--
 2 files changed, 51 insertions(+), 11 deletions(-)

diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index 40d8369d..0051d72a 100644
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
@@ -1172,8 +1165,52 @@ static int one_touch_rec_tv_screen(struct node *node, unsigned me, unsigned la,
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
+		fail_on_test(rec_src.analog.ana_bcast_type > 2);
+		fail_on_test(rec_src.analog.bcast_system > 8 && rec_src.analog.bcast_system != 0x1f);
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

