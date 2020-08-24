Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE20024F2BF
	for <lists+linux-media@lfdr.de>; Mon, 24 Aug 2020 08:54:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbgHXGyW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Aug 2020 02:54:22 -0400
Received: from mail.zju.edu.cn ([61.164.42.155]:44084 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725947AbgHXGyW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Aug 2020 02:54:22 -0400
Received: from localhost.localdomain (unknown [210.32.144.184])
        by mail-app3 (Coremail) with SMTP id cC_KCgAnf_UEZENf2tgdAw--.15520S4;
        Mon, 24 Aug 2020 14:54:01 +0800 (CST)
From:   Dinghao Liu <dinghao.liu@zju.edu.cn>
To:     dinghao.liu@zju.edu.cn, kjlu@umn.edu
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tony Lindgren <tony@atomide.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: omap3isp: Fix memleak in isp_probe
Date:   Mon, 24 Aug 2020 14:53:52 +0800
Message-Id: <20200824065353.4385-1-dinghao.liu@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: cC_KCgAnf_UEZENf2tgdAw--.15520S4
X-Coremail-Antispam: 1UD129KBjvdXoWrKr1ftFW7urykJFW8CryrtFb_yoWDZFg_Zw
        4xKF4xWrZ5Zrn8Kw429rna9r92yrsrur1xWFZYgayIq3yUuFnxGrWq9rZ3Wa4DAr47uFyU
        G3yUWFW7C3sxJjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbIkFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
        wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
        vE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E
        87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
        8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_
        Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
        xGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r47MxAIw28IcxkI7VAKI48J
        MxAIw28IcVCjz48v1sIEY20_GFWkJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
        02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_
        GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
        CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE
        14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf
        9x0JU-J5rUUUUU=
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgUCBlZdtPpD7wAKsg
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When devm_ioremap_resource() fails, isp should be
freed just like other error paths in isp_probe.

Fixes: 8644cdf972dd6 ("[media] omap3isp: Replace many MMIO regions by two")
Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---
 drivers/media/platform/omap3isp/isp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/omap3isp/isp.c b/drivers/media/platform/omap3isp/isp.c
index b91e472ee764..de066757726d 100644
--- a/drivers/media/platform/omap3isp/isp.c
+++ b/drivers/media/platform/omap3isp/isp.c
@@ -2328,8 +2328,10 @@ static int isp_probe(struct platform_device *pdev)
 		mem = platform_get_resource(pdev, IORESOURCE_MEM, i);
 		isp->mmio_base[map_idx] =
 			devm_ioremap_resource(isp->dev, mem);
-		if (IS_ERR(isp->mmio_base[map_idx]))
-			return PTR_ERR(isp->mmio_base[map_idx]);
+		if (IS_ERR(isp->mmio_base[map_idx])) {
+			ret = PTR_ERR(isp->mmio_base[map_idx]);
+			goto error;
+		}
 	}
 
 	ret = isp_get_clocks(isp);
-- 
2.17.1

