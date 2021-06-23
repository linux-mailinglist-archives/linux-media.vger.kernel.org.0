Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AE1A3B14CC
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 09:37:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230347AbhFWHib (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 03:38:31 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:32824 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229906AbhFWHiV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 03:38:21 -0400
X-UUID: d4ce259365fc4cbea0667d582b7737a2-20210623
X-UUID: d4ce259365fc4cbea0667d582b7737a2-20210623
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <moudy.ho@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1741434742; Wed, 23 Jun 2021 15:35:59 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 15:35:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Jun 2021 15:35:57 +0800
From:   Moudy Ho <moudy.ho@mediatek.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jernej Skrabec <jernej.skrabec@siol.net>
CC:     Maoguang Meng <maoguang.meng@mediatek.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        daoyuan huang <daoyuan.huang@mediatek.com>,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Landley <rob@landley.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <tfiga@chromium.org>,
        <drinkcat@chromium.org>, <acourbot@chromium.org>,
        <pihsun@chromium.org>, <menghui.lin@mediatek.com>,
        <sj.huang@mediatek.com>, <ben.lok@mediatek.com>,
        <randy.wu@mediatek.com>, <moudy.ho@mediatek.com>,
        <srv_heupstream@mediatek.com>, <frederic.chen@mediatek.com>
Subject: [RFC PATCH V0 09/10] media: mtk-mdp3: revise error handling about get/probe MDP3
Date:   Wed, 23 Jun 2021 15:35:48 +0800
Message-ID: <20210623073549.24170-9-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210623073549.24170-1-moudy.ho@mediatek.com>
References: <20210623073549.24170-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch is used for review before send upstream patch.
From Alexandre Courbot's review comment: Independent from the main patch.
Revise error handling about get/probe MDP3 driver to make it stable.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
index eaf5b07e720f..207b55ace97b 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
@@ -40,9 +40,9 @@ struct platform_device *mdp_get_plat_device(struct platform_device *pdev)
 	}
 
 	mdp_pdev = of_find_device_by_node(mdp_node);
+	of_node_put(mdp_node);
 	if (WARN_ON(!mdp_pdev)) {
 		dev_err(dev, "mdp pdev failed\n");
-		of_node_put(mdp_node);
 		return NULL;
 	}
 
@@ -113,7 +113,7 @@ static int mdp_probe(struct platform_device *pdev)
 	if (!mdp->job_wq) {
 		dev_err(dev, "Unable to create job workqueue\n");
 		ret = -ENOMEM;
-		goto err_destroy_job_wq;
+		goto err_deinit_comp;
 	}
 
 	mdp->clock_wq = alloc_workqueue(MDP_MODULE_NAME "-clock", WQ_FREEZABLE,
@@ -121,7 +121,7 @@ static int mdp_probe(struct platform_device *pdev)
 	if (!mdp->clock_wq) {
 		dev_err(dev, "Unable to create clock workqueue\n");
 		ret = -ENOMEM;
-		goto err_destroy_clock_wq;
+		goto err_destroy_job_wq;
 	}
 
 	mdp->scp = scp_get(pdev);
@@ -179,6 +179,8 @@ static int mdp_probe(struct platform_device *pdev)
 	destroy_workqueue(mdp->clock_wq);
 err_destroy_job_wq:
 	destroy_workqueue(mdp->job_wq);
+err_deinit_comp:
+		mdp_component_deinit(mdp);
 err_return:
 	dev_dbg(dev, "Errno %d\n", ret);
 	return ret;
-- 
2.18.0

