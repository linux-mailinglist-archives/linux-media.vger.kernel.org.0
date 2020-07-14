Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2945C21F810
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 19:21:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728312AbgGNRVA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 13:21:00 -0400
Received: from mail.ispras.ru ([83.149.199.84]:48914 "EHLO mail.ispras.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726169AbgGNRVA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 13:21:00 -0400
Received: from hellwig.intra.ispras.ru (unknown [10.10.2.182])
        by mail.ispras.ru (Postfix) with ESMTPS id CA80540AAD65;
        Tue, 14 Jul 2020 17:20:57 +0000 (UTC)
From:   Evgeny Novikov <novikov@ispras.ru>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Evgeny Novikov <novikov@ispras.ru>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        ldv-project@linuxtesting.org
Subject: [PATCH] media: isif: reset global state
Date:   Tue, 14 Jul 2020 20:20:49 +0300
Message-Id: <20200714172049.27738-1-novikov@ispras.ru>
X-Mailer: git-send-email 2.16.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

isif_probe() invokes iounmap() on error handling paths, but it does not
reset the global state. So, later it can invoke iounmap() even when
ioremap() fails. This is the case also for isif_remove(). The patch
resets the global state after invoking iounmap() to avoid this.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
---
 drivers/media/platform/davinci/isif.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/davinci/isif.c b/drivers/media/platform/davinci/isif.c
index c98edb67cfb2..c53cecd072b1 100644
--- a/drivers/media/platform/davinci/isif.c
+++ b/drivers/media/platform/davinci/isif.c
@@ -1075,10 +1075,14 @@ static int isif_probe(struct platform_device *pdev)
 	release_mem_region(res->start, resource_size(res));
 	i--;
 fail_nobase_res:
-	if (isif_cfg.base_addr)
+	if (isif_cfg.base_addr) {
 		iounmap(isif_cfg.base_addr);
-	if (isif_cfg.linear_tbl0_addr)
+		isif_cfg.base_addr = NULL;
+	}
+	if (isif_cfg.linear_tbl0_addr) {
 		iounmap(isif_cfg.linear_tbl0_addr);
+		isif_cfg.linear_tbl0_addr = NULL;
+	}
 
 	while (i >= 0) {
 		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
@@ -1096,8 +1100,11 @@ static int isif_remove(struct platform_device *pdev)
 	int i = 0;
 
 	iounmap(isif_cfg.base_addr);
+	isif_cfg.base_addr = NULL;
 	iounmap(isif_cfg.linear_tbl0_addr);
+	isif_cfg.linear_tbl0_addr = NULL;
 	iounmap(isif_cfg.linear_tbl1_addr);
+	isif_cfg.linear_tbl1_addr = NULL;
 	while (i < 3) {
 		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
 		if (res)
-- 
2.16.4

