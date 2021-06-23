Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D48D73B14C5
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 09:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbhFWHiX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 03:38:23 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:32810 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230161AbhFWHiU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 03:38:20 -0400
X-UUID: 5cbdb2f31c824079b2ddb69ff0dc0608-20210623
X-UUID: 5cbdb2f31c824079b2ddb69ff0dc0608-20210623
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <moudy.ho@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 500013350; Wed, 23 Jun 2021 15:35:58 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
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
Subject: [RFC PATCH V0 07/10] media: mtk-mdp3: Fix unpaired settings
Date:   Wed, 23 Jun 2021 15:35:46 +0800
Message-ID: <20210623073549.24170-7-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210623073549.24170-1-moudy.ho@mediatek.com>
References: <20210623073549.24170-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix unpaired settings about:
1. clk on/off.
2. CMDQ packet kzalloc/kfree.
3. MDP job_count increase/decrease.

Also revise the redundant log.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   | 97 ++++++++++++-------
 .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |  4 +-
 .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |  2 +-
 3 files changed, 67 insertions(+), 36 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
index a1bdf92d45f7..eac10944283a 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include "mtk-mdp3-cmdq.h"
 #include "mtk-mdp3-comp.h"
 #include "mtk-mdp3-core.h"
@@ -230,6 +231,25 @@ static int mdp_path_subfrm_run(const struct mdp_path_subfrm *subfrm,
 	return 0;
 }
 
