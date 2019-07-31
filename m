Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0504F7C3D1
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2019 15:41:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388340AbfGaNlZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Jul 2019 09:41:25 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:33340 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388336AbfGaNlY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Jul 2019 09:41:24 -0400
Received: from ramsan ([84.194.98.4])
        by michel.telenet-ops.be with bizsmtp
        id jRhN2000b05gfCL06RhNou; Wed, 31 Jul 2019 15:41:22 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hsor4-0001Fe-NR; Wed, 31 Jul 2019 15:41:22 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hsor4-0004og-LM; Wed, 31 Jul 2019 15:41:22 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] media: tm6000: Spelling s/diconencted/diconnected/
Date:   Wed, 31 Jul 2019 15:41:21 +0200
Message-Id: <20190731134121.18473-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/media/usb/tm6000/tm6000-cards.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/tm6000/tm6000-cards.c b/drivers/media/usb/tm6000/tm6000-cards.c
index 23df50aa0a4af6da..9a0ffe678524987c 100644
--- a/drivers/media/usb/tm6000/tm6000-cards.c
+++ b/drivers/media/usb/tm6000/tm6000-cards.c
@@ -1328,7 +1328,7 @@ static int tm6000_usb_probe(struct usb_interface *interface,
 
 /*
  * tm6000_usb_disconnect()
- * called when the device gets diconencted
+ * called when the device gets diconnected
  * video device will be unregistered on v4l2_close in case it is still open
  */
 static void tm6000_usb_disconnect(struct usb_interface *interface)
-- 
2.17.1

