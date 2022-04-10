Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB00F4FAC94
	for <lists+linux-media@lfdr.de>; Sun, 10 Apr 2022 09:34:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234304AbiDJHhE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Apr 2022 03:37:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231268AbiDJHhD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Apr 2022 03:37:03 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 707521A808
        for <linux-media@vger.kernel.org>; Sun, 10 Apr 2022 00:34:54 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id k14so11556790pga.0
        for <linux-media@vger.kernel.org>; Sun, 10 Apr 2022 00:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VKL0W4S+q1A9JJgGGfDHnZExJwEJeKFoYIWbDFE84WU=;
        b=WFKuFRKj4Clw30SqL+xk17WMKKSLCA7sF3DFZCFFVwSkVAp/JXAhw6X46PqZ50q1FG
         1WVpzpL3kZvOzqaY9K29ZeMjWJiG5EILV6b+lrfXTOUcW4zUku2D+ytwAq/NpFUtsY0k
         uj+W9eGK1K9BsQuuvXFUfk2MkB4rriIflYa9kh1SyXWc6GjRIkCcBxz6EX+sxpH6/TDM
         q6QEh5sLDIzhnx7mMLN8sILdrNZ6JJK5Bcp++pvMdNzBIMqFKWyPSaNAHVpQZL1Q9/r8
         BMitujo4bcHyAMFCBGDyavRTMn2SfQ9iWoaRd/pe1E31/mIxgaT39gRyOfLMOmWd1v/P
         PDEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VKL0W4S+q1A9JJgGGfDHnZExJwEJeKFoYIWbDFE84WU=;
        b=uPwYBjcPRkNpozo+uydCdWpm8JvExTBNEEjS2SwMVYBovSrVmN3MprBttY6zeUEMOS
         t3V14TeQhP7CdAhgKF0EQvHERiNb2JzdQVb8ZMYWjfX9LKgextphQ4DAfMDq7vc9JAE+
         jDDPZxAbR6mPdJgUpaFQCxzK0pJk5Skfv2iVgU3DpQj0ktLv88TJRsjJ/tW+ocnpml5X
         PooHgAZU1qBmXh1M60NA+QYZLnZZBaw4oJf7DP5dNTTpQpPRgexybBSWFe6IBu0yVcH0
         fpofd0b7/GWJdTle5/VFE8TprSZ1llBvx1OlXfTjTV4ANFcbL0uPwUf/RnY/gBmUzFeY
         IaFw==
X-Gm-Message-State: AOAM531XxQNWFBK2A1+v3QULHvHUjlTaQT3QkpIuqOFaPtFJQCdNs4Zq
        GibGtaaP/ZVcfVFxmzE1hw==
X-Google-Smtp-Source: ABdhPJwPkBQD1u1qT9x3KsTWfax5rDldqmrF1FytC84icmMOsBVAyhVoYTWoStqU50KyFqfBkyH6xg==
X-Received: by 2002:a05:6a00:a02:b0:4fd:f9dd:5494 with SMTP id p2-20020a056a000a0200b004fdf9dd5494mr27623806pfh.68.1649576093942;
        Sun, 10 Apr 2022 00:34:53 -0700 (PDT)
Received: from localhost.localdomain ([144.202.91.207])
        by smtp.gmail.com with ESMTPSA id n23-20020a17090a091700b001cb57fd5abdsm5143053pjn.40.2022.04.10.00.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 00:34:53 -0700 (PDT)
From:   Zheyu Ma <zheyuma97@gmail.com>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, Zheyu Ma <zheyuma97@gmail.com>
Subject: [PATCH] media: pci: cx23885: Fix the error handling in cx23885_initdev()
Date:   Sun, 10 Apr 2022 15:34:41 +0800
Message-Id: <20220410073441.45752-1-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When the driver fails to call the dma_set_mask(), the driver will get
the following splat:

[   55.853884] BUG: KASAN: use-after-free in __process_removed_driver+0x3c/0x240
[   55.854486] Read of size 8 at addr ffff88810de60408 by task modprobe/590
[   55.856822] Call Trace:
[   55.860327]  __process_removed_driver+0x3c/0x240
[   55.861347]  bus_for_each_dev+0x102/0x160
[   55.861681]  i2c_del_driver+0x2f/0x50

This is because the driver has initialized the i2c related resources
in cx23885_dev_setup() but not released them in error handling, fix this
bug by modifying the error path that jumps after failing to call the
dma_set_mask().

Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
 drivers/media/pci/cx23885/cx23885-core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/cx23885/cx23885-core.c b/drivers/media/pci/cx23885/cx23885-core.c
index f8f2ff3b00c3..a07b18f2034e 100644
--- a/drivers/media/pci/cx23885/cx23885-core.c
+++ b/drivers/media/pci/cx23885/cx23885-core.c
@@ -2165,7 +2165,7 @@ static int cx23885_initdev(struct pci_dev *pci_dev,
 	err = dma_set_mask(&pci_dev->dev, 0xffffffff);
 	if (err) {
 		pr_err("%s/0: Oops: no 32bit PCI DMA ???\n", dev->name);
-		goto fail_ctrl;
+		goto fail_dma_set_mask;
 	}
 
 	err = request_irq(pci_dev->irq, cx23885_irq,
@@ -2173,7 +2173,7 @@ static int cx23885_initdev(struct pci_dev *pci_dev,
 	if (err < 0) {
 		pr_err("%s: can't get IRQ %d\n",
 		       dev->name, pci_dev->irq);
-		goto fail_irq;
+		goto fail_dma_set_mask;
 	}
 
 	switch (dev->board) {
@@ -2195,7 +2195,7 @@ static int cx23885_initdev(struct pci_dev *pci_dev,
 
 	return 0;
 
-fail_irq:
+fail_dma_set_mask:
 	cx23885_dev_unregister(dev);
 fail_ctrl:
 	v4l2_ctrl_handler_free(hdl);
-- 
2.25.1

