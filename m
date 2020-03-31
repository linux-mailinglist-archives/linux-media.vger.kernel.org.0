Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED491994E9
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 13:12:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730635AbgCaLMS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 07:12:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:57908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730628AbgCaLMQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 07:12:16 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9157E208E0;
        Tue, 31 Mar 2020 11:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585653135;
        bh=4l2aNeUZ0aVli1lUKW+ZvSWp0TGxK0qoDGbXSzj19VY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uJXiHlbX06+xD4PNtzkNh1q1dyrPnL1kpcBaJvXR39S5cyjoLy0QGFfB1En+Bfyw8
         xEnFc8OLejmfoxBjpOhtUCnKSTSobZHvyYN1332fIT0yUm7U+/ufclq73xf/ajKroW
         zAzwl6HOD/DzIK9O5fXdnLh9rBVkz1emOcKqDidA=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jJEoV-002bqb-Al; Tue, 31 Mar 2020 13:12:11 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v4 10/33] media: ddbridge: copy the dvb_dummy_fe driver to ddbridge
Date:   Tue, 31 Mar 2020 13:11:46 +0200
Message-Id: <ba952f536445a6ac3ab243bc9689d0625f95a0fa.1585651678.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585651678.git.mchehab+huawei@kernel.org>
References: <cover.1585651678.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As we'll be transforming the dvb-dummy-fe driver soon into a
virtual driver, let's first copy the existing one to ddbridge
as-is, as it is needed there.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/pci/ddbridge/ddbridge-dummy-fe.c    | 286 ++++++++++++++++++
 .../media/pci/ddbridge/ddbridge-dummy-fe.h    |  36 +++
 2 files changed, 322 insertions(+)
 create mode 100644 drivers/media/pci/ddbridge/ddbridge-dummy-fe.c
 create mode 100644 drivers/media/pci/ddbridge/ddbridge-dummy-fe.h

