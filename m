Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 172E93ABFA3
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 01:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232384AbhFQXnl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 19:43:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230447AbhFQXnk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 19:43:40 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78B76C061574
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 16:41:32 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id 69so3758311plc.5
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 16:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wznvHF42tX6esZegWeGAjqI9nVakVD+2ebx4/jB9lpM=;
        b=DAVVb31nZgxTEEqfLBkmjezvazWpgLb4OMsBybUGZ5ByzBeubOi4lgBu3NUcRlueLq
         MsEYHoAkjrVoCnN/VmTxCAF924pIrmMQnJ2aWvVZNk5v9uTLzP838U1iKIw1YWfMcwkj
         USXrYrljVwPQ35qBEvMQYIn81QBv/vvKbD6rvfbb9yN02v7oTDXldBqd3XKKo2Xr+bOe
         cVqJCDw5wEk6QwDDNHYLwuThfNux6rGwEAXHx3s3GQwe2dBpx1nl2mlDlSFO1R3f/Xl3
         3CEVfbbaloISLKT4J9FU00NdiJmxCe+q7fBW2j98hdT53ygjEPiYzrDCIy26VzJLx7UD
         ABQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wznvHF42tX6esZegWeGAjqI9nVakVD+2ebx4/jB9lpM=;
        b=SKS4f/DH717wlQ1kqyjPZoMp+D6NIbbF73pAH2gFyFgcgnsG3FpJf8phOh+yn+IizB
         VN2XxlOC4EFbPu0FGJ/cf2ywZbir+LEYLmjyyr9/QnKynv2utOOkN7D5O2n6geza9+1W
         cvMJeYuvRYk8lOSV/o8bIqdST11W1Kr5nhb6lqupSH/mFFKMYteFCxmr+1NvpZOb0Yq8
         zGChm2hKAiX+rIP3u4ezUSEoae8F3Oa8ja9HVYTxe6fCJFK0GT+lMWkqcnQ5zPiPMXup
         XSNudFV0xgROsMBJhAW6cOMYhBHDpmwxP25BFhTDrcgo+Bx3GePAyEC4y4Dlymc2ZfLg
         /Q+A==
X-Gm-Message-State: AOAM531CYRnkvQAwWFhXRWl2mFp/1/ccQ/fOCLAa8FdIRnsSbr36wMWn
        NgDewrd3s3Q66LYHYB1ThCL6gJbQlGxiMQ==
X-Google-Smtp-Source: ABdhPJzvP/UCJi49+YXVnpkOZcF6CjeKpKuBkIfxhDqI7U5DqoWD1MRiEV55S1977fibO0PVdvu/gw==
X-Received: by 2002:a17:90b:3449:: with SMTP id lj9mr241932pjb.123.1623973291990;
        Thu, 17 Jun 2021 16:41:31 -0700 (PDT)
Received: from ada-comp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id j19sm6452966pgm.44.2021.06.17.16.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 16:41:31 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, jaffe1@gmail.com,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v2 2/2] cec: expand One Touch Record On test
Date:   Thu, 17 Jun 2021 16:41:12 -0700
Message-Id: <b9771c1afb515ce2132d9a801174127543821755.1623972511.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623972511.git.deborahbrouwer3563@gmail.com>
References: <cover.1623972511.git.deborahbrouwer3563@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Send all Record On source operands and check that the follower responds
with a corresponding Record Status. Send invalid Record On source
operands and make sure that the follower returns Feature Abort with
Invalid Operand.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
 utils/cec-compliance/cec-test.cpp | 107 +++++++++++++++++++++++++++---
 utils/cec-follower/cec-tuner.cpp  |  28 +++++++-
 2 files changed, 125 insertions(+), 10 deletions(-)

diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index 0051d72a..2c64d1a0 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -48,6 +48,43 @@ static int test_play_mode(struct node *node, unsigned me, unsigned la, __u8 play
 	return OK;
 }
 
