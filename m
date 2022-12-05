Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 783BE642902
	for <lists+linux-media@lfdr.de>; Mon,  5 Dec 2022 14:13:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231168AbiLENNo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Dec 2022 08:13:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230092AbiLENNn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Dec 2022 08:13:43 -0500
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CC78D132
        for <linux-media@vger.kernel.org>; Mon,  5 Dec 2022 05:13:38 -0800 (PST)
Received: from kwepemm600018.china.huawei.com (unknown [172.30.72.53])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4NQkVn2LF7z15MZ2;
        Mon,  5 Dec 2022 21:12:49 +0800 (CST)
Received: from huawei.com (10.174.176.88) by kwepemm600018.china.huawei.com
 (7.193.23.140) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 5 Dec
 2022 21:13:35 +0800
From:   gaochao <gaochao49@huawei.com>
To:     <mchehab@kernel.org>, <v4l@cerqueira.org>,
        <linux-media@vger.kernel.org>, <gaochao49@huawei.com>
Subject: [PATCH v2] media: pci: cx88: Fix missing pci_disable_device() when cx88_core_get() returns null
Date:   Mon, 5 Dec 2022 21:13:34 +0800
Message-ID: <20221205131334.1270-1-gaochao49@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20221205062757.1749-1-gaochao49@huawei.com>
References: <20221205062757.1749-1-gaochao49@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.176.88]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600018.china.huawei.com (7.193.23.140)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Gao Chao <gaochao49@huawei.com>

commit a8782f669c35 ("V4L/DVB (9796): drivers/media/video/cx88/cx88-alsa.c:
Adjust error-handling code") added fail path. However, when cx88_core_get()
returns null with chip->pci has not been setted, snd_cx88_dev_free() won't
call a valid pci_disable_device() due to invalid chip->pci. Move the
assignment of chip->pci forward to ensure snd_cx88_dev_free() can get
valid chip->pci.

Fixes: b7f355d23c34 ("V4L/DVB (3293): Added digital support for cx88 (cx88-alsa)")
Signed-off-by: Gao Chao <gaochao49@huawei.com>

v2:
- move the assignment of chip->pci after chip = card->private_data
---
 drivers/media/pci/cx88/cx88-alsa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/cx88/cx88-alsa.c b/drivers/media/pci/cx88/cx88-alsa.c
index 29fb1311e443..22fe8c48a853 100644
--- a/drivers/media/pci/cx88/cx88-alsa.c
+++ b/drivers/media/pci/cx88/cx88-alsa.c
@@ -861,6 +861,7 @@ static int snd_cx88_create(struct snd_card *card, struct pci_dev *pci,
 	pci_set_master(pci);

 	chip = card->private_data;
+	chip->pci = pci;

 	core = cx88_core_get(pci);
 	if (!core) {
@@ -877,7 +878,6 @@ static int snd_cx88_create(struct snd_card *card, struct pci_dev *pci,

 	/* pci init */
 	chip->card = card;
-	chip->pci = pci;
 	chip->irq = -1;
 	spin_lock_init(&chip->reg_lock);

--
2.17.1

