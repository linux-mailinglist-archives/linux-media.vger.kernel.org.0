Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EC12AAA4D
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 19:45:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731199AbfIERpQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 13:45:16 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:42035 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729101AbfIERpQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 13:45:16 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1i5von-0001jx-4Z; Thu, 05 Sep 2019 17:45:13 +0000
From:   Colin King <colin.king@canonical.com>
To:     Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: cxd2820r: make array tab static const, makes object smaller
Date:   Thu,  5 Sep 2019 18:45:12 +0100
Message-Id: <20190905174512.8126-1-colin.king@canonical.com>
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
static const. Makes the object code smaller by 53 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
   7045	   1736	      0	   8781	   224d	media/dvb-frontends/cxd2820r_c.o

After:
   text	   data	    bss	    dec	    hex	filename
   6896	   1832	      0	   8728	   2218	media/dvb-frontends/cxd2820r_c.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/dvb-frontends/cxd2820r_c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.20.1

