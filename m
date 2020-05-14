Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 111B41D3FAF
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 23:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728244AbgENVJ5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 17:09:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728035AbgENVJm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 17:09:42 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3D62C061A0E;
        Thu, 14 May 2020 14:09:41 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id g4so5126309ljl.2;
        Thu, 14 May 2020 14:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KheAdp9M1dfbG4eEm8dhaFoYt33Uw8W6nHGfCYpBQ1U=;
        b=gLiR8Cd33hBDhgcqV4vb/slAGpWjDL9p3Rlr92Yqo+TGnWCFldIjfFWkxpfV3P7Uz+
         O1tJy7aA4cLjD+pLXjqLzcIiWL55PtMEubj46qyQlgxfEmTfanFYlsAQXieCN6D62rtg
         p19Q3gDAAaLIwyC8wHvfxQg0ud80YMVij3hzBMpp8ZjeNXWiTNHro+EYnIXpvFeVdF9H
         e8Lhq15JBDEU/8X5voT+kE+4CjzGmiZ5iFsoYd1uiQnf6+z4OsKXozVqNoYawaLqFgoO
         9lCosisXPV8c0ENv1qRoXOBQRAQ2JCzvUlwzys3KvJ2ehFAyDkQ+tPV5s2BmG9jzSYHx
         J+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KheAdp9M1dfbG4eEm8dhaFoYt33Uw8W6nHGfCYpBQ1U=;
        b=g9RvpPvTI9fSgkTaLacYvG7v0Jp5g4DbwAoho22tFNJh6YRjAtv4ZP/fLU4kABRTUi
         v5yMixMCtM+Wdsyx0Ul5ra/2AQ3MgptOzeYEoaiQ0InZf/ASzbQ+SQ5f5xI4kpWMr477
         nzVRKdPP3DJJsebxZrvL+JfYDdCX43i3HhZ1Uwj4iDfDhGMnm8SHmoATDj3+iMCXFGXP
         qzHL1zFo6kWHbTkVsEtrWJmoWv0rYKUjq4CvInW/+MH+SM2qjgWKUzK5NNfZIdvefEYo
         HqfIunn2BjqV+znf2qqiDBksJ5WCftoiJ4FFWum2EJA1RDGPUJerv/r/lha25zGSGlNf
         rBqQ==
X-Gm-Message-State: AOAM530kDWalTbn4cwSioN0kPNXQYTBkfdCiFfRpYyLG7ARK/KLMRK5r
        nbWLMFf140SBk5QNW0Id36s=
X-Google-Smtp-Source: ABdhPJw8fhDNpHCQC51ItCJfok/1aWb8KwJn6He0iS2C3z3YUOfwjJ+4h/7EGYjUKQFCuiWcV40bAA==
X-Received: by 2002:a2e:9bc3:: with SMTP id w3mr130955ljj.170.1589490580297;
        Thu, 14 May 2020 14:09:40 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.gmail.com with ESMTPSA id g3sm45215ljk.27.2020.05.14.14.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 14:09:39 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/4] media: staging: tegra-vde: Turn ON power domain on shutdown
Date:   Fri, 15 May 2020 00:08:46 +0300
Message-Id: <20200514210847.9269-4-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200514210847.9269-1-digetx@gmail.com>
References: <20200514210847.9269-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On some devices bootloader isn't ready to a clamped VDE power, and thus,
machine hangs on a warm reboot (CPU reset). The VDE power partition is
turned ON by default on a cold boot, hence VDE driver should keep power
partition enabled on system's reboot too. This fixes hang on a warm reboot
on a Tegra20 Acer A500 device, which is handy if Embedded Controller
driver is unavailable, i.e. cold reboot can't be performed.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/staging/media/tegra-vde/vde.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
index 85cbbc8f70d3..b64e35b86fb4 100644
--- a/drivers/staging/media/tegra-vde/vde.c
+++ b/drivers/staging/media/tegra-vde/vde.c
@@ -1085,9 +1085,17 @@ static int tegra_vde_remove(struct platform_device *pdev)
 	struct tegra_vde *vde = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
 
+	pm_runtime_get_sync(dev);
 	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 
+	/*
+	 * Balance RPM state, the VDE power domain is left ON and hardware
+	 * is clock-gated. It's safe to reboot machine now.
+	 */
+	pm_runtime_put_noidle(dev);
+	clk_disable_unprepare(vde->clk);
+
 	misc_deregister(&vde->miscdev);
 
 	tegra_vde_dmabuf_cache_unmap_all(vde);
@@ -1099,6 +1107,16 @@ static int tegra_vde_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static void tegra_vde_shutdown(struct platform_device *pdev)
+{
+	/*
+	 * On some devices bootloader isn't ready to a power-gated VDE on
+	 * a warm-reboot, machine will hang in that case.
+	 */
+	if (pm_runtime_status_suspended(&pdev->dev))
+		tegra_vde_runtime_resume(&pdev->dev);
+}
+
 static __maybe_unused int tegra_vde_pm_suspend(struct device *dev)
 {
 	struct tegra_vde *vde = dev_get_drvdata(dev);
@@ -1144,6 +1162,7 @@ MODULE_DEVICE_TABLE(of, tegra_vde_of_match);
 static struct platform_driver tegra_vde_driver = {
 	.probe		= tegra_vde_probe,
 	.remove		= tegra_vde_remove,
+	.shutdown	= tegra_vde_shutdown,
 	.driver		= {
 		.name		= "tegra-vde",
 		.of_match_table = tegra_vde_of_match,
-- 
2.26.0

