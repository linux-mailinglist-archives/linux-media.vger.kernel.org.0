Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56BF51D3FA9
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 23:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728140AbgENVJp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 17:09:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728043AbgENVJm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 17:09:42 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2138C061A0C;
        Thu, 14 May 2020 14:09:40 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id c21so7487lfb.3;
        Thu, 14 May 2020 14:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EO0vr0FBuxVa7FqS3Iq4jMbQpH1iOzHD8PnLZeBEDCg=;
        b=tltjcWtTVsozKzAf9N+yxZwewU2cNg30qCpbUSnD4xjqn3IaFYSc11cT2s/BUL/eo2
         eXwYVd2jl6wBp8ekYPoinV7qyWBI/eE5FVU7CkPyuC6GI/SwOTI2Pq2XJYf4r+e9QBZe
         ygFDJQSL/D8hYv2L+KzG2ZXUD8oeB42Ne3vya1sRjlz6jo3ZU3a+StfRucZXUdIkXsxo
         FnlijK74UmStroYupJDYMm37bA8DF9v08j9v7/owoQgiy/Eqg4nj2S0ltJdI/YfsABS1
         wmHuOppJGxLYcVHNerVfrh3N1QHnk5JJC3QvOcnEzuIgRHDB7kDzhX9+uw4uovyPCQlU
         PwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EO0vr0FBuxVa7FqS3Iq4jMbQpH1iOzHD8PnLZeBEDCg=;
        b=FplEEN7y2ZZ9qDxUIWr05eKOL2ZV2jrIprdlQ7ELZMzJC7g77vwqhwT9deWlLw+QCT
         VETDWeXB30YOCaSRoOhgbfljotBa5fyKtnrgvy5wrvKiNLTLgKcAPpNrz3LBqGQ0Csa/
         cuaFNkGoJ20gnks01Wr14hAo8Scqmx7mnrXA5kEig1SOesHbXc3uQzOXw+1VPEER2wdi
         NPND72zG6PBDJD2kAz9AHMOQbPMvhQeldXSM0CW2Vla10Qh4J2WRADRLCsdJMGrJlf8p
         NJ6O8P8CmuQ6IjXIm1673z0j+Ov+vLME/Jx0Be+xksVsCye90YWeZBPPbhco/Vy8BDKW
         g0JA==
X-Gm-Message-State: AOAM533Y8ZIAXo+IMl3rWBTe4oKbg2DL7J6kO4ZbtoevHacRfTn9Rc3i
        6DTk4Zhr2fSRw39BSs/fAEk=
X-Google-Smtp-Source: ABdhPJwmXn6PJe8MV8dlPU1VcNAyZYVcG4jdW1N/ABx/HZNFEa2KXiju6MxUhsgJEX3Zjn5+oOQ5Kg==
X-Received: by 2002:a19:d55:: with SMTP id 82mr55733lfn.89.1589490579255;
        Thu, 14 May 2020 14:09:39 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.gmail.com with ESMTPSA id g3sm45215ljk.27.2020.05.14.14.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 14:09:38 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/4] media: staging: tegra-vde: Runtime PM is always available on Tegra
Date:   Fri, 15 May 2020 00:08:45 +0300
Message-Id: <20200514210847.9269-3-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200514210847.9269-1-digetx@gmail.com>
References: <20200514210847.9269-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Runtime PM is always available on Tegra nowadays since commit 40b2bb1b132a
("ARM: tegra: enforce PM requirement"), hence the case of unavailable RPM
doesn't need to be handled.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/staging/media/tegra-vde/vde.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
index 803e5dda4bb5..85cbbc8f70d3 100644
--- a/drivers/staging/media/tegra-vde/vde.c
+++ b/drivers/staging/media/tegra-vde/vde.c
@@ -1068,17 +1068,8 @@ static int tegra_vde_probe(struct platform_device *pdev)
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_set_autosuspend_delay(dev, 300);
 
-	if (!pm_runtime_enabled(dev)) {
-		err = tegra_vde_runtime_resume(dev);
-		if (err)
-			goto err_misc_unreg;
-	}
-
 	return 0;
 
-err_misc_unreg:
-	misc_deregister(&vde->miscdev);
-
 err_deinit_iommu:
 	tegra_vde_iommu_deinit(vde);
 
@@ -1093,13 +1084,6 @@ static int tegra_vde_remove(struct platform_device *pdev)
 {
 	struct tegra_vde *vde = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
-	int err;
-
-	if (!pm_runtime_enabled(dev)) {
-		err = tegra_vde_runtime_suspend(dev);
-		if (err)
-			return err;
-	}
 
 	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
-- 
2.26.0

