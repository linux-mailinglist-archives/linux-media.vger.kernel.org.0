Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9BCE2E3FF
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 20:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbfE2SCO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 14:02:14 -0400
Received: from mout2.fh-giessen.de ([212.201.18.46]:38678 "EHLO
        mout2.fh-giessen.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbfE2SCO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 14:02:14 -0400
Received: from mx1.fh-giessen.de ([212.201.18.40])
        by mout2.fh-giessen.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <tobias.johannes.klausmann@mni.thm.de>)
        id 1hW2tw-0004KR-EB; Wed, 29 May 2019 20:02:12 +0200
Received: from mailgate-3.its.fh-giessen.de ([212.201.18.34])
        by mx1.fh-giessen.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <tobias.johannes.klausmann@mni.thm.de>)
        id 1hW2tw-004qKH-9P; Wed, 29 May 2019 20:02:12 +0200
Received: from p2e5610f3.dip0.t-ipconnect.de ([46.86.16.243] helo=zwei.fritz.box)
        by mailgate-3.its.fh-giessen.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <tobias.johannes.klausmann@mni.thm.de>)
        id 1hW2tv-000T5e-Vz; Wed, 29 May 2019 20:02:12 +0200
From:   Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, sean@mess.org
Cc:     Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
Subject: [PATCH] drivers/media/dvb-frontends: Implement probe/remove for stv090x
Date:   Wed, 29 May 2019 20:02:06 +0200
Message-Id: <20190529180206.2390-1-tobias.johannes.klausmann@mni.thm.de>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move common code into a new function.

This provides the needed functionality to use dvb_module_probe() instead
of dvb_attach()!

Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
---
 drivers/media/dvb-frontends/stv090x.c      | 198 +++++++++++++++------
 drivers/media/dvb-frontends/stv090x.h      |   3 +
 drivers/media/dvb-frontends/stv090x_priv.h |   2 +-
 3 files changed, 150 insertions(+), 53 deletions(-)

diff --git a/drivers/media/dvb-frontends/stv090x.c b/drivers/media/dvb-frontends/stv090x.c
index d1261571dbe4..b7fdb48f4f14 100644
--- a/drivers/media/dvb-frontends/stv090x.c
+++ b/drivers/media/dvb-frontends/stv090x.c
@@ -4889,6 +4889,67 @@ static int stv090x_set_gpio(struct dvb_frontend *fe, u8 gpio, u8 dir,
 	return stv090x_write_reg(state, STV090x_GPIOxCFG(gpio), reg);
 }
 
