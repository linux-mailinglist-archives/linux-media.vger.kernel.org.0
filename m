Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02ECCCBDC9
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2019 16:47:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389226AbfJDOrY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Oct 2019 10:47:24 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54439 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389449AbfJDOrX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Oct 2019 10:47:23 -0400
Received: by mail-wm1-f65.google.com with SMTP id p7so6135793wmp.4
        for <linux-media@vger.kernel.org>; Fri, 04 Oct 2019 07:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9118eAxchplUEC3wD7+/3Rk7lFGR/BWjlZfUOnVUzi4=;
        b=aOqqM0bS+MNrX5woXn55Y6mMlkKHv2N9o9db3txnnVtJ/nke80mmIWIvF4LFxgztWp
         aCHW21RbuNKSOtkC2usNceZWmNQbVMu3vio8AU9aQ9vtSghL/TKWzE+AUkrXsLt+MjoO
         FOJUV+BMsGCYjhIVsUXKaYWhHd2pBoKNWaZS9gRabsmXtcLEUIdClfZjBFskufa6VUoB
         55W9zLTKDh3op8RIV4/ZkippwzLFEH+aOL/1E8TeiDqnhD71GN2semNSMNCdy36DLtzW
         OhM0GoKQXTnGj/o24dpb6aA8ODMjONBmawqhnT/jjTkfqXF5vDCYf9/TsV0/7Ub0KjXM
         212w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9118eAxchplUEC3wD7+/3Rk7lFGR/BWjlZfUOnVUzi4=;
        b=DueEcDAc6GiTvWQhr/TOzM4Xcjecgxql+WIMPtS85/055qK2/MRC2R6BWlWm1vdx1s
         UCIIOSIE5JTg8s5ozc6vryopEE3VApZi3Hz5vtrgFFT3sGjeDzQC0nTWirTW5DkRbvoV
         BGk2+0tQWv/s9s/kUMWJOrCTXB2T4NlU+uCHtwC2xRwyVfvXrbLYXrhCgeaYyNZBzJ8v
         QyLbzrRRsUTEiRNi31jH/VnzshcCxqiPwemlSt+UEcOen/MwP4P/RIHhpHXLS6/rjaYY
         QHGhaWZvdIgS8ICz221lclD5x2RBWkUpThScSvz8kLEspA6yayJBzfrMrqnavrZso0jx
         7NFQ==
X-Gm-Message-State: APjAAAUExa8zptCk7Pg76c9Krh2chfPYu/+r6rJjocpLbqAYAwLR8jnQ
        fSih9E1aKZ7nWWF4UsTy+pnMCw==
X-Google-Smtp-Source: APXvYqzxGEB/Jmd5uNbft2qfT6qV6TItO3w9WvQSn/rY8jn52H+gVkuWobFmoGKb7/SQ8cXphGH4lA==
X-Received: by 2002:a7b:cd08:: with SMTP id f8mr10287319wmj.87.1570200441202;
        Fri, 04 Oct 2019 07:47:21 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id y5sm7994776wma.14.2019.10.04.07.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2019 07:47:20 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Christian Hewitt <christianshewitt@gmail.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH] media: meson/ao-cec: move cec_notifier_cec_adap_register after hw setup
Date:   Fri,  4 Oct 2019 16:47:19 +0200
Message-Id: <20191004144719.11006-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When probed after the HDMI notifier, calling cec_notifier_cec_adap_register()
calls the enable() adapter callback, but the HW is not yet set up.

Moving cec_notifier_cec_adap_register() right before cec_register_adapter()
fixes the following crash:
Ignoring spurious kernel translation fault at virtual address 0000000000000008
[...]
Hardware name: Khadas VIM (DT)
[...]
pc : __do_kernel_fault+0xdc/0x120
lr : __do_kernel_fault+0xdc/0x120
[...]
Call trace:
 __do_kernel_fault+0xdc/0x120
 do_page_fault+0x180/0x458
 do_translation_fault+0x64/0x70
 do_mem_abort+0x3c/0x98
 el1_da+0x20/0x94
 meson_ao_cec_adap_enable+0x30/0x218 [ao_cec]
 __cec_s_phys_addr+0x184/0x270
 cec_s_phys_addr+0x44/0x60
 cec_notifier_cec_adap_register+0x68/0x90
 meson_ao_cec_probe+0xb0/0x288 [ao_cec]
