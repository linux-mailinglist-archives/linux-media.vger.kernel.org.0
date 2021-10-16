Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A69143012C
	for <lists+linux-media@lfdr.de>; Sat, 16 Oct 2021 10:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239443AbhJPImo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 Oct 2021 04:42:44 -0400
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:49424 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234192AbhJPImn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 Oct 2021 04:42:43 -0400
Received: from pop-os.home ([92.140.161.106])
        by smtp.orange.fr with ESMTPA
        id bfF0max1HqYovbfF1mCK1f; Sat, 16 Oct 2021 10:40:33 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 16 Oct 2021 10:40:33 +0200
X-ME-IP: 92.140.161.106
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     maintainers@bluecherrydvr.com, anton@corp.bluecherry.net,
        andrey.utkin@corp.bluecherry.net, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] media: tw5864: Simplify 'tw5864_finidev()'
Date:   Sat, 16 Oct 2021 10:40:29 +0200
Message-Id: <189d4fd72db8707cb495e3a29ab7a276e07f62a0.1634373552.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some resources are allocated with 'pci_request_regions()', so use
'pci_release_regions()' to free them, instead of a verbose
'release_mem_region()'.

There is no point in calling 'devm_kfree()'. The corresponding resource is
managed, so it will be fried automatically.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/pci/tw5864/tw5864-core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/pci/tw5864/tw5864-core.c b/drivers/media/pci/tw5864/tw5864-core.c
index 23d3cae54a5d..fee3b7711901 100644
--- a/drivers/media/pci/tw5864/tw5864-core.c
+++ b/drivers/media/pci/tw5864/tw5864-core.c
@@ -333,11 +333,9 @@ static void tw5864_finidev(struct pci_dev *pci_dev)
 
 	/* release resources */
 	iounmap(dev->mmio);
-	release_mem_region(pci_resource_start(pci_dev, 0),
-			   pci_resource_len(pci_dev, 0));
+	pci_release_regions(pci_dev);
 
 	v4l2_device_unregister(&dev->v4l2_dev);
-	devm_kfree(&pci_dev->dev, dev);
 }
 
 static struct pci_driver tw5864_pci_driver = {
-- 
2.30.2

