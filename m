Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DECD9199505
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 13:12:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730615AbgCaLMb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 07:12:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:57936 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730601AbgCaLMP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 07:12:15 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 535B2215A4;
        Tue, 31 Mar 2020 11:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585653133;
        bh=Sr4EDHeWsoepxEEORnMb357aha/CxSRYyX13EtpsuhI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Kxj/nMxrKWgfUKLcLHfmcQ77tYKxKr00Krxzf7h5D+pSBlNM0sR/Jex5hOCR6XikO
         5uTPdhY9l5jwpPpVedxRVwPtvfY8oJGChVSluelfUmESKXeSbw8l1UuX6B4E1qMp48
         UDUDMd4TzkPIVK9Yrsu5X5awgpnbMA0D7+3tJI4s=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jJEoV-002bqg-C5; Tue, 31 Mar 2020 13:12:11 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v4 11/33] media: ddbridge-dummy_fe: do some vars and function renames
Date:   Tue, 31 Mar 2020 13:11:47 +0200
Message-Id: <eae897da2bb08623acc9f0d7e607b10f4755865f.1585651678.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585651678.git.mchehab+huawei@kernel.org>
References: <cover.1585651678.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As the name of this driver is now ddbridge-dummy, do some
renames internally.

No functional changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/pci/ddbridge/ddbridge-dummy-fe.c    | 144 +++++++++---------
 .../media/pci/ddbridge/ddbridge-dummy-fe.h    |  22 +--
 2 files changed, 83 insertions(+), 83 deletions(-)

diff --git a/drivers/media/pci/ddbridge/ddbridge-dummy-fe.c b/drivers/media/pci/ddbridge/ddbridge-dummy-fe.c
index 9ff1ebaa5e04..ebf4d9c30a55 100644
--- a/drivers/media/pci/ddbridge/ddbridge-dummy-fe.c
+++ b/drivers/media/pci/ddbridge/ddbridge-dummy-fe.c
@@ -11,15 +11,15 @@
 #include <linux/slab.h>
 
 #include <media/dvb_frontend.h>
