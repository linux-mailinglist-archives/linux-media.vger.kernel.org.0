Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 852DB36A4F6
	for <lists+linux-media@lfdr.de>; Sun, 25 Apr 2021 07:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbhDYFrH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Apr 2021 01:47:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbhDYFrH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Apr 2021 01:47:07 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17E51C061574
        for <linux-media@vger.kernel.org>; Sat, 24 Apr 2021 22:46:28 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id u14-20020a17090a1f0eb029014e38011b09so3441122pja.5
        for <linux-media@vger.kernel.org>; Sat, 24 Apr 2021 22:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=9O0xRZnKs7aJBNieao+VkpuPy0Ae4mhPSP9H0CH2CSs=;
        b=fhAmNiBxX2qqI20ZBaLJSQH4w0AURGrg+QN2VUIjMSAqdy6xT6sYP9pjp8GXRKb00k
         zrILN4xz9Byn0ezjGRt1gN/sDVcjfU3u3SpNijdmPfkX8gLE+bimD+L/0kBdfhwpFXbs
         xXz/ekuoFlXoLE1rjQzhPLxJrZ7FpdNeBpwUcgRNdZ21deQjQF8yW9EP59J3Vf0+341G
         I2jTDQXdDOKC1a/JvdgfCkgg9EOvFovWZKXltEkdy1bzPF6/SvyGirrZYDaOSsUHTnD+
         eVGgiWF68BTw5b4hCEstuihSKKtDVQv8iOx9ZuPAhO6oka/mTk0xekV4WJC7DtonHtNo
         fVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=9O0xRZnKs7aJBNieao+VkpuPy0Ae4mhPSP9H0CH2CSs=;
        b=LF78OBMky7ZwYjMcxvIO1Fa5g5llHJdN1Ycpyj+tff5f4n1l/zl1eYxndkss2QksQI
         UQQn8vjuHf3R9eDr24eCHaxIXeiecdsByyUp9koxHBOW/r0seQX9ClyHvf23wmZqWqWL
         OlXrxUvKqkPQnZ0JhQsU7mqc0pcwSwqgUP/fFnhm13oQgPIOxCQQFegJuSBMwsGz0gq1
         X0CvV21qyii9rnDBGC4kCoGgAQOjwsKTmXKoRmRjjTn5wcW15P81dumUBsf+D7sKx6+b
         Gr80YfQ+mqOXifuoJpIYnqGTF2APkF4CWOEY83RN0at4FukualXJ16KfS6EC37YZadYb
         H5KQ==
X-Gm-Message-State: AOAM5305fGvoPMAaDEzEVCk2bchnuc5YJnTgLqf8YqG6/ieyrDgl6DYQ
        KiBvPE7NgflMVYX6wpHWaPt2L725zpapHw==
X-Google-Smtp-Source: ABdhPJwvv/u6rr8ESyGam4My5vCT9sdBxaakzSTit58aSje4cDcH+YxxMHDbkBHmTPqLLqt4H+f4Lg==
X-Received: by 2002:a17:90a:ad84:: with SMTP id s4mr6563367pjq.162.1619329587557;
        Sat, 24 Apr 2021 22:46:27 -0700 (PDT)
Received: from djbComp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id q25sm7823251pfs.152.2021.04.24.22.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 22:46:27 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH] cec-follower: detect the cessation of Audio Rate Control messages
Date:   Sat, 24 Apr 2021 22:46:14 -0700
Message-Id: <20210425054614.27822-1-deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.17.1
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
 utils/cec-follower/cec-processing.cpp | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index 93db4059..111b3604 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -233,18 +233,20 @@ static __u8 current_power_state(struct node *node)
 	return CEC_OP_POWER_STATUS_TO_STANDBY;
 }
 
-static void aud_rate_msg_interval_check(__u64 ts_new, __u64 ts_old)
+static void aud_rate_msg_interval_check(__u64 ts_new, struct node *node)
 {
 	/*
-	 * The interval between messages is not relevant if this is the
-	 * first audio rate control message or if the previous message
-	 * turned off the audio rate control.
+	 * The interval since the last audio rate message is not relevant
+	 * unless the Source is currently in audio rate controlled mode.
 	 */
+	__u64 ts_old = node->state.last_aud_rate_rx_ts;
 	if (ts_old) {
 		unsigned interval = (ts_new - ts_old) / 1000000000;
 		if (interval > MAX_AUD_RATE_MSG_INTERVAL) {
-			warn("The interval between Audio Rate Control messages was greater\n");
+			warn("The interval since the last Audio Rate Control message was greater\n");
 			warn("than the Maxiumum Audio Rate Message Interval (2s).\n");
+			warn("Turning off audio rate control.\n");
+			node->state.last_aud_rate_rx_ts = 0;
 		}
 	}
 }
@@ -802,7 +804,6 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
 
 		switch (msg.msg[2]) {
 		case CEC_OP_AUD_RATE_OFF:
-			aud_rate_msg_interval_check(msg.rx_ts, node->state.last_aud_rate_rx_ts);
 			node->state.last_aud_rate_rx_ts = 0;
 			return;
 		case CEC_OP_AUD_RATE_WIDE_STD:
@@ -811,7 +812,6 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
 		case CEC_OP_AUD_RATE_NARROW_STD:
 		case CEC_OP_AUD_RATE_NARROW_FAST:
 		case CEC_OP_AUD_RATE_NARROW_SLOW:
-			aud_rate_msg_interval_check(msg.rx_ts, node->state.last_aud_rate_rx_ts);
 			node->state.last_aud_rate_rx_ts = msg.rx_ts;
 			return;
 		default:
@@ -1033,6 +1033,9 @@ void testProcessing(struct node *node, bool wallclock)
 				node->state.rc_state = NOPRESS;
 			}
 		}
+
+		if (node->has_aud_rate)
+			aud_rate_msg_interval_check(ts_now, node);
 	}
 	mode = CEC_MODE_INITIATOR;
 	doioctl(node, CEC_S_MODE, &mode);
-- 
2.17.1

