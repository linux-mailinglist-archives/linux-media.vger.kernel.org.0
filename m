Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AEE56FBA5
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 10:54:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728554AbfGVIye (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 04:54:34 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36764 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbfGVIye (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 04:54:34 -0400
Received: by mail-pg1-f195.google.com with SMTP id l21so17344297pgm.3
        for <linux-media@vger.kernel.org>; Mon, 22 Jul 2019 01:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=biM0OSNS5ZGpRpAgnAVdTqKaXhBNpNIPHYCeUlAsDXo=;
        b=J3F1dnC/ZFg2XPia01dmjicHZLH6vHlWaKqphRc4EVU9k8NuQmdSQtNcFq3xlrCUKF
         90Lw6ZwJiMBNPbkAZjTSXDqkmdKC8Hf7hpYpUBTbWxuBIeqWzJcGy1IVr7woksYgOtp6
         zPw7KwySYfsNCVZ45yNTuAfY/EGdXoZam8Ke4ThTVVeDH/V8QAzr38y+MqFODoDhkLrU
         K7FLg9ySAvF9OHN72uKzG2mifcKYRCYLGKzDOerJKs9haMZEJqtrV0eJoHIJ0ulkx0kS
         C5d+TimIxfM9YwX8gHjjdbM3WNvfQYoNvJFtcoGxEKeYF9vjesSHqanWj2Ly5DlTo1hq
         BSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=biM0OSNS5ZGpRpAgnAVdTqKaXhBNpNIPHYCeUlAsDXo=;
        b=Qo1nQCMbWqN3mtnISo/AR6tsrEykbiDI9ZaKTvA0JrQEbDKZcUmE/17e4rfmJdVXlc
         6NvPmvS8mO63HWc0p4Ebscemx11g53gEyATdCUtE9LadwnE8cPXzziZ5H23psDvTbARK
         hboyjVQ60u039lyCpKENudt1USV0lYineanofuSYrvvTHrZZyKNgzSUsp1SlM+53JWxU
         iSTt3G2cDgm+0Hx8/UlY5wq64wWMbmNSCzmnSrCyZ7xrtWUXYesFI4cLX429x1A556+k
         nY3X1csCeqR7szcTCrU4InEwsORDiA4ebqbwe/jTxlRtFxNWG4tFbtiiOXM3jcH5XZiG
         AgQw==
X-Gm-Message-State: APjAAAXDygkIDysfiBkOPsrAo4e7j3C7xAw8ebt46LcmkXkTNMKVi0pd
        0ZrUo0V3a1lFDiSNMGXC+7o=
X-Google-Smtp-Source: APXvYqw4NAMsN7QtS8azeL5m5K/spvFcnwQ2npwNGaA3WlUAzpUuuuj1y5plZArSatdp9cta3HhzbQ==
X-Received: by 2002:a63:eb56:: with SMTP id b22mr71136439pgk.355.1563785673534;
        Mon, 22 Jul 2019 01:54:33 -0700 (PDT)
Received: from localhost.localdomain ([122.163.0.39])
        by smtp.gmail.com with ESMTPSA id v27sm52537557pgn.76.2019.07.22.01.54.31
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 01:54:33 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH RESEND] staging: media: davinci_vpfe: Replace function vpfe_isif_cleanup()
Date:   Mon, 22 Jul 2019 14:24:20 +0530
Message-Id: <20190722085420.20294-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename function isif_remove to vpfe_isif_cleanup, as
vpfe_isif_cleanup does nothing but call isif_remove.
Change type of new vpfe_isif_cleanup from static to non-static to match
the old function definition.
Remove the original vpfe_isif_cleanup.
Modify calls to isif_remove to vpfe_isif_cleanup.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
Sorry, I think this may have gotten lost the last time I sent it?

 .../staging/media/davinci_vpfe/dm365_isif.c   | 21 +++++++------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/davinci_vpfe/dm365_isif.c b/drivers/staging/media/davinci_vpfe/dm365_isif.c
index 05a997f7aa5d..632a51cf2e4a 100644
--- a/drivers/staging/media/davinci_vpfe/dm365_isif.c
+++ b/drivers/staging/media/davinci_vpfe/dm365_isif.c
@@ -1932,8 +1932,13 @@ static const struct v4l2_ctrl_config vpfe_isif_gain_offset = {
 	.def = 0,
 };
 
-static void isif_remove(struct vpfe_isif_device *isif,
-			struct platform_device *pdev)
+/*
+ * vpfe_isif_cleanup - isif module cleanup
+ * @isif: pointer to isif subdevice
+ * @dev: pointer to platform device structure
+ */
+void vpfe_isif_cleanup(struct vpfe_isif_device *isif,
+		       struct platform_device *pdev)
 {
 	struct resource *res;
 	int i = 0;
@@ -2081,17 +2086,7 @@ int vpfe_isif_init(struct vpfe_isif_device *isif, struct platform_device *pdev)
 	return status;
 isif_fail:
 	v4l2_ctrl_handler_free(&isif->ctrls);
-	isif_remove(isif, pdev);
+	vpfe_isif_cleanup(isif, pdev);
 	return status;
 }
 
-/*
- * vpfe_isif_cleanup - isif module cleanup
- * @isif: pointer to isif subdevice
- * @dev: pointer to platform device structure
- */
-void
-vpfe_isif_cleanup(struct vpfe_isif_device *isif, struct platform_device *pdev)
-{
-	isif_remove(isif, pdev);
-}
-- 
2.19.1

