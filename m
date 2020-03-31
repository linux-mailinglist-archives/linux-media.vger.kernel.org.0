Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 553BB1994F0
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 13:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730528AbgCaLMX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 07:12:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:57974 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730653AbgCaLMQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 07:12:16 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 851DE208E4;
        Tue, 31 Mar 2020 11:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585653135;
        bh=ysRXQKUIaq7MbChLwEBlpOTl08QTCQ4kBFSqewXOIDY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wFCqbxDmzLt18nlR2eAxEy4IC0ZEI4x5W8DEluGN+y9AQFPeloaP8f7zgPecZ6KXU
         dKlCNOu55aD3aUuuW2Xiw0kVQP2YAryM8GwTl/BSKT7rjCn4Vdc+oN+bGwFXeYPUt8
         BreFCdMHGnSqVh/XNMS0IB9HKvXKBgufQD5OakHk=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jJEoV-002bql-DB; Tue, 31 Mar 2020 13:12:11 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v4 12/33] media: ddbridge: use the ddbridge's own dummy fe driver
Date:   Tue, 31 Mar 2020 13:11:48 +0200
Message-Id: <2402ad8baf88d5bc01d29420fc3705987852e64a.1585651678.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585651678.git.mchehab+huawei@kernel.org>
References: <cover.1585651678.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Cleanup the ddbridge's dummy driver by removing the parts
that aren't needed by ddbridge, adding it to the building
system and changing the binding at the driver to use the
newer function name.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/pci/ddbridge/Kconfig            |   1 -
 drivers/media/pci/ddbridge/Makefile           |   2 +-
 drivers/media/pci/ddbridge/ddbridge-core.c    |   4 +-
 .../media/pci/ddbridge/ddbridge-dummy-fe.c    | 133 ------------------
 .../media/pci/ddbridge/ddbridge-dummy-fe.h    |  20 ---
 5 files changed, 3 insertions(+), 157 deletions(-)

diff --git a/drivers/media/pci/ddbridge/Kconfig b/drivers/media/pci/ddbridge/Kconfig
index dab34fb85c09..169efd558e45 100644
--- a/drivers/media/pci/ddbridge/Kconfig
+++ b/drivers/media/pci/ddbridge/Kconfig
@@ -15,7 +15,6 @@ config DVB_DDBRIDGE
 	select MEDIA_TUNER_TDA18212 if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_MXL5XX if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_CXD2099 if MEDIA_SUBDRV_AUTOSELECT
-	select DVB_DUMMY_FE if MEDIA_SUBDRV_AUTOSELECT
 	help
 	  Support for cards with the Digital Devices PCI express bridge:
 	  - Octopus PCIe Bridge
diff --git a/drivers/media/pci/ddbridge/Makefile b/drivers/media/pci/ddbridge/Makefile
index 2b77c8d0eb2e..5e7eab81173b 100644
--- a/drivers/media/pci/ddbridge/Makefile
+++ b/drivers/media/pci/ddbridge/Makefile
@@ -7,7 +7,7 @@ ddbridge-objs := ddbridge-main.o ddbridge-core.o ddbridge-ci.o \
 		ddbridge-hw.o ddbridge-i2c.o ddbridge-max.o ddbridge-mci.o \
 		ddbridge-sx8.o
 
-obj-$(CONFIG_DVB_DDBRIDGE) += ddbridge.o
+obj-$(CONFIG_DVB_DDBRIDGE) += ddbridge.o ddbridge-dummy-fe.o
 
 ccflags-y += -I $(srctree)/drivers/media/dvb-frontends/
 ccflags-y += -I $(srctree)/drivers/media/tuners/
diff --git a/drivers/media/pci/ddbridge/ddbridge-core.c b/drivers/media/pci/ddbridge/ddbridge-core.c
index 7a2d19682fe3..7cabb9e9ffe2 100644
--- a/drivers/media/pci/ddbridge/ddbridge-core.c
+++ b/drivers/media/pci/ddbridge/ddbridge-core.c
@@ -50,7 +50,7 @@
 #include "stv6111.h"
 #include "lnbh25.h"
 #include "cxd2099.h"
-#include "dvb_dummy_fe.h"
+#include "ddbridge-dummy-fe.h"
 
 /****************************************************************************/
 
@@ -1265,7 +1265,7 @@ static int demod_attach_dummy(struct ddb_input *input)
 	struct ddb_dvb *dvb = &input->port->dvb[input->nr & 1];
 	struct device *dev = input->port->dev->dev;
 
