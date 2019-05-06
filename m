Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A5E0144EC
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2019 09:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726249AbfEFHDe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 May 2019 03:03:34 -0400
Received: from mxhk.zte.com.cn ([63.217.80.70]:33080 "EHLO mxhk.zte.com.cn"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725710AbfEFHDe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 May 2019 03:03:34 -0400
Received: from mse-fl1.zte.com.cn (unknown [10.30.14.238])
        by Forcepoint Email with ESMTPS id DA82BDDDD39076BBC7BB;
        Mon,  6 May 2019 15:03:30 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
        by mse-fl1.zte.com.cn with ESMTP id x4673Q2e021653;
        Mon, 6 May 2019 15:03:26 +0800 (GMT-8)
        (envelope-from wen.yang99@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
          by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
          with ESMTP id 2019050615033055-10027950 ;
          Mon, 6 May 2019 15:03:30 +0800 
From:   Wen Yang <wen.yang99@zte.com.cn>
To:     linux-kernel@vger.kernel.org
Cc:     wang.yi59@zte.com.cn, Wen Yang <wen.yang99@zte.com.cn>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH 3/4] media: mtk-vcodec: fix leaked of_node references
Date:   Mon, 6 May 2019 15:05:17 +0800
Message-Id: <1557126318-21487-4-git-send-email-wen.yang99@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1557126318-21487-1-git-send-email-wen.yang99@zte.com.cn>
References: <1557126318-21487-1-git-send-email-wen.yang99@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release 8.5.3FP6|November
 21, 2013) at 2019-05-06 15:03:30,
        Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2019-05-06 15:03:24,
        Serialize complete at 2019-05-06 15:03:24
X-MAIL: mse-fl1.zte.com.cn x4673Q2e021653
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The call to of_find_device_by_node returns a node pointer with refcount
incremented thus it must be explicitly decremented after the last
usage.

Detected by coccinelle with the following warnings:
drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c:60:3-9: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 38, but without a corresponding object release within this function.
drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c:63:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 38, but without a corresponding object release within this function.
drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c:72:3-9: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 38, but without a corresponding object release within this function.

Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-media@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
index 7884465..11c45c5 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
@@ -42,8 +42,8 @@ int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
 	}
 
 	pdev = of_find_device_by_node(node);
+	of_node_put(node);
 	if (WARN_ON(!pdev)) {
-		of_node_put(node);
 		return -1;
 	}
 	pm->larbvdec = &pdev->dev;
-- 
2.9.5

