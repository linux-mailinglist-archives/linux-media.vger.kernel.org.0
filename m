Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C38B397E0F
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 03:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbhFBBdy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Jun 2021 21:33:54 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3498 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229899AbhFBBdy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Jun 2021 21:33:54 -0400
Received: from dggeme760-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FvrzT3cVXzYsPN;
        Wed,  2 Jun 2021 09:29:25 +0800 (CST)
Received: from localhost.localdomain (10.175.104.82) by
 dggeme760-chm.china.huawei.com (10.3.19.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 2 Jun 2021 09:32:08 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC:     <sakari.ailus@linux.intel.com>, <gregkh@linuxfoundation.org>,
        Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH v2 -next] media: atomisp: Remove unneeded if-null-free check
Date:   Wed, 2 Jun 2021 09:45:47 +0800
Message-ID: <20210602014547.4135423-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.104.82]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggeme760-chm.china.huawei.com (10.3.19.106)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Eliminate the following coccicheck warning:

drivers/staging/media/atomisp/pci/sh_css_firmware.c:367:4-10: WARNING:
NULL check before some freeing functions is not needed.
drivers/staging/media/atomisp/pci/sh_css_firmware.c:369:4-10: WARNING:
NULL check before some freeing functions is not needed.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/staging/media/atomisp/pci/sh_css_firmware.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index f4ce8ace9d50..5301cc014c7e 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -363,10 +363,8 @@ void sh_css_unload_firmware(void)
 		unsigned int i = 0;
 
 		for (i = 0; i < sh_css_num_binaries; i++) {
-			if (fw_minibuffer[i].name)
-				kfree((void *)fw_minibuffer[i].name);
-			if (fw_minibuffer[i].buffer)
-				kvfree(fw_minibuffer[i].buffer);
+			kfree((void *)fw_minibuffer[i].name);
+			kvfree(fw_minibuffer[i].buffer);
 		}
 		kfree(fw_minibuffer);
 		fw_minibuffer = NULL;
-- 
2.25.1

