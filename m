Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD18654BA2A
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 21:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345187AbiFNTML (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 15:12:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245174AbiFNTMK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 15:12:10 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E833205CF
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 12:12:09 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240126034.bbtec.net [36.240.126.34])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 697FF9E5;
        Tue, 14 Jun 2022 21:12:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655233927;
        bh=MN+k+386HwfC89iXMHL522rxnVO8f8e0jWiEPtZXKlI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oL09Tb7mRFKMOrMiHIzBgkQnQjP2jQciWy6gmtnoJNDVXOWV5G9c8DiM+p4N6e7nO
         CpI7HCu92KAEQYQpZfRL1TC4Lgu/LDgtknVIFuiYOf/DA0ShYssLg/30CI1pOUFiwu
         /YlXessdkT6w9ajLpqGTQNo+hN/sMo8+0TEAQe24=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dafna@fastmail.com, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 05/55] media: rkisp1: Read the ID register at probe time instead of streamon
Date:   Wed, 15 Jun 2022 04:10:37 +0900
Message-Id: <20220614191127.3420492-6-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

There's no need to read the ID register every time streaming is started.
Do it once, at probe time.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 10 ++++++++++
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c |  4 ----
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 248f0172ca62..ba773c0784fb 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -467,6 +467,7 @@ static int rkisp1_probe(struct platform_device *pdev)
 	struct v4l2_device *v4l2_dev;
 	unsigned int i;
 	int ret, irq;
+	u32 cif_id;
 
 	match_data = of_device_get_match_data(&pdev->dev);
 	if (!match_data)
@@ -509,6 +510,15 @@ static int rkisp1_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(&pdev->dev);
 
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret)
+		goto err_pm_runtime_disable;
+
+	cif_id = rkisp1_read(rkisp1, RKISP1_CIF_VI_ID);
+	dev_dbg(rkisp1->dev, "CIF_ID 0x%08x\n", cif_id);
+
+	pm_runtime_put(&pdev->dev);
+
 	rkisp1->media_dev.hw_revision = match_data->isp_ver;
 	strscpy(rkisp1->media_dev.model, RKISP1_DRIVER_NAME,
 		sizeof(rkisp1->media_dev.model));
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 187d78075acb..02968656f3c0 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -473,12 +473,8 @@ static int rkisp1_config_path(struct rkisp1_device *rkisp1)
 /* Hardware configure Entry */
 static int rkisp1_config_cif(struct rkisp1_device *rkisp1)
 {
-	u32 cif_id;
 	int ret;
 
-	cif_id = rkisp1_read(rkisp1, RKISP1_CIF_VI_ID);
-	dev_dbg(rkisp1->dev, "CIF_ID 0x%08x\n", cif_id);
-
 	ret = rkisp1_config_isp(rkisp1);
 	if (ret)
 		return ret;
-- 
2.30.2

