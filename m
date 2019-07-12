Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8049A676A4
	for <lists+linux-media@lfdr.de>; Sat, 13 Jul 2019 00:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728157AbfGLWrC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jul 2019 18:47:02 -0400
Received: from gofer.mess.org ([88.97.38.141]:57605 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727994AbfGLWrC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jul 2019 18:47:02 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id ABB956047B; Fri, 12 Jul 2019 23:47:00 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Frank Wunderlich <frank-w@public-files.de>,
        Sean Wang <sean.wang@mediatek.com>,
        linux-mediatek@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 1/3] media: mtk-cir: only allow protocols that have software decoders
Date:   Fri, 12 Jul 2019 23:46:58 +0100
Message-Id: <20190712224700.11285-1-sean@mess.org>
X-Mailer: git-send-email 2.11.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RC_PROTO_BIT_ALL includes protocols like unknown and other that do not
have IR decoders by definition. If these protocols are set in the
allowed_protocols, they will show in the protocols sysfs file but cannot
be enabled.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/mtk-cir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/mtk-cir.c b/drivers/media/rc/mtk-cir.c
index 46101efe017b..9dc467ebae24 100644
--- a/drivers/media/rc/mtk-cir.c
+++ b/drivers/media/rc/mtk-cir.c
@@ -342,7 +342,7 @@ static int mtk_ir_probe(struct platform_device *pdev)
 	ir->rc->map_name = map_name ?: RC_MAP_EMPTY;
 	ir->rc->dev.parent = dev;
 	ir->rc->driver_name = MTK_IR_DEV;
-	ir->rc->allowed_protocols = RC_PROTO_BIT_ALL;
+	ir->rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
 	ir->rc->rx_resolution = MTK_IR_SAMPLE;
 	ir->rc->timeout = MTK_MAX_SAMPLES * (MTK_IR_SAMPLE + 1);
 
-- 
2.21.0

