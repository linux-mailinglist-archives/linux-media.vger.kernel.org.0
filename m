Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA193423F2
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 13:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408959AbfFLLZP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 07:25:15 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:53158 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406101AbfFLLZP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 07:25:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=BUi1t7YRmAixbRwRjqsMqD3iniMSUAyJOwWKf84JW1w=; b=px2Q8wWPFHBHWITcipeaKID/NN
        4a43C0swHjzm3uhvc0S3ur82oFBD9NVSoldQtLaP4Yum9TzLA2GA2pY5K4W6DOcpPwQBs53vvus8b
        MZIhd5RhAdcbw3CDiYuSyjKu4ruItmDClEc7SmcNPd18CO9URVwmCsvjnBzPHZVYv/twpEeWAhiAn
        zOfKSYAkPFRtQDm+dMXFtyoKU9q4rKuWgF7DX3EIoRLrCRMizEFf1EI8IDdEfOsaePimyPPnG1ywN
        QpLg3Vjgk3MeDh7mUPHHEXrQ6dzYa+onjUvF8wtjgmZS+P8nX/WT++4ZnaX5Pb2mTfdZTppJkOTW1
        mckely1w==;
Received: from 177.41.119.178.dynamic.adsl.gvt.net.br ([177.41.119.178] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hb1NS-000769-6J; Wed, 12 Jun 2019 11:25:14 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hb1NO-0005nn-Bb; Wed, 12 Jun 2019 08:25:10 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ruslan Babayev <ruslan@babayev.com>,
        Andrew de Quincey <adq_dvb@lidskialf.net>,
        Michael Buesch <m@bues.ch>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] media: tua6100: Remove some ugly defines
Date:   Wed, 12 Jun 2019 08:25:03 -0300
Message-Id: <fa93fecaa9d8e33f7d3b335872e9082893b775ae.1560338665.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190612081929.GA1687@kunai>
References: <20190612081929.GA1687@kunai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As reported by Stephen:

> After merging the i2c tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
>
> drivers/media/dvb-frontends/tua6100.c: In function 'tua6100_set_params':
> drivers/media/dvb-frontends/tua6100.c:71: warning: "_P" redefined
>  #define _P 32
>
> In file included from include/acpi/platform/aclinux.h:54,
>                  from include/acpi/platform/acenv.h:152,
>                  from include/acpi/acpi.h:22,
>                  from include/linux/acpi.h:21,
>                  from include/linux/i2c.h:17,
>                  from drivers/media/dvb-frontends/tua6100.h:22,
>                  from drivers/media/dvb-frontends/tua6100.c:24:
> include/linux/ctype.h:14: note: this is the location of the previous definition
>  #define _P 0x10 /* punct */
>
> Exposed by commit
>
>   5213d7efc8ec ("i2c: acpi: export i2c_acpi_find_adapter_by_handle")
>
> Since that included <linux/acpi.h> from <linux/i2c.h>
>
> Originally introduced by commit
>
>   00be2e7c6415 ("V4L/DVB (4606): Add driver for TUA6100")
>
> The _P in <linux/ctype.h> has existed since before git.

The addition of include <linux/ctype.h> at the I2C code caused a
breakage at the tua6100 driver. The reason is that the code there
used defines for 3 parameters used at the calculus for the
divide ratio.

In thesis, those are board-dependent, but, as there's just one
driver using it (ttpci/budget-av), there was no need to make
the code more generic. While it sounds unlikely that this old
DVB-S frontend would ever be used on new projects, one might
some day come with a variant using a different configuration. So,
let's do the right thing and store those values at its private
struct.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 drivers/media/dvb-frontends/tua6100.c | 38 ++++++++++++++++-----------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/drivers/media/dvb-frontends/tua6100.c b/drivers/media/dvb-frontends/tua6100.c
index b233b7be0b84..2990eb3fd475 100644
--- a/drivers/media/dvb-frontends/tua6100.c
+++ b/drivers/media/dvb-frontends/tua6100.c
@@ -31,11 +31,24 @@
 
 #include "tua6100.h"
 
