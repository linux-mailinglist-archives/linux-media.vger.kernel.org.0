Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E012272054
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 12:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbgIUKVC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 06:21:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726885AbgIUKU7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 06:20:59 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79A09C061755
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:20:59 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id k18so12017824wmj.5
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=14WJj/RqQjb5y9fKAYpp9xKxfwW/Mh3U1gqbae/yMEI=;
        b=OLmZzc/r2Nu25RC4agP9sFqGyGE70U4vF6jpgeTe/Ld9FCKI9UNwkO38fJLJpnZ1aT
         FCuiWAZQldH0H9H4eu33pQfeCK9MCtMtlQWhCWnWnB8wVDF+c3MNEupsagEPgbtYXDGt
         AOCBnJ7YKYP+Ed+Put7CP4VxKa0/l9MZaoJu94G23aW6gCRaY/wfw2obNAKsxpVXqAkY
         yq161oDjhmqwoRa0Frx1xjgajGOtn/IoFgdh4OVkXJ8DE9Vuc8TfMMwKIW06d6KwjPNL
         XFV2lOzn/RhtqaZ/CYpyLbt42ZFLL4f17M0TrKTSlEHOnmNe+2ZA4PkmVDmyVcJ0IwzU
         NW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=14WJj/RqQjb5y9fKAYpp9xKxfwW/Mh3U1gqbae/yMEI=;
        b=naFWWov12gX1ck0lW2RbkXjumMbEGlvkssMnW29j50g40Wns2O+ivDdqCOGuwaV4cm
         PG/4bTRQTF0vXtZIUtzrjImKnZIW25ZoKVEaTo72dsT7aNwYDDFsNXCpnWF/Qy9w1KbM
         mtepMMwUo6bjur94thywN6BkETrROGqFvx8MEEePWHXQcs2WR4LHQZ32LqeKzWzg6u67
         ysNAWK/fDlTbqjUxxG1ua8aOIpvs9EUJtuITIzOXLMJ2+oh/YnIwOnDSOnz1Xt9lDAHt
         mXBcADDfq5dUghmosY0XgBgh4pVA4FuSlBUGmeFKtQcc8Fn2xmLm/4/KaQZ/V9DGkned
         cIHQ==
X-Gm-Message-State: AOAM532pjzd5w0nMSz2MeBZeFNXnkZ1xEE+Sms+JUaTNSu4MPn9/z4ao
        6rouIy+slH9Tphl+350AQnq/Ww==
X-Google-Smtp-Source: ABdhPJx1Ryc9pfX4wBErhIyfQ0T8KkhSO1BIqse9FMAU5+1kMZdMdiuOXHzz3wNhtql/XUvTWjWShw==
X-Received: by 2002:a1c:7508:: with SMTP id o8mr28218460wmc.127.1600683658224;
        Mon, 21 Sep 2020 03:20:58 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id l17sm18804629wme.11.2020.09.21.03.20.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 03:20:57 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, laurent.pinchart@skynet.be,
        mchehab@kernel.org
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC 27/49] staging: media: zoran: convert irq to pci irq
Date:   Mon, 21 Sep 2020 10:20:02 +0000
Message-Id: <1600683624-5863-28-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
References: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch convert zoran to pci_irq functions.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_card.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index 1c587ce0d8c0..fe4d34e388b4 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -1008,7 +1008,7 @@ static void zoran_remove(struct pci_dev *pdev)
 	zoran_set_pci_master(zr, 0);
 	/* put chip into reset */
 	btwrite(0, ZR36057_SPGPPCR);
-	free_irq(zr->pci_dev->irq, zr);
+	pci_free_irq(zr->pci_dev, 0, zr);
 	/* unmap and free memory */
 	dma_free_coherent(&zr->pci_dev->dev, BUZ_NUM_STAT_COM * sizeof(u32), zr->stat_com, zr->p_sc);
 	iounmap(zr->zr36057_mem);
@@ -1166,8 +1166,7 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		goto zr_unreg;
 	}
 
-	result = request_irq(zr->pci_dev->irq, zoran_irq,
-			     IRQF_SHARED, ZR_DEVNAME(zr), zr);
+	result = pci_request_irq(pdev, 0, zoran_irq, NULL, zr, ZR_DEVNAME(zr));
 	if (result < 0) {
 		if (result == -EINVAL) {
 			pci_err(pdev, "%s - bad IRQ number or handler\n", __func__);
@@ -1281,7 +1280,7 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	zoran_unregister_i2c(zr);
 zr_free_irq:
 	btwrite(0, ZR36057_SPGPPCR);
-	free_irq(zr->pci_dev->irq, zr);
+	pci_free_irq(zr->pci_dev, 0, zr);
 zr_unmap:
 	iounmap(zr->zr36057_mem);
 zr_unreg:
-- 
2.26.2

