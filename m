Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D74572076D9
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 17:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404470AbgFXPJO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 11:09:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404067AbgFXPI7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 11:08:59 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0EBEC061573;
        Wed, 24 Jun 2020 08:08:59 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id s1so2976350ljo.0;
        Wed, 24 Jun 2020 08:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EO0vr0FBuxVa7FqS3Iq4jMbQpH1iOzHD8PnLZeBEDCg=;
        b=J2ZoUKabV8uBWW8kT14GVdq844k5EGl9LZL64gEzgnhcADd8Ey9EGbuClRMNnMseCg
         U1KHZistw+DkX9cqdP1WCbkcM+QtHu0ScwWhr6ar6Xkv6RfSKeHf3fIviD3k89avexI7
         OQxhBScnUY+89SxyZMVTNGKj88NOEztFu22WFCr59dYFDp6hqNOo1xA//QFL0aqqxyEM
         wv7QLohFndzJkxFUckGdRPNhWh/ZrCJ9P774Gu4JDSIAKvWRf+HFavFp0ScgXTn60JQk
         aQ+YheYahlXjBbYR/t2lin+Y1fFWbPjFQlypbnImOOBvEGEkTcUb5bruoHs9vc+kvRme
         3VwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EO0vr0FBuxVa7FqS3Iq4jMbQpH1iOzHD8PnLZeBEDCg=;
        b=EdtgKraVE9+Id3x2TX8aKR6wopdGF3CunmK/hRu7cadcuT8LF5WuhHhbKzfjXdhoP+
         1rEcdD0BsvmARO6A88kRqgRa1XdkbIEjai4heOGxTG5V+6KIaSMZ9P55WsaRMzqMoWK5
         sdtf5Sw4RwI8ZAR6RCa3O/Gq5T5828DgPsuLd3nXjKtx2ZdV6DFRaXwsUZ5vRshndWHA
         H6NsVXad8OxKF5PRpVKPRnH6K2ed82GZgvSdRGRcxkBRpiXV3Ijr7KC296Vn4wpVCpx3
         JBPX0H9qgj12T8j/Td8RXKG7/yLKJfcBPD7/m3uDgNME02wd0fsd0+69JqRAhiMIgSKX
         WzSQ==
X-Gm-Message-State: AOAM532kCMc2CeaVYbbR7f6JgPumzW0dlDCOw8TXGqXWopqSumDflxUj
        bmkdI7IUzhZVCCUy3fpYSzw=
X-Google-Smtp-Source: ABdhPJyKT14B5+qLcVOpYptH1Lq0z9yrEMkRgXqV0VmarTChqLi//LDwXiSj80dipUCtV5kkV88X8A==
X-Received: by 2002:a2e:9c8e:: with SMTP id x14mr11827756lji.200.1593011338198;
        Wed, 24 Jun 2020 08:08:58 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.gmail.com with ESMTPSA id z1sm4182049lja.47.2020.06.24.08.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 08:08:57 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] media: staging: tegra-vde: Runtime PM is always available on Tegra
Date:   Wed, 24 Jun 2020 18:08:45 +0300
Message-Id: <20200624150847.22672-3-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200624150847.22672-1-digetx@gmail.com>
References: <20200624150847.22672-1-digetx@gmail.com>
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

