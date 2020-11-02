Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAE6C2A2C63
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 15:16:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbgKBOPx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Nov 2020 09:15:53 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:6735 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbgKBOPw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Nov 2020 09:15:52 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CPw1T1Mdqzkb8p;
        Mon,  2 Nov 2020 22:15:41 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Mon, 2 Nov 2020
 22:15:38 +0800
From:   Zhang Qilong <zhangqilong3@huawei.com>
To:     <mripard@kernel.org>, <paul.kocialkowski@bootlin.com>,
        <mchehab@kernel.org>, <wens@csie.org>
CC:     <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devel@driverdev.osuosl.org>
Subject: [PATCH -next] media: cedrus: fix reference leak in cedrus_start_streaming
Date:   Mon, 2 Nov 2020 22:26:22 +0800
Message-ID: <20201102142622.140001-1-zhangqilong3@huawei.com>
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
reference leak in cedrus_start_streaming. We should fix it.

Fixes: d5aecd289babf ("media: cedrus: Implement runtime PM")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_video.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index 667b86dde1ee..911f607d9b09 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -479,8 +479,10 @@ static int cedrus_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	if (V4L2_TYPE_IS_OUTPUT(vq->type)) {
 		ret = pm_runtime_get_sync(dev->dev);
-		if (ret < 0)
+		if (ret < 0) {
+			pm_runtime_put_noidle(dev->dev);
 			goto err_cleanup;
+		}
 
 		if (dev->dec_ops[ctx->current_codec]->start) {
 			ret = dev->dec_ops[ctx->current_codec]->start(ctx);
-- 
2.17.1

