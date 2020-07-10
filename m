Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3BBA21B1E9
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2020 11:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726896AbgGJJC1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jul 2020 05:02:27 -0400
Received: from mail.ispras.ru ([83.149.199.84]:54682 "EHLO mail.ispras.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726664AbgGJJC0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jul 2020 05:02:26 -0400
Received: from hellwig.intra.ispras.ru (unknown [10.10.2.182])
        by mail.ispras.ru (Postfix) with ESMTPS id 7B0AE40AAD77;
        Fri, 10 Jul 2020 09:02:24 +0000 (UTC)
From:   Evgeny Novikov <novikov@ispras.ru>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Evgeny Novikov <novikov@ispras.ru>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        ldv-project@linuxtesting.org
Subject: [PATCH] media: vpss: clean up resources in init
Date:   Fri, 10 Jul 2020 12:02:23 +0300
Message-Id: <20200710090223.26562-1-novikov@ispras.ru>
X-Mailer: git-send-email 2.16.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If platform_driver_register() fails within vpss_init() resources are not
cleaned up. The patch fixes this issue by introducing the corresponding
error handling.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
---
 drivers/media/platform/davinci/vpss.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/davinci/vpss.c b/drivers/media/platform/davinci/vpss.c
index d38d2bbb6f0f..7000f0bf0b35 100644
--- a/drivers/media/platform/davinci/vpss.c
+++ b/drivers/media/platform/davinci/vpss.c
@@ -505,19 +505,31 @@ static void vpss_exit(void)
 
 static int __init vpss_init(void)
 {
+	int ret;
+
 	if (!request_mem_region(VPSS_CLK_CTRL, 4, "vpss_clock_control"))
 		return -EBUSY;
 
 	oper_cfg.vpss_regs_base2 = ioremap(VPSS_CLK_CTRL, 4);
 	if (unlikely(!oper_cfg.vpss_regs_base2)) {
-		release_mem_region(VPSS_CLK_CTRL, 4);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err_ioremap;
 	}
 
 	writel(VPSS_CLK_CTRL_VENCCLKEN |
-		     VPSS_CLK_CTRL_DACCLKEN, oper_cfg.vpss_regs_base2);
+	       VPSS_CLK_CTRL_DACCLKEN, oper_cfg.vpss_regs_base2);
+
+	ret = platform_driver_register(&vpss_driver);
+	if (ret)
+		goto err_pd_register;
+
+	return 0;
 
-	return platform_driver_register(&vpss_driver);
+err_pd_register:
+	iounmap(oper_cfg.vpss_regs_base2);
+err_ioremap:
+	release_mem_region(VPSS_CLK_CTRL, 4);
+	return ret;
 }
 subsys_initcall(vpss_init);
 module_exit(vpss_exit);
-- 
2.16.4

