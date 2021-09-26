Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A75341860F
	for <lists+linux-media@lfdr.de>; Sun, 26 Sep 2021 05:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230393AbhIZDlU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Sep 2021 23:41:20 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:48816 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230373AbhIZDlT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Sep 2021 23:41:19 -0400
X-UUID: 93ab066e138e4c8faf3e5ccefc0535ec-20210926
X-UUID: 93ab066e138e4c8faf3e5ccefc0535ec-20210926
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 716607953; Sun, 26 Sep 2021 11:39:39 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 26 Sep 2021 11:39:38 +0800
Received: from localhost.localdomain (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 26 Sep 2021 11:39:37 +0800
From:   Irui Wang <irui.wang@mediatek.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Hirokazu Honda <hiroh@google.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>
CC:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Fritz Koenig <frkoenig@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH] media: mtk-vcodec: MT8173 h264/vp8 encoder min/max bitrate settings
Date:   Sun, 26 Sep 2021 11:39:35 +0800
Message-ID: <20210926033935.9258-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Set recommend min/max bitrate range for MT8173 h264/vp8 encoder.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
This patch dependents on "Clean redundant encoder format definition",
which already accepted into linux-next.git:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/patch/?id=4093eb21538ae4f2861b26f4615939e1fa50dc67
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index 4489a9744cd7..5dce3681ce94 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -388,8 +388,8 @@ static const struct mtk_vcodec_enc_pdata mt8173_avc_pdata = {
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
 	.output_formats = mtk_video_formats_output,
 	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output),
-	.min_bitrate = 1,
-	.max_bitrate = 4000000,
+	.min_bitrate = 64,
+	.max_bitrate = 60000000,
 	.core_id = VENC_SYS,
 };
 
@@ -400,7 +400,7 @@ static const struct mtk_vcodec_enc_pdata mt8173_vp8_pdata = {
 	.output_formats = mtk_video_formats_output,
 	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output),
 	.min_bitrate = 64,
-	.max_bitrate = 4000000,
+	.max_bitrate = 9000000,
 	.core_id = VENC_LT_SYS,
 };
 
-- 
2.25.1