+int stv090x_setup_compound(struct stv090x_state *state)
+{
+	struct stv090x_dev *temp_int;
+
+	temp_int = find_dev(state->i2c,
+			    state->config->address);
+
+	if (temp_int && state->demod_mode == STV090x_DUAL) {
+		state->internal = temp_int->internal;
+		state->internal->num_used++;
+		dprintk(FE_INFO, 1, "Found Internal Structure!");
+	} else {
+		state->internal = kmalloc(sizeof(*state->internal), GFP_KERNEL);
+		if (!state->internal)
+			goto error;
+		temp_int = append_internal(state->internal);
+		if (!temp_int) {
+			kfree(state->internal);
+			goto error;
+		}
+		state->internal->num_used = 1;
+		state->internal->mclk = 0;
+		state->internal->dev_ver = 0;
+		state->internal->i2c_adap = state->i2c;
+		state->internal->i2c_addr = state->config->address;
+		dprintk(FE_INFO, 1, "Create New Internal Structure!");
+
+		mutex_init(&state->internal->demod_lock);
+		mutex_init(&state->internal->tuner_lock);
+
+		if (stv090x_setup(&state->frontend) < 0) {
+			dprintk(FE_ERROR, 1, "Error setting up device");
+			goto err_remove;
+		}
+	}
+
+	if (state->internal->dev_ver >= 0x30)
+		state->frontend.ops.info.caps |= FE_CAN_MULTISTREAM;
+
+	/* workaround for stuck DiSEqC output */
+	if (state->config->diseqc_envelope_mode)
+		stv090x_send_diseqc_burst(&state->frontend, SEC_MINI_A);
+
+	state->config->set_gpio = stv090x_set_gpio;
+
+	dprintk(FE_ERROR, 1, "Probing %s demodulator(%d) Cut=0x%02x",
+		state->device == STV0900 ? "STV0900" : "STV0903",
+		state->config->demod,
+		state->internal->dev_ver);
+
+	return 0;
+
+error:
+	kfree(state);
+	return -ENOMEM;
+err_remove:
+	remove_dev(state->internal);
+	kfree(state->internal);
+	return -ENODEV;
+}
+
 static const struct dvb_frontend_ops stv090x_ops = {
 	.delsys = { SYS_DVBS, SYS_DVBS2, SYS_DSS },
 	.info = {
@@ -4921,85 +4982,118 @@ static const struct dvb_frontend_ops stv090x_ops = {
 	.read_snr			= stv090x_read_cnr,
 };
 
+static struct dvb_frontend *stv090x_get_dvb_frontend(struct i2c_client *client)
+{
+	struct stv090x_state *state = i2c_get_clientdata(client);
 
-struct dvb_frontend *stv090x_attach(struct stv090x_config *config,
-				    struct i2c_adapter *i2c,
-				    enum stv090x_demodulator demod)
+	dev_dbg(&client->dev, "\n");
+
+	return &state->frontend;
+}
+
+static int stv090x_probe(struct i2c_client *client,
+			 const struct i2c_device_id *id)
 {
+	int ret = 0;
+	struct stv090x_config *config = client->dev.platform_data;
+
 	struct stv090x_state *state = NULL;
-	struct stv090x_dev *temp_int;
 
-	state = kzalloc(sizeof (struct stv090x_state), GFP_KERNEL);
-	if (state == NULL)
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (!state) {
 		goto error;
+		ret = -ENOMEM;
+	}
 
 	state->verbose				= &verbose;
 	state->config				= config;
-	state->i2c				= i2c;
+	state->i2c				= client->adapter;
 	state->frontend.ops			= stv090x_ops;
 	state->frontend.demodulator_priv	= state;
-	state->demod				= demod;
-	state->demod_mode			= config->demod_mode; /* Single or Dual mode */
+	state->demod				= config->demod;
+						/* Single or Dual mode */
+	state->demod_mode			= config->demod_mode;
 	state->device				= config->device;
-	state->rolloff				= STV090x_RO_35; /* default */
+						/* default */
+	state->rolloff				= STV090x_RO_35;
 
-	temp_int = find_dev(state->i2c,
-				state->config->address);
+	ret = stv090x_setup_compound(state);
+	if (ret)
+		goto error;
 
-	if ((temp_int != NULL) && (state->demod_mode == STV090x_DUAL)) {
-		state->internal = temp_int->internal;
-		state->internal->num_used++;
-		dprintk(FE_INFO, 1, "Found Internal Structure!");
-	} else {
-		state->internal = kmalloc(sizeof(struct stv090x_internal),
-					  GFP_KERNEL);
-		if (!state->internal)
-			goto error;
-		temp_int = append_internal(state->internal);
-		if (!temp_int) {
-			kfree(state->internal);
-			goto error;
-		}
-		state->internal->num_used = 1;
-		state->internal->mclk = 0;
-		state->internal->dev_ver = 0;
-		state->internal->i2c_adap = state->i2c;
-		state->internal->i2c_addr = state->config->address;
-		dprintk(FE_INFO, 1, "Create New Internal Structure!");
+	i2c_set_clientdata(client, state);
 
-		mutex_init(&state->internal->demod_lock);
-		mutex_init(&state->internal->tuner_lock);
+	/* setup callbacks */
+	config->get_dvb_frontend = stv090x_get_dvb_frontend;
 
-		if (stv090x_setup(&state->frontend) < 0) {
-			dprintk(FE_ERROR, 1, "Error setting up device");
-			goto err_remove;
-		}
-	}
+	return 0;
 
-	if (state->internal->dev_ver >= 0x30)
-		state->frontend.ops.info.caps |= FE_CAN_MULTISTREAM;
+error:
+	kfree(state);
+	return ret;
+}
 
-	/* workaround for stuck DiSEqC output */
-	if (config->diseqc_envelope_mode)
-		stv090x_send_diseqc_burst(&state->frontend, SEC_MINI_A);
+static int stv090x_remove(struct i2c_client *client)
+{
+	struct stv090x_state *state = i2c_get_clientdata(client);
+
+	stv090x_release(&state->frontend);
+	return 0;
+}
 
-	config->set_gpio = stv090x_set_gpio;
+struct dvb_frontend *stv090x_attach(struct stv090x_config *config,
+				    struct i2c_adapter *i2c,
+				    enum stv090x_demodulator demod)
+{
+	int ret = 0;
+	struct stv090x_state *state = NULL;
 
-	dprintk(FE_ERROR, 1, "Attaching %s demodulator(%d) Cut=0x%02x",
-	       state->device == STV0900 ? "STV0900" : "STV0903",
-	       demod,
-	       state->internal->dev_ver);
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (!state)
+		goto error;
+
+	state->verbose				= &verbose;
+	state->config				= config;
+	state->i2c				= i2c;
+	state->frontend.ops			= stv090x_ops;
+	state->frontend.demodulator_priv	= state;
+	state->demod				= demod;
+						/* Single or Dual mode */
+	state->demod_mode			= config->demod_mode;
+	state->device				= config->device;
+						/* default */
+	state->rolloff				= STV090x_RO_35;
+
+	ret = stv090x_setup_compound(state);
+	if (ret)
+		goto error;
 
 	return &state->frontend;
 
-err_remove:
-	remove_dev(state->internal);
-	kfree(state->internal);
 error:
 	kfree(state);
 	return NULL;
 }
 EXPORT_SYMBOL(stv090x_attach);
+
+static const struct i2c_device_id stv090x_id_table[] = {
+	{"stv090x", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, stv090x_id_table);
+
+static struct i2c_driver stv090x_driver = {
+	.driver = {
+		.name	= "stv090x",
+		.suppress_bind_attrs = true,
+	},
+	.probe		= stv090x_probe,
+	.remove		= stv090x_remove,
+	.id_table	= stv090x_id_table,
+};
+
+module_i2c_driver(stv090x_driver);
+
 MODULE_PARM_DESC(verbose, "Set Verbosity level");
 MODULE_AUTHOR("Manu Abraham");
 MODULE_DESCRIPTION("STV090x Multi-Std Broadcast frontend");
diff --git a/drivers/media/dvb-frontends/stv090x.h b/drivers/media/dvb-frontends/stv090x.h
index 13f251a08abd..89f45d9fa427 100644
--- a/drivers/media/dvb-frontends/stv090x.h
+++ b/drivers/media/dvb-frontends/stv090x.h
@@ -57,6 +57,7 @@ struct stv090x_config {
 	enum stv090x_device	device;
 	enum stv090x_mode	demod_mode;
 	enum stv090x_clkmode	clk_mode;
+	enum stv090x_demodulator demod;
 
 	u32 xtal; /* default: 8000000 */
 	u8 address; /* default: 0x68 */
@@ -93,6 +94,8 @@ struct stv090x_config {
 	/* dir = 0 -> output, dir = 1 -> input/open-drain */
 	int (*set_gpio)(struct dvb_frontend *fe, u8 gpio, u8 dir, u8 value,
 			u8 xor_value);
+
+	struct dvb_frontend* (*get_dvb_frontend)(struct i2c_client *i2c);
 };
 
 #if IS_REACHABLE(CONFIG_DVB_STV090x)
diff --git a/drivers/media/dvb-frontends/stv090x_priv.h b/drivers/media/dvb-frontends/stv090x_priv.h
index b22c58968c93..f8ece898c153 100644
--- a/drivers/media/dvb-frontends/stv090x_priv.h
+++ b/drivers/media/dvb-frontends/stv090x_priv.h
@@ -237,7 +237,7 @@ struct stv090x_state {
 	struct stv090x_internal		*internal;
 
 	struct i2c_adapter		*i2c;
-	const struct stv090x_config	*config;
+	struct stv090x_config	*config;
 	struct dvb_frontend		frontend;
 
 	u32				*verbose; /* Cached module verbosity */
-- 
2.21.0

