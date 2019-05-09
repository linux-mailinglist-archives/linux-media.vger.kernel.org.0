Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCDBB19333
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2019 22:11:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbfEIUK7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 May 2019 16:10:59 -0400
Received: from mout1.fh-giessen.de ([212.201.18.42]:58512 "EHLO
        mout1.fh-giessen.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726747AbfEIUK7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 May 2019 16:10:59 -0400
X-Greylist: delayed 1143 seconds by postgrey-1.27 at vger.kernel.org; Thu, 09 May 2019 16:10:57 EDT
Received: from mx1.fh-giessen.de ([212.201.18.40])
        by mout1.fh-giessen.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <tobias.johannes.klausmann@mni.thm.de>)
        id 1hOp57-00086y-Lh; Thu, 09 May 2019 21:51:53 +0200
Received: from mailgate-2.its.fh-giessen.de ([212.201.18.14])
        by mx1.fh-giessen.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <tobias.johannes.klausmann@mni.thm.de>)
        id 1hOp57-009hEs-GK; Thu, 09 May 2019 21:51:53 +0200
Received: from p2e56130f.dip0.t-ipconnect.de ([46.86.19.15] helo=zwei.fritz.box)
        by mailgate-2.its.fh-giessen.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <tobias.johannes.klausmann@mni.thm.de>)
        id 1hOp57-000F2O-5i; Thu, 09 May 2019 21:51:53 +0200
From:   Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org
Cc:     Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
Subject: [PATCH] drivers/media/dvb-frontends: Implement probe/remove for stv6110x
Date:   Thu,  9 May 2019 21:51:18 +0200
Message-Id: <20190509195118.23027-1-tobias.johannes.klausmann@mni.thm.de>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Refactor out the common parts of stv6110x_probe() and stv6110x_attach() into
separate functions.

This provides the needed functionality to use dvb_module_probe() instead of
dvb_attach()!

Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
---
 drivers/media/dvb-frontends/stv6110x.c      | 125 ++++++++++++++++----
 drivers/media/dvb-frontends/stv6110x.h      |   3 +
 drivers/media/dvb-frontends/stv6110x_priv.h |   3 +-
 3 files changed, 109 insertions(+), 22 deletions(-)

diff --git a/drivers/media/dvb-frontends/stv6110x.c b/drivers/media/dvb-frontends/stv6110x.c
index 82c002d3833a..17bc7adf3771 100644
--- a/drivers/media/dvb-frontends/stv6110x.c
+++ b/drivers/media/dvb-frontends/stv6110x.c
@@ -345,6 +345,33 @@ static void stv6110x_release(struct dvb_frontend *fe)
 	kfree(stv6110x);
 }
 
