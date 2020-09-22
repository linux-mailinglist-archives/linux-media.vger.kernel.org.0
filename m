Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2015D273E3A
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 11:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbgIVJMC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 05:12:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:60554 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726422AbgIVJMC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 05:12:02 -0400
Received: from mail.kernel.org (ip5f5ad5bc.dynamic.kabel-deutschland.de [95.90.213.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4410920715;
        Tue, 22 Sep 2020 09:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600765921;
        bh=p7cAdNofsq6jZcGRc61+8kKuN3HoExxl9Kj84k4DlSc=;
        h=From:To:Cc:Subject:Date:From;
        b=jMiiRDU2bH83mEZr59h8M/+E83qo5gLFsj+dyUDW7F+TXqW3zkdZ+Tuq5qq5HiDyq
         6LoP2oWOQ+cr4FrgXyLDb8N+OYlVRhd6ingB3nS+2Kb3/i0/NuAfOQy27PU4fa7A+M
         HOKuvBMzm1n0E/UWwOPjQQ9n3tPOc6BGFVSEOaEQ=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kKeL9-000uV2-0M; Tue, 22 Sep 2020 11:11:59 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 1/2] media: vidtv: avoid data copy when initializing the multiplexer
Date:   Tue, 22 Sep 2020 11:11:57 +0200
Message-Id: <e4e165fab8a0f0f4a61ca3f4d35dffc97a238d1e.1600765915.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Initialize the fields of the arguments directly when
declaring it, and pass the args as a pointer, instead of
copying them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/test-drivers/vidtv/vidtv_bridge.c   | 24 ++++++++++---------
 drivers/media/test-drivers/vidtv/vidtv_mux.c  | 24 +++++++++----------
 drivers/media/test-drivers/vidtv/vidtv_mux.h  |  2 +-
 3 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index b76c1c1ff7c0..46655e34a332 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -159,7 +159,14 @@ vidtv_bridge_on_new_pkts_avail(void *priv, u8 *buf, u32 npkts)
 
 static int vidtv_start_streaming(struct vidtv_dvb *dvb)
 {
-	struct vidtv_mux_init_args mux_args = {0};
+	struct vidtv_mux_init_args mux_args = {
+		.mux_rate_kbytes_sec         = mux_rate_kbytes_sec,
+		.on_new_packets_available_cb = vidtv_bridge_on_new_pkts_avail,
+		.pcr_period_usecs            = pcr_period_msec * USEC_PER_MSEC,
+		.si_period_usecs             = si_period_msec * USEC_PER_MSEC,
+		.pcr_pid                     = pcr_pid,
+		.transport_stream_id         = VIDTV_DEFAULT_TS_ID,
+	};
 	struct device *dev = &dvb->pdev->dev;
 	u32 mux_buf_sz;
 
@@ -168,19 +175,14 @@ static int vidtv_start_streaming(struct vidtv_dvb *dvb)
 		return 0;
 	}
 
-	mux_buf_sz = (mux_buf_sz_pkts) ? mux_buf_sz_pkts : vidtv_bridge_mux_buf_sz_for_mux_rate();
+	mux_buf_sz = (mux_buf_sz_pkts) ? mux_buf_sz_pkts :
+					 vidtv_bridge_mux_buf_sz_for_mux_rate();
 
-	mux_args.mux_rate_kbytes_sec         = mux_rate_kbytes_sec;
-	mux_args.on_new_packets_available_cb = vidtv_bridge_on_new_pkts_avail;
-	mux_args.mux_buf_sz                  = mux_buf_sz;
-	mux_args.pcr_period_usecs            = pcr_period_msec * 1000;
-	mux_args.si_period_usecs             = si_period_msec * 1000;
-	mux_args.pcr_pid                     = pcr_pid;
-	mux_args.transport_stream_id         = VIDTV_DEFAULT_TS_ID;
-	mux_args.priv                        = dvb;
+	mux_args.mux_buf_sz  = mux_buf_sz;
+	mux_args.priv = dvb;
 
 	dvb->streaming = true;
-	dvb->mux = vidtv_mux_init(dvb->fe[0], dev, mux_args);
+	dvb->mux = vidtv_mux_init(dvb->fe[0], dev, &mux_args);
 	if (!dvb->mux)
 		return -ENOMEM;
 	vidtv_mux_start_thread(dvb->mux);
diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.c b/drivers/media/test-drivers/vidtv/vidtv_mux.c
index 9086edd45252..6127e9ff71a1 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_mux.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.c
@@ -434,7 +434,7 @@ void vidtv_mux_stop_thread(struct vidtv_mux *m)
 
 struct vidtv_mux *vidtv_mux_init(struct dvb_frontend *fe,
 				 struct device *dev,
-				 struct vidtv_mux_init_args args)
+				 struct vidtv_mux_init_args *args)
 {
 	struct vidtv_mux *m;
 
@@ -444,26 +444,26 @@ struct vidtv_mux *vidtv_mux_init(struct dvb_frontend *fe,
 
 	m->dev = dev;
 	m->fe = fe;
-	m->timing.pcr_period_usecs = args.pcr_period_usecs;
-	m->timing.si_period_usecs  = args.si_period_usecs;
+	m->timing.pcr_period_usecs = args->pcr_period_usecs;
+	m->timing.si_period_usecs  = args->si_period_usecs;
 
-	m->mux_rate_kbytes_sec = args.mux_rate_kbytes_sec;
+	m->mux_rate_kbytes_sec = args->mux_rate_kbytes_sec;
 
-	m->on_new_packets_available_cb = args.on_new_packets_available_cb;
+	m->on_new_packets_available_cb = args->on_new_packets_available_cb;
 
-	m->mux_buf = vzalloc(args.mux_buf_sz);
+	m->mux_buf = vzalloc(args->mux_buf_sz);
 	if (!m->mux_buf)
 		goto free_mux;
 
-	m->mux_buf_sz = args.mux_buf_sz;
+	m->mux_buf_sz = args->mux_buf_sz;
 
-	m->pcr_pid = args.pcr_pid;
-	m->transport_stream_id = args.transport_stream_id;
-	m->priv = args.priv;
+	m->pcr_pid = args->pcr_pid;
+	m->transport_stream_id = args->transport_stream_id;
+	m->priv = args->priv;
 	m->timing.current_jiffies = get_jiffies_64();
 
-	if (args.channels)
-		m->channels = args.channels;
+	if (args->channels)
+		m->channels = args->channels;
 	else
 		if (vidtv_channels_init(m) < 0)
 			goto free_mux_buf;
diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.h b/drivers/media/test-drivers/vidtv/vidtv_mux.h
index 08138c80398a..52d79e3bbc31 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_mux.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.h
@@ -159,7 +159,7 @@ struct vidtv_mux_init_args {
 
 struct vidtv_mux *vidtv_mux_init(struct dvb_frontend *fe,
 				 struct device *dev,
-				 struct vidtv_mux_init_args args);
+				 struct vidtv_mux_init_args *args);
 void vidtv_mux_destroy(struct vidtv_mux *m);
 
 void vidtv_mux_start_thread(struct vidtv_mux *m);
-- 
2.26.2

