Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8BA0AAA6F
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 19:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391101AbfIER5a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 13:57:30 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:42422 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729101AbfIER5a (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 13:57:30 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1i5w0d-0002mD-80; Thu, 05 Sep 2019 17:57:27 +0000
From:   Colin King <colin.king@canonical.com>
To:     Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][V2] media: cxd2820r: make arrays tab static const, makes object smaller
Date:   Thu,  5 Sep 2019 18:57:26 +0100
Message-Id: <20190905175726.11805-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array tab on the stack but instead make it
static const. Makes the object size smaller by 170 bytes in total.

Before:
   text    data     bss     dec     hex filename
   7045    1736       0    8781    224d media/dvb-frontends/cxd2820r_c.o
   8800	   2216	      0	  11016	   2b08	media/dvb-frontends/cxd2820r_t.o
   8981	   2120	      0	  11101	   2b5d	media/dvb-frontends/cxd2820r_t2.o

After:
   text    data     bss     dec     hex filename
   6896    1832       0    8728    2218 media/dvb-frontends/cxd2820r_c.o
   8651	   2312	      0	  10963	   2ad3	media/dvb-frontends/cxd2820r_t.o
   8853	   2184	      0	  11037	   2b1d	media/dvb-frontends/cxd2820r_t2.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: also make same change to cxd2820r_t.c and cxd2820r_t2.c

---
 drivers/media/dvb-frontends/cxd2820r_c.c  | 2 +-
 drivers/media/dvb-frontends/cxd2820r_t.c  | 2 +-
 drivers/media/dvb-frontends/cxd2820r_t2.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb-frontends/cxd2820r_c.c b/drivers/media/dvb-frontends/cxd2820r_c.c
index 6f7eedb4c00e..0ba382948c51 100644
--- a/drivers/media/dvb-frontends/cxd2820r_c.c
+++ b/drivers/media/dvb-frontends/cxd2820r_c.c
@@ -298,7 +298,7 @@ int cxd2820r_sleep_c(struct dvb_frontend *fe)
 	struct cxd2820r_priv *priv = fe->demodulator_priv;
 	struct i2c_client *client = priv->client[0];
 	int ret;
-	struct reg_val_mask tab[] = {
+	static const struct reg_val_mask tab[] = {
 		{ 0x000ff, 0x1f, 0xff },
 		{ 0x00085, 0x00, 0xff },
 		{ 0x00088, 0x01, 0xff },
diff --git a/drivers/media/dvb-frontends/cxd2820r_t.c b/drivers/media/dvb-frontends/cxd2820r_t.c
index d56c6f788196..fbdfa6bf38dc 100644
--- a/drivers/media/dvb-frontends/cxd2820r_t.c
+++ b/drivers/media/dvb-frontends/cxd2820r_t.c
@@ -392,7 +392,7 @@ int cxd2820r_sleep_t(struct dvb_frontend *fe)
 	struct cxd2820r_priv *priv = fe->demodulator_priv;
 	struct i2c_client *client = priv->client[0];
 	int ret;
-	struct reg_val_mask tab[] = {
+	static struct reg_val_mask tab[] = {
 		{ 0x000ff, 0x1f, 0xff },
 		{ 0x00085, 0x00, 0xff },
 		{ 0x00088, 0x01, 0xff },
diff --git a/drivers/media/dvb-frontends/cxd2820r_t2.c b/drivers/media/dvb-frontends/cxd2820r_t2.c
index f924a80b968a..34ef2bb2de34 100644
--- a/drivers/media/dvb-frontends/cxd2820r_t2.c
+++ b/drivers/media/dvb-frontends/cxd2820r_t2.c
@@ -386,7 +386,7 @@ int cxd2820r_sleep_t2(struct dvb_frontend *fe)
 	struct cxd2820r_priv *priv = fe->demodulator_priv;
 	struct i2c_client *client = priv->client[0];
 	int ret;
-	struct reg_val_mask tab[] = {
+	static const struct reg_val_mask tab[] = {
 		{ 0x000ff, 0x1f, 0xff },
 		{ 0x00085, 0x00, 0xff },
 		{ 0x00088, 0x01, 0xff },
-- 
2.20.1

