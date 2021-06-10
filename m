Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B56CD3A2CB0
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 15:17:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230378AbhFJNTL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 09:19:11 -0400
Received: from m12-13.163.com ([220.181.12.13]:43720 "EHLO m12-13.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230293AbhFJNTK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 09:19:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=LlxXO
        1L0cu6sZ+NX7G/ksBtDNc6ys5Mc64m6yUpqW6o=; b=bT2mrun35MXa4xQMA7/Wi
        N1bkn5W9a9pJYut/IxuIzQesdSwpenthYVXm6TYThALUzf/Uhzj0aQqxn5sWdiP+
        L3R84agsUN57KuS7gfz40XFM7ocwQ3FVSEPyQOvrjlOOd+/XhC2RNd8uA0z/JXPp
        DoS32pLdfCwqXWSc/6Mdlc=
Received: from localhost.localdomain (unknown [218.17.89.92])
        by smtp9 (Coremail) with SMTP id DcCowAAX3_U628FgNBtRFg--.22236S2;
        Thu, 10 Jun 2021 17:28:27 +0800 (CST)
From:   lijian_8010a29@163.com
To:     sean@mess.org, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        lijian <lijian@yulong.com>
Subject: [PATCH] media: rc: rc-main.c: deleted the repeated word
Date:   Thu, 10 Jun 2021 17:27:25 +0800
Message-Id: <20210610092725.68415-1-lijian_8010a29@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcCowAAX3_U628FgNBtRFg--.22236S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFWrCw1DXw4Duw4kWFyxGrg_yoW3KFcE9r
        17Zry7XrykAFyUKw4FyrsIvryI9FWjya4fuF4Fgr93trWfZFWDArWDur1ayw1UWry2vF9r
        ua4Ygw42vr17GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUeXJ57UUUUU==
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: 5olmxttqbyiikqdsmqqrwthudrp/xtbBHButUF3l-VcBWQAAsw
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: lijian <lijian@yulong.com>

deleted the repeated word 'the' in the comments.

Signed-off-by: lijian <lijian@yulong.com>
---
 drivers/media/rc/rc-main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
index 8e88dc8ea6c5..b90438a71c80 100644
--- a/drivers/media/rc/rc-main.c
+++ b/drivers/media/rc/rc-main.c
@@ -1940,7 +1940,7 @@ int rc_register_device(struct rc_dev *dev)
 	kfree(path);
 
 	/*
-	 * once the the input device is registered in rc_setup_rx_device,
+	 * once the input device is registered in rc_setup_rx_device,
 	 * userspace can open the input device and rc_open() will be called
 	 * as a result. This results in driver code being allowed to submit
 	 * keycodes with rc_keydown, so lirc must be registered first.
-- 
2.25.1