+void st6110x_init_regs(struct stv6110x_state *stv6110x)
+{
+	u8 default_regs[] = {0x07, 0x11, 0xdc, 0x85, 0x17, 0x01, 0xe6, 0x1e};
+
+	memcpy(stv6110x->regs, default_regs, 8);
+}
+
+void stv6110x_setup_divider(struct stv6110x_state *stv6110x)
+{
+	switch (stv6110x->config->clk_div) {
+	default:
+	case 1:
+		STV6110x_SETFIELD(stv6110x->regs[STV6110x_CTRL2], CTRL2_CO_DIV, 0);
+		break;
+	case 2:
+		STV6110x_SETFIELD(stv6110x->regs[STV6110x_CTRL2], CTRL2_CO_DIV, 1);
+		break;
+	case 4:
+		STV6110x_SETFIELD(stv6110x->regs[STV6110x_CTRL2], CTRL2_CO_DIV, 2);
+		break;
+	case 8:
+	case 0:
+		STV6110x_SETFIELD(stv6110x->regs[STV6110x_CTRL2], CTRL2_CO_DIV, 3);
+		break;
+	}
+}
+
 static const struct dvb_tuner_ops stv6110x_ops = {
 	.info = {
 		.name		  = "STV6110(A) Silicon Tuner",
@@ -354,7 +381,7 @@ static const struct dvb_tuner_ops stv6110x_ops = {
 	.release		= stv6110x_release
 };
 
-static const struct stv6110x_devctl stv6110x_ctl = {
+static struct stv6110x_devctl stv6110x_ctl = {
 	.tuner_init		= stv6110x_init,
 	.tuner_sleep		= stv6110x_sleep,
 	.tuner_set_mode		= stv6110x_set_mode,
@@ -368,39 +395,77 @@ static const struct stv6110x_devctl stv6110x_ctl = {
 	.tuner_get_status	= stv6110x_get_status,
 };
 
+void stv6110x_set_frontend_opts(struct stv6110x_state *stv6110x)
+{
+	stv6110x->frontend->tuner_priv		= stv6110x;
+	stv6110x->frontend->ops.tuner_ops	= stv6110x_ops;
+}
+
+static struct stv6110x_devctl *stv6110x_get_devctl(struct i2c_client *client)
+{
+	struct stv6110x_state *stv6110x = i2c_get_clientdata(client);
+
+	dev_dbg(&client->dev, "\n");
+
+	return stv6110x->devctl;
+}
+
+static int stv6110x_probe(struct i2c_client *client,
+			const struct i2c_device_id *id)
+{
+	struct stv6110x_config *config = client->dev.platform_data;
+
+	struct stv6110x_state *stv6110x;
+
+	stv6110x = kzalloc(sizeof(struct stv6110x_state), GFP_KERNEL);
+	if (!stv6110x)
+		return -ENOMEM;
+
+	stv6110x->frontend	= config->frontend;
+	stv6110x->i2c		= client->adapter;
+	stv6110x->config	= config;
+	stv6110x->devctl	= &stv6110x_ctl;
+
+	st6110x_init_regs(stv6110x);
+	stv6110x_setup_divider(stv6110x);
+	stv6110x_set_frontend_opts(stv6110x);
+
+	printk(KERN_INFO "%s: Probed STV6110x\n", __func__);
+
+	i2c_set_clientdata(client, stv6110x);
+
+	/* setup callbacks */
+	config->get_devctl = stv6110x_get_devctl;
+
+	return 0;
+}
+
+static int stv6110x_remove(struct i2c_client *client)
+{
+	struct stv6110x_state *stv6110x = i2c_get_clientdata(client);
+
+	stv6110x_release(stv6110x->frontend);
+	return 0;
+}
+
 const struct stv6110x_devctl *stv6110x_attach(struct dvb_frontend *fe,
 					const struct stv6110x_config *config,
 					struct i2c_adapter *i2c)
 {
 	struct stv6110x_state *stv6110x;
-	u8 default_regs[] = {0x07, 0x11, 0xdc, 0x85, 0x17, 0x01, 0xe6, 0x1e};
 
-	stv6110x = kzalloc(sizeof (struct stv6110x_state), GFP_KERNEL);
+	stv6110x = kzalloc(sizeof(struct stv6110x_state), GFP_KERNEL);
 	if (!stv6110x)
 		return NULL;
 
+	stv6110x->frontend	= fe;
 	stv6110x->i2c		= i2c;
 	stv6110x->config	= config;
 	stv6110x->devctl	= &stv6110x_ctl;
-	memcpy(stv6110x->regs, default_regs, 8);
 
-	/* setup divider */
-	switch (stv6110x->config->clk_div) {
-	default:
-	case 1:
-		STV6110x_SETFIELD(stv6110x->regs[STV6110x_CTRL2], CTRL2_CO_DIV, 0);
-		break;
-	case 2:
-		STV6110x_SETFIELD(stv6110x->regs[STV6110x_CTRL2], CTRL2_CO_DIV, 1);
-		break;
-	case 4:
-		STV6110x_SETFIELD(stv6110x->regs[STV6110x_CTRL2], CTRL2_CO_DIV, 2);
-		break;
-	case 8:
-	case 0:
-		STV6110x_SETFIELD(stv6110x->regs[STV6110x_CTRL2], CTRL2_CO_DIV, 3);
-		break;
-	}
+	st6110x_init_regs(stv6110x);
+	stv6110x_setup_divider(stv6110x);
+	stv6110x_set_frontend_opts(stv6110x);
 
 	fe->tuner_priv		= stv6110x;
 	fe->ops.tuner_ops	= stv6110x_ops;
@@ -410,6 +475,24 @@ const struct stv6110x_devctl *stv6110x_attach(struct dvb_frontend *fe,
 }
 EXPORT_SYMBOL(stv6110x_attach);
 
+static const struct i2c_device_id stv6110x_id_table[] = {
+	{"stv6110x", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, stv6110x_id_table);
+
+static struct i2c_driver stv6110x_driver = {
+	.driver = {
+		.name	= "stv6110x",
+		.suppress_bind_attrs = true,
+	},
+	.probe		= stv6110x_probe,
+	.remove		= stv6110x_remove,
+	.id_table	= stv6110x_id_table,
+};
+
+module_i2c_driver(stv6110x_driver);
+
 MODULE_AUTHOR("Manu Abraham");
 MODULE_DESCRIPTION("STV6110x Silicon tuner");
 MODULE_LICENSE("GPL");
diff --git a/drivers/media/dvb-frontends/stv6110x.h b/drivers/media/dvb-frontends/stv6110x.h
index 696b6e5b9e7b..7714adea5242 100644
--- a/drivers/media/dvb-frontends/stv6110x.h
+++ b/drivers/media/dvb-frontends/stv6110x.h
@@ -27,6 +27,9 @@ struct stv6110x_config {
 	u8	addr;
 	u32	refclk;
 	u8	clk_div; /* divisor value for the output clock */
+	struct dvb_frontend		*frontend;
+
+	struct stv6110x_devctl* (*get_devctl)(struct i2c_client *);
 };
 
 enum tuner_mode {
diff --git a/drivers/media/dvb-frontends/stv6110x_priv.h b/drivers/media/dvb-frontends/stv6110x_priv.h
index 109dfaf4ba42..383549d25268 100644
--- a/drivers/media/dvb-frontends/stv6110x_priv.h
+++ b/drivers/media/dvb-frontends/stv6110x_priv.h
@@ -66,11 +66,12 @@
 #define REFCLOCK_MHz				(stv6110x->config->refclk / 1000000)
 
 struct stv6110x_state {
+	struct dvb_frontend		*frontend;
 	struct i2c_adapter		*i2c;
 	const struct stv6110x_config	*config;
 	u8				regs[8];
 
-	const struct stv6110x_devctl	*devctl;
+	struct stv6110x_devctl	*devctl;
 };
 
 #endif /* __STV6110x_PRIV_H */
-- 
2.21.0

