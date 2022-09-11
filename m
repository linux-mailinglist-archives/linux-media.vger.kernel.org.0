Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54C155B4CE6
	for <lists+linux-media@lfdr.de>; Sun, 11 Sep 2022 11:15:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbiIKJPa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Sep 2022 05:15:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230048AbiIKJPZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Sep 2022 05:15:25 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93CAC25EA7
        for <linux-media@vger.kernel.org>; Sun, 11 Sep 2022 02:15:24 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MQP9Y0Z3fz14QMK;
        Sun, 11 Sep 2022 17:11:29 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sun, 11 Sep 2022 17:15:22 +0800
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
Subject: [PATCH 3/8] media: cxd2820r: remove unused cxd2820r_debug declaration
Date:   Sun, 11 Sep 2022 17:15:14 +0800
Message-ID: <20220911091519.3212868-4-cuigaosheng1@huawei.com>
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

cxd2820r_debug has been removed since
commit 75aeafc9d0e2 ("[media] cxd2820r: switch to Kernel
dev_* logging"), so remove it.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/media/dvb-frontends/cxd2820r_priv.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/cxd2820r_priv.h b/drivers/media/dvb-frontends/cxd2820r_priv.h
index 09c42bcef971..9b4d9cf8563d 100644
--- a/drivers/media/dvb-frontends/cxd2820r_priv.h
+++ b/drivers/media/dvb-frontends/cxd2820r_priv.h
@@ -52,8 +52,6 @@ struct cxd2820r_priv {
 
 /* cxd2820r_core.c */
 
-extern int cxd2820r_debug;
-
 int cxd2820r_gpio(struct dvb_frontend *fe, u8 *gpio);
 
 int cxd2820r_wr_reg_val_mask_tab(struct cxd2820r_priv *priv,
-- 
2.25.1

