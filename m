Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D7532335A6
	for <lists+linux-media@lfdr.de>; Thu, 30 Jul 2020 17:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729857AbgG3Pfi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jul 2020 11:35:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726581AbgG3Pfe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jul 2020 11:35:34 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CAA6C061574;
        Thu, 30 Jul 2020 08:35:34 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id b14so24262264qkn.4;
        Thu, 30 Jul 2020 08:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mgJes0x0uF1hod+04RcRCJyYNjcGljRZPKnjPkPNz/M=;
        b=S4wk2oAST6SmgRV7YA8hLufdZ7gMv1XFwcsZed+1xTYExDICSz8x54YK0jL9h+NxV6
         tZLZSwe6r42lnizeSNRLohXmBRcw9zHUvNkLTVdEkE6H76rpZzfbPHionh8x2skBCJU6
         3s+MlryeDE1iqpAagKODUWD8AV9sPm0mIwCk+z/MSKtmsbzyFGGVb+PQ0gWSgTAcZoN/
         5sc30FIkOSjVy7oB3KWZoV4Aor+OZnHa+IhVgo7KLJZ/800AOyiNgTKgKe3wz4gO6L1R
         8cfrniF13Oxduyvcpq3ieQmXlYnfr9DRvryCYrsp239qpwL7geogtQ94OzkEChvun3ml
         92xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mgJes0x0uF1hod+04RcRCJyYNjcGljRZPKnjPkPNz/M=;
        b=dteoJMEEL5cBRZ4ZP0zTNRmwCWdcxg6fAU/W8h63bd+6Q+8wmXWsRjhcLupzEoDAh6
         i1WXSCLoQJU39IMw1BtaMN4M+xZ+qJGSO5PR+FBzyuI6MsV4XrJN1lKa/H4mos+G5pzE
         APd2Sure1KT8VHZG1P16s9R60Rb6fuA23lCEgQLJN2rQjdjenSib9tpaBMY63cnjciBT
         PIiwfNQmU1CuaM4qFTY2P+sPL0mYmih7M8WqU9JvaS2ihzCGTirevBa1WycrcJNhxNl8
         qoNvqqSB4uYFZ9yQCvnKDLwTyk9wPJsNHH6yhiVzZVSG0DZvYiTsZrUPo3yggMOd5NHr
         n4xg==
X-Gm-Message-State: AOAM5322dGkpZvSH0R/3m7vuCn6SkZcwUkGQO3+HhR7aeyMEuLJ5Ikmr
        VpMY7T8tmiwQ942R/FWTg9s=
X-Google-Smtp-Source: ABdhPJw0yhHaRWpKfgXmbZDqnNtsOQKqLWsypTlw75fAqUwiDRGjb3VW+vxQpdfFe3D7jBEU+vaivQ==
X-Received: by 2002:a37:80c:: with SMTP id 12mr39978906qki.149.1596123333465;
        Thu, 30 Jul 2020 08:35:33 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id i7sm659047qtb.27.2020.07.30.08.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 08:35:32 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab+huawei@kernel.org, sean@mess.org,
        kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de
Cc:     "Daniel W . S . Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [v8 2/4] media: vidtv: implement a demodulator driver
Date:   Thu, 30 Jul 2020 12:34:59 -0300
Message-Id: <20200730153501.742993-3-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200730153501.742993-1-dwlsalmeida@gmail.com>
References: <20200730153501.742993-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

Implement a I2C demodulator driver, simulating support for DVB-T, DVB-C
and DVB-S.

This demodulator will periodically check the signal quality against a table
and drop the TS lock if it drops below a threshold value, regaining it in
the event that the signal improves.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/test-drivers/vidtv/Makefile     |   3 +-
 .../media/test-drivers/vidtv/vidtv_demod.c    | 440 ++++++++++++++++++
 .../media/test-drivers/vidtv/vidtv_demod.h    |  73 +++
 3 files changed, 515 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_demod.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_demod.h