+static int one_touch_rec_on_send(struct node *node, unsigned me, unsigned la, __u8 src, __u8 &rec_status)
+{
+	struct cec_msg msg;
+	struct cec_op_record_src rec_src = {};
+
+	cec_msg_init(&msg, me, la);
+	rec_src.type = src;
+	cec_msg_record_on(&msg, true, &rec_src);
+	fail_on_test(!transmit_timeout(node, &msg));
+	fail_on_test(timed_out_or_abort(&msg));
+	cec_ops_record_status(&msg, &rec_status);
+
+	return OK;
+}
+
+static bool one_touch_rec_common(__u8 rec_status)
+{
+	switch (rec_status) {
+	case CEC_OP_RECORD_STATUS_UNSUP_CA:
+	case CEC_OP_RECORD_STATUS_NO_CA_ENTITLEMENTS:
+	case CEC_OP_RECORD_STATUS_CANT_COPY_SRC:
+	case CEC_OP_RECORD_STATUS_NO_MORE_COPIES:
+	case CEC_OP_RECORD_STATUS_NO_MEDIA:
+	case CEC_OP_RECORD_STATUS_PLAYING:
+	case CEC_OP_RECORD_STATUS_ALREADY_RECORDING:
+	case CEC_OP_RECORD_STATUS_MEDIA_PROT:
+	case CEC_OP_RECORD_STATUS_NO_SIGNAL:
+	case CEC_OP_RECORD_STATUS_MEDIA_PROBLEM:
+	case CEC_OP_RECORD_STATUS_NO_SPACE:
+	case CEC_OP_RECORD_STATUS_PARENTAL_LOCK:
+	case CEC_OP_RECORD_STATUS_OTHER:
+		return true;
+	default:
+		return false;
+	}
+}
+
 /* System Information */
 
 int system_info_polling(struct node *node, unsigned me, unsigned la, bool interactive)
