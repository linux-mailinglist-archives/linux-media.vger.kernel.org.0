Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5396D4752B5
	for <lists+linux-media@lfdr.de>; Wed, 15 Dec 2021 07:16:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240156AbhLOGQP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Dec 2021 01:16:15 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:42342 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S240124AbhLOGQL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Dec 2021 01:16:11 -0500
X-UUID: 79d63776363746439bee8922a3c0f8e1-20211215
X-UUID: 79d63776363746439bee8922a3c0f8e1-20211215
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 2079614996; Wed, 15 Dec 2021 14:16:07 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 15 Dec 2021 14:16:05 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 15 Dec 2021 14:16:04 +0800
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
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        "Steve Cho" <stevecho@chromium.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v14, 08/19] media: mtk-vcodec: Use pure single core for MT8183
Date:   Wed, 15 Dec 2021 14:15:41 +0800
Message-ID: <20211215061552.8523-9-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215061552.8523-1-yunfei.dong@mediatek.com>
References: <20211215061552.8523-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Separates different architecture for hardware: pure_sin_core
and lat_sin_core. MT8183 is pure single core. Uses .hw_arch to
distinguish.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_dec_stateful.c      |  1 +
 .../platform/mtk-vcodec/mtk_vcodec_dec_stateless.c     |  2 ++
 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h     | 10 ++++++++++
 3 files changed, 13 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
index c7f9259ad094..04ca43c77e5f 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
@@ -626,4 +626,5 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata = {
 	.worker = mtk_vdec_worker,
 	.flush_decoder = mtk_vdec_flush_decoder,
 	.is_subdev_supported = false,
+	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
 };
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
index f76cfd07c78d..6c67b7f65f9c 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
@@ -358,6 +358,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
 	.worker = mtk_vdec_worker,
 	.flush_decoder = mtk_vdec_flush_decoder,
 	.is_subdev_supported = false,
+	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
 };
 
 /* This platform data is used for one lat and one core architecture. */
@@ -376,4 +377,5 @@ const struct mtk_vcodec_dec_pdata mtk_lat_sig_core_pdata = {
 	.worker = mtk_vdec_worker,
 	.flush_decoder = mtk_vdec_flush_decoder,
 	.is_subdev_supported = true,
+	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
 };
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 7f97fbf0f073..6d07bf997cc1 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -324,6 +324,14 @@ enum mtk_chip {
 	MTK_MT8195,
 };
 
+/**
+ * struct mtk_vdec_hw_arch - Used to separate different hardware architecture
+ */
+enum mtk_vdec_hw_arch {
+	MTK_VDEC_PURE_SINGLE_CORE,
+	MTK_VDEC_LAT_SINGLE_CORE,
+};
+
 /**
  * struct mtk_vcodec_dec_pdata - compatible data for each IC
  * @init_vdec_params: init vdec params
@@ -342,6 +350,7 @@ enum mtk_chip {
  * @num_framesizes: count of video decoder frame sizes
  *
  * @chip: chip this decoder is compatible with
+ * @hw_arch: hardware arch is used to separate pure_sin_core and lat_sin_core
  *
  * @is_subdev_supported: whether support parent-node architecture(subdev)
  * @uses_stateless_api: whether the decoder uses the stateless API with requests
@@ -364,6 +373,7 @@ struct mtk_vcodec_dec_pdata {
 	const int num_framesizes;
 
 	enum mtk_chip chip;
+	enum mtk_vdec_hw_arch hw_arch;
 
 	bool is_subdev_supported;
 	bool uses_stateless_api;
-- 
2.25.1

