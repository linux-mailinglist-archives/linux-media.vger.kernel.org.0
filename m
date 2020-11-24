Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B471A2C23DA
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 12:08:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732805AbgKXLIQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 06:08:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:33634 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732014AbgKXLGc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 06:06:32 -0500
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D0C4D20782;
        Tue, 24 Nov 2020 11:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606215991;
        bh=+o4sKZpfph5wf9xaM5xJDLWPdI132bLuOkXE3mw2ky4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=zktEnhA++bfbTNFgMMRqQxjQ64qJdwPRoqZAXlNLV+mHNd+yREPRiaIAyd/lBkrS9
         1BafuvA+Txaf/7etHlkUM31La2i/LptcE1wUNabF+6rNg7kudVrPEfjuuZ25mxS311
         GXQxVtGDHV3hWrNtCJ7nl8Oa6b5CJGbjb1mUrF0k=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1khW9U-000FZb-OF; Tue, 24 Nov 2020 12:06:28 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 07/31] media: vidtv: avoid data copy when initializing the multiplexer
Date:   Tue, 24 Nov 2020 12:06:03 +0100
Message-Id: <b0c7c5788d4f717905adf7e0070f047aded2308b.1606215584.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606215584.git.mchehab+huawei@kernel.org>
References: <cover.1606215584.git.mchehab+huawei@kernel.org>
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
 .../media/test-drivers/vidtv/vidtv_bridge.c   | 28 ++++++++++---------
 drivers/media/test-drivers/vidtv/vidtv_mux.c  | 28 +++++++++----------
 drivers/media/test-drivers/vidtv/vidtv_mux.h  |  2 +-
 3 files changed, 30 insertions(+), 28 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index e846aaab2c44..3fc7bf00a3e5 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -161,7 +161,17 @@ vidtv_bridge_on_new_pkts_avail(void *priv, u8 *buf, u32 npkts)
 
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
+		.network_id                  = VIDTV_DEFAULT_NETWORK_ID,
+		.network_name                = VIDTV_DEFAULT_NETWORK_NAME,
+		.priv                        = dvb,
+	};
 	struct device *dev = &dvb->pdev->dev;
 	u32 mux_buf_sz;
 
@@ -170,21 +180,13 @@ static int vidtv_start_streaming(struct vidtv_dvb *dvb)
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
-	mux_args.network_id                  = VIDTV_DEFAULT_NETWORK_ID,
-	mux_args.network_name                = VIDTV_DEFAULT_NETWORK_NAME,
-	mux_args.priv                        = dvb;
+	mux_args.mux_buf_sz  = mux_buf_sz;
 
 	dvb->streaming = true;
-	dvb->mux = vidtv_mux_init(dvb->fe[0], dev, mux_args);
+	dvb->mux = vidtv_mux_init(dvb->fe[0], dev, &mux_args);
 	if (!dvb->mux)
 		return -ENOMEM;
 	vidtv_mux_start_thread(dvb->mux);
diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.c b/drivers/media/test-drivers/vidtv/vidtv_mux.c
index bba3f2315531..89b19f0844b8 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_mux.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.c
@@ -466,7 +466,7 @@ void vidtv_mux_stop_thread(struct vidtv_mux *m)
 
 struct vidtv_mux *vidtv_mux_init(struct dvb_frontend *fe,
 				 struct device *dev,
-				 struct vidtv_mux_init_args args)
+				 struct vidtv_mux_init_args *args)
 {
 	struct vidtv_mux *m;
 
@@ -476,28 +476,28 @@ struct vidtv_mux *vidtv_mux_init(struct dvb_frontend *fe,
 
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
-	m->network_id = args.network_id;
-	m->network_name = kstrdup(args.network_name, GFP_KERNEL);
+	m->pcr_pid = args->pcr_pid;
+	m->transport_stream_id = args->transport_stream_id;
+	m->priv = args->priv;
+	m->network_id = args->network_id;
+	m->network_name = kstrdup(args->network_name, GFP_KERNEL);
 	m->timing.current_jiffies = get_jiffies_64();
 
-	if (args.channels)
-		m->channels = args.channels;
+	if (args->channels)
+		m->channels = args->channels;
 	else
 		if (vidtv_channels_init(m) < 0)
 			goto free_mux_buf;
diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.h b/drivers/media/test-drivers/vidtv/vidtv_mux.h
index 005b707f1445..e186094c4fb7 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_mux.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.h
@@ -170,7 +170,7 @@ struct vidtv_mux_init_args {
 
 struct vidtv_mux *vidtv_mux_init(struct dvb_frontend *fe,
 				 struct device *dev,
-				 struct vidtv_mux_init_args args);
+				 struct vidtv_mux_init_args *args);
 void vidtv_mux_destroy(struct vidtv_mux *m);
 
 void vidtv_mux_start_thread(struct vidtv_mux *m);
-- 
2.28.0

