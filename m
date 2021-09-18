Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2C50410553
	for <lists+linux-media@lfdr.de>; Sat, 18 Sep 2021 11:13:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238216AbhIRJPK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Sep 2021 05:15:10 -0400
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:58071 "EHLO
        out30-132.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232720AbhIRJPJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Sep 2021 05:15:09 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04395;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0Uom.Rp3_1631956417;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0Uom.Rp3_1631956417)
          by smtp.aliyun-inc.com(127.0.0.1);
          Sat, 18 Sep 2021 17:13:43 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     robh@kernel.org
Cc:     tomeu.vizoso@collabora.com, steven.price@arm.com,
        alyssa.rosenzweig@collabora.com, airlied@linux.ie, daniel@ffwll.ch,
        matthias.bgg@gmail.com, sumit.semwal@linaro.org,
        christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] panfrost: make mediatek_mt8183_supplies and mediatek_mt8183_pm_domains static
Date:   Sat, 18 Sep 2021 17:13:34 +0800
Message-Id: <1631956414-85412-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This symbol is not used outside of panfrost_drv.c, so marks it static.

Fix the following sparse warning:

drivers/gpu/drm/panfrost/panfrost_drv.c:641:12: warning: symbol
'mediatek_mt8183_supplies' was not declared. Should it be static?

drivers/gpu/drm/panfrost/panfrost_drv.c:642:12: warning: symbol
'mediatek_mt8183_pm_domains' was not declared. Should it be static?

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 077cbbf..82ad9a6 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -638,8 +638,8 @@ static int panfrost_remove(struct platform_device *pdev)
 	.vendor_quirk = panfrost_gpu_amlogic_quirk,
 };
 
-const char * const mediatek_mt8183_supplies[] = { "mali", "sram" };
-const char * const mediatek_mt8183_pm_domains[] = { "core0", "core1", "core2" };
+static const char * const mediatek_mt8183_supplies[] = { "mali", "sram" };
+static const char * const mediatek_mt8183_pm_domains[] = { "core0", "core1", "core2" };
 static const struct panfrost_compatible mediatek_mt8183_data = {
 	.num_supplies = ARRAY_SIZE(mediatek_mt8183_supplies),
 	.supply_names = mediatek_mt8183_supplies,
-- 
1.8.3.1

