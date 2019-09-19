Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1323FB805B
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2019 19:47:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391085AbfISRrJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Sep 2019 13:47:09 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:38353 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391038AbfISRrJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Sep 2019 13:47:09 -0400
Received: by mail-ot1-f66.google.com with SMTP id e11so3860108otl.5
        for <linux-media@vger.kernel.org>; Thu, 19 Sep 2019 10:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TCq23jU4vni7Zs+cSrodll03Df7Ly/Jpa+1dDIOXdUY=;
        b=WrNFgXLPB6DTdk1Yl8YDuno7OycG/RgQ363JE2FtHhblNStLAsscV+RRX4oXjAJ625
         449xhykaVhD/v629my7npiZPX4bPyI2tunUg2RDPPvDYOJXcDZIjzxXJt7NsV5Z39izB
         eFFq7lUdr0by5b1lfLnWTz38xXeq32kxajWJNAXbaoesBDUTHNncnEHXTY2LbfRK/eqz
         W2iVaHkIKpvTrU54bqChE7uJjUsvUWIWnEletivRNnJV96its2xZgFN2k9dYxGL/nyWD
         9iEhWnPF6F/TNPXzvgw2RC7IMfFqgPiglx5zdrBgrxWC9NVMF38jzyXkEYjbbQLF9am0
         9o1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TCq23jU4vni7Zs+cSrodll03Df7Ly/Jpa+1dDIOXdUY=;
        b=SxQwxAVQYyuSZp+F1fZDzJbOrsiQYXxoMsWOhUzrkl0qxSOnuNUbQ5JpQ9hRbFjTFd
         BLFIV6oVeUfiRM1rgstG4qDqSjhcvoqpljVKA1fiQKXJ51S0J5kvnJPfQWlmGSFG2gwq
         Mqg3Gyy5xUWILQ8C+cKz1yPh74iLRP2QF7Bjmr/LRLBcef5p6okKQaJ9+thrEGSzzdvQ
         sEGynbli+1h8mB6cvdFsQC5hAWTd0lq5w2c4fW2mt0QHFHhIJLK0YVnvSY28uklA4Xp9
         RSTszZBZ5MCJlJ80FuqoqHG9zzi1YzJbn09LyGReP41E1PmrIUG9F8qrrM8+lsin65+N
         tAlA==
X-Gm-Message-State: APjAAAUrWpD358UFVY4xsZ6+y+1gIaXYdf1M0cqIx63fFWaBdPRf8Add
        XhmpzftxfYq4Q+IwHpfUgzuSH0T9
X-Google-Smtp-Source: APXvYqxTsvmsMskgnGSGR0zGolCV0sqoZQ6HMzHmb+5H8Rj618f7yP0sniqRAUKfhx2UuMVUhPV1Jw==
X-Received: by 2002:a9d:58c8:: with SMTP id s8mr7607491oth.12.1568915228645;
        Thu, 19 Sep 2019 10:47:08 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::48])
        by smtp.googlemail.com with ESMTPSA id e5sm3033680otr.81.2019.09.19.10.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 10:47:08 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH v2] cec-follower: fix cec-tuner.cpp
Date:   Thu, 19 Sep 2019 12:47:00 -0500
Message-Id: <20190919174702.140335-1-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190919021716.259614-1-c0d1n61at3@gmail.com>
References: <20190919021716.259614-1-c0d1n61at3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove static from reply_feature_abort() in cec-processing.cpp so
it can be used in cec-tuner.cpp.  This is maintain testing logic
for PRESUMED_OK which replies on the feature abort message.  Also
needed is a boolean for broadcast messages that should not be
aborted.

Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
---

Changes made since v1:
  - Remove reply_feature_abort() from cec-tuner.cpp
  - Remove static from reply_feature_abort() in cec-processing.cpp
  - Add prototype for reply_feature_abort() in cec-follower.h

---
 utils/cec-follower/cec-follower.h     | 1 +
 utils/cec-follower/cec-processing.cpp | 6 +++---
 utils/cec-follower/cec-tuner.cpp      | 7 +++++++
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
index 9f5f1be4..03b52217 100644
--- a/utils/cec-follower/cec-follower.h
+++ b/utils/cec-follower/cec-follower.h
@@ -223,6 +223,7 @@ void sad_encode(const struct short_audio_desc *sad, __u32 *descriptor);
 void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me);
 
 // CEC processing
+void reply_feature_abort(struct node *node, struct cec_msg *msg, __u8 reason = CEC_OP_ABORT_UNRECOGNIZED_OP);
 void testProcessing(struct node *node, bool wallclock);
 
 // cec-log.c
diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index 15cedddf..3db88f1a 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -211,7 +211,7 @@ static void log_event(struct cec_event &ev, bool wallclock)
 		printf("\tTimestamp: %s\n", ts2s(ev.ts, wallclock).c_str());
 }
 
-static void reply_feature_abort(struct node *node, struct cec_msg *msg, __u8 reason = CEC_OP_ABORT_UNRECOGNIZED_OP)
+void reply_feature_abort(struct node *node, struct cec_msg *msg, __u8 reason)
 {
 	unsigned la = cec_msg_initiator(msg);
 	__u8 opcode = cec_msg_opcode(msg);
@@ -608,7 +608,7 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
 	case CEC_MSG_DECK_STATUS:
 		return;
 
-	/* Tuner Centric Messages */
+	/* Tuner/Record/Timer Messages */
 
 	case CEC_MSG_GIVE_TUNER_DEVICE_STATUS:
 	case CEC_MSG_TUNER_DEVICE_STATUS:
@@ -630,7 +630,7 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
 	case CEC_MSG_TIMER_CLEARED_STATUS:
 	case CEC_MSG_TIMER_STATUS:
 		process_tuner_record_timer_msgs(node, msg, me);
-		break;
+		return;
 
 		/* Dynamic Auto Lipsync */
 
diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index 5e794d71..a1e349bd 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -9,6 +9,8 @@
 
 void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me)
 {
+	bool is_bcast = cec_msg_is_broadcast(&msg);
+
 	switch (msg.msg[1]) {
 
 
@@ -136,4 +138,9 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
 	default:
 		break;
 	}
+
+	if (is_bcast)
+		return;
+
+	reply_feature_abort(node, &msg);
 }
-- 
2.23.0

