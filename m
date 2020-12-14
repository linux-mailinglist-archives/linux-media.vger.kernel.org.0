Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87D972D9939
	for <lists+linux-media@lfdr.de>; Mon, 14 Dec 2020 14:49:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403852AbgLNNtK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Dec 2020 08:49:10 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:9606 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726321AbgLNNs7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Dec 2020 08:48:59 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CvjPX43THzM4m1;
        Mon, 14 Dec 2020 21:47:28 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Mon, 14 Dec 2020 21:48:07 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <tvboxspy@gmail.com>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] media/dvb-frontends/m88rs2000: Delete useless kfree code
Date:   Mon, 14 Dec 2020 21:48:35 +0800
Message-ID: <20201214134835.5101-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The parameter of kfree function is NULL, so kfree code is useless, delete it.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/media/dvb-frontends/m88rs2000.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/media/dvb-frontends/m88rs2000.c b/drivers/media/dvb-frontends/m88rs2000.c
index 39cbb3ea1c9d..daeaf0049ccd 100644
--- a/drivers/media/dvb-frontends/m88rs2000.c
+++ b/drivers/media/dvb-frontends/m88rs2000.c
@@ -787,7 +787,7 @@ struct dvb_frontend *m88rs2000_attach(const struct m88rs2000_config *config,
 	/* allocate memory for the internal state */
 	state = kzalloc(sizeof(struct m88rs2000_state), GFP_KERNEL);
 	if (state == NULL)
-		goto error;
+		return NULL;
 
 	/* setup the state */
 	state->config = config;
@@ -801,11 +801,6 @@ struct dvb_frontend *m88rs2000_attach(const struct m88rs2000_config *config,
 			sizeof(struct dvb_frontend_ops));
 	state->frontend.demodulator_priv = state;
 	return &state->frontend;
-
-error:
-	kfree(state);
-
-	return NULL;
 }
 EXPORT_SYMBOL(m88rs2000_attach);
 
-- 
2.22.0

