Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B1FF27D055
	for <lists+linux-media@lfdr.de>; Tue, 29 Sep 2020 15:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730884AbgI2N5v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Sep 2020 09:57:51 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:47096 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729807AbgI2N5u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Sep 2020 09:57:50 -0400
X-IronPort-AV: E=Sophos;i="5.77,318,1596492000"; 
   d="scan'208";a="470079949"
Received: from palace.lip6.fr ([132.227.105.202])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/AES256-SHA256; 29 Sep 2020 15:57:40 +0200
From:   Julia Lawall <Julia.Lawall@inria.fr>
To:     Antti Palosaari <crope@iki.fi>
Cc:     =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
        Joe Perches <joe@perches.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        kernel-janitors@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 03/20] media: rtl28xxu: use semicolons rather than commas to separate statements
Date:   Tue, 29 Sep 2020 15:14:26 +0200
Message-Id: <1601385283-26144-4-git-send-email-Julia.Lawall@inria.fr>
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
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
index 91460e4d0c30..3952cc534b4a 100644
--- a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
+++ b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
@@ -955,7 +955,7 @@ static int rtl2832u_frontend_attach(struct dvb_usb_adapter *adap)
 			struct mn88472_config mn88472_config = {};
 
 			mn88472_config.fe = &adap->fe[1];
-			mn88472_config.i2c_wr_max = 22,
+			mn88472_config.i2c_wr_max = 22;
 			strscpy(info.type, "mn88472", I2C_NAME_SIZE);
 			mn88472_config.xtal = 20500000;
 			mn88472_config.ts_mode = SERIAL_TS_MODE;
@@ -980,7 +980,7 @@ static int rtl2832u_frontend_attach(struct dvb_usb_adapter *adap)
 			struct mn88473_config mn88473_config = {};
 
 			mn88473_config.fe = &adap->fe[1];
-			mn88473_config.i2c_wr_max = 22,
+			mn88473_config.i2c_wr_max = 22;
 			strscpy(info.type, "mn88473", I2C_NAME_SIZE);
 			info.addr = 0x18;
 			info.platform_data = &mn88473_config;

