Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77B772FE61B
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 10:18:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728330AbhAUJON (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 04:14:13 -0500
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45]:49632 "EHLO
        out30-45.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728393AbhAUJMt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 04:12:49 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=abaci-bugfix@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0UMQ.y10_1611220314;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:abaci-bugfix@linux.alibaba.com fp:SMTPD_---0UMQ.y10_1611220314)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 21 Jan 2021 17:12:05 +0800
From:   Yang Li <abaci-bugfix@linux.alibaba.com>
To:     mchehab@kernel.org
Cc:     sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org,
        Yang Li <abaci-bugfix@linux.alibaba.com>
Subject: [PATCH 2/3] media: atomisp: remove redundant NULL check
Date:   Thu, 21 Jan 2021 17:11:51 +0800
Message-Id: <1611220312-89384-2-git-send-email-abaci-bugfix@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1611220312-89384-1-git-send-email-abaci-bugfix@linux.alibaba.com>
References: <1611220312-89384-1-git-send-email-abaci-bugfix@linux.alibaba.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix below warnings reported by coccicheck:
./drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c:390:2-8:
WARNING: NULL check before some freeing functions is not needed.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <abaci-bugfix@linux.alibaba.com>
---
 .../media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
index 3e72dab..13caa55 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
@@ -386,8 +386,7 @@ struct ia_css_isp_dvs_statistics_map *
 
 	return me;
 err:
-	if (me)
-		kvfree(me);
+	kvfree(me);
 	return NULL;
 }
 
-- 
1.8.3.1

