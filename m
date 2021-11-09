Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0B3D44AE2A
	for <lists+linux-media@lfdr.de>; Tue,  9 Nov 2021 13:55:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232398AbhKIM6Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Nov 2021 07:58:25 -0500
Received: from mx24.baidu.com ([111.206.215.185]:32870 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242254AbhKIM6Q (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Nov 2021 07:58:16 -0500
Received: from BC-Mail-Ex23.internal.baidu.com (unknown [172.31.51.17])
        by Forcepoint Email with ESMTPS id 16AADFF6BC15FB226B13;
        Tue,  9 Nov 2021 20:55:27 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex23.internal.baidu.com (172.31.51.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Tue, 9 Nov 2021 20:55:26 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Tue, 9 Nov 2021 20:55:26 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: rc: ir-hix5hd2: Add the dependency on HAS_IOMEM
Date:   Tue, 9 Nov 2021 20:55:20 +0800
Message-ID: <20211109125521.269-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-EX07.internal.baidu.com (172.31.51.47) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The helper function devm_platform_ioremap_resource()
needs HAS_IOMEM enabled, so add the dependency on HAS_IOMEM.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/media/rc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/Kconfig b/drivers/media/rc/Kconfig
index 9506baf3c4c1..c111af820ae4 100644
--- a/drivers/media/rc/Kconfig
+++ b/drivers/media/rc/Kconfig
@@ -175,7 +175,7 @@ config IR_ENE
 
 config IR_HIX5HD2
 	tristate "Hisilicon hix5hd2 IR remote control"
-	depends on OF || COMPILE_TEST
+	depends on (OF && HAS_IOMEM) || COMPILE_TEST
 	help
 	   Say Y here if you want to use hisilicon hix5hd2 remote control.
 	   To compile this driver as a module, choose M here: the module will be
-- 
2.25.1