+/**
+ * struct tua6100_priv - tuner's private data
+ *
+ * @i2c_address:	I2C address
+ * @i2c:		pointer to struct i2c_adapter
+ * @frequency:		tuned frequency
+ * @prescaler_div:	divide ratio of the prescaler (32 or 64)
+ * @ref_div:		reference frequency divider
+ * @ref_inp:		reference frequency input (XTAL osc)
+ */
 struct tua6100_priv {
 	/* i2c details */
 	int i2c_address;
 	struct i2c_adapter *i2c;
 	u32 frequency;
+	int prescaler_div;
+	int ref_div;
+	u32 ref_inp;
 };
 
 static void tua6100_release(struct dvb_frontend *fe)
@@ -75,10 +88,6 @@ static int tua6100_set_params(struct dvb_frontend *fe)
 	struct i2c_msg msg1 = { .addr = priv->i2c_address, .flags = 0, .buf = reg1, .len = 4 };
 	struct i2c_msg msg2 = { .addr = priv->i2c_address, .flags = 0, .buf = reg2, .len = 3 };
 
-#define _R 4
-#define _P 32
-#define _ri 4000000
-
 	// setup register 0
 	if (c->frequency < 2000000)
 		reg0[1] = 0x03;
@@ -91,14 +100,14 @@ static int tua6100_set_params(struct dvb_frontend *fe)
 	else
 		reg1[1] = 0x0c;
 
-	if (_P == 64)
+	if (priv->prescaler_div == 64)
 		reg1[1] |= 0x40;
 	if (c->frequency >= 1525000)
 		reg1[1] |= 0x80;
 
 	// register 2
-	reg2[1] = (_R >> 8) & 0x03;
-	reg2[2] = _R;
+	reg2[1] = (priv->ref_div >> 8) & 0x03;
+	reg2[2] = priv->ref_div;
 	if (c->frequency < 1455000)
 		reg2[1] |= 0x1c;
 	else if (c->frequency < 1630000)
@@ -110,19 +119,15 @@ static int tua6100_set_params(struct dvb_frontend *fe)
 	 * The N divisor ratio (note: c->frequency is in kHz, but we
 	 * need it in Hz)
 	 */
-	prediv = (c->frequency * _R) / (_ri / 1000);
-	div = prediv / _P;
+	prediv = (c->frequency * priv->ref_div) / (priv->ref_inp / 1000);
+	div = prediv / priv->prescaler_div;
 	reg1[1] |= (div >> 9) & 0x03;
 	reg1[2] = div >> 1;
 	reg1[3] = (div << 7);
-	priv->frequency = ((div * _P) * (_ri / 1000)) / _R;
+	priv->frequency = ((div * priv->prescaler_div) * (priv->ref_inp / 1000)) / priv->ref_div;
 
 	// Finally, calculate and store the value for A
-	reg1[3] |= (prediv - (div*_P)) & 0x7f;
-
-#undef _R
-#undef _P
-#undef _ri
+	reg1[3] |= (prediv - (div * priv->prescaler_div)) & 0x7f;
 
 	if (fe->ops.i2c_gate_ctrl)
 		fe->ops.i2c_gate_ctrl(fe, 1);
@@ -189,6 +194,9 @@ struct dvb_frontend *tua6100_attach(struct dvb_frontend *fe, int addr, struct i2
 
 	priv->i2c_address = addr;
 	priv->i2c = i2c;
+	priv->ref_div = 4;
+	priv->prescaler_div = 32;
+	priv->ref_inp = 4000000;
 
 	memcpy(&fe->ops.tuner_ops, &tua6100_tuner_ops, sizeof(struct dvb_tuner_ops));
 	fe->tuner_priv = priv;
-- 
2.21.0

