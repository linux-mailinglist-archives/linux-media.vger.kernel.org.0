Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CDFBAA8AE
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 18:20:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387501AbfIEQSF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 12:18:05 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:34954 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731806AbfIEQSD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Sep 2019 12:18:03 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 12BB16B0AF36F1F33C01;
        Fri,  6 Sep 2019 00:18:01 +0800 (CST)
Received: from linux-ibm.site (10.175.102.37) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.439.0; Fri, 6 Sep 2019 00:18:39 +0800
From:   zhong jiang <zhongjiang@huawei.com>
To:     <mchehab@kernel.org>
CC:     <hansverk@cisco.com>, <daniel.vetter@ffwll.ch>,
        <zhongjiang@huawei.com>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/4] media: v4l2-dv-timings: Use DIV_ROUND_CLOSEST directly to make it readable
Date:   Fri, 6 Sep 2019 00:14:52 +0800
Message-ID: <1567700092-27769-5-git-send-email-zhongjiang@huawei.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <1567700092-27769-1-git-send-email-zhongjiang@huawei.com>
References: <1567700092-27769-1-git-send-email-zhongjiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.102.37]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The kernel.h macro DIV_ROUND_CLOSEST performs the computation (x + d/2)/d
but is perhaps more readable.

Signed-off-by: zhong jiang <zhongjiang@huawei.com>
---
 drivers/media/v4l2-core/v4l2-dv-timings.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-dv-timings.c b/drivers/media/v4l2-core/v4l2-dv-timings.c
index 4f23e93..2b399c0 100644
--- a/drivers/media/v4l2-core/v4l2-dv-timings.c
+++ b/drivers/media/v4l2-core/v4l2-dv-timings.c
@@ -757,7 +757,7 @@ bool v4l2_detect_gtf(unsigned frame_height,
 	pix_clk = pix_clk / GTF_PXL_CLK_GRAN * GTF_PXL_CLK_GRAN;
 
 	hsync = (frame_width * 8 + 50) / 100;
-	hsync = ((hsync + GTF_CELL_GRAN / 2) / GTF_CELL_GRAN) * GTF_CELL_GRAN;
+	hsync = DIV_ROUND_CLOSEST(hsync, GTF_CELL_GRAN) * GTF_CELL_GRAN;
 
 	h_fp = h_blank / 2 - hsync;
 
-- 
1.7.12.4

