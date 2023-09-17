Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3A917A3895
	for <lists+linux-media@lfdr.de>; Sun, 17 Sep 2023 21:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239740AbjIQThh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Sep 2023 15:37:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239853AbjIQThX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Sep 2023 15:37:23 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA56E103;
        Sun, 17 Sep 2023 12:37:14 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD00FC433CD;
        Sun, 17 Sep 2023 19:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1694979434;
        bh=4TwZHEcg7OWwaq6zNYzZ8xovkF6D4J/cnCZ44LNtYNo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kDH+JsEbKKmLTCr8shMSKCxoXuZcBewli5Pi0rS2svEB/TOyLn4pRBn5Pj65WaO0F
         +FbcncEd42RBRBUodkk8pMsWeqw2Dbp0Y4NVvhZA5iQG0Pqb33l3Pd2inxq4etrDki
         jD3m4ejUO3GfUgILVZOHja5fX39gBGxNKz2rV19g=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     stable@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        patches@lists.linux.dev, stable <stable@kernel.org>,
        Stefan Lippers-Hollmann <s.l-h@gmx.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Christoph Hellwig <hch@lst.de>, linux-media@vger.kernel.org,
        linux-modules@vger.kernel.org,
        Luis Chamberlain <mcgrof@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 5.10 285/406] media: dvb: symbol fixup for dvb_attach()
Date:   Sun, 17 Sep 2023 21:12:19 +0200
Message-ID: <20230917191108.828397336@linuxfoundation.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230917191101.035638219@linuxfoundation.org>
References: <20230917191101.035638219@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

5.10-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

commit 86495af1171e1feec79faa9b64c05c89f46e41d1 upstream.

In commit 9011e49d54dc ("modules: only allow symbol_get of
EXPORT_SYMBOL_GPL modules") the use of symbol_get is properly restricted
to GPL-only marked symbols.  This interacts oddly with the DVB logic
which only uses dvb_attach() to load the dvb driver which then uses
symbol_get().

Fix this up by properly marking all of the dvb_attach attach symbols as
EXPORT_SYMBOL_GPL().

Fixes: 9011e49d54dc ("modules: only allow symbol_get of EXPORT_SYMBOL_GPL modules")
Cc: stable <stable@kernel.org>
Reported-by: Stefan Lippers-Hollmann <s.l-h@gmx.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>
Cc: linux-media@vger.kernel.org
Cc: linux-modules@vger.kernel.org
Acked-by: Luis Chamberlain <mcgrof@kernel.org>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Link: https://lore.kernel.org/r/20230908092035.3815268-2-gregkh@linuxfoundation.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/media/dvb-frontends/ascot2e.c             |    2 +-
 drivers/media/dvb-frontends/atbm8830.c            |    2 +-
 drivers/media/dvb-frontends/au8522_dig.c          |    2 +-
 drivers/media/dvb-frontends/bcm3510.c             |    2 +-
 drivers/media/dvb-frontends/cx22700.c             |    2 +-
 drivers/media/dvb-frontends/cx22702.c             |    2 +-
 drivers/media/dvb-frontends/cx24110.c             |    2 +-
 drivers/media/dvb-frontends/cx24113.c             |    2 +-
 drivers/media/dvb-frontends/cx24116.c             |    2 +-
 drivers/media/dvb-frontends/cx24120.c             |    2 +-
 drivers/media/dvb-frontends/cx24123.c             |    2 +-
 drivers/media/dvb-frontends/cxd2820r_core.c       |    2 +-
 drivers/media/dvb-frontends/cxd2841er.c           |    4 ++--
 drivers/media/dvb-frontends/cxd2880/cxd2880_top.c |    2 +-
 drivers/media/dvb-frontends/dib0070.c             |    2 +-
 drivers/media/dvb-frontends/dib0090.c             |    4 ++--
 drivers/media/dvb-frontends/dib3000mb.c           |    2 +-
 drivers/media/dvb-frontends/dib3000mc.c           |    2 +-
 drivers/media/dvb-frontends/dib7000m.c            |    2 +-
 drivers/media/dvb-frontends/dib7000p.c            |    2 +-
 drivers/media/dvb-frontends/dib8000.c             |    2 +-
 drivers/media/dvb-frontends/dib9000.c             |    2 +-
 drivers/media/dvb-frontends/drx39xyj/drxj.c       |    2 +-
 drivers/media/dvb-frontends/drxd_hard.c           |    2 +-
 drivers/media/dvb-frontends/drxk_hard.c           |    2 +-
 drivers/media/dvb-frontends/ds3000.c              |    2 +-
 drivers/media/dvb-frontends/dvb-pll.c             |    2 +-
 drivers/media/dvb-frontends/ec100.c               |    2 +-
 drivers/media/dvb-frontends/helene.c              |    4 ++--
 drivers/media/dvb-frontends/horus3a.c             |    2 +-
 drivers/media/dvb-frontends/isl6405.c             |    2 +-
 drivers/media/dvb-frontends/isl6421.c             |    2 +-
 drivers/media/dvb-frontends/isl6423.c             |    2 +-
 drivers/media/dvb-frontends/itd1000.c             |    2 +-
 drivers/media/dvb-frontends/ix2505v.c             |    2 +-
 drivers/media/dvb-frontends/l64781.c              |    2 +-
 drivers/media/dvb-frontends/lg2160.c              |    2 +-
 drivers/media/dvb-frontends/lgdt3305.c            |    2 +-
 drivers/media/dvb-frontends/lgdt3306a.c           |    2 +-
 drivers/media/dvb-frontends/lgdt330x.c            |    2 +-
 drivers/media/dvb-frontends/lgs8gxx.c             |    2 +-
 drivers/media/dvb-frontends/lnbh25.c              |    2 +-
 drivers/media/dvb-frontends/lnbp21.c              |    4 ++--
 drivers/media/dvb-frontends/lnbp22.c              |    2 +-
 drivers/media/dvb-frontends/m88ds3103.c           |    2 +-
 drivers/media/dvb-frontends/m88rs2000.c           |    2 +-
 drivers/media/dvb-frontends/mb86a16.c             |    2 +-
 drivers/media/dvb-frontends/mb86a20s.c            |    2 +-
 drivers/media/dvb-frontends/mt312.c               |    2 +-
 drivers/media/dvb-frontends/mt352.c               |    2 +-
 drivers/media/dvb-frontends/nxt200x.c             |    2 +-
 drivers/media/dvb-frontends/nxt6000.c             |    2 +-
 drivers/media/dvb-frontends/or51132.c             |    2 +-
 drivers/media/dvb-frontends/or51211.c             |    2 +-
 drivers/media/dvb-frontends/s5h1409.c             |    2 +-
 drivers/media/dvb-frontends/s5h1411.c             |    2 +-
 drivers/media/dvb-frontends/s5h1420.c             |    2 +-
 drivers/media/dvb-frontends/s5h1432.c             |    2 +-
 drivers/media/dvb-frontends/s921.c                |    2 +-
 drivers/media/dvb-frontends/si21xx.c              |    2 +-
 drivers/media/dvb-frontends/sp887x.c              |    2 +-
 drivers/media/dvb-frontends/stb0899_drv.c         |    2 +-
 drivers/media/dvb-frontends/stb6000.c             |    2 +-
 drivers/media/dvb-frontends/stb6100.c             |    2 +-
 drivers/media/dvb-frontends/stv0288.c             |    2 +-
 drivers/media/dvb-frontends/stv0297.c             |    2 +-
 drivers/media/dvb-frontends/stv0299.c             |    2 +-
 drivers/media/dvb-frontends/stv0367.c             |    6 +++---
 drivers/media/dvb-frontends/stv0900_core.c        |    2 +-
 drivers/media/dvb-frontends/stv090x.c             |    2 +-
 drivers/media/dvb-frontends/stv6110.c             |    2 +-
 drivers/media/dvb-frontends/stv6110x.c            |    2 +-
 drivers/media/dvb-frontends/tda10021.c            |    2 +-
 drivers/media/dvb-frontends/tda10023.c            |    2 +-
 drivers/media/dvb-frontends/tda10048.c            |    2 +-
 drivers/media/dvb-frontends/tda1004x.c            |    4 ++--
 drivers/media/dvb-frontends/tda10086.c            |    2 +-
 drivers/media/dvb-frontends/tda665x.c             |    2 +-
 drivers/media/dvb-frontends/tda8083.c             |    2 +-
 drivers/media/dvb-frontends/tda8261.c             |    2 +-
 drivers/media/dvb-frontends/tda826x.c             |    2 +-
 drivers/media/dvb-frontends/ts2020.c              |    2 +-
 drivers/media/dvb-frontends/tua6100.c             |    2 +-
 drivers/media/dvb-frontends/ves1820.c             |    2 +-
 drivers/media/dvb-frontends/ves1x93.c             |    2 +-
 drivers/media/dvb-frontends/zl10036.c             |    2 +-
 drivers/media/dvb-frontends/zl10039.c             |    2 +-
 drivers/media/dvb-frontends/zl10353.c             |    2 +-
 drivers/media/pci/bt8xx/dst.c                     |    2 +-
 drivers/media/pci/bt8xx/dst_ca.c                  |    2 +-
 drivers/media/pci/ddbridge/ddbridge-dummy-fe.c    |    2 +-
 drivers/media/tuners/fc0011.c                     |    2 +-
 drivers/media/tuners/fc0012.c                     |    2 +-
 drivers/media/tuners/fc0013.c                     |    2 +-
 drivers/media/tuners/max2165.c                    |    2 +-
 drivers/media/tuners/mc44s803.c                   |    2 +-
 drivers/media/tuners/mt2060.c                     |    2 +-
 drivers/media/tuners/mt2131.c                     |    2 +-
 drivers/media/tuners/mt2266.c                     |    2 +-
 drivers/media/tuners/mxl5005s.c                   |    2 +-
 drivers/media/tuners/qt1010.c                     |    2 +-
 drivers/media/tuners/tda18218.c                   |    2 +-
 drivers/media/tuners/xc4000.c                     |    2 +-
 drivers/media/tuners/xc5000.c                     |    2 +-
 104 files changed, 111 insertions(+), 111 deletions(-)

--- a/drivers/media/dvb-frontends/ascot2e.c
+++ b/drivers/media/dvb-frontends/ascot2e.c
@@ -533,7 +533,7 @@ struct dvb_frontend *ascot2e_attach(stru
 		priv->i2c_address, priv->i2c);
 	return fe;
 }
