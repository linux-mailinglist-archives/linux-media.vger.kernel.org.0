Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 080C23E0FBA
	for <lists+linux-media@lfdr.de>; Thu,  5 Aug 2021 09:56:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239044AbhHEH4w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Aug 2021 03:56:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232191AbhHEH4v (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Aug 2021 03:56:51 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C09B7C061765;
        Thu,  5 Aug 2021 00:56:36 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id nh14so6832357pjb.2;
        Thu, 05 Aug 2021 00:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KzRsy5xjBsFP1lotVUKgcaA0YPpQUsU83EGq9W53Tvk=;
        b=UMgOnE/1pl9TWQilf0ZfyeW3FaKKTp9Japy2/9SQAATB6IS1y8pRZ92oUAXcvL/Hjd
         2pfy3tDPrOR4Schcd5JSU9q7nIRMZuRoDad5IFBRCUnirEMVxf9XkHxQxDH6tTWRio3M
         fNwnMTZplpaqfPKVIk9wQGcB7RCMn9ZVSncr/EHX6GFuidcnqPeu5OP5ZU/IbGLFeAtd
         4yJkcDURsTT1LVqyhH3+mq3NKt09HRrEBXbsqbmcIZ4Xa62mAAE+4o/QgoKywHp7RBCn
         mvVRZZwl+zVBMOAS36kwFLtp21kG38YnUBXtRwbijyp8XKwm5JPZhFMT0pRnrE7zfsWU
         qvnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KzRsy5xjBsFP1lotVUKgcaA0YPpQUsU83EGq9W53Tvk=;
        b=oQlGNI45N2kEImHP5UfPzNC47Kq8SqeBCco+CoXYEr7lJwV70Ama2Up3/UkrJjqN3K
         TmItPySYmZb8dwhp6DG4UGa8bzK9QPoDxCQy54opTWaChmcUX+x4UYxYoSUzo7HQxMh/
         mM3PW6d7+RkR0GyRdP8z7dBL3OTAjP4/FTa/aLFgRY7rOzNnt8zAc26PJgInJFpJ3w2x
         Pu9Hz3tjQW3/fvHqjl6tXyv/KKXf0l7ilwYUqMsVu2w4jLW+N9ipjdJKAnSRb+F8UprA
         DnXm8fJc3hoxEWeA7YkHCYb5EMI6sn04Tr8mKwKRyOh1ygTejsG2iQ8X2cAJgb0u+ZGq
         lR5Q==
X-Gm-Message-State: AOAM533K20XULHaYHWWnbkIRroAd+VOa+g42eWKeYYgS/Me2WwqglQQa
        rKnUwB3pGAxuhEXpKa1/HE8=
X-Google-Smtp-Source: ABdhPJwdyARdZoc6Y55KTanj8seRN95/jamf11lnAx/tR+rFkqJTVyGuEMC3CBmQso+NPARXZbvYDQ==
X-Received: by 2002:a63:e547:: with SMTP id z7mr495600pgj.65.1628150196358;
        Thu, 05 Aug 2021 00:56:36 -0700 (PDT)
Received: from localhost.localdomain ([45.135.186.81])
        by smtp.gmail.com with ESMTPSA id 136sm6775573pge.77.2021.08.05.00.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 00:56:35 -0700 (PDT)
From:   Tuo Li <islituo@gmail.com>
To:     a.hajda@samsung.com, mchehab@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, baijiaju1990@gmail.com,
        Tuo Li <islituo@gmail.com>, TOTE Robot <oslab@tsinghua.edu.cn>
Subject: [PATCH] media: s5p-mfc: fix possible null-pointer dereference in s5p_mfc_probe()
Date:   Thu,  5 Aug 2021 00:55:35 -0700
Message-Id: <20210805075535.116097-1-islituo@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The variable pdev is assigned to dev->plat_dev, and dev->plat_dev is 
checked in:
  if (!dev->plat_dev)

This indicates both dev->plat_dev and pdev can be NULL. If so, the 
function dev_err() is called to print error infomation.
  dev_err(&pdev->dev, "No platform data specified\n");

However, &pdev->dev is an illegal address, and it is dereferenced in 
dev_err().

To fix this possible null-pointer dereference, replace dev_err() with 
mfc_err().

Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
Signed-off-by: Tuo Li <islituo@gmail.com>
---
 drivers/media/platform/s5p-mfc/s5p_mfc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc.c b/drivers/media/platform/s5p-mfc/s5p_mfc.c
index eba2b9f040df..c763c0a03140 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc.c
@@ -1283,7 +1283,7 @@ static int s5p_mfc_probe(struct platform_device *pdev)
 	spin_lock_init(&dev->condlock);
 	dev->plat_dev = pdev;
 	if (!dev->plat_dev) {
-		dev_err(&pdev->dev, "No platform data specified\n");
+		mfc_err("No platform data specified\n");
 		return -ENODEV;
 	}
 
-- 
2.25.1

