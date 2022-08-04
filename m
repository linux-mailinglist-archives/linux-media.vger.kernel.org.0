Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDBDC589866
	for <lists+linux-media@lfdr.de>; Thu,  4 Aug 2022 09:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238976AbiHDHal (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Aug 2022 03:30:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233676AbiHDHai (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Aug 2022 03:30:38 -0400
X-Greylist: delayed 932 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 04 Aug 2022 00:30:35 PDT
Received: from baidu.com (mx21.baidu.com [220.181.3.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B8F031CFFE
        for <linux-media@vger.kernel.org>; Thu,  4 Aug 2022 00:30:35 -0700 (PDT)
Received: from BC-Mail-Ex12.internal.baidu.com (unknown [172.31.51.52])
        by Forcepoint Email with ESMTPS id A27095D7B2DF4A6C3D1C;
        Thu,  4 Aug 2022 15:14:59 +0800 (CST)
Received: from bjkjy-mail-ex28.internal.baidu.com (172.31.50.44) by
 BC-Mail-Ex12.internal.baidu.com (172.31.51.52) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.20; Thu, 4 Aug 2022 15:15:02 +0800
Received: from ThinkStation-P340.baidu.com (172.31.63.8) by
 bjkjy-mail-ex28.internal.baidu.com (172.31.50.44) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.18; Thu, 4 Aug 2022 15:15:01 +0800
From:   Chen Shi <shichen01@baidu.com>
To:     <slongerbeam@gmail.com>, <p.zabel@pengutronix.de>
CC:     <linux-media@vger.kernel.org>, <linux-staging@lists.linux.dev>,
        Chen Shi <shichen01@baidu.com>
Subject: [PATCH] media: staging: media: imx: imx7-media-utils: Fix a coding style problem
Date:   Thu, 4 Aug 2022 15:10:46 +0800
Message-ID: <20220804071046.31520-1-shichen01@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex28.internal.baidu.com (172.31.51.22) To
 bjkjy-mail-ex28.internal.baidu.com (172.31.50.44)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add parentheses to enclose macros with complex values.

Signed-off-by: Chen Shi <shichen01@baidu.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 294c808b2ebe..c94013175181 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -7,7 +7,7 @@
 #include <linux/module.h>
 #include "imx-media.h"
 
-#define IMX_BUS_FMTS(fmt...) (const u32[]) {fmt, 0}
+#define IMX_BUS_FMTS(fmt...) {(const u32[]) {fmt, 0}}
 
 /*
  * List of supported pixel formats for the subdevs.
-- 
2.17.1

