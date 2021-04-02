Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 101153526FF
	for <lists+linux-media@lfdr.de>; Fri,  2 Apr 2021 09:41:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234139AbhDBHk7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Apr 2021 03:40:59 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:14675 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbhDBHk6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Apr 2021 03:40:58 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FBX3B6x2BznY8P;
        Fri,  2 Apr 2021 15:38:14 +0800 (CST)
Received: from huawei.com (10.174.28.241) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.498.0; Fri, 2 Apr 2021
 15:40:44 +0800
From:   Bixuan Cui <cuibixuan@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <skomatineni@nvidia.com>, <mchehab@kernel.org>,
        <treding@nvidia.com>, <mperttunen@nvidia.com>,
        <john.wanghui@huawei.com>
Subject: [PATCH] media: Fix compilation error
Date:   Fri, 2 Apr 2021 15:40:17 +0800
Message-ID: <20210402074017.49009-1-cuibixuan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.28.241]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix the error:

drivers/staging/media/tegra-video/vi.c:1180:4:
error: implicit declaration of function 'host1x_syncpt_free' [-Werror,-Wimplicit-function-declaration]

Fixes: 3028a00c55bf ('gpu: host1x: Cleanup and refcounting for syncpoints')
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
---
 drivers/staging/media/tegra-video/vi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 7e0cb5529b49..df5ca3596470 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1177,7 +1177,7 @@ static int tegra_channel_host1x_syncpt_init(struct tegra_vi_channel *chan)
 		mw_sp = host1x_syncpt_request(&vi->client, flags);
 		if (!mw_sp) {
 			dev_err(vi->dev, "failed to request memory ack syncpoint\n");
-			host1x_syncpt_free(fs_sp);
+			host1x_syncpt_put(fs_sp);
 			ret = -ENOMEM;
 			goto free_syncpts;
 		}
-- 
2.17.1