diff --git a/drivers/media/test-drivers/vidtv/Makefile b/drivers/media/test-drivers/vidtv/Makefile
index 58e022c094e5..21e50c11c94d 100644
--- a/drivers/media/test-drivers/vidtv/Makefile
+++ b/drivers/media/test-drivers/vidtv/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
 dvb-vidtv-tuner-objs := vidtv_tuner.o
+dvb-vidtv-demod-objs := vidtv_demod.o
 
-obj-$(CONFIG_DVB_VIDTV)	+= dvb-vidtv-tuner.o
+obj-$(CONFIG_DVB_VIDTV)	+= dvb-vidtv-tuner.o dvb-vidtv-demod.o
diff --git a/drivers/media/test-drivers/vidtv/vidtv_demod.c b/drivers/media/test-drivers/vidtv/vidtv_demod.c
new file mode 100644
index 000000000000..25c895912505
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_demod.c
@@ -0,0 +1,440 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * The Virtual DVB test driver serves as a reference DVB driver and helps
+ * validate the existing APIs in the media subsystem. It can also aid
+ * developers working on userspace applications.
+ *
+ * Copyright (C) 2020 Daniel W. S. Almeida
+ * Based on the example driver written by Emard <emard@softhome.net>
+ */
+
+#include <linux/errno.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/printk.h>
+#include <linux/random.h>
+#include <linux/ratelimit.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/workqueue.h>
+#include <media/dvb_frontend.h>
+
+#include "vidtv_demod.h"
+
+#define POLL_THRD_TIME 2000 /* ms */
+
+static const struct vidtv_demod_cnr_to_qual_s vidtv_demod_c_cnr_2_qual[] = {
+	/* from libdvbv5 source code, in milli db */
+	{ QAM_256, FEC_NONE,  34000, 38000},
+	{ QAM_64,  FEC_NONE,  30000, 34000},
+};
+
+static const struct vidtv_demod_cnr_to_qual_s vidtv_demod_s_cnr_2_qual[] = {
+	/* from libdvbv5 source code, in milli db */
+	{ QPSK, FEC_1_2,  7000, 10000},
+	{ QPSK, FEC_2_3,  9000, 12000},
+	{ QPSK, FEC_3_4, 10000, 13000},
+	{ QPSK, FEC_5_6, 11000, 14000},
+	{ QPSK, FEC_7_8, 12000, 15000},
+};
+
+static const struct vidtv_demod_cnr_to_qual_s vidtv_demod_s2_cnr_2_qual[] = {
+	/* from libdvbv5 source code, in milli db */
+	{ QPSK,  FEC_1_2,   9000,  12000},
+	{ QPSK,  FEC_2_3,  11000,  14000},
+	{ QPSK,  FEC_3_4,  12000,  15000},
+	{ QPSK,  FEC_5_6,  12000,  15000},
+	{ QPSK,  FEC_8_9,  13000,  16000},
+	{ QPSK,  FEC_9_10, 13500,  16500},
+	{ PSK_8, FEC_2_3,  14500,  17500},
+	{ PSK_8, FEC_3_4,  16000,  19000},
+	{ PSK_8, FEC_5_6,  17500,  20500},
+	{ PSK_8, FEC_8_9,  19000,  22000},
+};
+
+static const struct vidtv_demod_cnr_to_qual_s vidtv_demod_t_cnr_2_qual[] = {
+	/* from libdvbv5 source code, in milli db*/
+	{   QPSK, FEC_1_2,  4100,  5900},
+	{   QPSK, FEC_2_3,  6100,  9600},
+	{   QPSK, FEC_3_4,  7200, 12400},
+	{   QPSK, FEC_5_6,  8500, 15600},
+	{   QPSK, FEC_7_8,  9200, 17500},
+	{ QAM_16, FEC_1_2,  9800, 11800},
+	{ QAM_16, FEC_2_3, 12100, 15300},
+	{ QAM_16, FEC_3_4, 13400, 18100},
+	{ QAM_16, FEC_5_6, 14800, 21300},
+	{ QAM_16, FEC_7_8, 15700, 23600},
+	{ QAM_64, FEC_1_2, 14000, 16000},
+	{ QAM_64, FEC_2_3, 19900, 25400},
+	{ QAM_64, FEC_3_4, 24900, 27900},
+	{ QAM_64, FEC_5_6, 21300, 23300},
+	{ QAM_64, FEC_7_8, 22000, 24000},
+};
+
+static const struct vidtv_demod_cnr_to_qual_s
+	     *vidtv_match_cnr_s(struct dvb_frontend *fe)
+{
+	struct dtv_frontend_properties *c;
+	const struct vidtv_demod_cnr_to_qual_s *cnr2qual = NULL;
+	u32 array_size = 0;
+	u32 i;
+
+	c = &fe->dtv_property_cache;
+
+	switch (c->delivery_system) {
+	case SYS_DVBT:
+	case SYS_DVBT2:
+		cnr2qual   = vidtv_demod_t_cnr_2_qual;
+		array_size = ARRAY_SIZE(vidtv_demod_t_cnr_2_qual);
+		break;
+
+	case SYS_DVBS:
+		cnr2qual   = vidtv_demod_s_cnr_2_qual;
+		array_size = ARRAY_SIZE(vidtv_demod_s_cnr_2_qual);
+		break;
+
+	case SYS_DVBS2:
+		cnr2qual   = vidtv_demod_s2_cnr_2_qual;
+		array_size = ARRAY_SIZE(vidtv_demod_s2_cnr_2_qual);
+		break;
+
+	case SYS_DVBC_ANNEX_A:
+		cnr2qual   = vidtv_demod_c_cnr_2_qual;
+		array_size = ARRAY_SIZE(vidtv_demod_c_cnr_2_qual);
+		break;
+
+	default:
+		pr_warn_ratelimited("%s: unsupported delivery system: %u\n",
+				    __func__,
+				    c->delivery_system);
+		break;
+	}
+
+	for (i = 0; i < array_size; i++)
+		if (cnr2qual[i].modulation == c->modulation &&
+		    cnr2qual[i].fec == c->fec_inner)
+			return &cnr2qual[i];
+
+	return NULL; /* not found */
+}
+
+static void vidtv_demod_poll_snr_handler(struct work_struct *work)
+{
+	/*
+	 * periodically check the signal quality and eventually
+	 * lose the TS lock if it dips too low
+	 */
+	struct vidtv_demod_state *state;
+	const struct vidtv_demod_cnr_to_qual_s *cnr2qual = NULL;
+	struct vidtv_demod_config *config;
+	u16 snr = 0;
+
+	state  = container_of(work, struct vidtv_demod_state, poll_snr.work);
+	config = &state->config;
+
+	if (!state->frontend.ops.tuner_ops.get_rf_strength)
+		return;
+
+	state->frontend.ops.tuner_ops.get_rf_strength(&state->frontend, &snr);
+
+	cnr2qual = vidtv_match_cnr_s(&state->frontend);
+	if (!cnr2qual)
+		return;
+
+	if (snr < cnr2qual->cnr_ok) {
+		/* eventually lose the TS lock */
+		if (prandom_u32_max(100) < config->drop_tslock_prob_on_low_snr)
+			state->status = 0;
+	} else {
+		/* recover if the signal improves */
+		if (prandom_u32_max(100) <
+		    config->recover_tslock_prob_on_good_snr)
+			state->status = FE_HAS_SIGNAL  |
+					FE_HAS_CARRIER |
+					FE_HAS_VITERBI |
+					FE_HAS_SYNC    |
+					FE_HAS_LOCK;
+	}
+
+	schedule_delayed_work(&state->poll_snr,
+			      msecs_to_jiffies(POLL_THRD_TIME));
+}
+
+static int vidtv_demod_read_status(struct dvb_frontend *fe,
+				   enum fe_status *status)
+{
+	struct vidtv_demod_state *state = fe->demodulator_priv;
+
+	*status = state->status;
+
+	return 0;
+}
+
+static int vidtv_demod_read_ber(struct dvb_frontend *fe, u32 *ber)
+{
+	*ber = 0;
+	return 0;
+}
+
+static int vidtv_demod_read_signal_strength(struct dvb_frontend *fe,
+					    u16 *strength)
+{
+	*strength = 0;
+	return 0;
+}
+
+static int vidtv_demod_read_snr(struct dvb_frontend *fe, u16 *snr)
+{
+	*snr = 0;
+	return 0;
+}
+
+static int vidtv_demod_read_ucblocks(struct dvb_frontend *fe, u32 *ucblocks)
+{
+	*ucblocks = 0;
+	return 0;
+}
+
+/*
+ * NOTE:
+ * This is implemented here just to be used as an example for real
+ * demod drivers.
+ *
+ * Should only be implemented if it actually reads something from the hardware.
+ * Also, it should check for the locks, in order to avoid report wrong data
+ * to userspace.
+ */
+static int vidtv_demod_get_frontend(struct dvb_frontend *fe,
+				    struct dtv_frontend_properties *p)
+{
+	return 0;
+}
+
+static int vidtv_demod_set_frontend(struct dvb_frontend *fe)
+{
+	struct vidtv_demod_state *state            = fe->demodulator_priv;
+	const struct vidtv_demod_cnr_to_qual_s *cnr2qual = NULL;
+	u32 tuner_status                        = 0;
+
+	if (fe->ops.tuner_ops.set_params) {
+		fe->ops.tuner_ops.set_params(fe);
+
+		/* store the CNR returned by the tuner */
+		fe->ops.tuner_ops.get_rf_strength(fe, &state->tuner_cnr);
+
+		fe->ops.tuner_ops.get_status(fe, &tuner_status);
+		state->status = (state->tuner_cnr > 0) ?  FE_HAS_SIGNAL  |
+							  FE_HAS_CARRIER |
+							  FE_HAS_VITERBI |
+							  FE_HAS_SYNC    |
+							  FE_HAS_LOCK	 :
+							  0;
+		cnr2qual = vidtv_match_cnr_s(fe);
+
+		/* signal isn't good: might lose the lock eventually */
+		if (tuner_status == TUNER_STATUS_LOCKED &&
+		    state->tuner_cnr < cnr2qual->cnr_good) {
+			schedule_delayed_work(&state->poll_snr,
+					      msecs_to_jiffies(POLL_THRD_TIME));
+
+			state->poll_snr_thread_running = true;
+		}
+
+		if (fe->ops.i2c_gate_ctrl)
+			fe->ops.i2c_gate_ctrl(fe, 0);
+	}
+
+	return 0;
+}
+
+static int vidtv_demod_sleep(struct dvb_frontend *fe)
+{
+	struct vidtv_demod_state *state = fe->demodulator_priv;
+
+	if (state->poll_snr_thread_running) {
+		cancel_delayed_work_sync(&state->poll_snr);
+		state->poll_snr_thread_running = false;
+		state->poll_snr_thread_restart = true;
+	}
+	return 0;
+}
+
+static int vidtv_demod_init(struct dvb_frontend *fe)
+{
+	struct vidtv_demod_state *state = fe->demodulator_priv;
+	u32    tuner_status             = 0;
+
+	if (state->cold_start)
+		INIT_DELAYED_WORK(&state->poll_snr,
+				  &vidtv_demod_poll_snr_handler);
+
+	/*
+	 * At resume, start the snr poll thread only if it was suspended with
+	 * the thread running. Extra care should be taken here, as some tuner
+	 * status change might happen at resume time (for example, due to an
+	 * ioctl syscall to set_frontend, or due to a release syscall).
+	 */
+	fe->ops.tuner_ops.get_status(fe, &tuner_status);
+
+	if (tuner_status == TUNER_STATUS_LOCKED &&
+	    state->poll_snr_thread_restart) {
+		schedule_delayed_work(&state->poll_snr,
+				      msecs_to_jiffies(POLL_THRD_TIME));
+
+		state->poll_snr_thread_restart = false;
+	}
+
+	state->cold_start = false;
+	return 0;
+}
+
+/*
+ * NOTE:
+ * This is implemented here just to be used as an example for real
+ * demod drivers.
+ *
+ * Should only be implemented if the demod has support for DVB-S or DVB-S2
+ */
+static int vidtv_demod_set_tone(struct dvb_frontend *fe,
+				enum fe_sec_tone_mode tone)
+{
+	return 0;
+}
+
+/*
+ * NOTE:
+ * This is implemented here just to be used as an example for real
+ * demod drivers.
+ *
+ * Should only be implemented if the demod has support for DVB-S or DVB-S2
+ */
+static int vidtv_demod_set_voltage(struct dvb_frontend *fe,
+				   enum fe_sec_voltage voltage)
+{
+	return 0;
+}
+
+static void vidtv_demod_release(struct dvb_frontend *fe)
+{
+	struct vidtv_demod_state *state = fe->demodulator_priv;
+
+	if (state->poll_snr_thread_running)
+		cancel_delayed_work_sync(&state->poll_snr);
+
+	kfree(state);
+}
+
+static const struct dvb_frontend_ops vidtv_demod_ops = {
+	.delsys = {
+		SYS_DVBT,
+		SYS_DVBT2,
+		SYS_DVBC_ANNEX_A,
+		SYS_DVBS,
+		SYS_DVBS2,
+	},
+
+	.info = {
+		.name                   = "Dummy demod for DVB-T/T2/C/S/S2",
+		.frequency_min_hz       = 51 * MHz,
+		.frequency_max_hz       = 2150 * MHz,
+		.frequency_stepsize_hz  = 62500,
+		.frequency_tolerance_hz = 29500 * kHz,
+		.symbol_rate_min        = 1000000,
+		.symbol_rate_max        = 45000000,
+
+		.caps = FE_CAN_FEC_1_2 |
+			FE_CAN_FEC_2_3 |
+			FE_CAN_FEC_3_4 |
+			FE_CAN_FEC_4_5 |
+			FE_CAN_FEC_5_6 |
+			FE_CAN_FEC_6_7 |
+			FE_CAN_FEC_7_8 |
+			FE_CAN_FEC_8_9 |
+			FE_CAN_QAM_16 |
+			FE_CAN_QAM_64 |
+			FE_CAN_QAM_32 |
+			FE_CAN_QAM_128 |
+			FE_CAN_QAM_256 |
+			FE_CAN_QAM_AUTO |
+			FE_CAN_QPSK |
+			FE_CAN_FEC_AUTO |
+			FE_CAN_INVERSION_AUTO |
+			FE_CAN_TRANSMISSION_MODE_AUTO |
+			FE_CAN_GUARD_INTERVAL_AUTO |
+			FE_CAN_HIERARCHY_AUTO,
+	},
+
+	.release = vidtv_demod_release,
+
+	.init  = vidtv_demod_init,
+	.sleep = vidtv_demod_sleep,
+
+	.set_frontend = vidtv_demod_set_frontend,
+	.get_frontend = vidtv_demod_get_frontend,
+
+	.read_status          = vidtv_demod_read_status,
+	.read_ber             = vidtv_demod_read_ber,
+	.read_signal_strength = vidtv_demod_read_signal_strength,
+	.read_snr             = vidtv_demod_read_snr,
+	.read_ucblocks        = vidtv_demod_read_ucblocks,
+
+	/* For DVB-S/S2 */
+	.set_voltage = vidtv_demod_set_voltage,
+	.set_tone    = vidtv_demod_set_tone,
+};
+
+static const struct i2c_device_id vidtv_demod_i2c_id_table[] = {
+	{"dvb_vidtv_demod", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, vidtv_demod_i2c_id_table);
+
+static int vidtv_demod_i2c_probe(struct i2c_client *client,
+				 const struct i2c_device_id *id)
+{
+	struct vidtv_demod_state *state;
+
+	/* allocate memory for the internal state */
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return -ENOMEM;
+
+	/* create dvb_frontend */
+	memcpy(&state->frontend.ops,
+	       &vidtv_demod_ops,
+	       sizeof(struct dvb_frontend_ops));
+
+	state->frontend.demodulator_priv = state;
+	i2c_set_clientdata(client, state);
+
+	return 0;
+}
+
+static int vidtv_demod_i2c_remove(struct i2c_client *client)
+{
+	struct vidtv_demod_state *state = i2c_get_clientdata(client);
+
+	memset(&state->frontend.ops, 0, sizeof(struct dvb_frontend_ops));
+	state->frontend.demodulator_priv = NULL;
+	kfree(state);
+
+	return 0;
+}
+
+static struct i2c_driver vidtv_demod_i2c_driver = {
+	.driver = {
+		.name                = "dvb_vidtv_demod",
+		.suppress_bind_attrs = true,
+	},
+	.probe    = vidtv_demod_i2c_probe,
+	.remove   = vidtv_demod_i2c_remove,
+	.id_table = vidtv_demod_i2c_id_table,
+};
+
+module_i2c_driver(vidtv_demod_i2c_driver);
+
+MODULE_DESCRIPTION("Virtual DVB Demodulator Driver");
+MODULE_AUTHOR("Daniel W. S. Almeida");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/test-drivers/vidtv/vidtv_demod.h b/drivers/media/test-drivers/vidtv/vidtv_demod.h
new file mode 100644
index 000000000000..dfb36c515e4d
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_demod.h
@@ -0,0 +1,73 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * The Virtual DTV test driver serves as a reference DVB driver and helps
+ * validate the existing APIs in the media subsystem. It can also aid
+ * developers working on userspace applications.
+ *
+ * Copyright (C) 2020 Daniel W. S. Almeida
+ * Based on the example driver written by Emard <emard@softhome.net>
+ */
+
+#ifndef VIDTV_DEMOD_H
+#define VIDTV_DEMOD_H
+
+#include <linux/dvb/frontend.h>
+#include <media/dvb_frontend.h>
+
+/**
+ * struct vidtv_demod_cnr_to_qual_s - Map CNR values to a given combination of
+ * modulation and fec_inner
+ * @modulation: see enum fe_modulation
+ * @fec: see enum fe_fec_rate
+ *
+ * This struct matches values for 'good' and 'ok' CNRs given the combination
+ * of modulation and fec_inner in use. We might simulate some noise if the
+ * signal quality is not too good.
+ *
+ * The values were taken from libdvbv5.
+ */
+struct vidtv_demod_cnr_to_qual_s {
+	u32 modulation;
+	u32 fec;
+	u32 cnr_ok;
+	u32 cnr_good;
+};
+
+/**
+ * struct vidtv_demod_config - Configuration used to init the demod
+ * @drop_tslock_prob_on_low_snr: probability of losing the lock due to low snr
+ * @recover_tslock_prob_on_good_snr: probability of recovering when the signal
+ * improves
+ *
+ * The configuration used to init the demodulator module, usually filled
+ * by a bridge driver. For vidtv, this is filled by vidtv_bridge before the
+ * demodulator module is probed.
+ */
+struct vidtv_demod_config {
+	u8 drop_tslock_prob_on_low_snr;
+	u8 recover_tslock_prob_on_good_snr;
+};
+
+/**
+ * struct vidtv_demod_state - The demodulator state
+ * @frontend: The frontend structure allocated by the demod.
+ * @config: The config used to init the demod.
+ * @poll_snr: The task responsible for periodically checking the simulated
+ * signal quality, eventually dropping or reacquiring the TS lock.
+ * @status: the demod status.
+ * @cold_start: Whether the demod has not been init yet.
+ * @poll_snr_thread_running: Whether the task responsible for periodically
+ * checking the simulated signal quality is running.
+ * @poll_snr_thread_restart: Whether we should restart the poll_snr task.
+ */
+struct vidtv_demod_state {
+	struct dvb_frontend frontend;
+	struct vidtv_demod_config config;
+	struct delayed_work poll_snr;
+	enum fe_status status;
+	u16 tuner_cnr;
+	bool cold_start;
+	bool poll_snr_thread_running;
+	bool poll_snr_thread_restart;
+};
+#endif // VIDTV_DEMOD_H
-- 
2.27.0

