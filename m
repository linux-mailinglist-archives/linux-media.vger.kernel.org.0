Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37791379DD0
	for <lists+linux-media@lfdr.de>; Tue, 11 May 2021 05:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbhEKDbv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 May 2021 23:31:51 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:2621 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbhEKDbu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 May 2021 23:31:50 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FfNg36S6xzlcqt;
        Tue, 11 May 2021 11:28:31 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Tue, 11 May 2021 11:30:33 +0800
From:   Zou Wei <zou_wei@huawei.com>
To:     <jacopo@jmondi.org>, <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Zou Wei <zou_wei@huawei.com>
Subject: [PATCH -next] media: mt9v111: Add missing MODULE_DEVICE_TABLE
Date:   Tue, 11 May 2021 11:47:36 +0800
Message-ID: <1620704856-104451-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds missing MODULE_DEVICE_TABLE definition which generates
correct modalias for automatic loading of this driver when it is built
as an external module.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
 drivers/media/i2c/mt9v111.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/mt9v111.c b/drivers/media/i2c/mt9v111.c
index 97c7527..f16e632 100644
--- a/drivers/media/i2c/mt9v111.c
+++ b/drivers/media/i2c/mt9v111.c
@@ -1260,6 +1260,7 @@ static const struct of_device_id mt9v111_of_match[] = {
 	{ .compatible = "aptina,mt9v111", },
 	{ /* sentinel */ },
 };
+MODULE_DEVICE_TABLE(of, mt9v111_of_match);
 
 static struct i2c_driver mt9v111_driver = {
 	.driver = {
-- 
2.6.2

