Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B53781D6501
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2020 02:48:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726855AbgEQAsX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 May 2020 20:48:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:55884 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726831AbgEQAsX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 May 2020 20:48:23 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9B90A206F4;
        Sun, 17 May 2020 00:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589676502;
        bh=E3kXH7vJiAhBYVqhDkhUkZmdA1B0sLboFvudcMMvQtI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MowGh5CIB1Jesucrkb6TweD4CJ0K54sknCNf8O23r/N8Lhi0Fr3owjqo1iHwzdEon
         R3RGBsla6nA+ioJptxOB/e8ER9Y8KExAyU+VMf0z8sk1JApUskQcrGW6Tn+MSOZAmz
         8n8aK/FilWahNvBjpWPV0W1j6vUBCwXxESNKsWpI=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1ja7TX-008g5j-AV; Sun, 17 May 2020 02:48:19 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v2] vidtv: fix issues preventing it to build and load
Date:   Sun, 17 May 2020 02:48:16 +0200
Message-Id: <973c14629d76e5fdae4ed470899b0cd28a2f22b0.1589676457.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <A67F53F3-E285-4E60-B3ED-6747F60E11C9@getmailspring.com>
References: <A67F53F3-E285-4E60-B3ED-6747F60E11C9@getmailspring.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are several issues that were preventing it to properly
build and load:

- Makefile was not actually compiling everything;
- The bridge driver should be a platform driver;
- There are lots of warnings and other errors produced
  by the driver.

Address them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

This time, against v5.

 drivers/media/test-drivers/vidtv/Makefile     | 10 ++-
 .../vidtv/{vidtv_bridg.c => vidtv_bridge.c}   | 87 ++++++++++++-------
 .../vidtv/{vidtv_bridg.h => vidtv_bridge.h}   |  0
 .../media/test-drivers/vidtv/vidtv_common.c   |  4 +-
 .../media/test-drivers/vidtv/vidtv_demod.c    | 43 +++++----
 .../media/test-drivers/vidtv/vidtv_s302m.c    |  2 -
 .../media/test-drivers/vidtv/vidtv_tuner.c    | 10 +--
 7 files changed, 92 insertions(+), 64 deletions(-)
 rename drivers/media/test-drivers/vidtv/{vidtv_bridg.c => vidtv_bridge.c} (89%)
 rename drivers/media/test-drivers/vidtv/{vidtv_bridg.h => vidtv_bridge.h} (100%)

diff --git a/drivers/media/test-drivers/vidtv/Makefile b/drivers/media/test-drivers/vidtv/Makefile
index 8663196fbbc5..cc3b67fd1c9f 100644
--- a/drivers/media/test-drivers/vidtv/Makefile
+++ b/drivers/media/test-drivers/vidtv/Makefile
@@ -1,6 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 
-vidtv_bridge-objs = vidtv_bridg.o vidtv_common.o vidtv_ts.o vidtv_psi.o \
-		    vidtv_pes.o vidtv_s302m.o vidtv_channel.o vidtv_mux.o
+dvb-vidtv-tuner-objs := vidtv_tuner.o
+dvb-vidtv-demod-objs := vidtv_common.o vidtv_demod.o
+dvb-vidtv-bridge-objs := vidtv_common.o vidtv_ts.o vidtv_psi.o vidtv_pes.o \
+		         vidtv_s302m.o vidtv_channel.o vidtv_mux.o \
+		         vidtv_bridge.o
 
-obj-$(CONFIG_DVB_VIDTV)	+= vidtv_tuner.o vidtv_demod.o vidtv_bridge.o
+obj-$(CONFIG_DVB_VIDTV)	+= dvb-vidtv-tuner.o dvb-vidtv-demod.o \
+			   dvb-vidtv-bridge.o
diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridg.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
similarity index 89%
rename from drivers/media/test-drivers/vidtv/vidtv_bridg.c
rename to drivers/media/test-drivers/vidtv/vidtv_bridge.c
index 7148621ced7e..39e3d0da5ba3 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridg.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -9,27 +9,26 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ":%s, %d: " fmt, __func__, __LINE__
 
