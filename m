Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDC2B3D72BD
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 12:12:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236326AbhG0KLo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 06:11:44 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:56940 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S236296AbhG0KLm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 06:11:42 -0400
X-UUID: 145eddae27c741538ab334b887deeb35-20210727
X-UUID: 145eddae27c741538ab334b887deeb35-20210727
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1421677960; Tue, 27 Jul 2021 18:11:40 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Jul 2021 18:11:33 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 27 Jul 2021 18:11:32 +0800
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
        Irui Wang <irui.wang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3, 06/15] media: mtk-vcodec: Use pure single core for MT8183
Date:   Tue, 27 Jul 2021 18:10:42 +0800
Message-ID: <20210727101051.24418-7-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210727101051.24418-1-yunfei.dong@mediatek.com>
References: <20210727101051.24418-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Separates different architecture for hardware: pure_sin_core
and lat_sin_core. MT8183 is pure single core. Uses .hw_arch to
distinguish.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
v3: no changes
---
 .../platform/mtk-vcodec/mtk_vcodec_dec_stateful.c    |  1 +
 .../platform/mtk-vcodec/mtk_vcodec_dec_stateless.c   |  1 +
 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h   | 12 +++++++++++-
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
index 59c24b22ab6d..61d24091c70c 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
@@ -623,4 +623,5 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata = {
 	.num_framesizes = NUM_SUPPORTED_FRAMESIZE,
 	.worker = mtk_vdec_worker,
 	.flush_decoder = mtk_vdec_flush_decoder,
+	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
 };
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
index 8f4a1f0a0769..9b6bd7c7cb0b 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
@@ -357,4 +357,5 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
 	.uses_stateless_api = true,
 	.worker = mtk_vdec_worker,
 	.flush_decoder = mtk_vdec_flush_decoder,
+	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
 };
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index d6bb723db106..b116d2452269 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -107,7 +107,7 @@ enum mtk_vdec_hw_id {
 	MTK_VDEC_LAT0,
 	MTK_VDEC_LAT1,
 	MTK_VDEC_HW_MAX,
- };
+};
 
 /*
  * struct mtk_video_fmt - Structure used to store information about pixelformats
@@ -328,6 +328,14 @@ enum mtk_chip {
 	MTK_MT8192,
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
@@ -346,6 +354,7 @@ enum mtk_chip {
  * @num_framesizes: count of video decoder frame sizes
  *
  * @chip: chip this decoder is compatible with
+ * @hw_arch: hardware arch is used to separate pure_sin_core and lat_sin_core
  *
  * @uses_stateless_api: whether the decoder uses the stateless API with requests
  */
@@ -367,6 +376,7 @@ struct mtk_vcodec_dec_pdata {
 	const int num_framesizes;
 
 	enum mtk_chip chip;
+	enum mtk_vdec_hw_arch hw_arch;
 
 	bool uses_stateless_api;
 };
-- 
2.25.1

