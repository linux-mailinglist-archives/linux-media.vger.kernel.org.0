Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 027A627205C
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 12:23:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbgIUKVH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 06:21:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726942AbgIUKVE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 06:21:04 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCC8FC0613CF
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:21:03 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id o5so12105589wrn.13
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UDXBjt8jfu/oMGNat+F4S9FWffFRkNYldF9fojbA7xU=;
        b=o+JBpv0kgXUgHSjx+7mwoy9hBdUZxyTnq88Z4pn5acM1mUZcgFy3Vf49rvzEVzeR4t
         6PCl/uBUIYl3AXto4vLB4dnsY09c7oLxzwJa05cAqiugtodeTRdbHyhXSAGrGIHsiESP
         +lysMoTF/HyZGBxFAxsCjZvAuEvLXviGGJPXj2vxaOsxJbj71NQVEs5CuXXacXv0PV2B
         FTF6+MefhdS9Ro5JYYxpp+xjWlc7NWxow8mE3GGbdMej/DFhO5RFQCRIhDGzt9pnKSxV
         gS42EYx7MYaNVgUEGs4XkVeFH5FnE5oRtC5dvsvuW9GnHOK1jN2VfLMJX/UuuoGpTiOo
         kmjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=UDXBjt8jfu/oMGNat+F4S9FWffFRkNYldF9fojbA7xU=;
        b=rkwvouPKHb8JEe3faWgYygri5xvGpevuy/21/oB4VDODeR8gVdVmjbK6W0KqLe/BxO
         03eE/xhj3E3kW+wCEW6t5Yw3M11y0k0vKjfObLksIbPGKCj98WBd92Fw7WTTLGQeIFut
         eLwSgKkkn3kGYop99crAPyYV/b30DtJmuoPllcUkVfsh0ueV8EYHk/JyHrA0c+Zrx32y
         u7S+vBpPFqDMxR/tJ0ZJtdBz6HRTScd+l+Guy8ChG4RI6ns7O0B1+eDjZbW7hSmi2B3W
         J49c+/DxV0kAVkNv/1O7I0w08OAlUoqpOO10EasoS1ApAOaIfOh/r84EyEVxsMTNLSBc
         neEg==
X-Gm-Message-State: AOAM532b82HAmQqxCoeNaUQa2F696LWvUOfB7ANBhLyTcIQgu5Ch4MRQ
        BoGQSftLNIj4biJsjK4MRwrhAw==
X-Google-Smtp-Source: ABdhPJyERdYp2AsyAKmPFvJF44cYROI3W+/g17UZsOuGZCzLex69SCmZaq065/gaT2X6isrvK4RBOA==
X-Received: by 2002:a5d:56cd:: with SMTP id m13mr50724441wrw.261.1600683662637;
        Mon, 21 Sep 2020 03:21:02 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id l17sm18804629wme.11.2020.09.21.03.21.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 03:21:02 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, laurent.pinchart@skynet.be,
        mchehab@kernel.org
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC 32/49] staging: media: zoran: use devm_ioremap
Date:   Mon, 21 Sep 2020 10:20:07 +0000
Message-Id: <1600683624-5863-33-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
References: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Using devm_ioremap simplify code.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_card.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index ed4ecf92c040..36305aaabd7d 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -1003,7 +1003,6 @@ static void zoran_remove(struct pci_dev *pdev)
 	pci_free_irq(zr->pci_dev, 0, zr);
 	/* unmap and free memory */
 	dma_free_coherent(&zr->pci_dev->dev, BUZ_NUM_STAT_COM * sizeof(u32), zr->stat_com, zr->p_sc);
-	iounmap(zr->zr36057_mem);
 	pci_release_regions(pdev);
 	pci_disable_device(zr->pci_dev);
 	video_unregister_device(zr->video_dev);
@@ -1156,7 +1155,7 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (err)
 		goto zr_unreg;
 
-	zr->zr36057_mem = pci_ioremap_bar(zr->pci_dev, 0);
+	zr->zr36057_mem = devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0), pci_resource_len(pdev, 0));
 	if (!zr->zr36057_mem) {
 		pci_err(pdev, "%s() - ioremap failed\n", __func__);
 		goto zr_pci_release;
@@ -1172,7 +1171,7 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		} else {
 			pci_err(pdev, "%s - cannot assign IRQ, error code %d\n", __func__, result);
 		}
-		goto zr_unmap;
+		goto zr_pci_release;
 	}
 
 	/* set PCI latency timer */
@@ -1273,8 +1272,6 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 zr_free_irq:
 	btwrite(0, ZR36057_SPGPPCR);
 	pci_free_irq(zr->pci_dev, 0, zr);
-zr_unmap:
-	iounmap(zr->zr36057_mem);
 zr_pci_release:
 	pci_release_regions(pdev);
 zr_unreg:
-- 
2.26.2

