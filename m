Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 921E838C02F
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 09:02:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234658AbhEUHDX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 May 2021 03:03:23 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:50761 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230257AbhEUHDX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 May 2021 03:03:23 -0400
X-UUID: 26a130d21e47499fb308f8c0efedd29b-20210521
X-UUID: 26a130d21e47499fb308f8c0efedd29b-20210521
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1377951267; Fri, 21 May 2021 15:01:56 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 21 May 2021 15:01:54 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 21 May 2021 15:01:53 +0800
From:   Irui Wang <irui.wang@mediatek.com>
To:     Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yong Wu <yong.wu@mediatek.com>
CC:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Fritz Koenig <frkoenig@chromium.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4,1/6] media: mtk-vcodec: venc: remove redundant code
Date:   Fri, 21 May 2021 15:01:34 +0800
Message-ID: <20210521070139.20644-2-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210521070139.20644-1-irui.wang@mediatek.com>
References: <20210521070139.20644-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Alexandre Courbot <acourbot@chromium.org>

vidioc_try_fmt() does clamp height and width when called on the OUTPUT
queue, so clamping them prior to calling this function is redundant. Set
the queue's parameters after calling vidioc_try_fmt() so we can use the
values it computed.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 .../media/platform/mtk-vcodec/mtk_vcodec_enc.c   | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index 4831052f475d..42ff13867940 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -443,7 +443,6 @@ static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
 	struct mtk_q_data *q_data;
 	int ret, i;
 	const struct mtk_video_fmt *fmt;
-	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
 
 	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
 	if (!vq) {
@@ -468,20 +467,13 @@ static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
 		f->fmt.pix.pixelformat = fmt->fourcc;
 	}
 
-	pix_fmt_mp->height = clamp(pix_fmt_mp->height,
-				MTK_VENC_MIN_H,
-				MTK_VENC_MAX_H);
-	pix_fmt_mp->width = clamp(pix_fmt_mp->width,
-				MTK_VENC_MIN_W,
-				MTK_VENC_MAX_W);
-
-	q_data->visible_width = f->fmt.pix_mp.width;
-	q_data->visible_height = f->fmt.pix_mp.height;
-	q_data->fmt = fmt;
-	ret = vidioc_try_fmt(f, q_data->fmt);
+	ret = vidioc_try_fmt(f, fmt);
 	if (ret)
 		return ret;
 
+	q_data->fmt = fmt;
+	q_data->visible_width = f->fmt.pix_mp.width;
+	q_data->visible_height = f->fmt.pix_mp.height;
 	q_data->coded_width = f->fmt.pix_mp.width;
 	q_data->coded_height = f->fmt.pix_mp.height;
 
-- 
2.18.0

