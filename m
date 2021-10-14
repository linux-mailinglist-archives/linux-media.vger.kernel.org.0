Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EA5B42E11B
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 20:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233919AbhJNSXx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 14:23:53 -0400
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:63139 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233913AbhJNSXx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 14:23:53 -0400
Received: from pop-os.home ([92.140.161.106])
        by smtp.orange.fr with ESMTPA
        id b5MPmB7sXBazob5MPmY6R9; Thu, 14 Oct 2021 20:21:46 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Thu, 14 Oct 2021 20:21:46 +0200
X-ME-IP: 92.140.161.106
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     minghsiu.tsai@mediatek.com, houlong.wei@mediatek.com,
        andrew-ct.chen@mediatek.com, tiffany.lin@mediatek.com,
        mchehab@kernel.org, matthias.bgg@gmail.com
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] media: mtk-vpu: Remove redundant 'flush_workqueue()' calls
Date:   Thu, 14 Oct 2021 20:21:43 +0200
Message-Id: <9788bdfee564000a1c4d68126d25570c7feb1055.1634235609.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

'destroy_workqueue()' already drains the queue before destroying it, so
there is no need to flush it explicitly.

Remove the redundant 'flush_workqueue()' calls.

This was generated with coccinelle:

@@
expression E;
@@
- 	flush_workqueue(E);
	destroy_workqueue(E);

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/platform/mtk-vpu/mtk_vpu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
index 7f1647da0ade..7bd715fc844d 100644
--- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
+++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
@@ -964,10 +964,8 @@ static int mtk_vpu_remove(struct platform_device *pdev)
 #ifdef CONFIG_DEBUG_FS
 	debugfs_remove(vpu_debugfs);
 #endif
-	if (vpu->wdt.wq) {
-		flush_workqueue(vpu->wdt.wq);
+	if (vpu->wdt.wq)
 		destroy_workqueue(vpu->wdt.wq);
-	}
 	vpu_free_ext_mem(vpu, P_FW);
 	vpu_free_ext_mem(vpu, D_FW);
 	mutex_destroy(&vpu->vpu_mutex);
-- 
2.30.2

