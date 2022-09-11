Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6408A5B4CE9
	for <lists+linux-media@lfdr.de>; Sun, 11 Sep 2022 11:15:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbiIKJPe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Sep 2022 05:15:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbiIKJP3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Sep 2022 05:15:29 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FAEB27DD4
        for <linux-media@vger.kernel.org>; Sun, 11 Sep 2022 02:15:27 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MQP9b3wh7z14QN0;
        Sun, 11 Sep 2022 17:11:31 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sun, 11 Sep 2022 17:15:24 +0800
From:   Gaosheng Cui <cuigaosheng1@huawei.com>
To:     <crope@iki.fi>, <mchehab@kernel.org>,
        <laurent.pinchart@ideasonboard.com>,
        <kieran.bingham+renesas@ideasonboard.com>, <logans@cottsay.net>,
        <hverkuil-cisco@xs4all.nl>, <clabbe@baylibre.com>,
        <m.chehab@samsung.com>,
        <laurent.pinchart+renesas@ideasonboard.com>, <bunk@kernel.org>,
        <elezegarcia@gmail.com>, <hans.verkuil@cisco.com>,
        <linux@rainbow-software.org>, <cuigaosheng1@huawei.com>
CC:     <linux-media@vger.kernel.org>
Subject: [PATCH 7/8] [media] bttv: remove unused tea5757_set_freq declaration
Date:   Sun, 11 Sep 2022 17:15:18 +0800
Message-ID: <20220911091519.3212868-8-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220911091519.3212868-1-cuigaosheng1@huawei.com>
References: <20220911091519.3212868-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tea5757_set_freq has been removed since
commit 1b500373157c ("[media] bttv: Convert to generic
TEA575x interface").

So tea5757_set_freq is a unused declaration, remove it.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/media/pci/bt8xx/bttv.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/pci/bt8xx/bttv.h b/drivers/media/pci/bt8xx/bttv.h
index d24b9ef9f59f..eed7eeb3b963 100644
--- a/drivers/media/pci/bt8xx/bttv.h
+++ b/drivers/media/pci/bt8xx/bttv.h
@@ -289,7 +289,6 @@ extern void bttv_init_card2(struct bttv *btv);
 extern void bttv_init_tuner(struct bttv *btv);
 
 /* card-specific functions */
-extern void tea5757_set_freq(struct bttv *btv, unsigned short freq);
 extern u32 bttv_tda9880_setnorm(struct bttv *btv, u32 gpiobits);
 
 /* extra tweaks for some chipsets */
-- 
2.25.1