-	dvb->fe = dvb_attach(dvb_dummy_fe_qam_attach);
+	dvb->fe = dvb_attach(ddbridge_dummy_fe_qam_attach);
 	if (!dvb->fe) {
 		dev_err(dev, "QAM dummy attach failed!\n");
 		return -ENODEV;
diff --git a/drivers/media/pci/ddbridge/ddbridge-dummy-fe.c b/drivers/media/pci/ddbridge/ddbridge-dummy-fe.c
index ebf4d9c30a55..6868a0c4fc82 100644
--- a/drivers/media/pci/ddbridge/ddbridge-dummy-fe.c
+++ b/drivers/media/pci/ddbridge/ddbridge-dummy-fe.c
@@ -13,12 +13,10 @@
 #include <media/dvb_frontend.h>
 #include "ddbridge-dummy-fe.h"
 
-
 struct ddbridge_dummy_fe_state {
 	struct dvb_frontend frontend;
 };
 
-
 static int ddbridge_dummy_fe_read_status(struct dvb_frontend *fe,
 				    enum fe_status *status)
 {
@@ -88,18 +86,6 @@ static int ddbridge_dummy_fe_init(struct dvb_frontend *fe)
 	return 0;
 }
 
-static int ddbridge_dummy_fe_set_tone(struct dvb_frontend *fe,
-				 enum fe_sec_tone_mode tone)
-{
-	return 0;
-}
-
-static int ddbridge_dummy_fe_set_voltage(struct dvb_frontend *fe,
-				    enum fe_sec_voltage voltage)
-{
-	return 0;
-}
-
 static void ddbridge_dummy_fe_release(struct dvb_frontend *fe)
 {
 	struct ddbridge_dummy_fe_state *state = fe->demodulator_priv;
@@ -107,48 +93,6 @@ static void ddbridge_dummy_fe_release(struct dvb_frontend *fe)
 	kfree(state);
 }
 
-static const struct dvb_frontend_ops ddbridge_dummy_fe_ofdm_ops;
-
-struct dvb_frontend *ddbridge_dummy_fe_ofdm_attach(void)
-{
-	struct ddbridge_dummy_fe_state *state = NULL;
-
-	/* allocate memory for the internal state */
-	state = kzalloc(sizeof(struct ddbridge_dummy_fe_state), GFP_KERNEL);
-	if (!state)
-		return NULL;
-
-	/* create dvb_frontend */
-	memcpy(&state->frontend.ops,
-	       &ddbridge_dummy_fe_ofdm_ops,
-	       sizeof(struct dvb_frontend_ops));
-
-	state->frontend.demodulator_priv = state;
-	return &state->frontend;
-}
-EXPORT_SYMBOL(ddbridge_dummy_fe_ofdm_attach);
-
-static const struct dvb_frontend_ops ddbridge_dummy_fe_qpsk_ops;
-
-struct dvb_frontend *ddbridge_dummy_fe_qpsk_attach(void)
-{
-	struct ddbridge_dummy_fe_state *state = NULL;
-
-	/* allocate memory for the internal state */
-	state = kzalloc(sizeof(struct ddbridge_dummy_fe_state), GFP_KERNEL);
-	if (!state)
-		return NULL;
-
-	/* create dvb_frontend */
-	memcpy(&state->frontend.ops,
-	       &ddbridge_dummy_fe_qpsk_ops,
-	       sizeof(struct dvb_frontend_ops));
-
-	state->frontend.demodulator_priv = state;
-	return &state->frontend;
-}
-EXPORT_SYMBOL(ddbridge_dummy_fe_qpsk_attach);
-
 static const struct dvb_frontend_ops ddbridge_dummy_fe_qam_ops;
 
 struct dvb_frontend *ddbridge_dummy_fe_qam_attach(void)
@@ -170,45 +114,6 @@ struct dvb_frontend *ddbridge_dummy_fe_qam_attach(void)
 }
 EXPORT_SYMBOL(ddbridge_dummy_fe_qam_attach);
 
