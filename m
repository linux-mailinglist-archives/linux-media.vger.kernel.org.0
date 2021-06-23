Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B840F3B14B8
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 09:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbhFWHiQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 03:38:16 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:60972 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229978AbhFWHiQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 03:38:16 -0400
X-UUID: 78d6776bd0214c32b4edbaf1791e1ea0-20210623
X-UUID: 78d6776bd0214c32b4edbaf1791e1ea0-20210623
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <moudy.ho@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1932890681; Wed, 23 Jun 2021 15:35:55 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 15:35:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Jun 2021 15:35:53 +0800
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
Subject: [RFC PATCH V0 02/10] media: mtk-mdp3: fix redundant process done caused KE
Date:   Wed, 23 Jun 2021 15:35:41 +0800
Message-ID: <20210623073549.24170-2-moudy.ho@mediatek.com>
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

In mdp_m2m_worker, there is m2m process done in error handle,
so add statement in mdp_cmdq_send for preventing redundant
process done in cmdq_pkt_flush return fail case.

Signed-off-by: daoyuan huang <daoyuan.huang@mediatek.com>
---
 drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
index ee81a3387cf9..f8bf8fde599c 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
@@ -454,8 +454,10 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 			mdp_dump_info(~0, 1);
 		}
 #endif
-		if (param->mdp_ctx)
-			mdp_m2m_job_finish(param->mdp_ctx);
+		if (!ret) { /* error handle in mdp_m2m_worker */
+			if (param->mdp_ctx)
+				mdp_m2m_job_finish(param->mdp_ctx);
+		}
 		cmdq_pkt_destroy(cmd.pkt);
 		for (i = 0; i < param->config->num_components; i++)
 			mdp_comp_clock_off(&mdp->pdev->dev, path.comps[i].comp);
-- 
2.18.0

