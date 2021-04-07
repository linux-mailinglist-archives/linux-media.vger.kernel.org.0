Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59CA33563DE
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 08:24:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233817AbhDGGYe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 02:24:34 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:15620 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230426AbhDGGYe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Apr 2021 02:24:34 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FFZ791KNgz17Qtv;
        Wed,  7 Apr 2021 14:22:13 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Wed, 7 Apr 2021 14:24:14 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <robert.foss@linaro.org>, <todor.too@gmail.com>,
        <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>, Tian Tao <tiantao6@hisilicon.com>
Subject: [PATCH] media: camss: move to use request_irq by IRQF_NO_AUTOEN flag
Date:   Wed, 7 Apr 2021 14:24:39 +0800
Message-ID: <1617776679-4226-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

disable_irq() after request_irq() still has a time gap in which
interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
disable IRQ auto-enable because of requesting.

this patch is made base on "add IRQF_NO_AUTOEN for request_irq" which
is being merged: https://lore.kernel.org/patchwork/patch/1388765/

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/media/platform/qcom/camss/camss-csid.c   | 5 ++---
 drivers/media/platform/qcom/camss/camss-csiphy.c | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 463760c..46c19bf 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -586,14 +586,13 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 	snprintf(csid->irq_name, sizeof(csid->irq_name), "%s_%s%d",
 		 dev_name(dev), MSM_CSID_NAME, csid->id);
 	ret = devm_request_irq(dev, csid->irq, csid->ops->isr,
-			       IRQF_TRIGGER_RISING, csid->irq_name, csid);
+			       IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN,
+			       csid->irq_name, csid);
 	if (ret < 0) {
 		dev_err(dev, "request_irq failed: %d\n", ret);
 		return ret;
 	}
 
-	disable_irq(csid->irq);
-
 	/* Clocks */
 
 	csid->nclocks = 0;
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 6ceb6d7..fefb4f3 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -625,14 +625,13 @@ int msm_csiphy_subdev_init(struct camss *camss,
 		 dev_name(dev), MSM_CSIPHY_NAME, csiphy->id);
 
 	ret = devm_request_irq(dev, csiphy->irq, csiphy->ops->isr,
-			       IRQF_TRIGGER_RISING, csiphy->irq_name, csiphy);
+			       IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN,
+			       csiphy->irq_name, csiphy);
 	if (ret < 0) {
 		dev_err(dev, "request_irq failed: %d\n", ret);
 		return ret;
 	}
 
-	disable_irq(csiphy->irq);
-
 	/* Clocks */
 
 	csiphy->nclocks = 0;
-- 
2.7.4

