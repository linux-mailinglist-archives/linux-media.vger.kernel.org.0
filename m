Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B57B743F5CB
	for <lists+linux-media@lfdr.de>; Fri, 29 Oct 2021 05:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231785AbhJ2D6u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Oct 2021 23:58:50 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:41968 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231899AbhJ2D6Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Oct 2021 23:58:25 -0400
X-UUID: 2240b3ab37664a23b1edab62918c5b90-20211029
X-UUID: 2240b3ab37664a23b1edab62918c5b90-20211029
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 574383761; Fri, 29 Oct 2021 11:55:53 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 29 Oct 2021 11:55:51 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkexhb02.mediatek.inc (172.21.101.103) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Oct 2021 11:55:51 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs10n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 29 Oct 2021 11:55:49 +0800
From:   Yunfei Dong <yunfei.dong@mediatek.com>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Tzung-Bi Shih" <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>
CC:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v8, 14/17] media: mtk-vcodec: Support 34bits dma address for vdec
Date:   Fri, 29 Oct 2021 11:55:24 +0800
Message-ID: <20211029035527.454-15-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029035527.454-1-yunfei.dong@mediatek.com>
References: <20211029035527.454-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the dma_set_mask_and_coherent helper to set vdec
DMA bit mask to support 34bits iova space(16GB) that
the mt8192 iommu HW support.

Whole the iova range separate to 0~4G/4G~8G/8G~12G/12G~16G,
regarding which iova range VDEC actually locate, it
depends on the dma-ranges property of vdec dtsi node.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
v8: add return value for dma_set_mask_and_coherent
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index ad8d15e07e58..7154dcea795b 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -363,6 +363,14 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (of_get_property(pdev->dev.of_node, "dma-ranges", NULL)) {
+		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
+		if (ret) {
+			mtk_v4l2_err("Failed to set mask");
+			goto err_core_workq;
+		}
+	}
+
 	for (i = 0; i < MTK_VDEC_HW_MAX; i++)
 		mutex_init(&dev->dec_mutex[i]);
 	spin_lock_init(&dev->irqlock);
-- 
2.25.1

