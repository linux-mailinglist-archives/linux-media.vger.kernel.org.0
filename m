Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDA703677EB
	for <lists+linux-media@lfdr.de>; Thu, 22 Apr 2021 05:28:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234632AbhDVD3C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 23:29:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234615AbhDVD3C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 23:29:02 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EF98C06174A
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 20:28:25 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id lt13so11700443pjb.1
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 20:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=fAGj+NtHA3L+cHWX2zjzzpvYTknP1on+8VLI+lkCUa8=;
        b=Q8JnLS4rJ8TvhDFUaMimjPR2nly9Q0hzGJHOxfYYsr4kGW2cWRzA11mHjzMU8Vilii
         lWLNSzoVIwgh47gkHH6sWazehyeCRrlLKpSV8cpTyRpXhvIECFJ4eLd7f0yr0d1tRCRG
         Q9Cfx8iexizRiDeekewRV1VQ/F0FtJ3OJ0T9ra6T+tb10b5DQh2otaGKHRG5KkzhhaUa
         Kf9Q4qSpetWuOFKxxlhze/jF4lKHbSKv2hvXPw1o6ZkBtgiuCM5kzQ2xqTXhR/bopG7E
         OPT/UmDfU9f5dJ/nChhBz4IKsC7SJ2Ow7xWviSUy+zexSiFBZwM8XmUyCkP3j/0g11z1
         9nfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=fAGj+NtHA3L+cHWX2zjzzpvYTknP1on+8VLI+lkCUa8=;
        b=h0trpVVEyRuOhdU/yHIzAL8kbfjfsj1FabKnu3/uflnK1FwF8UvqU03qy1vlXB6rBW
         twX36YQiRySfgkFGPZZIjPZhFIeuPGpMcr7V8vrZN+lrypl2/IALeT+Jyhbql1Y1Jdn8
         S6uUccjYGAVCELUTNcop2T1YJOPybJVUPYBavgHES7mkKBy6llESQV49+ZuPjPmvgx85
         q+dh5ZjyzjbwjLgthuEi9LtZzipc8W2VPpTWQJhjZpoBZJEVz3PARP4lXA6tBDxZ+NuA
         joQtisVIPyvTN+skDEA9lrKnezpoQ3NrgQuGOCr8fQ4HSMjxESThMqXNTaKDbZizJSPD
         Jclg==
X-Gm-Message-State: AOAM530/NabGORPUtwxPyGlR+6UFCMtc5Lafs0YRCoiZ05C14hVlJK6w
        NidY+9L4zVEsz/JIMaMCiKkJD+xd7rEt/g==
X-Google-Smtp-Source: ABdhPJzIs1BfAjPG+e+u7eN82sz+TeDUgE340ARh7Cw6vFrdGK5QC4vqlMDeH5bkwucHC6+BvwQ0Xg==
X-Received: by 2002:a17:902:f2d1:b029:eb:2e32:8804 with SMTP id h17-20020a170902f2d1b02900eb2e328804mr1497882plc.40.1619062105064;
        Wed, 21 Apr 2021 20:28:25 -0700 (PDT)
Received: from djbComp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id f3sm6266999pjo.3.2021.04.21.20.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 20:28:24 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v4 3/3] cec: add invalid operand test for Audio Rate Control messages
Date:   Wed, 21 Apr 2021 20:27:54 -0700
Message-Id: <b1a4ce191ad422e0f178101fe2e9ec73e4625048.1619060430.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1619060430.git.deborahbrouwer3563@gmail.com>
References: <cover.1619060430.git.deborahbrouwer3563@gmail.com>
In-Reply-To: <cover.1619060430.git.deborahbrouwer3563@gmail.com>
References: <cover.1619060430.git.deborahbrouwer3563@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a test in cec-compliance that sends an Audio Rate Control message
with an invalid operand. Check that it receives a Feature Abort reply
due to the invalid operand. Add a response in cec-follower to Feature
Abort due to an invalid operand.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
 utils/cec-compliance/cec-test-audio.cpp | 25 +++++++++++++++++++++++++
 utils/cec-follower/cec-processing.cpp   |  4 ++++
 2 files changed, 29 insertions(+)

diff --git a/utils/cec-compliance/cec-test-audio.cpp b/utils/cec-compliance/cec-test-audio.cpp
index e1386dbb..bdbcd178 100644
--- a/utils/cec-compliance/cec-test-audio.cpp
+++ b/utils/cec-compliance/cec-test-audio.cpp
@@ -895,6 +895,25 @@ static int audio_rate_ctl_active_sensing(struct node *node, unsigned me, unsigne
 	return OK_PRESUMED;
 }
 
+static int audio_rate_ctl_invalid(struct node *node, unsigned me, unsigned la, bool interactive)
+{
+	if (!node->remote[la].has_aud_rate)
+		return NOTAPPLICABLE;
+
+	struct cec_msg msg = {};
+
+	cec_msg_init(&msg, me, la);
+	cec_msg_set_audio_rate(&msg, 0xa); /* Invalid Audio Rate Control message operand */
+	fail_on_test(!transmit_timeout(node, &msg));
+	fail_on_test(timed_out(&msg));
+	fail_on_test(!cec_msg_status_is_abort(&msg));
+	if (abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP) {
+		warn("Expected Feature Abort [Invalid operand]\n");
+		return FAIL;
+	}
+	return OK;
+}
+
 const vec_remote_subtests audio_rate_ctl_subtests{
 	{
 		"Set Audio Rate",
@@ -908,4 +927,10 @@ const vec_remote_subtests audio_rate_ctl_subtests{
 		CEC_LOG_ADDR_MASK_TUNER | CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
 		audio_rate_ctl_active_sensing,
 	},
+	{
+		"Audio Rate Invalid Operand",
+		CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD |
+		CEC_LOG_ADDR_MASK_TUNER | CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
+		audio_rate_ctl_invalid,
+	},
 };
diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index fc0d5df0..93db4059 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -814,6 +814,10 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
 			aud_rate_msg_interval_check(msg.rx_ts, node->state.last_aud_rate_rx_ts);
 			node->state.last_aud_rate_rx_ts = msg.rx_ts;
 			return;
+		default:
+			cec_msg_reply_feature_abort(&msg, CEC_OP_ABORT_INVALID_OP);
+			transmit(node, &msg);
+			break;
 		}
 		break;
 
-- 
2.17.1

