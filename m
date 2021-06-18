Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92D813AC801
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 11:50:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232282AbhFRJwb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 05:52:31 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:49872 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbhFRJwb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 05:52:31 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1luB8n-0006Cd-65; Fri, 18 Jun 2021 09:50:21 +0000
From:   Colin King <colin.king@canonical.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: saa7164: remove redundant continue statement
Date:   Fri, 18 Jun 2021 10:50:20 +0100
Message-Id: <20210618095020.100795-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The continue statement at the end of a for-loop has no effect,
remove it.

Addresses-Coverity: ("Continue has no effect")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/pci/saa7164/saa7164-cmd.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/pci/saa7164/saa7164-cmd.c b/drivers/media/pci/saa7164/saa7164-cmd.c
index 716162055fb7..a65d810ce212 100644
--- a/drivers/media/pci/saa7164/saa7164-cmd.c
+++ b/drivers/media/pci/saa7164/saa7164-cmd.c
@@ -549,9 +549,6 @@ int saa7164_cmd_send(struct saa7164_dev *dev, u8 id, enum tmComResCmd command,
 		/* See of other commands are on the bus */
 		if (saa7164_cmd_dequeue(dev) != SAA_OK)
 			printk(KERN_ERR "dequeue(3) failed\n");
-
-		continue;
-
 	} /* (loop) */
 
 	/* Release the sequence number allocation */
-- 
2.31.1

