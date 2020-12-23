Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB30D2E12B6
	for <lists+linux-media@lfdr.de>; Wed, 23 Dec 2020 03:27:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728616AbgLWCXl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 21:23:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:52508 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730049AbgLWCXj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 21:23:39 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id AAC77229C5;
        Wed, 23 Dec 2020 02:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608690204;
        bh=HBFKJRUNnuRB3+JHTHYEaqddBshl2Ypix3QmFmjnWHQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bCWxfudhbO/YuiUl71Kc02Aq14JhKiEW5qSAe4gNsU1InhcQs/Usu4o9kk2x8WDUr
         jJN4MvzhepqKKZ7hkLmZ3LKv+L0BArWy9YN6OzXNZ0hRilqizBbFrHBt51F79NIO9h
         qFwLXbwBmV0WtwJpNA54LKWb+icFu4hS5/Re662gO5hHg3Szzgj8G51mv5O4i1i0Kb
         Jsb/7J0/yA4Xzz5Q5dx2beuG+83D2ICFnADX/RSwtJ7jRlkKcNP0f0HSPe40HIhY6G
         hm2CLtEJJb6xCpxFjCqqeBzT2NVYPgPfaL+ehdo4VlMJ+ULu+bwGShrRZuwuIjMwlq
         u2jIKE+bZZTlA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Qinglang Miao <miaoqinglang@huawei.com>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 25/66] media: usb: dvb-usb-v2: zd1301: fix missing platform_device_unregister()
Date:   Tue, 22 Dec 2020 21:22:11 -0500
Message-Id: <20201223022253.2793452-25-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223022253.2793452-1-sashal@kernel.org>
References: <20201223022253.2793452-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Qinglang Miao <miaoqinglang@huawei.com>

[ Upstream commit ee50d6e60d9a8e110e984cdd9e788d93eff540ba ]

Add the missing platform_device_unregister() before return
from zd1301_frontend_attach in the error handling case when
pdev->dev.driver is empty.

There's an error handling route named err_platform_device_unregister,
so just reuse it.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
Signed-off-by: Sean Young <sean@mess.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/usb/dvb-usb-v2/zd1301.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb-v2/zd1301.c b/drivers/media/usb/dvb-usb-v2/zd1301.c
index d1eb4b7bc0519..563d11fb6c18c 100644
--- a/drivers/media/usb/dvb-usb-v2/zd1301.c
+++ b/drivers/media/usb/dvb-usb-v2/zd1301.c
@@ -159,7 +159,7 @@ static int zd1301_frontend_attach(struct dvb_usb_adapter *adap)
 	}
 	if (!pdev->dev.driver) {
 		ret = -ENODEV;
-		goto err;
+		goto err_platform_device_unregister;
 	}
 	if (!try_module_get(pdev->dev.driver->owner)) {
 		ret = -ENODEV;
-- 
2.27.0