-#include <linux/types.h>
 #include <linux/moduleparam.h>
 #include <linux/mutex.h>
-#include <linux/workqueue.h>
+#include <linux/platform_device.h>
+#include <linux/printk.h>
 #include <linux/time.h>
-#include "linux/printk.h"
+#include <linux/types.h>
+#include <linux/workqueue.h>
 
-#include "vidtv_bridg.h"
-#include "vidtv_tuner.h"
+#include "vidtv_bridge.h"
 #include "vidtv_demod.h"
-#include "vidtv_ts.h"
 #include "vidtv_mux.h"
+#include "vidtv_ts.h"
+#include "vidtv_ts.h"
+#include "vidtv_tuner.h"
 
 #define TS_BUF_MAX_SZ (128 * TS_PACKET_LEN)
 #define TS_BUF_MIN_SZ (20 * TS_PACKET_LEN)
 #define TUNER_DEFAULT_ADDR 0x68
 #define DEMOD_DEFAULT_ADDR 0x60
 
-MODULE_AUTHOR("Daniel W. S. Almeida");
-MODULE_LICENSE("GPL");
-
 static unsigned int drop_tslock_prob_on_low_snr;
 module_param(drop_tslock_prob_on_low_snr, uint, 0);
 MODULE_PARM_DESC(drop_tslock_prob_on_low_snr,
@@ -99,11 +98,13 @@ static bool vidtv_bridge_check_demod_lock(struct vidtv_dvb *dvb, u32 n)
 
 	dvb->fe[n]->ops.read_status(dvb->fe[n], &status);
 
-	return status == (FE_HAS_SIGNAL  |
-			  FE_HAS_CARRIER |
-			  FE_HAS_VITERBI |
-			  FE_HAS_SYNC    |
-			  FE_HAS_LOCK);
+	status = FE_HAS_SIGNAL  |
+		 FE_HAS_CARRIER |
+		 FE_HAS_VITERBI |
+		 FE_HAS_SYNC    |
+		 FE_HAS_LOCK;
+
+	return status;
 }
 
 static void
@@ -193,7 +194,7 @@ static u32 vidtv_i2c_func(struct i2c_adapter *adapter)
 	return I2C_FUNC_I2C;
 }
 
-static struct i2c_algorithm vidtv_i2c_algorithm = {
+static const struct i2c_algorithm vidtv_i2c_algorithm = {
 	.master_xfer   = vidtv_master_xfer,
 	.functionality = vidtv_i2c_func,
 };
@@ -365,8 +366,7 @@ static int vidtv_bridge_dvb_init(struct vidtv_dvb *dvb)
 	return ret;
 }
 
