Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECBC6267904
	for <lists+linux-media@lfdr.de>; Sat, 12 Sep 2020 11:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725820AbgILJA6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Sep 2020 05:00:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:48336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725805AbgILJA4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Sep 2020 05:00:56 -0400
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de [95.90.213.163])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CBD7B2064E;
        Sat, 12 Sep 2020 09:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599901253;
        bh=rcf9qiinGewlooZVkc80E5ROEyjsEkJ+kBVWXO6MfGo=;
        h=From:To:Cc:Subject:Date:From;
        b=rmS2mVBQsBuVpsEf3dZvxcBuB4tyPfGQA91imrrsLltfGApoHZhsvzuI1pgCEa9zo
         BYR9OF6nS4jEtd5uYhtlm4+SxuYdYgukHuoUIL2INAnRoSFm0ktUGAGMjJKCQhf+t8
         u+S0ClHSlqm18Kxblkv4TO/cV3+395klFLJT1tuE=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kH1Oq-001RET-QC; Sat, 12 Sep 2020 11:00:48 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH] vidtv: prefer using dev_foo() instead of pr_foo()
Date:   Sat, 12 Sep 2020 11:00:47 +0200
Message-Id: <59b26c081ca3ca472578481fdc748f59ab8187af.1599901241.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It is better to use the higher level dev_foo() than pr_foo()
for printks.

Change them at vidtv at the more trivial places.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/test-drivers/vidtv/vidtv_bridge.c   | 19 +++++++--------
 .../media/test-drivers/vidtv/vidtv_channel.c  | 23 ++++++++++---------
 .../media/test-drivers/vidtv/vidtv_demod.c    | 10 ++++----
 drivers/media/test-drivers/vidtv/vidtv_mux.c  | 18 ++++++++-------
 drivers/media/test-drivers/vidtv/vidtv_mux.h  |  5 +++-
 .../media/test-drivers/vidtv/vidtv_tuner.c    | 17 +++++++-------
 6 files changed, 51 insertions(+), 41 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index 9f0e53e9fe69..270c183b1d67 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -9,12 +9,10 @@
  * Copyright (C) 2020 Daniel W. S. Almeida
  */
 
-#define pr_fmt(fmt) KBUILD_MODNAME ":%s, %d: " fmt, __func__, __LINE__
-
 #include <linux/moduleparam.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
-#include <linux/printk.h>
+#include <linux/dev_printk.h>
 #include <linux/time.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
@@ -146,10 +144,11 @@ vidtv_bridge_on_new_pkts_avail(void *priv, u8 *buf, u32 npkts)
 static int vidtv_start_streaming(struct vidtv_dvb *dvb)
 {
 	struct vidtv_mux_init_args mux_args = {0};
+	struct device *dev = &dvb->pdev->dev;
 	u32 mux_buf_sz;
 
 	if (dvb->streaming) {
-		pr_warn_ratelimited("Already streaming. Skipping.\n");
+		dev_warn_ratelimited(dev, "Already streaming. Skipping.\n");
 		return 0;
 	}
 
@@ -165,21 +164,23 @@ static int vidtv_start_streaming(struct vidtv_dvb *dvb)
 	mux_args.priv                        = dvb;
 
 	dvb->streaming = true;
-	dvb->mux = vidtv_mux_init(mux_args);
+	dvb->mux = vidtv_mux_init(dev, mux_args);
 	vidtv_mux_start_thread(dvb->mux);
 
-	pr_info_ratelimited("Started streaming\n");
+	dev_dbg_ratelimited(dev, "Started streaming\n");
 	return 0;
 }
 
 static int vidtv_stop_streaming(struct vidtv_dvb *dvb)
 {
+	struct device *dev = &dvb->pdev->dev;
+
 	dvb->streaming = false;
 	vidtv_mux_stop_thread(dvb->mux);
 	vidtv_mux_destroy(dvb->mux);
 	dvb->mux = NULL;
 
-	pr_info_ratelimited("Stopped streaming\n");
+	dev_dbg_ratelimited(dev, "Stopped streaming\n");
 	return 0;
 }
 
