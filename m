Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EE4C48A44E
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 01:23:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345882AbiAKAXb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jan 2022 19:23:31 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:4418 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S238204AbiAKAXa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jan 2022 19:23:30 -0500
X-IronPort-AV: E=Sophos;i="5.88,278,1635174000"; 
   d="scan'208";a="106595510"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 11 Jan 2022 09:23:29 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id BD5E14157D0D;
        Tue, 11 Jan 2022 09:23:26 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Robert Foss <robert.foss@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/13] media: camss: Use platform_get_irq_byname() to get the interrupt
Date:   Tue, 11 Jan 2022 00:23:03 +0000
Message-Id: <20220111002314.15213-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220111002314.15213-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220111002314.15213-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

platform_get_resource_byname(pdev, IORESOURCE_IRQ, ..) relies on static
allocation of IRQ resources in DT core code, this causes an issue
when using hierarchical interrupt domains using "interrupts" property
in the node as this bypasses the hierarchical setup and messes up the
irq chaining.

In preparation for removal of static setup of IRQ resource from DT core
code use platform_get_irq_byname().

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
* No change.
---
 drivers/media/platform/qcom/camss/camss-csid.c   | 12 ++++--------
 drivers/media/platform/qcom/camss/camss-csiphy.c | 12 ++++--------
 drivers/media/platform/qcom/camss/camss-ispif.c  | 12 ++++--------
 drivers/media/platform/qcom/camss/camss-vfe.c    | 12 ++++--------
 4 files changed, 16 insertions(+), 32 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index a1637b78568b..ac3504e98668 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -544,7 +544,6 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 {
 	struct device *dev = camss->dev;
 	struct platform_device *pdev = to_platform_device(dev);
-	struct resource *r;
 	int i, j;
 	int ret;
 
@@ -571,14 +570,11 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 
 	/* Interrupt */
 
-	r = platform_get_resource_byname(pdev, IORESOURCE_IRQ,
-					 res->interrupt[0]);
-	if (!r) {
-		dev_err(dev, "missing IRQ\n");
-		return -EINVAL;
-	}
+	ret = platform_get_irq_byname(pdev, res->interrupt[0]);
+	if (ret < 0)
+		return ret;
 
-	csid->irq = r->start;
+	csid->irq = ret;
 	snprintf(csid->irq_name, sizeof(csid->irq_name), "%s_%s%d",
 		 dev_name(dev), MSM_CSID_NAME, csid->id);
 	ret = devm_request_irq(dev, csid->irq, csid->ops->isr,
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 24eec16197e7..6b225d06f35a 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -568,7 +568,6 @@ int msm_csiphy_subdev_init(struct camss *camss,
 {
 	struct device *dev = camss->dev;
 	struct platform_device *pdev = to_platform_device(dev);
-	struct resource *r;
 	int i, j;
 	int ret;
 
@@ -611,14 +610,11 @@ int msm_csiphy_subdev_init(struct camss *camss,
 
 	/* Interrupt */
 
-	r = platform_get_resource_byname(pdev, IORESOURCE_IRQ,
-					 res->interrupt[0]);
-	if (!r) {
-		dev_err(dev, "missing IRQ\n");
-		return -EINVAL;
-	}
+	ret = platform_get_irq_byname(pdev, res->interrupt[0]);
+	if (ret < 0)
+		return ret;
 
-	csiphy->irq = r->start;
+	csiphy->irq = ret;
 	snprintf(csiphy->irq_name, sizeof(csiphy->irq_name), "%s_%s%d",
 		 dev_name(dev), MSM_CSIPHY_NAME, csiphy->id);
 
diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
index ba5d65f6ef34..4ee11bb979cd 100644
--- a/drivers/media/platform/qcom/camss/camss-ispif.c
+++ b/drivers/media/platform/qcom/camss/camss-ispif.c
@@ -1100,7 +1100,6 @@ int msm_ispif_subdev_init(struct camss *camss,
 	struct device *dev = camss->dev;
 	struct ispif_device *ispif = camss->ispif;
 	struct platform_device *pdev = to_platform_device(dev);
-	struct resource *r;
 	int i;
 	int ret;
 
@@ -1153,14 +1152,11 @@ int msm_ispif_subdev_init(struct camss *camss,
 
 	/* Interrupt */
 
-	r = platform_get_resource_byname(pdev, IORESOURCE_IRQ, res->interrupt);
-
-	if (!r) {
-		dev_err(dev, "missing IRQ\n");
-		return -EINVAL;
-	}
+	ret = platform_get_irq_byname(pdev, res->interrupt);
+	if (ret < 0)
+		return ret;
 
-	ispif->irq = r->start;
+	ispif->irq = ret;
 	snprintf(ispif->irq_name, sizeof(ispif->irq_name), "%s_%s",
 		 dev_name(dev), MSM_ISPIF_NAME);
 	if (camss->version == CAMSS_8x16)
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 71f78b40e7f5..7c2311d70546 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1279,7 +1279,6 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 {
 	struct device *dev = camss->dev;
 	struct platform_device *pdev = to_platform_device(dev);
-	struct resource *r;
 	int i, j;
 	int ret;
 
@@ -1312,14 +1311,11 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 
 	/* Interrupt */
 
-	r = platform_get_resource_byname(pdev, IORESOURCE_IRQ,
-					 res->interrupt[0]);
-	if (!r) {
-		dev_err(dev, "missing IRQ\n");
-		return -EINVAL;
-	}
+	ret = platform_get_irq_byname(pdev, res->interrupt[0]);
+	if (ret < 0)
+		return ret;
 
-	vfe->irq = r->start;
+	vfe->irq = ret;
 	snprintf(vfe->irq_name, sizeof(vfe->irq_name), "%s_%s%d",
 		 dev_name(dev), MSM_VFE_NAME, vfe->id);
 	ret = devm_request_irq(dev, vfe->irq, vfe->ops->isr,
-- 
2.17.1

