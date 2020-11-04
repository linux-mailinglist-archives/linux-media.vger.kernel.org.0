Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D362D2A6486
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 13:39:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729843AbgKDMiU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 07:38:20 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:7051 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728523AbgKDMiR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 07:38:17 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CR5m1643Gzhgl5;
        Wed,  4 Nov 2020 20:38:09 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Wed, 4 Nov 2020
 20:38:03 +0800
From:   Yu Kuai <yukuai3@huawei.com>
To:     <rick.chang@mediatek.com>, <bin.liu@mediatek.com>,
        <mchehab@kernel.org>, <matthias.bgg@gmail.com>,
        <tiffany.lin@mediatek.com>, <andrew-ct.chen@mediatek.com>,
        <xia.jiang@mediatek.com>, <hverkuil-cisco@xs4all.nl>,
        <tfiga@chromium.org>, <minghsiu.tsai@mediatek.com>,
        <jcliang@chromium.org>
CC:     <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <yukuai3@huawei.com>,
        <yi.zhang@huawei.com>
Subject: [patch V3 2/6] media: platform: add missing put_device() call in mtk_jpeg_probe() and mtk_jpeg_remove()
Date:   Wed, 4 Nov 2020 20:41:36 +0800
Message-ID: <20201104124140.3443309-3-yukuai3@huawei.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201104124140.3443309-1-yukuai3@huawei.com>
References: <20201104124140.3443309-1-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

if mtk_jpeg_clk_init() succeed, mtk_jpeg_probe() and mtk_jpeg_remove()
doesn't have a corresponding put_device(). Thus add a new helper
mtk_jpeg_clk_release() to fix it.

Fixes: b2f0d2724ba4 ("[media] vcodec: mediatek: Add Mediatek JPEG Decoder Driver")
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index 106543391c46..88a23bce569d 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -1332,6 +1332,12 @@ static void mtk_jpeg_job_timeout_work(struct work_struct *work)
 	v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
 	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
 }
+
+static inline void mtk_jpeg_clk_release(struct mtk_jpeg_dev *jpeg)
+{
+	put_device(jpeg->larb);
+}
+
 static int mtk_jpeg_probe(struct platform_device *pdev)
 {
 	struct mtk_jpeg_dev *jpeg;
@@ -1436,6 +1442,7 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 	v4l2_device_unregister(&jpeg->v4l2_dev);
 
 err_dev_register:
+	mtk_jpeg_clk_release(jpeg);
 
 err_clk_init:
 
@@ -1453,6 +1460,7 @@ static int mtk_jpeg_remove(struct platform_device *pdev)
 	video_device_release(jpeg->vdev);
 	v4l2_m2m_release(jpeg->m2m_dev);
 	v4l2_device_unregister(&jpeg->v4l2_dev);
+	mtk_jpeg_clk_release(jpeg);
 
 	return 0;
 }
-- 
2.25.4

