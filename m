Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E84512E8473
	for <lists+linux-media@lfdr.de>; Fri,  1 Jan 2021 17:58:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727494AbhAAQ5f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Jan 2021 11:57:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726798AbhAAQ5e (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Jan 2021 11:57:34 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A4BCC061757;
        Fri,  1 Jan 2021 08:56:54 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id y8so11248142plp.8;
        Fri, 01 Jan 2021 08:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9TIzmHgFsG6ITKjqTU0zZgw5fpm5ANHtZbVrmANAAI0=;
        b=nb6EiLBe1rK90KNqgI7Tblud+L8ORicNaxgYlOLpDnSDma8JhPbC+sE0K6N9WC6lCg
         e0wL0DyJ0iWBTM1v87pA6uoSqvkJSZrAVAd3hIOEOLdC5KQUZg8H7rgObvKQIKILT5BL
         dYW8qJYXrH/0Dd1tFkT/FQp/UhNxQMBedmIaVPARfPPF2GXQ8jYhin3DOm6mcu8X8Ly5
         3kX1oKS5TkXd/hSFBZvPsJ6xHQI5RKSk3QL9IyGt2d2ZKzUiG9ZinPumxn7CPr3QunRI
         r31onRRx20ggyZxF+1eTR7PdiMUAks1Bd1qNwCzQYV2lkPBFhUHbIOULPhYiCySuuNsz
         i5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9TIzmHgFsG6ITKjqTU0zZgw5fpm5ANHtZbVrmANAAI0=;
        b=Ty9zv+uB/zO6ctMabFSgQs4QUCLcIXfzX2E6bbfbXUqCZzfM8wX+zgUuSsvaA0O0YK
         4A0VTMhrGiqtMk7iFfzDdzVjP5N2qokZ5XT6ctBWtYL2P7aUmJbGxSDUk6lDJgikK9+l
         c8ndt+1umAsTSsvd2eJLYTzMe0TP8juZt/3ipuwIvLdQ8qb/G6x9R5v4ldjrs41daDIX
         G9IyyMZd7jxzihEuhQEIADwPj084yr6hU92d6HaG+Xo9GvEGX0XfHQOI9Fvzzh6prvsy
         lkfGmjV1TchrQw4iAvDtH48NTgh6JFSlz9dakcU66HSjH0Jb9cg213/bgOi2FyZpOREP
         2Zrw==
X-Gm-Message-State: AOAM53164loikawrJ5N+92q/Cor9jcltm/MbhM5rUCDc8JYlhSa5ouc8
        NPziT0RfUx60xsaFXWart5k=
X-Google-Smtp-Source: ABdhPJxF4JOJ2XJhhjVVExcwCvFxLYoAt6vZHBBSIOTAC4TphoEUsVxfStvnXrBY+Pi7P/mH2L3ddA==
X-Received: by 2002:a17:90a:fb43:: with SMTP id iq3mr18956764pjb.175.1609520213736;
        Fri, 01 Jan 2021 08:56:53 -0800 (PST)
Received: from localhost.localdomain ([43.255.31.23])
        by smtp.gmail.com with ESMTPSA id 84sm50002729pfy.9.2021.01.01.08.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jan 2021 08:56:53 -0800 (PST)
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
Subject: [PATCH 06/31] serial: qcom_geni_serial: fix potential mem leak in qcom_geni_serial_probe()
Date:   Fri,  1 Jan 2021 16:54:42 +0000
Message-Id: <20210101165507.19486-7-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210101165507.19486-1-tiny.windzz@gmail.com>
References: <20210101165507.19486-1-tiny.windzz@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We should use dev_pm_opp_put_clkname() to free opp table each time
dev_pm_opp_of_add_table() got error.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 291649f02821..5aada7ebae35 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1438,9 +1438,12 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 		return PTR_ERR(port->se.opp_table);
 	/* OPP table is optional */
 	ret = dev_pm_opp_of_add_table(&pdev->dev);
-	if (ret && ret != -ENODEV) {
-		dev_err(&pdev->dev, "invalid OPP table in device tree\n");
-		goto put_clkname;
+	if (ret) {
+		dev_pm_opp_put_clkname(port->se.opp_table);
+		if (ret != -ENODEV) {
+			dev_err(&pdev->dev, "invalid OPP table in device tree\n");
+			return ret;
+		}
 	}
 
 	port->private_data.drv = drv;
@@ -1482,7 +1485,6 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	return 0;
 err:
 	dev_pm_opp_of_remove_table(&pdev->dev);
-put_clkname:
 	dev_pm_opp_put_clkname(port->se.opp_table);
 	return ret;
 }
-- 
2.25.1

