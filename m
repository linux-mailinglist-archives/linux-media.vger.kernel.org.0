Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 235B268712
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2019 12:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729756AbfGOKa6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jul 2019 06:30:58 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:41339 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729739AbfGOKa6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jul 2019 06:30:58 -0400
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:3de9:fbf:e548:c8fc])
        by smtp-cloud7.xs4all.net with ESMTPA
        id myFyhc6VO0SBqmyG0hRPL6; Mon, 15 Jul 2019 12:30:56 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: [PATCH 5/6] stih-cec: use cec_notifier_cec_adap_(un)register
Date:   Mon, 15 Jul 2019 12:30:53 +0200
Message-Id: <20190715103054.84849-6-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715103054.84849-1-hverkuil-cisco@xs4all.nl>
References: <20190715103054.84849-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfCTcJt3rxHkjQpagPVH5KJO+2Zhdc6fLS2Qk5ffpGryCY7yPTlItemOGsDeAuXkVkWmxibR4L0JYi/hnl6iFc0+tzI4soVE59rJTIM+E1ZbhNmIWagWh
 uzvRkU0CIL2Gmhz5BgyDa6uY1MPxn1jeqiLWJ59rbYeMuIkcDbcmdoiAqNiBBn8tqBrbYn/O5uYp6gfLV8blEcjill/Jefyb69ntaqW+54fLhFBrI2NScsdy
 xqyaYHkETC4rFrkFKXhBVzbB3Z0Te+fWl+6cDYIWcyBskUzE6dNyZKUOssA4Ei4me5YujQ2En+BQKfWasnsVC3K01PPnONa7VxMjupEqszUFXx3Gz3TmGAeE
 IsoD5FwM
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use cec_notifier_cec_adap_(un)register instead of
cec_notifier_get, cec_notifier_put and cec_register_cec_notifier.

Also enable the CEC_CAP_CONNECTOR_INFO capability.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
---
 drivers/media/platform/sti/cec/stih-cec.c | 32 ++++++++++++++---------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/sti/cec/stih-cec.c b/drivers/media/platform/sti/cec/stih-cec.c
index fc37efe1d554..8118c7365d3f 100644
--- a/drivers/media/platform/sti/cec/stih-cec.c
+++ b/drivers/media/platform/sti/cec/stih-cec.c
@@ -313,10 +313,6 @@ static int stih_cec_probe(struct platform_device *pdev)
 	if (!cec)
 		return -ENOMEM;
 
-	cec->notifier = cec_notifier_get(hdmi_dev);
-	if (!cec->notifier)
-		return -ENOMEM;
-
 	cec->dev = dev;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -340,30 +336,42 @@ static int stih_cec_probe(struct platform_device *pdev)
 		return PTR_ERR(cec->clk);
 	}
 
-	cec->adap = cec_allocate_adapter(&sti_cec_adap_ops, cec,
-			CEC_NAME, CEC_CAP_DEFAULTS, CEC_MAX_LOG_ADDRS);
+	cec->adap = cec_allocate_adapter(&sti_cec_adap_ops, cec, CEC_NAME,
+					 CEC_CAP_DEFAULTS |
+					 CEC_CAP_CONNECTOR_INFO,
+					 CEC_MAX_LOG_ADDRS);
 	ret = PTR_ERR_OR_ZERO(cec->adap);
 	if (ret)
 		return ret;
 
-	ret = cec_register_adapter(cec->adap, &pdev->dev);
-	if (ret) {
-		cec_delete_adapter(cec->adap);
-		return ret;
+	cec->notifier = cec_notifier_cec_adap_register(hdmi_dev, NULL,
+						       cec->adap);
+	if (!cec->notifier) {
+		ret = -ENOMEM;
+		goto err_delete_adapter;
 	}
 
-	cec_register_cec_notifier(cec->adap, cec->notifier);
+	ret = cec_register_adapter(cec->adap, &pdev->dev);
+	if (ret)
+		goto err_notifier;
 
 	platform_set_drvdata(pdev, cec);
 	return 0;
+
+err_notifier:
+	cec_notifier_cec_adap_unregister(cec->notifier);
+
+err_delete_adapter:
+	cec_delete_adapter(cec->adap);
+	return ret;
 }
 
 static int stih_cec_remove(struct platform_device *pdev)
 {
 	struct stih_cec *cec = platform_get_drvdata(pdev);
 
+	cec_notifier_cec_adap_unregister(cec->notifier);
 	cec_unregister_adapter(cec->adap);
-	cec_notifier_put(cec->notifier);
 
 	return 0;
 }
-- 
2.20.1

