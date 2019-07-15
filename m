Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEAE168711
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2019 12:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729755AbfGOKa6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jul 2019 06:30:58 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:39723 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729728AbfGOKa6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jul 2019 06:30:58 -0400
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:3de9:fbf:e548:c8fc])
        by smtp-cloud7.xs4all.net with ESMTPA
        id myFyhc6VO0SBqmyG0hRPKp; Mon, 15 Jul 2019 12:30:56 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH 4/6] s5p-cec: use cec_notifier_cec_adap_(un)register
Date:   Mon, 15 Jul 2019 12:30:52 +0200
Message-Id: <20190715103054.84849-5-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715103054.84849-1-hverkuil-cisco@xs4all.nl>
References: <20190715103054.84849-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfCTcJt3rxHkjQpagPVH5KJO+2Zhdc6fLS2Qk5ffpGryCY7yPTlItemOGsDeAuXkVkWmxibR4L0JYi/hnl6iFc0+tzI4soVE59rJTIM+E1ZbhNmIWagWh
 uzvRkU0CIL2Gmhz5BgyDa6uY1MPxn1jeqiLWJ59rbYeMuIkcDbcmdoiAqNiBBn8tqBrbYn/O5uYp6rKRFOtDOCZAOBacqzAjcQpjf/sAqJl63fdIwTRIIE+w
 jRXFfVBMhJOyhUBrxuvYJWQ0XnDZsYETfPBTsIqBzwQnDnwYazZUi1I9nKkURTIyq59GgBg5H1QlQ2Psu39f2F1W5aslBQGP7WRL8TypSxQHjZMQYUViHy/l
 chYwSWMlSoW96FugVynciRFheIu76Q==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use cec_notifier_cec_adap_(un)register instead of
cec_notifier_get, cec_notifier_put and cec_register_cec_notifier.

Also enable the CEC_CAP_CONNECTOR_INFO capability.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>
---
 drivers/media/platform/s5p-cec/s5p_cec.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/s5p-cec/s5p_cec.c b/drivers/media/platform/s5p-cec/s5p_cec.c
index ea6231b387ed..6ddcc35b0bbd 100644
--- a/drivers/media/platform/s5p-cec/s5p_cec.c
+++ b/drivers/media/platform/s5p-cec/s5p_cec.c
@@ -214,21 +214,23 @@ static int s5p_cec_probe(struct platform_device *pdev)
 	if (IS_ERR(cec->reg))
 		return PTR_ERR(cec->reg);
 
-	cec->notifier = cec_notifier_get(hdmi_dev);
-	if (cec->notifier == NULL)
-		return -ENOMEM;
-
 	cec->adap = cec_allocate_adapter(&s5p_cec_adap_ops, cec, CEC_NAME,
-		CEC_CAP_DEFAULTS | (needs_hpd ? CEC_CAP_NEEDS_HPD : 0), 1);
+		CEC_CAP_DEFAULTS | (needs_hpd ? CEC_CAP_NEEDS_HPD : 0) |
+		CEC_CAP_CONNECTOR_INFO, 1);
 	ret = PTR_ERR_OR_ZERO(cec->adap);
 	if (ret)
 		return ret;
 
-	ret = cec_register_adapter(cec->adap, &pdev->dev);
-	if (ret)
+	cec->notifier = cec_notifier_cec_adap_register(hdmi_dev, NULL,
+						       cec->adap);
+	if (!cec->notifier) {
+		ret = -ENOMEM;
 		goto err_delete_adapter;
+	}
 
-	cec_register_cec_notifier(cec->adap, cec->notifier);
+	ret = cec_register_adapter(cec->adap, &pdev->dev);
+	if (ret)
+		goto err_notifier;
 
 	platform_set_drvdata(pdev, cec);
 	pm_runtime_enable(dev);
@@ -236,6 +238,9 @@ static int s5p_cec_probe(struct platform_device *pdev)
 	dev_dbg(dev, "successfully probed\n");
 	return 0;
 
+err_notifier:
+	cec_notifier_cec_adap_unregister(cec->notifier);
+
 err_delete_adapter:
 	cec_delete_adapter(cec->adap);
 	return ret;
@@ -245,8 +250,8 @@ static int s5p_cec_remove(struct platform_device *pdev)
 {
 	struct s5p_cec_dev *cec = platform_get_drvdata(pdev);
 
+	cec_notifier_cec_adap_unregister(cec->notifier);
 	cec_unregister_adapter(cec->adap);
-	cec_notifier_put(cec->notifier);
 	pm_runtime_disable(&pdev->dev);
 	return 0;
 }
-- 
2.20.1

