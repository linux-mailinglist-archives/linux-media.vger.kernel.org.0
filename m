Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78A403677EA
	for <lists+linux-media@lfdr.de>; Thu, 22 Apr 2021 05:28:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234626AbhDVD27 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 23:28:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234615AbhDVD26 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 23:28:58 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0274FC06138B
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 20:28:24 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id 20so18851148pll.7
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 20:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=jFGd0iOWrrDCRq1swY9aZJCtYQoP2Jawu8/Eqa9Xslg=;
        b=IZluTp979k7ofDOisKeQTrGY3reFXHQoG6p9u2sKm40QhYHsMWVTyfIKzSvEQ1GXDh
         fQ63gAM8EAeSEAq6pSXqRO6/49Myea4cPPz2QjvpF38JySgXOAZi85TD/p7ArPoh6ixF
         pEmvVqoXBNxmdLUsFRVNepZ3Cx31JSZvTD8XBCNHkQYawug5SDok3u1V0C7aXlbXyQeY
         sUxLfQAHqbioP0GGBbuywxGRMTlH0tdA3UneatFjp42+3Pv8szeRJlKeICQa1KvDNM1c
         Y+J+Pe2Vs1Id8pLCYT0Qfr++iLEUip6nyVHlkzZ5lpxq7kzXk2Eix4bPyStPDFwuk/X+
         jjcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=jFGd0iOWrrDCRq1swY9aZJCtYQoP2Jawu8/Eqa9Xslg=;
        b=N9eOs4b9AJyr4iSQ+Q3ItK7L3K6MRrh+tDQ0ibyUvAHkF9LXaOnhIvW6P+xD4/TIUI
         Lu+MIVOw/AtIy/i1pOraIU7GNjt03yJ0rlwlHcp8KxC4ZZ1WBcXHYhg+Kyho8edXMKHJ
         t0RgyEewz6DRbhYxpLC5Z95sdUxmgWQYwdlLVWwK0IFx2WX/dsE88iYcBi585gso/rKc
         ffKJ6UAM1zRHdBAdIEx8h17b73YyDnUEV+3vx3eY18c1L/LD9BlCxXpVHmEkJVT4rc/S
         LX/hkMSxXDOABp0AaY4s8Aa2fkYdktTFJyRvwz3Uw12Dq5B9Wdfq/fJA/Z6n19OrnRk8
         PfjA==
X-Gm-Message-State: AOAM532DSCTtXD0S9/ostjPiB/i6nZM+/CT9CkFTkDATo0p+O3S0eZdD
        1+r1oRV1HV47oSOB0hqzdcTgP/Ruq9sN+Q==
X-Google-Smtp-Source: ABdhPJyKmhpcnOMC6bETxkGMmTszeZl7e6HKSyUQ6+x5BPbmIgIBIXW/8o1q+SdLO3W0vS+O6VNNfg==
X-Received: by 2002:a17:902:a70f:b029:ea:d4a8:6a84 with SMTP id w15-20020a170902a70fb02900ead4a86a84mr1500112plq.42.1619062103605;
        Wed, 21 Apr 2021 20:28:23 -0700 (PDT)
Received: from djbComp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id f3sm6266999pjo.3.2021.04.21.20.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 20:28:23 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v4 2/3] cec: add active sensing test for Audio Rate Control messages
Date:   Wed, 21 Apr 2021 20:27:53 -0700
Message-Id: <7008f3b7930a409284602b4e4868d26ea4a1d23c.1619060430.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1619060430.git.deborahbrouwer3563@gmail.com>
References: <cover.1619060430.git.deborahbrouwer3563@gmail.com>
In-Reply-To: <cover.1619060430.git.deborahbrouwer3563@gmail.com>
References: <cover.1619060430.git.deborahbrouwer3563@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The controlling device should send an Audio Rate Control message at least
once every 2 seconds for active sensing. Add a test in cec-compliance to
delay the message by more than 2 seconds. Check the interval between
messages in cec-follower and warn if the delay is greater than 2 seconds.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
 utils/cec-compliance/cec-test-audio.cpp | 34 +++++++++++++++---
 utils/cec-follower/cec-follower.cpp     |  1 +
 utils/cec-follower/cec-follower.h       |  1 +
 utils/cec-follower/cec-processing.cpp   | 46 ++++++++++++++++++++-----
 4 files changed, 69 insertions(+), 13 deletions(-)

