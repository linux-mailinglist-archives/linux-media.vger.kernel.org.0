Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8CE68715
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2019 12:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729762AbfGOKbA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jul 2019 06:31:00 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:42635 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729428AbfGOKa6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jul 2019 06:30:58 -0400
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:3de9:fbf:e548:c8fc])
        by smtp-cloud7.xs4all.net with ESMTPA
        id myFyhc6VO0SBqmyFzhRPKG; Mon, 15 Jul 2019 12:30:56 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 1/6] meson/ao-cec: use cec_notifier_cec_adap_(un)register
Date:   Mon, 15 Jul 2019 12:30:49 +0200
Message-Id: <20190715103054.84849-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715103054.84849-1-hverkuil-cisco@xs4all.nl>
References: <20190715103054.84849-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfCTcJt3rxHkjQpagPVH5KJO+2Zhdc6fLS2Qk5ffpGryCY7yPTlItemOGsDeAuXkVkWmxibR4L0JYi/hnl6iFc0+tzI4soVE59rJTIM+E1ZbhNmIWagWh
 uzvRkU0CIL2Gmhz5BgyDa6uY1MPxn1jeqiLWJ59rbYeMuIkcDbcmdoiAqNiBBn8tqBrbYn/O5uYp6gfLV8blEcjill/Jefyb69ntaqW+54fLhFBrI2NScsdy
 xqyaYHkETC4rFrkFKXhBVzbB3Z0Te+fWl+6cDYIWcyBskUzE6dNyZKUOssA4Ei4mpOZOnGydrXawqXLayWAqbx8HrNbTWB3OSrsVuvSeHhAYzJT7GYE9jXvU
 JYe6anIL
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the new cec_notifier_cec_adap_(un)register() functions to
(un)register the notifier for the CEC adapter.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/media/platform/meson/ao-cec-g12a.c | 48 +++++++++++-----------
 drivers/media/platform/meson/ao-cec.c      | 44 +++++++++-----------
 2 files changed, 42 insertions(+), 50 deletions(-)

diff --git a/drivers/media/platform/meson/ao-cec-g12a.c b/drivers/media/platform/meson/ao-cec-g12a.c
index fb52e5dd044a..c99d01926673 100644
--- a/drivers/media/platform/meson/ao-cec-g12a.c
+++ b/drivers/media/platform/meson/ao-cec-g12a.c
@@ -635,17 +635,19 @@ static int meson_ao_cec_g12a_probe(struct platform_device *pdev)
 	spin_lock_init(&ao_cec->cec_reg_lock);
 	ao_cec->pdev = pdev;
 
-	ao_cec->notify = cec_notifier_get(hdmi_dev);
-	if (!ao_cec->notify)
-		return -ENOMEM;
-
 	ao_cec->adap = cec_allocate_adapter(&meson_ao_cec_g12a_ops, ao_cec,
 					    "meson_g12a_ao_cec",
-					    CEC_CAP_DEFAULTS,
+					    CEC_CAP_DEFAULTS |
+					    CEC_CAP_CONNECTOR_INFO,
 					    CEC_MAX_LOG_ADDRS);
-	if (IS_ERR(ao_cec->adap)) {
-		ret = PTR_ERR(ao_cec->adap);
-		goto out_probe_notify;
+	if (IS_ERR(ao_cec->adap))
+		return PTR_ERR(ao_cec->adap);
+
+	ao_cec->notify = cec_notifier_cec_adap_register(hdmi_dev, NULL,
+							ao_cec->adap);
+	if (!ao_cec->notify) {
+		ret = -ENOMEM;
+		goto out_probe_adapter;
 	}
 
 	ao_cec->adap->owner = THIS_MODULE;
@@ -654,21 +656,21 @@ static int meson_ao_cec_g12a_probe(struct platform_device *pdev)
 	base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(base)) {
 		ret = PTR_ERR(base);
-		goto out_probe_adapter;
+		goto out_probe_notify;
 	}
 
 	ao_cec->regmap = devm_regmap_init_mmio(&pdev->dev, base,
 					       &meson_ao_cec_g12a_regmap_conf);
 	if (IS_ERR(ao_cec->regmap)) {
 		ret = PTR_ERR(ao_cec->regmap);
-		goto out_probe_adapter;
+		goto out_probe_notify;
 	}
 
 	ao_cec->regmap_cec = devm_regmap_init(&pdev->dev, NULL, ao_cec,
 					   &meson_ao_cec_g12a_cec_regmap_conf);
 	if (IS_ERR(ao_cec->regmap_cec)) {
 		ret = PTR_ERR(ao_cec->regmap_cec);
-		goto out_probe_adapter;
+		goto out_probe_notify;
 	}
 
 	irq = platform_get_irq(pdev, 0);
