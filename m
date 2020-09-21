Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17D6F27205A
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 12:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726935AbgIUKVE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 06:21:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726924AbgIUKVD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 06:21:03 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15F2AC061755
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:21:03 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id m6so12148248wrn.0
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=r85oKelmSxCT/ytNZb+5lrzckUj7jOhmVdpf8jChvhQ=;
        b=aTvoD3hFXs3POFwDeGWyKdJ5WNaRfIUoDo3FLhNdWtwLbIgWIC+y8D//me7P05cZBL
         mfqi8yRRUNP+A+ONA5XfI1lgHoVeBeNXWHk5SSAMd16oikUA9+mXSWxN59qqQFpaay5b
         E4OMN3iLZWjyBf5dDc10VlinaR7+6JQxh70cO0U67K2ebbOl7dnA8Sclvv8pVR/DrUSE
         7pKvEwaEZIJVn6INdPJJUaRGV/EfIBQbc9iDoi9dOsvxPbeJ2wL1Gg5kVd4ygIYDcDll
         h0SUVJSqhd5JcaZbo1RzpE0k3mDwR0oj2gFfoDKAEIVWFUMG+I1JHA0TrocC9yg4/yIs
         RbrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=r85oKelmSxCT/ytNZb+5lrzckUj7jOhmVdpf8jChvhQ=;
        b=iieUMNOMtNUmIFmf52GKxeC8NdtQox9aUXKDM6I21O9bpZczW9z5a5DOVln0f5Ho7a
         UH1xBOhUoTpuk2m0Vt8CjxwYEaOq6VYB3ceKEruW9/TwFje7GvxqgKvdkaOfBdbvJOZn
         zcS/3b55ceXH5hOLDBwLzi9X/kkAbSe/pM0e4iVAp0AOFRuoGGD1TIrCFXqU+S0pbGqW
         2287WJT6sv3pmRvysjO2hgd0lhB5+5kf1nMwEJ2dTCkmZJSR5IrjWFoAjCFWfBnPmkxV
         WCgYiB9eT6bbpGGTMo8oCTQ5N181ElLQOEsm6Pk2C3jR8wJLCN1TcRmTLvMxx8yPYCz7
         JiUQ==
X-Gm-Message-State: AOAM530i0IoSH64gcl1Thno7xpqstEmvcy4pGWFf6hWmDARgo8IGdh2o
        1Gr6ftNz80/zBsAaeddo+J1z9Q==
X-Google-Smtp-Source: ABdhPJx3vSrvmd5LQMjT6ohRvSlIA6LBabrT+xHJ+GrgKpx5lmH4iadrY/KQb8lY1YMKMr3HjkoCDw==
X-Received: by 2002:a5d:6291:: with SMTP id k17mr51139822wru.130.1600683661822;
        Mon, 21 Sep 2020 03:21:01 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id l17sm18804629wme.11.2020.09.21.03.21.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 03:21:01 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, laurent.pinchart@skynet.be,
        mchehab@kernel.org
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC 31/49] staging: media: zoran: use pci_request_regions
Date:   Mon, 21 Sep 2020 10:20:06 +0000
Message-Id: <1600683624-5863-32-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
References: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use pci_request_regions so now we can see zoran in /proc/iomem.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_card.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index 756b9a339f7e..ed4ecf92c040 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -1004,6 +1004,7 @@ static void zoran_remove(struct pci_dev *pdev)
 	/* unmap and free memory */
 	dma_free_coherent(&zr->pci_dev->dev, BUZ_NUM_STAT_COM * sizeof(u32), zr->stat_com, zr->p_sc);
 	iounmap(zr->zr36057_mem);
+	pci_release_regions(pdev);
 	pci_disable_device(zr->pci_dev);
 	video_unregister_device(zr->video_dev);
 exit_free:
@@ -1151,10 +1152,14 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	zr->card = zoran_cards[card_num];
 	snprintf(ZR_DEVNAME(zr), sizeof(ZR_DEVNAME(zr)), "%s[%u]", zr->card.name, zr->id);
 
+	err = pci_request_regions(pdev, ZR_DEVNAME(zr));
+	if (err)
+		goto zr_unreg;
+
 	zr->zr36057_mem = pci_ioremap_bar(zr->pci_dev, 0);
 	if (!zr->zr36057_mem) {
 		pci_err(pdev, "%s() - ioremap failed\n", __func__);
-		goto zr_unreg;
+		goto zr_pci_release;
 	}
 
 	result = pci_request_irq(pdev, 0, zoran_irq, NULL, zr, ZR_DEVNAME(zr));
@@ -1270,6 +1275,8 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	pci_free_irq(zr->pci_dev, 0, zr);
 zr_unmap:
 	iounmap(zr->zr36057_mem);
+zr_pci_release:
+	pci_release_regions(pdev);
 zr_unreg:
 	v4l2_ctrl_handler_free(&zr->hdl);
 	v4l2_device_unregister(&zr->v4l2_dev);
-- 
2.26.2

