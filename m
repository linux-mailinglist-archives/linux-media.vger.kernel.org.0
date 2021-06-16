Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13B643A951D
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 10:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231381AbhFPIfB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 04:35:01 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:4944 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231334AbhFPIfB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 04:35:01 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G4ddy67LPz6yBK;
        Wed, 16 Jun 2021 16:29:42 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 16 Jun 2021 16:32:52 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 16 Jun
 2021 16:32:52 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <mchehab@kernel.org>, <verkuil-cisco@xs4all.nl>
Subject: [PATCH -next] [media] saa7134: convert list_for_each to entry variant
Date:   Wed, 16 Jun 2021 16:36:45 +0800
Message-ID: <20210616083645.2523658-1-yangyingliang@huawei.com>
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

Convert list_for_each() to list_for_each_entry() where
applicable.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/media/pci/saa7134/saa7134-alsa.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/pci/saa7134/saa7134-alsa.c b/drivers/media/pci/saa7134/saa7134-alsa.c
index 7a1fb067b0e0..fb24d2ed3621 100644
--- a/drivers/media/pci/saa7134/saa7134-alsa.c
+++ b/drivers/media/pci/saa7134/saa7134-alsa.c
@@ -1215,15 +1215,13 @@ static int alsa_device_exit(struct saa7134_dev *dev)
 static int saa7134_alsa_init(void)
 {
 	struct saa7134_dev *dev = NULL;
-	struct list_head *list;
 
 	saa7134_dmasound_init = alsa_device_init;
 	saa7134_dmasound_exit = alsa_device_exit;
 
 	pr_info("saa7134 ALSA driver for DMA sound loaded\n");
 
-	list_for_each(list,&saa7134_devlist) {
-		dev = list_entry(list, struct saa7134_dev, devlist);
+	list_for_each_entry(dev, &saa7134_devlist, devlist) {
 		if (dev->pci->device == PCI_DEVICE_ID_PHILIPS_SAA7130)
 			pr_info("%s/alsa: %s doesn't support digital audio\n",
 				dev->name, saa7134_boards[dev->board].name);
-- 
2.25.1

