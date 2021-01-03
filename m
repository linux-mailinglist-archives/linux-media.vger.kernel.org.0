Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4A642E8A39
	for <lists+linux-media@lfdr.de>; Sun,  3 Jan 2021 04:57:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbhACDzt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 Jan 2021 22:55:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726512AbhACDzs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 2 Jan 2021 22:55:48 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3F15C0613CF;
        Sat,  2 Jan 2021 19:55:07 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id v19so16561270pgj.12;
        Sat, 02 Jan 2021 19:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=XukCghNiyOItZhHaZYN/GSrSL5U50HSG0l4LszYD+Co=;
        b=YKg7J93UN+43tgiOnq52fm9GQJNJt8EzL0xhqubddoujHgkE6oqBQbiylU9wCJ0ugP
         t7ei6QE6u2qNut7tLfJIvddWZj1EOvm7EWvxIxQWPDVcaMly5FywYUNKjuDaEDGQtSeZ
         g80TdfUR8svyTcpN4r3lAg4UKTQtCIWJzWvLDvwp6vdp6RhY/b7hbW8ErpScpfbpKiHk
         DUZvL/mpfw1msfOEX4ljnKoWshzYRLHH/pH1tFwfm9Am7ljlg28wTm+S4izfKEGzxIm4
         Ov8IDeDWD2wzaOWLyjEqbGfJjCmNV5ywp7ylpoz+hdQ0IUvZvhiLLUG+xTGmA7m7chVh
         qFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=XukCghNiyOItZhHaZYN/GSrSL5U50HSG0l4LszYD+Co=;
        b=dfbxVBlDPgaI+VJLkCJn3Q91e321KTLO5V5CzFA2jmXrpTOpKNWB/UKqmq/jR3lECY
         VFcrV+5bjrsxZ7rV7g1hthLr18bEJF32Yr69oInQXWnr503mqT8AXvwBz5/jky+6RFRK
         mpplBROJKtF6gKYJ+aiBvvRAowTBmAnwjUk/EcHe+GwJZSPWZrTH9oQ9/Ihoirp0qcB2
         IFFGh78RPaeWGqiP9D/wNCMKHECQUU1qX7lHBhgYnEiiDSEe4uv6aSHrAgsNTpQy89hG
         fnG6KNwsAfuV7ze/jLCPk4aKkdCyUvcyjbt6JMOfewUvXjwuF8HAuhLRUKzgLOBP7DHi
         f0ew==
X-Gm-Message-State: AOAM530VeaKFzXia41a8SyUymF6gbQ8nacj1Rm4Ve4sH/k1LxSfkgMQw
        clmQ+ilaAIn1XDsvcZncrb4=
X-Google-Smtp-Source: ABdhPJztzvvTllaqz7ejOV4bbiE80gA6URGwLsGIb0AJ86cxZXMSpVpCDIvAE+92iRA1fFhFsGEGMw==
X-Received: by 2002:a62:7c4a:0:b029:19d:b7bc:2c51 with SMTP id x71-20020a627c4a0000b029019db7bc2c51mr61899143pfc.30.1609646107481;
        Sat, 02 Jan 2021 19:55:07 -0800 (PST)
Received: from localhost.localdomain ([43.255.31.23])
        by smtp.gmail.com with ESMTPSA id z3sm10967448pfb.157.2021.01.02.19.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 19:55:06 -0800 (PST)
