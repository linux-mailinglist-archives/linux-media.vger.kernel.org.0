Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB79311FA4F
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2019 19:09:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726560AbfLOSJe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Dec 2019 13:09:34 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37514 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbfLOSJc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Dec 2019 13:09:32 -0500
Received: by mail-lj1-f196.google.com with SMTP id u17so4239720lja.4;
        Sun, 15 Dec 2019 10:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9WCN+aSziwo6IVDHqcjdnKmAeOBt5CXMdSt189Rd6D8=;
        b=NvU27+/6GH5ISbMewOWteUW7hrpRQQAtdsOXkYGPdRcJMzfVUfEw5Qvv4pSR8Nfens
         pcYlNC6VHGDqlKTHper6l7cssY+stCu7cP+6HXIKzX3K3AyWjX1ru/O7D/eI0AhqMkcw
         Fsv60r6PHl8eMZ3opyM5/N5tJmPT43FM8PrwaaX0gMLmY6g4beVJ/3OKzw3LUSQlwg+S
         N0s01A4KYBa+ePvLpnxALuQgXXPY7EPo9aOEcGGU0EL0n9ip9loTzK2rin6bwyPJqBkB
         gVYqHltoi4Y8yEQCiWfe2Wt0gMc1g9VYGVVmXCreKSvrsnW9E7Aq3kCqi6bwr1Uo5+ro
         UdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9WCN+aSziwo6IVDHqcjdnKmAeOBt5CXMdSt189Rd6D8=;
        b=fgt44hlZMQbAaweiesuO8yEZXONKHLKkLruzE1YHFz8y/EUVSp30wFvphFB0IYYqnY
         ISx2YC1g6XgYloNHVlInOCWeHl565SZ+u1vGCLtqCdg6Gj+fec87T851UfVtrwoFb2d1
         mTptP9HaYJg290BMw30zwJaR9Yhe5wtofLjMWDj4V3KdoyIZtu1jslR8Ltk1BSPygVxH
         HWVJaYukZjgWXq+7Mq51XajonK3imx7ID5pGCe1x0Flzunkcet0HCZTY1bUsDYhcj7hN
         2PkndZFZ9o7GPNdXDJltrQx8Mc66LW7azCtRpaM0SQdtxjTBgkW3b31XwEVtmczOjoOF
         IpKQ==
X-Gm-Message-State: APjAAAVUexFEVSZ7vTMy5qlNYADUoBwxuJtS8nqzDDRKeU62gX8uSVrv
        qxUd2dQekueF93gLqfOF4Nw=
X-Google-Smtp-Source: APXvYqwu7LBPUs+T1isRG4okSZnxU/3EOajXzKbM3dRn/PXp35FxayqGrK4SC7zwbFLNd/fYA2W4Og==
X-Received: by 2002:a2e:3c1a:: with SMTP id j26mr16715116lja.79.1576433370285;
        Sun, 15 Dec 2019 10:09:30 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id t27sm8871875ljd.26.2019.12.15.10.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2019 10:09:29 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] media: staging: tegra-vde: Use __maybe_unused attribute instead of ifdef
Date:   Sun, 15 Dec 2019 21:07:52 +0300
Message-Id: <20191215180752.5408-4-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191215180752.5408-1-digetx@gmail.com>
References: <20191215180752.5408-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace #ifdef with __maybe_unused attribute just to keep code cleaner a
tad.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/staging/media/tegra-vde/vde.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
index 3466daddf663..e18fd48981da 100644
--- a/drivers/staging/media/tegra-vde/vde.c
+++ b/drivers/staging/media/tegra-vde/vde.c
@@ -1150,8 +1150,7 @@ static int tegra_vde_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int tegra_vde_pm_suspend(struct device *dev)
+static __maybe_unused int tegra_vde_pm_suspend(struct device *dev)
 {
 	struct tegra_vde *vde = dev_get_drvdata(dev);
 	int err;
@@ -1165,7 +1164,7 @@ static int tegra_vde_pm_suspend(struct device *dev)
 	return 0;
 }
 
-static int tegra_vde_pm_resume(struct device *dev)
+static __maybe_unused int tegra_vde_pm_resume(struct device *dev)
 {
 	struct tegra_vde *vde = dev_get_drvdata(dev);
 	int err;
@@ -1178,7 +1177,6 @@ static int tegra_vde_pm_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops tegra_vde_pm_ops = {
 	SET_RUNTIME_PM_OPS(tegra_vde_runtime_suspend,
-- 
2.24.0

