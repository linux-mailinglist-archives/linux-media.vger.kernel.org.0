Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18B3B768780
	for <lists+linux-media@lfdr.de>; Sun, 30 Jul 2023 21:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbjG3TgY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Jul 2023 15:36:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjG3TgX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Jul 2023 15:36:23 -0400
X-Greylist: delayed 2573 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 30 Jul 2023 12:36:21 PDT
Received: from skyboo.net (skyboo.net [5.252.110.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4722110CE
        for <linux-media@vger.kernel.org>; Sun, 30 Jul 2023 12:36:21 -0700 (PDT)
Received: from manio by skyboo.net with local (Exim 4.95-RC2)
        (envelope-from <manio@skyboo.net>)
        id 1qQBXg-007ADh-VJ;
        Sun, 30 Jul 2023 20:53:25 +0200
From:   Mariusz Bialonczyk <manio@skyboo.net>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Mariusz Bialonczyk <manio@skyboo.net>
Date:   Sun, 30 Jul 2023 20:52:37 +0200
Message-Id: <20230730185237.1705572-1-manio@skyboo.net>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Rcpt-To: linux-media@vger.kernel.org, mchehab@kernel.org, manio@skyboo.net
X-SA-Exim-Mail-From: manio@skyboo.net
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
Subject: [PATCH] media: cx23885: debug cosmetics
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on skyboo.net)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This commit is fixing the module in a way that trailing spaces
at the end of the line in the debug/dmesg are gone.

Signed-off-by: Mariusz Bialonczyk <manio@skyboo.net>
---
 drivers/media/pci/cx23885/cx23885-core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/cx23885/cx23885-core.c b/drivers/media/pci/cx23885/cx23885-core.c
index 2ce2914576cf..c8705d786cdd 100644
--- a/drivers/media/pci/cx23885/cx23885-core.c
+++ b/drivers/media/pci/cx23885/cx23885-core.c
@@ -554,14 +554,14 @@ void cx23885_sram_channel_dump(struct cx23885_dev *dev,
 
 	for (i = 0; i < 4; i++) {
 		risc = cx_read(ch->cmds_start + 4 * (i + 14));
-		pr_warn("%s:   risc%d: ", dev->name, i);
+		pr_warn("%s:   risc%d:", dev->name, i);
 		cx23885_risc_decode(risc);
 	}
 	for (i = 0; i < (64 >> 2); i += n) {
 		risc = cx_read(ch->ctrl_start + 4 * i);
 		/* No consideration for bits 63-32 */
 
-		pr_warn("%s:   (0x%08x) iq %x: ", dev->name,
+		pr_warn("%s:   (0x%08x) iq %x:", dev->name,
 			ch->ctrl_start + 4 * i, i);
 		n = cx23885_risc_decode(risc);
 		for (j = 1; j < n; j++) {
@@ -594,7 +594,7 @@ static void cx23885_risc_disasm(struct cx23885_tsport *port,
 	pr_info("%s: risc disasm: %p [dma=0x%08lx]\n",
 	       dev->name, risc->cpu, (unsigned long)risc->dma);
 	for (i = 0; i < (risc->size >> 2); i += n) {
-		pr_info("%s:   %04d: ", dev->name, i);
+		pr_info("%s:   %04d:", dev->name, i);
 		n = cx23885_risc_decode(le32_to_cpu(risc->cpu[i]));
 		for (j = 1; j < n; j++)
 			pr_info("%s:   %04d: 0x%08x [ arg #%d ]\n",
-- 
2.30.2

