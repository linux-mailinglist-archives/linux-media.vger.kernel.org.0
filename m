Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7FA12AE6F0
	for <lists+linux-media@lfdr.de>; Wed, 11 Nov 2020 04:17:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbgKKDRF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 22:17:05 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:7168 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbgKKDRE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 22:17:04 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CW8z92d00z15TpW;
        Wed, 11 Nov 2020 11:16:53 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Wed, 11 Nov 2020 11:16:51 +0800
From:   Qinglang Miao <miaoqinglang@huawei.com>
To:     Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
        Anton Sviridenko <anton@corp.bluecherry.net>,
        Andrey Utkin <andrey_utkin@fastmail.com>,
        "Ismael Luceno" <ismael@iodev.co.uk>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Qinglang Miao" <miaoqinglang@huawei.com>
Subject: [PATCH] media: solo6x10: fix missing snd_card_free in error handling case
Date:   Wed, 11 Nov 2020 11:22:01 +0800
Message-ID: <20201111032201.17879-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix to goto snd_error in error handling case when fails
to do snd_ctl_add, as done elsewhere in this function.

Fixes: 28cae868cd24 ("[media] solo6x10: move out of staging into drivers/media/pci.")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/media/pci/solo6x10/solo6x10-g723.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/solo6x10/solo6x10-g723.c b/drivers/media/pci/solo6x10/solo6x10-g723.c
index 906ce86437ae..d137b94869d8 100644
--- a/drivers/media/pci/solo6x10/solo6x10-g723.c
+++ b/drivers/media/pci/solo6x10/solo6x10-g723.c
@@ -385,7 +385,7 @@ int solo_g723_init(struct solo_dev *solo_dev)
 
 	ret = snd_ctl_add(card, snd_ctl_new1(&kctl, solo_dev));
 	if (ret < 0)
-		return ret;
+		goto snd_error;
 
 	ret = solo_snd_pcm_init(solo_dev);
 	if (ret < 0)
-- 
2.23.0

