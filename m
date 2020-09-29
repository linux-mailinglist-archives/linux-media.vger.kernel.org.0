Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D19327D03C
	for <lists+linux-media@lfdr.de>; Tue, 29 Sep 2020 15:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731362AbgI2N6k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Sep 2020 09:58:40 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:47110 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731132AbgI2N6M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Sep 2020 09:58:12 -0400
X-IronPort-AV: E=Sophos;i="5.77,318,1596492000"; 
   d="scan'208";a="470079962"
Received: from palace.lip6.fr ([132.227.105.202])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/AES256-SHA256; 29 Sep 2020 15:57:41 +0200
From:   Julia Lawall <Julia.Lawall@inria.fr>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
        Joe Perches <joe@perches.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 16/20] media: dvbsky: use semicolons rather than commas to separate statements
Date:   Tue, 29 Sep 2020 15:14:39 +0200
Message-Id: <1601385283-26144-17-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1601385283-26144-1-git-send-email-Julia.Lawall@inria.fr>
References: <1601385283-26144-1-git-send-email-Julia.Lawall@inria.fr>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace commas with semicolons.  Commas introduce unnecessary
variability in the code structure and are hard to see.  What is done
is essentially described by the following Coccinelle semantic patch
(http://coccinelle.lip6.fr/):

// <smpl>
@@ expression e1,e2; @@
e1
-,
+;
e2
... when any
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/media/usb/dvb-usb-v2/dvbsky.c |   22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/dvbsky.c b/drivers/media/usb/dvb-usb-v2/dvbsky.c
index 0d9657f7f29d..689829f1b52a 100644
--- a/drivers/media/usb/dvb-usb-v2/dvbsky.c
+++ b/drivers/media/usb/dvb-usb-v2/dvbsky.c
@@ -287,8 +287,8 @@ static int dvbsky_s960_attach(struct dvb_usb_adapter *adap)
 	m88ds3103_pdata.ts_clk = 16000;
 	m88ds3103_pdata.ts_clk_pol = 0;
 	m88ds3103_pdata.agc = 0x99;
-	m88ds3103_pdata.lnb_hv_pol = 1,
-	m88ds3103_pdata.lnb_en_pol = 1,
+	m88ds3103_pdata.lnb_hv_pol = 1;
+	m88ds3103_pdata.lnb_en_pol = 1;
 
 	state->i2c_client_demod = dvb_module_probe("m88ds3103", NULL,
 						   &d->i2c_adap,
@@ -383,15 +383,15 @@ static int dvbsky_s960c_attach(struct dvb_usb_adapter *adap)
 	struct sp2_config sp2_config = {};
 
 	/* attach demod */
-	m88ds3103_pdata.clk = 27000000,
-	m88ds3103_pdata.i2c_wr_max = 33,
-	m88ds3103_pdata.clk_out = 0,
-	m88ds3103_pdata.ts_mode = M88DS3103_TS_CI,
-	m88ds3103_pdata.ts_clk = 10000,
-	m88ds3103_pdata.ts_clk_pol = 1,
-	m88ds3103_pdata.agc = 0x99,
-	m88ds3103_pdata.lnb_hv_pol = 0,
-	m88ds3103_pdata.lnb_en_pol = 1,
+	m88ds3103_pdata.clk = 27000000;
+	m88ds3103_pdata.i2c_wr_max = 33;
+	m88ds3103_pdata.clk_out = 0;
+	m88ds3103_pdata.ts_mode = M88DS3103_TS_CI;
+	m88ds3103_pdata.ts_clk = 10000;
+	m88ds3103_pdata.ts_clk_pol = 1;
+	m88ds3103_pdata.agc = 0x99;
+	m88ds3103_pdata.lnb_hv_pol = 0;
+	m88ds3103_pdata.lnb_en_pol = 1;
 
 	state->i2c_client_demod = dvb_module_probe("m88ds3103", NULL,
 						   &d->i2c_adap,

