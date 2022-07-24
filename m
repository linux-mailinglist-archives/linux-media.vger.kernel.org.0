Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEA7257F3BE
	for <lists+linux-media@lfdr.de>; Sun, 24 Jul 2022 09:33:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239302AbiGXHdW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Jul 2022 03:33:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232801AbiGXHdU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Jul 2022 03:33:20 -0400
Received: from smtpbg.qq.com (unknown [43.155.67.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED4C0193C0;
        Sun, 24 Jul 2022 00:33:15 -0700 (PDT)
X-QQ-mid: bizesmtp71t1658647970tc644ufg
Received: from localhost.localdomain ( [125.70.163.183])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Sun, 24 Jul 2022 15:32:48 +0800 (CST)
X-QQ-SSF: 01000000002000007000B00A0000000
X-QQ-FEAT: swyrzWPvyR1iK/HX5m2maRBLZdkb+w70HNFem7RoRO0VC4GmU8x764sMwt1C/
        ppKaJasH8dK8YgdjSX21mSx7hl/FSBMkWjKtgK248/sbNc9MOA0FBJFifvYkdWa2c5YhhTy
        JcgL4Nk7quo3icbcxucHkjbboYFJIhZLcfeVQhC5AwMS0iknUa9WhFYKc7dyUkFdTg04sBe
        KM8ZDHr0Cq0lA/Dl3vwHZqTU1oiryR3hYdD9mDDXAQsu0Wy/faEuvNgoRpsFzvDKemzrsqd
        YHkUit2XjdsvXedw4XdoNTl9jJxI5OYuryyz18ECz25zPxC4V9gVBosc/JobVnFDLYctIRt
        BToHttBRFIXBRlaJWZSRb4aJ77yfMsvhjZ9IubHTvuF6CgOuUo=
X-QQ-GoodBg: 0
From:   wangjianli <wangjianli@cdjrlc.com>
To:     crope@iki.fi, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, inux-kernel@vger.kernel.org,
        wangjianli <wangjianli@cdjrlc.com>
Subject: [PATCH] media/dvb-frontends: fix repeated words in comments
Date:   Sun, 24 Jul 2022 15:32:42 +0800
Message-Id: <20220724073242.15279-1-wangjianli@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr7
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE,SPF_PASS,
        T_SPF_HELO_TEMPERROR autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

 Delete the redundant word 'in'.

Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
---
 drivers/media/dvb-frontends/cxd2820r_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/cxd2820r_core.c b/drivers/media/dvb-frontends/cxd2820r_core.c
index b1618339eec0..20e6b197dbe7 100644
--- a/drivers/media/dvb-frontends/cxd2820r_core.c
+++ b/drivers/media/dvb-frontends/cxd2820r_core.c
@@ -629,7 +629,7 @@ static int cxd2820r_probe(struct i2c_client *client,
 
 	/*
 	 * Chip has two I2C addresses for different register banks. We register
-	 * one dummy I2C client in in order to get own I2C client for each
+	 * one dummy I2C client in order to get own I2C client for each
 	 * register bank.
 	 */
 	priv->client[1] = i2c_new_dummy_device(client->adapter, client->addr | (1 << 1));
-- 
2.36.1

