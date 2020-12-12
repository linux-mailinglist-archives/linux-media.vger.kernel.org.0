Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 948DC2D88BD
	for <lists+linux-media@lfdr.de>; Sat, 12 Dec 2020 18:44:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437856AbgLLRnS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Dec 2020 12:43:18 -0500
Received: from smtp07.smtpout.orange.fr ([80.12.242.129]:18292 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407698AbgLLRnF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Dec 2020 12:43:05 -0500
Received: from localhost.localdomain ([93.22.133.216])
        by mwinf5d65 with ME
        id 3VhJ2400K4gHbkV03VhKYs; Sat, 12 Dec 2020 18:41:20 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 12 Dec 2020 18:41:20 +0100
X-ME-IP: 93.22.133.216
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] media: vsp1: Fix an error handling path in the probe function
Date:   Sat, 12 Dec 2020 18:41:19 +0100
Message-Id: <20201212174119.120027-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A previous 'rcar_fcp_get()' call must be undone in the error handling path,
as already done in the remove function.

Fixes: 94fcdf829793 ("[media] v4l: vsp1: Add FCP support")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/platform/vsp1/vsp1_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/vsp1/vsp1_drv.c b/drivers/media/platform/vsp1/vsp1_drv.c
index dc62533cf32c..aa66e4f5f3f3 100644
--- a/drivers/media/platform/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/vsp1/vsp1_drv.c
@@ -882,8 +882,10 @@ static int vsp1_probe(struct platform_device *pdev)
 	}
 
 done:
-	if (ret)
+	if (ret) {
 		pm_runtime_disable(&pdev->dev);
+		rcar_fcp_put(vsp1->fcp);
+	}
 
 	return ret;
 }
-- 
2.27.0