-#include "dvb_dummy_fe.h"
+#include "ddbridge-dummy-fe.h"
 
 
-struct dvb_dummy_fe_state {
+struct ddbridge_dummy_fe_state {
 	struct dvb_frontend frontend;
 };
 
 
-static int dvb_dummy_fe_read_status(struct dvb_frontend *fe,
+static int ddbridge_dummy_fe_read_status(struct dvb_frontend *fe,
 				    enum fe_status *status)
 {
 	*status = FE_HAS_SIGNAL
@@ -31,26 +31,26 @@ static int dvb_dummy_fe_read_status(struct dvb_frontend *fe,
 	return 0;
 }
 
-static int dvb_dummy_fe_read_ber(struct dvb_frontend *fe, u32 *ber)
+static int ddbridge_dummy_fe_read_ber(struct dvb_frontend *fe, u32 *ber)
 {
 	*ber = 0;
 	return 0;
 }
 
-static int dvb_dummy_fe_read_signal_strength(struct dvb_frontend *fe,
+static int ddbridge_dummy_fe_read_signal_strength(struct dvb_frontend *fe,
 					     u16 *strength)
 {
 	*strength = 0;
 	return 0;
 }
 
-static int dvb_dummy_fe_read_snr(struct dvb_frontend *fe, u16 *snr)
+static int ddbridge_dummy_fe_read_snr(struct dvb_frontend *fe, u16 *snr)
 {
 	*snr = 0;
 	return 0;
 }
 
-static int dvb_dummy_fe_read_ucblocks(struct dvb_frontend *fe, u32 *ucblocks)
+static int ddbridge_dummy_fe_read_ucblocks(struct dvb_frontend *fe, u32 *ucblocks)
 {
 	*ucblocks = 0;
 	return 0;
@@ -61,13 +61,13 @@ static int dvb_dummy_fe_read_ucblocks(struct dvb_frontend *fe, u32 *ucblocks)
  * Also, it should check for the locks, in order to avoid report wrong data
  * to userspace.
  */
-static int dvb_dummy_fe_get_frontend(struct dvb_frontend *fe,
+static int ddbridge_dummy_fe_get_frontend(struct dvb_frontend *fe,
 				     struct dtv_frontend_properties *p)
 {
 	return 0;
 }
 
-static int dvb_dummy_fe_set_frontend(struct dvb_frontend *fe)
+static int ddbridge_dummy_fe_set_frontend(struct dvb_frontend *fe)
 {
 	if (fe->ops.tuner_ops.set_params) {
 		fe->ops.tuner_ops.set_params(fe);
@@ -78,102 +78,102 @@ static int dvb_dummy_fe_set_frontend(struct dvb_frontend *fe)
 	return 0;
 }
 
-static int dvb_dummy_fe_sleep(struct dvb_frontend *fe)
+static int ddbridge_dummy_fe_sleep(struct dvb_frontend *fe)
 {
 	return 0;
 }
 
-static int dvb_dummy_fe_init(struct dvb_frontend *fe)
+static int ddbridge_dummy_fe_init(struct dvb_frontend *fe)
 {
 	return 0;
 }
 
-static int dvb_dummy_fe_set_tone(struct dvb_frontend *fe,
+static int ddbridge_dummy_fe_set_tone(struct dvb_frontend *fe,
 				 enum fe_sec_tone_mode tone)
 {
 	return 0;
 }
 
-static int dvb_dummy_fe_set_voltage(struct dvb_frontend *fe,
+static int ddbridge_dummy_fe_set_voltage(struct dvb_frontend *fe,
 				    enum fe_sec_voltage voltage)
 {
 	return 0;
 }
 
-static void dvb_dummy_fe_release(struct dvb_frontend *fe)
+static void ddbridge_dummy_fe_release(struct dvb_frontend *fe)
 {
-	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
+	struct ddbridge_dummy_fe_state *state = fe->demodulator_priv;
 
 	kfree(state);
 }
 
-static const struct dvb_frontend_ops dvb_dummy_fe_ofdm_ops;
+static const struct dvb_frontend_ops ddbridge_dummy_fe_ofdm_ops;
 
-struct dvb_frontend *dvb_dummy_fe_ofdm_attach(void)
+struct dvb_frontend *ddbridge_dummy_fe_ofdm_attach(void)
 {
-	struct dvb_dummy_fe_state *state = NULL;
+	struct ddbridge_dummy_fe_state *state = NULL;
 
 	/* allocate memory for the internal state */
-	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
+	state = kzalloc(sizeof(struct ddbridge_dummy_fe_state), GFP_KERNEL);
 	if (!state)
 		return NULL;
 
 	/* create dvb_frontend */
 	memcpy(&state->frontend.ops,
-	       &dvb_dummy_fe_ofdm_ops,
+	       &ddbridge_dummy_fe_ofdm_ops,
 	       sizeof(struct dvb_frontend_ops));
 
 	state->frontend.demodulator_priv = state;
 	return &state->frontend;
 }
-EXPORT_SYMBOL(dvb_dummy_fe_ofdm_attach);
+EXPORT_SYMBOL(ddbridge_dummy_fe_ofdm_attach);
 
-static const struct dvb_frontend_ops dvb_dummy_fe_qpsk_ops;
+static const struct dvb_frontend_ops ddbridge_dummy_fe_qpsk_ops;
 
-struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void)
+struct dvb_frontend *ddbridge_dummy_fe_qpsk_attach(void)
 {
-	struct dvb_dummy_fe_state *state = NULL;
+	struct ddbridge_dummy_fe_state *state = NULL;
 
 	/* allocate memory for the internal state */
-	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
+	state = kzalloc(sizeof(struct ddbridge_dummy_fe_state), GFP_KERNEL);
 	if (!state)
 		return NULL;
 
 	/* create dvb_frontend */
 	memcpy(&state->frontend.ops,
-	       &dvb_dummy_fe_qpsk_ops,
+	       &ddbridge_dummy_fe_qpsk_ops,
 	       sizeof(struct dvb_frontend_ops));
 
 	state->frontend.demodulator_priv = state;
 	return &state->frontend;
 }
-EXPORT_SYMBOL(dvb_dummy_fe_qpsk_attach);
+EXPORT_SYMBOL(ddbridge_dummy_fe_qpsk_attach);
 
-static const struct dvb_frontend_ops dvb_dummy_fe_qam_ops;
+static const struct dvb_frontend_ops ddbridge_dummy_fe_qam_ops;
 
-struct dvb_frontend *dvb_dummy_fe_qam_attach(void)
+struct dvb_frontend *ddbridge_dummy_fe_qam_attach(void)
 {
-	struct dvb_dummy_fe_state *state = NULL;
+	struct ddbridge_dummy_fe_state *state = NULL;
 
 	/* allocate memory for the internal state */
-	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
+	state = kzalloc(sizeof(struct ddbridge_dummy_fe_state), GFP_KERNEL);
 	if (!state)
 		return NULL;
 
 	/* create dvb_frontend */
 	memcpy(&state->frontend.ops,
-	       &dvb_dummy_fe_qam_ops,
+	       &ddbridge_dummy_fe_qam_ops,
 	       sizeof(struct dvb_frontend_ops));
 
 	state->frontend.demodulator_priv = state;
 	return &state->frontend;
 }
-EXPORT_SYMBOL(dvb_dummy_fe_qam_attach);
+EXPORT_SYMBOL(ddbridge_dummy_fe_qam_attach);
 
-static const struct dvb_frontend_ops dvb_dummy_fe_ofdm_ops = {
+static const struct dvb_frontend_ops ddbridge_dummy_fe_ofdm_ops = {
 	.delsys = { SYS_DVBT },
 	.info = {
-		.name			= "Dummy DVB-T",
+		.name			= "ddbridge dummy DVB-T",
 		.frequency_min_hz	= 0,
 		.frequency_max_hz	= 863250 * kHz,
 		.frequency_stepsize_hz	= 62500,
@@ -194,25 +194,25 @@ static const struct dvb_frontend_ops dvb_dummy_fe_ofdm_ops = {
 			FE_CAN_HIERARCHY_AUTO,
 	},
 
-	.release = dvb_dummy_fe_release,
+	.release = ddbridge_dummy_fe_release,
 
-	.init = dvb_dummy_fe_init,
-	.sleep = dvb_dummy_fe_sleep,
+	.init = ddbridge_dummy_fe_init,
+	.sleep = ddbridge_dummy_fe_sleep,
 
-	.set_frontend = dvb_dummy_fe_set_frontend,
-	.get_frontend = dvb_dummy_fe_get_frontend,
+	.set_frontend = ddbridge_dummy_fe_set_frontend,
+	.get_frontend = ddbridge_dummy_fe_get_frontend,
 
-	.read_status = dvb_dummy_fe_read_status,
-	.read_ber = dvb_dummy_fe_read_ber,
-	.read_signal_strength = dvb_dummy_fe_read_signal_strength,
-	.read_snr = dvb_dummy_fe_read_snr,
-	.read_ucblocks = dvb_dummy_fe_read_ucblocks,
+	.read_status = ddbridge_dummy_fe_read_status,
+	.read_ber = ddbridge_dummy_fe_read_ber,
+	.read_signal_strength = ddbridge_dummy_fe_read_signal_strength,
+	.read_snr = ddbridge_dummy_fe_read_snr,
+	.read_ucblocks = ddbridge_dummy_fe_read_ucblocks,
 };
 
-static const struct dvb_frontend_ops dvb_dummy_fe_qam_ops = {
+static const struct dvb_frontend_ops ddbridge_dummy_fe_qam_ops = {
 	.delsys = { SYS_DVBC_ANNEX_A },
 	.info = {
-		.name			= "Dummy DVB-C",
+		.name			= "ddbridge dummy DVB-C",
 		.frequency_min_hz	=  51 * MHz,
 		.frequency_max_hz	= 858 * MHz,
 		.frequency_stepsize_hz	= 62500,
@@ -228,25 +228,25 @@ static const struct dvb_frontend_ops dvb_dummy_fe_qam_ops = {
 			FE_CAN_INVERSION_AUTO
 	},
 
-	.release = dvb_dummy_fe_release,
+	.release = ddbridge_dummy_fe_release,
 
-	.init = dvb_dummy_fe_init,
-	.sleep = dvb_dummy_fe_sleep,
+	.init = ddbridge_dummy_fe_init,
+	.sleep = ddbridge_dummy_fe_sleep,
 
-	.set_frontend = dvb_dummy_fe_set_frontend,
-	.get_frontend = dvb_dummy_fe_get_frontend,
+	.set_frontend = ddbridge_dummy_fe_set_frontend,
+	.get_frontend = ddbridge_dummy_fe_get_frontend,
 
-	.read_status = dvb_dummy_fe_read_status,
-	.read_ber = dvb_dummy_fe_read_ber,
-	.read_signal_strength = dvb_dummy_fe_read_signal_strength,
-	.read_snr = dvb_dummy_fe_read_snr,
-	.read_ucblocks = dvb_dummy_fe_read_ucblocks,
+	.read_status = ddbridge_dummy_fe_read_status,
+	.read_ber = ddbridge_dummy_fe_read_ber,
+	.read_signal_strength = ddbridge_dummy_fe_read_signal_strength,
+	.read_snr = ddbridge_dummy_fe_read_snr,
+	.read_ucblocks = ddbridge_dummy_fe_read_ucblocks,
 };
 
-static const struct dvb_frontend_ops dvb_dummy_fe_qpsk_ops = {
+static const struct dvb_frontend_ops ddbridge_dummy_fe_qpsk_ops = {
 	.delsys = { SYS_DVBS },
 	.info = {
-		.name			= "Dummy DVB-S",
+		.name			= "ddbridge dummy DVB-S",
 		.frequency_min_hz	=  950 * MHz,
 		.frequency_max_hz	= 2150 * MHz,
 		.frequency_stepsize_hz	= 250 * kHz,
@@ -263,24 +263,24 @@ static const struct dvb_frontend_ops dvb_dummy_fe_qpsk_ops = {
 			FE_CAN_QPSK
 	},
 
-	.release = dvb_dummy_fe_release,
+	.release = ddbridge_dummy_fe_release,
 
-	.init = dvb_dummy_fe_init,
-	.sleep = dvb_dummy_fe_sleep,
+	.init = ddbridge_dummy_fe_init,
+	.sleep = ddbridge_dummy_fe_sleep,
 
-	.set_frontend = dvb_dummy_fe_set_frontend,
-	.get_frontend = dvb_dummy_fe_get_frontend,
+	.set_frontend = ddbridge_dummy_fe_set_frontend,
+	.get_frontend = ddbridge_dummy_fe_get_frontend,
 
-	.read_status = dvb_dummy_fe_read_status,
-	.read_ber = dvb_dummy_fe_read_ber,
-	.read_signal_strength = dvb_dummy_fe_read_signal_strength,
-	.read_snr = dvb_dummy_fe_read_snr,
-	.read_ucblocks = dvb_dummy_fe_read_ucblocks,
+	.read_status = ddbridge_dummy_fe_read_status,
+	.read_ber = ddbridge_dummy_fe_read_ber,
+	.read_signal_strength = ddbridge_dummy_fe_read_signal_strength,
+	.read_snr = ddbridge_dummy_fe_read_snr,
+	.read_ucblocks = ddbridge_dummy_fe_read_ucblocks,
 
-	.set_voltage = dvb_dummy_fe_set_voltage,
-	.set_tone = dvb_dummy_fe_set_tone,
+	.set_voltage = ddbridge_dummy_fe_set_voltage,
+	.set_tone = ddbridge_dummy_fe_set_tone,
 };
 
-MODULE_DESCRIPTION("DVB DUMMY Frontend");
+MODULE_DESCRIPTION("ddbridge dummy Frontend");
 MODULE_AUTHOR("Emard");
 MODULE_LICENSE("GPL");
diff --git a/drivers/media/pci/ddbridge/ddbridge-dummy-fe.h b/drivers/media/pci/ddbridge/ddbridge-dummy-fe.h
index 463abf5ebd56..811c203539e2 100644
--- a/drivers/media/pci/ddbridge/ddbridge-dummy-fe.h
+++ b/drivers/media/pci/ddbridge/ddbridge-dummy-fe.h
@@ -5,32 +5,32 @@
  *  Written by Emard <emard@softhome.net>
  */
 
-#ifndef DVB_DUMMY_FE_H
-#define DVB_DUMMY_FE_H
+#ifndef DDBRIDGE_DUMMY_FE_H
+#define DDBRIDGE_DUMMY_FE_H
 
 #include <linux/dvb/frontend.h>
 #include <media/dvb_frontend.h>
 
-#if IS_REACHABLE(CONFIG_DVB_DUMMY_FE)
-struct dvb_frontend *dvb_dummy_fe_ofdm_attach(void);
-struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void);
-struct dvb_frontend *dvb_dummy_fe_qam_attach(void);
+#if IS_REACHABLE(CONFIG_DDBRIDGE_DUMMY_FE)
+struct dvb_frontend *ddbridge_dummy_fe_ofdm_attach(void);
+struct dvb_frontend *ddbridge_dummy_fe_qpsk_attach(void);
+struct dvb_frontend *ddbridge_dummy_fe_qam_attach(void);
 #else
-static inline struct dvb_frontend *dvb_dummy_fe_ofdm_attach(void)
+static inline struct dvb_frontend *ddbridge_dummy_fe_ofdm_attach(void)
 {
 	pr_warn("%s: driver disabled by Kconfig\n", __func__);
 	return NULL;
 }
-static inline struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void)
+static inline struct dvb_frontend *ddbridge_dummy_fe_qpsk_attach(void)
 {
 	pr_warn("%s: driver disabled by Kconfig\n", __func__);
 	return NULL;
 }
-static inline struct dvb_frontend *dvb_dummy_fe_qam_attach(void)
+static inline struct dvb_frontend *ddbridge_dummy_fe_qam_attach(void)
 {
 	pr_warn("%s: driver disabled by Kconfig\n", __func__);
 	return NULL;
 }
-#endif /* CONFIG_DVB_DUMMY_FE */
+#endif /* CONFIG_DDBRIDGE_DUMMY_FE */
 
-#endif // DVB_DUMMY_FE_H
+#endif // DDBRIDGE_DUMMY_FE_H
-- 
2.25.1

