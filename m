Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 460DF2A6489
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 13:39:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729986AbgKDMiq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 07:38:46 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:7144 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729827AbgKDMiU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 07:38:20 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CR5m63xJDz15RY4;
        Wed,  4 Nov 2020 20:38:14 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Wed, 4 Nov 2020
 20:38:07 +0800
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
Subject: [patch V3 6/6] media: mtk-vcodec: add missing put_device() call in mtk_vcodec_release_enc_pm()
Date:   Wed, 4 Nov 2020 20:41:40 +0800
Message-ID: <20201104124140.3443309-7-yukuai3@huawei.com>
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

mtk_vcodec_release_enc_pm() will be called in two places:

a. mtk_vcodec_init_enc_pm() succeed while mtk_vcodec_probe() return error.
b. mtk_vcodec_enc_remove().

In both cases put_device() call is needed, since of_find_device_by_node()
was called in mtk_vcodec_init_enc_pm() previously.

Thus add put_devices() call in mtk_vcodec_release_enc_pm()

Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
index 1a047c25679f..3b7c54d6aa8f 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
@@ -108,6 +108,8 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
 
 void mtk_vcodec_release_enc_pm(struct mtk_vcodec_dev *mtkdev)
 {
+	put_device(mtkdev->pm.larbvenclt);
+	put_device(mtkdev->pm.larbvenc);
 }
 
 
-- 
2.25.4

