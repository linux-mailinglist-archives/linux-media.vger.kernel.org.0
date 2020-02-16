Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D1761603DE
	for <lists+linux-media@lfdr.de>; Sun, 16 Feb 2020 12:47:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728075AbgBPLrT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Feb 2020 06:47:19 -0500
Received: from smtp07.smtpout.orange.fr ([80.12.242.129]:50736 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728043AbgBPLrT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Feb 2020 06:47:19 -0500
Received: from localhost.localdomain ([93.22.36.246])
        by mwinf5d13 with ME
        id 3PnB2200E5JeL2d03PnCdH; Sun, 16 Feb 2020 12:47:18 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 16 Feb 2020 12:47:18 +0100
X-ME-IP: 93.22.36.246
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     sumit.semwal@linaro.org
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] dma-buf: Fix a typo in Kconfig
Date:   Sun, 16 Feb 2020 12:47:08 +0100
Message-Id: <20200216114708.20583-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A 'h' ismissing in' syncronization'

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/dma-buf/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index 0613bb7770f5..e7d820ce0724 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -6,7 +6,7 @@ config SYNC_FILE
 	default n
 	select DMA_SHARED_BUFFER
 	---help---
-	  The Sync File Framework adds explicit syncronization via
+	  The Sync File Framework adds explicit synchronization via
 	  userspace. It enables send/receive 'struct dma_fence' objects to/from
 	  userspace via Sync File fds for synchronization between drivers via
 	  userspace components. It has been ported from Android.
-- 
2.20.1