[...]
 el0_svc_compat+0x8/0x10

Reported-by: Christian Hewitt <christianshewitt@gmail.com>
Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
Fixes: 20958f9d5c48 ("media: meson/ao-cec: use cec_notifier_cec_adap_(un)register")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/media/platform/meson/ao-cec-g12a.c | 36 +++++++++++-----------
 drivers/media/platform/meson/ao-cec.c      | 30 +++++++++---------
 2 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/media/platform/meson/ao-cec-g12a.c b/drivers/media/platform/meson/ao-cec-g12a.c
index 3b39e875292e..3d8fe854feb0 100644
--- a/drivers/media/platform/meson/ao-cec-g12a.c
+++ b/drivers/media/platform/meson/ao-cec-g12a.c
@@ -662,34 +662,27 @@ static int meson_ao_cec_g12a_probe(struct platform_device *pdev)
 	if (IS_ERR(ao_cec->adap))
 		return PTR_ERR(ao_cec->adap);
 
-	ao_cec->notify = cec_notifier_cec_adap_register(hdmi_dev, NULL,
-							ao_cec->adap);
-	if (!ao_cec->notify) {
-		ret = -ENOMEM;
-		goto out_probe_adapter;
-	}
-
 	ao_cec->adap->owner = THIS_MODULE;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(base)) {
 		ret = PTR_ERR(base);
-		goto out_probe_notify;
+		goto out_probe_adapter;
 	}
 
 	ao_cec->regmap = devm_regmap_init_mmio(&pdev->dev, base,
 					       &meson_ao_cec_g12a_regmap_conf);
 	if (IS_ERR(ao_cec->regmap)) {
 		ret = PTR_ERR(ao_cec->regmap);
-		goto out_probe_notify;
+		goto out_probe_adapter;
 	}
 
 	ao_cec->regmap_cec = devm_regmap_init(&pdev->dev, NULL, ao_cec,
 					   &meson_ao_cec_g12a_cec_regmap_conf);
 	if (IS_ERR(ao_cec->regmap_cec)) {
 		ret = PTR_ERR(ao_cec->regmap_cec);
-		goto out_probe_notify;
+		goto out_probe_adapter;
 	}
 
 	irq = platform_get_irq(pdev, 0);
@@ -699,45 +692,52 @@ static int meson_ao_cec_g12a_probe(struct platform_device *pdev)
 					0, NULL, ao_cec);
 	if (ret) {
 		dev_err(&pdev->dev, "irq request failed\n");
-		goto out_probe_notify;
+		goto out_probe_adapter;
 	}
 
 	ao_cec->oscin = devm_clk_get(&pdev->dev, "oscin");
 	if (IS_ERR(ao_cec->oscin)) {
 		dev_err(&pdev->dev, "oscin clock request failed\n");
 		ret = PTR_ERR(ao_cec->oscin);
-		goto out_probe_notify;
+		goto out_probe_adapter;
 	}
 
 	ret = meson_ao_cec_g12a_setup_clk(ao_cec);
 	if (ret)
-		goto out_probe_notify;
+		goto out_probe_adapter;
 
 	ret = clk_prepare_enable(ao_cec->core);
 	if (ret) {
 		dev_err(&pdev->dev, "core clock enable failed\n");
-		goto out_probe_notify;
+		goto out_probe_adapter;
 	}
 
 	device_reset_optional(&pdev->dev);
 
 	platform_set_drvdata(pdev, ao_cec);
 
+	ao_cec->notify = cec_notifier_cec_adap_register(hdmi_dev, NULL,
+							ao_cec->adap);
+	if (!ao_cec->notify) {
+		ret = -ENOMEM;
+		goto out_probe_core_clk;
+	}
+
 	ret = cec_register_adapter(ao_cec->adap, &pdev->dev);
 	if (ret < 0)