diff --git a/utils/cec-compliance/cec-test-audio.cpp b/utils/cec-compliance/cec-test-audio.cpp
index 4674295b..e1386dbb 100644
--- a/utils/cec-compliance/cec-test-audio.cpp
+++ b/utils/cec-compliance/cec-test-audio.cpp
@@ -851,10 +851,6 @@ const vec_remote_subtests sac_subtests{
 
 /* Audio Rate Control */
 
-/*
-  TODO: These are very rudimentary tests which should be expanded.
- */
-
 static int audio_rate_ctl_set_audio_rate(struct node *node, unsigned me, unsigned la, bool interactive)
 {
 	struct cec_msg msg = {};
@@ -875,6 +871,30 @@ static int audio_rate_ctl_set_audio_rate(struct node *node, unsigned me, unsigne
 	return OK_PRESUMED;
 }
 
+static int audio_rate_ctl_active_sensing(struct node *node, unsigned me, unsigned la, bool interactive)
+{
+	/*
+	 * The source shall go back to Rate Control Off if no Set Audio Rate message is
+	 * received for more than 2 seconds.
+	 */
+	if (!node->remote[la].has_aud_rate)
+		return NOTAPPLICABLE;
+
+	struct cec_msg msg = {};
+
+	cec_msg_init(&msg, me, la);
+
+	/*
+	 * Since this subtest runs immediately after Set Audio Rate, delaying the interval
+	 * between the two tests is sufficient to test that the Source turns off rate control.
+	 */
+	sleep(3);
+	cec_msg_set_audio_rate(&msg, CEC_OP_AUD_RATE_OFF);
+	fail_on_test(!transmit_timeout(node, &msg));
+	fail_on_test_v2(node->remote[la].cec_version, unrecognized_op(&msg));
+	return OK_PRESUMED;
+}
+
 const vec_remote_subtests audio_rate_ctl_subtests{
 	{
 		"Set Audio Rate",
@@ -882,4 +902,10 @@ const vec_remote_subtests audio_rate_ctl_subtests{
 		CEC_LOG_ADDR_MASK_TUNER | CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
 		audio_rate_ctl_set_audio_rate,
 	},
+	{
+		"Audio Rate Active Sensing",
+		CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD |
+		CEC_LOG_ADDR_MASK_TUNER | CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
+		audio_rate_ctl_active_sensing,
+	},
 };
diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
index bb63f90d..184cf16a 100644
--- a/utils/cec-follower/cec-follower.cpp
+++ b/utils/cec-follower/cec-follower.cpp
@@ -314,6 +314,7 @@ void state_init(struct node &node)
 	node.state.volume = 50;
 	node.state.mute = false;
 	tuner_dev_info_init(&node.state);
+	node.state.last_aud_rate_rx_ts = 0;
 }
 
 int main(int argc, char **argv)
diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
index 7806a4b6..391b9ab4 100644
--- a/utils/cec-follower/cec-follower.h
+++ b/utils/cec-follower/cec-follower.h
@@ -51,6 +51,7 @@ struct state {
 	bool tuner_report_changes;
 	bool deck_report_changes;
 	unsigned toggle_power_status;
+	__u64 last_aud_rate_rx_ts;
 };
 
 struct node {
diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index 02440747..fc0d5df0 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -29,6 +29,9 @@
 /* Time between each polling message sent to a device */
 #define POLL_PERIOD 15000
 
+/* The maximum interval in seconds between audio rate messages as defined in the spec */
+#define MAX_AUD_RATE_MSG_INTERVAL 2
+
 struct cec_enum_values {
 	const char *type_name;
 	__u8 value;
@@ -230,6 +233,22 @@ static __u8 current_power_state(struct node *node)
 	return CEC_OP_POWER_STATUS_TO_STANDBY;
 }
 
+static void aud_rate_msg_interval_check(__u64 ts_new, __u64 ts_old)
+{
+	/*
+	 * The interval between messages is not relevant if this is the
+	 * first audio rate control message or if the previous message
+	 * turned off the audio rate control.
+	 */
+	if (ts_old) {
+		unsigned interval = (ts_new - ts_old) / 1000000000;
+		if (interval > MAX_AUD_RATE_MSG_INTERVAL) {
+			warn("The interval between Audio Rate Control messages was greater\n");
+			warn("than the Maxiumum Audio Rate Message Interval (2s).\n");
+		}
+	}
+}
+
 static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
 {
 	__u8 to = cec_msg_destination(&msg);
@@ -775,18 +794,27 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
 		return;
 
 
-		/*
-		  Audio Rate Control
-
-		  This is only a basic implementation.
-
-		  TODO: Set Audio Rate shall be sent at least every 2 seconds by
-		  the controlling device. This should be checked and kept track of.
-		*/
+		/* Audio Rate Control */
 
 	case CEC_MSG_SET_AUDIO_RATE:
-		if (node->has_aud_rate)
+		if (!node->has_aud_rate)
+			break;
+
+		switch (msg.msg[2]) {
+		case CEC_OP_AUD_RATE_OFF:
+			aud_rate_msg_interval_check(msg.rx_ts, node->state.last_aud_rate_rx_ts);
+			node->state.last_aud_rate_rx_ts = 0;
+			return;
+		case CEC_OP_AUD_RATE_WIDE_STD:
+		case CEC_OP_AUD_RATE_WIDE_FAST:
+		case CEC_OP_AUD_RATE_WIDE_SLOW:
+		case CEC_OP_AUD_RATE_NARROW_STD:
+		case CEC_OP_AUD_RATE_NARROW_FAST:
+		case CEC_OP_AUD_RATE_NARROW_SLOW:
+			aud_rate_msg_interval_check(msg.rx_ts, node->state.last_aud_rate_rx_ts);
+			node->state.last_aud_rate_rx_ts = msg.rx_ts;
 			return;
+		}
 		break;
 
 
-- 
2.17.1

