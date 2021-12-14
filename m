Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22F3B474777
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 17:18:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235661AbhLNQQu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Dec 2021 11:16:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231547AbhLNQQt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Dec 2021 11:16:49 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC86AC061574
        for <linux-media@vger.kernel.org>; Tue, 14 Dec 2021 08:16:48 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id z206so407987wmc.1
        for <linux-media@vger.kernel.org>; Tue, 14 Dec 2021 08:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nB4e6hJ4iiTdgUlpoHX4JiHqvuWD9iBvhiQUSGuoJO4=;
        b=59L0AuG56Iu6wwan57pufjqXT1E/Ejz7PsGUmlgkWNgVwSn99f/tO3kplfpUM5b/3X
         Y11pSsiW5S2/GPySPaDzI7Y9AJi9WUmq1kzr7gJL9i5zTlHA7oW7FJ97MOTiCNayOKvT
         aoF96qlX3EBEU1FtkSxP2uOlO0g6WqXI/ErLkTiBfWSHLsIc3E4bQAQ6gNF2AAo9fb8X
         iN8ys2RvdQr8bCwEsN2i+dwvZkoO7rGymUsul20Pnh9RDGZUmGhbZZ7mumBPXOAkSjwj
         4ZcvvTsVit8Rn2CRd+l7wrLmP7BruIB1588cwg5NXZ2X9lcraRf0j+k3fk17GjMQXNZV
         OrxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nB4e6hJ4iiTdgUlpoHX4JiHqvuWD9iBvhiQUSGuoJO4=;
        b=Ct3QysFYp8ax6evBXa6IPOv5K1+PCHe4tbQL3CV9ObvMOcmMI+uGA+mgUHiBXSun5t
         3LVIFgm1XMs1R3Kg0CVstfteOwY2XPNN9NXvbh58LB4n+Q6jelxx5a3VDbe8Uwsskwyu
         0Bl80TL6u05mGL+DAlR6xrZgal2K52/xcjDTrgHOelyeBkxrxXftlwd0tF9JD3vfuGhH
         0kriw7Szz1cr7beDh//Vv2of9dCVImI9RnlQP/kev22qOvRUmhMix33HgkMtVyn74MKk
         Owc6vMQwidxIsBMqV6PFPcf4kB5iIzQfTQVBwzNvhLT5CyDUejBVNNsjdt31jLo80K3w
         TKeA==
X-Gm-Message-State: AOAM530d5JXSlOY8HespNPpGwGB/M0115esypj4Jjjus9N4iwTOLW6O1
        QfdiVcUBycBLBR6rRl6Ezlv9Ow==
X-Google-Smtp-Source: ABdhPJyNUjeIiGBnw2kscF6JUnOWj7m4wL9wSYkMZkYG1aCLf2zXnYTHDMKbZQk0kFLEsXPlzGVx8w==
X-Received: by 2002:a7b:cc96:: with SMTP id p22mr7978156wma.69.1639498607266;
        Tue, 14 Dec 2021 08:16:47 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id a9sm295116wrt.66.2021.12.14.08.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 08:16:46 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     mchehab@kernel.org, hverkuil@xs4all.nl, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v4 07/18] staging: media: zoran: remove vidmem
Date:   Tue, 14 Dec 2021 16:16:25 +0000
Message-Id: <20211214161636.1886900-8-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214161636.1886900-1-clabbe@baylibre.com>
References: <20211214161636.1886900-1-clabbe@baylibre.com>
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
index a7750442ef9e..9cd49f85a56e 100644
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
@@ -1218,10 +1207,6 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
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

