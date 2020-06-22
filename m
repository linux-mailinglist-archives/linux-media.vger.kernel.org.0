Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6459D20347D
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2020 12:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727848AbgFVKFd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jun 2020 06:05:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727839AbgFVKFc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jun 2020 06:05:32 -0400
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3B9AC061795
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2020 03:05:30 -0700 (PDT)
Received: by mail-qv1-xf49.google.com with SMTP id t20so12198511qvy.16
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2020 03:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=sQYJaI8jg1FtyXfRAOTpTGsgFbeCT3+ddgfcyrzmU3I=;
        b=I0J1aiihsil5wiQkU7K7GOmQMprk6kzkAPOpm7BzCcZt690scULxje2gJ3fDfIgAxa
         MWc0es5FO8cmJuKtRnb2TB3vDqAjqnxi6o80+WZMCQwfILSRuk0o9p0IYdcd0jDqBD29
         x2ZCsGXW7CtNrz/YiRg8PNiO5kTUSRcZ5ELAHt1xsPVxqOPZmmw1wyyrn+MNtSlb/K2j
         wbPHq3KmTNF+Jg+U1RiElmcYTgKgL/RGpbhBwdg+yv6483AwR/lFXX4GllTKWZhT78P9
         GyivcgSvh1DyzmGEqSnBgX2gDyAJ+EN8QsfGLZCEup5tpgAR5gJl5wbSsm4SkTFQNdS/
         589A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=sQYJaI8jg1FtyXfRAOTpTGsgFbeCT3+ddgfcyrzmU3I=;
        b=RzrBfp4LO0b78YYVD5oOsV83OsqAf/epluCvVxd34w0nngHXjl3TMp8rfqCxpD+1/V
         EqGXYiABld2Q83tDaUxYSNVX0nN0Mc00bu7TlCRyLHWiRVgwzrOyJDEDTvgFJtZ9f4Ci
         X/BAAY0JCjnKrIxl0LnR8brcnYO1aRS1QocfeF0pc7oUH8aKDGhA+chRZC5PUeoIhyzg
         tRRTAoi6ElNMzyoHaFM9s8YVKMfk0mAiu2iT+SFIxqm66H1JDrDkaIrM2gv4GxWcTRec
         JhsuNuNlQp22oDzD3oJRDTA8x+OChvLXfHNBb3+SP2D5arDWKgYcDG7GURTx0Fp9QBr0
         egig==
X-Gm-Message-State: AOAM5312NEtg5NLgIgAqlKUBRl86DVgN/mGAET2QclWgHASLNi4D60Sn
        rbXMwNbdJfnxReRmZ3oInByl5QN7/W4z/U5tYPsoaB5pBE65ayo5DcsayclQUwhV3MU9jV+jB98
        J0k/gUyxIVbNcnkuvKlz1grvypL6pcW4+eQlHa5J5Nb3RikTNyzd/xvNghztkfZ7MLzVB
X-Google-Smtp-Source: ABdhPJxAEWerQnOAJjx0E0aofyvX8NhI7hAhGKb8LWZHdGGcfiJVHCpCSo39/WHBIA2aXaM2hsS1TasI6P4=
X-Received: by 2002:a0c:c249:: with SMTP id w9mr20533684qvh.149.1592820329627;
 Mon, 22 Jun 2020 03:05:29 -0700 (PDT)
Date:   Mon, 22 Jun 2020 12:05:18 +0200
Message-Id: <20200622100520.143622-1-darekm@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.111.gc72c7da667-goog
Subject: [PATCH RESEND] media: cros-ec-cec: do not bail on device_init_wakeup failure
From:   Dariusz Marcinkiewicz <darekm@google.com>
To:     linux-media@vger.kernel.org
Cc:     narmstrong@baylibre.com, Dariusz Marcinkiewicz <darekm@google.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Lee Jones <lee.jones@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Dariusz Marcinkiewicz <darekm@chromium.org>,
        linux-kernel@vger.kernel.org
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

