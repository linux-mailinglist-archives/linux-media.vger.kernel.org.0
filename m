Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F2D92DC124
	for <lists+linux-media@lfdr.de>; Wed, 16 Dec 2020 14:23:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbgLPNXG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Dec 2020 08:23:06 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:9896 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725550AbgLPNXG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Dec 2020 08:23:06 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Cwwkv3GZxz7DN8;
        Wed, 16 Dec 2020 21:21:43 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Wed, 16 Dec 2020 21:22:12 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] media: tuners: convert comma to semicolon
Date:   Wed, 16 Dec 2020 21:22:42 +0800
Message-ID: <20201216132242.15207-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace a comma between expression statements by a semicolon.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/media/tuners/mt2060.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/tuners/mt2060.c b/drivers/media/tuners/mt2060.c
index 0e7ac2b49990..204e6186bf71 100644
--- a/drivers/media/tuners/mt2060.c
+++ b/drivers/media/tuners/mt2060.c
@@ -215,7 +215,7 @@ static int mt2060_set_params(struct dvb_frontend *fe)
 	f_lo2 = f_lo1 - freq - IF2;
 	// From the Comtech datasheet, the step used is 50kHz. The tuner chip could be more precise
 	f_lo2 = ((f_lo2 + 25) / 50) * 50;
-	priv->frequency =  (f_lo1 - f_lo2 - IF2) * 1000,
+	priv->frequency =  (f_lo1 - f_lo2 - IF2) * 1000;
 
 #ifdef MT2060_SPURCHECK
 	// LO-related spurs detection and correction
-- 
2.22.0

