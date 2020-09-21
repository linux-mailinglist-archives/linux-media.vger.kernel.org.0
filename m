Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E906272088
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 12:23:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbgIUKWw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 06:22:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726877AbgIUKU7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 06:20:59 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4A9EC0613DF
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:20:57 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id w2so11565668wmi.1
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QA8TCJgASc+mrJ6x1w1qH0mxGnf3/+EHhd8oJ9n9Jp0=;
        b=C49J6LS6XfHTVMcifSQO4pi1K9ZW9D7UvLHUiB3vlE5YDmLRE6XCicTJFZeih3qMiq
         BLB0ftBYrr04EnXsTgApYt4tOimQeoYnG1bOebAFzBO+2wQviRTK71qzXFDYWl4Pm6Lv
         c+hd8TRTBZNJofb8UxyuI2Xw5A0q584ibUaVrMv0QIRIFBsSLmkuIwccyGP5Mu+bFrjY
         TZp/Y1BVn1tIn2pWLV8wDVWA+nCVQUZC2Vx6PMn5cVtKdMdSQfkBClQZrntGsz6IbiO7
         LNCmO5eyyY1fCl1MuERF1NavuTRMX0Y0VRCzqPH/t4Us8I06UE3sarvSjpV2c4MNy1Jj
         QRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=QA8TCJgASc+mrJ6x1w1qH0mxGnf3/+EHhd8oJ9n9Jp0=;
        b=Eh1HNAELz61znM37ULj49M8Y2v+ibKsoOvFP2PSaQjNADpnxAsx4gFGFISGfazHiTl
         2g78WESOm64M4opMtqpesVL5hYIUDEYqGIwuzE62F/zLtQVf3aLv/ZmSMlkODXf4lf4z
         OvwBvoBpmOS/tNAGQGDapbo24sa4spXvIgywtawzKKLYZ9W2e6hz3GxjPuBbXx8rVaIs
         owOqXSaW2JlNDL89cdSOz+HPcDd3JQCQXp1oWqsn8/4HwYmxREL4Sc0QAcgaA6rLJjbC
         L/yFwV19QXPFwEeP6YiJqIX2IUde9O7go3hKrNQOabAU+2Y1PpyhUXotEcdtADjl/tka
         /ghg==
X-Gm-Message-State: AOAM530AzzxRtPIeSocbS2socgb1nUA8tezuUxAmYODXVE9KzteSH9IG
        PQHpBPO1JnJUKQ7hyrVFK6ne6A==
X-Google-Smtp-Source: ABdhPJwM+LQagXIvdSHxKOsRPII3JPsY7uqMRc4MbUi63rKYiqCH7XGQ4PGXad4MX8gvOEA5Pbta0Q==
X-Received: by 2002:a05:600c:2146:: with SMTP id v6mr28742891wml.159.1600683656401;
        Mon, 21 Sep 2020 03:20:56 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id l17sm18804629wme.11.2020.09.21.03.20.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 03:20:55 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, laurent.pinchart@skynet.be,
        mchehab@kernel.org
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC 25/49] staging: media: zoran: use ZR_NORM
Date:   Mon, 21 Sep 2020 10:20:00 +0000
Message-Id: <1600683624-5863-26-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
References: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of using hardcoded numbers, let's use some define for ZR NORM.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran.h        | 4 ++++
 drivers/staging/media/zoran/zoran_card.c   | 8 ++++----
 drivers/staging/media/zoran/zoran_driver.c | 6 +++---
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran.h b/drivers/staging/media/zoran/zoran.h
index 8f3faa4eb60f..87ca324f6ec2 100644
--- a/drivers/staging/media/zoran/zoran.h
+++ b/drivers/staging/media/zoran/zoran.h
@@ -22,6 +22,10 @@
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-fh.h>
 
+#define ZR_NORM_PAL 0
+#define ZR_NORM_NTSC 1
+#define ZR_NORM_SECAM 2
+
 struct zoran_sync {
 	unsigned long frame;	/* number of buffer that has been free'd */
 	unsigned long length;	/* number of code bytes in buffer (capture only) */
diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index a8d23bf126c3..1c587ce0d8c0 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -906,18 +906,18 @@ static int zr36057_init(struct zoran *zr)
 		default_norm = 0;
 	if (default_norm == 0) {
 		zr->norm = V4L2_STD_PAL;
-		zr->timing = zr->card.tvn[0];
+		zr->timing = zr->card.tvn[ZR_NORM_PAL];
 	} else if (default_norm == 1) {
 		zr->norm = V4L2_STD_NTSC;
-		zr->timing = zr->card.tvn[1];
+		zr->timing = zr->card.tvn[ZR_NORM_NTSC];
 	} else {
 		zr->norm = V4L2_STD_SECAM;
-		zr->timing = zr->card.tvn[2];
+		zr->timing = zr->card.tvn[ZR_NORM_SECAM];
 	}
 	if (!zr->timing) {
 		pci_warn(zr->pci_dev, "%s - default TV standard not supported by hardware. PAL will be used.\n", __func__);
 		zr->norm = V4L2_STD_PAL;
-		zr->timing = zr->card.tvn[0];
+		zr->timing = zr->card.tvn[ZR_NORM_PAL];
 	}
 
 	if (default_input > zr->card.inputs - 1) {
diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index 8724b0ad855e..b1351455690f 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -1033,11 +1033,11 @@ static int zoran_set_norm(struct zoran *zr, v4l2_std_id norm)
 	}
 
 	if (norm & V4L2_STD_SECAM)
-		zr->timing = zr->card.tvn[2];
+		zr->timing = zr->card.tvn[ZR_NORM_SECAM];
 	else if (norm & V4L2_STD_NTSC)
-		zr->timing = zr->card.tvn[1];
+		zr->timing = zr->card.tvn[ZR_NORM_NTSC];
 	else
-		zr->timing = zr->card.tvn[0];
+		zr->timing = zr->card.tvn[ZR_NORM_PAL];
 
 	decoder_call(zr, video, s_std, norm);
 	encoder_call(zr, video, s_std_output, norm);
-- 
2.26.2

