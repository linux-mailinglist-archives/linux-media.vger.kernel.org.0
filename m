Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBCF026A06B
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 10:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbgIOIKC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 04:10:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:60592 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726178AbgIOIJS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 04:09:18 -0400
Received: from mail.kernel.org (ip5f5ad5a5.dynamic.kabel-deutschland.de [95.90.213.165])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1E2B520771;
        Tue, 15 Sep 2020 08:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600157357;
        bh=ltBu5LTP2ouZsfNOjIsOf5oJI8CRy/Vd/boJklZqc1E=;
        h=From:To:Cc:Subject:Date:From;
        b=KpNUSgv+DVaiKKqkX3/QUchuEz1+LAycy2/HIMcqXnvKiZmDZJrS5AXD4s8ei93VU
         6GKYokDhRhPylzvZxna8VoqWJYjqRck5lHYbTcApQ1WEP/b7OkOysLP8HLvQcSSz+X
         +/+jcC9Y0RBF+y9YM/KD0au9f8Ysvqy431gVU+xU=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kI61a-004ZXx-F5; Tue, 15 Sep 2020 10:09:14 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH] media: vidtv: add a poor guy's simulation to preBER stats
Date:   Tue, 15 Sep 2020 10:09:13 +0200
Message-Id: <3123a37e472a0d2067326e3ab5172562aab8389a.1600157351.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A typical digital TV stream has errors that are corrected
by Viterbi. While the error rate after Viterbi is usually
zero, with good signals, there are some chances of getting
random errors before that, which are auto-corrected by
the error code algorithm.

Add a poor guy's implementation that would show some
noise at the pre-BER part of the demod.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_mux.c | 23 ++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.c b/drivers/media/test-drivers/vidtv/vidtv_mux.c
index 5d1a275d504b..26a742c95c76 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_mux.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.c
@@ -21,6 +21,7 @@
 #include <linux/delay.h>
 #include <linux/vmalloc.h>
 #include <linux/math64.h>
+
 #include "vidtv_mux.h"
 #include "vidtv_ts.h"
 #include "vidtv_pes.h"
@@ -376,6 +377,7 @@ static void vidtv_mux_clear(struct vidtv_mux *m)
 	m->mux_buf_offset = 0;
 }
 
+#define ERR_RATE 10000000
 static void vidtv_mux_tick(struct work_struct *work)
 {
 	struct vidtv_mux *m = container_of(work,
@@ -384,6 +386,7 @@ static void vidtv_mux_tick(struct work_struct *work)
 	struct dtv_frontend_properties *c = &m->fe->dtv_property_cache;
 	u32 nbytes;
 	u32 npkts;
+	u32 tot_bits = 0;
 
 	while (m->streaming) {
 		nbytes = 0;
@@ -419,10 +422,26 @@ static void vidtv_mux_tick(struct work_struct *work)
 		 * but post BER count can be lower than pre BER, if the error
 		 * correction logic discards packages.
 		 */
-		c->pre_bit_count.stat[0].uvalue = nbytes;
-		c->post_bit_count.stat[0].uvalue = nbytes;
+		c->pre_bit_count.stat[0].uvalue = nbytes * 8;
+		c->post_bit_count.stat[0].uvalue = nbytes * 8;
 		c->block_count.stat[0].uvalue += npkts;
 
+		/*
+		 * Even without any visible errors for the user, the pre-BER
+		 * stats usually have an error range up to 1E-6. So,
+		 * add some random error increment count to it.
+		 *
+		 * Please notice that this is a poor guy's implementation,
+		 * as it will produce one corrected bit error every time
+		 * ceil(total bytes / ERR_RATE) is incremented, without
+		 * any sort of (pseudo-)randomness.
+		 */
+		tot_bits += nbytes * 8;
+		if (tot_bits > ERR_RATE) {
+			c->pre_bit_error.stat[0].uvalue++;
+			tot_bits -= ERR_RATE;
+		}
+
 		usleep_range(VIDTV_SLEEP_USECS, VIDTV_MAX_SLEEP_USECS);
 	}
 }
-- 
2.26.2

