Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 458142454DB
	for <lists+linux-media@lfdr.de>; Sun, 16 Aug 2020 01:13:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728059AbgHOXMo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Aug 2020 19:12:44 -0400
Received: from smtp13.smtpout.orange.fr ([80.12.242.135]:18752 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726184AbgHOXMo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Aug 2020 19:12:44 -0400
Received: from localhost.localdomain ([93.22.149.115])
        by mwinf5d71 with ME
        id FiCf230082VdYtp03iCf2V; Sat, 15 Aug 2020 08:12:40 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 15 Aug 2020 08:12:40 +0200
X-ME-IP: 93.22.149.115
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     sean@mess.org, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] media: mceusb: Avoid GFP_ATOMIC where it is not needed
Date:   Sat, 15 Aug 2020 08:12:37 +0200
Message-Id: <20200815061237.765171-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is no point in using GFP_ATOMIC here.
It is a probe function, and GFP_KERNEL is already used the line before
and the line after.

Use GFP_KERNEL instead.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/rc/mceusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
index f9616158bcf4..98681ba10428 100644
--- a/drivers/media/rc/mceusb.c
+++ b/drivers/media/rc/mceusb.c
@@ -1726,7 +1726,7 @@ static int mceusb_dev_probe(struct usb_interface *intf,
 		goto mem_alloc_fail;
 
 	ir->pipe_in = pipe;
-	ir->buf_in = usb_alloc_coherent(dev, maxp, GFP_ATOMIC, &ir->dma_in);
+	ir->buf_in = usb_alloc_coherent(dev, maxp, GFP_KERNEL, &ir->dma_in);
 	if (!ir->buf_in)
 		goto buf_in_alloc_fail;
 
-- 
2.25.1

