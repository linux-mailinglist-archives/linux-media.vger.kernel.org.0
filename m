Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 895581A019E
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 01:21:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbgDFXVW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 19:21:22 -0400
Received: from mail-qv1-f66.google.com ([209.85.219.66]:45090 "EHLO
        mail-qv1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726609AbgDFXVU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 19:21:20 -0400
Received: by mail-qv1-f66.google.com with SMTP id g4so938320qvo.12;
        Mon, 06 Apr 2020 16:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2MaBBtlcwrQR73kUqcQ71IliJ78QCREkk/vMNb4lqjI=;
        b=lu6tQh87CK4IGQ5ZuOri4TIgzTQK0x92XhWrlfuFPBWDEZLNSVaN0WJ2mOCRPFj/Vu
         6eN6cT3vHT4n5+uiW1Veo90DGRJvgYpdbLK/w+O+u3hO8hFltHMrRi76APSGkCBbiLuB
         o7p+CQ7ChSD7QUdaptisswic0P3xct/rHm/UJg9JLQ7AzqDwQimlBhiyjtxzgni+9JpL
         eLA74HXflPlx+VwEts0yMtSWer79myp51jcMQlbuKCA6mYaINSkR+UsLTiefV2nzNyVz
         vws+p5luY3UzqpJXaJKQkYK4xr7GcXWAzD2X110+5SEIUdOXdqood13c3DEfFtEaTiqg
         maCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2MaBBtlcwrQR73kUqcQ71IliJ78QCREkk/vMNb4lqjI=;
        b=r+nK+sk33l2yZSrrznKxL+XStxkByH+x/vWMz1e+4wMnVYr7UvqDwMLhCptxIG5iJe
         EK2xLP2wfCSe1pVw/Jc1Vo7Qg6KecP7UAzCOXyA4lSjCnzNQt5FVHrz+L5caYw7N30JU
         fpD3Ujzlf703XaAE82BPwQBHUlFswzXNBOSrbjh1eg5HnkdRmx0R5lBLkW4kLYP8Bgoi
         RzWCJy4JIVnr1KzCdMLvMmt3r11noyGxCDiOpJVIjZeS9fwpN8Ef2aNbSzYFqeXXLP88
         GBEcYlygur1LngW0tsJ1LP4RV2VXRKQPZdlrHOE3c5p8Vu5Py532H2JDhL6YD64C7kkg
         bAOw==
X-Gm-Message-State: AGi0Puai+RofP7jNLMf368nFH5sy5vnDCNS2VAYvvUkZlKwkwI4xRDV1
        W5BxDLxkVOfEhlhKx+ShC2LAJXj52CM=
X-Google-Smtp-Source: APiQypJb6/FG3OJzFK7dzxPRZX6MSkzonV2j5W3pFKWjsygp4EcFn+azdvtdtlf//ABVftcQ6kRmJg==
X-Received: by 2002:a0c:a602:: with SMTP id s2mr2303910qva.222.1586215278507;
        Mon, 06 Apr 2020 16:21:18 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
        by smtp.gmail.com with ESMTPSA id u26sm1490978qku.54.2020.04.06.16.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 16:21:17 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab+huawei@kernel.org, sean@mess.org,
        kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [RFC, WIP, v3 3/6] media: vidtv: implement a demodulator driver
Date:   Mon,  6 Apr 2020 20:20:52 -0300
Message-Id: <20200406232055.1023946-4-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200406232055.1023946-1-dwlsalmeida@gmail.com>
References: <20200406232055.1023946-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Implement a I2C demodulator driver, simulating support for DVB-T, DVB-C
and DVB-S.

This demodulator will periodically check the signal quality against a table
and drop the TS lock if it drops below a threshold value, regaining it in
the event that the signal improves.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/test_drivers/vidtv/Makefile     |   2 +-
 .../media/test_drivers/vidtv/vidtv_demod.c    | 493 ++++++++++++++++++
 .../media/test_drivers/vidtv/vidtv_demod.h    |  43 ++
 3 files changed, 537 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/test_drivers/vidtv/vidtv_demod.c
 create mode 100644 drivers/media/test_drivers/vidtv/vidtv_demod.h

diff --git a/drivers/media/test_drivers/vidtv/Makefile b/drivers/media/test_drivers/vidtv/Makefile
index e625810a82603..36ba00ddc0d1e 100644
--- a/drivers/media/test_drivers/vidtv/Makefile
+++ b/drivers/media/test_drivers/vidtv/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-$(CONFIG_DVB_VIDTV)	+= vidtv_tuner.o
+obj-$(CONFIG_DVB_VIDTV)	+= vidtv_tuner.o  vidtv_demod.o
diff --git a/drivers/media/test_drivers/vidtv/vidtv_demod.c b/drivers/media/test_drivers/vidtv/vidtv_demod.c
new file mode 100644
index 0000000000000..803fe1a89b7ec
--- /dev/null
+++ b/drivers/media/test_drivers/vidtv/vidtv_demod.c
@@ -0,0 +1,493 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * The Virtual DVB test driver serves as a reference DVB driver and helps
+ * validate the existing APIs in the media subsystem. It can also aid
+ * developers working on userspace applications.
+ *
+ * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
+ * Based on the example driver written by Emard <emard@softhome.net>
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/string.h>
+#include <linux/slab.h>
+#include <linux/workqueue.h>
+#include <linux/random.h>
+#include <linux/errno.h>
+#include <linux/i2c.h>
+#include <media/dvb_frontend.h>
+#include "vidtv_demod.h"
+
+MODULE_DESCRIPTION("Virtual DVB Demodulator Driver");
+MODULE_AUTHOR("Daniel W. S. Almeida");
+MODULE_LICENSE("GPL");
+
+struct vidtv_demod_cnr_to_qual_s vidtv_demod_c_cnr_2_qual[] = {
+	/* from libdvbv5 source code, in milli db */
+	{ QAM_256, FEC_NONE,  34000, 38000},
+	{ QAM_64,  FEC_NONE,  30000, 34000},
+};
+
+struct vidtv_demod_cnr_to_qual_s vidtv_demod_s_cnr_2_qual[] = {
+	/* from libdvbv5 source code, in milli db */
+	{ QPSK, FEC_1_2,  7000, 10000},
+	{ QPSK, FEC_2_3,  9000, 12000},
+	{ QPSK, FEC_3_4, 10000, 13000},
+	{ QPSK, FEC_5_6, 11000, 14000},
+	{ QPSK, FEC_7_8, 12000, 15000},
+};
+
+struct vidtv_demod_cnr_to_qual_s vidtv_demod_s2_cnr_2_qual[] = {
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
+static struct vidtv_demod_cnr_to_qual_s vidtv_demod_t_cnr_2_qual[] = {
+	/* from libdvbv5 source code, in milli db*/
+	{   QPSK, FEC_1_2,  4100,  5900},
+	{   QPSK, FEC_2_3,  6100,  9600},
+	{   QPSK, FEC_3_4,  7200, 12400},
+	{   QPSK, FEC_5_6,  8500, 15600},
+	{   QPSK, FEC_7_8,  9200, 17500},
+
+	{ QAM_16, FEC_1_2,  9800, 11800},
+	{ QAM_16, FEC_2_3, 12100, 15300},
+	{ QAM_16, FEC_3_4, 13400, 18100},
+	{ QAM_16, FEC_5_6, 14800, 21300},
+	{ QAM_16, FEC_7_8, 15700, 23600},
+
+	{ QAM_64, FEC_1_2, 14000, 16000},
+	{ QAM_64, FEC_2_3, 19900, 25400},
+	{ QAM_64, FEC_3_4, 24900, 27900},
+	{ QAM_64, FEC_5_6, 21300, 23300},
+	{ QAM_64, FEC_7_8, 22000, 24000},
+};
+
+static struct vidtv_demod_cnr_to_qual_s
+*vidtv_match_cnr_s(struct dvb_frontend *fe)
+{
+	struct dtv_frontend_properties *c;
+	struct vidtv_demod_cnr_to_qual_s *cnr2qual = NULL;
+	u32 array_size = 0;
+	u32 i;
+
+	c = &fe->dtv_property_cache;
+
+	switch (c->delivery_system) {
+	case SYS_DVBT:
+	case SYS_DVBT2:
+		cnr2qual = vidtv_demod_t_cnr_2_qual;
+		array_size = ARRAY_SIZE(vidtv_demod_t_cnr_2_qual);
+		break;
+
+	case SYS_DVBS:
+		cnr2qual = vidtv_demod_s_cnr_2_qual;
+		array_size = ARRAY_SIZE(vidtv_demod_s_cnr_2_qual);
+		break;
+
+	case SYS_DVBS2:
+		cnr2qual = vidtv_demod_s2_cnr_2_qual;
+		array_size = ARRAY_SIZE(vidtv_demod_s2_cnr_2_qual);
+		break;
+
+	case SYS_DVBC_ANNEX_A:
+		cnr2qual = vidtv_demod_c_cnr_2_qual;
+		array_size = ARRAY_SIZE(vidtv_demod_c_cnr_2_qual);
+		break;
+
+	default:
+		pr_warn("%s: unsupported delivery system: %u\n",
+			__func__,
+			c->delivery_system);
+		break;
+	}
+
+	for (i = 0; i <= array_size; i++)
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
+	struct dtv_frontend_properties *c;
+	struct vidtv_demod_cnr_to_qual_s *cnr2qual = NULL;
+	struct vidtv_demod_config *config;
+	u16 snr = 0;
+
+	state = container_of(work, struct vidtv_demod_state, poll_snr.work);
+	c = &state->frontend.dtv_property_cache;
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
+	schedule_delayed_work(&state->poll_snr, msecs_to_jiffies(2000));
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
+	struct vidtv_demod_state *state = fe->demodulator_priv;
+	struct vidtv_demod_cnr_to_qual_s *cnr2qual = NULL;
+	u32 tuner_status = 0;
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
+							  FE_HAS_LOCK    :
+							  0;
+		cnr2qual = vidtv_match_cnr_s(fe);
+
+		/* signal isn't good: might lose the lock eventually */
+		if (tuner_status == TUNER_STATUS_LOCKED &&
+		    state->tuner_cnr < cnr2qual->cnr_good) {
+			schedule_delayed_work(&state->poll_snr,
+					      msecs_to_jiffies(2000));
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
+	u32 tuner_status = 0;
+
+	if (state->cold_start)
+		INIT_DELAYED_WORK(&state->poll_snr,
+				  &vidtv_demod_poll_snr_handler);
+
+	/*
+	 * At resume, start the snr poll thread only if it was suspended with
+	 * the thread running. Extra care should be taken here, as some tuner
+	 * status change might happen at resume time (for example, due to a
+	 * ioctl syscall to set_frontend, or due to a release syscall).
+	 */
+	fe->ops.tuner_ops.get_status(fe, &tuner_status);
+
+	if (tuner_status == TUNER_STATUS_LOCKED &&
+	    state->poll_snr_thread_restart) {
+		schedule_delayed_work(&state->poll_snr,
+				      msecs_to_jiffies(2000));
+
+		state->poll_snr_thread_restart = false;
+	}
+
+	state->cold_start = false;
+	return 0;
+}
+
+static int vidtv_demod_set_tone(struct dvb_frontend *fe,
+				enum fe_sec_tone_mode tone)
+{
+	return 0;
+}
+
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
+static const struct dvb_frontend_ops vidtv_demod_ofdm_ops = {
+	.delsys = { SYS_DVBT },
+	.info = {
+		.name			= "Dummy DVB-T",
+		.frequency_min_hz	= 0,
+		.frequency_max_hz	= 863250 * kHz,
+		.frequency_stepsize_hz	= 62500,
+		.caps = FE_CAN_FEC_1_2 |
+			FE_CAN_FEC_2_3 |
+			FE_CAN_FEC_3_4 |
+			FE_CAN_FEC_4_5 |
+			FE_CAN_FEC_5_6 |
+			FE_CAN_FEC_6_7 |
+			FE_CAN_FEC_7_8 |
+			FE_CAN_FEC_8_9 |
+			FE_CAN_FEC_AUTO |
+			FE_CAN_QAM_16 |
+			FE_CAN_QAM_64 |
+			FE_CAN_QAM_AUTO |
+			FE_CAN_TRANSMISSION_MODE_AUTO |
+			FE_CAN_GUARD_INTERVAL_AUTO |
+			FE_CAN_HIERARCHY_AUTO,
+	},
+
+	.release = vidtv_demod_release,
+
+	.init = vidtv_demod_init,
+	.sleep = vidtv_demod_sleep,
+
+	.set_frontend = vidtv_demod_set_frontend,
+	.get_frontend = vidtv_demod_get_frontend,
+
+	.read_status = vidtv_demod_read_status,
+	.read_ber = vidtv_demod_read_ber,
+	.read_signal_strength = vidtv_demod_read_signal_strength,
+	.read_snr = vidtv_demod_read_snr,
+	.read_ucblocks = vidtv_demod_read_ucblocks,
+};
+
+static const struct dvb_frontend_ops vidtv_demod_qam_ops = {
+	.delsys = { SYS_DVBC_ANNEX_A },
+	.info = {
+		.name			= "Dummy DVB-C",
+		.frequency_min_hz	=  51 * MHz,
+		.frequency_max_hz	= 858 * MHz,
+		.frequency_stepsize_hz	= 62500,
+		/* symbol_rate_min: SACLK/64 == (XIN/2)/64 */
+		.symbol_rate_min	= (57840000 / 2) / 64,
+		.symbol_rate_max	= (57840000 / 2) / 4,   /* SACLK/4 */
+		.caps = FE_CAN_QAM_16 |
+			FE_CAN_QAM_32 |
+			FE_CAN_QAM_64 |
+			FE_CAN_QAM_128 |
+			FE_CAN_QAM_256 |
+			FE_CAN_FEC_AUTO |
+			FE_CAN_INVERSION_AUTO
+	},
+
+	.release = vidtv_demod_release,
+
+	.init = vidtv_demod_init,
+	.sleep = vidtv_demod_sleep,
+
+	.set_frontend = vidtv_demod_set_frontend,
+	.get_frontend = vidtv_demod_get_frontend,
+
+	.read_status = vidtv_demod_read_status,
+	.read_ber = vidtv_demod_read_ber,
+	.read_signal_strength = vidtv_demod_read_signal_strength,
+	.read_snr = vidtv_demod_read_snr,
+	.read_ucblocks = vidtv_demod_read_ucblocks,
+};
+
+static const struct dvb_frontend_ops vidtv_demod_qpsk_ops = {
+	.delsys = { SYS_DVBS },
+	.info = {
+		.name			= "Dummy DVB-S",
+		.frequency_min_hz	=  950 * MHz,
+		.frequency_max_hz	= 2150 * MHz,
+		.frequency_stepsize_hz	= 250 * kHz,
+		.frequency_tolerance_hz	= 29500 * kHz,
+		.symbol_rate_min	= 1000000,
+		.symbol_rate_max	= 45000000,
+		.caps = FE_CAN_INVERSION_AUTO |
+			FE_CAN_FEC_1_2 |
+			FE_CAN_FEC_2_3 |
+			FE_CAN_FEC_3_4 |
+			FE_CAN_FEC_5_6 |
+			FE_CAN_FEC_7_8 |
+			FE_CAN_FEC_AUTO |
+			FE_CAN_QPSK
+	},
+
+	.release = vidtv_demod_release,
+
+	.init = vidtv_demod_init,
+	.sleep = vidtv_demod_sleep,
+
+	.set_frontend = vidtv_demod_set_frontend,
+	.get_frontend = vidtv_demod_get_frontend,
+
+	.read_status = vidtv_demod_read_status,
+	.read_ber = vidtv_demod_read_ber,
+	.read_signal_strength = vidtv_demod_read_signal_strength,
+	.read_snr = vidtv_demod_read_snr,
+	.read_ucblocks = vidtv_demod_read_ucblocks,
+
+	.set_voltage = vidtv_demod_set_voltage,
+	.set_tone = vidtv_demod_set_tone,
+};
+
+static const struct i2c_device_id vidtv_demod_i2c_id_table[] = {
+	{"vidtv_demod", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, vidtv_demod_i2c_id_table);
+
+static int vidtv_demod_i2c_probe(struct i2c_client *client,
+				 const struct i2c_device_id *id)
+{
+	struct vidtv_demod_config *config = client->dev.platform_data;
+	struct vidtv_demod_state *state;
+	const struct dvb_frontend_ops *ops;
+
+	/* allocate memory for the internal state */
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return -ENOMEM;
+
+	switch (config->chosen_delsys) {
+	case SYS_DVBT:
+		ops = &vidtv_demod_ofdm_ops;
+		break;
+	case SYS_DVBC_ANNEX_A:
+		ops = &vidtv_demod_qam_ops;
+		break;
+	case SYS_DVBS:
+		ops = &vidtv_demod_qpsk_ops;
+		break;
+	default:
+		pr_err("%s: Unsupported delivery system. Falling back to DVB-T",
+		       __func__);
+		ops = &vidtv_demod_ofdm_ops;
+		break;
+	}
+
+	/* create dvb_frontend */
+	memcpy(&state->frontend.ops,
+	       ops,
+	       sizeof(struct dvb_frontend_ops));
+
+	state->frontend.demodulator_priv = state;
+	/* return the pointer to the bridge driver */
+	config->frontend = &state->frontend;
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
+		.name = "vidtv_demod",
+		.suppress_bind_attrs = true,
+	},
+	.probe		= vidtv_demod_i2c_probe,
+	.remove		= vidtv_demod_i2c_remove,
+	.id_table	= vidtv_demod_i2c_id_table,
+};
+
+module_i2c_driver(vidtv_demod_i2c_driver);
diff --git a/drivers/media/test_drivers/vidtv/vidtv_demod.h b/drivers/media/test_drivers/vidtv/vidtv_demod.h
new file mode 100644
index 0000000000000..49c2a43f71661
--- /dev/null
+++ b/drivers/media/test_drivers/vidtv/vidtv_demod.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * The Virtual DTV test driver serves as a reference DVB driver and helps
+ * validate the existing APIs in the media subsystem. It can also aid
+ * developers working on userspace applications.
+ *
+ * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
+ * Based on the example driver written by Emard <emard@softhome.net>
+ */
+
+#ifndef VIDTV_DEMOD_H
+#define VIDTV_DEMOD_H
+
+#include <linux/dvb/frontend.h>
+#include <media/dvb_frontend.h>
+
+struct vidtv_demod_cnr_to_qual_s {
+	/* attempt to use the same values as libdvbv5 */
+	u32 modulation;
+	u32 fec;
+	u32 cnr_ok, cnr_good;
+};
+
+struct vidtv_demod_config {
+	struct dvb_frontend *frontend;
+	/* probability of losing the lock due to low snr */
+	u8 drop_tslock_prob_on_low_snr;
+	/* probability of recovering when the signal improves */
+	u8 recover_tslock_prob_on_good_snr;
+	u8 chosen_delsys;
+};
+
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
2.26.0

