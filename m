Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E65CC68716
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2019 12:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729763AbfGOKbB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jul 2019 06:31:01 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:36665 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729748AbfGOKa6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jul 2019 06:30:58 -0400
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:3de9:fbf:e548:c8fc])
        by smtp-cloud7.xs4all.net with ESMTPA
        id myFyhc6VO0SBqmyG0hRPLH; Mon, 15 Jul 2019 12:30:56 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 6/6] tegra-cec: use cec_notifier_cec_adap_(un)register
Date:   Mon, 15 Jul 2019 12:30:54 +0200
Message-Id: <20190715103054.84849-7-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715103054.84849-1-hverkuil-cisco@xs4all.nl>
References: <20190715103054.84849-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfCTcJt3rxHkjQpagPVH5KJO+2Zhdc6fLS2Qk5ffpGryCY7yPTlItemOGsDeAuXkVkWmxibR4L0JYi/hnl6iFc0+tzI4soVE59rJTIM+E1ZbhNmIWagWh
 uzvRkU0CIL2Gmhz5BgyDa6uY1MPxn1jeqiLWJ59rbYeMuIkcDbcmdoiAqNiBBn8tqBrbYn/O5uYp6gfLV8blEcjill/Jefyb69ntaqW+54fLhFBrI2NScsdy
 xqyaYHkETC4rFrkFKXhBVzbB3Z0Te+fWl+6cDYIWcyBskUzE6dNyZKUOssA4Ei4mYVnz7Fv+sg7KmzVsoAuF1Q19a4wZrm8QzfyhBYgldLlX5lL2f4+kvkGU
 iXtllfVq
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use cec_notifier_cec_adap_(un)register instead of
cec_notifier_get, cec_notifier_put and cec_register_cec_notifier.

Also enable the CEC_CAP_CONNECTOR_INFO capability.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Thierry Reding <thierry.reding@gmail.com>
---
 drivers/media/platform/tegra-cec/tegra_cec.c | 35 ++++++++++----------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/tegra-cec/tegra_cec.c b/drivers/media/platform/tegra-cec/tegra_cec.c
index 6498b2d0492e..a632602131f2 100644
--- a/drivers/media/platform/tegra-cec/tegra_cec.c
+++ b/drivers/media/platform/tegra-cec/tegra_cec.c
@@ -380,38 +380,39 @@ static int tegra_cec_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(&pdev->dev,
 			"Unable to request interrupt for device\n");
-		goto clk_error;
-	}
-
-	cec->notifier = cec_notifier_get(hdmi_dev);
-	if (!cec->notifier) {
-		ret = -ENOMEM;
-		goto clk_error;
+		goto err_clk;
 	}
 
 	cec->adap = cec_allocate_adapter(&tegra_cec_ops, cec, TEGRA_CEC_NAME,
-			CEC_CAP_DEFAULTS | CEC_CAP_MONITOR_ALL,
+			CEC_CAP_DEFAULTS | CEC_CAP_MONITOR_ALL |
+			CEC_CAP_CONNECTOR_INFO,
 			CEC_MAX_LOG_ADDRS);
 	if (IS_ERR(cec->adap)) {
 		ret = -ENOMEM;
 		dev_err(&pdev->dev, "Couldn't create cec adapter\n");
-		goto cec_error;
+		goto err_clk;
+	}
+
+	cec->notifier = cec_notifier_cec_adap_register(hdmi_dev, NULL,
+						       cec->adap);
+	if (!cec->notifier) {
+		ret = -ENOMEM;
+		goto err_adapter;
 	}
+
 	ret = cec_register_adapter(cec->adap, &pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Couldn't register device\n");
-		goto cec_error;
+		goto err_notifier;
 	}
 
-	cec_register_cec_notifier(cec->adap, cec->notifier);
-
 	return 0;
 
-cec_error:
-	if (cec->notifier)
-		cec_notifier_put(cec->notifier);
+err_notifier:
+	cec_notifier_cec_adap_unregister(cec->notifier);
+err_adapter:
 	cec_delete_adapter(cec->adap);
-clk_error:
+err_clk:
 	clk_disable_unprepare(cec->clk);
 	return ret;
 }
@@ -422,8 +423,8 @@ static int tegra_cec_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(cec->clk);
 
+	cec_notifier_cec_adap_unregister(cec->notifier);
 	cec_unregister_adapter(cec->adap);
-	cec_notifier_put(cec->notifier);
 
 	return 0;
 }
-- 
2.20.1

