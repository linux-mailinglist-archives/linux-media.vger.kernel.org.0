Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEAD936A9C8
	for <lists+linux-media@lfdr.de>; Mon, 26 Apr 2021 00:54:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231422AbhDYWzP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Apr 2021 18:55:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231441AbhDYWzP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Apr 2021 18:55:15 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B67AC061574
        for <linux-media@vger.kernel.org>; Sun, 25 Apr 2021 15:54:34 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id q10so38852290pgj.2
        for <linux-media@vger.kernel.org>; Sun, 25 Apr 2021 15:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=+Pib14yGX41Z5j4qi52XiY8kNCRo5YcvC2plJhDcbf8=;
        b=p7jh8GTHORWGSRdm4UqTzcZiVQ7NsRjRqPfALZoAU9j7OxJRISix9DFNmis6GVB3ty
         2yu8ytf3rDhbZ+sZI6ZEHxsbTKvJvGtcRvDT0Ztw5nEK0kjHUYiWAENFFIcfs4DxJHE4
         pZTEPd/LVNt8wyUyvhJJ35Hgg7JvmRAjZpVRC8SmR5oHJbf05i2Qoa+4jK8d+5myBhyA
         GpRElpCE1ecDcjfhIk1d+97aHAsc56tnAnY8tx4MHhUISFb/zO6B6axKN5JWYR3aDCKu
         C3mIBoiucFPmvxn1Yv/TDQ+IRaOXDKCaKDRmfj1X9YilC7+75eTLQEv58LrS6oi2Vzok
         L70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=+Pib14yGX41Z5j4qi52XiY8kNCRo5YcvC2plJhDcbf8=;
        b=XBw3fUSn2P1f4DnsE3mR1NK7otXlSZ69SDZzlz8tvgz6w6+T88evg0vRRUOOLmcWWi
         lopYRwZXPNyRRDvWIYWWV+H/7mEzeC6E23yYIj+daTndP10dBkh0Nffce7SIRf4+IB12
         juHcvA3N+Ai3ueZTVBFTk8oMew+uIHzOVDCxG0is7Qg55hTVPRrGBph94XrnCHGgwrDh
         fvXgKnDC/kp0JV7wd0Z+rFFLRhQHemZjrq/xY8V12mL08mup3EFcahbllvofSo7It18/
         tFyvF3B+xm5Idv9iIgn/JlY73k52vAt3VraNgxFUA69yiZ43P8Uqde+skfQTDP13SNg6
         YjXg==
X-Gm-Message-State: AOAM53104vSR83bxugC0tFIwg9BVj45Y+jv2dp9FCwjJ7GNWo+1WWvT8
        AKq7k7W75z7I20IxjwU8aunnucOP4oxL3w==
X-Google-Smtp-Source: ABdhPJzidb/IWqAL7VDUdGW0x6jD6HmzYW10WsDa0al21U9e2MkzXWyF6VH2nxrDxVEipB2+W0jJcg==
X-Received: by 2002:a62:7592:0:b029:254:ebcd:802b with SMTP id q140-20020a6275920000b0290254ebcd802bmr14556049pfc.41.1619391274267;
        Sun, 25 Apr 2021 15:54:34 -0700 (PDT)
Received: from djbComp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id s22sm9504207pfe.150.2021.04.25.15.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Apr 2021 15:54:33 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v2 2/2] cec-follower: detect the cessation of Audio Rate Control messages
Date:   Sun, 25 Apr 2021 15:54:07 -0700
Message-Id: <03c855c4a2072a4a174415198e2e44932af75fcd.1619389023.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1619389023.git.deborahbrouwer3563@gmail.com>
References: <cover.1619389023.git.deborahbrouwer3563@gmail.com>
In-Reply-To: <cover.1619389023.git.deborahbrouwer3563@gmail.com>
References: <cover.1619389023.git.deborahbrouwer3563@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the controlling device simply stops sending audio rate messages, give
the cec-follower the ability to detect that it has not received an audio
rate message within 2 seconds as required.  The cec-follower will quit the
audio rate controlled mode.  Eliminate the need to measure an interval
between two audio rate messages.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
 utils/cec-follower/cec-processing.cpp | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index 243c9d09..dd6fd05c 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -233,19 +233,22 @@ static __u8 current_power_state(struct node *node)
 	return CEC_OP_POWER_STATUS_TO_STANDBY;
 }
 
-static void aud_rate_msg_interval_check(__u64 ts_new, __u64 ts_old)
+static void aud_rate_msg_interval_check(struct node *node, __u64 ts_new)
 {
 	/*
-	 * The interval between messages is not relevant if this is the
-	 * first audio rate control message or if the previous message
-	 * turned off the audio rate control.
+	 * The interval since the last audio rate message is not relevant
+	 * unless the Source is currently in audio rate controlled mode.
 	 */
+	__u64 ts_old = node->state.last_aud_rate_rx_ts;
+
 	if (ts_old) {
 		__u64 interval = ts_new - ts_old;
 
 		if (interval > MAX_AUD_RATE_MSG_INTERVAL) {
-			warn("The interval between Audio Rate Control messages was greater\n");
+			warn("The interval since the last Audio Rate Control message was greater\n");
 			warn("than the Maxiumum Audio Rate Message Interval (2s).\n");
+			warn("Turning off audio rate control.\n");
+			node->state.last_aud_rate_rx_ts = 0;
 		}
 	}
 }
@@ -803,7 +806,7 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
 
 		switch (msg.msg[2]) {
 		case CEC_OP_AUD_RATE_OFF:
-			aud_rate_msg_interval_check(msg.rx_ts, node->state.last_aud_rate_rx_ts);
+			aud_rate_msg_interval_check(node, msg.rx_ts);
 			node->state.last_aud_rate_rx_ts = 0;
 			return;
 		case CEC_OP_AUD_RATE_WIDE_STD:
@@ -812,7 +815,7 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
 		case CEC_OP_AUD_RATE_NARROW_STD:
 		case CEC_OP_AUD_RATE_NARROW_FAST:
 		case CEC_OP_AUD_RATE_NARROW_SLOW:
-			aud_rate_msg_interval_check(msg.rx_ts, node->state.last_aud_rate_rx_ts);
+			aud_rate_msg_interval_check(node, msg.rx_ts);
 			node->state.last_aud_rate_rx_ts = msg.rx_ts;
 			return;
 		default:
@@ -1034,6 +1037,9 @@ void testProcessing(struct node *node, bool wallclock)
 				node->state.rc_state = NOPRESS;
 			}
 		}
+
+		if (node->has_aud_rate)
+			aud_rate_msg_interval_check(node, ts_now);
 	}
 	mode = CEC_MODE_INITIATOR;
 	doioctl(node, CEC_S_MODE, &mode);
-- 
2.17.1

