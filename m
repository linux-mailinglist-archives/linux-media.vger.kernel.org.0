Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E552272055
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 12:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbgIUKVD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 06:21:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726917AbgIUKVC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 06:21:02 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 303B6C0613D1
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:21:02 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id o5so12105504wrn.13
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1urHh7daH3LoOqNIcatz+V8D8QIxpgJB7hMXIZZ34x8=;
        b=YjR+2ZxADZaysP7sw04FPhYP3YPw21PgBstXPTe3UwIIsIvxSdaRgWBLUKrGCbw56r
         KSmiVKdsOVv0Z9mDW82UCgPiG8NptXiVwiymXb+AEp7VChMnFw8+uo2GanEjEhXIZSu9
         AVdIcAPCng8oQxUttO4d0ogtZ32GGoyueYSG11AHhkpx94Ij4JrMlGEjxHwJu/G0POdK
         DGHzJ8X8OyWo3mgdsN/donCalFVhbAISMXlqC3dS0+ZNTyRMhi8mR6rJGTkcsFPaEBUo
         lUpa50VSd70ObhfzKgtAUjCX1Pqcj8jBfKzQQDx34YlFyJwYzKEbN6E6CiVN5yi7NBer
         9xkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1urHh7daH3LoOqNIcatz+V8D8QIxpgJB7hMXIZZ34x8=;
        b=eMUMHrrycKZsgNJ0HyKKlN0x3+C/1IdBO9IFx6T/d/b/4Dz8CdGOP1g8yN6aTQSBIZ
         hGvcBvDX+W/9OLpvoMZ83ehqcUJhp195yPuQl+rvutLThR4DncYY4CY51GICrbKnmk8Y
         o8otFEn34SZelCfm9VzzIE19H338f/iMgeAh3aWrvrCs4jEsJrwVwozlSaV1rGQYAbjR
         isBdA91regWf0q5EWIi+iLh50HVrpMaVQfDBOxQb+YHQH6C4BYkGvZkKwSXt2IYGAraa
         swtFGctdxhgQ8v+AftNk4EJQr1hGu8F7ojqPWORoTH9dWPE87/YOeqlel/sDrhzajdAz
         z0Jg==
X-Gm-Message-State: AOAM5325C62lWBuI63vzaLaaJp2yJDDLJNarQBXaz0sAPig6PzpLyjDH
        qjEhtqZfoz9RgH/cCc8k4v26bg==
X-Google-Smtp-Source: ABdhPJw4Md6NhAxXg8ikwFgPuyNgrFboC/5yIDUW7lgrPEHwO6yzae/wCh2FO6LosU8a+MYU2KltVA==
X-Received: by 2002:adf:f984:: with SMTP id f4mr51635137wrr.102.1600683660854;
        Mon, 21 Sep 2020 03:21:00 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id l17sm18804629wme.11.2020.09.21.03.21.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 03:21:00 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, laurent.pinchart@skynet.be,
        mchehab@kernel.org
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC 30/49] staging: media: zoran: use devm for videocodec_master alloc
Date:   Mon, 21 Sep 2020 10:20:05 +0000
Message-Id: <1600683624-5863-31-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
References: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Let's use devm allocations for videocodec, this simplify code.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_card.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index 62e63804ae14..756b9a339f7e 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -989,18 +989,10 @@ static void zoran_remove(struct pci_dev *pdev)
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
@@ -1028,7 +1020,7 @@ static struct videocodec_master *zoran_setup_videocodec(struct zoran *zr, int ty
 {
 	struct videocodec_master *m = NULL;
 
-	m = kmalloc(sizeof(*m), GFP_KERNEL);
+	m = devm_kmalloc(&zr->pci_dev->dev, sizeof(*m), GFP_KERNEL);
 	if (!m)
 		return m;
 
@@ -1234,7 +1226,7 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		zr->codec = videocodec_attach(master_codec);
 		if (!zr->codec) {
 			pci_err(pdev, "%s - no codec found\n", __func__);
-			goto zr_free_codec;
+			goto zr_unreg_i2c;
 		}
 		if (zr->codec->type != zr->card.video_codec) {
 			pci_err(pdev, "%s - wrong codec\n", __func__);
@@ -1248,7 +1240,7 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		zr->vfe = videocodec_attach(master_vfe);
 		if (!zr->vfe) {
 			pci_err(pdev, "%s - no VFE found\n", __func__);
-			goto zr_free_vfe;
+			goto zr_detach_codec;
 		}
 		if (zr->vfe->type != zr->card.video_vfe) {
 			pci_err(pdev, "%s = wrong VFE\n", __func__);
@@ -1269,12 +1261,8 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
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

