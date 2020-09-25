Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F75D2790A7
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 20:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729819AbgIYSeP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 14:34:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729780AbgIYSeP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 14:34:15 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E444AC0613CE
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:34:14 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id f18so3997528pfa.10
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=TTUQIRv6cRZ2oO4d9wlkIu2psEWIyambmB7I1qwTrKw=;
        b=h/a7y78qfs4B7da7cpMR0TFIkKT/2JEzA7h7fAQus8i50nJzOCzVPFliGAmKBdCPgQ
         ULmVUsKFK4lVbsIG+Z16DHq803p8zGK/xnwkGLTW2xEgdCeSESTSZJ8U0lKYTX59vL1p
         KnLims2LJh16VYbJF8K+ZKlBRQ5eOtuoQ7YZ0MxbMIeKhwYUwBexuaVytpMeahpwnrIk
         glrN1LzjRJyqm9d0977LjywMxk1a+ViYc66YWZleDfnG4U22134+NwxD24YkGCw5wNNq
         59Ws8SnE8OxF09P9zYOY0sty88HIjJUIQYRxe9v7P6WMBpr4MOIUKImgmLcHxCqrv4g+
         uieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=TTUQIRv6cRZ2oO4d9wlkIu2psEWIyambmB7I1qwTrKw=;
        b=S5qR9s7jd3H2E3plRivng39Y1n7bMfiT0jGXkuLT/LkbbeeA30joASKdBkeHEKzNlQ
         5iiuLDyiO9V4LZmuz7Z/mmpdMDY6ZvpNw/dZ+l5nHpBhPaznGoo+D02gV6hBU/cvpEGc
         QZErkqCzj+uJPJ7+jHdk6wHi63Ej/2HO+78uYJohCvQepDpyH6pt8nWUdEg3sBOrb1Wv
         v6JFEwNILQ65J7ZtQyt5goDbb4KdA3k5HKUQj1TL2Cg5e3BTvh1l+Ea+dBxkcFKCPWkw
         SHqc8IvErUj1dx5mI1mwxXfRD3CfAoM7X4OCOBfw7imumQ2YzcUts2sWEFQ/h+smhD/8
         AEaw==
X-Gm-Message-State: AOAM531aen5p6ZLMg4gb3I75Ce34Q+O2krkMVBZrHOeZDQg3TAFJDYX6
        umNbBKBa/WFVRHdPwTL1JPM9Xw==
X-Google-Smtp-Source: ABdhPJwKA9v5+82Lq4ws7oQxn5M/2efFOFbHRxTkPOy4ueaQvNb13A/q06iJUFjL8oFfKz5SwttyfA==
X-Received: by 2002:a17:902:7281:b029:d2:2a0b:f050 with SMTP id d1-20020a1709027281b02900d22a0bf050mr738515pll.42.1601058854524;
        Fri, 25 Sep 2020 11:34:14 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id r16sm2554546pjo.19.2020.09.25.11.34.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 11:34:14 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC v2 30/47] staging: media: zoran: use pci_request_regions
Date:   Fri, 25 Sep 2020 18:30:40 +0000
Message-Id: <1601058657-14042-31-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
References: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use pci_request_regions so now we can see zoran in /proc/iomem.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_card.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index a3e7b0027d69..f4639324bace 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -1011,6 +1011,7 @@ static void zoran_remove(struct pci_dev *pdev)
 	/* unmap and free memory */
 	dma_free_coherent(&zr->pci_dev->dev, BUZ_NUM_STAT_COM * sizeof(u32), zr->stat_com, zr->p_sc);
 	iounmap(zr->zr36057_mem);
+	pci_release_regions(pdev);
 	pci_disable_device(zr->pci_dev);
 	video_unregister_device(zr->video_dev);
 exit_free:
@@ -1160,10 +1161,14 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	snprintf(ZR_DEVNAME(zr), sizeof(ZR_DEVNAME(zr)), "%s[%u]",
 		 zr->card.name, zr->id);
 
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
@@ -1281,6 +1286,8 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
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

