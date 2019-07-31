Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FA447C3CE
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2019 15:41:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388335AbfGaNky (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Jul 2019 09:40:54 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:49798 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388318AbfGaNky (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Jul 2019 09:40:54 -0400
Received: from ramsan ([84.194.98.4])
        by andre.telenet-ops.be with bizsmtp
        id jRgs2000K05gfCL01RgstN; Wed, 31 Jul 2019 15:40:52 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hsoqa-0001FV-AK; Wed, 31 Jul 2019 15:40:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hsoqa-0004nO-8w; Wed, 31 Jul 2019 15:40:52 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] media: cx231xx: Spelling s/diconencted/diconnected/
Date:   Wed, 31 Jul 2019 15:40:51 +0200
Message-Id: <20190731134051.18392-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/media/usb/cx231xx/cx231xx-cards.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-cards.c b/drivers/media/usb/cx231xx/cx231xx-cards.c
index e0d98ba8fdbfa829..47a85d8152b03afa 100644
--- a/drivers/media/usb/cx231xx/cx231xx-cards.c
+++ b/drivers/media/usb/cx231xx/cx231xx-cards.c
@@ -1924,7 +1924,7 @@ static int cx231xx_usb_probe(struct usb_interface *interface,
 
 /*
  * cx231xx_usb_disconnect()
- * called when the device gets diconencted
+ * called when the device gets diconnected
  * video device will be unregistered on v4l2_close in case it is still open
  */
 static void cx231xx_usb_disconnect(struct usb_interface *interface)
-- 
2.17.1

