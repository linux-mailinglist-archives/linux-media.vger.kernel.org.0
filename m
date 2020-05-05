Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 977DC1C4F9C
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 09:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728510AbgEEHur (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 03:50:47 -0400
Received: from smtp11.smtpout.orange.fr ([80.12.242.133]:27954 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgEEHuq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 May 2020 03:50:46 -0400
Received: from localhost.localdomain ([93.23.13.215])
        by mwinf5d34 with ME
        id avqb2200p4ePWwV03vqcd5; Tue, 05 May 2020 09:50:45 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 05 May 2020 09:50:45 +0200
X-ME-IP: 93.23.13.215
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     jernej.skrabec@siol.net, mchehab@kernel.org, mripard@kernel.org,
        wens@csie.org, hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] media: sun8i: Fix an error handling path in 'deinterlace_runtime_resume()'
Date:   Tue,  5 May 2020 09:50:34 +0200
Message-Id: <20200505075034.168296-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It is spurious to call 'clk_disable_unprepare()' when
'clk_prepare_enable()' has not been called yet.
Re-order the error handling path to avoid it.

Fixes: a4260ea49547 ("media: sun4i: Add H3 deinterlace driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
index d78f6593ddd1..a1f29462d260 100644
--- a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
+++ b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
@@ -969,14 +969,14 @@ static int deinterlace_runtime_resume(struct device *device)
 
 	return 0;
 
-err_exlusive_rate:
-	clk_rate_exclusive_put(dev->mod_clk);
 err_ram_clk:
 	clk_disable_unprepare(dev->ram_clk);
 err_mod_clk:
 	clk_disable_unprepare(dev->mod_clk);
 err_bus_clk:
 	clk_disable_unprepare(dev->bus_clk);
+err_exlusive_rate:
+	clk_rate_exclusive_put(dev->mod_clk);
 
 	return ret;
 }
-- 
2.25.1

