Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAB96C0B4D
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 20:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728300AbfI0Seu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 14:34:50 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:50492 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727243AbfI0Seu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 14:34:50 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8RIYnTB077516;
        Fri, 27 Sep 2019 13:34:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569609289;
        bh=XM3esUYtpgFCwHmCE1jUC/Gm3u55IUoVUnytr7Gb40s=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=L7RISIh1bq1ADurJMZMk69T3QUXh/ufA3HcY/PBaZEuh7nhwRkgWFaXIs9qVHPCHZ
         X16Zym44f3kksq6cAAKSUlyVqjc+G1sra0DZrOihRlkQPiLU2h61E8X9wRBPHWugaW
         99Nt6shyE4inAf8JMFVIXWdSh5LNCyx/3XIyyq38=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8RIYnDF054076
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 27 Sep 2019 13:34:49 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 27
 Sep 2019 13:34:41 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 27 Sep 2019 13:34:48 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8RIYgbu073031;
        Fri, 27 Sep 2019 13:34:48 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch 07/16] media: ti-vpe: vpe: fix a v4l2-compliance failure causing a kernel panic
Date:   Fri, 27 Sep 2019 13:36:41 -0500
Message-ID: <20190927183650.31345-8-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190927183650.31345-1-bparrot@ti.com>
References: <20190927183650.31345-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v4l2-compliance fails with this message:

   warn: v4l2-test-formats.cpp(717): \
   	TRY_FMT cannot handle an invalid pixelformat.
   test VIDIOC_TRY_FMT: FAIL

This causes the following kernel panic:

Unable to handle kernel paging request at virtual address 56595561
pgd = ecd80e00
*pgd=00000000
Internal error: Oops: 205 [#1] PREEMPT SMP ARM
...
CPU: 0 PID: 930 Comm: v4l2-compliance Not tainted \
	4.14.62-01715-gc8cd67f49a19 #1
Hardware name: Generic DRA72X (Flattened Device Tree)
task: ece44d80 task.stack: ecc6e000
PC is at __vpe_try_fmt+0x18c/0x2a8 [ti_vpe]
LR is at 0x8

Because the driver fails to properly check the 'num_planes' values for
proper ranges it ends up accessing out of bound data causing the kernel
panic.

Since this driver only handle single or dual plane pixel format, make
sure the provided value does not exceed 2 planes.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/media/platform/ti-vpe/vpe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
index bbbf11174e16..1278d457f753 100644
--- a/drivers/media/platform/ti-vpe/vpe.c
+++ b/drivers/media/platform/ti-vpe/vpe.c
@@ -1650,7 +1650,7 @@ static int __vpe_try_fmt(struct vpe_ctx *ctx, struct v4l2_format *f,
 			      &pix->height, MIN_H, MAX_H, H_ALIGN,
 			      S_ALIGN);
 
-	if (!pix->num_planes)
+	if (!pix->num_planes || pix->num_planes > 2)
 		pix->num_planes = fmt->coplanar ? 2 : 1;
 	else if (pix->num_planes > 1 && !fmt->coplanar)
 		pix->num_planes = 1;
-- 
2.17.1

