Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28B9F203618
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2020 13:47:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727945AbgFVLqx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jun 2020 07:46:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727838AbgFVLqw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jun 2020 07:46:52 -0400
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BE04C061795
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2020 04:46:52 -0700 (PDT)
Received: by mail-qk1-x749.google.com with SMTP id x22so12616146qkj.6
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2020 04:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=j19qINoTS0ZUB5VmYI6tnBHGsC7YwPPKrYVY46VAbqw=;
        b=TLI75zhb3hcV71NRaoY51FnnY5U5mwBw4h8IRj01n/GB6WFaLkNAhOJ8mnrRi3Kt3U
         D5/gxSxGrus9cNQo5m1Gcy6XqXBDCOw3JYI8VmnY7KeZnA7NkePDxNoyI09U/OSYdl2+
         hZ/u5zK+54x66LU6Nq3QU4GNpunW1AZfRo/MZdfk+il4B1WHnDB1+DQ7fPll1n+1XZ+L
         y6GDaAQ/h9xMJ4jkd550Ctde6Of3UWj0ud5H+4FdWvJ7l8GD/L64pmBh0KUAiTwOsVGu
         PIXKyL4z1yLzsRB7rNwGrL+OhEOFvq49zwARR2aWdduxZjBc784HqWV1e9Xm+McOFmSC
         UTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=j19qINoTS0ZUB5VmYI6tnBHGsC7YwPPKrYVY46VAbqw=;
        b=HTM+ewebdaLmZhcoJ2oyh74U3MqBmnyDPLIJfd30d746I16uVQ6YqO+tNJ0eN2h43Q
         fP7FW1rtrdb10zdLbfG6f0YUT5BAVVkwvsZyM/EpWUPanzm3Uen4zFh/sY8ne+TYFKrZ
         cEOpZubZ0zhQt/0YGw+WaXj5PM98+hJGHwmwrjTxS+6SMnPqUFtdbeBMODG7t5Z0RZ+m
         5DkI4WFK3x5GtI5rXb8R1hFgWRUqhPRR5Zx7hIF+kKi1LgiianIgvXB6UCriv+f+yzWL
         4gSbYJQmPzfgYUPITMNUaBctgE+alMPIYqowb7G0RsF21BXx1HD2lvGsu10BiegHgnFg
         JGVw==
X-Gm-Message-State: AOAM530Wjv3/PtGCcIZEWpgVFvZlH3xzr/CIuoN+ek8KqY9TjYNS1f9n
        Hg7iC1U8n+KEkr85HMybD6mGGS4StWewX2uWkxOgtcLMoDCC/99fMVOxOnnOf757q0F06SmjshB
        hCOJ/KZJpXr1Y6veIcnwlY1A64P/L6Sdy9WegmE4TVRjBj6krSgjFqwRH/oCvPwiiTqbx
X-Google-Smtp-Source: ABdhPJxtMErmxXcluP2xrN//Yw4g53tHUvtp06FFk3nIs69FZwkQ9eA3ZuOzcfzQAtTaVbdUTCxXPynvXwE=
X-Received: by 2002:a0c:8d46:: with SMTP id s6mr21215475qvb.241.1592826411606;
 Mon, 22 Jun 2020 04:46:51 -0700 (PDT)
Date:   Mon, 22 Jun 2020 13:46:36 +0200
Message-Id: <20200622114639.165874-1-darekm@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.111.gc72c7da667-goog
Subject: [PATCH v2] media: cros-ec-cec: do not bail on device_init_wakeup failure
From:   Dariusz Marcinkiewicz <darekm@google.com>
To:     linux-media@vger.kernel.org
Cc:     narmstrong@baylibre.com, Dariusz Marcinkiewicz <darekm@google.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
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
- The device has already been enabled for wakeup (by e.g. sysfs)
- The driver has been unloaded and is being loaded again.

This goal of the patch is to fix the above cases.

Overwhelming majority of the drivers do not check device_init_wakeup
return code.

v2: add Fixes tags

Fixes: cd70de2d356ee ("media: platform: Add ChromeOS EC CEC driver")
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
2.27.0.111.gc72c7da667-goog