diff --git a/drivers/media/pci/ddbridge/ddbridge-dummy-fe.c b/drivers/media/pci/ddbridge/ddbridge-dummy-fe.c
new file mode 100644
index 000000000000..9ff1ebaa5e04
--- /dev/null
+++ b/drivers/media/pci/ddbridge/ddbridge-dummy-fe.c
@@ -0,0 +1,286 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  Driver for Dummy Frontend
+ *
+ *  Written by Emard <emard@softhome.net>
+ */
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/string.h>
+#include <linux/slab.h>
+
+#include <media/dvb_frontend.h>
+#include "dvb_dummy_fe.h"
+
+
+struct dvb_dummy_fe_state {
+	struct dvb_frontend frontend;
+};
+
+
+static int dvb_dummy_fe_read_status(struct dvb_frontend *fe,
+				    enum fe_status *status)
+{
+	*status = FE_HAS_SIGNAL
+		| FE_HAS_CARRIER
+		| FE_HAS_VITERBI
+		| FE_HAS_SYNC
+		| FE_HAS_LOCK;
+
+	return 0;
+}
+
+static int dvb_dummy_fe_read_ber(struct dvb_frontend *fe, u32 *ber)
+{
+	*ber = 0;
+	return 0;
+}
+
+static int dvb_dummy_fe_read_signal_strength(struct dvb_frontend *fe,
+					     u16 *strength)
+{
+	*strength = 0;
+	return 0;
+}
+
+static int dvb_dummy_fe_read_snr(struct dvb_frontend *fe, u16 *snr)
+{
+	*snr = 0;
+	return 0;
+}
+
+static int dvb_dummy_fe_read_ucblocks(struct dvb_frontend *fe, u32 *ucblocks)
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
+static int dvb_dummy_fe_get_frontend(struct dvb_frontend *fe,
+				     struct dtv_frontend_properties *p)
+{
+	return 0;
+}
+
+static int dvb_dummy_fe_set_frontend(struct dvb_frontend *fe)
+{
+	if (fe->ops.tuner_ops.set_params) {
+		fe->ops.tuner_ops.set_params(fe);
+		if (fe->ops.i2c_gate_ctrl)
+			fe->ops.i2c_gate_ctrl(fe, 0);
+	}
+
+	return 0;
+}
+
+static int dvb_dummy_fe_sleep(struct dvb_frontend *fe)
+{
+	return 0;
+}
+
+static int dvb_dummy_fe_init(struct dvb_frontend *fe)
+{
+	return 0;
+}
+
+static int dvb_dummy_fe_set_tone(struct dvb_frontend *fe,
+				 enum fe_sec_tone_mode tone)
+{
+	return 0;
+}
+
+static int dvb_dummy_fe_set_voltage(struct dvb_frontend *fe,
+				    enum fe_sec_voltage voltage)
+{
+	return 0;
+}
+
+static void dvb_dummy_fe_release(struct dvb_frontend *fe)
+{
+	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
+
+	kfree(state);
+}
+
+static const struct dvb_frontend_ops dvb_dummy_fe_ofdm_ops;
+
+struct dvb_frontend *dvb_dummy_fe_ofdm_attach(void)
+{
+	struct dvb_dummy_fe_state *state = NULL;
+
+	/* allocate memory for the internal state */
+	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
+	if (!state)
+		return NULL;
+
+	/* create dvb_frontend */
+	memcpy(&state->frontend.ops,
+	       &dvb_dummy_fe_ofdm_ops,
+	       sizeof(struct dvb_frontend_ops));
+
+	state->frontend.demodulator_priv = state;
+	return &state->frontend;
+}
+EXPORT_SYMBOL(dvb_dummy_fe_ofdm_attach);
+
+static const struct dvb_frontend_ops dvb_dummy_fe_qpsk_ops;
+
+struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void)
+{
+	struct dvb_dummy_fe_state *state = NULL;
+
+	/* allocate memory for the internal state */
+	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
+	if (!state)
+		return NULL;
+
+	/* create dvb_frontend */
+	memcpy(&state->frontend.ops,
+	       &dvb_dummy_fe_qpsk_ops,
+	       sizeof(struct dvb_frontend_ops));
+
+	state->frontend.demodulator_priv = state;
+	return &state->frontend;
+}
+EXPORT_SYMBOL(dvb_dummy_fe_qpsk_attach);
+
+static const struct dvb_frontend_ops dvb_dummy_fe_qam_ops;
+
+struct dvb_frontend *dvb_dummy_fe_qam_attach(void)
+{
+	struct dvb_dummy_fe_state *state = NULL;
+
+	/* allocate memory for the internal state */
+	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
+	if (!state)
+		return NULL;
+
+	/* create dvb_frontend */
+	memcpy(&state->frontend.ops,
+	       &dvb_dummy_fe_qam_ops,
+	       sizeof(struct dvb_frontend_ops));
+
+	state->frontend.demodulator_priv = state;
+	return &state->frontend;
+}
+EXPORT_SYMBOL(dvb_dummy_fe_qam_attach);
+
+static const struct dvb_frontend_ops dvb_dummy_fe_ofdm_ops = {
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
+	.release = dvb_dummy_fe_release,
+
+	.init = dvb_dummy_fe_init,
+	.sleep = dvb_dummy_fe_sleep,
+
+	.set_frontend = dvb_dummy_fe_set_frontend,
+	.get_frontend = dvb_dummy_fe_get_frontend,
+
+	.read_status = dvb_dummy_fe_read_status,
+	.read_ber = dvb_dummy_fe_read_ber,
+	.read_signal_strength = dvb_dummy_fe_read_signal_strength,
+	.read_snr = dvb_dummy_fe_read_snr,
+	.read_ucblocks = dvb_dummy_fe_read_ucblocks,
+};
+
+static const struct dvb_frontend_ops dvb_dummy_fe_qam_ops = {
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
+	.release = dvb_dummy_fe_release,
+
+	.init = dvb_dummy_fe_init,
+	.sleep = dvb_dummy_fe_sleep,
+
+	.set_frontend = dvb_dummy_fe_set_frontend,
+	.get_frontend = dvb_dummy_fe_get_frontend,
+
+	.read_status = dvb_dummy_fe_read_status,
+	.read_ber = dvb_dummy_fe_read_ber,
+	.read_signal_strength = dvb_dummy_fe_read_signal_strength,
+	.read_snr = dvb_dummy_fe_read_snr,
+	.read_ucblocks = dvb_dummy_fe_read_ucblocks,
+};
+
+static const struct dvb_frontend_ops dvb_dummy_fe_qpsk_ops = {
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
+	.release = dvb_dummy_fe_release,
+
+	.init = dvb_dummy_fe_init,
+	.sleep = dvb_dummy_fe_sleep,
+
+	.set_frontend = dvb_dummy_fe_set_frontend,
+	.get_frontend = dvb_dummy_fe_get_frontend,
+
+	.read_status = dvb_dummy_fe_read_status,
+	.read_ber = dvb_dummy_fe_read_ber,
+	.read_signal_strength = dvb_dummy_fe_read_signal_strength,
+	.read_snr = dvb_dummy_fe_read_snr,
+	.read_ucblocks = dvb_dummy_fe_read_ucblocks,
+
+	.set_voltage = dvb_dummy_fe_set_voltage,
+	.set_tone = dvb_dummy_fe_set_tone,
+};
+
+MODULE_DESCRIPTION("DVB DUMMY Frontend");
+MODULE_AUTHOR("Emard");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/pci/ddbridge/ddbridge-dummy-fe.h b/drivers/media/pci/ddbridge/ddbridge-dummy-fe.h
new file mode 100644
index 000000000000..463abf5ebd56
--- /dev/null
+++ b/drivers/media/pci/ddbridge/ddbridge-dummy-fe.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *  Driver for Dummy Frontend
+ *
+ *  Written by Emard <emard@softhome.net>
+ */
+
+#ifndef DVB_DUMMY_FE_H
+#define DVB_DUMMY_FE_H
+
+#include <linux/dvb/frontend.h>
+#include <media/dvb_frontend.h>
+
+#if IS_REACHABLE(CONFIG_DVB_DUMMY_FE)
+struct dvb_frontend *dvb_dummy_fe_ofdm_attach(void);
+struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void);
+struct dvb_frontend *dvb_dummy_fe_qam_attach(void);
+#else
+static inline struct dvb_frontend *dvb_dummy_fe_ofdm_attach(void)
+{
+	pr_warn("%s: driver disabled by Kconfig\n", __func__);
+	return NULL;
+}
+static inline struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void)
+{
+	pr_warn("%s: driver disabled by Kconfig\n", __func__);
+	return NULL;
+}
+static inline struct dvb_frontend *dvb_dummy_fe_qam_attach(void)
+{
+	pr_warn("%s: driver disabled by Kconfig\n", __func__);
+	return NULL;
+}
+#endif /* CONFIG_DVB_DUMMY_FE */
+
+#endif // DVB_DUMMY_FE_H
-- 
2.25.1