@@ -438,8 +439,8 @@ static int vidtv_bridge_dvb_init(struct vidtv_dvb *dvb)
 
 static int vidtv_bridge_probe(struct platform_device *pdev)
 {
-	int ret;
 	struct vidtv_dvb *dvb;
+	int ret;
 
 	dvb = kzalloc(sizeof(*dvb), GFP_KERNEL);
 	if (!dvb)
@@ -455,7 +456,7 @@ static int vidtv_bridge_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, dvb);
 
-	pr_info("Successfully initialized vidtv!\n");
+	dev_info(&pdev->dev, "Successfully initialized vidtv!\n");
 	return ret;
 
 err_dvb:
diff --git a/drivers/media/test-drivers/vidtv/vidtv_channel.c b/drivers/media/test-drivers/vidtv/vidtv_channel.c
index ac4bdf05395e..0a62b97e6a27 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_channel.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_channel.c
@@ -18,11 +18,9 @@
  * Copyright (C) 2020 Daniel W. S. Almeida
  */
 
-#define pr_fmt(fmt) KBUILD_MODNAME ":%s, %d: " fmt, __func__, __LINE__
-
 #include <linux/types.h>
 #include <linux/slab.h>
-#include <linux/printk.h>
+#include <linux/dev_printk.h>
 #include <linux/ratelimit.h>
 
 #include "vidtv_channel.h"
@@ -104,10 +102,10 @@ struct vidtv_channel
 }
 
 static struct vidtv_psi_table_sdt_service
