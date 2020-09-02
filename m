Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FFA425B0CB
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 18:11:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728313AbgIBQLB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 12:11:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:53920 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728164AbgIBQKw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Sep 2020 12:10:52 -0400
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DA1312137B;
        Wed,  2 Sep 2020 16:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599063046;
        bh=yHxkHJXmHHTyvyIwik9o+Zn+nYcXFp6fggzlMJQEB0w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=2alxKTRfIVmUUpPCedtGlFXhuDyxf1uwEBLlY7gwRwZx4sF0APleIQv6D5VLfX/zK
         pTG8GW4JxZPNBkUDj2PmZse9xJklp/hvnjECggpAcCjAnSEsP1tgNZx+NXZ1LAh/FB
         OBO39kdozwMgLnQEynMss6S/y14oBGm2PHeD7qTc=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kDVLP-000t9n-N0; Wed, 02 Sep 2020 18:10:43 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Antti Palosaari <crope@iki.fi>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 03/38] media: qt1010: fix usage of unititialized value
Date:   Wed,  2 Sep 2020 18:10:06 +0200
Message-Id: <b14f07b9c89456001f4d9c1ce7a66d5ebea40fdf.1599062230.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599062230.git.mchehab+huawei@kernel.org>
References: <cover.1599062230.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As pointed by smatch:

	drivers/media/tuners/qt1010.c:239 qt1010_init_meas1() error: uninitialized symbol 'val2'.
	drivers/media/tuners/qt1010.c:273 qt1010_init_meas2() error: uninitialized symbol 'val'.

The logic is ok, but it is hard for static analyzers
to parse it, as it depends on a value read in the middle
of a loop.

Also, it takes a while for humans to verify.

Re-write the first function to use a more direct way.

At the second one, I opted to just initialize the read var,
in order to shut up the report.

While here, address a few coding style issues at the
function code.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/tuners/qt1010.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/media/tuners/qt1010.c b/drivers/media/tuners/qt1010.c
index e48faf942830..3853a3d43d4f 100644
--- a/drivers/media/tuners/qt1010.c
+++ b/drivers/media/tuners/qt1010.c
@@ -222,23 +222,24 @@ static int qt1010_init_meas1(struct qt1010_priv *priv,
 		{ QT1010_WR, reg, reg_init_val },
 		{ QT1010_WR, 0x1e, 0x00 },
 		{ QT1010_WR, 0x1e, oper },
-		{ QT1010_RD, reg, 0xff }
 	};
 
 	for (i = 0; i < ARRAY_SIZE(i2c_data); i++) {
-		if (i2c_data[i].oper == QT1010_WR) {
-			err = qt1010_writereg(priv, i2c_data[i].reg,
-					      i2c_data[i].val);
-		} else {
-			err = qt1010_readreg(priv, i2c_data[i].reg, &val2);
-		}
-		if (err) return err;
+		err = qt1010_writereg(priv, i2c_data[i].reg,
+				      i2c_data[i].val);
+		if (err)
+			return err;
 	}
 
+	err = qt1010_readreg(priv, reg, &val2);
+	if (err)
+		return err;
 	do {
 		val1 = val2;
 		err = qt1010_readreg(priv, reg, &val2);
-		if (err) return err;
+		if (err)
+			return err;
+
 		dev_dbg(&priv->i2c->dev, "%s: compare reg:%02x %02x %02x\n",
 				__func__, reg, val1, val2);
 	} while (val1 != val2);
@@ -250,7 +251,7 @@ static int qt1010_init_meas1(struct qt1010_priv *priv,
 static int qt1010_init_meas2(struct qt1010_priv *priv,
 			    u8 reg_init_val, u8 *retval)
 {
-	u8 i, val;
+	u8 i, val = 0xff;
 	int err;
 	qt1010_i2c_oper_t i2c_data[] = {
 		{ QT1010_WR, 0x07, reg_init_val },
@@ -261,6 +262,7 @@ static int qt1010_init_meas2(struct qt1010_priv *priv,
 		{ QT1010_WR, 0x1e, 0x00 },
 		{ QT1010_WR, 0x22, 0xff }
 	};
+
 	for (i = 0; i < ARRAY_SIZE(i2c_data); i++) {
 		if (i2c_data[i].oper == QT1010_WR) {
 			err = qt1010_writereg(priv, i2c_data[i].reg,
@@ -268,7 +270,8 @@ static int qt1010_init_meas2(struct qt1010_priv *priv,
 		} else {
 			err = qt1010_readreg(priv, i2c_data[i].reg, &val);
 		}
-		if (err) return err;
+		if (err)
+			return err;
 	}
 	*retval = val;
 	return 0;
-- 
2.26.2