@@ -678,24 +680,24 @@ static int meson_ao_cec_g12a_probe(struct platform_device *pdev)
 					0, NULL, ao_cec);
 	if (ret) {
 		dev_err(&pdev->dev, "irq request failed\n");
-		goto out_probe_adapter;
+		goto out_probe_notify;
 	}
 
 	ao_cec->oscin = devm_clk_get(&pdev->dev, "oscin");
 	if (IS_ERR(ao_cec->oscin)) {
 		dev_err(&pdev->dev, "oscin clock request failed\n");
 		ret = PTR_ERR(ao_cec->oscin);
-		goto out_probe_adapter;
+		goto out_probe_notify;
 	}
 
 	ret = meson_ao_cec_g12a_setup_clk(ao_cec);
 	if (ret)
-		goto out_probe_adapter;
+		goto out_probe_notify;
 
 	ret = clk_prepare_enable(ao_cec->core);
 	if (ret) {
 		dev_err(&pdev->dev, "core clock enable failed\n");
-		goto out_probe_adapter;
+		goto out_probe_notify;
 	}
 
 	device_reset_optional(&pdev->dev);
@@ -703,27 +705,23 @@ static int meson_ao_cec_g12a_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, ao_cec);
 
 	ret = cec_register_adapter(ao_cec->adap, &pdev->dev);
-	if (ret < 0) {
-		cec_notifier_put(ao_cec->notify);
+	if (ret < 0)
 		goto out_probe_core_clk;
-	}
 
 	/* Setup Hardware */
 	regmap_write(ao_cec->regmap, CECB_GEN_CNTL_REG, CECB_GEN_CNTL_RESET);
 
-	cec_register_cec_notifier(ao_cec->adap, ao_cec->notify);
-
 	return 0;
 
 out_probe_core_clk:
 	clk_disable_unprepare(ao_cec->core);
 
+out_probe_notify:
+	cec_notifier_cec_adap_unregister(ao_cec->notify);
+
 out_probe_adapter:
 	cec_delete_adapter(ao_cec->adap);
 
-out_probe_notify:
-	cec_notifier_put(ao_cec->notify);
-
 	dev_err(&pdev->dev, "CEC controller registration failed\n");
 
 	return ret;
@@ -735,9 +733,9 @@ static int meson_ao_cec_g12a_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(ao_cec->core);
 
-	cec_unregister_adapter(ao_cec->adap);
+	cec_notifier_cec_adap_unregister(ao_cec->notify);
 
-	cec_notifier_put(ao_cec->notify);
+	cec_unregister_adapter(ao_cec->adap);
 
 	return 0;
 }
diff --git a/drivers/media/platform/meson/ao-cec.c b/drivers/media/platform/meson/ao-cec.c
index facf9b029e79..64ed549bf012 100644
--- a/drivers/media/platform/meson/ao-cec.c
+++ b/drivers/media/platform/meson/ao-cec.c
@@ -616,20 +616,19 @@ static int meson_ao_cec_probe(struct platform_device *pdev)
 
 	spin_lock_init(&ao_cec->cec_reg_lock);
 
