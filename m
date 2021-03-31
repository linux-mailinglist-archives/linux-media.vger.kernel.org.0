Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6357350597
	for <lists+linux-media@lfdr.de>; Wed, 31 Mar 2021 19:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234565AbhCaRfz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Mar 2021 13:35:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234461AbhCaRfg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Mar 2021 13:35:36 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B044C061574;
        Wed, 31 Mar 2021 10:35:35 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 12so10534990wmf.5;
        Wed, 31 Mar 2021 10:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J9QCFckIBAkkMW1HuLQ0Z2D0zukJHxh0rMMA4ARv74o=;
        b=f7R36IW85JWA3JM042Skzgg63r58U6OiRJmQQL27JFIs4cRGODXhJfXNzD4sR8i1uI
         I7YT2w1oS7c5gYWglNWdHY43r2LiMDwS4xe7bJottqtAmbwNSlassjVBYxHwjwstxi+j
         C560wdT4Ksq7xUP6FIKD6W5ktb9QWn4kiJC4PS6Jn0gVunUphGGI2iyZVniPbVBlI8ki
         cpJTDRN+HwRAocWtNeCCEP+vBbgn0t+RcaAvfdx2r5m+DO/7lV9+OMc9UWdC+gepF+7t
         wZeTtLFi6CZ2b1ungtOpxJQSfHppxZoefa8rIV7uw1QKJPb+LqalLvYx0w0LVHHDbUAh
         QTsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J9QCFckIBAkkMW1HuLQ0Z2D0zukJHxh0rMMA4ARv74o=;
        b=JSqFMvtZkjSndvF1hTKWWEUoOVyCvJw4bb2/TcJB2BRO2YCEW9Y1NKbs8K3cGnNvJq
         qG8JfBpz+vXZkYzmIL5Qfi7ekeojhTvs9PR8t0f5n408x0N9f58d1WSTD884NFyfF3zF
         lhzSJoIf9FJbqoLcX8ITxkugf4g+R2kOp5N2VhMERL8TXFC6qcO5aqqT16e4mHY5GwgT
         YptzcRMGdQvSXo5fYTXi5jpHN4jptpE+YXdsneKgZJDrFPXO1PFBNTgUMhe4uhQia8G+
         NyuKJOpcf3IL5g9tgivIf5KIQ2fyDj/gWSxZ3leobpmXZehAKp3aOEEQS9ECOxZVL6kK
         1Lig==
X-Gm-Message-State: AOAM531xIH0UKBPhWVMZs7hdnvG6ened4Cf4lD0YU/qXcN2+y/YkhNj3
        SZcfTWp3+q6GtcVw3+cdIig=
X-Google-Smtp-Source: ABdhPJwLSOnWotXARo97qgnF3BxfFU0WQJclwokJkmXaXHWELQ/+b91woIYyzgHcow8388aMYut9kg==
X-Received: by 2002:a05:600c:3515:: with SMTP id h21mr4194328wmq.9.1617212134195;
        Wed, 31 Mar 2021 10:35:34 -0700 (PDT)
Received: from arch-x1c3.. ([2a00:5f00:102:0:6e1d:cfb9:fb12:552d])
        by smtp.gmail.com with ESMTPSA id 12sm4714200wmw.43.2021.03.31.10.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 10:35:33 -0700 (PDT)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     emil.l.velikov@gmail.com
Subject: [PATCH v3 6/9] media: hantro: add fallback handling for single irq/clk
Date:   Wed, 31 Mar 2021 18:35:17 +0100
Message-Id: <20210331173520.184191-7-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210331173520.184191-1-emil.l.velikov@gmail.com>
References: <20210331173520.184191-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Emil Velikov <emil.velikov@collabora.com>

Currently the driver expects that each irq/clk will have a name
specified.

A valid point was raised by the DT maintainers - when there is a single
interrupt line or clock - the names are not needed.

This is handled:
 - clk - implicitly - ultimately we'll call of_clk_get_hw(..., 0, NULL
   which will get the first clock from the pmc
 - irq - explicitly - platform_get_irq(..., 0)

To gracefully handle potential bugs, add respective WARN_ON() if we're
having more than one irq/clk, yet lacking the respective names.

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Suggested-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
v3
 - New patch
---
 drivers/staging/media/hantro/hantro_drv.c | 24 +++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index e5f200e64993..d1294eb9cd07 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -752,8 +752,16 @@ static int hantro_probe(struct platform_device *pdev)
 	if (!vpu->clocks)
 		return -ENOMEM;
 
-	for (i = 0; i < vpu->variant->num_clocks; i++)
+	for (i = 0; i < vpu->variant->num_clocks; i++) {
 		vpu->clocks[i].id = vpu->variant->clk_names[i];
+
+		/*
+		 * Warn and refuse to load if the driver has multiple clocks,
+		 * yet they are lacking the respective names.
+		 */
+		if (WARN_ON(!vpu->variant->clk_names[i] && i))
+			return -ENXIO;
+	}
 	ret = devm_clk_bulk_get(&pdev->dev, vpu->variant->num_clocks,
 				vpu->clocks);
 	if (ret)
@@ -791,7 +799,19 @@ static int hantro_probe(struct platform_device *pdev)
 		if (!vpu->variant->irqs[i].handler)
 			continue;
 
-		irq = platform_get_irq_byname(vpu->pdev, irq_name);
+		/*
+		 * If the driver has a single IRQ, chances are there will be no
+		 * actual name in the DT bindings.
+		 */
+		if (!irq_name) {
+			if (WARN_ON(i))
+				return -ENXIO;
+
+			irq_name = "default";
+			irq = platform_get_irq(vpu->pdev, 0);
+		} else {
+			irq = platform_get_irq_byname(vpu->pdev, irq_name);
+		}
 		if (irq <= 0)
 			return -ENXIO;
 
-- 
2.31.1

