Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EADA05AAA87
	for <lists+linux-media@lfdr.de>; Fri,  2 Sep 2022 10:48:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236084AbiIBIrw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Sep 2022 04:47:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236064AbiIBIrR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Sep 2022 04:47:17 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F31D1C276E;
        Fri,  2 Sep 2022 01:47:13 -0700 (PDT)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MJrzQ1rFKzkWtX;
        Fri,  2 Sep 2022 16:43:30 +0800 (CST)
Received: from kwepemm600010.china.huawei.com (7.193.23.86) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 2 Sep 2022 16:47:12 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600010.china.huawei.com
 (7.193.23.86) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 2 Sep
 2022 16:47:11 +0800
From:   Sun Ke <sunke32@huawei.com>
To:     <mchehab@kernel.org>, <matthias.bgg@gmail.com>,
        <hverkuil-cisco@xs4all.nl>, <ping-hsun.wu@mediatek.com>,
        <daoyuan.huang@mediatek.com>, <moudy.ho@mediatek.com>
CC:     <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>, <sunke32@huawei.com>
Subject: [PATCH 2/3] media: platform: mtk-mdp3: fix PM reference leak in mdp_comp_clock_on()
Date:   Fri, 2 Sep 2022 16:58:19 +0800
Message-ID: <20220902085820.3777360-3-sunke32@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220902085820.3777360-1-sunke32@huawei.com>
References: <20220902085820.3777360-1-sunke32@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600010.china.huawei.com (7.193.23.86)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

mdp_comp_clock_on will increase runtime PM usage counter,
and mdp_comp_clock_off will decrease the runtime PM usage counter.
so, if mdp_comp_clock_on failed after increment runtime PM usage
counter, it should decrease it before return a error code.

pm_runtime_get_sync will increment pm usage counter even it failed.
Forgetting to putting operation will result in reference leak here.
Fix it by replacing it with pm_runtime_resume_and_get to keep usage
counter balanced.

And if failed to enable clk, add pm_runtime_put() to decrease the
runtime PM usage counter.

Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
Signed-off-by: Sun Ke <sunke32@huawei.com>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
index 9a6ba5851ccb..d3eaf8884412 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
@@ -682,7 +682,7 @@ int mdp_comp_clock_on(struct device *dev, struct mdp_comp *comp)
 	int i, ret;
 
 	if (comp->comp_dev) {
-		ret = pm_runtime_get_sync(comp->comp_dev);
+		ret = pm_runtime_resume_and_get(comp->comp_dev);
 		if (ret < 0) {
 			dev_err(dev,
 				"Failed to get power, err %d. type:%d id:%d\n",
@@ -699,6 +699,7 @@ int mdp_comp_clock_on(struct device *dev, struct mdp_comp *comp)
 			dev_err(dev,
 				"Failed to enable clk %d. type:%d id:%d\n",
 				i, comp->type, comp->id);
+			pm_runtime_put(comp->comp_dev);
 			return ret;
 		}
 	}
-- 
2.31.1

