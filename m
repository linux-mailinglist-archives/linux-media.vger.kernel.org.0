Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61EEC2888D3
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 14:34:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387495AbgJIMeH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 08:34:07 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:47858 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731368AbgJIMeB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Oct 2020 08:34:01 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 57E1DFF1D6040988F781;
        Fri,  9 Oct 2020 20:33:56 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Fri, 9 Oct 2020
 20:33:48 +0800
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
Subject: [PATCH 7/7] media: mtk-vcodec: add missing put_device() call in mtk_vcodec_release_enc_pm()
Date:   Fri, 9 Oct 2020 20:38:04 +0800
Message-ID: <20201009123804.3977562-8-yukuai3@huawei.com>
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

