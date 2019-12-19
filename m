Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C1C2125C42
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2019 08:48:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbfLSHsm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Dec 2019 02:48:42 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:55414 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbfLSHsm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Dec 2019 02:48:42 -0500
Received: by mail-pj1-f65.google.com with SMTP id d5so2106191pjz.5;
        Wed, 18 Dec 2019 23:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hTBaTcwtZhnl+1WkSjy+81B8m71lqLhfOOtaR07ioF4=;
        b=mmRldR65wsCwcUz+D5TDJCVDB3Zu/CH++jZeFoIYNHub11F6SsqtqgyIA833Zfw12o
         dRP73VgdDhN65zuf1j7Pw2MQqzP2wZ0PBkC18lFuGpUlWvLxd8MpYUKGgSaKVucH/rvS
         4I/hDdTs4wrOG16MXCcxxHTQM9rY8uoR1GikHk8osZrHiAv87+hWyhWzpAlblc0lwACN
         c0fFob9gu3Ww+cHNYBFmwSrrhsc1no2fyiU/bWmju7USIpI7hHR9YGa/dEIcObbOsC1d
         NLzdUR1HxYRW7tF9jc0PXRCLnDiI3occbF02kqtzLCtXIxPl0Adl/K63hYg/pbEeL0Hc
         x/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hTBaTcwtZhnl+1WkSjy+81B8m71lqLhfOOtaR07ioF4=;
        b=LtjiH0deKzshzrNsORHNZMkGjCuhk2V7cPCvYUmzxeCjBjBdnDkOVIuJ2d12aPRMnB
         KZPrtZPr89qZKe4ZHs82E9FucPVNktVuiPILZidliz2LQI4Ng/ZMQhDVd+Xc+pIZVWy7
         jQwEeZjFoXtcRK2NhIEvsdKX+bTBgH2ia5CPKC2gxMAaUrW4WD4NrpRnYb3uyw1VCVXa
         l/ddetAN51bRMzO1oLOC4ICTux0ZFOKi50pv5cSOcX0xd+rSGNXtCp9Ygdr/s90IbFyO
         itdLv/AgHm9Bk7ymCsyWun7malvZAgNlsFnnZt83d2v03B6EQeJr4KUOFNMRsB/6K89H
         GMHg==
X-Gm-Message-State: APjAAAWTCJvU3ixMaJltGyWO0mNgxf9Ff6fUvfttP8ADvQacLddi32kZ
        BUv68UHauChoRvZcupaFbnU=
X-Google-Smtp-Source: APXvYqxlwqlRSa81G37VFitvZnHoRsAlv+Q1y8BTY/ZxpMKTj73l4WKLRWW6Uj1BStb9PikmK4/czw==
X-Received: by 2002:a17:902:ac8b:: with SMTP id h11mr7742793plr.87.1576741721330;
        Wed, 18 Dec 2019 23:48:41 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id k4sm6423315pfk.11.2019.12.18.23.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 23:48:40 -0800 (PST)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Kyungmin Park <kyungmin.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH v2 RFT] media: exynos4-is: add missed clk_disable_unprepare in remove
Date:   Thu, 19 Dec 2019 15:48:24 +0800
Message-Id: <20191219074824.15047-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This driver forgets to disable and unprepare clock when remove.
Add a call to clk_disable_unprepare() to fix it.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
Changes in v2:
  - Add a check of pm_runtime_enable() to match enable in probe.
  - Add RFT tag.

 drivers/media/platform/exynos4-is/fimc-lite.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/exynos4-is/fimc-lite.c b/drivers/media/platform/exynos4-is/fimc-lite.c
index e87c6a09205b..17de14fbba31 100644
--- a/drivers/media/platform/exynos4-is/fimc-lite.c
+++ b/drivers/media/platform/exynos4-is/fimc-lite.c
@@ -1614,6 +1614,9 @@ static int fimc_lite_remove(struct platform_device *pdev)
 	struct fimc_lite *fimc = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
 
+	if (!pm_runtime_enabled(dev))
+		clk_disable_unprepare(fimc->clock);
+
 	pm_runtime_disable(dev);
 	pm_runtime_set_suspended(dev);
 	fimc_lite_unregister_capture_subdev(fimc);
-- 
2.24.0

