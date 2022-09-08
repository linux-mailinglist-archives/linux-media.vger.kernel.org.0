Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C12105B1D08
	for <lists+linux-media@lfdr.de>; Thu,  8 Sep 2022 14:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231841AbiIHMbz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Sep 2022 08:31:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231273AbiIHMby (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Sep 2022 08:31:54 -0400
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2649F11C153;
        Thu,  8 Sep 2022 05:31:50 -0700 (PDT)
X-QQ-mid: bizesmtp81t1662640286tmzdpusk
Received: from localhost.localdomain ( [182.148.14.0])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Thu, 08 Sep 2022 20:31:25 +0800 (CST)
X-QQ-SSF: 0100000000200090C000B00A0000000
X-QQ-FEAT: +Fw3Sd5mYDVlx+ksV8IMGjrZ/aENIQf6kU4EawKVS+f87DHDkXX30B0nre6/0
        YO0gmJDgmj/KbFaa8J0OuLgHLv2nn8g0SWFbvgwMTc0NIISISOzwid27NYU+Dc8UA71hXXc
        WWE6Qbms5zkqc9QRKuYMCSCn+lEjslHdIVbCy77o7/JuVShc+4+EzhsTzHequjF1IOXoxpR
        L4j4aAJ5SbFvuwFPh4jzffw2UFX0UxsaMBLa+W/t8tFfA4GIs7vl4CMVdNgrC7qyj8vgOeo
        ZBF/dZLJQAXh6hWq3m2CHje2eszcMVwaptP0XvEgiOoVAdLUfNBKiPFCfhF/+sXRFyGifNj
        tJ4biqSKzaf1/vqtX939cJZl7+4G+Go9yBYGrluP/kfbrMjC/k=
X-QQ-GoodBg: 0
From:   wangjianli <wangjianli@cdjrlc.com>
To:     crope@iki.fi, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, inux-kernel@vger.kernel.org,
        wangjianli <wangjianli@cdjrlc.com>
Subject: [PATCH] media/dvb-frontends: fix repeated words in comments
Date:   Thu,  8 Sep 2022 20:31:18 +0800
Message-Id: <20220908123118.15951-1-wangjianli@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr7
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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
index 5d98222f9df0..e329e15df9fd 100644
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