+static int mdp_path_ctx_init(struct mdp_dev *mdp, struct mdp_path *path)
+{
+	const struct img_config *config = path->config;
+	int index, ret;
+
+	if (config->num_components < 1)
+	    return -EINVAL;
+
+	for (index = 0; index < config->num_components; index++) {
+		ret = mdp_comp_ctx_init(mdp, &path->comps[index],
+					&config->components[index],
+					path->param);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int mdp_path_config_subfrm(struct mdp_cmd *cmd, struct mdp_path *path,
 				  u32 count)
 {
@@ -297,14 +317,6 @@ static int mdp_path_config(struct mdp_dev *mdp, struct mdp_cmd *cmd,
 	struct mdp_comp_ctx *ctx;
 	int index, count, ret;
 
-	for (index = 0; index < config->num_components; index++) {
-		ret = mdp_comp_ctx_init(mdp, &path->comps[index],
-					&config->components[index],
-					path->param);
-		if (ret)
-			return ret;
-	}
-
 	/* Config path frame */
 	/* Reset components */
 	for (index = 0; index < config->num_components; index++) {
@@ -410,6 +422,8 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 {
 	struct mdp_cmd cmd;
 	struct mdp_path path;
+	struct mdp_cmdq_cb_param *cb_param = NULL;
+	struct mdp_comp *comps = NULL;
 	int i, ret;
 
 	if (atomic_read(&mdp->suspended))
@@ -438,16 +452,23 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 		path.composes[i] = param->composes[i] ?
 			param->composes[i] : &path.bounds[i];
 	}
+
+	ret = mdp_path_ctx_init(mdp, &path);
+	if (ret) {
+		pr_info("%s mdp_path_ctx_init error\n", __func__);
+		goto err_destory_pkt;
+	}
+
+	for (i = 0; i < param->config->num_components; i++)
+			mdp_comp_clock_on(&mdp->pdev->dev, path.comps[i].comp);
+
 	ret = mdp_path_config(mdp, &cmd, &path);
 	if (ret) {
-		atomic_dec(&mdp->job_count);
-		wake_up(&mdp->callback_wq);
-		return ret;
+		pr_info("%s mdp_path_config error\n", __func__);
+		goto err_destory_pkt;
 	}
 
 	if (param->wait) {
-		for (i = 0; i < param->config->num_components; i++)
-			mdp_comp_clock_on(&mdp->pdev->dev, path.comps[i].comp);
 		ret = cmdq_pkt_flush(cmd.pkt);
 #ifdef MDP_DEBUG
 		if (ret) {
@@ -461,25 +482,20 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 			if (param->mdp_ctx)
 				mdp_m2m_job_finish(param->mdp_ctx);
 		}
-		cmdq_pkt_destroy(cmd.pkt);
-		for (i = 0; i < param->config->num_components; i++)
-			mdp_comp_clock_off(&mdp->pdev->dev, path.comps[i].comp);
-
-		atomic_dec(&mdp->job_count);
-		wake_up(&mdp->callback_wq);
+		goto err_clock_off;
 	} else {
-		struct mdp_cmdq_cb_param *cb_param;
-		struct mdp_comp *comps;
-
 		cb_param = kzalloc(sizeof(*cb_param), GFP_KERNEL);
-		if (!cb_param)
-			return -ENOMEM;
+		if (!cb_param) {
+			ret = -ENOMEM;
+			goto err_destory_pkt;
+		}
+
 		comps = kcalloc(param->config->num_components, sizeof(*comps),
 				GFP_KERNEL);
 		if (!comps) {
-			kfree(cb_param);
 			mdp_err("%s:comps alloc fail!\n", __func__);
-			return -ENOMEM;
+			ret = -ENOMEM;
+			goto err_destory_pkt;
 		}
 
 		for (i = 0; i < param->config->num_components; i++)
@@ -493,20 +509,35 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 		cb_param->num_comps = param->config->num_components;
 		cb_param->mdp_ctx = param->mdp_ctx;
 
-		mdp_comp_clocks_on(&mdp->pdev->dev, cb_param->comps,
-				   cb_param->num_comps);
-
+		cmdq_pkt_finalize(cmd.pkt);
 		ret = cmdq_pkt_flush_async(cmd.pkt,
 					   mdp_handle_cmdq_callback,
 					   (void *)cb_param);
 		if (ret) {
 			mdp_err("%s:cmdq_pkt_flush_async fail!\n", __func__);
-			mdp_comp_clocks_off(&mdp->pdev->dev, cb_param->comps,
-					    cb_param->num_comps);
-			kfree(cb_param);
-			kfree(comps);
+			goto err_clock_off;
 		}
 	}
+	return 0;
+
+err_clock_off:
+	if (param->wait) {
+		for (i = 0; i < param->config->num_components; i++)
+			mdp_comp_clock_off(&mdp->pdev->dev, path.comps[i].comp);
+	} else {
+		mdp_comp_clocks_off(&mdp->pdev->dev, cb_param->comps,
+					    cb_param->num_comps);
+	}
+err_destory_pkt:
+	cmdq_pkt_destroy(cmd.pkt);
+	atomic_dec(&mdp->job_count);
+	if (param->wait)
+		wake_up(&mdp->callback_wq);
+	if (comps)
+		kfree(comps);
+	if (cb_param)
+		kfree(cb_param);
+
 	return ret;
 }
 
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
index 98cf54b1d92b..19f46da487aa 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
@@ -64,12 +64,12 @@ extern int mtk_mdp_debug;
 #define mdp_dbg(level, fmt, ...)\
 	do {\
 		if (mtk_mdp_debug >= (level))\
-			pr_info("[MTK-MDP3] %d %s:%d: " fmt "\n",\
+			pr_info("[MTK-MDP3] %d %s:%d: " fmt,\
 				level, __func__, __LINE__, ##__VA_ARGS__);\
 	} while (0)
 
 #define mdp_err(fmt, ...)\
-	pr_err("[MTK-MDP3][ERR] %s:%d: " fmt "\n", __func__, __LINE__,\
+	pr_err("[MTK-MDP3][ERR] %s:%d: " fmt, __func__, __LINE__,\
 		##__VA_ARGS__)
 
 #else
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
index 1ae499f6c84b..ff80f01be82f 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
@@ -133,7 +133,7 @@ static void mdp_m2m_worker(struct work_struct *work)
 	task.config = ctx->vpu.config;
 	task.param = &param;
 	task.composes[0] = &frame->compose;
-	task.wait = 1;
+	task.wait = 0;
 	task.cmdq_cb = NULL;
 	task.cb_data = NULL;
 	task.mdp_ctx = ctx;
-- 
2.18.0