-*vidtv_channel_sdt_serv_cat_into_new(const struct vidtv_channel *channels)
+*vidtv_channel_sdt_serv_cat_into_new(struct vidtv_mux *m)
 {
 	/* Concatenate the services */
-	const struct vidtv_channel *cur_chnl = channels;
+	const struct vidtv_channel *cur_chnl = m->channels;
 
 	struct vidtv_psi_table_sdt_service *curr = NULL;
 	struct vidtv_psi_table_sdt_service *head = NULL;
@@ -123,7 +121,8 @@ static struct vidtv_psi_table_sdt_service
 		curr = cur_chnl->service;
 
 		if (!curr)
-			pr_warn_ratelimited("No services found for channel %s\n", cur_chnl->name);
+			dev_warn_ratelimited(m->dev,
+					     "No services found for channel %s\n", cur_chnl->name);
 
 		while (curr) {
 			service_id = be16_to_cpu(curr->service_id);
@@ -145,10 +144,10 @@ static struct vidtv_psi_table_sdt_service
 }
 
 static struct vidtv_psi_table_pat_program*
-vidtv_channel_pat_prog_cat_into_new(const struct vidtv_channel *channels)
+vidtv_channel_pat_prog_cat_into_new(struct vidtv_mux *m)
 {
 	/* Concatenate the programs */
-	const struct vidtv_channel *cur_chnl = channels;
+	const struct vidtv_channel *cur_chnl = m->channels;
 	struct vidtv_psi_table_pat_program *curr = NULL;
 	struct vidtv_psi_table_pat_program *head = NULL;
 	struct vidtv_psi_table_pat_program *tail = NULL;
@@ -162,7 +161,9 @@ vidtv_channel_pat_prog_cat_into_new(const struct vidtv_channel *channels)
 		curr = cur_chnl->program;
 
 		if (!curr)
-			pr_warn_ratelimited("No programs found for channel %s\n", cur_chnl->name);
+			dev_warn_ratelimited(m->dev,
+					     "No programs found for channel %s\n",
+					     cur_chnl->name);
 
 		while (curr) {
 			serv_id = be16_to_cpu(curr->service_id);
@@ -251,8 +252,8 @@ void vidtv_channel_si_init(struct vidtv_mux *m)
 
 	m->si.sdt = vidtv_psi_sdt_table_init(m->transport_stream_id);
 
-	programs = vidtv_channel_pat_prog_cat_into_new(m->channels);
-	services = vidtv_channel_sdt_serv_cat_into_new(m->channels);
+	programs = vidtv_channel_pat_prog_cat_into_new(m);
+	services = vidtv_channel_sdt_serv_cat_into_new(m);
 
 	/* assemble all programs and assign to PAT */
 	vidtv_psi_pat_program_assign(m->si.pat, programs);
diff --git a/drivers/media/test-drivers/vidtv/vidtv_demod.c b/drivers/media/test-drivers/vidtv/vidtv_demod.c
index d18860fcb0e7..3eb48b4a9a6b 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_demod.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_demod.c
@@ -76,8 +76,9 @@ static const struct vidtv_demod_cnr_to_qual_s vidtv_demod_t_cnr_2_qual[] = {
 static const struct vidtv_demod_cnr_to_qual_s
 	     *vidtv_match_cnr_s(struct dvb_frontend *fe)
 {
+	const struct vidtv_demod_cnr_to_qual_s *cnr2qual = NULL;
+	struct device *dev = fe->dvb->device;
 	struct dtv_frontend_properties *c;
-	const struct vidtv_demod_cnr_to_qual_s *cnr2qual = NULL;
 	u32 array_size = 0;
 	u32 i;
 
@@ -106,9 +107,10 @@ static const struct vidtv_demod_cnr_to_qual_s
 		break;
 
 	default:
-		pr_warn_ratelimited("%s: unsupported delivery system: %u\n",
-				    __func__,
-				    c->delivery_system);
+		dev_warn_ratelimited(dev,
+				     "%s: unsupported delivery system: %u\n",
+				     __func__,
+				     c->delivery_system);
 		break;
 	}
 
diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.c b/drivers/media/test-drivers/vidtv/vidtv_mux.c
index 540f404372aa..d1db9dc6dc89 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_mux.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.c
@@ -12,13 +12,11 @@
  * Copyright (C) 2020 Daniel W. S. Almeida
  */
 
-#define pr_fmt(fmt) KBUILD_MODNAME ":%s, %d: " fmt, __func__, __LINE__
-
 #include <linux/types.h>
 #include <linux/slab.h>
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
-#include <linux/printk.h>
+#include <linux/dev_printk.h>
 #include <linux/ratelimit.h>
 #include <linux/delay.h>
 #include <linux/vmalloc.h>
@@ -147,7 +145,8 @@ static u32 vidtv_mux_push_si(struct vidtv_mux *m)
 						m->si.pat);
 
 		if (pmt_pid > TS_LAST_VALID_PID) {
-			pr_warn_ratelimited("PID: %d not found\n", pmt_pid);
+			dev_warn_ratelimited(m->dev,
+					     "PID: %d not found\n", pmt_pid);
 			continue;
 		}
 
@@ -331,7 +330,8 @@ static u32 vidtv_mux_pad_with_nulls(struct vidtv_mux *m, u32 npkts)
 
 	/* sanity check */
 	if (nbytes != npkts * TS_PACKET_LEN)
-		pr_err_ratelimited("%d != %d\n", nbytes, npkts * TS_PACKET_LEN);
+		dev_err_ratelimited(m->dev, "%d != %d\n",
+				    nbytes, npkts * TS_PACKET_LEN);
 
 	return nbytes;
 }
@@ -402,7 +402,7 @@ static void vidtv_mux_tick(struct work_struct *work)
 
 		/* if the buffer is not aligned there is a bug somewhere */
 		if (nbytes % TS_PACKET_LEN)
-			pr_err_ratelimited("Misaligned buffer\n");
+			dev_err_ratelimited(m->dev, "Misaligned buffer\n");
 
 		if (m->on_new_packets_available_cb)
 			m->on_new_packets_available_cb(m->priv,
@@ -418,7 +418,7 @@ static void vidtv_mux_tick(struct work_struct *work)
 void vidtv_mux_start_thread(struct vidtv_mux *m)
 {
 	if (m->streaming) {
-		pr_warn_ratelimited("Already streaming. Skipping.\n");
+		dev_warn_ratelimited(m->dev, "Already streaming. Skipping.\n");
 		return;
 	}
 
@@ -435,10 +435,12 @@ void vidtv_mux_stop_thread(struct vidtv_mux *m)
 	}
 }
 
-struct vidtv_mux *vidtv_mux_init(struct vidtv_mux_init_args args)
+struct vidtv_mux *vidtv_mux_init(struct device *dev,
+				 struct vidtv_mux_init_args args)
 {
 	struct vidtv_mux *m = kzalloc(sizeof(*m), GFP_KERNEL);
 
+	m->dev = dev;
 	m->timing.pcr_period_usecs = args.pcr_period_usecs;
 	m->timing.si_period_usecs  = args.si_period_usecs;
 
diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.h b/drivers/media/test-drivers/vidtv/vidtv_mux.h
index 8622a62cd9bc..67de85fd50aa 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_mux.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.h
@@ -100,6 +100,8 @@ struct vidtv_mux_pid_ctx {
  * @priv: Private data.
  */
 struct vidtv_mux {
+	struct device *dev;
+
 	struct vidtv_mux_timing timing;
 
 	u32 mux_rate_kbytes_sec;
@@ -151,7 +153,8 @@ struct vidtv_mux_init_args {
 	void *priv;
 };
 
-struct vidtv_mux *vidtv_mux_init(struct vidtv_mux_init_args args);
+struct vidtv_mux *vidtv_mux_init(struct device *dev,
+				 struct vidtv_mux_init_args args);
 void vidtv_mux_destroy(struct vidtv_mux *m);
 
 void vidtv_mux_start_thread(struct vidtv_mux *m);
diff --git a/drivers/media/test-drivers/vidtv/vidtv_tuner.c b/drivers/media/test-drivers/vidtv/vidtv_tuner.c
index c8e64bab0379..39e848ae5836 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_tuner.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_tuner.c
@@ -10,8 +10,6 @@
  * Copyright (C) 2020 Daniel W. S. Almeida
  */
 
-#define pr_fmt(fmt) KBUILD_MODNAME ":%s, %d: " fmt, __func__, __LINE__
-
 #include <linux/errno.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
@@ -149,9 +147,10 @@ static s32 vidtv_tuner_check_frequency_shift(struct dvb_frontend *fe)
 		break;
 
 	default:
-		pr_warn("%s: unsupported delivery system: %u\n",
-			__func__,
-			c->delivery_system);
+		dev_warn(fe->dvb->device,
+			 "%s: unsupported delivery system: %u\n",
+			 __func__,
+			 c->delivery_system);
 
 		return -EINVAL;
 	}
@@ -179,6 +178,7 @@ vidtv_tuner_get_signal_strength(struct dvb_frontend *fe, u16 *strength)
 {
 	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
 	const struct vidtv_tuner_cnr_to_qual_s *cnr2qual = NULL;
+	struct device *dev = fe->dvb->device;
 	u32 array_size = 0;
 	s32 shift;
 	u32 i;
@@ -208,9 +208,10 @@ vidtv_tuner_get_signal_strength(struct dvb_frontend *fe, u16 *strength)
 		break;
 
 	default:
-		pr_warn_ratelimited("%s: unsupported delivery system: %u\n",
-				    __func__,
-				    c->delivery_system);
+		dev_warn_ratelimited(dev,
+				     "%s: unsupported delivery system: %u\n",
+				     __func__,
+				     c->delivery_system);
 		return -EINVAL;
 	}
 
-- 
2.26.2