From:   Yangtao Li <tiny.windzz@gmail.com>
To:     myungjoo.ham@samsung.com, kyungmin.park@samsung.com,
        cw00.choi@samsung.com, krzk@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, digetx@gmail.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, yuq825@gmail.com, airlied@linux.ie,
        daniel@ffwll.ch, robdclark@gmail.com, sean@poorly.run,
        robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
        alyssa.rosenzweig@collabora.com, stanimir.varbanov@linaro.org,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        lukasz.luba@arm.com, adrian.hunter@intel.com,
        ulf.hansson@linaro.org, vireshk@kernel.org, nm@ti.com,
        sboyd@kernel.org, broonie@kernel.org, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, rjw@rjwysocki.net, jcrouse@codeaurora.org,
        hoegsberg@google.com, eric@anholt.net, tzimmermann@suse.de,
        marijn.suijten@somainline.org, gustavoars@kernel.org,
        emil.velikov@collabora.com, jonathan@marek.ca,
        akhilpo@codeaurora.org, smasetty@codeaurora.org,
        airlied@redhat.com, masneyb@onstation.org, kalyan_t@codeaurora.org,
        tanmay@codeaurora.org, tiny.windzz@gmail.com,
        ddavenport@chromium.org, jsanka@codeaurora.org,
        rnayak@codeaurora.org, tongtiangen@huawei.com,
        miaoqinglang@huawei.com, khsieh@codeaurora.org,
        abhinavk@codeaurora.org, chandanu@codeaurora.org,
        groeck@chromium.org, varar@codeaurora.org, mka@chromium.org,
        harigovi@codeaurora.org, rikard.falkeborn@gmail.com,
        natechancellor@gmail.com, georgi.djakov@linaro.org,
        akashast@codeaurora.org, parashar@codeaurora.org,
        dianders@chromium.org
Cc:     linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-serial@vger.kernel.org
Subject: [PATCH 26/31] PM / devfreq: tegra30: convert to use devm_pm_opp_* API
Date:   Sun,  3 Jan 2021 03:54:45 +0000
Message-Id: <20210103035445.23696-1-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use devm_pm_opp_* API to simplify code, and remove opp_table
from tegra_devfreq.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/devfreq/tegra30-devfreq.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 117cad7968ab..4984cb91e9ea 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -178,7 +178,6 @@ struct tegra_devfreq_soc_data {
 
 struct tegra_devfreq {
 	struct devfreq		*devfreq;
-	struct opp_table	*opp_table;
 
 	struct reset_control	*reset;
 	struct clk		*clock;
@@ -794,6 +793,7 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 	struct tegra_devfreq_device *dev;
 	struct tegra_devfreq *tegra;
 	struct devfreq *devfreq;
+	struct opp_tabl	*opp_table;
 	unsigned int i;
 	long rate;
 	int err;
@@ -841,25 +841,25 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	tegra->opp_table = dev_pm_opp_set_supported_hw(&pdev->dev,
-						       &hw_version, 1);
-	err = PTR_ERR_OR_ZERO(tegra->opp_table);
+	opp_table = devm_pm_opp_set_supported_hw(&pdev->dev,
+						 &hw_version, 1);
+	err = PTR_ERR_OR_ZERO(opp_table);
 	if (err) {
 		dev_err(&pdev->dev, "Failed to set supported HW: %d\n", err);
 		return err;
 	}
 
-	err = dev_pm_opp_of_add_table(&pdev->dev);
+	err = devm_pm_opp_of_add_table(&pdev->dev);
 	if (err) {
 		dev_err(&pdev->dev, "Failed to add OPP table: %d\n", err);
-		goto put_hw;
+		return err;
 	}
 
 	err = clk_prepare_enable(tegra->clock);
 	if (err) {
 		dev_err(&pdev->dev,
 			"Failed to prepare and enable ACTMON clock\n");
-		goto remove_table;
+		return err;
 	}
 
 	err = reset_control_reset(tegra->reset);
@@ -917,10 +917,6 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 	reset_control_reset(tegra->reset);
 disable_clk:
 	clk_disable_unprepare(tegra->clock);
-remove_table:
-	dev_pm_opp_of_remove_table(&pdev->dev);
-put_hw:
-	dev_pm_opp_put_supported_hw(tegra->opp_table);
 
 	return err;
 }
@@ -935,9 +931,6 @@ static int tegra_devfreq_remove(struct platform_device *pdev)
 	reset_control_reset(tegra->reset);
 	clk_disable_unprepare(tegra->clock);
 
-	dev_pm_opp_of_remove_table(&pdev->dev);
-	dev_pm_opp_put_supported_hw(tegra->opp_table);
-
 	return 0;
 }
 
-- 
2.25.1

