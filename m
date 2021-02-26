Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D663B325B4B
	for <lists+linux-media@lfdr.de>; Fri, 26 Feb 2021 02:29:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbhBZB3Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Feb 2021 20:29:25 -0500
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:40495 "EHLO
        out30-132.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229508AbhBZB3Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Feb 2021 20:29:25 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04420;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0UPaXT4q_1614302921;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0UPaXT4q_1614302921)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 26 Feb 2021 09:28:42 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     mchehab@kernel.org
Cc:     krzk@kernel.org, s.nawrocki@samsung.com,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH v2] media: exynos4-is: add missing call to of_node_put()
Date:   Fri, 26 Feb 2021 09:28:40 +0800
Message-Id: <1614302920-19505-1-git-send-email-yang.lee@linux.alibaba.com>
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

Changes in v2:
-add braces for if

 drivers/media/platform/exynos4-is/media-dev.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
index 8e1e892..a6ee2a3 100644
--- a/drivers/media/platform/exynos4-is/media-dev.c
+++ b/drivers/media/platform/exynos4-is/media-dev.c
@@ -488,8 +488,10 @@ static int fimc_md_parse_port_node(struct fimc_md *fmd,
 
 	for_each_child_of_node(port, ep) {
 		ret = fimc_md_parse_one_endpoint(fmd, ep);
-		if (ret < 0)
+		if (ret < 0) {
+			of_node_put(ep);
 			return ret;
+		}
 	}
 
 	return 0;
-- 
1.8.3.1