-	ao_cec->notify = cec_notifier_get(hdmi_dev);
-	if (!ao_cec->notify)
-		return -ENOMEM;
-
 	ao_cec->adap = cec_allocate_adapter(&meson_ao_cec_ops, ao_cec,
 					    "meson_ao_cec",
-					    CEC_CAP_LOG_ADDRS |
-					    CEC_CAP_TRANSMIT |
-					    CEC_CAP_RC |
-					    CEC_CAP_PASSTHROUGH,
+					    CEC_CAP_DEFAULTS |
+					    CEC_CAP_CONNECTOR_INFO,
 					    1); /* Use 1 for now */
-	if (IS_ERR(ao_cec->adap)) {
-		ret = PTR_ERR(ao_cec->adap);
-		goto out_probe_notify;
+	if (IS_ERR(ao_cec->adap))
+		return PTR_ERR(ao_cec->adap);
+
+	ao_cec->notify = cec_notifier_cec_adap_register(hdmi_dev, NULL,
+							ao_cec->adap);
+	if (!ao_cec->notify) {
+		ret = -ENOMEM;
+		goto out_probe_adapter;
 	}
 
 	ao_cec->adap->owner = THIS_MODULE;
@@ -638,7 +637,7 @@ static int meson_ao_cec_probe(struct platform_device *pdev)
 	ao_cec->base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(ao_cec->base)) {
 		ret = PTR_ERR(ao_cec->base);
-		goto out_probe_adapter;
+		goto out_probe_notify;
 	}
 
 	irq = platform_get_irq(pdev, 0);
@@ -648,20 +647,20 @@ static int meson_ao_cec_probe(struct platform_device *pdev)
 					0, NULL, ao_cec);
 	if (ret) {
 		dev_err(&pdev->dev, "irq request failed\n");
-		goto out_probe_adapter;
+		goto out_probe_notify;
 	}
 
 	ao_cec->core = devm_clk_get(&pdev->dev, "core");
 	if (IS_ERR(ao_cec->core)) {
 		dev_err(&pdev->dev, "core clock request failed\n");
 		ret = PTR_ERR(ao_cec->core);
-		goto out_probe_adapter;
+		goto out_probe_notify;
 	}
 
 	ret = clk_prepare_enable(ao_cec->core);
 	if (ret) {
 		dev_err(&pdev->dev, "core clock enable failed\n");
-		goto out_probe_adapter;
+		goto out_probe_notify;
 	}
 
 	ret = clk_set_rate(ao_cec->core, CEC_CLK_RATE);
@@ -676,28 +675,24 @@ static int meson_ao_cec_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, ao_cec);
 
 	ret = cec_register_adapter(ao_cec->adap, &pdev->dev);
-	if (ret < 0) {
-		cec_notifier_put(ao_cec->notify);
+	if (ret < 0)
 		goto out_probe_clk;
-	}
 
 	/* Setup Hardware */
 	writel_relaxed(CEC_GEN_CNTL_RESET,
 		       ao_cec->base + CEC_GEN_CNTL_REG);
 
-	cec_register_cec_notifier(ao_cec->adap, ao_cec->notify);
-
 	return 0;
 
 out_probe_clk:
 	clk_disable_unprepare(ao_cec->core);
 
+out_probe_notify:
+	cec_notifier_cec_adap_unregister(ao_cec->notify);
+
 out_probe_adapter:
 	cec_delete_adapter(ao_cec->adap);
 
-out_probe_notify:
-	cec_notifier_put(ao_cec->notify);
-
 	dev_err(&pdev->dev, "CEC controller registration failed\n");
 
 	return ret;
@@ -709,10 +704,9 @@ static int meson_ao_cec_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(ao_cec->core);
 
+	cec_notifier_cec_adap_unregister(ao_cec->notify);
 	cec_unregister_adapter(ao_cec->adap);
 
-	cec_notifier_put(ao_cec->notify);
-
 	return 0;
 }
 
-- 
2.20.1

