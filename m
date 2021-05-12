Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DFF737B496
	for <lists+linux-media@lfdr.de>; Wed, 12 May 2021 05:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230023AbhELDhE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 May 2021 23:37:04 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2786 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbhELDhE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 May 2021 23:37:04 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Fg0jF1nVHzmg9Y;
        Wed, 12 May 2021 11:32:33 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.98) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Wed, 12 May 2021 11:35:45 +0800
From:   Pu Lehui <pulehui@huawei.com>
To:     <s.nawrocki@samsung.com>, <mchehab@kernel.org>,
        <krzysztof.kozlowski@canonical.com>
CC:     <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <pulehui@huawei.com>
Subject: [PATCH -next] media: exynos4-is: Fix unused variable warning
Date:   Wed, 12 May 2021 11:36:12 +0800
Message-ID: <20210512033612.39982-1-pulehui@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.174.98]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

GCC reports the following warning with W=1:

drivers/media/platform/exynos4-is/media-dev.c:1284:6: warning:
 unused variable ‘ret’ [-Wunused-variable]
 1284 |  int ret;
      |      ^~~

This variable is not used in function , this commit
remove it to fix the warning.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 drivers/media/platform/exynos4-is/media-dev.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
index e025178db06c..3b8a24bb724c 100644
--- a/drivers/media/platform/exynos4-is/media-dev.c
+++ b/drivers/media/platform/exynos4-is/media-dev.c
@@ -1284,7 +1284,6 @@ static DEVICE_ATTR(subdev_conf_mode, S_IWUSR | S_IRUGO,
 static int cam_clk_prepare(struct clk_hw *hw)
 {
 	struct cam_clk *camclk = to_cam_clk(hw);
-	int ret;
 
 	if (camclk->fmd->pmf == NULL)
 		return -ENODEV;
-- 
2.17.1

