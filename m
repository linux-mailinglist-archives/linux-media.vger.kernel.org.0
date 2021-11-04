Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B92764452F5
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 13:24:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231270AbhKDM1R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 08:27:17 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:41678 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231137AbhKDM1R (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Nov 2021 08:27:17 -0400
X-UUID: 06b80ee489ee47bdbc4de284346ce807-20211104
X-UUID: 06b80ee489ee47bdbc4de284346ce807-20211104
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 80758421; Thu, 04 Nov 2021 20:24:31 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 4 Nov 2021 20:24:29 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs10n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 4 Nov 2021 20:24:28 +0800
From:   Yunfei Dong <yunfei.dong@mediatek.com>
To:     Steve Cho <stevecho@google.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
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
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Steve Cho <stevecho@chromium.org>
Subject: [PATCH v3] media: mtk-vcodec: Align width and height to 64 bytes
Date:   Thu, 4 Nov 2021 20:24:26 +0800
Message-ID: <20211104122426.9597-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Width and height need to 64 bytes aligned when setting the format.
Need to make sure all is 64 bytes align when use width and height to
calculate buffer size.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Tested-by: Steve Cho <stevecho@chromium.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h        | 1 +
 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
index e30806c1faea..66cd6d2242c3 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
@@ -11,6 +11,7 @@
 #include <media/videobuf2-core.h>
 #include <media/v4l2-mem2mem.h>
 
+#define VCODEC_DEC_ALIGNED_64 64
 #define VCODEC_CAPABILITY_4K_DISABLED	0x10
 #define VCODEC_DEC_4K_CODED_WIDTH	4096U
 #define VCODEC_DEC_4K_CODED_HEIGHT	2304U
diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
index d402fc4bda69..e1a3011772a9 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
@@ -562,8 +562,8 @@ static void get_pic_info(struct vdec_h264_slice_inst *inst,
 {
 	struct mtk_vcodec_ctx *ctx = inst->ctx;
 
-	ctx->picinfo.buf_w = (ctx->picinfo.pic_w + 15) & 0xFFFFFFF0;
-	ctx->picinfo.buf_h = (ctx->picinfo.pic_h + 31) & 0xFFFFFFE0;
+	ctx->picinfo.buf_w = ALIGN(ctx->picinfo.pic_w, VCODEC_DEC_ALIGNED_64);
+	ctx->picinfo.buf_h = ALIGN(ctx->picinfo.pic_h, VCODEC_DEC_ALIGNED_64);
 	ctx->picinfo.fb_sz[0] = ctx->picinfo.buf_w * ctx->picinfo.buf_h;
 	ctx->picinfo.fb_sz[1] = ctx->picinfo.fb_sz[0] >> 1;
 	inst->vsi_ctx.dec.cap_num_planes =
-- 
2.25.1

