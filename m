Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAC033CC1DD
	for <lists+linux-media@lfdr.de>; Sat, 17 Jul 2021 10:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233039AbhGQIQF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Jul 2021 04:16:05 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:48112 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232892AbhGQIPu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Jul 2021 04:15:50 -0400
X-UUID: 841b7f23854e44989f50634d122d1835-20210717
X-UUID: 841b7f23854e44989f50634d122d1835-20210717
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 896616059; Sat, 17 Jul 2021 16:12:51 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 16:12:49 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 17 Jul 2021 16:12:48 +0800
From:   Yunfei Dong <yunfei.dong@mediatek.com>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>
CC:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2, 11/14] media: mtk-vcodec: Support 34bits dma address for vdec
Date:   Sat, 17 Jul 2021 16:12:30 +0800
Message-ID: <20210717081233.7809-12-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210717081233.7809-1-yunfei.dong@mediatek.com>
References: <20210717081233.7809-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
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
v2: no changes
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index e05224aca888..8ae11f890101 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -443,6 +443,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 			"mtk-%s", "core");
 	}
 
+	if (of_get_property(pdev->dev.of_node, "dma-ranges", NULL))
+		dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
+
 	for (i = 0; i < MTK_VDEC_HW_MAX; i++)
 		mutex_init(&dev->dec_mutex[i]);
 	mutex_init(&dev->dev_mutex);
-- 
2.25.1

