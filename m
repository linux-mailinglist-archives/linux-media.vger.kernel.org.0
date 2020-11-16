Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 585CE2B45A2
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 15:17:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729558AbgKPOPc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 09:15:32 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:7924 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728816AbgKPOPb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 09:15:31 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CZWLS6vL1z6wJ1;
        Mon, 16 Nov 2020 22:15:12 +0800 (CST)
Received: from localhost.localdomain (10.175.101.6) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Mon, 16 Nov 2020 22:15:19 +0800
From:   Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
To:     <zhangxiaoxu5@huawei.com>, <mchehab@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <m.felsch@pengutronix.de>,
        <jacopo+renesas@jmondi.org>, <gustavoars@kernel.org>,
        <linux-media@vger.kernel.org>
Subject: [PATCH] media: tvp5150: Fix wrong return value of tvp5150_parse_dt()
Date:   Mon, 16 Nov 2020 09:18:01 -0500
Message-ID: <20201116141801.3601713-1-zhangxiaoxu5@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If of_graph_get_endpoint_by_regs() return NULL, it will return 0 rather
than an errno, because we doesn't initialize the return value.

Fixes: 0556f1d580d4 ("media: tvp5150: add input source selection of_graph support")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
---
 drivers/media/i2c/tvp5150.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index 7d9401219a3a..3b3221fd3fe8 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -2082,6 +2082,7 @@ static int tvp5150_parse_dt(struct tvp5150 *decoder, struct device_node *np)
 
 	ep_np = of_graph_get_endpoint_by_regs(np, TVP5150_PAD_VID_OUT, 0);
 	if (!ep_np) {
+		ret = -EINVAL;
 		dev_err(dev, "Error no output endpoint available\n");
 		goto err_free;
 	}
-- 
2.25.4

