Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A19F63B14CA
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 09:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230308AbhFWHia (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 03:38:30 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:47029 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230185AbhFWHiV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 03:38:21 -0400
X-UUID: 35c07978e10a4887b812a0db3c03beee-20210623
X-UUID: 35c07978e10a4887b812a0db3c03beee-20210623
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <moudy.ho@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 658592435; Wed, 23 Jun 2021 15:35:59 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
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
Subject: [RFC PATCH V0 10/10] media: mtk-mdp3: Adjust related settings for 5.13-rc1
Date:   Wed, 23 Jun 2021 15:35:49 +0800
Message-ID: <20210623073549.24170-10-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210623073549.24170-1-moudy.ho@mediatek.com>
References: <20210623073549.24170-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: mtk18742 <moudy.ho@mediatek.com>

1. remove cmdq_pkt_flush usage.
2. remove VFL_TYPE_GRABBER enum.
3. remove undefined format
4. Adjust CMDQ API param.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../media/platform/mtk-mdp3/mmsys_reg_base.h  |  2 +-
 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   | 92 +++++++------------
 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.h   |  3 +-
 .../media/platform/mtk-mdp3/mtk-mdp3-core.c   |  2 +-
 .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |  3 +-
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   |  2 +-
 6 files changed, 39 insertions(+), 65 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp3/mmsys_reg_base.h b/drivers/media/platform/mtk-mdp3/mmsys_reg_base.h
index d79b82eea61b..738ecd525474 100644
--- a/drivers/media/platform/mtk-mdp3/mmsys_reg_base.h
+++ b/drivers/media/platform/mtk-mdp3/mmsys_reg_base.h
@@ -16,7 +16,7 @@
 			(0xffffffff) : (mask), ##__VA_ARGS__)
 
 #define MM_REG_WAIT(cmd, evt) \
-	cmdq_pkt_wfe(cmd->pkt, cmd->event[(evt)])
+	cmdq_pkt_wfe(cmd->pkt, cmd->event[(evt)], true)
 
 #define MM_REG_WAIT_NO_CLEAR(cmd, evt) \
 	cmdq_pkt_wait_no_clear(cmd->pkt, cmd->event[(evt)])
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
index eac10944283a..151485933eae 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
@@ -468,71 +468,48 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 		goto err_destory_pkt;
 	}
 