@@ -1215,10 +1252,6 @@ static int one_touch_rec_tv_screen(struct node *node, unsigned me, unsigned la,
 
 static int one_touch_rec_on(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	/*
-	  TODO: Page 36 in HDMI CEC 1.4b spec lists additional behaviors that should be
-	  checked for.
-	 */
 	struct cec_msg msg;
 	struct cec_op_record_src rec_src = {};
 
@@ -1227,15 +1260,68 @@ static int one_touch_rec_on(struct node *node, unsigned me, unsigned la, bool in
 	cec_msg_record_on(&msg, true, &rec_src);
 	fail_on_test(!transmit_timeout(node, &msg));
 	fail_on_test(timed_out(&msg));
-	fail_on_test(cec_has_record(1 << la) && unrecognized_op(&msg));
-	if (unrecognized_op(&msg))
+	if (unrecognized_op(&msg)) {
+		fail_on_test(cec_has_record(1 << la) || cec_has_backup(1 << la));
 		return OK_NOT_SUPPORTED;
+	}
 	if (refused(&msg))
 		return OK_REFUSED;
 	if (cec_msg_status_is_abort(&msg))
 		return OK_PRESUMED;
 
-	return 0;
+	__u8 rec_status;
+
+	cec_ops_record_status(&msg, &rec_status);
+	fail_on_test(rec_status != CEC_OP_RECORD_STATUS_CUR_SRC && !one_touch_rec_common(rec_status));
+
+	fail_on_test(one_touch_rec_on_send(node, me, la, CEC_OP_RECORD_SRC_DIGITAL, rec_status));
+	fail_on_test(rec_status != CEC_OP_RECORD_STATUS_DIG_SERVICE &&
+	             rec_status != CEC_OP_RECORD_STATUS_NO_DIG_SERVICE &&
+	             rec_status != CEC_OP_RECORD_STATUS_NO_SERVICE &&
+	             !one_touch_rec_common(rec_status));
+
+	fail_on_test(one_touch_rec_on_send(node, me, la, CEC_OP_RECORD_SRC_ANALOG, rec_status));
+	fail_on_test(rec_status != CEC_OP_RECORD_STATUS_ANA_SERVICE &&
+	             rec_status != CEC_OP_RECORD_STATUS_NO_ANA_SERVICE &&
+	             rec_status != CEC_OP_RECORD_STATUS_NO_SERVICE &&
+	             !one_touch_rec_common(rec_status));
+
+	fail_on_test(one_touch_rec_on_send(node, me, la, CEC_OP_RECORD_SRC_EXT_PLUG, rec_status));
+	fail_on_test(rec_status != CEC_OP_RECORD_STATUS_EXT_INPUT &&
+	             rec_status != CEC_OP_RECORD_STATUS_INVALID_EXT_PLUG &&
+	             !one_touch_rec_common(rec_status));
+
+	fail_on_test(one_touch_rec_on_send(node, me, la, CEC_OP_RECORD_SRC_EXT_PHYS_ADDR, rec_status));
+	fail_on_test(rec_status != CEC_OP_RECORD_STATUS_EXT_INPUT &&
+	             rec_status != CEC_OP_RECORD_STATUS_INVALID_EXT_PHYS_ADDR &&
+	             !one_touch_rec_common(rec_status));
+
+	return OK;
+}
+
+static int one_touch_rec_on_invalid(struct node *node, unsigned me, unsigned la, bool interactive)
+{
+	struct cec_msg msg;
+
+	cec_msg_init(&msg, me, la);
+	cec_msg_record_on_own(&msg);
+	msg.msg[2] = 0;  /* Invalid source operand */
+	fail_on_test(!transmit_timeout(node, &msg));
+	if (unrecognized_op(&msg))
+		return OK_NOT_SUPPORTED;
+	fail_on_test(!cec_msg_status_is_abort(&msg));
+	fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
+
+	cec_msg_init(&msg, me, la);
+	cec_msg_record_on_own(&msg);
+	msg.msg[2] = 6;  /* Invalid source operand */
+	fail_on_test(!transmit_timeout(node, &msg));
+	if (unrecognized_op(&msg))
+		return OK_NOT_SUPPORTED;
+	fail_on_test(!cec_msg_status_is_abort(&msg));
+	fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
+
+	return OK;
 }
 
 static int one_touch_rec_off(struct node *node, unsigned me, unsigned la, bool interactive)
@@ -1260,7 +1346,12 @@ static int one_touch_rec_off(struct node *node, unsigned me, unsigned la, bool i
 
 static const vec_remote_subtests one_touch_rec_subtests{
 	{ "Record TV Screen", CEC_LOG_ADDR_MASK_TV, one_touch_rec_tv_screen },
-	{ "Record On", CEC_LOG_ADDR_MASK_RECORD, one_touch_rec_on },
+	{ "Record On", CEC_LOG_ADDR_MASK_RECORD | CEC_LOG_ADDR_MASK_BACKUP, one_touch_rec_on },
+	{
+		"Record On Invalid Operand",
+		CEC_LOG_ADDR_MASK_RECORD | CEC_LOG_ADDR_MASK_BACKUP,
+		one_touch_rec_on_invalid,
+	},
 	{ "Record Off", CEC_LOG_ADDR_MASK_RECORD, one_touch_rec_off },
 };
 
diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index fd11bd10..ebceb064 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -606,10 +606,34 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
 		return;
 	}
 	case CEC_MSG_RECORD_ON:
-		if (!cec_has_record(1 << me))
+		if (!cec_has_record(1 << me) && !cec_has_backup(1 << me))
+			break;
+
+		struct cec_op_record_src rec_src;
+		__u8 rec_status;
+
+		cec_ops_record_on(&msg, &rec_src);
+
+		switch (rec_src.type) {
+		case CEC_OP_RECORD_SRC_OWN:
+			rec_status = CEC_OP_RECORD_STATUS_CUR_SRC;
+			break;
+		case CEC_OP_RECORD_SRC_DIGITAL:
+			rec_status = CEC_OP_RECORD_STATUS_DIG_SERVICE;
 			break;
+		case CEC_OP_RECORD_SRC_ANALOG:
+			rec_status = CEC_OP_RECORD_STATUS_ANA_SERVICE;
+			break;
+		case CEC_OP_RECORD_SRC_EXT_PLUG:
+		case CEC_OP_RECORD_SRC_EXT_PHYS_ADDR:
+			rec_status = CEC_OP_RECORD_STATUS_EXT_INPUT;
+			break;
+		default:
+			reply_feature_abort(node, &msg, CEC_OP_ABORT_INVALID_OP);
+			return;
+		}
 		cec_msg_set_reply_to(&msg, &msg);
-		cec_msg_record_status(&msg, CEC_OP_RECORD_STATUS_CUR_SRC);
+		cec_msg_record_status(&msg, rec_status);
 		transmit(node, &msg);
 		return;
 	case CEC_MSG_RECORD_OFF:
-- 
2.25.1

