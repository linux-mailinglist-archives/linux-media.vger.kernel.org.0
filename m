Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BF1459E7DD
	for <lists+linux-media@lfdr.de>; Tue, 23 Aug 2022 18:51:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241374AbiHWQuU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Aug 2022 12:50:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343635AbiHWQtx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Aug 2022 12:49:53 -0400
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 844CEB2848
        for <linux-media@vger.kernel.org>; Tue, 23 Aug 2022 06:17:40 -0700 (PDT)
Received: from mgb4.digiteq.red (unknown [62.77.71.229])
        by mx.gpxsee.org (Postfix) with ESMTPSA id 1C3C531122;
        Tue, 23 Aug 2022 15:17:38 +0200 (CEST)
From:   martin.tuma@digiteqautomotive.com
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH 1/3] Added platform module alias for the xiic I2C driver
Date:   Tue, 23 Aug 2022 17:18:03 +0200
Message-Id: <20220823151805.1313-2-martin.tuma@digiteqautomotive.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220823151805.1313-1-martin.tuma@digiteqautomotive.com>
References: <20220823151805.1313-1-martin.tuma@digiteqautomotive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 drivers/i2c/busses/i2c-xiic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index b3fe6b2aa3ca..277a02455cdd 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -920,6 +920,7 @@ static struct platform_driver xiic_i2c_driver = {
 
 module_platform_driver(xiic_i2c_driver);
 
+MODULE_ALIAS("platform:" DRIVER_NAME);
 MODULE_AUTHOR("info@mocean-labs.com");
 MODULE_DESCRIPTION("Xilinx I2C bus driver");
 MODULE_LICENSE("GPL v2");
-- 
2.37.2