-static int vidtv_bridge_i2c_probe(struct i2c_client *client,
-				  const struct i2c_device_id *id)
+static int vidtv_bridge_probe(struct platform_device *pdev)
 {
 	int ret;
 	struct vidtv_dvb *dvb;
@@ -399,7 +399,7 @@ static int vidtv_bridge_i2c_probe(struct i2c_client *client,
 
 	dvb->mux = vidtv_mux_init(mux_args);
 
-	i2c_set_clientdata(client, dvb);
+	platform_set_drvdata(pdev, dvb);
 
 	return ret;
 
@@ -408,12 +408,12 @@ static int vidtv_bridge_i2c_probe(struct i2c_client *client,
 	return ret;
 }
 
-static int vidtv_bridge_i2c_remove(struct i2c_client *client)
+static int vidtv_bridge_remove(struct platform_device *pdev)
 {
 	struct vidtv_dvb *dvb;
 	u32 i;
 
-	dvb = i2c_get_clientdata(client);
+	dvb = platform_get_drvdata(pdev);
 
 	vidtv_mux_destroy(dvb->mux);
 
@@ -436,21 +436,48 @@ static int vidtv_bridge_i2c_remove(struct i2c_client *client)
 	return 0;
 }
 
-static const struct i2c_device_id vidtv_bridge_id_table[] = {
-	{"vidtv_bridge", 0},
-	{}
+static void vidtv_bridge_dev_release(struct device *dev)
+{
+}
+
+static struct platform_device vidtv_bridge_dev = {
+	.name		= "vidtv_bridge",
+	.dev.release	= vidtv_bridge_dev_release,
 };
 
-MODULE_DEVICE_TABLE(i2c, vidtv_bridge_id_table);
-
-static struct i2c_driver vidtv_bridge_driver = {
+static struct platform_driver vidtv_bridge_driver = {
 	.driver = {
 		.name                = "vidtv_bridge",
 		.suppress_bind_attrs = true,
 	},
-	.probe    = vidtv_bridge_i2c_probe,
-	.remove   = vidtv_bridge_i2c_remove,
-	.id_table = vidtv_bridge_id_table,
+	.probe    = vidtv_bridge_probe,
+	.remove   = vidtv_bridge_remove,
 };
 
-module_i2c_driver(vidtv_bridge_driver);
+static void __exit vidtv_bridge_exit(void)
+{
+	platform_driver_unregister(&vidtv_bridge_driver);
+	platform_device_unregister(&vidtv_bridge_dev);
+}
+
+static int __init vidtv_bridge_init(void)
+{
+	int ret;
+
+	ret = platform_device_register(&vidtv_bridge_dev);
+	if (ret)
+		return ret;
+
+	ret = platform_driver_register(&vidtv_bridge_driver);
+	if (ret)
+		platform_device_unregister(&vidtv_bridge_dev);
+
+	return ret;
+}
+
+module_init(vidtv_bridge_init);
+module_exit(vidtv_bridge_exit);
+
+MODULE_DESCRIPTION("Virtual Digital TV Test Driver");
+MODULE_AUTHOR("Daniel W. S. Almeida");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridg.h b/drivers/media/test-drivers/vidtv/vidtv_bridge.h
similarity index 100%
rename from drivers/media/test-drivers/vidtv/vidtv_bridg.h
rename to drivers/media/test-drivers/vidtv/vidtv_bridge.h
diff --git a/drivers/media/test-drivers/vidtv/vidtv_common.c b/drivers/media/test-drivers/vidtv/vidtv_common.c
index 944f77625c12..6810212087c1 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_common.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_common.c
@@ -9,10 +9,10 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ":%s, %d: " fmt, __func__, __LINE__
 
-#include <linux/types.h>
-#include <linux/string.h>
 #include <linux/printk.h>
 #include <linux/ratelimit.h>
+#include <linux/string.h>
+#include <linux/types.h>
 
 #include "vidtv_common.h"
 
diff --git a/drivers/media/test-drivers/vidtv/vidtv_demod.c b/drivers/media/test-drivers/vidtv/vidtv_demod.c
index 2d5270e71a90..7dd9d9979891 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_demod.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_demod.c
@@ -8,34 +8,31 @@
  * Based on the example driver written by Emard <emard@softhome.net>
  */
 
+#include <linux/errno.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/init.h>
-#include <linux/string.h>
+#include <linux/printk.h>
+#include <linux/random.h>
+#include <linux/ratelimit.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/workqueue.h>
-#include <linux/random.h>
-#include <linux/errno.h>
-#include <linux/i2c.h>
 #include <media/dvb_frontend.h>
-#include <linux/printk.h>
-#include <linux/ratelimit.h>
 
 #include "vidtv_demod.h"
 
-MODULE_DESCRIPTION("Virtual DVB Demodulator Driver");
-MODULE_AUTHOR("Daniel W. S. Almeida");
-MODULE_LICENSE("GPL");
+// FIXME: just added a random value here
+#define POLL_THRD_TIME 10 /* ms */
 
-#define POLL_THRD_TIME 2000 /* msecs */
-
-static struct vidtv_demod_cnr_to_qual_s vidtv_demod_c_cnr_2_qual[] = {
+static const struct vidtv_demod_cnr_to_qual_s vidtv_demod_c_cnr_2_qual[] = {
 	/* from libdvbv5 source code, in milli db */
 	{ QAM_256, FEC_NONE,  34000, 38000},
 	{ QAM_64,  FEC_NONE,  30000, 34000},
 };
 
-static struct vidtv_demod_cnr_to_qual_s vidtv_demod_s_cnr_2_qual[] = {
+static const struct vidtv_demod_cnr_to_qual_s vidtv_demod_s_cnr_2_qual[] = {
 	/* from libdvbv5 source code, in milli db */
 	{ QPSK, FEC_1_2,  7000, 10000},
 	{ QPSK, FEC_2_3,  9000, 12000},
@@ -44,7 +41,7 @@ static struct vidtv_demod_cnr_to_qual_s vidtv_demod_s_cnr_2_qual[] = {
 	{ QPSK, FEC_7_8, 12000, 15000},
 };
 
-static struct vidtv_demod_cnr_to_qual_s vidtv_demod_s2_cnr_2_qual[] = {
+static const struct vidtv_demod_cnr_to_qual_s vidtv_demod_s2_cnr_2_qual[] = {
 	/* from libdvbv5 source code, in milli db */
 	{ QPSK,  FEC_1_2,   9000,  12000},
 	{ QPSK,  FEC_2_3,  11000,  14000},
@@ -58,7 +55,7 @@ static struct vidtv_demod_cnr_to_qual_s vidtv_demod_s2_cnr_2_qual[] = {
 	{ PSK_8, FEC_8_9,  19000,  22000},
 };
 
-static struct vidtv_demod_cnr_to_qual_s vidtv_demod_t_cnr_2_qual[] = {
+static const struct vidtv_demod_cnr_to_qual_s vidtv_demod_t_cnr_2_qual[] = {
 	/* from libdvbv5 source code, in milli db*/
 	{   QPSK, FEC_1_2,  4100,  5900},
 	{   QPSK, FEC_2_3,  6100,  9600},
@@ -79,11 +76,11 @@ static struct vidtv_demod_cnr_to_qual_s vidtv_demod_t_cnr_2_qual[] = {
 	{ QAM_64, FEC_7_8, 22000, 24000},
 };
 
-static struct vidtv_demod_cnr_to_qual_s
+static const struct vidtv_demod_cnr_to_qual_s
 *vidtv_match_cnr_s(struct dvb_frontend *fe)
 {
 	struct dtv_frontend_properties *c;
-	struct vidtv_demod_cnr_to_qual_s *cnr2qual = NULL;
+	const struct vidtv_demod_cnr_to_qual_s *cnr2qual = NULL;
 	u32    array_size                          = 0;
 	u32 i;
 
@@ -133,13 +130,11 @@ static void vidtv_demod_poll_snr_handler(struct work_struct *work)
 	 * lose the TS lock if it dips too low
 	 */
 	struct vidtv_demod_state *state;
-	struct dtv_frontend_properties *c;
-	struct vidtv_demod_cnr_to_qual_s *cnr2qual = NULL;
+	const struct vidtv_demod_cnr_to_qual_s *cnr2qual = NULL;
 	struct vidtv_demod_config *config;
 	u16 snr = 0;
 
 	state  = container_of(work, struct vidtv_demod_state, poll_snr.work);
-	c      = &state->frontend.dtv_property_cache;
 	config = &state->config;
 
 	if (!state->frontend.ops.tuner_ops.get_rf_strength)
@@ -223,7 +218,7 @@ static int vidtv_demod_get_frontend(struct dvb_frontend *fe,
 static int vidtv_demod_set_frontend(struct dvb_frontend *fe)
 {
 	struct vidtv_demod_state *state            = fe->demodulator_priv;
-	struct vidtv_demod_cnr_to_qual_s *cnr2qual = NULL;
+	const struct vidtv_demod_cnr_to_qual_s *cnr2qual = NULL;
 	u32    tuner_status                        = 0;
 
 	if (fe->ops.tuner_ops.set_params) {
@@ -446,3 +441,7 @@ static struct i2c_driver vidtv_demod_i2c_driver = {
 };
 
 module_i2c_driver(vidtv_demod_i2c_driver);
+
+MODULE_DESCRIPTION("Virtual DVB Demodulator Driver");
+MODULE_AUTHOR("Daniel W. S. Almeida");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/test-drivers/vidtv/vidtv_s302m.c b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
index 1b21a3a55dfe..d4fe0c4a18cf 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_s302m.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
@@ -208,14 +208,12 @@ vidtv_s302m_compute_sample_count_v(struct vidtv_encoder *e)
 	u32 vau_duration_usecs;
 	u32 sample_duration_usecs;
 	u32 i;
-	u32 sample_count;
 	u32 s;
 
 	vau_duration_usecs    = USEC_PER_SEC / e->sync->sampling_rate_hz;
 	sample_duration_usecs = USEC_PER_SEC / e->sampling_rate_hz;
 
 	for (i = 0; i < e->sync->nunits; ++i) {
-		sample_count = e->samples_per_unit[i];
 		s = DIV_ROUND_UP(vau_duration_usecs, sample_duration_usecs);
 		e->samples_per_unit[i] = s;
 	}
diff --git a/drivers/media/test-drivers/vidtv/vidtv_tuner.c b/drivers/media/test-drivers/vidtv/vidtv_tuner.c
index da4d4b9bfffa..3f2b4b9a6d56 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_tuner.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_tuner.c
@@ -34,13 +34,13 @@ struct vidtv_tuner_cnr_to_qual_s {
 	u32 cnr_ok, cnr_good;
 };
 
-static struct vidtv_tuner_cnr_to_qual_s vidtv_tuner_c_cnr_2_qual[] = {
+static const struct vidtv_tuner_cnr_to_qual_s vidtv_tuner_c_cnr_2_qual[] = {
 	/* from libdvbv5 source code, in milli db */
 	{ QAM_256, FEC_NONE,  34000, 38000},
 	{ QAM_64,  FEC_NONE,  30000, 34000},
 };
 
-static struct vidtv_tuner_cnr_to_qual_s vidtv_tuner_s_cnr_2_qual[] = {
+static const struct vidtv_tuner_cnr_to_qual_s vidtv_tuner_s_cnr_2_qual[] = {
 	/* from libdvbv5 source code, in milli db */
 	{ QPSK, FEC_1_2,  7000, 10000},
 
@@ -51,7 +51,7 @@ static struct vidtv_tuner_cnr_to_qual_s vidtv_tuner_s_cnr_2_qual[] = {
 	{ QPSK, FEC_7_8, 12000, 15000},
 };
 
-static struct vidtv_tuner_cnr_to_qual_s vidtv_tuner_s2_cnr_2_qual[] = {
+static const struct vidtv_tuner_cnr_to_qual_s vidtv_tuner_s2_cnr_2_qual[] = {
 	/* from libdvbv5 source code, in milli db */
 	{ QPSK,  FEC_1_2,   9000,  12000},
 	{ QPSK,  FEC_2_3,  11000,  14000},
@@ -65,7 +65,7 @@ static struct vidtv_tuner_cnr_to_qual_s vidtv_tuner_s2_cnr_2_qual[] = {
 	{ PSK_8, FEC_8_9,  19000,  22000},
 };
 
-static struct vidtv_tuner_cnr_to_qual_s vidtv_tuner_t_cnr_2_qual[] = {
+static const struct vidtv_tuner_cnr_to_qual_s vidtv_tuner_t_cnr_2_qual[] = {
 	/* from libdvbv5 source code, in milli db*/
 	{   QPSK, FEC_1_2,  4100,  5900},
 	{   QPSK, FEC_2_3,  6100,  9600},
@@ -164,7 +164,7 @@ static int
 vidtv_tuner_get_signal_strength(struct dvb_frontend *fe, u16 *strength)
 {
 	struct dtv_frontend_properties *c          = &fe->dtv_property_cache;
-	struct vidtv_tuner_cnr_to_qual_s *cnr2qual = NULL;
+	const struct vidtv_tuner_cnr_to_qual_s *cnr2qual = NULL;
 	u32    array_size                          = 0;
 	s32 shift;
 	u32 i;
-- 
2.26.2


