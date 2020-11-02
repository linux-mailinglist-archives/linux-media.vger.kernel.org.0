Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6DBA2A2C7F
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 15:18:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbgKBOSQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Nov 2020 09:18:16 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:7444 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726202AbgKBOSP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Nov 2020 09:18:15 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CPw4M6rmYzhd6b;
        Mon,  2 Nov 2020 22:18:11 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Mon, 2 Nov 2020
 22:18:07 +0800
From:   Zhang Qilong <zhangqilong3@huawei.com>
To:     <helen.koike@collabora.com>, <dafna.hirschfeld@collabora.com>,
        <mchehab@kernel.org>
CC:     <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devel@driverdev.osuosl.org>
Subject: [PATCH -next] media: staging: rkisp1: cap: fix runtime PM imbalance on error
Date:   Mon, 2 Nov 2020 22:28:52 +0800
Message-ID: <20201102142852.141189-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

pm_runtime_get_sync will increment pm usage counter even it
failed. Forgetting to pm_runtime_put_noidle will result in
reference imbalance in rkisp1_vb2_start_streaming, so we
should fix it.

Fixes: 56e3b29f9f6b2 ("media: staging: rkisp1: add streaming paths")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 drivers/staging/media/rkisp1/rkisp1-capture.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
index b6f497ce3e95..0c934ca5adaa 100644
--- a/drivers/staging/media/rkisp1/rkisp1-capture.c
+++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
@@ -992,6 +992,7 @@ rkisp1_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
 
 	ret = pm_runtime_get_sync(cap->rkisp1->dev);
 	if (ret < 0) {
+		pm_runtime_put_noidle(cap->rkisp1->dev);
 		dev_err(cap->rkisp1->dev, "power up failed %d\n", ret);
 		goto err_destroy_dummy;
 	}
-- 
2.17.1

