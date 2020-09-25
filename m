Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B67D2790A5
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 20:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730054AbgIYSeK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 14:34:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729644AbgIYSeJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 14:34:09 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3018DC0613D3
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:34:09 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id k8so4030430pfk.2
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Y4t9XD5GcXO3lFZ+ybjaf1F+Annig7SwGk+A/Y+pjdk=;
        b=ps5alxjCCkw3sEZk28BUPykUXqpAofgGVKU9pyPIjeI0A6G8AFZm4MK610NXSwkTWc
         9h9DteIGcYZi8GsWRQty6IUxGO233CrA66oS+Ezdb5VzLnvvxGqfGpFp+XOidIdvnEEu
         1A50cXL0gCgdAIoxKfE0fRxFxRMygwpVs07dyQFR7qgdvzoflwImMBf8v+dByU0huFoc
         Fei/kr3Ap0BWSNYLNuoDOYs4tsucvJChyZpuBib2Utn/z1dwI1bl3WszECgPdbCNm4CR
         XH+4adj29Q/OV1Va87/bn9e0gSAmodEt6I2SBQJjdfwVJFbuaSDsmFYBrI+Kiy7Kc4XT
         lKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Y4t9XD5GcXO3lFZ+ybjaf1F+Annig7SwGk+A/Y+pjdk=;
        b=MupxGua/ckDdwE88RAMu2HmVO4O2Ank0tf2589FGrY0BBxYUsXZE8tc4JrK/jJNmH4
         Uq1JWnZ8eqAUc/rID02FZhtHO40UFJKhfzSdM0l3iOf0S0Cil626eC3H2oh41ba/FUVd
         YhUZRrtL8aFQC8/n8pYbZVRGC8jrndeXvFzAfm9RMl/BbzKVsvzu/1tEaxbXLBQ35TYN
         3eNb5ioOgQP06CQ5FTinWZEOzQWq2enZTayKWnsKCyPLwtEK/0JoG1wTS4zoFA5VWhfF
         tMbWC+d+noKf8T62JIjiFsH7HwhtNRm780XaY7kjsblxpkhnp3hCQBEVjSniCnB/J3/2
         Fu/g==
X-Gm-Message-State: AOAM530A4XC1qw+E2xEdwUD5x/TtL1ovXFp3+xvpfviPrZKjxyJxdqRV
        DPikQZULLpmFXlESL7Tf8mkG5Q==
X-Google-Smtp-Source: ABdhPJwGh6WhUaRPZeBEB30oZcLZHt/4f9bqH965SBGS+elOhvhyhnQUmkeJ3DxULfyHwBpeLld0NQ==
X-Received: by 2002:aa7:869a:0:b029:142:2501:34d1 with SMTP id d26-20020aa7869a0000b0290142250134d1mr582877pfo.42.1601058848735;
        Fri, 25 Sep 2020 11:34:08 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id r16sm2554546pjo.19.2020.09.25.11.34.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 11:34:08 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC v2 29/47] staging: media: zoran: use devm for videocodec_master alloc
Date:   Fri, 25 Sep 2020 18:30:39 +0000
Message-Id: <1601058657-14042-30-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
References: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Let's use devm allocations for videocodec, this simplify code.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_card.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index fe0c5a7c967c..a3e7b0027d69 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -996,18 +996,10 @@ static void zoran_remove(struct pci_dev *pdev)
 		goto exit_free;
 
 	/* unregister videocodec bus */
-	if (zr->codec) {
-		struct videocodec_master *master = zr->codec->master_data;
-
+	if (zr->codec)
 		videocodec_detach(zr->codec);
-		kfree(master);
-	}
-	if (zr->vfe) {
-		struct videocodec_master *master = zr->vfe->master_data;
-
+	if (zr->vfe)
 		videocodec_detach(zr->vfe);
-		kfree(master);
-	}
 
 	/* unregister i2c bus */
 	zoran_unregister_i2c(zr);
@@ -1036,7 +1028,7 @@ static struct videocodec_master *zoran_setup_videocodec(struct zoran *zr,
 {
 	struct videocodec_master *m = NULL;
 
-	m = kmalloc(sizeof(*m), GFP_KERNEL);
+	m = devm_kmalloc(&zr->pci_dev->dev, sizeof(*m), GFP_KERNEL);
 	if (!m)
 		return m;
 
@@ -1245,7 +1237,7 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		zr->codec = videocodec_attach(master_codec);
 		if (!zr->codec) {
 			pci_err(pdev, "%s - no codec found\n", __func__);
-			goto zr_free_codec;
+			goto zr_unreg_i2c;
 		}
 		if (zr->codec->type != zr->card.video_codec) {
 			pci_err(pdev, "%s - wrong codec\n", __func__);
@@ -1259,7 +1251,7 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		zr->vfe = videocodec_attach(master_vfe);
 		if (!zr->vfe) {
 			pci_err(pdev, "%s - no VFE found\n", __func__);
-			goto zr_free_vfe;
+			goto zr_detach_codec;
 		}
 		if (zr->vfe->type != zr->card.video_vfe) {
 			pci_err(pdev, "%s = wrong VFE\n", __func__);
@@ -1280,12 +1272,8 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 zr_detach_vfe:
 	videocodec_detach(zr->vfe);
-zr_free_vfe:
-	kfree(master_vfe);
 zr_detach_codec:
 	videocodec_detach(zr->codec);
-zr_free_codec:
-	kfree(master_codec);
 zr_unreg_i2c:
 	zoran_unregister_i2c(zr);
 zr_free_irq:
-- 
2.26.2

