Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 127D9324C67
	for <lists+linux-media@lfdr.de>; Thu, 25 Feb 2021 10:07:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236044AbhBYJGB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Feb 2021 04:06:01 -0500
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:53648 "EHLO
        out30-132.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235387AbhBYJEn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Feb 2021 04:04:43 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R621e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=alimailimapcm10staff010182156082;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0UPXQxE4_1614243838;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0UPXQxE4_1614243838)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 25 Feb 2021 17:03:58 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     mchehab@kernel.org
Cc:     s.nawrocki@samsung.com, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH] media: exynos4-is: add missing call to of_node_put()
Date:   Thu, 25 Feb 2021 17:03:56 +0800
Message-Id: <1614243836-54718-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In one of the error paths of the for_each_child_of_node() loop in
fimc_md_parse_one_endpoint, add missing call to of_node_put().

Fix the following coccicheck warning:
./drivers/media/platform/exynos4-is/media-dev.c:489:1-23: WARNING:
Function "for_each_child_of_node" should have of_node_put() before
return around line 492.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/media/platform/exynos4-is/media-dev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
index 8e1e892..467bc69 100644
--- a/drivers/media/platform/exynos4-is/media-dev.c
+++ b/drivers/media/platform/exynos4-is/media-dev.c
@@ -489,6 +489,7 @@ static int fimc_md_parse_port_node(struct fimc_md *fmd,
 	for_each_child_of_node(port, ep) {
 		ret = fimc_md_parse_one_endpoint(fmd, ep);
 		if (ret < 0)
+			of_node_put(ep);
 			return ret;
 	}
 
-- 
1.8.3.1

