Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B788600DD
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2019 08:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727856AbfGEGLw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jul 2019 02:11:52 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38621 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725827AbfGEGLv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Jul 2019 02:11:51 -0400
Received: by mail-pf1-f193.google.com with SMTP id y15so3837622pfn.5
        for <linux-media@vger.kernel.org>; Thu, 04 Jul 2019 23:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JKctE4K5sDxRFY6pqCAg221NxbFbk7BKe+3f3Vj/l/k=;
        b=oLbTZ3dYRw04OLOoT0B1eslDirWqkSdQwltiuleECgUie7W9XpHl//Uyr+2LhffQKA
         BLvwFStInVCYYNJgVCa24gsd7aUgr8AaSheoX7sJRMrNCqoWgmvwb6z49VjfighnrPW3
         8HUmPEywsg6bbXs8Dv8YXG6mfP01fPivj9Vdy6Wy+X3w0aoYJ00yF2Xow2IxoZGcTehm
         DpyInJ8dubeUygU5ZWjArMLgTZ6rmlPL6VNpT2Iu87s9FI5/lKcJvB9+zldr7vbh37Wf
         9EApvPoPPQ1qQo0t2UKwuAJU2UZZOZT/+zirv7AteJgiU3vQPSQNtm745vobWbe10zfn
         2SpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JKctE4K5sDxRFY6pqCAg221NxbFbk7BKe+3f3Vj/l/k=;
        b=UwvfC06qcyoQ3MMVVfn9Dt6zW1+tYXO/0Vkp/2LQcreKu1kCmN8panRXAr4dJjrmIS
         O3x1BtoA2iwKZzj14IGIrESNQZ17loPF6MkcvOz180RGssu+Hk11gGabziYkp0NMVWwh
         Aw2c9ZIQGQtv8C4MeKB0gj6qemraQDb6dtSjYwqlbao0IaA71t3j2mHu5a8p72BnYud9
         UaPwnFDincM/palWULQLi1/BdLz1NLO68geZLZEnFiQkBPlIyWQU6GjNRWtuz9Lt0ava
         DHuo+ZQL3mR7kASXwCLSG6MBR3iog2FMTWpyLlapPyeJIIqFPStEEmleVozaWB+F4/4j
         RNoA==
X-Gm-Message-State: APjAAAUyOcmMgkl99dPCHlDQSKpg/2MUKgMBjlYaKuOTsr4CtdxOGnI3
        sYUx1IMdn/3ibJmROpFSmuY=
X-Google-Smtp-Source: APXvYqyjXWxWRbF+f1IiMf2HG1CrMv3CJOpcVh23+h/FcPYzswRd3WCeH3CaMUdSY38vaTAgjLo1Iw==
X-Received: by 2002:a17:90a:3086:: with SMTP id h6mr2816224pjb.14.1562307111068;
        Thu, 04 Jul 2019 23:11:51 -0700 (PDT)
Received: from localhost.localdomain ([122.163.64.117])
        by smtp.gmail.com with ESMTPSA id p15sm12249707pjf.27.2019.07.04.23.11.43
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 04 Jul 2019 23:11:50 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] staging: media: davinci_vpfe: Replace function vpfe_isif_cleanup()
Date:   Fri,  5 Jul 2019 11:41:26 +0530
Message-Id: <20190705061126.23876-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename function isif_remove to vpfe_isif_cleanup, as
vpfe_isif_cleanup does nothing but call isif_remove.
Change type of new vpfe_isif_cleanup from static to non-static to match
the old function definition.
Remove the original vpfe_isif_cleanup.
Modify calls to isif_remove to vpfe_isif_cleanup.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 .../staging/media/davinci_vpfe/dm365_isif.c   | 21 +++++++------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/davinci_vpfe/dm365_isif.c b/drivers/staging/media/davinci_vpfe/dm365_isif.c
index 46fd8184fc77..c21106a5dc7b 100644
--- a/drivers/staging/media/davinci_vpfe/dm365_isif.c
+++ b/drivers/staging/media/davinci_vpfe/dm365_isif.c
@@ -1932,8 +1932,13 @@ static const struct v4l2_ctrl_config vpfe_isif_gain_offset = {
 	.def = 0,
 };
 
-static void isif_remove(struct vpfe_isif_device *isif,
-			struct platform_device *pdev)
+/*
+ * vpfe_isif_cleanup - isif module cleanup
+ * @isif: pointer to isif subdevice
+ * @dev: pointer to platform device structure
+ */
+void vpfe_isif_cleanup(struct vpfe_isif_device *isif,
+		       struct platform_device *pdev)
 {
 	struct resource *res;
 	int i = 0;
@@ -2081,17 +2086,7 @@ int vpfe_isif_init(struct vpfe_isif_device *isif, struct platform_device *pdev)
 	return status;
 isif_fail:
 	v4l2_ctrl_handler_free(&isif->ctrls);
-	isif_remove(isif, pdev);
+	vpfe_isif_cleanup(isif, pdev);
 	return status;
 }
 
-/*
- * vpfe_isif_cleanup - isif module cleanup
- * @isif: pointer to isif subdevice
- * @dev: pointer to platform device structure
- */
-void
-vpfe_isif_cleanup(struct vpfe_isif_device *isif, struct platform_device *pdev)
-{
-	isif_remove(isif, pdev);
-}
-- 
2.19.1

