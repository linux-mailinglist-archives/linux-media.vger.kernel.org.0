Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B492A41BC40
	for <lists+linux-media@lfdr.de>; Wed, 29 Sep 2021 03:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243656AbhI2Bje (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Sep 2021 21:39:34 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:35872 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232041AbhI2Bjd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Sep 2021 21:39:33 -0400
X-UUID: fb0079a0a98b4a8e8b1016da144587f0-20210929
X-UUID: fb0079a0a98b4a8e8b1016da144587f0-20210929
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <yong.wu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 181317399; Wed, 29 Sep 2021 09:37:49 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Wed, 29 Sep 2021 09:37:47 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Sep 2021 09:37:46 +0800
From:   Yong Wu <yong.wu@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        David Airlie <airlied@linux.ie>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>
CC:     Evan Green <evgreen@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Will Deacon <will.deacon@arm.com>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <iommu@lists.linux-foundation.org>, <yong.wu@mediatek.com>,
        <youlin.pei@mediatek.com>, Matthias Kaehlcke <mka@chromium.org>,
        <anan.sun@mediatek.com>, <yi.kuo@mediatek.com>,
        <acourbot@chromium.org>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        "Dafna Hirschfeld" <dafna.hirschfeld@collabora.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Eizan Miyamoto <eizan@chromium.org>,
        <anthony.huang@mediatek.com>,
        Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH v8 02/12] iommu/mediatek-v1: Free the existed fwspec if the master dev already has
Date:   Wed, 29 Sep 2021 09:37:09 +0800
Message-ID: <20210929013719.25120-3-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210929013719.25120-1-yong.wu@mediatek.com>
References: <20210929013719.25120-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When the iommu master device enters of_iommu_xlate, the ops may be
NULL(iommu dev is defered), then it will initialize the fwspec here:

[<c0c9c5bc>] (dev_iommu_fwspec_set) from [<c06bda80>]
(iommu_fwspec_init+0xbc/0xd4)
[<c06bd9c4>] (iommu_fwspec_init) from [<c06c0db4>]
(of_iommu_xlate+0x7c/0x12c)
[<c06c0d38>] (of_iommu_xlate) from [<c06c10e8>]
(of_iommu_configure+0x144/0x1e8)

BUT the mtk_iommu_v1.c only supports arm32, the probing flow still is a bit
weird. We always expect create the fwspec internally. otherwise it will
enter here and return fail.

static int mtk_iommu_create_mapping(struct device *dev,
				    struct of_phandle_args *args)
{
        ...
	if (!fwspec) {
	        ....
	} else if (dev_iommu_fwspec_get(dev)->ops != &mtk_iommu_ops) {
                >>>>>>>>>>Enter here. return fail.<<<<<<<<<<<<
		return -EINVAL;
	}
	...
}

Thus, Free the existed fwspec if the master device already has fwspec.

This issue is reported at:
https://lore.kernel.org/linux-mediatek/trinity-7d9ebdc9-4849-4d93-bfb5-429dcb4ee449-1626253158870@3c-app-gmx-bs01/

Reported-by: Frank Wunderlich <frank-w@public-files.de>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu_v1.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index be22fcf988ce..1467ba1e4417 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -425,6 +425,15 @@ static struct iommu_device *mtk_iommu_probe_device(struct device *dev)
 	struct mtk_iommu_data *data;
 	int err, idx = 0;
 
+	/*
+	 * In the deferred case, free the existed fwspec.
+	 * Always initialize the fwspec internally.
+	 */
+	if (fwspec) {
+		iommu_fwspec_free(dev);
+		fwspec = dev_iommu_fwspec_get(dev);
+	}
+
 	while (!of_parse_phandle_with_args(dev->of_node, "iommus",
 					   "#iommu-cells",
 					   idx, &iommu_spec)) {
-- 
2.18.0

