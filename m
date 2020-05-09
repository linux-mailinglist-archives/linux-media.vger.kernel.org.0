Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E2421CBC49
	for <lists+linux-media@lfdr.de>; Sat,  9 May 2020 04:03:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728487AbgEICDc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 May 2020 22:03:32 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:49136 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727828AbgEICDc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 May 2020 22:03:32 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 570131F995E743E6315E;
        Sat,  9 May 2020 10:03:28 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Sat, 9 May 2020 10:03:20 +0800
From:   Chen Zhou <chenzhou10@huawei.com>
To:     <p.zabel@pengutronix.de>, <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <chenzhou10@huawei.com>
Subject: [PATCH -next] media: coda: jpeg: add NULL check after kmalloc
Date:   Sat, 9 May 2020 10:07:11 +0800
Message-ID: <20200509020711.120975-1-chenzhou10@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes coccicheck warning:

./drivers/media/platform/coda/coda-jpeg.c:331:3-31:
	alloc with no test, possible model on line 354

Add NULL check after kmalloc.

Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
---
 drivers/media/platform/coda/coda-jpeg.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/coda/coda-jpeg.c b/drivers/media/platform/coda/coda-jpeg.c
index 00d19859db50..b11cfbe166dd 100644
--- a/drivers/media/platform/coda/coda-jpeg.c
+++ b/drivers/media/platform/coda/coda-jpeg.c
@@ -327,8 +327,11 @@ int coda_jpeg_decode_header(struct coda_ctx *ctx, struct vb2_buffer *vb)
 				 "only 8-bit quantization tables supported\n");
 			continue;
 		}
-		if (!ctx->params.jpeg_qmat_tab[i])
+		if (!ctx->params.jpeg_qmat_tab[i]) {
 			ctx->params.jpeg_qmat_tab[i] = kmalloc(64, GFP_KERNEL);
+			if (!ctx->params.jpeg_qmat_tab[i])
+				return -ENOMEM;
+		}
 		memcpy(ctx->params.jpeg_qmat_tab[i],
 		       quantization_tables[i].start, 64);
 	}
-- 
2.20.1

