Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8FB636BDBE
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 05:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234384AbhD0DbE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Apr 2021 23:31:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234367AbhD0Day (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Apr 2021 23:30:54 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9906C061756
        for <linux-media@vger.kernel.org>; Mon, 26 Apr 2021 20:30:10 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id i190so809998pfc.12
        for <linux-media@vger.kernel.org>; Mon, 26 Apr 2021 20:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=1Vhk+fvx/Xxsu5qVxdZPCOJF8TKkjWm4K8puOuxvgCc=;
        b=Lt+RIK8JAV3h9CyPJ+Uj2tPux8eiMYvgBdPZbrZHlSJ/lAlbZrKwJ+y+ZbruEpJC3e
         02N7PWD7OP0vpewZEkE2Ww9rga0q79EXzcfXh7gxyIPOtzYx32trB07Ljd1qhfVjbzAb
         0SAh9GBc5hGfltw1yh0dQQppM7oMUi8aD6jZbKHPqeuqzkqDE0hF6+3iuuL28jSyZ2I/
         xlJSbUWyWlQPrFQGSlznU4wR18ScwP5IH/LQhBjsbycYlgUiyl9wpnFIGJSosXR5Fd1a
         4AlK5r97RCGEN76WleviZByg4tUcrDaXJSbh4WqIDodmKJyGBE4rVbKvOmRcsR8ZNt/0
         UU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=1Vhk+fvx/Xxsu5qVxdZPCOJF8TKkjWm4K8puOuxvgCc=;
        b=NnJi07foI8mGy1+6W3nu8TXYUOBK7rUou00vS/pUwZEpdAwl9k2qMYA/rH1Ui5Hlwe
         bLy13wh0A+WXZPilbpqe4wNKS0hxeRAzPbOh0ZvTjz0KH9dRi23ype9tJLbcVvHONAaX
         JkZT/qpO4T2SDNnvQHUizqUvyqlbD2n+JjOoM8/IT5lT3QjQDkruJF8U5JI2hAcEF3Bb
         6yQ6wiy1U62ou9uMfSm+9A3tY3se5Ziyg9Rw+0GlOXY3LorjpMWWRYcx7aU/ProgWTQX
         +m4zaWyxh3OYwkGGTyZ6BkJ6NwMwN/wBSTauYX+FbEkN24JasKKByf492L5cVsY0VWaV
         jONg==
X-Gm-Message-State: AOAM531+Nj4Td/88flpMVa2MkwbOjXngX5BAZfVOPhC2YgVgwD4IRviZ
        FPRcwPi+3UObsbYpKHYx7YeVbLo51n6UUA==
X-Google-Smtp-Source: ABdhPJyg0qP0YMUyZtg5+mXsbvdgAPj2IlFP4FqPTOr8iImvGFa1DejPj5fSutbGlUlElmW6pUyxyw==
X-Received: by 2002:a63:5301:: with SMTP id h1mr19487316pgb.109.1619494210222;
        Mon, 26 Apr 2021 20:30:10 -0700 (PDT)
Received: from djbComp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id jx20sm666851pjb.41.2021.04.26.20.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 20:30:09 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v3 2/2] cec-follower: detect the cessation of Audio Rate Control messages
Date:   Mon, 26 Apr 2021 20:29:48 -0700
Message-Id: <0d36c30492c0136ea3b00985d91aa4ff1bef4b91.1619492378.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1619492378.git.deborahbrouwer3563@gmail.com>
References: <cover.1619492378.git.deborahbrouwer3563@gmail.com>
In-Reply-To: <cover.1619492378.git.deborahbrouwer3563@gmail.com>
References: <cover.1619492378.git.deborahbrouwer3563@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the controlling device simply stops sending audio rate messages, give
the cec-follower the ability to detect that it has not received an audio
rate message within 2 seconds as required.  The cec-follower will quit the
audio rate controlled mode. Eliminate the need to measure an interval
between two audio rate messages.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
 utils/cec-follower/cec-processing.cpp | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index fcb55df2..c76ec54e 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -233,18 +233,21 @@ static __u8 current_power_state(struct node *node)
 	return CEC_OP_POWER_STATUS_TO_STANDBY;
 }
 
-static void aud_rate_msg_interval_check(__u64 ts_new, __u64 ts_old)
+static void aud_rate_msg_interval_check(struct node *node, __u64 ts_new)
 {
 	/*
-	 * The interval between messages is not relevant if this is the
-	 * first audio rate control message or if the previous message
-	 * turned off the audio rate control.
+	 * The interval since the last audio rate message is only relevant
+	 * if the Source is currently in audio rate controlled mode
+	 * (i.e. state.last_aud_rate_rx_ts != 0).
 	 */
+	__u64 ts_old = node->state.last_aud_rate_rx_ts;
+
 	if (ts_old) {
 		__u64 interval = ts_new - ts_old;
+
 		if (interval > MAX_AUD_RATE_MSG_INTERVAL_NS) {
-			warn("The interval between Audio Rate Control messages was greater\n");
-			warn("than the Maxiumum Audio Rate Message Interval (2s).\n");
+			warn("The interval since the last Audio Rate Control message was > 2s.\n");
+			node->state.last_aud_rate_rx_ts = 0;
 		}
 	}
 }
@@ -802,7 +805,7 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
 
 		switch (msg.msg[2]) {
 		case CEC_OP_AUD_RATE_OFF:
-			aud_rate_msg_interval_check(msg.rx_ts, node->state.last_aud_rate_rx_ts);
+			aud_rate_msg_interval_check(node, msg.rx_ts);
 			node->state.last_aud_rate_rx_ts = 0;
 			return;
 		case CEC_OP_AUD_RATE_WIDE_STD:
@@ -811,7 +814,7 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
 		case CEC_OP_AUD_RATE_NARROW_STD:
 		case CEC_OP_AUD_RATE_NARROW_FAST:
 		case CEC_OP_AUD_RATE_NARROW_SLOW:
-			aud_rate_msg_interval_check(msg.rx_ts, node->state.last_aud_rate_rx_ts);
+			aud_rate_msg_interval_check(node, msg.rx_ts);
 			node->state.last_aud_rate_rx_ts = msg.rx_ts;
 			return;
 		default:
@@ -1033,6 +1036,9 @@ void testProcessing(struct node *node, bool wallclock)
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

