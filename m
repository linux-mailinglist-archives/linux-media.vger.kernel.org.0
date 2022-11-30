Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C3DC63CFEE
	for <lists+linux-media@lfdr.de>; Wed, 30 Nov 2022 08:53:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234228AbiK3Hxh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 02:53:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234221AbiK3Hxg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 02:53:36 -0500
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEDB513E3C;
        Tue, 29 Nov 2022 23:53:34 -0800 (PST)
Received: from kwepemi500014.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NMWdw2Ht0zRpfP;
        Wed, 30 Nov 2022 15:52:52 +0800 (CST)
Received: from localhost.localdomain (10.175.112.70) by
 kwepemi500014.china.huawei.com (7.221.188.232) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 30 Nov 2022 15:53:31 +0800
From:   Qiheng Lin <linqiheng@huawei.com>
To:     <mchehab@kernel.org>, <matthias.bgg@gmail.com>
CC:     <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Qiheng Lin <linqiheng@huawei.com>
Subject: [PATCH] media: platform: mtk-mdp3: Fix return value check in mdp_probe()
Date:   Wed, 30 Nov 2022 16:13:12 +0800
Message-ID: <20221130081312.35523-1-linqiheng@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.112.70]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500014.china.huawei.com (7.221.188.232)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In case of error, the function mtk_mutex_get()
returns ERR_PTR() and never returns NULL. The NULL test in the
return value check should be replaced with IS_ERR().

Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
Signed-off-by: Qiheng Lin <linqiheng@huawei.com>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index c413e59d4286..7a2d992dd842 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -207,8 +207,8 @@ static int mdp_probe(struct platform_device *pdev)
 	}
 	for (i = 0; i < MDP_PIPE_MAX; i++) {
 		mdp->mdp_mutex[i] = mtk_mutex_get(&mm_pdev->dev);
-		if (!mdp->mdp_mutex[i]) {
-			ret = -ENODEV;
+		if (IS_ERR(mdp->mdp_mutex[i])) {
+			ret = PTR_ERR(mdp->mdp_mutex[i]);
 			goto err_return;
 		}
 	}
-- 
2.32.0