-	if (param->wait) {
-		ret = cmdq_pkt_flush(cmd.pkt);
-#ifdef MDP_DEBUG
-		if (ret) {
-			struct mdp_func_struct *p_func = mdp_get_func();
-
-			p_func->mdp_dump_mmsys_config();
-			mdp_dump_info(~0, 1);
-		}
-#endif
-		if (!ret) { /* error handle in mdp_m2m_worker */
-			if (param->mdp_ctx)
-				mdp_m2m_job_finish(param->mdp_ctx);
-		}
-		goto err_clock_off;
-	} else {
-		cb_param = kzalloc(sizeof(*cb_param), GFP_KERNEL);
-		if (!cb_param) {
-			ret = -ENOMEM;
-			goto err_destory_pkt;
-		}
+	cb_param = kzalloc(sizeof(*cb_param), GFP_KERNEL);
+	if (!cb_param) {
+		ret = -ENOMEM;
+		goto err_destory_pkt;
+	}
 
-		comps = kcalloc(param->config->num_components, sizeof(*comps),
-				GFP_KERNEL);
-		if (!comps) {
-			mdp_err("%s:comps alloc fail!\n", __func__);
-			ret = -ENOMEM;
-			goto err_destory_pkt;
-		}
+	comps = kcalloc(param->config->num_components, sizeof(*comps),
+			GFP_KERNEL);
+	if (!comps) {
+		mdp_err("%s:comps alloc fail!\n", __func__);
+		ret = -ENOMEM;
+		goto err_destory_pkt;
+	}
 
-		for (i = 0; i < param->config->num_components; i++)
-			memcpy(&comps[i], path.comps[i].comp,
-			       sizeof(struct mdp_comp));
-		cb_param->mdp = mdp;
-		cb_param->user_cmdq_cb = param->cmdq_cb;
-		cb_param->user_cb_data = param->cb_data;
-		cb_param->pkt = cmd.pkt;
-		cb_param->comps = comps;
-		cb_param->num_comps = param->config->num_components;
-		cb_param->mdp_ctx = param->mdp_ctx;
-
-		cmdq_pkt_finalize(cmd.pkt);
-		ret = cmdq_pkt_flush_async(cmd.pkt,
-					   mdp_handle_cmdq_callback,
-					   (void *)cb_param);
-		if (ret) {
-			mdp_err("%s:cmdq_pkt_flush_async fail!\n", __func__);
-			goto err_clock_off;
-		}
+	for (i = 0; i < param->config->num_components; i++)
+		memcpy(&comps[i], path.comps[i].comp,
+		       sizeof(struct mdp_comp));
+	cb_param->mdp = mdp;
+	cb_param->user_cmdq_cb = param->cmdq_cb;
+	cb_param->user_cb_data = param->cb_data;
+	cb_param->pkt = cmd.pkt;
+	cb_param->comps = comps;
+	cb_param->num_comps = param->config->num_components;
+	cb_param->mdp_ctx = param->mdp_ctx;
+
+	cmdq_pkt_finalize(cmd.pkt);
+	ret = cmdq_pkt_flush_async(cmd.pkt,
+				   mdp_handle_cmdq_callback,
+				   (void *)cb_param);
+	if (ret) {
+		mdp_err("%s:cmdq_pkt_flush_async fail!\n", __func__);
+		goto err_clock_off;
 	}
 	return 0;
 
 err_clock_off:
-	if (param->wait) {
-		for (i = 0; i < param->config->num_components; i++)
-			mdp_comp_clock_off(&mdp->pdev->dev, path.comps[i].comp);
-	} else {
-		mdp_comp_clocks_off(&mdp->pdev->dev, cb_param->comps,
-					    cb_param->num_comps);
-	}
+	mdp_comp_clocks_off(&mdp->pdev->dev, cb_param->comps,
+				    cb_param->num_comps);
 err_destory_pkt:
 	cmdq_pkt_destroy(cmd.pkt);
 	atomic_dec(&mdp->job_count);
-	if (param->wait)
-		wake_up(&mdp->callback_wq);
+	wake_up(&mdp->callback_wq);
 	if (comps)
 		kfree(comps);
 	if (cb_param)
@@ -543,7 +520,7 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 
 int mdp_cmdq_sendtask(struct platform_device *pdev, struct img_config *config,
 		      struct img_ipi_frameparam *param,
-		      struct v4l2_rect *compose, unsigned int wait,
+		      struct v4l2_rect *compose,
 		      void (*cmdq_cb)(struct cmdq_cb_data data), void *cb_data)
 {
 	struct mdp_dev *mdp = platform_get_drvdata(pdev);
@@ -551,7 +528,6 @@ int mdp_cmdq_sendtask(struct platform_device *pdev, struct img_config *config,
 		.config = config,
 		.param = param,
 		.composes[0] = compose,
-		.wait = wait,
 		.cmdq_cb = cmdq_cb,
 		.cb_data = cb_data,
 	};
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.h
index 6b8b0f6b4bb5..f6394d3d0358 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.h
@@ -16,7 +16,7 @@ struct platform_device *mdp_get_plat_device(struct platform_device *pdev);
 
 int mdp_cmdq_sendtask(struct platform_device *pdev, struct img_config *config,
 		      struct img_ipi_frameparam *param,
-		      struct v4l2_rect *compose, unsigned int wait,
+		      struct v4l2_rect *compose,
 		      void (*cmdq_cb)(struct cmdq_cb_data data), void *cb_data);
 
 struct mdp_cmd {
@@ -28,7 +28,6 @@ struct mdp_cmdq_param {
 	struct img_config *config;
 	struct img_ipi_frameparam *param;
 	const struct v4l2_rect *composes[IMG_MAX_HW_OUTPUTS];
-	unsigned int wait;
 
 	void (*cmdq_cb)(struct cmdq_cb_data data);
 	void *cb_data;
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
index 207b55ace97b..a42e436d3a8c 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
@@ -137,7 +137,7 @@ static int mdp_probe(struct platform_device *pdev)
 	mutex_init(&mdp->vpu_lock);
 	mutex_init(&mdp->m2m_lock);
 
-	mdp->cmdq_clt = cmdq_mbox_create(dev, 0, 1200);
+	mdp->cmdq_clt = cmdq_mbox_create(dev, 0);
 	if (IS_ERR(mdp->cmdq_clt)) {
 		ret = PTR_ERR(mdp->cmdq_clt);
 		goto err_put_scp;
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
index ff80f01be82f..536574f6bc32 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
@@ -133,7 +133,6 @@ static void mdp_m2m_worker(struct work_struct *work)
 	task.config = ctx->vpu.config;
 	task.param = &param;
 	task.composes[0] = &frame->compose;
-	task.wait = 0;
 	task.cmdq_cb = NULL;
 	task.cb_data = NULL;
 	task.mdp_ctx = ctx;
@@ -769,7 +768,7 @@ int mdp_m2m_device_register(struct mdp_dev *mdp)
 		goto err_m2m_init;
 	}
 
-	ret = video_register_device(mdp->m2m_vdev, VFL_TYPE_GRABBER, 2);
+	ret = video_register_device(mdp->m2m_vdev, VFL_TYPE_VIDEO, 2);
 	if (ret) {
 		dev_err(dev, "Failed to register video device\n");
 		goto err_video_register;
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
index 5c48a7e75efd..0c4c942b5f9c 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
@@ -168,7 +168,7 @@ static const struct mdp_format mdp_formats[] = {
 		.halign		= 5,
 		.flags		= MDP_FMT_FLAG_OUTPUT,
 	}, {
-		.pixelformat	= V4L2_PIX_FMT_MM21,
+		.pixelformat	= V4L2_PIX_FMT_NV12MT,
 		.mdp_color	= MDP_COLOR_420_BLK,
 		.depth		= { 8, 4 },
 		.row_depth	= { 8, 8 },
-- 
2.18.0

