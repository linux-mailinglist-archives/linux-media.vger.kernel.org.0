Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B291242C933
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 20:58:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238964AbhJMTAb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 15:00:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238874AbhJMTA1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 15:00:27 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA5EDC061749
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 11:58:23 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id g25so11636956wrb.2
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 11:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3LHPDY3kMpnJAm0T8AaCeTyE7uf/LEhpftdR1uzKAKo=;
        b=HZr6vn6r95DGJh75IxvsNPy20JYk18tx0+R2HbzZTxZWxtuvkWgmEdQxbicqIAteHT
         YSy1owofRejoV7zFOPr0E6vU8BE0l0j61q6gCVCHVXSgyzwk6/gct7xr9K/Cmm9C1lUM
         91az4pu5wzKnYvyFmbzkemjCABbcdSyiRp+UF3CZvvVDWWyuDgq6b0RCfXQJsO/AIDZP
         eQj3OeH+f6gfNWoc1qD/tdazwDK/bZHvnviAqZf27J4WCYIeXS5Gn6EKkl9jcVo7tvJk
         TQJyU8nIE4GKoQxTOn4nuWq3P52h89sLq0tgCatqPuCOHXiBg8C3dupTmpIyLLZB6DJM
         7t6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3LHPDY3kMpnJAm0T8AaCeTyE7uf/LEhpftdR1uzKAKo=;
        b=lf1NBiGwb5QqDYqTQfbW7vftSeHS0jEJ3SWsYA4U4b6c9MloIzoWdDXvfVVbVf6TUb
         7kgwSBLreL+g7FHR9LzsQu6ChLebiRW/O0uljUWOIwMZcQujWOJnuysp0fyP9GFbM7x+
         MThLHE3a7WNczlPVMD4Z19dC+cmidIFzBcThC3EvGJ3qknH56uvWH7POuVpJ9mEx8//p
         cioR9Dm0SriEi2UtJgM0t7xMFVdu4ttWoGtyc+MoMOCOCNanUVCW01djtkMdyKVTVZXP
         YrlyLmrPi+5F7K6RK8/RaTMqs3+9NG1zT2Z6Vw2KiRV0SnRVWTJas0q0ag2qa/iW01tY
         gosw==
X-Gm-Message-State: AOAM533hZnZ9IE1dLGZ61hlHq4J8xiGfEOFPx9T3bWDxhcX7/CGJNgFj
        69SHLuNt/Ps6d8EFErIvE82bzA==
X-Google-Smtp-Source: ABdhPJzvdZhsGfY6dZ6ucVvnv9IBWKAI3FFz6SFEXeKM7wFbmlQt8vov1bzfTxacvUBPQUi+OO87VA==
X-Received: by 2002:adf:f902:: with SMTP id b2mr1011711wrr.265.1634151502535;
        Wed, 13 Oct 2021 11:58:22 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id e8sm573059wrg.48.2021.10.13.11.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 11:58:22 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     mchehab@kernel.org, hverkuil@xs4all.nl, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 07/10] staging: media: zoran: remove vidmem
Date:   Wed, 13 Oct 2021 18:58:09 +0000
Message-Id: <20211013185812.590931-8-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013185812.590931-1-clabbe@baylibre.com>
References: <20211013185812.590931-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The vidmem parameter is no longer necessary since we removed framebuffer
support.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_card.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index a0739d3462bb..a079fb6e27a3 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -39,17 +39,6 @@ static int card[BUZ_MAX] = { [0 ... (BUZ_MAX - 1)] = -1 };
 module_param_array(card, int, NULL, 0444);
 MODULE_PARM_DESC(card, "Card type");
 
-/*
- * The video mem address of the video card. The driver has a little database
- * for some videocards to determine it from there. If your video card is not
- * in there you have either to give it to the driver as a parameter or set
- * in a VIDIOCSFBUF ioctl
- */
-
-static unsigned long vidmem;	/* default = 0 - Video memory base address */
-module_param_hw(vidmem, ulong, iomem, 0444);
-MODULE_PARM_DESC(vidmem, "Default video memory base address");
-
 /* Default input and video norm at startup of the driver. */
 
 static unsigned int default_input;	/* default 0 = Composite, 1 = S-Video */
@@ -1163,10 +1152,6 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		jpg_bufsize = 8192;
 	if (jpg_bufsize > (512 * 1024))
 		jpg_bufsize = 512 * 1024;
-	/* Use parameter for vidmem or try to find a video card */
-	if (vidmem)
-		pci_info(pdev, "%s: Using supplied video memory base address @ 0x%lx\n",
-			 ZORAN_NAME, vidmem);
 
 	/* some mainboards might not do PCI-PCI data transfer well */
 	if (pci_pci_problems & (PCIPCI_FAIL | PCIAGP_FAIL | PCIPCI_ALIMAGIK))
-- 
2.32.0

