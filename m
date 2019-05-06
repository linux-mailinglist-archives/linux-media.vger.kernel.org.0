Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBFE7144E8
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2019 09:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbfEFHDj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 May 2019 03:03:39 -0400
Received: from out1.zte.com.cn ([202.103.147.172]:58206 "EHLO mxct.zte.com.cn"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726298AbfEFHDj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 May 2019 03:03:39 -0400
Received: from mse-fl2.zte.com.cn (unknown [10.30.14.239])
        by Forcepoint Email with ESMTPS id 45A5C80D955ADEA13251;
        Mon,  6 May 2019 15:03:34 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
        by mse-fl2.zte.com.cn with ESMTP id x4673P5h076258;
        Mon, 6 May 2019 15:03:25 +0800 (GMT-8)
        (envelope-from wen.yang99@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
          by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
          with ESMTP id 2019050615032991-10027949 ;
          Mon, 6 May 2019 15:03:29 +0800 
From:   Wen Yang <wen.yang99@zte.com.cn>
To:     linux-kernel@vger.kernel.org
Cc:     wang.yi59@zte.com.cn, Wen Yang <wen.yang99@zte.com.cn>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH 2/4] media: mtk-vpu: fix leaked of_node references
Date:   Mon, 6 May 2019 15:05:16 +0800
Message-Id: <1557126318-21487-3-git-send-email-wen.yang99@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1557126318-21487-1-git-send-email-wen.yang99@zte.com.cn>
References: <1557126318-21487-1-git-send-email-wen.yang99@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release 8.5.3FP6|November
 21, 2013) at 2019-05-06 15:03:30,
        Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2019-05-06 15:03:23,
        Serialize complete at 2019-05-06 15:03:23
X-MAIL: mse-fl2.zte.com.cn x4673P5h076258
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The call to of_parse_phandle returns a node pointer with refcount
incremented thus it must be explicitly decremented after the last
usage.

Detected by coccinelle with the following warnings:
drivers/media/platform/mtk-vpu/mtk_vpu.c:477:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 464, but without a corresponding object release within this function.

Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Cc: Minghsiu Tsai <minghsiu.tsai@mediatek.com>
Cc: Houlong Wei <houlong.wei@mediatek.com>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-media@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/media/platform/mtk-vpu/mtk_vpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
index 46c45f9..97dcb4c 100644
--- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
+++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
@@ -468,9 +468,9 @@ struct platform_device *vpu_get_plat_device(struct platform_device *pdev)
 	}
 
 	vpu_pdev = of_find_device_by_node(vpu_node);
+	of_node_put(vpu_node);
 	if (WARN_ON(!vpu_pdev)) {
 		dev_err(dev, "vpu pdev failed\n");
-		of_node_put(vpu_node);
 		return NULL;
 	}
 
-- 
2.9.5

