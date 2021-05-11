Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC8F37A616
	for <lists+linux-media@lfdr.de>; Tue, 11 May 2021 13:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231245AbhEKLyC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 May 2021 07:54:02 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2485 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229892AbhEKLyC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 May 2021 07:54:02 -0400
Received: from dggeml716-chm.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FfbpB3z0vzYdZD;
        Tue, 11 May 2021 19:50:26 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggeml716-chm.china.huawei.com (10.3.17.127) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 11 May 2021 19:52:53 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 11 May
 2021 19:52:53 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>
Subject: [PATCH -next] media: saa7134: Remove unnecessary INIT_LIST_HEAD()
Date:   Tue, 11 May 2021 19:55:24 +0800
Message-ID: <20210511115524.3809939-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The list_head saa7134_devlist is initialized statically.
It is unnecessary to initialize by INIT_LIST_HEAD().

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/media/pci/saa7134/saa7134-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/pci/saa7134/saa7134-core.c b/drivers/media/pci/saa7134/saa7134-core.c
index efb757d5168a..ec8dd41f9ebb 100644
--- a/drivers/media/pci/saa7134/saa7134-core.c
+++ b/drivers/media/pci/saa7134/saa7134-core.c
@@ -1524,7 +1524,6 @@ static struct pci_driver saa7134_pci_driver = {
 
 static int __init saa7134_init(void)
 {
-	INIT_LIST_HEAD(&saa7134_devlist);
 	pr_info("saa7130/34: v4l2 driver version %s loaded\n",
 	       SAA7134_VERSION);
 	return pci_register_driver(&saa7134_pci_driver);
-- 
2.25.1