-EXPORT_SYMBOL(ascot2e_attach);
+EXPORT_SYMBOL_GPL(ascot2e_attach);
 
 MODULE_DESCRIPTION("Sony ASCOT2E terr/cab tuner driver");
 MODULE_AUTHOR("info@netup.ru");
--- a/drivers/media/dvb-frontends/atbm8830.c
+++ b/drivers/media/dvb-frontends/atbm8830.c
@@ -489,7 +489,7 @@ error_out:
 	return NULL;
 
 }
-EXPORT_SYMBOL(atbm8830_attach);
+EXPORT_SYMBOL_GPL(atbm8830_attach);
 
 MODULE_DESCRIPTION("AltoBeam ATBM8830/8831 GB20600 demodulator driver");
 MODULE_AUTHOR("David T. L. Wong <davidtlwong@gmail.com>");
--- a/drivers/media/dvb-frontends/au8522_dig.c
+++ b/drivers/media/dvb-frontends/au8522_dig.c
@@ -879,7 +879,7 @@ error:
 	au8522_release_state(state);
 	return NULL;
 }
-EXPORT_SYMBOL(au8522_attach);
+EXPORT_SYMBOL_GPL(au8522_attach);
 
 static const struct dvb_frontend_ops au8522_ops = {
 	.delsys = { SYS_ATSC, SYS_DVBC_ANNEX_B },
--- a/drivers/media/dvb-frontends/bcm3510.c
+++ b/drivers/media/dvb-frontends/bcm3510.c
@@ -835,7 +835,7 @@ error:
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(bcm3510_attach);
+EXPORT_SYMBOL_GPL(bcm3510_attach);
 
 static const struct dvb_frontend_ops bcm3510_ops = {
 	.delsys = { SYS_ATSC, SYS_DVBC_ANNEX_B },
--- a/drivers/media/dvb-frontends/cx22700.c
+++ b/drivers/media/dvb-frontends/cx22700.c
@@ -432,4 +432,4 @@ MODULE_DESCRIPTION("Conexant CX22700 DVB
 MODULE_AUTHOR("Holger Waechtler");
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(cx22700_attach);
+EXPORT_SYMBOL_GPL(cx22700_attach);
--- a/drivers/media/dvb-frontends/cx22702.c
+++ b/drivers/media/dvb-frontends/cx22702.c
@@ -604,7 +604,7 @@ error:
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(cx22702_attach);
+EXPORT_SYMBOL_GPL(cx22702_attach);
 
 static const struct dvb_frontend_ops cx22702_ops = {
 	.delsys = { SYS_DVBT },
--- a/drivers/media/dvb-frontends/cx24110.c
+++ b/drivers/media/dvb-frontends/cx24110.c
@@ -653,4 +653,4 @@ MODULE_DESCRIPTION("Conexant CX24110 DVB
 MODULE_AUTHOR("Peter Hettkamp");
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(cx24110_attach);
+EXPORT_SYMBOL_GPL(cx24110_attach);
--- a/drivers/media/dvb-frontends/cx24113.c
+++ b/drivers/media/dvb-frontends/cx24113.c
@@ -590,7 +590,7 @@ error:
 
 	return NULL;
 }
-EXPORT_SYMBOL(cx24113_attach);
+EXPORT_SYMBOL_GPL(cx24113_attach);
 
 module_param(debug, int, 0644);
 MODULE_PARM_DESC(debug, "Activates frontend debugging (default:0)");
--- a/drivers/media/dvb-frontends/cx24116.c
+++ b/drivers/media/dvb-frontends/cx24116.c
@@ -1133,7 +1133,7 @@ struct dvb_frontend *cx24116_attach(cons
 	state->frontend.demodulator_priv = state;
 	return &state->frontend;
 }
-EXPORT_SYMBOL(cx24116_attach);
+EXPORT_SYMBOL_GPL(cx24116_attach);
 
 /*
  * Initialise or wake up device
--- a/drivers/media/dvb-frontends/cx24120.c
+++ b/drivers/media/dvb-frontends/cx24120.c
@@ -305,7 +305,7 @@ error:
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(cx24120_attach);
+EXPORT_SYMBOL_GPL(cx24120_attach);
 
 static int cx24120_test_rom(struct cx24120_state *state)
 {
--- a/drivers/media/dvb-frontends/cx24123.c
+++ b/drivers/media/dvb-frontends/cx24123.c
@@ -1096,7 +1096,7 @@ error:
 
 	return NULL;
 }
-EXPORT_SYMBOL(cx24123_attach);
+EXPORT_SYMBOL_GPL(cx24123_attach);
 
 static const struct dvb_frontend_ops cx24123_ops = {
 	.delsys = { SYS_DVBS },
--- a/drivers/media/dvb-frontends/cxd2820r_core.c
+++ b/drivers/media/dvb-frontends/cxd2820r_core.c
@@ -536,7 +536,7 @@ struct dvb_frontend *cxd2820r_attach(con
 
 	return pdata.get_dvb_frontend(client);
 }
-EXPORT_SYMBOL(cxd2820r_attach);
+EXPORT_SYMBOL_GPL(cxd2820r_attach);
 
 static struct dvb_frontend *cxd2820r_get_dvb_frontend(struct i2c_client *client)
 {
--- a/drivers/media/dvb-frontends/cxd2841er.c
+++ b/drivers/media/dvb-frontends/cxd2841er.c
@@ -3930,14 +3930,14 @@ struct dvb_frontend *cxd2841er_attach_s(
 {
 	return cxd2841er_attach(cfg, i2c, SYS_DVBS);
 }
-EXPORT_SYMBOL(cxd2841er_attach_s);
+EXPORT_SYMBOL_GPL(cxd2841er_attach_s);
 
 struct dvb_frontend *cxd2841er_attach_t_c(struct cxd2841er_config *cfg,
 					struct i2c_adapter *i2c)
 {
 	return cxd2841er_attach(cfg, i2c, 0);
 }
-EXPORT_SYMBOL(cxd2841er_attach_t_c);
+EXPORT_SYMBOL_GPL(cxd2841er_attach_t_c);
 
 static const struct dvb_frontend_ops cxd2841er_dvbs_s2_ops = {
 	.delsys = { SYS_DVBS, SYS_DVBS2 },
--- a/drivers/media/dvb-frontends/cxd2880/cxd2880_top.c
+++ b/drivers/media/dvb-frontends/cxd2880/cxd2880_top.c
@@ -1950,7 +1950,7 @@ struct dvb_frontend *cxd2880_attach(stru
 
 	return fe;
 }
-EXPORT_SYMBOL(cxd2880_attach);
+EXPORT_SYMBOL_GPL(cxd2880_attach);
 
 MODULE_DESCRIPTION("Sony CXD2880 DVB-T2/T tuner + demod driver");
 MODULE_AUTHOR("Sony Semiconductor Solutions Corporation");
--- a/drivers/media/dvb-frontends/dib0070.c
+++ b/drivers/media/dvb-frontends/dib0070.c
@@ -762,7 +762,7 @@ free_mem:
 	fe->tuner_priv = NULL;
 	return NULL;
 }
-EXPORT_SYMBOL(dib0070_attach);
+EXPORT_SYMBOL_GPL(dib0070_attach);
 
 MODULE_AUTHOR("Patrick Boettcher <patrick.boettcher@posteo.de>");
 MODULE_DESCRIPTION("Driver for the DiBcom 0070 base-band RF Tuner");
--- a/drivers/media/dvb-frontends/dib0090.c
+++ b/drivers/media/dvb-frontends/dib0090.c
@@ -2632,7 +2632,7 @@ struct dvb_frontend *dib0090_register(st
 	return NULL;
 }
 
-EXPORT_SYMBOL(dib0090_register);
+EXPORT_SYMBOL_GPL(dib0090_register);
 
 struct dvb_frontend *dib0090_fw_register(struct dvb_frontend *fe, struct i2c_adapter *i2c, const struct dib0090_config *config)
 {
@@ -2658,7 +2658,7 @@ free_mem:
 	fe->tuner_priv = NULL;
 	return NULL;
 }
-EXPORT_SYMBOL(dib0090_fw_register);
+EXPORT_SYMBOL_GPL(dib0090_fw_register);
 
 MODULE_AUTHOR("Patrick Boettcher <patrick.boettcher@posteo.de>");
 MODULE_AUTHOR("Olivier Grenie <olivier.grenie@parrot.com>");
--- a/drivers/media/dvb-frontends/dib3000mb.c
+++ b/drivers/media/dvb-frontends/dib3000mb.c
@@ -815,4 +815,4 @@ MODULE_AUTHOR(DRIVER_AUTHOR);
 MODULE_DESCRIPTION(DRIVER_DESC);
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(dib3000mb_attach);
+EXPORT_SYMBOL_GPL(dib3000mb_attach);
--- a/drivers/media/dvb-frontends/dib3000mc.c
+++ b/drivers/media/dvb-frontends/dib3000mc.c
@@ -935,7 +935,7 @@ error:
 	kfree(st);
 	return NULL;
 }
-EXPORT_SYMBOL(dib3000mc_attach);
+EXPORT_SYMBOL_GPL(dib3000mc_attach);
 
 static const struct dvb_frontend_ops dib3000mc_ops = {
 	.delsys = { SYS_DVBT },
--- a/drivers/media/dvb-frontends/dib7000m.c
+++ b/drivers/media/dvb-frontends/dib7000m.c
@@ -1434,7 +1434,7 @@ error:
 	kfree(st);
 	return NULL;
 }
-EXPORT_SYMBOL(dib7000m_attach);
+EXPORT_SYMBOL_GPL(dib7000m_attach);
 
 static const struct dvb_frontend_ops dib7000m_ops = {
 	.delsys = { SYS_DVBT },
--- a/drivers/media/dvb-frontends/dib7000p.c
+++ b/drivers/media/dvb-frontends/dib7000p.c
@@ -2822,7 +2822,7 @@ void *dib7000p_attach(struct dib7000p_op
 
 	return ops;
 }
-EXPORT_SYMBOL(dib7000p_attach);
+EXPORT_SYMBOL_GPL(dib7000p_attach);
 
 static const struct dvb_frontend_ops dib7000p_ops = {
 	.delsys = { SYS_DVBT },
--- a/drivers/media/dvb-frontends/dib8000.c
+++ b/drivers/media/dvb-frontends/dib8000.c
@@ -4527,7 +4527,7 @@ void *dib8000_attach(struct dib8000_ops
 
 	return ops;
 }
-EXPORT_SYMBOL(dib8000_attach);
+EXPORT_SYMBOL_GPL(dib8000_attach);
 
 MODULE_AUTHOR("Olivier Grenie <Olivier.Grenie@parrot.com, Patrick Boettcher <patrick.boettcher@posteo.de>");
 MODULE_DESCRIPTION("Driver for the DiBcom 8000 ISDB-T demodulator");
--- a/drivers/media/dvb-frontends/dib9000.c
+++ b/drivers/media/dvb-frontends/dib9000.c
@@ -2546,7 +2546,7 @@ error:
 	kfree(st);
 	return NULL;
 }
-EXPORT_SYMBOL(dib9000_attach);
+EXPORT_SYMBOL_GPL(dib9000_attach);
 
 static const struct dvb_frontend_ops dib9000_ops = {
 	.delsys = { SYS_DVBT },
--- a/drivers/media/dvb-frontends/drx39xyj/drxj.c
+++ b/drivers/media/dvb-frontends/drx39xyj/drxj.c
@@ -12375,7 +12375,7 @@ error:
 
 	return NULL;
 }
-EXPORT_SYMBOL(drx39xxj_attach);
+EXPORT_SYMBOL_GPL(drx39xxj_attach);
 
 static const struct dvb_frontend_ops drx39xxj_ops = {
 	.delsys = { SYS_ATSC, SYS_DVBC_ANNEX_B },
--- a/drivers/media/dvb-frontends/drxd_hard.c
+++ b/drivers/media/dvb-frontends/drxd_hard.c
@@ -2948,7 +2948,7 @@ error:
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(drxd_attach);
+EXPORT_SYMBOL_GPL(drxd_attach);
 
 MODULE_DESCRIPTION("DRXD driver");
 MODULE_AUTHOR("Micronas");
--- a/drivers/media/dvb-frontends/drxk_hard.c
+++ b/drivers/media/dvb-frontends/drxk_hard.c
@@ -6845,7 +6845,7 @@ error:
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(drxk_attach);
+EXPORT_SYMBOL_GPL(drxk_attach);
 
 MODULE_DESCRIPTION("DRX-K driver");
 MODULE_AUTHOR("Ralph Metzler");
--- a/drivers/media/dvb-frontends/ds3000.c
+++ b/drivers/media/dvb-frontends/ds3000.c
@@ -859,7 +859,7 @@ struct dvb_frontend *ds3000_attach(const
 	ds3000_set_voltage(&state->frontend, SEC_VOLTAGE_OFF);
 	return &state->frontend;
 }
-EXPORT_SYMBOL(ds3000_attach);
+EXPORT_SYMBOL_GPL(ds3000_attach);
 
 static int ds3000_set_carrier_offset(struct dvb_frontend *fe,
 					s32 carrier_offset_khz)
--- a/drivers/media/dvb-frontends/dvb-pll.c
+++ b/drivers/media/dvb-frontends/dvb-pll.c
@@ -866,7 +866,7 @@ out:
 
 	return NULL;
 }
-EXPORT_SYMBOL(dvb_pll_attach);
+EXPORT_SYMBOL_GPL(dvb_pll_attach);
 
 
 static int
--- a/drivers/media/dvb-frontends/ec100.c
+++ b/drivers/media/dvb-frontends/ec100.c
@@ -299,7 +299,7 @@ error:
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(ec100_attach);
+EXPORT_SYMBOL_GPL(ec100_attach);
 
 static const struct dvb_frontend_ops ec100_ops = {
 	.delsys = { SYS_DVBT },
--- a/drivers/media/dvb-frontends/helene.c
+++ b/drivers/media/dvb-frontends/helene.c
@@ -1025,7 +1025,7 @@ struct dvb_frontend *helene_attach_s(str
 			priv->i2c_address, priv->i2c);
 	return fe;
 }
-EXPORT_SYMBOL(helene_attach_s);
+EXPORT_SYMBOL_GPL(helene_attach_s);
 
 struct dvb_frontend *helene_attach(struct dvb_frontend *fe,
 		const struct helene_config *config,
@@ -1061,7 +1061,7 @@ struct dvb_frontend *helene_attach(struc
 			priv->i2c_address, priv->i2c);
 	return fe;
 }
-EXPORT_SYMBOL(helene_attach);
+EXPORT_SYMBOL_GPL(helene_attach);
 
 static int helene_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
--- a/drivers/media/dvb-frontends/horus3a.c
+++ b/drivers/media/dvb-frontends/horus3a.c
@@ -395,7 +395,7 @@ struct dvb_frontend *horus3a_attach(stru
 		priv->i2c_address, priv->i2c);
 	return fe;
 }
-EXPORT_SYMBOL(horus3a_attach);
+EXPORT_SYMBOL_GPL(horus3a_attach);
 
 MODULE_DESCRIPTION("Sony HORUS3A satellite tuner driver");
 MODULE_AUTHOR("Sergey Kozlov <serjk@netup.ru>");
--- a/drivers/media/dvb-frontends/isl6405.c
+++ b/drivers/media/dvb-frontends/isl6405.c
@@ -141,7 +141,7 @@ struct dvb_frontend *isl6405_attach(stru
 
 	return fe;
 }
-EXPORT_SYMBOL(isl6405_attach);
+EXPORT_SYMBOL_GPL(isl6405_attach);
 
 MODULE_DESCRIPTION("Driver for lnb supply and control ic isl6405");
 MODULE_AUTHOR("Hartmut Hackmann & Oliver Endriss");
--- a/drivers/media/dvb-frontends/isl6421.c
+++ b/drivers/media/dvb-frontends/isl6421.c
@@ -213,7 +213,7 @@ struct dvb_frontend *isl6421_attach(stru
 
 	return fe;
 }
-EXPORT_SYMBOL(isl6421_attach);
+EXPORT_SYMBOL_GPL(isl6421_attach);
 
 MODULE_DESCRIPTION("Driver for lnb supply and control ic isl6421");
 MODULE_AUTHOR("Andrew de Quincey & Oliver Endriss");
--- a/drivers/media/dvb-frontends/isl6423.c
+++ b/drivers/media/dvb-frontends/isl6423.c
@@ -289,7 +289,7 @@ exit:
 	fe->sec_priv = NULL;
 	return NULL;
 }
-EXPORT_SYMBOL(isl6423_attach);
+EXPORT_SYMBOL_GPL(isl6423_attach);
 
 MODULE_DESCRIPTION("ISL6423 SEC");
 MODULE_AUTHOR("Manu Abraham");
--- a/drivers/media/dvb-frontends/itd1000.c
+++ b/drivers/media/dvb-frontends/itd1000.c
@@ -389,7 +389,7 @@ struct dvb_frontend *itd1000_attach(stru
 
 	return fe;
 }
-EXPORT_SYMBOL(itd1000_attach);
+EXPORT_SYMBOL_GPL(itd1000_attach);
 
 MODULE_AUTHOR("Patrick Boettcher <pb@linuxtv.org>");
 MODULE_DESCRIPTION("Integrant ITD1000 driver");
--- a/drivers/media/dvb-frontends/ix2505v.c
+++ b/drivers/media/dvb-frontends/ix2505v.c
@@ -302,7 +302,7 @@ error:
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(ix2505v_attach);
+EXPORT_SYMBOL_GPL(ix2505v_attach);
 
 module_param_named(debug, ix2505v_debug, int, 0644);
 MODULE_PARM_DESC(debug, "Turn on/off frontend debugging (default:off).");
--- a/drivers/media/dvb-frontends/l64781.c
+++ b/drivers/media/dvb-frontends/l64781.c
@@ -593,4 +593,4 @@ MODULE_DESCRIPTION("LSI L64781 DVB-T Dem
 MODULE_AUTHOR("Holger Waechtler, Marko Kohtala");
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(l64781_attach);
+EXPORT_SYMBOL_GPL(l64781_attach);
--- a/drivers/media/dvb-frontends/lg2160.c
+++ b/drivers/media/dvb-frontends/lg2160.c
@@ -1426,7 +1426,7 @@ struct dvb_frontend *lg2160_attach(const
 
 	return &state->frontend;
 }
-EXPORT_SYMBOL(lg2160_attach);
+EXPORT_SYMBOL_GPL(lg2160_attach);
 
 MODULE_DESCRIPTION("LG Electronics LG216x ATSC/MH Demodulator Driver");
 MODULE_AUTHOR("Michael Krufky <mkrufky@linuxtv.org>");
--- a/drivers/media/dvb-frontends/lgdt3305.c
+++ b/drivers/media/dvb-frontends/lgdt3305.c
@@ -1148,7 +1148,7 @@ fail:
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(lgdt3305_attach);
+EXPORT_SYMBOL_GPL(lgdt3305_attach);
 
 static const struct dvb_frontend_ops lgdt3304_ops = {
 	.delsys = { SYS_ATSC, SYS_DVBC_ANNEX_B },
--- a/drivers/media/dvb-frontends/lgdt3306a.c
+++ b/drivers/media/dvb-frontends/lgdt3306a.c
@@ -1895,7 +1895,7 @@ fail:
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(lgdt3306a_attach);
+EXPORT_SYMBOL_GPL(lgdt3306a_attach);
 
 #ifdef DBG_DUMP
 
--- a/drivers/media/dvb-frontends/lgdt330x.c
+++ b/drivers/media/dvb-frontends/lgdt330x.c
@@ -928,7 +928,7 @@ struct dvb_frontend *lgdt330x_attach(con
 
 	return lgdt330x_get_dvb_frontend(client);
 }
-EXPORT_SYMBOL(lgdt330x_attach);
+EXPORT_SYMBOL_GPL(lgdt330x_attach);
 
 static const struct dvb_frontend_ops lgdt3302_ops = {
 	.delsys = { SYS_ATSC, SYS_DVBC_ANNEX_B },
--- a/drivers/media/dvb-frontends/lgs8gxx.c
+++ b/drivers/media/dvb-frontends/lgs8gxx.c
@@ -1043,7 +1043,7 @@ error_out:
 	return NULL;
 
 }
-EXPORT_SYMBOL(lgs8gxx_attach);
+EXPORT_SYMBOL_GPL(lgs8gxx_attach);
 
 MODULE_DESCRIPTION("Legend Silicon LGS8913/LGS8GXX DMB-TH demodulator driver");
 MODULE_AUTHOR("David T. L. Wong <davidtlwong@gmail.com>");
--- a/drivers/media/dvb-frontends/lnbh25.c
+++ b/drivers/media/dvb-frontends/lnbh25.c
@@ -173,7 +173,7 @@ struct dvb_frontend *lnbh25_attach(struc
 		__func__, priv->i2c_address);
 	return fe;
 }
-EXPORT_SYMBOL(lnbh25_attach);
+EXPORT_SYMBOL_GPL(lnbh25_attach);
 
 MODULE_DESCRIPTION("ST LNBH25 driver");
 MODULE_AUTHOR("info@netup.ru");
--- a/drivers/media/dvb-frontends/lnbp21.c
+++ b/drivers/media/dvb-frontends/lnbp21.c
@@ -155,7 +155,7 @@ struct dvb_frontend *lnbh24_attach(struc
 	return lnbx2x_attach(fe, i2c, override_set, override_clear,
 							i2c_addr, LNBH24_TTX);
 }
-EXPORT_SYMBOL(lnbh24_attach);
+EXPORT_SYMBOL_GPL(lnbh24_attach);
 
 struct dvb_frontend *lnbp21_attach(struct dvb_frontend *fe,
 				struct i2c_adapter *i2c, u8 override_set,
@@ -164,7 +164,7 @@ struct dvb_frontend *lnbp21_attach(struc
 	return lnbx2x_attach(fe, i2c, override_set, override_clear,
 							0x08, LNBP21_ISEL);
 }
-EXPORT_SYMBOL(lnbp21_attach);
+EXPORT_SYMBOL_GPL(lnbp21_attach);
 
 MODULE_DESCRIPTION("Driver for lnb supply and control ic lnbp21, lnbh24");
 MODULE_AUTHOR("Oliver Endriss, Igor M. Liplianin");
--- a/drivers/media/dvb-frontends/lnbp22.c
+++ b/drivers/media/dvb-frontends/lnbp22.c
@@ -125,7 +125,7 @@ struct dvb_frontend *lnbp22_attach(struc
 
 	return fe;
 }
-EXPORT_SYMBOL(lnbp22_attach);
+EXPORT_SYMBOL_GPL(lnbp22_attach);
 
 MODULE_DESCRIPTION("Driver for lnb supply and control ic lnbp22");
 MODULE_AUTHOR("Dominik Kuhlen");
--- a/drivers/media/dvb-frontends/m88ds3103.c
+++ b/drivers/media/dvb-frontends/m88ds3103.c
@@ -1699,7 +1699,7 @@ struct dvb_frontend *m88ds3103_attach(co
 	*tuner_i2c_adapter = pdata.get_i2c_adapter(client);
 	return pdata.get_dvb_frontend(client);
 }
-EXPORT_SYMBOL(m88ds3103_attach);
+EXPORT_SYMBOL_GPL(m88ds3103_attach);
 
 static const struct dvb_frontend_ops m88ds3103_ops = {
 	.delsys = {SYS_DVBS, SYS_DVBS2},
--- a/drivers/media/dvb-frontends/m88rs2000.c
+++ b/drivers/media/dvb-frontends/m88rs2000.c
@@ -807,7 +807,7 @@ error:
 
 	return NULL;
 }
-EXPORT_SYMBOL(m88rs2000_attach);
+EXPORT_SYMBOL_GPL(m88rs2000_attach);
 
 MODULE_DESCRIPTION("M88RS2000 DVB-S Demodulator driver");
 MODULE_AUTHOR("Malcolm Priestley tvboxspy@gmail.com");
--- a/drivers/media/dvb-frontends/mb86a16.c
+++ b/drivers/media/dvb-frontends/mb86a16.c
@@ -1848,6 +1848,6 @@ error:
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(mb86a16_attach);
+EXPORT_SYMBOL_GPL(mb86a16_attach);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Manu Abraham");
--- a/drivers/media/dvb-frontends/mb86a20s.c
+++ b/drivers/media/dvb-frontends/mb86a20s.c
@@ -2081,7 +2081,7 @@ struct dvb_frontend *mb86a20s_attach(con
 	dev_info(&i2c->dev, "Detected a Fujitsu mb86a20s frontend\n");
 	return &state->frontend;
 }
-EXPORT_SYMBOL(mb86a20s_attach);
+EXPORT_SYMBOL_GPL(mb86a20s_attach);
 
 static const struct dvb_frontend_ops mb86a20s_ops = {
 	.delsys = { SYS_ISDBT },
--- a/drivers/media/dvb-frontends/mt312.c
+++ b/drivers/media/dvb-frontends/mt312.c
@@ -827,7 +827,7 @@ error:
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(mt312_attach);
+EXPORT_SYMBOL_GPL(mt312_attach);
 
 module_param(debug, int, 0644);
 MODULE_PARM_DESC(debug, "Turn on/off frontend debugging (default:off).");
--- a/drivers/media/dvb-frontends/mt352.c
+++ b/drivers/media/dvb-frontends/mt352.c
@@ -593,4 +593,4 @@ MODULE_DESCRIPTION("Zarlink MT352 DVB-T
 MODULE_AUTHOR("Holger Waechtler, Daniel Mack, Antonio Mancuso");
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(mt352_attach);
+EXPORT_SYMBOL_GPL(mt352_attach);
--- a/drivers/media/dvb-frontends/nxt200x.c
+++ b/drivers/media/dvb-frontends/nxt200x.c
@@ -1232,5 +1232,5 @@ MODULE_DESCRIPTION("NXT200X (ATSC 8VSB &
 MODULE_AUTHOR("Kirk Lapray, Michael Krufky, Jean-Francois Thibert, and Taylor Jacob");
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(nxt200x_attach);
+EXPORT_SYMBOL_GPL(nxt200x_attach);
 
--- a/drivers/media/dvb-frontends/nxt6000.c
+++ b/drivers/media/dvb-frontends/nxt6000.c
@@ -621,4 +621,4 @@ MODULE_DESCRIPTION("NxtWave NXT6000 DVB-
 MODULE_AUTHOR("Florian Schirmer");
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(nxt6000_attach);
+EXPORT_SYMBOL_GPL(nxt6000_attach);
--- a/drivers/media/dvb-frontends/or51132.c
+++ b/drivers/media/dvb-frontends/or51132.c
@@ -605,4 +605,4 @@ MODULE_AUTHOR("Kirk Lapray");
 MODULE_AUTHOR("Trent Piepho");
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(or51132_attach);
+EXPORT_SYMBOL_GPL(or51132_attach);
--- a/drivers/media/dvb-frontends/or51211.c
+++ b/drivers/media/dvb-frontends/or51211.c
@@ -551,5 +551,5 @@ MODULE_DESCRIPTION("Oren OR51211 VSB [pc
 MODULE_AUTHOR("Kirk Lapray");
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(or51211_attach);
+EXPORT_SYMBOL_GPL(or51211_attach);
 
--- a/drivers/media/dvb-frontends/s5h1409.c
+++ b/drivers/media/dvb-frontends/s5h1409.c
@@ -981,7 +981,7 @@ error:
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(s5h1409_attach);
+EXPORT_SYMBOL_GPL(s5h1409_attach);
 
 static const struct dvb_frontend_ops s5h1409_ops = {
 	.delsys = { SYS_ATSC, SYS_DVBC_ANNEX_B },
--- a/drivers/media/dvb-frontends/s5h1411.c
+++ b/drivers/media/dvb-frontends/s5h1411.c
@@ -900,7 +900,7 @@ error:
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(s5h1411_attach);
+EXPORT_SYMBOL_GPL(s5h1411_attach);
 
 static const struct dvb_frontend_ops s5h1411_ops = {
 	.delsys = { SYS_ATSC, SYS_DVBC_ANNEX_B },
--- a/drivers/media/dvb-frontends/s5h1420.c
+++ b/drivers/media/dvb-frontends/s5h1420.c
@@ -918,7 +918,7 @@ error:
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(s5h1420_attach);
+EXPORT_SYMBOL_GPL(s5h1420_attach);
 
 static const struct dvb_frontend_ops s5h1420_ops = {
 	.delsys = { SYS_DVBS },
--- a/drivers/media/dvb-frontends/s5h1432.c
+++ b/drivers/media/dvb-frontends/s5h1432.c
@@ -355,7 +355,7 @@ struct dvb_frontend *s5h1432_attach(cons
 
 	return &state->frontend;
 }
-EXPORT_SYMBOL(s5h1432_attach);
+EXPORT_SYMBOL_GPL(s5h1432_attach);
 
 static const struct dvb_frontend_ops s5h1432_ops = {
 	.delsys = { SYS_DVBT },
--- a/drivers/media/dvb-frontends/s921.c
+++ b/drivers/media/dvb-frontends/s921.c
@@ -495,7 +495,7 @@ struct dvb_frontend *s921_attach(const s
 
 	return &state->frontend;
 }
-EXPORT_SYMBOL(s921_attach);
+EXPORT_SYMBOL_GPL(s921_attach);
 
 static const struct dvb_frontend_ops s921_ops = {
 	.delsys = { SYS_ISDBT },
--- a/drivers/media/dvb-frontends/si21xx.c
+++ b/drivers/media/dvb-frontends/si21xx.c
@@ -938,7 +938,7 @@ error:
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(si21xx_attach);
+EXPORT_SYMBOL_GPL(si21xx_attach);
 
 module_param(debug, int, 0644);
 MODULE_PARM_DESC(debug, "Turn on/off frontend debugging (default:off).");
--- a/drivers/media/dvb-frontends/sp887x.c
+++ b/drivers/media/dvb-frontends/sp887x.c
@@ -626,4 +626,4 @@ MODULE_PARM_DESC(debug, "Turn on/off fro
 MODULE_DESCRIPTION("Spase sp887x DVB-T demodulator driver");
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(sp887x_attach);
+EXPORT_SYMBOL_GPL(sp887x_attach);
--- a/drivers/media/dvb-frontends/stb0899_drv.c
+++ b/drivers/media/dvb-frontends/stb0899_drv.c
@@ -1638,7 +1638,7 @@ error:
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(stb0899_attach);
+EXPORT_SYMBOL_GPL(stb0899_attach);
 MODULE_PARM_DESC(verbose, "Set Verbosity level");
 MODULE_AUTHOR("Manu Abraham");
 MODULE_DESCRIPTION("STB0899 Multi-Std frontend");
--- a/drivers/media/dvb-frontends/stb6000.c
+++ b/drivers/media/dvb-frontends/stb6000.c
@@ -232,7 +232,7 @@ struct dvb_frontend *stb6000_attach(stru
 
 	return fe;
 }
-EXPORT_SYMBOL(stb6000_attach);
+EXPORT_SYMBOL_GPL(stb6000_attach);
 
 module_param(debug, int, 0644);
 MODULE_PARM_DESC(debug, "Turn on/off frontend debugging (default:off).");
--- a/drivers/media/dvb-frontends/stb6100.c
+++ b/drivers/media/dvb-frontends/stb6100.c
@@ -557,7 +557,7 @@ static void stb6100_release(struct dvb_f
 	kfree(state);
 }
 
-EXPORT_SYMBOL(stb6100_attach);
+EXPORT_SYMBOL_GPL(stb6100_attach);
 MODULE_PARM_DESC(verbose, "Set Verbosity level");
 
 MODULE_AUTHOR("Manu Abraham");
--- a/drivers/media/dvb-frontends/stv0288.c
+++ b/drivers/media/dvb-frontends/stv0288.c
@@ -590,7 +590,7 @@ error:
 
 	return NULL;
 }
-EXPORT_SYMBOL(stv0288_attach);
+EXPORT_SYMBOL_GPL(stv0288_attach);
 
 module_param(debug_legacy_dish_switch, int, 0444);
 MODULE_PARM_DESC(debug_legacy_dish_switch,
--- a/drivers/media/dvb-frontends/stv0297.c
+++ b/drivers/media/dvb-frontends/stv0297.c
@@ -710,4 +710,4 @@ MODULE_DESCRIPTION("ST STV0297 DVB-C Dem
 MODULE_AUTHOR("Dennis Noermann and Andrew de Quincey");
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(stv0297_attach);
+EXPORT_SYMBOL_GPL(stv0297_attach);
--- a/drivers/media/dvb-frontends/stv0299.c
+++ b/drivers/media/dvb-frontends/stv0299.c
@@ -751,4 +751,4 @@ MODULE_DESCRIPTION("ST STV0299 DVB Demod
 MODULE_AUTHOR("Ralph Metzler, Holger Waechtler, Peter Schildmann, Felix Domke, Andreas Oberritter, Andrew de Quincey, Kenneth Aafly");
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(stv0299_attach);
+EXPORT_SYMBOL_GPL(stv0299_attach);
--- a/drivers/media/dvb-frontends/stv0367.c
+++ b/drivers/media/dvb-frontends/stv0367.c
@@ -1750,7 +1750,7 @@ error:
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(stv0367ter_attach);
+EXPORT_SYMBOL_GPL(stv0367ter_attach);
 
 static int stv0367cab_gate_ctrl(struct dvb_frontend *fe, int enable)
 {
@@ -2923,7 +2923,7 @@ error:
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(stv0367cab_attach);
+EXPORT_SYMBOL_GPL(stv0367cab_attach);
 
 /*
  * Functions for operation on Digital Devices hardware
@@ -3344,7 +3344,7 @@ error:
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(stv0367ddb_attach);
+EXPORT_SYMBOL_GPL(stv0367ddb_attach);
 
 MODULE_PARM_DESC(debug, "Set debug");
 MODULE_PARM_DESC(i2c_debug, "Set i2c debug");
--- a/drivers/media/dvb-frontends/stv0900_core.c
+++ b/drivers/media/dvb-frontends/stv0900_core.c
@@ -1957,7 +1957,7 @@ error:
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(stv0900_attach);
+EXPORT_SYMBOL_GPL(stv0900_attach);
 
 MODULE_PARM_DESC(debug, "Set debug");
 
--- a/drivers/media/dvb-frontends/stv090x.c
+++ b/drivers/media/dvb-frontends/stv090x.c
@@ -5073,7 +5073,7 @@ error:
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(stv090x_attach);
+EXPORT_SYMBOL_GPL(stv090x_attach);
 
 static const struct i2c_device_id stv090x_id_table[] = {
 	{"stv090x", 0},
--- a/drivers/media/dvb-frontends/stv6110.c
+++ b/drivers/media/dvb-frontends/stv6110.c
@@ -427,7 +427,7 @@ struct dvb_frontend *stv6110_attach(stru
 
 	return fe;
 }
-EXPORT_SYMBOL(stv6110_attach);
+EXPORT_SYMBOL_GPL(stv6110_attach);
 
 module_param(debug, int, 0644);
 MODULE_PARM_DESC(debug, "Turn on/off frontend debugging (default:off).");
--- a/drivers/media/dvb-frontends/stv6110x.c
+++ b/drivers/media/dvb-frontends/stv6110x.c
@@ -469,7 +469,7 @@ const struct stv6110x_devctl *stv6110x_a
 	dev_info(&stv6110x->i2c->dev, "Attaching STV6110x\n");
 	return stv6110x->devctl;
 }
-EXPORT_SYMBOL(stv6110x_attach);
+EXPORT_SYMBOL_GPL(stv6110x_attach);
 
 static const struct i2c_device_id stv6110x_id_table[] = {
 	{"stv6110x", 0},
--- a/drivers/media/dvb-frontends/tda10021.c
+++ b/drivers/media/dvb-frontends/tda10021.c
@@ -523,4 +523,4 @@ MODULE_DESCRIPTION("Philips TDA10021 DVB
 MODULE_AUTHOR("Ralph Metzler, Holger Waechtler, Markus Schulz");
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(tda10021_attach);
+EXPORT_SYMBOL_GPL(tda10021_attach);
--- a/drivers/media/dvb-frontends/tda10023.c
+++ b/drivers/media/dvb-frontends/tda10023.c
@@ -594,4 +594,4 @@ MODULE_DESCRIPTION("Philips TDA10023 DVB
 MODULE_AUTHOR("Georg Acher, Hartmut Birr");
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(tda10023_attach);
+EXPORT_SYMBOL_GPL(tda10023_attach);
--- a/drivers/media/dvb-frontends/tda10048.c
+++ b/drivers/media/dvb-frontends/tda10048.c
@@ -1138,7 +1138,7 @@ error:
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(tda10048_attach);
+EXPORT_SYMBOL_GPL(tda10048_attach);
 
 static const struct dvb_frontend_ops tda10048_ops = {
 	.delsys = { SYS_DVBT },
--- a/drivers/media/dvb-frontends/tda1004x.c
+++ b/drivers/media/dvb-frontends/tda1004x.c
@@ -1378,5 +1378,5 @@ MODULE_DESCRIPTION("Philips TDA10045H &
 MODULE_AUTHOR("Andrew de Quincey & Robert Schlabbach");
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(tda10045_attach);
-EXPORT_SYMBOL(tda10046_attach);
+EXPORT_SYMBOL_GPL(tda10045_attach);
+EXPORT_SYMBOL_GPL(tda10046_attach);
--- a/drivers/media/dvb-frontends/tda10086.c
+++ b/drivers/media/dvb-frontends/tda10086.c
@@ -764,4 +764,4 @@ MODULE_DESCRIPTION("Philips TDA10086 DVB
 MODULE_AUTHOR("Andrew de Quincey");
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(tda10086_attach);
+EXPORT_SYMBOL_GPL(tda10086_attach);
--- a/drivers/media/dvb-frontends/tda665x.c
+++ b/drivers/media/dvb-frontends/tda665x.c
@@ -227,7 +227,7 @@ struct dvb_frontend *tda665x_attach(stru
 
 	return fe;
 }
-EXPORT_SYMBOL(tda665x_attach);
+EXPORT_SYMBOL_GPL(tda665x_attach);
 
 MODULE_DESCRIPTION("TDA665x driver");
 MODULE_AUTHOR("Manu Abraham");
--- a/drivers/media/dvb-frontends/tda8083.c
+++ b/drivers/media/dvb-frontends/tda8083.c
@@ -481,4 +481,4 @@ MODULE_DESCRIPTION("Philips TDA8083 DVB-
 MODULE_AUTHOR("Ralph Metzler, Holger Waechtler");
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(tda8083_attach);
+EXPORT_SYMBOL_GPL(tda8083_attach);
--- a/drivers/media/dvb-frontends/tda8261.c
+++ b/drivers/media/dvb-frontends/tda8261.c
@@ -188,7 +188,7 @@ exit:
 	return NULL;
 }
 
-EXPORT_SYMBOL(tda8261_attach);
+EXPORT_SYMBOL_GPL(tda8261_attach);
 
 MODULE_AUTHOR("Manu Abraham");
 MODULE_DESCRIPTION("TDA8261 8PSK/QPSK Tuner");
--- a/drivers/media/dvb-frontends/tda826x.c
+++ b/drivers/media/dvb-frontends/tda826x.c
@@ -164,7 +164,7 @@ struct dvb_frontend *tda826x_attach(stru
 
 	return fe;
 }
-EXPORT_SYMBOL(tda826x_attach);
+EXPORT_SYMBOL_GPL(tda826x_attach);
 
 module_param(debug, int, 0644);
 MODULE_PARM_DESC(debug, "Turn on/off frontend debugging (default:off).");
--- a/drivers/media/dvb-frontends/ts2020.c
+++ b/drivers/media/dvb-frontends/ts2020.c
@@ -525,7 +525,7 @@ struct dvb_frontend *ts2020_attach(struc
 
 	return fe;
 }
-EXPORT_SYMBOL(ts2020_attach);
+EXPORT_SYMBOL_GPL(ts2020_attach);
 
 /*
  * We implement own regmap locking due to legacy DVB attach which uses frontend
--- a/drivers/media/dvb-frontends/tua6100.c
+++ b/drivers/media/dvb-frontends/tua6100.c
@@ -186,7 +186,7 @@ struct dvb_frontend *tua6100_attach(stru
 	fe->tuner_priv = priv;
 	return fe;
 }
-EXPORT_SYMBOL(tua6100_attach);
+EXPORT_SYMBOL_GPL(tua6100_attach);
 
 MODULE_DESCRIPTION("DVB tua6100 driver");
 MODULE_AUTHOR("Andrew de Quincey");
--- a/drivers/media/dvb-frontends/ves1820.c
+++ b/drivers/media/dvb-frontends/ves1820.c
@@ -434,4 +434,4 @@ MODULE_DESCRIPTION("VLSI VES1820 DVB-C D
 MODULE_AUTHOR("Ralph Metzler, Holger Waechtler");
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(ves1820_attach);
+EXPORT_SYMBOL_GPL(ves1820_attach);
--- a/drivers/media/dvb-frontends/ves1x93.c
+++ b/drivers/media/dvb-frontends/ves1x93.c
@@ -540,4 +540,4 @@ MODULE_DESCRIPTION("VLSI VES1x93 DVB-S D
 MODULE_AUTHOR("Ralph Metzler");
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(ves1x93_attach);
+EXPORT_SYMBOL_GPL(ves1x93_attach);
--- a/drivers/media/dvb-frontends/zl10036.c
+++ b/drivers/media/dvb-frontends/zl10036.c
@@ -496,7 +496,7 @@ error:
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(zl10036_attach);
+EXPORT_SYMBOL_GPL(zl10036_attach);
 
 module_param_named(debug, zl10036_debug, int, 0644);
 MODULE_PARM_DESC(debug, "Turn on/off frontend debugging (default:off).");
--- a/drivers/media/dvb-frontends/zl10039.c
+++ b/drivers/media/dvb-frontends/zl10039.c
@@ -295,7 +295,7 @@ error:
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(zl10039_attach);
+EXPORT_SYMBOL_GPL(zl10039_attach);
 
 module_param(debug, int, 0644);
 MODULE_PARM_DESC(debug, "Turn on/off frontend debugging (default:off).");
--- a/drivers/media/dvb-frontends/zl10353.c
+++ b/drivers/media/dvb-frontends/zl10353.c
@@ -665,4 +665,4 @@ MODULE_DESCRIPTION("Zarlink ZL10353 DVB-
 MODULE_AUTHOR("Chris Pascoe");
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(zl10353_attach);
+EXPORT_SYMBOL_GPL(zl10353_attach);
--- a/drivers/media/pci/bt8xx/dst.c
+++ b/drivers/media/pci/bt8xx/dst.c
@@ -1722,7 +1722,7 @@ struct dst_state *dst_attach(struct dst_
 	return state;				/*	Manu (DST is a card not a frontend)	*/
 }
 
-EXPORT_SYMBOL(dst_attach);
+EXPORT_SYMBOL_GPL(dst_attach);
 
 static const struct dvb_frontend_ops dst_dvbt_ops = {
 	.delsys = { SYS_DVBT },
--- a/drivers/media/pci/bt8xx/dst_ca.c
+++ b/drivers/media/pci/bt8xx/dst_ca.c
@@ -668,7 +668,7 @@ struct dvb_device *dst_ca_attach(struct
 	return NULL;
 }
 
-EXPORT_SYMBOL(dst_ca_attach);
+EXPORT_SYMBOL_GPL(dst_ca_attach);
 
 MODULE_DESCRIPTION("DST DVB-S/T/C Combo CA driver");
 MODULE_AUTHOR("Manu Abraham");
--- a/drivers/media/pci/ddbridge/ddbridge-dummy-fe.c
+++ b/drivers/media/pci/ddbridge/ddbridge-dummy-fe.c
@@ -112,7 +112,7 @@ struct dvb_frontend *ddbridge_dummy_fe_q
 	state->frontend.demodulator_priv = state;
 	return &state->frontend;
 }
-EXPORT_SYMBOL(ddbridge_dummy_fe_qam_attach);
+EXPORT_SYMBOL_GPL(ddbridge_dummy_fe_qam_attach);
 
 static const struct dvb_frontend_ops ddbridge_dummy_fe_qam_ops = {
 	.delsys = { SYS_DVBC_ANNEX_A },
--- a/drivers/media/tuners/fc0011.c
+++ b/drivers/media/tuners/fc0011.c
@@ -499,7 +499,7 @@ struct dvb_frontend *fc0011_attach(struc
 
 	return fe;
 }
-EXPORT_SYMBOL(fc0011_attach);
+EXPORT_SYMBOL_GPL(fc0011_attach);
 
 MODULE_DESCRIPTION("Fitipower FC0011 silicon tuner driver");
 MODULE_AUTHOR("Michael Buesch <m@bues.ch>");
--- a/drivers/media/tuners/fc0012.c
+++ b/drivers/media/tuners/fc0012.c
@@ -495,7 +495,7 @@ err:
 
 	return fe;
 }
-EXPORT_SYMBOL(fc0012_attach);
+EXPORT_SYMBOL_GPL(fc0012_attach);
 
 MODULE_DESCRIPTION("Fitipower FC0012 silicon tuner driver");
 MODULE_AUTHOR("Hans-Frieder Vogt <hfvogt@gmx.net>");
--- a/drivers/media/tuners/fc0013.c
+++ b/drivers/media/tuners/fc0013.c
@@ -608,7 +608,7 @@ struct dvb_frontend *fc0013_attach(struc
 
 	return fe;
 }
-EXPORT_SYMBOL(fc0013_attach);
+EXPORT_SYMBOL_GPL(fc0013_attach);
 
 MODULE_DESCRIPTION("Fitipower FC0013 silicon tuner driver");
 MODULE_AUTHOR("Hans-Frieder Vogt <hfvogt@gmx.net>");
--- a/drivers/media/tuners/max2165.c
+++ b/drivers/media/tuners/max2165.c
@@ -410,7 +410,7 @@ struct dvb_frontend *max2165_attach(stru
 
 	return fe;
 }
-EXPORT_SYMBOL(max2165_attach);
+EXPORT_SYMBOL_GPL(max2165_attach);
 
 MODULE_AUTHOR("David T. L. Wong <davidtlwong@gmail.com>");
 MODULE_DESCRIPTION("Maxim MAX2165 silicon tuner driver");
--- a/drivers/media/tuners/mc44s803.c
+++ b/drivers/media/tuners/mc44s803.c
@@ -356,7 +356,7 @@ error:
 	kfree(priv);
 	return NULL;
 }
-EXPORT_SYMBOL(mc44s803_attach);
+EXPORT_SYMBOL_GPL(mc44s803_attach);
 
 MODULE_AUTHOR("Jochen Friedrich");
 MODULE_DESCRIPTION("Freescale MC44S803 silicon tuner driver");
--- a/drivers/media/tuners/mt2060.c
+++ b/drivers/media/tuners/mt2060.c
@@ -440,7 +440,7 @@ struct dvb_frontend * mt2060_attach(stru
 
 	return fe;
 }
-EXPORT_SYMBOL(mt2060_attach);
+EXPORT_SYMBOL_GPL(mt2060_attach);
 
 static int mt2060_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
--- a/drivers/media/tuners/mt2131.c
+++ b/drivers/media/tuners/mt2131.c
@@ -274,7 +274,7 @@ struct dvb_frontend * mt2131_attach(stru
 	fe->tuner_priv = priv;
 	return fe;
 }
-EXPORT_SYMBOL(mt2131_attach);
+EXPORT_SYMBOL_GPL(mt2131_attach);
 
 MODULE_AUTHOR("Steven Toth");
 MODULE_DESCRIPTION("Microtune MT2131 silicon tuner driver");
--- a/drivers/media/tuners/mt2266.c
+++ b/drivers/media/tuners/mt2266.c
@@ -336,7 +336,7 @@ struct dvb_frontend * mt2266_attach(stru
 	mt2266_calibrate(priv);
 	return fe;
 }
-EXPORT_SYMBOL(mt2266_attach);
+EXPORT_SYMBOL_GPL(mt2266_attach);
 
 MODULE_AUTHOR("Olivier DANET");
 MODULE_DESCRIPTION("Microtune MT2266 silicon tuner driver");
--- a/drivers/media/tuners/mxl5005s.c
+++ b/drivers/media/tuners/mxl5005s.c
@@ -4114,7 +4114,7 @@ struct dvb_frontend *mxl5005s_attach(str
 	fe->tuner_priv = state;
 	return fe;
 }
-EXPORT_SYMBOL(mxl5005s_attach);
+EXPORT_SYMBOL_GPL(mxl5005s_attach);
 
 MODULE_DESCRIPTION("MaxLinear MXL5005S silicon tuner driver");
 MODULE_AUTHOR("Steven Toth");
--- a/drivers/media/tuners/qt1010.c
+++ b/drivers/media/tuners/qt1010.c
@@ -440,7 +440,7 @@ struct dvb_frontend * qt1010_attach(stru
 	fe->tuner_priv = priv;
 	return fe;
 }
-EXPORT_SYMBOL(qt1010_attach);
+EXPORT_SYMBOL_GPL(qt1010_attach);
 
 MODULE_DESCRIPTION("Quantek QT1010 silicon tuner driver");
 MODULE_AUTHOR("Antti Palosaari <crope@iki.fi>");
--- a/drivers/media/tuners/tda18218.c
+++ b/drivers/media/tuners/tda18218.c
@@ -336,7 +336,7 @@ struct dvb_frontend *tda18218_attach(str
 
 	return fe;
 }
-EXPORT_SYMBOL(tda18218_attach);
+EXPORT_SYMBOL_GPL(tda18218_attach);
 
 MODULE_DESCRIPTION("NXP TDA18218HN silicon tuner driver");
 MODULE_AUTHOR("Antti Palosaari <crope@iki.fi>");
--- a/drivers/media/tuners/xc4000.c
+++ b/drivers/media/tuners/xc4000.c
@@ -1744,7 +1744,7 @@ fail2:
 	xc4000_release(fe);
 	return NULL;
 }
-EXPORT_SYMBOL(xc4000_attach);
+EXPORT_SYMBOL_GPL(xc4000_attach);
 
 MODULE_AUTHOR("Steven Toth, Davide Ferri");
 MODULE_DESCRIPTION("Xceive xc4000 silicon tuner driver");
--- a/drivers/media/tuners/xc5000.c
+++ b/drivers/media/tuners/xc5000.c
@@ -1460,7 +1460,7 @@ fail:
 	xc5000_release(fe);
 	return NULL;
 }
-EXPORT_SYMBOL(xc5000_attach);
+EXPORT_SYMBOL_GPL(xc5000_attach);
 
 MODULE_AUTHOR("Steven Toth");
 MODULE_DESCRIPTION("Xceive xc5000 silicon tuner driver");


