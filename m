Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA95C2076D2
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 17:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404447AbgFXPJD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 11:09:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404442AbgFXPJB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 11:09:01 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B44BAC061573;
        Wed, 24 Jun 2020 08:09:00 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id g139so1452745lfd.10;
        Wed, 24 Jun 2020 08:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KheAdp9M1dfbG4eEm8dhaFoYt33Uw8W6nHGfCYpBQ1U=;
        b=YMrvDWL/13Qtb/t3P8AqAn7YXh+E5039QwPNb0vmwIbDc+mVHxz7OIiIAMP+ST+S+v
         WEi9f/pouSHwNiVg9M9zSajFLSKXGJZ/v3hOEQwNFyhZ1dH1O9+KH3OKMptmoOtL6eed
         Q8L07crHA2zRVbxLHhAme3Ig61vVANQHgD9UfkdluZmOM2ZbWeohP1hinz8Foc2jrh69
         3ibyFDx5rnQIFxdyp3LYxg3rioriCS0sOxMI33kKetcMsKIxkrjyg7G1Z/3fZw/b0Mzb
         51L5Us03w/z7vBI1W+pWMTwAMt0Dt/uyBYNfXypX46LgBJHwGp2XbhhRrm1ML1ZH2A9c
         7d4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KheAdp9M1dfbG4eEm8dhaFoYt33Uw8W6nHGfCYpBQ1U=;
        b=jfKYb1kX7eWg4WXnbXWM724BVrNdl/bHQPyydb120T3eks0AJXiafTirlMpFAZqhYu
         J68DLxtqw+8AzvP8LkHu+taoyozvvnEWvn53s6sgSal0+M+NctI7c9fM8ZWcxWJV5GIB
         be11hG5cz23HkA5fiv/sNjKIHaItEYRi12PJqCAP9sMnl8MJpz5PfHVJ4CNHJ97Xi2H7
         gu64LQBrZGq2+UZFijSZREXtctdjwWc3LOa1Hmu2w/aUSPmZwYuXGQNgo5yH+B1sPm4Z
         LukQ9YSlT10heGQUYrVrQMJIRWwaQTMqmbDXgDoJ2JXA3vBR3rRimhLe+A2d4uoPwqZ9
         gSew==
X-Gm-Message-State: AOAM531D/LXFUobL/FF9nS2xjikZ7l7f8vy4X3m/uOJb0wHXHCpgw7f4
        cJQbyx3nlHWL1gBHJLZE2YE=
X-Google-Smtp-Source: ABdhPJyuihnjhleoFSkxrceYwKLcXKmloeag18MhVXjSAM33bpxBmEXnrnBvMHE+KbpSExRlAvz/bA==
X-Received: by 2002:ac2:4a83:: with SMTP id l3mr15608005lfp.92.1593011339237;
        Wed, 24 Jun 2020 08:08:59 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.gmail.com with ESMTPSA id z1sm4182049lja.47.2020.06.24.08.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 08:08:58 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] media: staging: tegra-vde: Turn ON power domain on shutdown
Date:   Wed, 24 Jun 2020 18:08:46 +0300
Message-Id: <20200624150847.22672-4-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200624150847.22672-1-digetx@gmail.com>
References: <20200624150847.22672-1-digetx@gmail.com>
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

