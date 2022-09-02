Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5101C5AAA8B
	for <lists+linux-media@lfdr.de>; Fri,  2 Sep 2022 10:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235879AbiIBIrx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Sep 2022 04:47:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236037AbiIBIrS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Sep 2022 04:47:18 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3071C2766;
        Fri,  2 Sep 2022 01:47:13 -0700 (PDT)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MJrzQ0ZZ9zkWsf;
        Fri,  2 Sep 2022 16:43:30 +0800 (CST)
Received: from kwepemm600010.china.huawei.com (7.193.23.86) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 2 Sep 2022 16:47:12 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600010.china.huawei.com
 (7.193.23.86) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 2 Sep
 2022 16:47:09 +0800
From:   Sun Ke <sunke32@huawei.com>
To:     <mchehab@kernel.org>, <matthias.bgg@gmail.com>,
        <hverkuil-cisco@xs4all.nl>, <ping-hsun.wu@mediatek.com>,
        <daoyuan.huang@mediatek.com>, <moudy.ho@mediatek.com>
CC:     <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>, <sunke32@huawei.com>
Subject: [PATCH 0/3] three fixes for mtk-mdp3
Date:   Fri, 2 Sep 2022 16:58:17 +0800
Message-ID: <20220902085820.3777360-1-sunke32@huawei.com>
X-Mailer: git-send-email 2.31.1
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

three fixes for mtk-mdp3

Sun Ke (3):
  media: platform: mtk-mdp3: use devm_kfree to free memory allocated
    with devm_kmalloc()
  media: platform: mtk-mdp3: fix PM reference leak in
    mdp_comp_clock_on()
  media: platform: mtk-mdp3: fix error return code in mdp_vpu_dev_init()

 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c | 7 ++++---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c  | 1 +
 2 files changed, 5 insertions(+), 3 deletions(-)

-- 
2.31.1

