Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED5136F5A3
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 08:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbhD3GUV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 02:20:21 -0400
Received: from m12-16.163.com ([220.181.12.16]:41432 "EHLO m12-16.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229482AbhD3GUP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 02:20:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=KvHw+
        KCns76RVhHDXsF2R42ufhs063wgmEGrav49uD0=; b=GYfMTYTqLIOYkcf8j9o4s
        wLRtlD4V15VUMWQm4eFrQX0GNni7PapryjGHd/vgUM+ncaLnWY0RimmEYg3LW9vA
        F6sONMvZCNVaGHp2t9atKLHkYGofU9dB4/y1xkdPygA9/f+/M9XqkxTNncJpKU5b
        p/MTrBYfhDTNfU1JT522QI=
Received: from COOL-20201222LC.ccdomain.com (unknown [218.94.48.178])
        by smtp12 (Coremail) with SMTP id EMCowABnzUZeoYtgiLnUoQ--.999S2;
        Fri, 30 Apr 2021 14:19:11 +0800 (CST)
From:   dingsenjie@163.com
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dingsenjie <dingsenjie@yulong.com>
Subject: [PATCH] media: qcom/camss: Use devm_platform_ioremap_resource_byname
Date:   Fri, 30 Apr 2021 14:18:33 +0800
Message-Id: <20210430061833.32960-1-dingsenjie@163.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EMCowABnzUZeoYtgiLnUoQ--.999S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJw4rZrWfGF4DZr13Ww17ZFb_yoWrWw4fpr
        WxGFWxur13GF4UC348Jw1DCF4rJF1F9ayUWr43Zw1fZa9xJr9rAw4UCa40yryqyFWjv3W7
        Jr4SqFyUZa9Y9F7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jbpnQUUUUU=
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 5glqw25hqmxvi6rwjhhfrp/1tbiHh+EyFSIuNfdOQAAsa
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: dingsenjie <dingsenjie@yulong.com>

Use the devm_platform_ioremap_resource_byname() helper instead of
calling platform_get_resource_byname() and devm_ioremap_resource()
separately.

Signed-off-by: dingsenjie <dingsenjie@yulong.com>
---
 drivers/media/platform/qcom/camss/camss-csid.c   | 3 +--
 drivers/media/platform/qcom/camss/camss-csiphy.c | 6 ++----
 drivers/media/platform/qcom/camss/camss-ispif.c  | 6 ++----
 drivers/media/platform/qcom/camss/camss-vfe.c    | 3 +--
 4 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index be3fe76..b62f6ae 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -1111,8 +1111,7 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 
 	/* Memory */
 
-	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, res->reg[0]);
-	csid->base = devm_ioremap_resource(dev, r);
+	csid->base = devm_platform_ioremap_resource_byname(pdev, res->reg[0]);
 	if (IS_ERR(csid->base)) {
 		dev_err(dev, "could not map memory\n");
 		return PTR_ERR(csid->base);
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 509c9a5..c46f4bf 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -563,15 +563,13 @@ int msm_csiphy_subdev_init(struct camss *camss,
 
 	/* Memory */
 
-	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, res->reg[0]);
-	csiphy->base = devm_ioremap_resource(dev, r);
+	csiphy->base = devm_platform_ioremap_resource_byname(pdev, res->reg[0]);
 	if (IS_ERR(csiphy->base)) {
 		dev_err(dev, "could not map memory\n");
 		return PTR_ERR(csiphy->base);
 	}
 
-	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, res->reg[1]);
-	csiphy->base_clk_mux = devm_ioremap_resource(dev, r);
+	csiphy->base_clk_mux = devm_platform_ioremap_resource_byname(pdev, res->reg[1]);
 	if (IS_ERR(csiphy->base_clk_mux)) {
 		dev_err(dev, "could not map memory\n");
 		return PTR_ERR(csiphy->base_clk_mux);
diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
index adeb928..de624fe 100644
--- a/drivers/media/platform/qcom/camss/camss-ispif.c
+++ b/drivers/media/platform/qcom/camss/camss-ispif.c
@@ -1131,15 +1131,13 @@ int msm_ispif_subdev_init(struct ispif_device *ispif,
 
 	/* Memory */
 
-	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, res->reg[0]);
-	ispif->base = devm_ioremap_resource(dev, r);
+	ispif->base = devm_platform_ioremap_resource_byname(pdev, res->reg[0]);
 	if (IS_ERR(ispif->base)) {
 		dev_err(dev, "could not map memory\n");
 		return PTR_ERR(ispif->base);
 	}
 
-	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, res->reg[1]);
-	ispif->base_clk_mux = devm_ioremap_resource(dev, r);
+	ispif->base_clk_mux = devm_platform_ioremap_resource_byname(pdev, res->reg[1]);
 	if (IS_ERR(ispif->base_clk_mux)) {
 		dev_err(dev, "could not map memory\n");
 		return PTR_ERR(ispif->base_clk_mux);
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index fae2b51..54986cf 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -2008,8 +2008,7 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 
 	/* Memory */
 
-	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, res->reg[0]);
-	vfe->base = devm_ioremap_resource(dev, r);
+	vfe->base = devm_platform_ioremap_resource_byname(pdev, res->reg[0]);
 	if (IS_ERR(vfe->base)) {
 		dev_err(dev, "could not map memory\n");
 		return PTR_ERR(vfe->base);
-- 
1.9.1