-static const struct dvb_frontend_ops ddbridge_dummy_fe_ofdm_ops = {
-	.delsys = { SYS_DVBT },
-	.info = {
-		.name			= "ddbridge dummy DVB-T",
-		.frequency_min_hz	= 0,
-		.frequency_max_hz	= 863250 * kHz,
-		.frequency_stepsize_hz	= 62500,
-		.caps = FE_CAN_FEC_1_2 |
-			FE_CAN_FEC_2_3 |
-			FE_CAN_FEC_3_4 |
-			FE_CAN_FEC_4_5 |
-			FE_CAN_FEC_5_6 |
-			FE_CAN_FEC_6_7 |
-			FE_CAN_FEC_7_8 |
-			FE_CAN_FEC_8_9 |
-			FE_CAN_FEC_AUTO |
-			FE_CAN_QAM_16 |
-			FE_CAN_QAM_64 |
-			FE_CAN_QAM_AUTO |
-			FE_CAN_TRANSMISSION_MODE_AUTO |
-			FE_CAN_GUARD_INTERVAL_AUTO |
-			FE_CAN_HIERARCHY_AUTO,
-	},
-
-	.release = ddbridge_dummy_fe_release,
-
-	.init = ddbridge_dummy_fe_init,
-	.sleep = ddbridge_dummy_fe_sleep,
-
-	.set_frontend = ddbridge_dummy_fe_set_frontend,
-	.get_frontend = ddbridge_dummy_fe_get_frontend,
-
-	.read_status = ddbridge_dummy_fe_read_status,
-	.read_ber = ddbridge_dummy_fe_read_ber,
-	.read_signal_strength = ddbridge_dummy_fe_read_signal_strength,
-	.read_snr = ddbridge_dummy_fe_read_snr,
-	.read_ucblocks = ddbridge_dummy_fe_read_ucblocks,
-};
-
 static const struct dvb_frontend_ops ddbridge_dummy_fe_qam_ops = {
 	.delsys = { SYS_DVBC_ANNEX_A },
 	.info = {
@@ -243,44 +148,6 @@ static const struct dvb_frontend_ops ddbridge_dummy_fe_qam_ops = {
 	.read_ucblocks = ddbridge_dummy_fe_read_ucblocks,
 };
 
-static const struct dvb_frontend_ops ddbridge_dummy_fe_qpsk_ops = {
-	.delsys = { SYS_DVBS },
-	.info = {
-		.name			= "ddbridge dummy DVB-S",
-		.frequency_min_hz	=  950 * MHz,
-		.frequency_max_hz	= 2150 * MHz,
-		.frequency_stepsize_hz	= 250 * kHz,
-		.frequency_tolerance_hz	= 29500 * kHz,
-		.symbol_rate_min	= 1000000,
-		.symbol_rate_max	= 45000000,
-		.caps = FE_CAN_INVERSION_AUTO |
-			FE_CAN_FEC_1_2 |
-			FE_CAN_FEC_2_3 |
-			FE_CAN_FEC_3_4 |
-			FE_CAN_FEC_5_6 |
-			FE_CAN_FEC_7_8 |
-			FE_CAN_FEC_AUTO |
-			FE_CAN_QPSK
-	},
-
-	.release = ddbridge_dummy_fe_release,
-
-	.init = ddbridge_dummy_fe_init,
-	.sleep = ddbridge_dummy_fe_sleep,
-
-	.set_frontend = ddbridge_dummy_fe_set_frontend,
-	.get_frontend = ddbridge_dummy_fe_get_frontend,
-
-	.read_status = ddbridge_dummy_fe_read_status,
-	.read_ber = ddbridge_dummy_fe_read_ber,
-	.read_signal_strength = ddbridge_dummy_fe_read_signal_strength,
-	.read_snr = ddbridge_dummy_fe_read_snr,
-	.read_ucblocks = ddbridge_dummy_fe_read_ucblocks,
-
-	.set_voltage = ddbridge_dummy_fe_set_voltage,
-	.set_tone = ddbridge_dummy_fe_set_tone,
-};
-
 MODULE_DESCRIPTION("ddbridge dummy Frontend");
 MODULE_AUTHOR("Emard");
 MODULE_LICENSE("GPL");
diff --git a/drivers/media/pci/ddbridge/ddbridge-dummy-fe.h b/drivers/media/pci/ddbridge/ddbridge-dummy-fe.h
index 811c203539e2..ddf189c09524 100644
--- a/drivers/media/pci/ddbridge/ddbridge-dummy-fe.h
+++ b/drivers/media/pci/ddbridge/ddbridge-dummy-fe.h
@@ -11,26 +11,6 @@
 #include <linux/dvb/frontend.h>
 #include <media/dvb_frontend.h>
 
-#if IS_REACHABLE(CONFIG_DDBRIDGE_DUMMY_FE)
-struct dvb_frontend *ddbridge_dummy_fe_ofdm_attach(void);
-struct dvb_frontend *ddbridge_dummy_fe_qpsk_attach(void);
 struct dvb_frontend *ddbridge_dummy_fe_qam_attach(void);
-#else
-static inline struct dvb_frontend *ddbridge_dummy_fe_ofdm_attach(void)
-{
-	pr_warn("%s: driver disabled by Kconfig\n", __func__);
-	return NULL;
-}
-static inline struct dvb_frontend *ddbridge_dummy_fe_qpsk_attach(void)
-{
-	pr_warn("%s: driver disabled by Kconfig\n", __func__);
-	return NULL;
-}
-static inline struct dvb_frontend *ddbridge_dummy_fe_qam_attach(void)
-{
-	pr_warn("%s: driver disabled by Kconfig\n", __func__);
-	return NULL;
-}
-#endif /* CONFIG_DDBRIDGE_DUMMY_FE */
 
 #endif // DDBRIDGE_DUMMY_FE_H
-- 
2.25.1

