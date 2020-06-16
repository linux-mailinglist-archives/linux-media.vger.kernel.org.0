Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B23C51FBDAE
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 20:10:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731719AbgFPSKB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jun 2020 14:10:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbgFPSKA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jun 2020 14:10:00 -0400
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62B43C061573
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2020 11:10:00 -0700 (PDT)
Received: by mail-qv1-xf49.google.com with SMTP id h30so16142612qva.17
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2020 11:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=sQYJaI8jg1FtyXfRAOTpTGsgFbeCT3+ddgfcyrzmU3I=;
        b=HIfKrZ3zpFJ2Qg69LD+PbnGYLKvn3nO6/wdN0GjaVsZDnu+lzRWks6LT7k6wDISvCz
         h8s/m86Aai60tujjwNYGu09dDYUQxgep1H6Ib83l4GxKKw+3syg5RhNDu4AG6zlKX8/a
         8NCBcAY0Gp6iaqe+y1J/XzOJ4bC76O0ylG0pS4o12A1gKI04/uWIPBRvL59V+294Jga7
         Tyupaj1WLGXP8ycxSZ162tl+U8BLWV4eowMpM3TQzIl/oHkZvUQGccFr97jVJrPUY26D
         q3w91gCjnRPXU+L7m1555z+KhGGU7yHsWr6y87g+49RELGUjapqca4l0/uVeaMWWpGOU
         Dtag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=sQYJaI8jg1FtyXfRAOTpTGsgFbeCT3+ddgfcyrzmU3I=;
        b=tBOdYX5UnaTSNH34tv3/Miymtq4JU1zBz5navaFbdYXk0Cphh6BYsa/gXjR9J/PKGI
         BtZKDC1bm1DGyO1k2qjJVWP0OacZeycPizNosr1VH4jmlPJnsf5sxrbVKRxjHotCkwBG
         3wD6AS4Nrl3v00TEs4z2VnCsD0EBi71ihaQxtBRRMg5vTfFv5kV/Aj38PTN2Myz5kryg
         Cqz0u2EdvrTvo4/h49YKW0QvPlg9J/hsl6vD9vhfM4GqemHKXlWWDerInhfi1I8PHPh0
         dgWWuSnRDzUStooQL4/kaKAXGl+8Bdlsr45t8wP+8gUKdYGZtMhVZY8FYt4y+bHWxV/Z
         xCVg==
X-Gm-Message-State: AOAM530NZERQTd0I7TNghyREG0RFpNS3wZJDWoPHpN/ShjI9VCrMnvor
        BAXoNAuOzjUKGbvms18msHxotJyUP/9zzqIBg9eKHy5qyornegPlsmdHDHbglyf2+Yp+vvb4soC
        NkDpu2QK8NBUVS/jB6DA5I99lFzqQOtnNlvuRGxq/aMml+Ez9iH/tmEYZaJaZndv4Ybpp
X-Google-Smtp-Source: ABdhPJwIMvfVZxeT22fRj0fRS7O09m8M3YhEG724D5gv9RALBKrOMA7Rt7jgQ8YvNSm+WUlWFCvGtU6Ffhw=
X-Received: by 2002:ad4:4868:: with SMTP id u8mr3672156qvy.34.1592330999437;
 Tue, 16 Jun 2020 11:09:59 -0700 (PDT)
Date:   Tue, 16 Jun 2020 20:09:54 +0200
Message-Id: <20200616180954.189430-1-darekm@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.290.gba653c62da-goog
Subject: [PATCH] media: cros-ec-cec: do not bail on device_init_wakeup failure
From:   Dariusz Marcinkiewicz <darekm@google.com>
To:     linux-media@vger.kernel.org, narmstrong@baylibre.com
Cc:     Dariusz Marcinkiewicz <darekm@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Do not fail probing when device_init_wakeup fails.

device_init_wakeup fails when the device is already enabled as wakeup
device. Hence, the driver fails to probe the device if:
- The device has already been enabled for wakeup (via e.g. sysfs)
- The driver has been unloaded and is being loaded again.

This goal of the patch is to fix the above cases.

Overwhelming majority of the drivers do not check device_init_wakeup
return value.

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
---
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 0e7e2772f08f..2d95e16cd248 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -277,11 +277,7 @@ static int cros_ec_cec_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, cros_ec_cec);
 	cros_ec_cec->cros_ec = cros_ec;
 
-	ret = device_init_wakeup(&pdev->dev, 1);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to initialize wakeup\n");
-		return ret;
-	}
+	device_init_wakeup(&pdev->dev, 1);
 
 	cros_ec_cec->adap = cec_allocate_adapter(&cros_ec_cec_ops, cros_ec_cec,
 						 DRV_NAME,
-- 
2.27.0.290.gba653c62da-goog

