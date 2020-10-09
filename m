Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9BB42888D4
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 14:34:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388568AbgJIMeI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 08:34:08 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:47926 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1733269AbgJIMd7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Oct 2020 08:33:59 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 68A48B3592881A0403A0;
        Fri,  9 Oct 2020 20:33:56 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Fri, 9 Oct 2020
 20:33:46 +0800
From:   Yu Kuai <yukuai3@huawei.com>
To:     <rick.chang@mediatek.com>, <bin.liu@mediatek.com>,
        <mchehab@kernel.org>, <matthias.bgg@gmail.com>,
        <tiffany.lin@mediatek.com>, <andrew-ct.chen@mediatek.com>,
        <tfiga@chromium.org>, <xia.jiang@mediatek.com>,
        <hverkuil-cisco@xs4all.nl>, <jcliang@chromium.org>,
        <minghsiu.tsai@mediatek.com>
CC:     <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <yukuai3@huawei.com>,
        <yi.zhang@huawei.com>
Subject: [PATCH 5/7] media: mtk-vcodec: add missing put_device() call in mtk_vcodec_release_dec_pm()
Date:   Fri, 9 Oct 2020 20:38:02 +0800
Message-ID: <20201009123804.3977562-6-yukuai3@huawei.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201009123804.3977562-1-yukuai3@huawei.com>
References: <20201009123804.3977562-1-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

mtk_vcodec_release_dec_pm() will be called in two places:

a. mtk_vcodec_init_dec_pm() succeed while mtk_vcodec_probe() return error.
b. mtk_vcodec_dec_remove().

In both cases put_device() call is needed, since of_find_device_by_node()
was called in mtk_vcodec_init_dec_pm() previously.

Thus add put_devices() call in mtk_vcodec_release_dec_pm()

Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Decoder Driver")
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
index f6a6b42865fb..ddee7046ce42 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
@@ -85,6 +85,7 @@ int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
 void mtk_vcodec_release_dec_pm(struct mtk_vcodec_dev *dev)
 {
 	pm_runtime_disable(dev->pm.dev);
+	put_device(dev->pm.larbvdec);
 }
 
 void mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
-- 
2.25.4

