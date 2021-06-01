Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E02593970AE
	for <lists+linux-media@lfdr.de>; Tue,  1 Jun 2021 11:53:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233125AbhFAJzA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Jun 2021 05:55:00 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:6111 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232958AbhFAJy7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Jun 2021 05:54:59 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FvS89279szYnRh;
        Tue,  1 Jun 2021 17:50:33 +0800 (CST)
Received: from dggpemm000001.china.huawei.com (7.185.36.245) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 1 Jun 2021 17:53:16 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm000001.china.huawei.com (7.185.36.245) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 1 Jun 2021 17:53:15 +0800
From:   Tong Tiangen <tongtiangen@huawei.com>
To:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Tong Tiangen" <tongtiangen@huawei.com>
Subject: [PATCH -next] media: rc: Fix a typo in lirc_ioctl
Date:   Tue, 1 Jun 2021 18:02:35 +0800
Message-ID: <20210601100235.69935-1-tongtiangen@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm000001.china.huawei.com (7.185.36.245)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix a typo in lirc_ioctl, apparently min_timeout should be used
in this case.

Fixes: e589333f346b ("V4L/DVB: IR: extend interfaces to support more device settings")
Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
---
 drivers/media/rc/lirc_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/lirc_dev.c b/drivers/media/rc/lirc_dev.c
index 116daf90c858..abbeae2ccd4a 100644
--- a/drivers/media/rc/lirc_dev.c
+++ b/drivers/media/rc/lirc_dev.c
@@ -534,7 +534,7 @@ static long lirc_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
 	/* Generic timeout support */
 	case LIRC_GET_MIN_TIMEOUT:
-		if (!dev->max_timeout)
+		if (!dev->min_timeout)
 			ret = -ENOTTY;
 		else
 			val = dev->min_timeout;
-- 
2.18.0.huawei.25

