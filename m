Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 205DA26AB77
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 20:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727737AbgIOSF4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 14:05:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727733AbgIOSFY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 14:05:24 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC879C06178A;
        Tue, 15 Sep 2020 11:05:23 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id q63so5230962qkf.3;
        Tue, 15 Sep 2020 11:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZLmSNoQM7+jjlnQIow8a+BqWm7XXJW35Z9CfcXxfl/4=;
        b=hav9Nr1QbVJ3BlehRb/RqjACjFYrsIPLG1+I2UOClKfAp5+7ngG3IJmvKwICB5lzdq
         WGV93nHyISl5cDRkAVdXhbwRwGpn0BDD6iIE1RISAzntc0zLsJhLKhSGksmHGxQxM0Nq
         a7JAAzV0h50v//u8XuyeHoX0jmJ1pcffrlRm4cyLKojSIGPU8TrMQvCVT+9MIrzCWzdC
         LaqUwVU6TF9DYqE1qTtH1/PMOSPjsMueBhLyxdfL5muRWfGnTfCN9j4Vf+Pd0vcdCBm9
         vikEFqlZLseCYyLftc/+1VK3YrI36DtDcSwHB5DelgZyFAU2ssYsKOIMeff/y6H+0BUV
         q2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZLmSNoQM7+jjlnQIow8a+BqWm7XXJW35Z9CfcXxfl/4=;
        b=ct04N1e4vHl9nnvjy1h0wCgV1Ep1dMExenl3ycqxtlE31je7TMN1Cz4rF8UiuD4cet
         LxXkeMeXb3sY3vREQGmLIbzCmKDonQ+HjHRRC4MrI9I5qfGj325VqyGKWu5cPPOFAYVA
         d2Uqz/+ay1Zw5dKU00p5YquwNB+cZjUPj/v96rvEQe0NUW2j8LctuemKj30BDtp9CbQ0
         5H89Bq6x69/9nDIKYTsi64h5iYKbc2rY8mjRCRzS9mRMjhqa6VVzC3wrAuuml1rv5huU
         vhwFwsx3Mb20Yf4oYceRCEfOIfKqjJrLKm4dCv1yAIApkmskdzZ83JYjfhVpSmRadhxl
         xSKw==
X-Gm-Message-State: AOAM5309NwS0QPo7OhGWgg/Tao2ycDz8piF0m6a+dfzxPFL092lrm3+e
        C7h55pBaM62/ADXQdcAgYFY=
X-Google-Smtp-Source: ABdhPJwwaZSFKtq7HxhR0p4tMkY/hLtYbTyG5VeqvlQKvebKtBQ2ObXdgMNFu+CfVTX9eKpx83hzUw==
X-Received: by 2002:a05:620a:2225:: with SMTP id n5mr18523930qkh.171.1600193122843;
        Tue, 15 Sep 2020 11:05:22 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id u66sm18969306qka.136.2020.09.15.11.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 11:05:22 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org
Cc:     "Daniel W . S . Almeida" <dwlsalmeida@gmail.com>,
        geert@linux-m68k.org, r.verdejo@samsung.com,
        linux-media@vger.kernel.org, nicolas@ndufresne.ca,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org, rdunlap@infradead.org
Subject: [PATCH] media: vidtv: fix build on 32bit architectures
Date:   Tue, 15 Sep 2020 15:05:09 -0300
Message-Id: <20200915180509.2661572-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

Fix the following error for builds on 32bit architectures:

ERROR: modpost: "__udivdi3"
[drivers/media/test-drivers/vidtv/dvb-vidtv-bridge.ko] undefined!

Which is due to 64bit divisions that did not go through the helpers
in linux/math64.h

As vidtv_mux_check_mux_rate was not operational in its current form,
drop the entire function  while it is not fixed properly.

For now, call vidtv_mux_pad_with_nulls with a constant number of packets
to avoid warnings due to unused functions when building this driver.

Fixes: f90cf6079bf67988 ("media: vidtv: add a bridge driver")
Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/test-drivers/vidtv/vidtv_mux.c  | 34 +------------------
 .../media/test-drivers/vidtv/vidtv_s302m.c    |  4 +--
 2 files changed, 3 insertions(+), 35 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.c b/drivers/media/test-drivers/vidtv/vidtv_mux.c
index 5d1a275d504b..6e402a880fdc 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_mux.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.c
@@ -336,38 +336,6 @@ static u32 vidtv_mux_pad_with_nulls(struct vidtv_mux *m, u32 npkts)
 	return nbytes;
 }
 
-static u32 vidtv_mux_check_mux_rate(struct vidtv_mux *m)
-{
-	/*
-	 * attempt to maintain a constant mux rate, padding with null packets
-	 * if needed
-	 */
-
-	u32 nbytes = 0;  /* the number of bytes written by this function */
-
-	u64 nbytes_expected; /* the number of bytes we should have written */
-	u64 nbytes_streamed; /* the number of bytes we actually wrote */
-	u32 num_null_pkts; /* number of null packets to bridge the gap */
-
-	u64 elapsed_time_msecs = jiffies_to_usecs(m->timing.current_jiffies -
-						  m->timing.past_jiffies);
-
-	elapsed_time_msecs = min(elapsed_time_msecs, (u64)VIDTV_MAX_SLEEP_USECS / 1000);
-	nbytes_expected = div64_u64(m->mux_rate_kbytes_sec * 1000, MSEC_PER_SEC);
-	nbytes_expected *= elapsed_time_msecs;
-
-	nbytes_streamed = m->mux_buf_offset;
-
-	if (nbytes_streamed < nbytes_expected) {
-		/* can't write half a packet: roundup to a 188 multiple */
-		nbytes_expected  = roundup(nbytes_expected - nbytes_streamed, TS_PACKET_LEN);
-		num_null_pkts    = nbytes_expected / TS_PACKET_LEN;
-		nbytes          += vidtv_mux_pad_with_nulls(m, num_null_pkts);
-	}
-
-	return nbytes;
-}
-
 static void vidtv_mux_clear(struct vidtv_mux *m)
 {
 	/* clear the packets currently in the mux */
@@ -397,7 +365,7 @@ static void vidtv_mux_tick(struct work_struct *work)
 			nbytes += vidtv_mux_push_si(m);
 
 		nbytes += vidtv_mux_poll_encoders(m);
-		nbytes += vidtv_mux_check_mux_rate(m);
+		nbytes += vidtv_mux_pad_with_nulls(m, 256);
 
 		npkts = nbytes / TS_PACKET_LEN;
 
diff --git a/drivers/media/test-drivers/vidtv/vidtv_s302m.c b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
index f8049cdf564a..e3290facf57b 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_s302m.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
@@ -285,12 +285,12 @@ static void vidtv_s302m_compute_pts(struct vidtv_encoder *e)
 {
 	u64 count = e->sample_count;
 	struct vidtv_access_unit *au = e->access_units;
+	u32 duration = CLOCK_UNIT_90KHZ / e->sampling_rate_hz;
 
 	while (au) {
 		count += au->num_samples;
 
-		au->pts = count *
-			  CLOCK_UNIT_90KHZ / e->sampling_rate_hz;
+		au->pts = count * duration;
 
 		au = au->next;
 	}
-- 
2.28.0

