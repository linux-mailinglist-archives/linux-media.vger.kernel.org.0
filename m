Return-Path: <linux-media+bounces-1063-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5FB7F970A
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 02:10:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A028B20A1F
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 01:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FCA8EC0;
	Mon, 27 Nov 2023 01:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 984E210F;
	Sun, 26 Nov 2023 17:09:59 -0800 (PST)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046050;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0Vx7PjLT_1701047396;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0Vx7PjLT_1701047396)
          by smtp.aliyun-inc.com;
          Mon, 27 Nov 2023 09:09:57 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: mchehab@kernel.org,
	jackson.lee@chipsnmedia.com,
	nas.chung@chipsnmedia.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] media: chips-media: Remove surplus dev_err() when using platform_get_irq()
Date: Mon, 27 Nov 2023 09:09:55 +0800
Message-Id: <20231127010955.605-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no need to call the dev_err() function directly to print a
custom message when handling an error from either the platform_get_irq()
or platform_get_irq_byname() functions as both are going to display an
appropriate error message in case of a failure.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=7636
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/media/platform/chips-media/wave5/wave5-vpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
index bfe4caa79cc9..3f7c622e8d58 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
@@ -209,7 +209,6 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 
 	dev->irq = platform_get_irq(pdev, 0);
 	if (dev->irq < 0) {
-		dev_err(&pdev->dev, "failed to get irq resource\n");
 		ret = -ENXIO;
 		goto err_enc_unreg;
 	}
-- 
2.20.1.7.g153144c