-		goto out_probe_core_clk;
+		goto out_probe_notify;
 
 	/* Setup Hardware */
 	regmap_write(ao_cec->regmap, CECB_GEN_CNTL_REG, CECB_GEN_CNTL_RESET);
 
 	return 0;
 
-out_probe_core_clk:
-	clk_disable_unprepare(ao_cec->core);
-
 out_probe_notify:
 	cec_notifier_cec_adap_unregister(ao_cec->notify);
 
+out_probe_core_clk:
+	clk_disable_unprepare(ao_cec->core);
+
 out_probe_adapter:
 	cec_delete_adapter(ao_cec->adap);
 
diff --git a/drivers/media/platform/meson/ao-cec.c b/drivers/media/platform/meson/ao-cec.c
index 64ed549bf012..03600e8b3ef0 100644
--- a/drivers/media/platform/meson/ao-cec.c
+++ b/drivers/media/platform/meson/ao-cec.c
@@ -624,20 +624,13 @@ static int meson_ao_cec_probe(struct platform_device *pdev)
 	if (IS_ERR(ao_cec->adap))
 		return PTR_ERR(ao_cec->adap);
 
-	ao_cec->notify = cec_notifier_cec_adap_register(hdmi_dev, NULL,
-							ao_cec->adap);
-	if (!ao_cec->notify) {
-		ret = -ENOMEM;
-		goto out_probe_adapter;
-	}
-
 	ao_cec->adap->owner = THIS_MODULE;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	ao_cec->base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(ao_cec->base)) {
 		ret = PTR_ERR(ao_cec->base);
-		goto out_probe_notify;
+		goto out_probe_adapter;
 	}
 
 	irq = platform_get_irq(pdev, 0);
@@ -647,20 +640,20 @@ static int meson_ao_cec_probe(struct platform_device *pdev)
 					0, NULL, ao_cec);
 	if (ret) {
 		dev_err(&pdev->dev, "irq request failed\n");
-		goto out_probe_notify;
+		goto out_probe_adapter;
 	}
 
 	ao_cec->core = devm_clk_get(&pdev->dev, "core");
 	if (IS_ERR(ao_cec->core)) {
 		dev_err(&pdev->dev, "core clock request failed\n");
 		ret = PTR_ERR(ao_cec->core);
-		goto out_probe_notify;
+		goto out_probe_adapter;
 	}
 
 	ret = clk_prepare_enable(ao_cec->core);
 	if (ret) {
 		dev_err(&pdev->dev, "core clock enable failed\n");
-		goto out_probe_notify;
+		goto out_probe_adapter;
 	}
 
 	ret = clk_set_rate(ao_cec->core, CEC_CLK_RATE);
@@ -674,9 +667,16 @@ static int meson_ao_cec_probe(struct platform_device *pdev)
 	ao_cec->pdev = pdev;
 	platform_set_drvdata(pdev, ao_cec);
 
+	ao_cec->notify = cec_notifier_cec_adap_register(hdmi_dev, NULL,
+							ao_cec->adap);
+	if (!ao_cec->notify) {
+		ret = -ENOMEM;
+		goto out_probe_clk;
+	}
+
 	ret = cec_register_adapter(ao_cec->adap, &pdev->dev);
 	if (ret < 0)
-		goto out_probe_clk;
+		goto out_probe_notify;
 
 	/* Setup Hardware */
 	writel_relaxed(CEC_GEN_CNTL_RESET,
@@ -684,12 +684,12 @@ static int meson_ao_cec_probe(struct platform_device *pdev)
 
 	return 0;
 
-out_probe_clk:
-	clk_disable_unprepare(ao_cec->core);
-
 out_probe_notify:
 	cec_notifier_cec_adap_unregister(ao_cec->notify);
 
+out_probe_clk:
+	clk_disable_unprepare(ao_cec->core);
+
 out_probe_adapter:
 	cec_delete_adapter(ao_cec->adap);
 
-- 
2.22.0

