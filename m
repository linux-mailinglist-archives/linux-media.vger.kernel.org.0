Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21401D11E3
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2019 16:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731506AbfJIO7Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Oct 2019 10:59:24 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3673 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730955AbfJIO7X (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Oct 2019 10:59:23 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 33D8429321D2634C5162;
        Wed,  9 Oct 2019 22:59:16 +0800 (CST)
Received: from linux-ibm.site (10.175.102.37) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Wed, 9 Oct 2019 22:59:06 +0800
From:   zhong jiang <zhongjiang@huawei.com>
To:     <mchehab@kernel.org>, <sean@mess.org>, <hansverk@cisco.com>,
        <daniel.vetter@ffwll.ch>
CC:     <linux-media@vger.kernel.org>, <zhongjiang@huawei.com>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 4/4] media: v4l2-dv-timings: Use DIV_ROUND_CLOSEST directly to make it readable
Date:   Wed, 9 Oct 2019 22:55:25 +0800
Message-ID: <1570632925-14926-5-git-send-email-zhongjiang@huawei.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <1570632925-14926-1-git-send-email-zhongjiang@huawei.com>
References: <1570632925-14926-1-git-send-email-zhongjiang@huawei.com>
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

