Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80DDAB7177
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2019 04:17:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387957AbfISCRT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Sep 2019 22:17:19 -0400
Received: from mail-ot1-f53.google.com ([209.85.210.53]:37725 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730815AbfISCRT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Sep 2019 22:17:19 -0400
Received: by mail-ot1-f53.google.com with SMTP id k32so1721963otc.4
        for <linux-media@vger.kernel.org>; Wed, 18 Sep 2019 19:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vhHwix/O6zIG7j5J5ipIgYIaXlpdR/mZcHmp3KJBBXM=;
        b=L0LdormV0YhIgLrUDlBFplL7ZRRTNV5UfcXHgsJbaOS09wSdowj108quIpvIxm2e77
         krpj5S0yc+mBn9yAs5og/CctDox1I8paLh/UpkRtB1vVrk2Crt1TyXljnLXRYoCnx+Hw
         J7zZ6B3p+sk5ZuJPvSFH5OKRMA9/UrUmShbZjxe9BcFR49xcCEC4XP46/JBD+seE9xti
         Tm5rwADgNwazvkFiLo+WDeQq1G8NZ8eswVtp8sMPBIGbX+zwS5Duq7kXQscQAL4wiNOe
         B9tk1mm32u6bjrHjr1ExCNHcyn5/QyE7LRJKjPijBtceSQVG1L34SB0qXZGgxoFm62Sz
         rIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vhHwix/O6zIG7j5J5ipIgYIaXlpdR/mZcHmp3KJBBXM=;
        b=ffArJgYuqaRC62IXjX3ngvz2ZtVZ7444LlBiUooL45FwDLR3FOVKJViQvpKTO/U6xt
         yYjQF8GLD8ArYhKDjL6ZXBBNiwsnA7GdHPvUS5NcHWUyA/9gnS6lIe6LoNRbY293Leb5
         Cm05Z2S6WhyPcUzrY7WpH5639V8oHBlI47fZ0Y+uO3hVYp8Dk5FmsSkdZ1EuPHglryp2
         52nETNJETFJwGRfmKLzpdj1NWwPJQ9FMwwqup8unNakGoDQs36l+RQhaFDAPI2HXUqiW
         OfhZJkpsk+n7Y0RA4qjTFxzM1MMnFX5PL5iCYARuyqvBEK+Br+YUYmEC9fT5wctV0mAo
         BPcQ==
X-Gm-Message-State: APjAAAW6DaFUHsLo0lFBTSJ1gBF/2QGzwkJuPzQRFm0Y1ueziDRsKKtE
        pO5LefiNfGVtbeCx9rarPozNz28s
X-Google-Smtp-Source: APXvYqxJJptmQ+ISBTWPyX9+dJ0r0MMUhwinQCJ0u7e7F5UClgsr5ZwwTbU2EAuNtnuByixFKK7gPQ==
X-Received: by 2002:a9d:6a51:: with SMTP id h17mr514238otn.218.1568859438066;
        Wed, 18 Sep 2019 19:17:18 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::48])
        by smtp.googlemail.com with ESMTPSA id a21sm2178772oia.27.2019.09.18.19.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2019 19:17:17 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH] cec-follower: fix cec-tuner.cpp
Date:   Wed, 18 Sep 2019 21:17:16 -0500
Message-Id: <20190919021716.259614-1-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Export code from cec-processing.cpp to cec-tuner.cpp so testing logic
does not break for PRESUMED_OK which replies on the feature abort
message.  Also needed it a boolean for broadcast messages that should
not be aborted.

Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
---
 utils/cec-follower/cec-processing.cpp |  4 +--
 utils/cec-follower/cec-tuner.cpp      | 37 +++++++++++++++++++++++++++
 2 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index 15cedddf..c6ef1d09 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
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
index 5e794d71..bb727ae7 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -7,8 +7,40 @@
 
 #include "cec-follower.h"
 
+static void reply_feature_abort(struct node *node, struct cec_msg *msg, __u8 reason = CEC_OP_ABORT_UNRECOGNIZED_OP)
+{
+	unsigned la = cec_msg_initiator(msg);
+	__u8 opcode = cec_msg_opcode(msg);
+	__u64 ts_now = get_ts();
+
+	if (cec_msg_is_broadcast(msg) || cec_msg_initiator(msg) == CEC_LOG_ADDR_UNREGISTERED)
+		return;
+	if (reason == CEC_OP_ABORT_UNRECOGNIZED_OP) {
+		la_info[la].feature_aborted[opcode].count++;
+		if (la_info[la].feature_aborted[opcode].count == 2) {
+			/* If the Abort Reason was "Unrecognized opcode", the Initiator should not send
+			   the same message to the same Follower again at that time to avoid saturating
+			   the bus. */
+			warn("Received message %s from LA %d (%s) shortly after\n",
+				opcode2s(msg).c_str(), la, la2s(la));
+			warn("replying Feature Abort [Unrecognized Opcode] to the same message.\n");
+		}
+	}
+	else if (la_info[la].feature_aborted[opcode].count) {
+		warn("Replying Feature Abort with abort reason different than [Unrecognized Opcode]\n");
+		warn("to message that has previously been replied Feature Abort to with [Unrecognized Opcode].\n");
+	}
+	else
+		la_info[la].feature_aborted[opcode].ts = ts_now;
+
+	cec_msg_reply_feature_abort(msg, reason);
+	transmit(node, msg);
+}
+
 void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me)
 {
+	bool is_bcast = cec_msg_is_broadcast(&msg);
+
 	switch (msg.msg[1]) {
 
 
@@ -136,4 +168,9 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
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

