Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F0543B14CF
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 09:37:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230357AbhFWHic (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 03:38:32 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:32792 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230222AbhFWHiW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 03:38:22 -0400
X-UUID: 4783db3ba090400eb04bc6ddc0d93cf7-20210623
X-UUID: 4783db3ba090400eb04bc6ddc0d93cf7-20210623
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <moudy.ho@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 314512722; Wed, 23 Jun 2021 15:35:58 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 15:35:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Jun 2021 15:35:56 +0800
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
Subject: [RFC PATCH V0 04/10] media: mtk-mdp3: add error handling in error return
Date:   Wed, 23 Jun 2021 15:35:43 +0800
Message-ID: <20210623073549.24170-4-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210623073549.24170-1-moudy.ho@mediatek.com>
References: <20210623073549.24170-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: daoyuan huang <daoyuan.huang@mediatek.com>

add error handling in missed places.

Signed-off-by: daoyuan huang <daoyuan.huang@mediatek.com>
---
 drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c | 14 +++++++++++++-
 drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c | 16 ++++++++++++++++
 drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h |  2 ++
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
index f8bf8fde599c..42a51061677a 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
@@ -398,7 +398,17 @@ static void mdp_handle_cmdq_callback(struct cmdq_cb_data data)
 
 	cmdq_pkt_destroy(cb_param->pkt);
 	INIT_WORK(&cb_param->auto_release_work, mdp_auto_release_work);
-	queue_work(mdp->clock_wq, &cb_param->auto_release_work);
+	if (!queue_work(mdp->clock_wq, &cb_param->auto_release_work)) {
+		mdp_err("%s:queue_work fail!\n", __func__);
+		mdp_comp_clocks_off(&mdp->pdev->dev, cb_param->comps,
+				    cb_param->num_comps);
+
+		kfree(cb_param->comps);
+		kfree(cb_param);
+
+		atomic_dec(&mdp->job_count);
+		wake_up(&mdp->callback_wq);
+	}
 }
 
 int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
@@ -495,6 +505,8 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 					   (void *)cb_param);
 		if (ret) {
 			mdp_err("%s:cmdq_pkt_flush_async fail!\n", __func__);
+			mdp_comp_clocks_off(&mdp->pdev->dev, cb_param->comps,
+					    cb_param->num_comps);
 			kfree(cb_param);
 			kfree(comps);
 		}
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
index 23dd413f3423..157ef9408ed3 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
@@ -1072,6 +1072,22 @@ void mdp_comp_clock_off(struct device *dev, struct mdp_comp *comp)
 		pm_runtime_put(comp->comp_dev);
 }
 
+void mdp_comp_clocks_on(struct device *dev, struct mdp_comp *comps, int num)
+{
+	int i;
+
+	for (i = 0; i < num; i++)
+		mdp_comp_clock_on(dev, &comps[i]);
+}
+
+void mdp_comp_clocks_off(struct device *dev, struct mdp_comp *comps, int num)
+{
+	int i;
+
+	for (i = 0; i < num; i++)
+		mdp_comp_clock_off(dev, &comps[i]);
+}
+
 static int mdp_get_subsys_id(struct device *dev, struct device_node *node,
 			     struct mdp_comp *comp)
 {
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
index 27d58dc51dce..f201bced3c06 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
@@ -147,6 +147,8 @@ int mdp_component_init(struct mdp_dev *mdp);
 void mdp_component_deinit(struct mdp_dev *mdp);
 void mdp_comp_clock_on(struct device *dev, struct mdp_comp *comp);
 void mdp_comp_clock_off(struct device *dev, struct mdp_comp *comp);
+void mdp_comp_clocks_on(struct device *dev, struct mdp_comp *comps, int num);
+void mdp_comp_clocks_off(struct device *dev, struct mdp_comp *comps, int num);
 int mdp_comp_ctx_init(struct mdp_dev *mdp, struct mdp_comp_ctx *ctx,
 		      const struct img_compparam *param,
 	const struct img_ipi_frameparam *frame);
-- 
2.18.0

