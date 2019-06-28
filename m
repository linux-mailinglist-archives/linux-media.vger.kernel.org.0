Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1283B591D4
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 05:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726730AbfF1DDk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 23:03:40 -0400
Received: from mx7.zte.com.cn ([202.103.147.169]:54190 "EHLO mxct.zte.com.cn"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726542AbfF1DDj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 23:03:39 -0400
Received: from mse-fl1.zte.com.cn (unknown [10.30.14.238])
        by Forcepoint Email with ESMTPS id BBF1EA339E319CD62CE4;
        Fri, 28 Jun 2019 11:03:37 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
        by mse-fl1.zte.com.cn with ESMTP id x5S32eB1063726;
        Fri, 28 Jun 2019 11:02:40 +0800 (GMT-8)
        (envelope-from wen.yang99@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
          by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
          with ESMTP id 2019062811031122-1800719 ;
          Fri, 28 Jun 2019 11:03:11 +0800 
From:   Wen Yang <wen.yang99@zte.com.cn>
To:     linux-kernel@vger.kernel.org
Cc:     wang.yi59@zte.com.cn, Wen Yang <wen.yang99@zte.com.cn>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 2/3] media: exynos4-is: fix leaked of_node references
Date:   Fri, 28 Jun 2019 11:01:15 +0800
Message-Id: <1561690876-20977-3-git-send-email-wen.yang99@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1561690876-20977-1-git-send-email-wen.yang99@zte.com.cn>
References: <1561690876-20977-1-git-send-email-wen.yang99@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release 8.5.3FP6|November
 21, 2013) at 2019-06-28 11:03:11,
        Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2019-06-28 11:02:45,
        Serialize complete at 2019-06-28 11:02:45
X-MAIL: mse-fl1.zte.com.cn x5S32eB1063726
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The call to of_get_child_by_name returns a node pointer with refcount
incremented thus it must be explicitly decremented after the last
usage.

Detected by coccinelle with the following warnings:
drivers/media/platform/exynos4-is/fimc-is.c:813:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 807, but without a corresponding object release within this function.
drivers/media/platform/exynos4-is/fimc-is.c:870:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 807, but without a corresponding object release within this function.
drivers/media/platform/exynos4-is/fimc-is.c:885:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 807, but without a corresponding object release within this function.
drivers/media/platform/exynos4-is/media-dev.c:545:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 541, but without a corresponding object release within this function.
drivers/media/platform/exynos4-is/media-dev.c:528:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 499, but without a corresponding object release within this function.
drivers/media/platform/exynos4-is/media-dev.c:534:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 499, but without a corresponding object release within this function.

Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/media/platform/exynos4-is/fimc-is.c   | 1 +
 drivers/media/platform/exynos4-is/media-dev.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/media/platform/exynos4-is/fimc-is.c b/drivers/media/platform/exynos4-is/fimc-is.c
index e043d55..b7cc8e6 100644
--- a/drivers/media/platform/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/exynos4-is/fimc-is.c
@@ -806,6 +806,7 @@ static int fimc_is_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	is->pmu_regs = of_iomap(node, 0);
+	of_node_put(node);
 	if (!is->pmu_regs)
 		return -ENOMEM;
 
diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
index d53427a..a838189 100644
--- a/drivers/media/platform/exynos4-is/media-dev.c
+++ b/drivers/media/platform/exynos4-is/media-dev.c
@@ -501,6 +501,7 @@ static int fimc_md_register_sensor_entities(struct fimc_md *fmd)
 			continue;
 
 		ret = fimc_md_parse_port_node(fmd, port, index);
+		of_node_put(port);
 		if (ret < 0) {
 			of_node_put(node);
 			goto cleanup;
@@ -542,6 +543,7 @@ static int __of_get_csis_id(struct device_node *np)
 	if (!np)
 		return -EINVAL;
 	of_property_read_u32(np, "reg", &reg);
+	of_node_put(np);
 	return reg - FIMC_INPUT_MIPI_CSI2_0;
 }
 
-- 
2.9.5

