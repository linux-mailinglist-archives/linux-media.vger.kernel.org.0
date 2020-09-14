Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFB662687D5
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 11:04:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726242AbgINJDj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 05:03:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:37752 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726205AbgINJDc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 05:03:32 -0400
Received: from mail.kernel.org (ip5f5ad5d8.dynamic.kabel-deutschland.de [95.90.213.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D026122204;
        Mon, 14 Sep 2020 09:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600074212;
        bh=Zw9W1+amdegwYUXpErBc4E+AxdH3bMvY1OFaDGkbQ00=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WXL9tfmwiy0chbrtPHG0uJ6XcHylhfF0jSwByKqMF936C20EzLEjujlqlMyGODmDL
         drjFz1az2uNp7OLUkqhbCat6Wsst4PFY3LZd54jlSrvbtDYXA6vWw+CIg1U5wYxFXN
         ewT6qN4KiV4TsGfBfKdQWPgU6XZvU+njrIvmclVI=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kHkOW-002dzq-8Z; Mon, 14 Sep 2020 11:03:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH RFC 11/11] media: vidtv: increment byte and block counters
Date:   Mon, 14 Sep 2020 11:03:26 +0200
Message-Id: <20aa6d0916d8475bb57539743963bba97d929eb9.1600073975.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1600073975.git.mchehab+huawei@kernel.org>
References: <cover.1600073975.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for incrementing DVBv5 stats for block counters
and post/pre BER byte counts.

For now, the errors won't be incremented yet.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_bridge.c |  2 +-
 drivers/media/test-drivers/vidtv/vidtv_bridge.h |  3 +++
 drivers/media/test-drivers/vidtv/vidtv_mux.c    | 16 +++++++++++++++-
 drivers/media/test-drivers/vidtv/vidtv_mux.h    |  6 +++++-
 4 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index cb32f82f88f9..108e7937e9c1 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -172,7 +172,7 @@ static int vidtv_start_streaming(struct vidtv_dvb *dvb)
 	mux_args.priv                        = dvb;
 
 	dvb->streaming = true;
-	dvb->mux = vidtv_mux_init(dev, mux_args);
+	dvb->mux = vidtv_mux_init(dvb->fe[0], dev, mux_args);
 	vidtv_mux_start_thread(dvb->mux);
 
 	dev_dbg_ratelimited(dev, "Started streaming\n");
diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.h b/drivers/media/test-drivers/vidtv/vidtv_bridge.h
index fd65f9838b10..78fe8472fa37 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.h
@@ -12,6 +12,9 @@
 #ifndef VIDTV_BRIDGE_H
 #define VIDTV_BRIDGE_H
 
+/*
+ * For now, only one frontend is supported. See vidtv_start_streaming()
+ */
 #define NUM_FE 1
 
 #include <linux/i2c.h>
diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.c b/drivers/media/test-drivers/vidtv/vidtv_mux.c
index d1db9dc6dc89..5d1a275d504b 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_mux.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.c
@@ -381,6 +381,7 @@ static void vidtv_mux_tick(struct work_struct *work)
 	struct vidtv_mux *m = container_of(work,
 					   struct vidtv_mux,
 					   mpeg_thread);
+	struct dtv_frontend_properties *c = &m->fe->dtv_property_cache;
 	u32 nbytes;
 	u32 npkts;
 
@@ -411,6 +412,17 @@ static void vidtv_mux_tick(struct work_struct *work)
 
 		vidtv_mux_clear(m);
 
+		/*
+		 * Update bytes and packet counts at DVBv5 stats
+		 *
+		 * For now, both pre and post bit counts are identical,
+		 * but post BER count can be lower than pre BER, if the error
+		 * correction logic discards packages.
+		 */
+		c->pre_bit_count.stat[0].uvalue = nbytes;
+		c->post_bit_count.stat[0].uvalue = nbytes;
+		c->block_count.stat[0].uvalue += npkts;
+
 		usleep_range(VIDTV_SLEEP_USECS, VIDTV_MAX_SLEEP_USECS);
 	}
 }
@@ -435,12 +447,14 @@ void vidtv_mux_stop_thread(struct vidtv_mux *m)
 	}
 }
 
-struct vidtv_mux *vidtv_mux_init(struct device *dev,
+struct vidtv_mux *vidtv_mux_init(struct dvb_frontend *fe,
+				 struct device *dev,
 				 struct vidtv_mux_init_args args)
 {
 	struct vidtv_mux *m = kzalloc(sizeof(*m), GFP_KERNEL);
 
 	m->dev = dev;
+	m->fe = fe;
 	m->timing.pcr_period_usecs = args.pcr_period_usecs;
 	m->timing.si_period_usecs  = args.si_period_usecs;
 
diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.h b/drivers/media/test-drivers/vidtv/vidtv_mux.h
index 67de85fd50aa..2caa60623e97 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_mux.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.h
@@ -18,6 +18,8 @@
 #include <linux/types.h>
 #include <linux/hashtable.h>
 #include <linux/workqueue.h>
+#include <media/dvb_frontend.h>
+
 #include "vidtv_psi.h"
 
 /**
@@ -100,6 +102,7 @@ struct vidtv_mux_pid_ctx {
  * @priv: Private data.
  */
 struct vidtv_mux {
+	struct dvb_frontend *fe;
 	struct device *dev;
 
 	struct vidtv_mux_timing timing;
@@ -153,7 +156,8 @@ struct vidtv_mux_init_args {
 	void *priv;
 };
 
-struct vidtv_mux *vidtv_mux_init(struct device *dev,
+struct vidtv_mux *vidtv_mux_init(struct dvb_frontend *fe,
+				 struct device *dev,
 				 struct vidtv_mux_init_args args);
 void vidtv_mux_destroy(struct vidtv_mux *m);
 
-- 
2.26.2

